@interface LNEntityUpdatingTrait
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEntityUpdatingTrait)initWithCoder:(id)a3;
- (LNEntityUpdatingTrait)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (NSString)entityIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntityUpdatingTrait

- (void).cxx_destruct
{
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNEntityUpdatingTrait *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNEntityUpdatingTrait *)self entityIdentifier];
      v8 = [(LNEntityUpdatingTrait *)v6 entityIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(LNEntityUpdatingTrait *)self entityIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNEntityUpdatingTrait *)self entityIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, entity: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (LNEntityUpdatingTrait)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityIdentifier"];

  v6 = [(LNEntityUpdatingTrait *)self initWithEntityIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNEntityUpdatingTrait *)self entityIdentifier];
  [v4 encodeObject:v5 forKey:@"entityIdentifier"];
}

- (LNEntityUpdatingTrait)initWithEntityIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNEntityUpdatingTrait;
  id v5 = [(LNEntityUpdatingTrait *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entityIdentifier = v5->_entityIdentifier;
    v5->_entityIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end