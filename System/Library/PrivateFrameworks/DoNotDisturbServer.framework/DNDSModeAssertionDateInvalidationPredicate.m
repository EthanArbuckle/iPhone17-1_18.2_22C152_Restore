@interface DNDSModeAssertionDateInvalidationPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSModeAssertionDateInvalidationPredicate)initWithCoder:(id)a3;
- (DNDSModeAssertionDateInvalidationPredicate)initWithDate:(id)a3;
- (NSDate)date;
- (id)description;
- (unint64_t)hash;
- (unint64_t)predicateType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSModeAssertionDateInvalidationPredicate

- (DNDSModeAssertionDateInvalidationPredicate)initWithDate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionDateInvalidationPredicate;
  v5 = [(DNDSModeAssertionInvalidationPredicate *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeAssertionDateInvalidationPredicate *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
      v7 = [(DNDSModeAssertionDateInvalidationPredicate *)v5 date];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
        if (v8)
        {
          objc_super v9 = [(DNDSModeAssertionDateInvalidationPredicate *)v5 date];
          if (v9)
          {
            v10 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
            v11 = [(DNDSModeAssertionDateInvalidationPredicate *)v5 date];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; date: %@>", v4, self, v5];

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSModeAssertionDateInvalidationPredicate;
  if ([(DNDSModeAssertionInvalidationPredicate *)&v11 evaluateWithObject:v6 substitutionVariables:a4])
  {
    v7 = [v6 startDate];
    v8 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
    BOOL v9 = [v7 compare:v8] == -1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)predicateType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionDateInvalidationPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  id v6 = [(DNDSModeAssertionDateInvalidationPredicate *)self initWithDate:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSModeAssertionDateInvalidationPredicate *)self date];
  [v4 encodeObject:v5 forKey:@"date"];
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end