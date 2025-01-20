@interface DKComponentIdentity
+ (BOOL)supportsSecureCoding;
+ (id)componentIdentityWithDomain:(id)a3 version:(id)a4 resources:(id)a5;
+ (id)componentIdentityWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponentIdentity:(id)a3;
- (BOOL)isNewerThan:(id)a3;
- (DKCanonicalVersion)version;
- (DKComponentIdentity)initWithCoder:(id)a3;
- (DKComponentIdentity)initWithDomain:(id)a3 version:(id)a4 resources:(id)a5;
- (DKComponentIdentity)initWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6;
- (NSSet)resources;
- (NSString)domain;
- (NSString)identifier;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKComponentIdentity

+ (id)componentIdentityWithDomain:(id)a3 version:(id)a4 resources:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithDomain:v10 version:v9 resources:v8];

  return v11;
}

- (DKComponentIdentity)initWithDomain:(id)a3 version:(id)a4 resources:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DKComponentIdentity;
  v12 = [(DKComponentIdentity *)&v21 init];
  if (v12)
  {
    uint64_t v13 = +[DKCanonicalVersion canonicalVersionWithString:v10];
    version = v12->_version;
    v12->_version = (DKCanonicalVersion *)v13;

    objc_storeStrong((id *)&v12->_domain, a3);
    objc_storeStrong((id *)&v12->_resources, a5);
    v15 = [v9 componentsSeparatedByString:@"."];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];
    type = v12->_type;
    v12->_type = (NSString *)v16;

    if ((unint64_t)[v15 count] >= 2)
    {
      uint64_t v18 = [v15 objectAtIndexedSubscript:1];
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v18;
    }
  }

  return v12;
}

+ (id)componentIdentityWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithType:v13 identifier:v12 version:v11 resources:v10];

  return v14;
}

- (DKComponentIdentity)initWithType:(id)a3 identifier:(id)a4 version:(id)a5 resources:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DKComponentIdentity;
  v15 = [(DKComponentIdentity *)&v23 init];
  if (v15)
  {
    uint64_t v16 = +[DKCanonicalVersion canonicalVersionWithString:v13];
    version = v15->_version;
    v15->_version = (DKCanonicalVersion *)v16;

    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    objc_storeStrong((id *)&v15->_resources, a6);
    p_domain = (id *)&v15->_domain;
    objc_storeStrong((id *)&v15->_domain, a3);
    if (v12)
    {
      v19 = [*p_domain stringByAppendingString:@"."];
      uint64_t v20 = [v19 stringByAppendingString:v12];
      id v21 = *p_domain;
      id *p_domain = (id)v20;
    }
  }

  return v15;
}

- (BOOL)isNewerThan:(id)a3
{
  id v4 = a3;
  v5 = [(DKComponentIdentity *)self version];
  v6 = [v4 version];

  LOBYTE(v4) = [v5 isNewerThan:v6];
  return (char)v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; domain: %@, version: %@>",
    v5,
    self,
    self->_domain,
  v6 = self->_version);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKComponentIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DKComponentIdentity;
  v5 = [(DKComponentIdentity *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (DKCanonicalVersion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v12;

    id v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"resources"];
    resources = v5->_resources;
    v5->_resources = (NSSet *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DKComponentIdentity *)self version];
  [v4 encodeObject:v5 forKey:@"version"];

  uint64_t v6 = [(DKComponentIdentity *)self type];
  [v4 encodeObject:v6 forKey:@"type"];

  v7 = [(DKComponentIdentity *)self identifier];
  [v4 encodeObject:v7 forKey:@"identifier"];

  uint64_t v8 = [(DKComponentIdentity *)self domain];
  [v4 encodeObject:v8 forKey:@"domain"];

  id v9 = [(DKComponentIdentity *)self resources];
  [v4 encodeObject:v9 forKey:@"resources"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DKCanonicalVersion *)self->_version copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_type copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  id v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_domain copyWithZone:a3];
  id v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSSet *)self->_resources copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (unint64_t)hash
{
  v2 = [(DKComponentIdentity *)self domain];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToComponentIdentity:(id)a3
{
  id v4 = a3;
  v5 = [(DKComponentIdentity *)self domain];
  id v6 = [v4 domain];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DKComponentIdentity *)a3;
  BOOL v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(DKComponentIdentity *)self isEqualToComponentIdentity:v4];
  }

  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (DKCanonicalVersion)version
{
  return self->_version;
}

- (NSSet)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end