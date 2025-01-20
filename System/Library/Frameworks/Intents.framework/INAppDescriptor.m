@interface INAppDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstalled;
- (BOOL)requiresUserConfirmation;
- (INAppDescriptor)descriptorWithExtensionBundleIdentifier:(id)a3;
- (INAppDescriptor)descriptorWithRecord:(id)a3;
- (INAppDescriptor)initWithApplicationRecord:(id)a3;
- (INAppDescriptor)initWithBundleIdentifier:(id)a3;
- (INAppDescriptor)initWithCoder:(id)a3;
- (INAppDescriptor)initWithLocalizedName:(id)a3 bundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 counterpartIdentifiers:(id)a6 teamIdentifier:(id)a7 supportedIntents:(id)a8 bundleURL:(id)a9 documentTypes:(id)a10;
- (LSApplicationRecord)applicationRecord;
- (NSSet)counterpartIdentifiers;
- (NSSet)documentTypes;
- (NSSet)supportedIntents;
- (NSString)bundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)localizedName;
- (NSString)teamIdentifier;
- (NSURL)bundleURL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresUserConfirmation:(BOOL)a3;
@end

@implementation INAppDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_documentTypes, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (INAppDescriptor)initWithLocalizedName:(id)a3 bundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 counterpartIdentifiers:(id)a6 teamIdentifier:(id)a7 supportedIntents:(id)a8 bundleURL:(id)a9 documentTypes:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v41.receiver = self;
  v41.super_class = (Class)INAppDescriptor;
  v24 = [(INAppDescriptor *)&v41 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    localizedName = v24->_localizedName;
    v24->_localizedName = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    bundleIdentifier = v24->_bundleIdentifier;
    v24->_bundleIdentifier = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    extensionBundleIdentifier = v24->_extensionBundleIdentifier;
    v24->_extensionBundleIdentifier = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    counterpartIdentifiers = v24->_counterpartIdentifiers;
    v24->_counterpartIdentifiers = (NSSet *)v31;

    uint64_t v33 = [v20 copy];
    teamIdentifier = v24->_teamIdentifier;
    v24->_teamIdentifier = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    supportedIntents = v24->_supportedIntents;
    v24->_supportedIntents = (NSSet *)v35;

    objc_storeStrong((id *)&v24->_bundleURL, a9);
    uint64_t v37 = [v23 copy];
    documentTypes = v24->_documentTypes;
    v24->_documentTypes = (NSSet *)v37;

    v39 = v24;
  }

  return v24;
}

- (unint64_t)hash
{
  v3 = [(INAppDescriptor *)self localizedName];
  uint64_t v4 = [v3 hash];
  v5 = [(INAppDescriptor *)self bundleIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(INAppDescriptor *)self extensionBundleIdentifier];
  uint64_t v8 = [v7 hash];
  v9 = [(INAppDescriptor *)self counterpartIdentifiers];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(INAppDescriptor *)self teamIdentifier];
  uint64_t v12 = [v11 hash];
  v13 = [(INAppDescriptor *)self supportedIntents];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(INAppDescriptor *)self documentTypes];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INAppDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    if ([(INAppDescriptor *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v6 = v5;
        }
        else {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
      uint64_t v8 = v6;

      v9 = [(INAppDescriptor *)self localizedName];
      uint64_t v10 = [(INAppDescriptor *)v8 localizedName];
      id v11 = v9;
      id v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        uint64_t v14 = v12;
        id v15 = v11;
        if (!v11 || !v12) {
          goto LABEL_63;
        }
        int v16 = [v11 isEqualToString:v12];

        if (!v16)
        {
          LOBYTE(v7) = 0;
LABEL_64:

          goto LABEL_65;
        }
      }
      id v17 = [(INAppDescriptor *)self bundleIdentifier];
      id v18 = [(INAppDescriptor *)v8 bundleIdentifier];
      id v15 = v17;
      id v19 = v18;
      uint64_t v14 = v19;
      if (v15 == v19)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        id v20 = v19;
        id v21 = v15;
        if (!v15 || !v19) {
          goto LABEL_62;
        }
        int v22 = [v15 isEqualToString:v19];

        if (!v22)
        {
          LOBYTE(v7) = 0;
LABEL_63:

          goto LABEL_64;
        }
      }
      id v23 = [(INAppDescriptor *)self extensionBundleIdentifier];
      v24 = [(INAppDescriptor *)v8 extensionBundleIdentifier];
      id v21 = v23;
      id v25 = v24;
      id v20 = v25;
      id v56 = v21;
      if (v21 == v25)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        v26 = v25;
        if (!v21 || !v25) {
          goto LABEL_61;
        }
        int v7 = [v21 isEqualToString:v25];

        if (!v7) {
          goto LABEL_62;
        }
      }
      v55 = v20;
      uint64_t v27 = [(INAppDescriptor *)self counterpartIdentifiers];
      v28 = [(INAppDescriptor *)v8 counterpartIdentifiers];
      id v29 = v27;
      id v30 = v28;
      v53 = v30;
      id v54 = v29;
      if (v29 == v30)
      {
      }
      else
      {
        LOBYTE(v7) = 0;
        if (!v29)
        {
          uint64_t v31 = v30;
          id v20 = v55;
          goto LABEL_59;
        }
        uint64_t v31 = v30;
        id v20 = v55;
        if (!v30)
        {
LABEL_59:

          goto LABEL_60;
        }
        int v32 = [v29 isEqualToSet:v30];

        if (!v32)
        {
          LOBYTE(v7) = 0;
          id v20 = v55;
LABEL_60:
          v26 = v53;
          id v21 = v54;
LABEL_61:

          id v21 = v56;
LABEL_62:

          goto LABEL_63;
        }
      }
      uint64_t v33 = [(INAppDescriptor *)self teamIdentifier];
      v34 = [(INAppDescriptor *)v8 teamIdentifier];
      id v29 = v33;
      id v35 = v34;
      id v51 = v29;
      v52 = v35;
      if (v29 != v35)
      {
        LOBYTE(v7) = 0;
        if (v29)
        {
          v36 = v35;
          id v20 = v55;
          if (v35)
          {
            int v37 = [v29 isEqualToString:v35];

            if (!v37)
            {
              LOBYTE(v7) = 0;
              id v20 = v55;
              uint64_t v31 = v52;
              goto LABEL_59;
            }
LABEL_40:
            v38 = [(INAppDescriptor *)self supportedIntents];
            v39 = [(INAppDescriptor *)v8 supportedIntents];
            id v40 = v38;
            id v41 = v39;
            v49 = v41;
            id v50 = v40;
            if (v40 == v41)
            {
            }
            else
            {
              LOBYTE(v7) = 0;
              if (!v40)
              {
                v42 = v41;
                id v20 = v55;
                goto LABEL_56;
              }
              v42 = v41;
              id v20 = v55;
              if (!v41)
              {
LABEL_56:

                goto LABEL_57;
              }
              int v43 = [v40 isEqual:v41];

              if (!v43)
              {
                LOBYTE(v7) = 0;
                id v20 = v55;
LABEL_57:
                v36 = v49;
                id v29 = v50;
                goto LABEL_58;
              }
            }
            v44 = [(INAppDescriptor *)self documentTypes];
            v45 = [(INAppDescriptor *)v8 documentTypes];
            id v40 = v44;
            id v46 = v45;
            v47 = v46;
            if (v40 == v46)
            {
              LOBYTE(v7) = 1;
            }
            else
            {
              LOBYTE(v7) = 0;
              if (v40)
              {
                id v20 = v55;
                if (v46) {
                  LOBYTE(v7) = [v40 isEqualToSet:v46];
                }
                goto LABEL_54;
              }
            }
            id v20 = v55;
LABEL_54:

            v42 = v47;
            goto LABEL_56;
          }
        }
        else
        {
          v36 = v35;
          id v20 = v55;
        }
LABEL_58:

        id v29 = v51;
        uint64_t v31 = v52;
        goto LABEL_59;
      }

      goto LABEL_40;
    }
    LOBYTE(v7) = 0;
  }
LABEL_65:

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSSet)supportedIntents
{
  return self->_supportedIntents;
}

- (NSSet)documentTypes
{
  return self->_documentTypes;
}

- (NSSet)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setRequiresUserConfirmation:(BOOL)a3
{
  self->_requiresUserConfirmation = a3;
}

- (BOOL)requiresUserConfirmation
{
  return self->_requiresUserConfirmation;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(INAppDescriptor *)self localizedName];
  [v12 encodeObject:v4 forKey:@"localizedName"];

  v5 = [(INAppDescriptor *)self bundleIdentifier];
  [v12 encodeObject:v5 forKey:@"bundleIdentifier"];

  uint64_t v6 = [(INAppDescriptor *)self extensionBundleIdentifier];
  [v12 encodeObject:v6 forKey:@"extensionBundleIdentifier"];

  int v7 = [(INAppDescriptor *)self counterpartIdentifiers];
  [v12 encodeObject:v7 forKey:@"counterpartIdentifiers"];

  uint64_t v8 = [(INAppDescriptor *)self teamIdentifier];
  [v12 encodeObject:v8 forKey:@"teamIdentifier"];

  v9 = [(INAppDescriptor *)self supportedIntents];
  [v12 encodeObject:v9 forKey:@"supportedIntents"];

  uint64_t v10 = [(INAppDescriptor *)self bundleURL];
  [v12 encodeObject:v10 forKey:@"bundleURL"];

  id v11 = [(INAppDescriptor *)self documentTypes];
  [v12 encodeObject:v11 forKey:@"documentTypes"];

  objc_msgSend(v12, "encodeBool:forKey:", -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation"), @"requiresUserConfirmation");
}

- (INAppDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  int v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  int v22 = [v4 decodeObjectOfClasses:v7 forKey:@"counterpartIdentifiers"];

  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedIntents"];

  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"documentTypes"];

  int v16 = (void *)v11;
  id v17 = [(INAppDescriptor *)self initWithLocalizedName:v25 bundleIdentifier:v24 extensionBundleIdentifier:v23 counterpartIdentifiers:v22 teamIdentifier:v21 supportedIntents:v11 bundleURL:v20 documentTypes:v15];
  uint64_t v18 = [v4 decodeBoolForKey:@"requiresUserConfirmation"];

  [(INAppDescriptor *)v17 setRequiresUserConfirmation:v18];
  return v17;
}

- (BOOL)isInstalled
{
  v3 = [(INAppDescriptor *)self extensionBundleIdentifier];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223A0]);
    v5 = [(INAppDescriptor *)self extensionBundleIdentifier];
    uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5 error:0];

    if (v6) {
      return 1;
    }
  }
  uint64_t v8 = [(INAppDescriptor *)self applicationRecord];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 applicationState];
    char v7 = [v10 isInstalled];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (LSApplicationRecord)applicationRecord
{
  v3 = [(INAppDescriptor *)self bundleURL];

  if (!v3
    || (id v4 = objc_alloc(MEMORY[0x1E4F223C8]),
        [(INAppDescriptor *)self bundleURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (void *)[v4 initWithURL:v5 allowPlaceholder:0 error:0],
        v5,
        !v6))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v8 = [(INAppDescriptor *)self bundleIdentifier];
    uint64_t v6 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
  }

  return (LSApplicationRecord *)v6;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)INAppDescriptor;
  id v4 = [(INAppDescriptor *)&v15 description];
  v5 = [(INAppDescriptor *)self localizedName];
  uint64_t v6 = [(INAppDescriptor *)self bundleIdentifier];
  id v7 = [(INAppDescriptor *)self extensionBundleIdentifier];
  uint64_t v8 = [(INAppDescriptor *)self teamIdentifier];
  uint64_t v9 = [(INAppDescriptor *)self supportedIntents];
  uint64_t v10 = [(INAppDescriptor *)self counterpartIdentifiers];
  uint64_t v11 = [(INAppDescriptor *)self bundleURL];
  id v12 = [(INAppDescriptor *)self documentTypes];
  uint64_t v13 = [v3 stringWithFormat:@"%@: localizedName: %@, bundleId: %@, extensionBundleId: %@, teamId: %@, intents: %@, counterpartIds: %@, bundleURL: %@, documentTypes: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (INAppDescriptor)descriptorWithRecord:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = [v5 localizedName];
  id v7 = [v5 bundleIdentifier];
  uint64_t v8 = [(INAppDescriptor *)v4 extensionBundleIdentifier];
  uint64_t v9 = objc_msgSend(v5, "in_counterpartIdentifiers");
  uint64_t v10 = [v5 teamIdentifier];
  uint64_t v11 = objc_msgSend(v5, "in_supportedIntents");
  id v12 = [v5 URL];
  uint64_t v13 = objc_msgSend(v5, "in_documentTypes");

  uint64_t v14 = [(INAppDescriptor *)v4 initWithLocalizedName:v6 bundleIdentifier:v7 extensionBundleIdentifier:v8 counterpartIdentifiers:v9 teamIdentifier:v10 supportedIntents:v11 bundleURL:v12 documentTypes:v13];

  return v14;
}

- (INAppDescriptor)descriptorWithExtensionBundleIdentifier:(id)a3
{
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = [(INAppDescriptor *)v4 localizedName];
  id v7 = [(INAppDescriptor *)v4 bundleIdentifier];
  uint64_t v8 = [(INAppDescriptor *)v4 counterpartIdentifiers];
  uint64_t v9 = [(INAppDescriptor *)v4 teamIdentifier];
  uint64_t v10 = [(INAppDescriptor *)v4 supportedIntents];
  uint64_t v11 = [(INAppDescriptor *)v4 bundleURL];
  id v12 = [(INAppDescriptor *)v4 documentTypes];
  uint64_t v13 = [(INAppDescriptor *)v4 initWithLocalizedName:v6 bundleIdentifier:v7 extensionBundleIdentifier:v5 counterpartIdentifiers:v8 teamIdentifier:v9 supportedIntents:v10 bundleURL:v11 documentTypes:v12];

  return v13;
}

- (INAppDescriptor)initWithBundleIdentifier:(id)a3
{
  return [(INAppDescriptor *)self initWithLocalizedName:0 bundleIdentifier:a3 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0 documentTypes:0];
}

- (INAppDescriptor)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localizedName];
  uint64_t v6 = [v4 bundleIdentifier];
  id v7 = objc_msgSend(v4, "in_counterpartIdentifiers");
  uint64_t v8 = [v4 teamIdentifier];
  uint64_t v9 = objc_msgSend(v4, "in_supportedIntents");
  uint64_t v10 = [v4 URL];
  uint64_t v11 = objc_msgSend(v4, "in_documentTypes");

  id v12 = [(INAppDescriptor *)self initWithLocalizedName:v5 bundleIdentifier:v6 extensionBundleIdentifier:0 counterpartIdentifiers:v7 teamIdentifier:v8 supportedIntents:v9 bundleURL:v10 documentTypes:v11];
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end