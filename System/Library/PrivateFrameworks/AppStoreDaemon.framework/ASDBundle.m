@interface ASDBundle
+ (BOOL)supportsSecureCoding;
+ (id)bundleWithIdentifier:(id)a3;
- (ASDBundle)initWithCoder:(id)a3;
- (ASDBundle)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDBundle

+ (id)bundleWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

- (ASDBundle)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDBundle;
  v5 = [(ASDBundle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  return [(NSString *)self->_identifier description];
}

- (id)debugDescription
{
  return (id)[(NSString *)self->_identifier debugDescription];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];

  if (v5)
  {
    self = [(ASDBundle *)self initWithIdentifier:v5];
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end