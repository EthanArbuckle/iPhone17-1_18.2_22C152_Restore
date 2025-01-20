@interface LNBundleActionsMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNBundleActionsMetadata)initWithActions:(id)a3 systemProtocolDefaults:(id)a4;
- (LNBundleActionsMetadata)initWithCoder:(id)a3;
- (NSDictionary)actions;
- (NSDictionary)systemProtocolDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNBundleActionsMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemProtocolDefaults, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (NSDictionary)systemProtocolDefaults
{
  return self->_systemProtocolDefaults;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNBundleActionsMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNBundleActionsMetadata *)self actions];
    v8 = [(LNBundleActionsMetadata *)v6 actions];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToDictionary:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNBundleActionsMetadata *)self systemProtocolDefaults];
    v16 = [(LNBundleActionsMetadata *)v6 systemProtocolDefaults];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqualToDictionary:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNBundleActionsMetadata *)self actions];
  uint64_t v4 = [v3 hash];
  v5 = [(LNBundleActionsMetadata *)self systemProtocolDefaults];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNBundleActionsMetadata *)self actions];
  v7 = [(LNBundleActionsMetadata *)self systemProtocolDefaults];
  v8 = [v3 stringWithFormat:@"<%@: %p, actions: %@, systemProtocolDefaults: %@>", v5, self, v6, v7];

  return v8;
}

- (LNBundleActionsMetadata)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"actions"];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  id v14 = [v5 decodeObjectOfClasses:v13 forKey:@"systemProtocolDefaults"];

  v15 = 0;
  if (v9 && v14)
  {
    self = [(LNBundleActionsMetadata *)self initWithActions:v9 systemProtocolDefaults:v14];
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNBundleActionsMetadata *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];

  id v6 = [(LNBundleActionsMetadata *)self systemProtocolDefaults];
  [v4 encodeObject:v6 forKey:@"systemProtocolDefaults"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [LNBundleActionsMetadata alloc];
  id v5 = [(LNBundleActionsMetadata *)self actions];
  id v6 = [(LNBundleActionsMetadata *)self systemProtocolDefaults];
  uint64_t v7 = [(LNBundleActionsMetadata *)v4 initWithActions:v5 systemProtocolDefaults:v6];

  return v7;
}

- (LNBundleActionsMetadata)initWithActions:(id)a3 systemProtocolDefaults:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNBundleActionsMetadata.m", 22, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"LNBundleActionsMetadata.m", 23, @"Invalid parameter not satisfying: %@", @"systemProtocolDefaults" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNBundleActionsMetadata;
  uint64_t v11 = [(LNBundleActionsMetadata *)&v17 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actions, a3);
    objc_storeStrong((id *)&v12->_systemProtocolDefaults, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end