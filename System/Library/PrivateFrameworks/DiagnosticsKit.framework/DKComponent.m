@interface DKComponent
+ (BOOL)supportsSecureCoding;
+ (id)componentWithIdentity:(id)a3 attributes:(id)a4;
- (DKComponent)initWithCoder:(id)a3;
- (DKComponent)initWithIdentity:(id)a3 attributes:(id)a4;
- (DKComponentIdentity)identity;
- (NSDictionary)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryForJSON;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKComponent

+ (id)componentWithIdentity:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentity:v7 attributes:v6];

  return v8;
}

- (DKComponent)initWithIdentity:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKComponent;
  v9 = [(DKComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (id)dictionaryForJSON
{
  v3 = [(DKComponent *)self attributes];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(DKComponent *)self identity];
  id v6 = [v5 version];
  id v7 = [v6 string];
  [v4 setObject:v7 forKeyedSubscript:@"version"];

  id v8 = [(DKComponent *)self identity];
  v9 = [v8 type];
  [v4 setObject:v9 forKeyedSubscript:@"type"];

  v10 = [(DKComponent *)self identity];
  v11 = [v10 identifier];

  if (v11)
  {
    objc_super v12 = [(DKComponent *)self identity];
    v13 = [v12 identifier];
    [v4 setObject:v13 forKeyedSubscript:@"identifier"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKComponent;
  v5 = [(DKComponent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
    identity = v5->_identity;
    v5->_identity = (DKComponentIdentity *)v6;

    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DKComponent *)self identity];
  [v4 encodeObject:v5 forKey:@"identity"];

  id v6 = [(DKComponent *)self attributes];
  [v4 encodeObject:v6 forKey:@"attributes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DKComponentIdentity *)self->_identity copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDictionary *)self->_attributes copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; identity: %@>", v5, self, self->_identity];

  return v6;
}

- (DKComponentIdentity)identity
{
  return self->_identity;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end