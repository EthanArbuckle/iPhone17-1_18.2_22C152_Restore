@interface DNDSModeAssertionUUIDInvalidationPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSModeAssertionUUIDInvalidationPredicate)initWithCoder:(id)a3;
- (DNDSModeAssertionUUIDInvalidationPredicate)initWithUUIDs:(id)a3;
- (NSArray)UUIDs;
- (id)description;
- (unint64_t)hash;
- (unint64_t)predicateType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSModeAssertionUUIDInvalidationPredicate

- (DNDSModeAssertionUUIDInvalidationPredicate)initWithUUIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionUUIDInvalidationPredicate;
  v5 = [(DNDSModeAssertionInvalidationPredicate *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    UUIDs = v5->_UUIDs;
    v5->_UUIDs = (NSArray *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeAssertionUUIDInvalidationPredicate *)a3;
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
      uint64_t v6 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
      v7 = [(DNDSModeAssertionUUIDInvalidationPredicate *)v5 UUIDs];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
        if (v8)
        {
          objc_super v9 = [(DNDSModeAssertionUUIDInvalidationPredicate *)v5 UUIDs];
          if (v9)
          {
            v10 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
            v11 = [(DNDSModeAssertionUUIDInvalidationPredicate *)v5 UUIDs];
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
  v5 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; UUIDs: %@>", v4, self, v5];

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDSModeAssertionUUIDInvalidationPredicate;
  if ([(DNDSModeAssertionInvalidationPredicate *)&v12 evaluateWithObject:v6 substitutionVariables:a4])
  {
    id v7 = v6;
    v8 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
    objc_super v9 = [v7 UUID];

    char v10 = [v8 containsObject:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)predicateType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionUUIDInvalidationPredicate)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"UUIDs"];

  objc_super v9 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self initWithUUIDs:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSModeAssertionUUIDInvalidationPredicate *)self UUIDs];
  [v4 encodeObject:v5 forKey:@"UUIDs"];
}

- (NSArray)UUIDs
{
  return self->_UUIDs;
}

- (void).cxx_destruct
{
}

@end