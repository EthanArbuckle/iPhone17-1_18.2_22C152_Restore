@interface LNAppIntentConnectionPolicy
- (BOOL)isEqual:(id)a3;
- (BOOL)openAppWhenRun;
- (BOOL)reuseConnectionIfPossible;
- (LNActionMetadata)metadata;
- (LNAppIntentConnectionPolicy)initWithAppIntentMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6;
- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier;
- (NSString)appBundleIdentifier;
- (NSString)appIntentIdentifier;
- (NSString)appIntentMangledTypeName;
- (NSString)processInstanceIdentifier;
- (id)actionWithParameters:(id)a3;
- (id)connectionWithError:(id *)a3;
- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4;
- (id)description;
- (id)newConnectionForSpringBoardOnlyWithError:(id *)a3;
- (int64_t)bundleMetadataVersion;
- (unint64_t)hash;
@end

@implementation LNAppIntentConnectionPolicy

- (id)connectionWithError:(id *)a3
{
  return [(LNAppIntentConnectionPolicy *)self connectionWithUserIdentity:0 error:a3];
}

uint64_t __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(LNAppIntentConnectionPolicy *)self reuseConnectionIfPossible];
  v8 = +[LNConnectionManager sharedInstance];
  v9 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  v10 = [(LNAppIntentConnectionPolicy *)self appBundleIdentifier];
  v11 = [(LNAppIntentConnectionPolicy *)self processInstanceIdentifier];
  v12 = [(LNAppIntentConnectionPolicy *)self appIntentMangledTypeName];
  if (v7)
  {
    uint64_t v13 = [v8 connectionForEffectiveBundleIdentifier:v9 appBundleIdentifier:v10 processInstanceIdentifier:v11 mangledTypeName:v12 userIdentity:v6 error:a4];
  }
  else
  {
    uint64_t v13 = [v8 newConnectionForEffectiveBundleIdentifier:v9 appBundleIdentifier:v10 processInstanceIdentifier:v11 mangledTypeName:v12 userIdentity:v6 error:a4];
  }
  v14 = (void *)v13;

  return v14;
}

id __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 configuration];
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F726C0]);
  }
  v9 = v8;

  v10 = [*(id *)(a1 + 32) metadata];
  v11 = [v10 parameters];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke_2;
  v19[3] = &unk_1E5B38AC0;
  id v20 = v5;
  id v12 = v5;
  uint64_t v13 = objc_msgSend(v11, "if_firstObjectPassingTest:", v19);

  objc_msgSend(v9, "setSecure:", ((unint64_t)objc_msgSend(v13, "capabilities") >> 4) & 1);
  id v14 = objc_alloc(MEMORY[0x1E4F726B8]);
  v15 = [v3 identifier];
  v16 = [v3 value];
  v17 = (void *)[v14 initWithIdentifier:v15 value:v16 configuration:v9];

  return v17;
}

- (id)actionWithParameters:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F725C0];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [(LNAppIntentConnectionPolicy *)self metadata];
  id v8 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  v9 = [v8 bundleIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke;
  v13[3] = &unk_1E5B38AE8;
  v13[4] = self;
  v10 = objc_msgSend(v5, "if_map:", v13);

  v11 = (void *)[v6 initWithMetadata:v7 bundleIdentifier:v9 parameters:v10];
  return v11;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (NSString)appIntentMangledTypeName
{
  metadata = self->_metadata;
  id v3 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  v4 = [v3 bundleIdentifier];
  id v5 = [(LNActionMetadata *)metadata mangledTypeNameForBundleIdentifier:v4];

  return (NSString *)v5;
}

- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (LNAppIntentConnectionPolicy)initWithAppIntentMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5 processInstanceIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNAppIntentConnectionPolicy.m", 28, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"LNAppIntentConnectionPolicy.m", 29, @"Invalid parameter not satisfying: %@", @"effectiveBundleIdentifier" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)LNAppIntentConnectionPolicy;
  v16 = [(LNAppIntentConnectionPolicy *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_metadata, a3);
    uint64_t v18 = [v13 copy];
    effectiveBundleIdentifier = v17->_effectiveBundleIdentifier;
    v17->_effectiveBundleIdentifier = (LNEffectiveBundleIdentifier *)v18;

    uint64_t v20 = [v14 copy];
    appBundleIdentifier = v17->_appBundleIdentifier;
    v17->_appBundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    processInstanceIdentifier = v17->_processInstanceIdentifier;
    v17->_processInstanceIdentifier = (NSString *)v22;

    v24 = v17;
  }

  return v17;
}

- (BOOL)reuseConnectionIfPossible
{
  v2 = [(LNAppIntentConnectionPolicy *)self metadata];
  id v3 = [v2 systemProtocols];
  v4 = [MEMORY[0x1E4F72710] cameraCaptureProtocol];
  char v5 = [v3 containsObject:v4];

  return v5 ^ 1;
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAppIntentConnectionPolicy *)a3;
  char v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_45:

      goto LABEL_46;
    }
    BOOL v7 = [(LNAppIntentConnectionPolicy *)self appIntentIdentifier];
    id v8 = [(LNAppIntentConnectionPolicy *)v6 appIntentIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_43;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v16 = [(LNAppIntentConnectionPolicy *)self appIntentMangledTypeName];
    v17 = [(LNAppIntentConnectionPolicy *)v6 appIntentMangledTypeName];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_42;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21) {
        goto LABEL_19;
      }
    }
    BOOL v22 = [(LNAppIntentConnectionPolicy *)self openAppWhenRun];
    if (v22 != [(LNAppIntentConnectionPolicy *)v6 openAppWhenRun])
    {
LABEL_19:
      LOBYTE(v12) = 0;
LABEL_43:

      goto LABEL_44;
    }
    v23 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
    v24 = [(LNAppIntentConnectionPolicy *)v6 effectiveBundleIdentifier];
    id v20 = v23;
    id v25 = v24;
    v19 = v25;
    id v40 = v20;
    if (v20 == v25)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v26 = v25;
      if (!v20 || !v25) {
        goto LABEL_41;
      }
      int v12 = [v20 isEqual:v25];

      if (!v12) {
        goto LABEL_42;
      }
    }
    v27 = [(LNAppIntentConnectionPolicy *)self appBundleIdentifier];
    v37 = [(LNAppIntentConnectionPolicy *)v6 appBundleIdentifier];
    id v28 = v27;
    id v29 = v37;
    v38 = v29;
    id v39 = v28;
    if (v28 != v29)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v30 = v29;
        if (v29)
        {
          int v36 = [v28 isEqualToString:v29];

          if (!v36)
          {
            LOBYTE(v12) = 0;
LABEL_40:
            v26 = v38;
            id v20 = v39;
LABEL_41:

            id v20 = v40;
LABEL_42:

            goto LABEL_43;
          }
          goto LABEL_32;
        }
      }
      else
      {
        v30 = v29;
      }
LABEL_39:

      goto LABEL_40;
    }

LABEL_32:
    v31 = [(LNAppIntentConnectionPolicy *)self processInstanceIdentifier];
    v32 = [(LNAppIntentConnectionPolicy *)v6 processInstanceIdentifier];
    id v28 = v31;
    id v33 = v32;
    v34 = v33;
    if (v28 == v33)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v33) {
        LOBYTE(v12) = [v28 isEqualToString:v33];
      }
    }

    v30 = v34;
    goto LABEL_39;
  }
  LOBYTE(v12) = 1;
LABEL_46:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(LNAppIntentConnectionPolicy *)self appIntentIdentifier];
  uint64_t v4 = [v3 hash];
  char v5 = [(LNAppIntentConnectionPolicy *)self appIntentMangledTypeName];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(LNAppIntentConnectionPolicy *)self openAppWhenRun];
  id v8 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  uint64_t v9 = [v8 hash];
  id v10 = [(LNAppIntentConnectionPolicy *)self appBundleIdentifier];
  uint64_t v11 = v9 ^ [v10 hash];
  int v12 = [(LNAppIntentConnectionPolicy *)self processInstanceIdentifier];
  unint64_t v13 = v7 ^ v11 ^ [v12 hash];

  return v13;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNAppIntentConnectionPolicy *)self appIntentIdentifier];
  uint64_t v7 = [(LNAppIntentConnectionPolicy *)self appIntentMangledTypeName];
  if ([(LNAppIntentConnectionPolicy *)self openAppWhenRun]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  uint64_t v9 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  id v10 = [(LNAppIntentConnectionPolicy *)self appBundleIdentifier];
  uint64_t v11 = [(LNAppIntentConnectionPolicy *)self processInstanceIdentifier];
  int v12 = [v3 stringWithFormat:@"<%@: %p, appIntentIdentifier: %@, appIntentMangledTypeName: %@, openAppWhenRun: %@, effectiveBundleIdentifier: %@, appBundleIdentifier: %@, processInstanceIdentifier: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)openAppWhenRun
{
  return [(LNActionMetadata *)self->_metadata openAppWhenRun];
}

- (NSString)appIntentIdentifier
{
  return (NSString *)[(LNActionMetadata *)self->_metadata identifier];
}

- (int64_t)bundleMetadataVersion
{
  return [(LNActionMetadata *)self->_metadata bundleMetadataVersion];
}

- (id)newConnectionForSpringBoardOnlyWithError:(id *)a3
{
  char v5 = +[LNConnectionManager sharedInstance];
  uint64_t v6 = [(LNAppIntentConnectionPolicy *)self effectiveBundleIdentifier];
  uint64_t v7 = [(LNAppIntentConnectionPolicy *)self appBundleIdentifier];
  id v8 = [(LNAppIntentConnectionPolicy *)self processInstanceIdentifier];
  uint64_t v9 = [(LNAppIntentConnectionPolicy *)self appIntentMangledTypeName];
  id v10 = (void *)[v5 newConnectionForEffectiveBundleIdentifier:v6 appBundleIdentifier:v7 processInstanceIdentifier:v8 mangledTypeName:v9 userIdentity:0 error:a3];

  return v10;
}

@end