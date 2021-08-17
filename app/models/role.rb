class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |t|
            t.actor
        end
    end

    def locations
        self.auditions.map do |t|
            t.location
        end
    end

    def lead
        is_lead = self.auditions.find do |t|
            t.hired == true 
        end

        is_lead = [] ? "Nope" : is_lead
    end

    def understudy
        hi = self.auditions.filter do |t|
            t.hired == true 
        end
        hi == [] ? "Nope!" : hi[1]
    end
    
end

# Role#actors returns an array of names from the actors associated with this role

# Role#locations returns an array of locations from the auditions associated with this role

# Role#lead returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'

# Role#understudy returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'

