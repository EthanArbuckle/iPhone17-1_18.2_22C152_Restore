@interface IRBundle
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (IRBundle)init;
- (IRBundle)initWithCoder:(id)a3;
- (IRBundle)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRBundle

- (IRBundle)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRBundle;
  v6 = [(IRBundle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  identifier = self->_identifier;
  return (id)[v4 initWithIdentifier:identifier];
}

- (void)encodeWithCoder:(id)a3
{
}

- (IRBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRBundle;
  id v5 = [(IRBundle *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = self;

    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_super v9 = v5;
  }

  return v5;
}

- (IRBundle)init
{
}

+ (id)new
{
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", identifier: %@", self->_identifier];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IRBundle *)self identifier];
    uint64_t v7 = [v5 identifier];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = 1;
    }
    else
    {
      objc_super v9 = [(IRBundle *)self identifier];
      v10 = [v5 identifier];
      BOOL v8 = v9 == v10;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash] ^ 0x43;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end