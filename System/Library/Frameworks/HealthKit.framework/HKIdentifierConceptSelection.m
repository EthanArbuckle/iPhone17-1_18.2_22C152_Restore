@interface HKIdentifierConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConceptIdentifier)identifier;
- (HKIdentifierConceptSelection)init;
- (HKIdentifierConceptSelection)initWithCoder:(id)a3;
- (HKIdentifierConceptSelection)initWithIdentifier:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKIdentifierConceptSelection

- (HKIdentifierConceptSelection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKIdentifierConceptSelection)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKIdentifierConceptSelection;
  v5 = [(HKConceptSelection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (HKConceptIdentifier *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@>", objc_opt_class(), self->_identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKIdentifierConceptSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];

  if (v5)
  {
    self = [(HKIdentifierConceptSelection *)self initWithIdentifier:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKIdentifierConceptSelection;
  if ([(HKConceptSelection *)&v14 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(HKIdentifierConceptSelection *)self identifier];
    v7 = [v5 identifier];
    if (v6 == v7)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      v8 = [v5 identifier];
      if (v8)
      {
        objc_super v9 = [(HKIdentifierConceptSelection *)self identifier];
        v10 = [v5 identifier];
        int v11 = [v9 isEqual:v10] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 1;
      }
    }
    char v12 = v11 ^ 1;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end