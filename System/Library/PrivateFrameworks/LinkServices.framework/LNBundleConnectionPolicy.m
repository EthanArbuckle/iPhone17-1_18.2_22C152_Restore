@interface LNBundleConnectionPolicy
- (BOOL)isEqual:(id)a3;
- (LNBundleConnectionPolicy)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5;
- (NSString)appBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)processInstanceIdentifier;
- (id)connectionWithError:(id *)a3;
- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation LNBundleConnectionPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNBundleConnectionPolicy *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v7 = [(LNBundleConnectionPolicy *)self bundleIdentifier];
    v8 = [(LNBundleConnectionPolicy *)v6 bundleIdentifier];
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
        goto LABEL_25;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(LNBundleConnectionPolicy *)self appBundleIdentifier];
    v17 = [(LNBundleConnectionPolicy *)v6 appBundleIdentifier];
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
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqualToString:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(LNBundleConnectionPolicy *)self processInstanceIdentifier];
    v22 = [(LNBundleConnectionPolicy *)v6 processInstanceIdentifier];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqualToString:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNBundleConnectionPolicy *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNBundleConnectionPolicy *)self appBundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNBundleConnectionPolicy *)self processInstanceIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNBundleConnectionPolicy *)self bundleIdentifier];
  v7 = [(LNBundleConnectionPolicy *)self appBundleIdentifier];
  unint64_t v8 = [(LNBundleConnectionPolicy *)self processInstanceIdentifier];
  id v9 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, appBundleIdentifier: %@, processInstanceIdentifier: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F223F8];
  id v7 = a3;
  unint64_t v8 = [(LNBundleConnectionPolicy *)self bundleIdentifier];
  id v9 = [v6 bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:0];

  objc_opt_class();
  uint64_t v10 = objc_opt_isKindOfClass() & 1;
  id v11 = objc_alloc(MEMORY[0x1E4F72630]);
  int v12 = [(LNBundleConnectionPolicy *)self bundleIdentifier];
  v13 = [v9 URL];
  id v14 = (void *)[v11 initWithType:v10 bundleIdentifier:v12 url:v13];

  int v15 = +[LNConnectionManager sharedInstance];
  v16 = [(LNBundleConnectionPolicy *)self appBundleIdentifier];
  v17 = [(LNBundleConnectionPolicy *)self processInstanceIdentifier];
  id v18 = [v15 connectionForEffectiveBundleIdentifier:v14 appBundleIdentifier:v16 processInstanceIdentifier:v17 mangledTypeName:0 userIdentity:v7 error:a4];

  return v18;
}

- (id)connectionWithError:(id *)a3
{
  return [(LNBundleConnectionPolicy *)self connectionWithUserIdentity:0 error:a3];
}

- (LNBundleConnectionPolicy)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 processInstanceIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNBundleConnectionPolicy.m", 18, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNBundleConnectionPolicy;
  int v12 = [(LNBundleConnectionPolicy *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    appBundleIdentifier = v12->_appBundleIdentifier;
    v12->_appBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    processInstanceIdentifier = v12->_processInstanceIdentifier;
    v12->_processInstanceIdentifier = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

@end