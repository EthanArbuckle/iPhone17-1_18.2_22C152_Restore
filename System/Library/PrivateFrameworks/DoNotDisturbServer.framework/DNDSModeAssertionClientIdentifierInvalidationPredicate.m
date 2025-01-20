@interface DNDSModeAssertionClientIdentifierInvalidationPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithClientIdentifiers:(id)a3;
- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithCoder:(id)a3;
- (NSArray)clientIdentifiers;
- (id)description;
- (unint64_t)hash;
- (unint64_t)predicateType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSModeAssertionClientIdentifierInvalidationPredicate

- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithClientIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeAssertionClientIdentifierInvalidationPredicate;
  v5 = [(DNDSModeAssertionInvalidationPredicate *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifiers = v5->_clientIdentifiers;
    v5->_clientIdentifiers = (NSArray *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeAssertionClientIdentifierInvalidationPredicate *)a3;
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
      uint64_t v6 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
      v7 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)v5 clientIdentifiers];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
        if (v8)
        {
          objc_super v9 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)v5 clientIdentifiers];
          if (v9)
          {
            v10 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
            v11 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)v5 clientIdentifiers];
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
  v5 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; clientIdentifiers: %@>", v4, self, v5];

  return v6;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSModeAssertionClientIdentifierInvalidationPredicate;
  if ([(DNDSModeAssertionInvalidationPredicate *)&v13 evaluateWithObject:v6 substitutionVariables:a4])
  {
    id v7 = v6;
    v8 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
    objc_super v9 = [v7 source];

    v10 = [v9 clientIdentifier];
    char v11 = [v8 containsObject:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)predicateType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSModeAssertionClientIdentifierInvalidationPredicate)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"clientIdentifiers"];

  objc_super v9 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self initWithClientIdentifiers:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDSModeAssertionClientIdentifierInvalidationPredicate *)self clientIdentifiers];
  [v4 encodeObject:v5 forKey:@"clientIdentifiers"];
}

- (NSArray)clientIdentifiers
{
  return self->_clientIdentifiers;
}

- (void).cxx_destruct
{
}

@end