@interface LNRequiredCapabilityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeatureFlagCapability;
- (BOOL)isMobileGestaltCapability;
- (BOOL)value;
- (LNRequiredCapabilityMetadata)initWithCoder:(id)a3;
- (LNRequiredCapabilityMetadata)initWithDomain:(id)a3 key:(id)a4 value:(BOOL)a5;
- (NSString)domain;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNRequiredCapabilityMetadata

- (LNRequiredCapabilityMetadata)initWithDomain:(id)a3 key:(id)a4 value:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNRequiredCapabilityMetadata.m", 17, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNRequiredCapabilityMetadata.m", 18, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNRequiredCapabilityMetadata;
  v12 = [(LNRequiredCapabilityMetadata *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    domain = v12->_domain;
    v12->_domain = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    key = v12->_key;
    v12->_key = (NSString *)v15;

    v12->_value = a5;
    v17 = v12;
  }

  return v12;
}

- (BOOL)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (BOOL)isFeatureFlagCapability
{
  v2 = [(LNRequiredCapabilityMetadata *)self domain];
  char v3 = [v2 isEqualToString:@"FeatureFlag"];

  return v3;
}

- (BOOL)isMobileGestaltCapability
{
  v2 = [(LNRequiredCapabilityMetadata *)self domain];
  char v3 = [v2 isEqualToString:@"MobileGestalt"];

  return v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNRequiredCapabilityMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v7 = [(LNRequiredCapabilityMetadata *)self domain];
    v8 = [(LNRequiredCapabilityMetadata *)v6 domain];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_20;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v16 = [(LNRequiredCapabilityMetadata *)self key];
    v17 = [(LNRequiredCapabilityMetadata *)v6 key];
    id v14 = v16;
    id v18 = v17;
    uint64_t v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      if (!v14 || !v18)
      {

        LOBYTE(v12) = 0;
        goto LABEL_20;
      }
      int v12 = [v14 isEqualToString:v18];

      if (!v12) {
        goto LABEL_20;
      }
    }
    BOOL v19 = [(LNRequiredCapabilityMetadata *)self value];
    int v12 = v19 ^ [(LNRequiredCapabilityMetadata *)v6 value] ^ 1;
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  char v3 = [(LNRequiredCapabilityMetadata *)self domain];
  uint64_t v4 = [v3 hash];
  v5 = [(LNRequiredCapabilityMetadata *)self key];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(LNRequiredCapabilityMetadata *)self value];

  return v7;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNRequiredCapabilityMetadata *)self domain];
  unint64_t v7 = [(LNRequiredCapabilityMetadata *)self key];
  v8 = [v3 stringWithFormat:@"<%@: %p, domain: %@, key: %@, value: %i>", v5, self, v6, v7, -[LNRequiredCapabilityMetadata value](self, "value")];

  return v8;
}

- (LNRequiredCapabilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  uint64_t v7 = [v4 decodeBoolForKey:@"value"];

  v8 = [(LNRequiredCapabilityMetadata *)self initWithDomain:v5 key:v6 value:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(LNRequiredCapabilityMetadata *)self domain];
  [v6 encodeObject:v4 forKey:@"domain"];

  v5 = [(LNRequiredCapabilityMetadata *)self key];
  [v6 encodeObject:v5 forKey:@"key"];

  objc_msgSend(v6, "encodeBool:forKey:", -[LNRequiredCapabilityMetadata value](self, "value"), @"value");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(LNRequiredCapabilityMetadata *)self domain];
  id v6 = [(LNRequiredCapabilityMetadata *)self key];
  uint64_t v7 = objc_msgSend(v4, "initWithDomain:key:value:", v5, v6, -[LNRequiredCapabilityMetadata value](self, "value"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end