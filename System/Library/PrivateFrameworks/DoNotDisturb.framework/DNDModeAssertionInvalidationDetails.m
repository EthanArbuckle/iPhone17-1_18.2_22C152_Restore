@interface DNDModeAssertionInvalidationDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertionInvalidationDetails)init;
- (DNDModeAssertionInvalidationDetails)initWithCoder:(id)a3;
- (NSString)identifier;
- (id)_initWithDetails:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionInvalidationDetails

- (DNDModeAssertionInvalidationDetails)init
{
  return (DNDModeAssertionInvalidationDetails *)[(DNDModeAssertionInvalidationDetails *)self _initWithDetails:0];
}

- (id)_initWithDetails:(id)a3
{
  v4 = [a3 identifier];
  id v5 = [(DNDModeAssertionInvalidationDetails *)self _initWithIdentifier:v4];

  return v5;
}

- (id)_initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DNDModeAssertionInvalidationDetails;
  id v5 = [(DNDModeAssertionInvalidationDetails *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1EEDCFB98;
    }
    objc_storeStrong((id *)&v5->_identifier, v8);
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(DNDModeAssertionInvalidationDetails *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDModeAssertionInvalidationDetails *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(DNDModeAssertionInvalidationDetails *)self identifier];
      v7 = [(DNDModeAssertionInvalidationDetails *)v5 identifier];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDModeAssertionInvalidationDetails *)self identifier];
        if (v8)
        {
          v9 = [(DNDModeAssertionInvalidationDetails *)v5 identifier];
          if (v9)
          {
            objc_super v10 = [(DNDModeAssertionInvalidationDetails *)self identifier];
            v11 = [(DNDModeAssertionInvalidationDetails *)v5 identifier];
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
  id v5 = [(DNDModeAssertionInvalidationDetails *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; identifier: '%@'>", v4, self, v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableModeAssertionInvalidationDetails alloc];
  return [(DNDModeAssertionInvalidationDetails *)v4 _initWithDetails:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionInvalidationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  uint64_t v6 = [(DNDModeAssertionInvalidationDetails *)self _initWithIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DNDModeAssertionInvalidationDetails *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end