@interface LNEntityQueryConnectionPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier;
- (LNEntityQueryConnectionPolicy)initWithCoder:(id)a3;
- (LNEntityQueryConnectionPolicy)initWithEntityQueryIdentifier:(id)a3 entityQueryMangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 appBundleIdentifier:(id)a6 processInstanceIdentifier:(id)a7;
- (NSString)appBundleIdentifier;
- (NSString)entityQueryIdentifier;
- (NSString)entityQueryMangledTypeName;
- (NSString)processInstanceIdentifier;
- (id)connectionWithError:(id *)a3;
- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntityQueryConnectionPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_entityQueryMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityQueryIdentifier, 0);
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (NSString)entityQueryMangledTypeName
{
  return self->_entityQueryMangledTypeName;
}

- (NSString)entityQueryIdentifier
{
  return self->_entityQueryIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNEntityQueryConnectionPolicy *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_44:

      goto LABEL_45;
    }
    v7 = [(LNEntityQueryConnectionPolicy *)self entityQueryIdentifier];
    v8 = [(LNEntityQueryConnectionPolicy *)v6 entityQueryIdentifier];
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
      if (!v9 || !v10) {
        goto LABEL_42;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v16 = [(LNEntityQueryConnectionPolicy *)self entityQueryMangledTypeName];
    v17 = [(LNEntityQueryConnectionPolicy *)v6 entityQueryMangledTypeName];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_41;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    v22 = [(LNEntityQueryConnectionPolicy *)self effectiveBundleIdentifier];
    v23 = [(LNEntityQueryConnectionPolicy *)v6 effectiveBundleIdentifier];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v40 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_40;
      }
      int v12 = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_41;
      }
    }
    v26 = [(LNEntityQueryConnectionPolicy *)self appBundleIdentifier];
    v27 = [(LNEntityQueryConnectionPolicy *)v6 appBundleIdentifier];
    id v28 = v26;
    id v29 = v27;
    v38 = v29;
    id v39 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v37;
        goto LABEL_38;
      }
      v30 = v29;
      v19 = v37;
      if (!v29)
      {
LABEL_38:

        goto LABEL_39;
      }
      int v31 = [v28 isEqualToString:v29];

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v37;
LABEL_39:
        v25 = v38;
        id v20 = v39;
LABEL_40:

        id v20 = v40;
LABEL_41:

        goto LABEL_42;
      }
    }
    v32 = [(LNEntityQueryConnectionPolicy *)self processInstanceIdentifier];
    v33 = [(LNEntityQueryConnectionPolicy *)v6 processInstanceIdentifier];
    id v28 = v32;
    id v34 = v33;
    v35 = v34;
    if (v28 == v34)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v19 = v37;
        if (v34) {
          LOBYTE(v12) = [v28 isEqualToString:v34];
        }
        goto LABEL_36;
      }
    }
    v19 = v37;
LABEL_36:

    v30 = v35;
    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNEntityQueryConnectionPolicy *)self entityQueryIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNEntityQueryConnectionPolicy *)self entityQueryMangledTypeName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNEntityQueryConnectionPolicy *)self effectiveBundleIdentifier];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNEntityQueryConnectionPolicy *)self appBundleIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(LNEntityQueryConnectionPolicy *)self processInstanceIdentifier];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNEntityQueryConnectionPolicy *)self entityQueryIdentifier];
  v7 = [(LNEntityQueryConnectionPolicy *)self entityQueryMangledTypeName];
  uint64_t v8 = [(LNEntityQueryConnectionPolicy *)self effectiveBundleIdentifier];
  id v9 = [(LNEntityQueryConnectionPolicy *)self appBundleIdentifier];
  uint64_t v10 = [(LNEntityQueryConnectionPolicy *)self processInstanceIdentifier];
  v11 = [v3 stringWithFormat:@"<%@: %p, entityQueryIdentifier: %@, entityQueryMangledTypeName: %@, effectiveBundleIdentifier: %@, appBundleIdentifier: %@, processInstanceIdentifier: %@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEntityQueryConnectionPolicy *)self entityQueryIdentifier];
  [v4 encodeObject:v5 forKey:@"entityQueryIdentifier"];

  uint64_t v6 = [(LNEntityQueryConnectionPolicy *)self entityQueryMangledTypeName];
  [v4 encodeObject:v6 forKey:@"entityQueryMangledTypeName"];

  v7 = [(LNEntityQueryConnectionPolicy *)self effectiveBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"effectiveBundleIdentifier"];

  uint64_t v8 = [(LNEntityQueryConnectionPolicy *)self appBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"appBundleIdentifier"];

  id v9 = [(LNEntityQueryConnectionPolicy *)self processInstanceIdentifier];
  [v4 encodeObject:v9 forKey:@"processInstanceIdentifier"];
}

- (LNEntityQueryConnectionPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityQueryIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityQueryMangledTypeName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveBundleIdentifier"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processInstanceIdentifier"];

  uint64_t v10 = 0;
  if (v5 && v6 && v7)
  {
    self = [(LNEntityQueryConnectionPolicy *)self initWithEntityQueryIdentifier:v5 entityQueryMangledTypeName:v6 effectiveBundleIdentifier:v7 appBundleIdentifier:v8 processInstanceIdentifier:v9];
    uint64_t v10 = self;
  }

  return v10;
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[LNConnectionManager sharedInstance];
  uint64_t v8 = [(LNEntityQueryConnectionPolicy *)self effectiveBundleIdentifier];
  id v9 = [(LNEntityQueryConnectionPolicy *)self appBundleIdentifier];
  uint64_t v10 = [(LNEntityQueryConnectionPolicy *)self processInstanceIdentifier];
  v11 = [(LNEntityQueryConnectionPolicy *)self entityQueryMangledTypeName];
  unint64_t v12 = [v7 connectionForEffectiveBundleIdentifier:v8 appBundleIdentifier:v9 processInstanceIdentifier:v10 mangledTypeName:v11 userIdentity:v6 error:a4];

  return v12;
}

- (id)connectionWithError:(id *)a3
{
  return [(LNEntityQueryConnectionPolicy *)self connectionWithUserIdentity:0 error:a3];
}

- (LNEntityQueryConnectionPolicy)initWithEntityQueryIdentifier:(id)a3 entityQueryMangledTypeName:(id)a4 effectiveBundleIdentifier:(id)a5 appBundleIdentifier:(id)a6 processInstanceIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"LNEntityQueryConnectionPolicy.m", 24, @"Invalid parameter not satisfying: %@", @"entityQueryMangledTypeName" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  int v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"LNEntityQueryConnectionPolicy.m", 23, @"Invalid parameter not satisfying: %@", @"entityQueryIdentifier" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"LNEntityQueryConnectionPolicy.m", 25, @"Invalid parameter not satisfying: %@", @"effectiveBundleIdentifier" object file lineNumber description];

LABEL_4:
  v34.receiver = self;
  v34.super_class = (Class)LNEntityQueryConnectionPolicy;
  id v18 = [(LNEntityQueryConnectionPolicy *)&v34 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    entityQueryIdentifier = v18->_entityQueryIdentifier;
    v18->_entityQueryIdentifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    entityQueryMangledTypeName = v18->_entityQueryMangledTypeName;
    v18->_entityQueryMangledTypeName = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    effectiveBundleIdentifier = v18->_effectiveBundleIdentifier;
    v18->_effectiveBundleIdentifier = (LNEffectiveBundleIdentifier *)v23;

    uint64_t v25 = [v16 copy];
    appBundleIdentifier = v18->_appBundleIdentifier;
    v18->_appBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    processInstanceIdentifier = v18->_processInstanceIdentifier;
    v18->_processInstanceIdentifier = (NSString *)v27;

    id v29 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end