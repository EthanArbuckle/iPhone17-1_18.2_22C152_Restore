@interface BAGResourceOptions
+ (BOOL)supportsSecureCoding;
- (BAGResourceOptions)initWithBundleID:(id)a3 name:(id)a4 type:(unint64_t)a5 additionalOptions:(id)a6;
- (BAGResourceOptions)initWithCoder:(id)a3;
- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4;
- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4 additionalOptions:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)additionalOptions;
- (NSString)bundleID;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalOptions:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation BAGResourceOptions

- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4
{
  return [(BAGResourceOptions *)self initWithName:a3 type:a4 additionalOptions:0];
}

- (BAGResourceOptions)initWithName:(id)a3 type:(unint64_t)a4 additionalOptions:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = CUTGetMainBundleIdentifier();
  v11 = [(BAGResourceOptions *)self initWithBundleID:v10 name:v9 type:a4 additionalOptions:v8];

  return v11;
}

- (BAGResourceOptions)initWithBundleID:(id)a3 name:(id)a4 type:(unint64_t)a5 additionalOptions:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BAGResourceOptions.m", 33, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"BAGResourceOptions.m", 34, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  if (!BAGIsValidResourceType(a5))
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BAGResourceOptions.m", 35, @"Invalid parameter not satisfying: %@", @"BAGIsValidResourceType(type)" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)BAGResourceOptions;
  v15 = [(BAGResourceOptions *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    v16->_type = a5;
    objc_storeStrong((id *)&v16->_additionalOptions, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGResourceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  uint64_t v8 = [v7 integerValue];

  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"additionalOptions"];

  id v13 = [(BAGResourceOptions *)self initWithBundleID:v5 name:v6 type:v8 additionalOptions:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BAGResourceOptions *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  v6 = [(BAGResourceOptions *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BAGResourceOptions type](self, "type"), @"type");
  id v7 = [(BAGResourceOptions *)self additionalOptions];
  [v4 encodeObject:v7 forKey:@"additionalOptions"];
}

- (unint64_t)hash
{
  v3 = [(BAGResourceOptions *)self bundleID];
  uint64_t v4 = [v3 hash];
  v5 = [(BAGResourceOptions *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(BAGResourceOptions *)self type];
  uint64_t v8 = [(BAGResourceOptions *)self additionalOptions];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v5 = v4;
  uint64_t v6 = [(BAGResourceOptions *)self bundleID];
  unint64_t v7 = [v5 bundleID];
  int v8 = [v6 isEqualToString:v7];

  unint64_t v9 = [(BAGResourceOptions *)self name];
  uint64_t v10 = [v5 name];
  int v11 = [v9 isEqualToString:v10];

  id v12 = [(BAGResourceOptions *)self additionalOptions];
  if (!v12)
  {
    uint64_t v10 = [v5 additionalOptions];
    if (!v10)
    {
      char v15 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v13 = [(BAGResourceOptions *)self additionalOptions];
  id v14 = [v5 additionalOptions];
  char v15 = [v13 isEqualToDictionary:v14];

  if (!v12) {
    goto LABEL_9;
  }
LABEL_10:

  unint64_t v17 = [(BAGResourceOptions *)self type];
  uint64_t v18 = [v5 type];
  if ((v8 & v11) == 1)
  {
    if (v17 == v18) {
      BOOL v16 = v15;
    }
    else {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_16:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(BAGResourceOptions *)self bundleID];
  uint64_t v6 = [(BAGResourceOptions *)self name];
  unint64_t v7 = [(BAGResourceOptions *)self type];
  int v8 = [(BAGResourceOptions *)self additionalOptions];
  unint64_t v9 = (void *)[v4 initWithBundleID:v5 name:v6 type:v7 additionalOptions:v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BAGResourceOptions *)self bundleID];
  uint64_t v6 = [(BAGResourceOptions *)self name];
  unint64_t v7 = BAGResourceTypeToString([(BAGResourceOptions *)self type]);
  int v8 = [(BAGResourceOptions *)self additionalOptions];
  unint64_t v9 = [v3 stringWithFormat:@"<%@ : %p bundleID: %@, name: %@, type: %@ additionalOptions: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end