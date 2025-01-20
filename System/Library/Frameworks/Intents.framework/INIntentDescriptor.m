@interface INIntentDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)canRunOnLocalDevice;
- (BOOL)hasCustomUIExtension;
- (BOOL)isEqual:(id)a3;
- (INIntentDescriptor)descriptorWithAppDescriptor:(id)a3;
- (INIntentDescriptor)descriptorWithPreferredCallProvider:(int64_t)a3;
- (INIntentDescriptor)initWithCoder:(id)a3;
- (INIntentDescriptor)initWithIntent:(id)a3;
- (INIntentDescriptor)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4;
- (INIntentDescriptor)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4;
- (INIntentDescriptor)initWithIntentClassName:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 displayableBundleIdentifier:(id)a6 extensionBundleIdentifier:(id)a7 uiExtensionBundleIdentifier:(id)a8 counterpartIdentifiers:(id)a9 teamIdentifier:(id)a10 preferredCallProvider:(int64_t)a11 supportedIntents:(id)a12 bundleURL:(id)a13 documentTypes:(id)a14;
- (INIntentDescriptor)initWithIntentTypeName:(id)a3;
- (LSApplicationRecord)displayableApplicationRecord;
- (LSApplicationRecord)launchableApplicationRecord;
- (NSString)displayableBundleIdentifier;
- (NSString)intentClassName;
- (NSString)uiExtensionBundleIdentifier;
- (id)_extensionsWithError:(id *)a3;
- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4;
- (id)_uiExtensionsWithError:(id *)a3;
- (id)appDescriptor;
- (id)description;
- (id)displayableAppDescriptor;
- (id)mergeWithDescriptor:(id)a3;
- (int64_t)preferredCallProvider;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INIntentDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayableBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_uiExtensions, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)uiExtensionBundleIdentifier
{
  return self->_uiExtensionBundleIdentifier;
}

- (NSString)displayableBundleIdentifier
{
  return self->_displayableBundleIdentifier;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INIntentDescriptor;
  id v4 = a3;
  [(INAppDescriptor *)&v8 encodeWithCoder:v4];
  v5 = [(INIntentDescriptor *)self intentClassName];
  [v4 encodeObject:v5 forKey:@"intentClassName"];

  v6 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"displayableBundleIdentifier"];

  v7 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"uiExtensionBundleIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider"), @"preferredCallProvider");
}

- (INIntentDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INIntentDescriptor;
  v5 = [(INAppDescriptor *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentClassName"];
    intentClassName = v5->_intentClassName;
    v5->_intentClassName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayableBundleIdentifier"];
    displayableBundleIdentifier = v5->_displayableBundleIdentifier;
    v5->_displayableBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uiExtensionBundleIdentifier"];
    uiExtensionBundleIdentifier = v5->_uiExtensionBundleIdentifier;
    v5->_uiExtensionBundleIdentifier = (NSString *)v10;

    v5->_preferredCallProvider = [v4 decodeIntegerForKey:@"preferredCallProvider"];
    v12 = v5;
  }

  return v5;
}

- (id)_uiExtensionsWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uiExtensions = self->_uiExtensions;
  if (uiExtensions) {
    goto LABEL_8;
  }
  uint64_t v6 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:a3];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      v17[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      uint64_t v10 = self->_uiExtensions;
      self->_uiExtensions = v9;

LABEL_7:
      uiExtensions = self->_uiExtensions;
LABEL_8:
      v15 = uiExtensions;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [(INIntentDescriptor *)self _matchingAttributesForExtensionPoint:@"com.apple.intents-ui-service" error:a3];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v11 error:a3];
      objc_super v14 = self->_uiExtensions;
      self->_uiExtensions = v13;

      goto LABEL_7;
    }
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (id)_extensionsWithError:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  extensions = self->_extensions;
  if (extensions) {
    goto LABEL_10;
  }
  uint64_t v6 = [(INAppDescriptor *)self extensionBundleIdentifier];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v6 error:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = [v7 attributes];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"IntentsSupported"];
      uint64_t v11 = [(INIntentDescriptor *)self intentClassName];
      if (!v11
        || (v12 = (void *)v11,
            [(INIntentDescriptor *)self intentClassName],
            v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v10 containsObject:v13],
            v13,
            v12,
            v14))
      {
        v23[0] = v8;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
        v16 = self->_extensions;
        self->_extensions = v15;

LABEL_9:
        extensions = self->_extensions;
LABEL_10:
        v21 = extensions;
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v17 = [(INIntentDescriptor *)self _matchingAttributesForExtensionPoint:@"com.apple.intents-service" error:a3];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v17 error:a3];
      v20 = self->_extensions;
      self->_extensions = v19;

      goto LABEL_9;
    }
  }

  v21 = 0;
LABEL_11:

  return v21;
}

- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F282B0]];

  uint64_t v8 = [(INIntentDescriptor *)self intentClassName];
  v9 = (void *)v8;
  if (v8)
  {
    v22[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v7 setObject:v10 forKeyedSubscript:@"IntentsSupported"];
  }
  uint64_t v11 = [(INAppDescriptor *)self bundleURL];
  uint64_t v12 = [(INAppDescriptor *)self bundleIdentifier];
  v13 = (void *)v12;
  if (!v11 && v12)
  {
    int v14 = [(INIntentDescriptor *)self launchableApplicationRecord];
    uint64_t v11 = [v14 URL];
  }
  if (v11 || !v13)
  {
    if (v11)
    {
      v18 = [v11 path];
      [v7 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F914B0]];
    }
    a4 = v7;
  }
  else if (a4)
  {
    v15 = [NSString stringWithFormat:@"Cannot match extensions for \"%@\" because it does not have a bundle URL", v13, 0];
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    v21 = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a4 = [v16 errorWithDomain:@"IntentsErrorDomain" code:2005 userInfo:v17];

    a4 = 0;
  }

  return a4;
}

- (BOOL)canRunOnLocalDevice
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(INAppDescriptor *)self bundleIdentifier];
  v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  id v6 = [v5 applicationState];
  int v7 = [v6 isInstalled];

  if (v7
    && (objc_msgSend(v5, "in_supportedIntents"),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(INIntentDescriptor *)self intentClassName],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 containsObject:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    id v17 = 0;
    uint64_t v12 = [(INIntentDescriptor *)self _extensionsWithError:&v17];
    id v13 = v17;
    uint64_t v14 = [v12 count];
    BOOL v11 = v14 != 0;
    if (!v14)
    {
      if (v13)
      {
        v15 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "-[INIntentDescriptor canRunOnLocalDevice]";
          __int16 v20 = 2114;
          v21 = self;
          __int16 v22 = 2114;
          id v23 = v13;
          _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Failed to match extensions for execution info %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
  }
  return v11;
}

- (BOOL)hasCustomUIExtension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v3 = [(INIntentDescriptor *)self _uiExtensionsWithError:&v8];
  id v4 = v8;
  uint64_t v5 = [v3 count];
  if (!v5 && !v3)
  {
    id v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      char v10 = "-[INIntentDescriptor hasCustomUIExtension]";
      __int16 v11 = 2114;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s Failed to match UI extensions for execution info %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v5 != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INIntentDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if ([(INIntentDescriptor *)v4 isMemberOfClass:objc_opt_class()])
    {
      v28.receiver = self;
      v28.super_class = (Class)INIntentDescriptor;
      unsigned int v5 = [(INAppDescriptor *)&v28 isEqual:v4];
      id v6 = v4;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v7 = v6;
        }
        else {
          int v7 = 0;
        }
      }
      else
      {
        int v7 = 0;
      }
      v9 = v7;

      if (!v5)
      {
        LOBYTE(v8) = 0;
LABEL_35:

        goto LABEL_36;
      }
      char v10 = [(INIntentDescriptor *)self intentClassName];
      __int16 v11 = [(INIntentDescriptor *)v9 intentClassName];
      id v12 = v10;
      id v13 = v11;
      id v14 = v13;
      if (v12 == v13)
      {
      }
      else
      {
        LOBYTE(v8) = 0;
        uint64_t v15 = v13;
        id v16 = v12;
        if (!v12 || !v13) {
          goto LABEL_33;
        }
        int v17 = [v12 isEqualToString:v13];

        if (!v17)
        {
          LOBYTE(v8) = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      v18 = [(INIntentDescriptor *)self displayableBundleIdentifier];
      v19 = [(INIntentDescriptor *)v9 displayableBundleIdentifier];
      id v16 = v18;
      id v20 = v19;
      uint64_t v15 = v20;
      if (v16 == v20)
      {
      }
      else
      {
        LOBYTE(v8) = 0;
        v21 = v20;
        id v22 = v16;
        if (!v16 || !v20) {
          goto LABEL_32;
        }
        int v8 = [v16 isEqualToString:v20];

        if (!v8) {
          goto LABEL_33;
        }
      }
      id v23 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
      uint64_t v24 = [(INIntentDescriptor *)v9 uiExtensionBundleIdentifier];
      id v22 = v23;
      id v25 = v24;
      v21 = v25;
      if (v22 == v25)
      {
      }
      else
      {
        if (!v22 || !v25)
        {

          LOBYTE(v8) = 0;
          goto LABEL_32;
        }
        int v8 = [v22 isEqualToString:v25];

        if (!v8) {
          goto LABEL_32;
        }
      }
      int64_t v26 = [(INIntentDescriptor *)self preferredCallProvider];
      LOBYTE(v8) = v26 == [(INIntentDescriptor *)v9 preferredCallProvider];
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    LOBYTE(v8) = 0;
  }
LABEL_36:

  return v8;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)INIntentDescriptor;
  unint64_t v3 = [(INAppDescriptor *)&v11 hash];
  id v4 = [(INIntentDescriptor *)self intentClassName];
  uint64_t v5 = [v4 hash];
  id v6 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  int v8 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (id)mergeWithDescriptor:(id)a3
{
  id v4 = (INIntentDescriptor *)a3;
  uint64_t v5 = [(INIntentDescriptor *)self intentClassName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(INIntentDescriptor *)v4 intentClassName];
  }
  id v8 = v7;

  unint64_t v9 = [(INAppDescriptor *)self localizedName];
  char v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(INAppDescriptor *)v4 localizedName];
  }
  id v12 = v11;

  id v13 = [(INAppDescriptor *)self bundleIdentifier];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [(INAppDescriptor *)v4 bundleIdentifier];
  }
  id v16 = v15;

  int v17 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(INIntentDescriptor *)v4 displayableBundleIdentifier];
  }
  id v20 = v19;

  v21 = [(INAppDescriptor *)self extensionBundleIdentifier];
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = [(INAppDescriptor *)v4 extensionBundleIdentifier];
  }
  v62 = v23;

  uint64_t v24 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  id v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [(INIntentDescriptor *)v4 uiExtensionBundleIdentifier];
  }
  v61 = v26;

  v27 = [(INAppDescriptor *)self counterpartIdentifiers];
  objc_super v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [(INAppDescriptor *)v4 counterpartIdentifiers];
  }
  v60 = v29;

  v30 = [(INAppDescriptor *)self teamIdentifier];
  v31 = v30;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    id v32 = [(INAppDescriptor *)v4 teamIdentifier];
  }
  v59 = v32;

  v33 = [(INAppDescriptor *)self bundleURL];
  v34 = v33;
  v58 = v8;
  if (v33)
  {
    id v35 = v33;
  }
  else
  {
    id v35 = [(INAppDescriptor *)v4 bundleURL];
  }
  v36 = v35;

  if ([(INIntentDescriptor *)self preferredCallProvider]) {
    v37 = self;
  }
  else {
    v37 = v4;
  }
  uint64_t v38 = [(INIntentDescriptor *)v37 preferredCallProvider];
  v39 = [(INAppDescriptor *)self documentTypes];
  v40 = v39;
  uint64_t v57 = v38;
  if (v39)
  {
    id v41 = v39;
  }
  else
  {
    id v41 = [(INAppDescriptor *)v4 documentTypes];
  }
  v42 = v41;

  v43 = [(INAppDescriptor *)self supportedIntents];
  if (v43)
  {
    [(INAppDescriptor *)self supportedIntents];
    v44 = v20;
    v45 = v16;
    v47 = v46 = v12;
    v48 = (void *)[v47 mutableCopy];

    id v12 = v46;
    id v16 = v45;
    id v20 = v44;
  }
  else
  {
    v48 = objc_opt_new();
  }

  v49 = [(INAppDescriptor *)v4 supportedIntents];
  [v48 unionSet:v49];

  if (([v16 isEqualToString:v20] & 1) == 0)
  {
    v50 = v16;
    v51 = v12;
    v52 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v20 allowPlaceholder:0 error:0];
    v53 = [v52 localizedName];

    if (v53)
    {
      id v12 = [v52 localizedName];
    }
    else
    {
      id v12 = v51;
    }

    id v16 = v50;
  }
  v54 = [[INIntentDescriptor alloc] initWithIntentClassName:v58 localizedName:v12 bundleIdentifier:v16 displayableBundleIdentifier:v20 extensionBundleIdentifier:v62 uiExtensionBundleIdentifier:v61 counterpartIdentifiers:v60 teamIdentifier:v59 preferredCallProvider:v57 supportedIntents:v48 bundleURL:v36 documentTypes:v42];
  uint64_t v55 = [(INAppDescriptor *)self requiresUserConfirmation]
     || [(INAppDescriptor *)v4 requiresUserConfirmation];
  [(INAppDescriptor *)v54 setRequiresUserConfirmation:v55];

  return v54;
}

- (INIntentDescriptor)descriptorWithPreferredCallProvider:(int64_t)a3
{
  int v17 = [INIntentDescriptor alloc];
  id v19 = [(INIntentDescriptor *)self intentClassName];
  id v16 = [(INAppDescriptor *)self localizedName];
  id v15 = [(INAppDescriptor *)self bundleIdentifier];
  id v4 = [(INAppDescriptor *)self bundleIdentifier];
  uint64_t v5 = [(INAppDescriptor *)self extensionBundleIdentifier];
  id v14 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  id v6 = [(INAppDescriptor *)self counterpartIdentifiers];
  id v7 = [(INAppDescriptor *)self teamIdentifier];
  id v8 = [(INAppDescriptor *)self supportedIntents];
  unint64_t v9 = [(INAppDescriptor *)self bundleURL];
  char v10 = [(INAppDescriptor *)self documentTypes];
  id v11 = (void *)v5;
  id v12 = [(INIntentDescriptor *)v17 initWithIntentClassName:v19 localizedName:v16 bundleIdentifier:v15 displayableBundleIdentifier:v4 extensionBundleIdentifier:v5 uiExtensionBundleIdentifier:v14 counterpartIdentifiers:v6 teamIdentifier:v7 preferredCallProvider:a3 supportedIntents:v8 bundleURL:v9 documentTypes:v10];

  [(INAppDescriptor *)v12 setRequiresUserConfirmation:[(INAppDescriptor *)self requiresUserConfirmation]];

  return v12;
}

- (INIntentDescriptor)descriptorWithAppDescriptor:(id)a3
{
  id v4 = a3;
  id v16 = [INIntentDescriptor alloc];
  uint64_t v5 = [(INIntentDescriptor *)self intentClassName];
  id v19 = [v4 localizedName];
  v18 = [v4 bundleIdentifier];
  id v15 = [v4 bundleIdentifier];
  id v6 = [(INAppDescriptor *)self extensionBundleIdentifier];
  id v20 = self;
  id v7 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  id v14 = [v4 counterpartIdentifiers];
  id v8 = [v4 teamIdentifier];
  int64_t v9 = [(INIntentDescriptor *)self preferredCallProvider];
  char v10 = [v4 supportedIntents];
  id v11 = [v4 bundleURL];
  id v12 = [v4 documentTypes];

  int v17 = [(INIntentDescriptor *)v16 initWithIntentClassName:v5 localizedName:v19 bundleIdentifier:v18 displayableBundleIdentifier:v15 extensionBundleIdentifier:v6 uiExtensionBundleIdentifier:v7 counterpartIdentifiers:v14 teamIdentifier:v8 preferredCallProvider:v9 supportedIntents:v10 bundleURL:v11 documentTypes:v12];
  [(INAppDescriptor *)v17 setRequiresUserConfirmation:[(INAppDescriptor *)v20 requiresUserConfirmation]];

  return v17;
}

- (LSApplicationRecord)displayableApplicationRecord
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  if (v4)
  {
    uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  }
  else
  {
    id v6 = [(INAppDescriptor *)self bundleIdentifier];
    uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  }

  return (LSApplicationRecord *)v5;
}

- (LSApplicationRecord)launchableApplicationRecord
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(INAppDescriptor *)self bundleIdentifier];
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  return (LSApplicationRecord *)v5;
}

- (id)displayableAppDescriptor
{
  id v3 = [(INAppDescriptor *)self bundleIdentifier];
  id v4 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [(INIntentDescriptor *)self appDescriptor];
  }
  else
  {
    v18 = [(INIntentDescriptor *)self displayableApplicationRecord];
    id v7 = [[INAppDescriptor alloc] initWithApplicationRecord:v18];
    id v8 = [INAppDescriptor alloc];
    int64_t v9 = [(INAppDescriptor *)v7 localizedName];
    char v10 = [(INAppDescriptor *)v7 bundleIdentifier];
    id v11 = [(INAppDescriptor *)self extensionBundleIdentifier];
    id v12 = [(INAppDescriptor *)v7 counterpartIdentifiers];
    id v13 = [(INAppDescriptor *)v7 teamIdentifier];
    id v14 = [(INAppDescriptor *)v7 supportedIntents];
    id v15 = [(INAppDescriptor *)v7 bundleURL];
    id v16 = [(INAppDescriptor *)v7 documentTypes];
    id v6 = [(INAppDescriptor *)v8 initWithLocalizedName:v9 bundleIdentifier:v10 extensionBundleIdentifier:v11 counterpartIdentifiers:v12 teamIdentifier:v13 supportedIntents:v14 bundleURL:v15 documentTypes:v16];
  }

  return v6;
}

- (id)appDescriptor
{
  id v3 = [INAppDescriptor alloc];
  id v4 = [(INAppDescriptor *)self localizedName];
  int v5 = [(INAppDescriptor *)self bundleIdentifier];
  id v6 = [(INAppDescriptor *)self extensionBundleIdentifier];
  id v7 = [(INAppDescriptor *)self counterpartIdentifiers];
  id v8 = [(INAppDescriptor *)self teamIdentifier];
  int64_t v9 = [(INAppDescriptor *)self supportedIntents];
  char v10 = [(INAppDescriptor *)self bundleURL];
  id v11 = [(INAppDescriptor *)self documentTypes];
  id v12 = [(INAppDescriptor *)v3 initWithLocalizedName:v4 bundleIdentifier:v5 extensionBundleIdentifier:v6 counterpartIdentifiers:v7 teamIdentifier:v8 supportedIntents:v9 bundleURL:v10 documentTypes:v11];

  [(INAppDescriptor *)v12 setRequiresUserConfirmation:[(INAppDescriptor *)self requiresUserConfirmation]];

  return v12;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)INIntentDescriptor;
  id v4 = [(INAppDescriptor *)&v10 description];
  int v5 = [(INIntentDescriptor *)self intentClassName];
  id v6 = [(INIntentDescriptor *)self displayableBundleIdentifier];
  id v7 = [(INIntentDescriptor *)self uiExtensionBundleIdentifier];
  id v8 = [v3 stringWithFormat:@"%@, intentClassName: %@, displayableBundleId: %@, uiExtensionBundleId: %@, preferredCallProvider: %li", v4, v5, v6, v7, -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider")];

  return v8;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 displayableBundleIdentifier:(id)a6 extensionBundleIdentifier:(id)a7 uiExtensionBundleIdentifier:(id)a8 counterpartIdentifiers:(id)a9 teamIdentifier:(id)a10 preferredCallProvider:(int64_t)a11 supportedIntents:(id)a12 bundleURL:(id)a13 documentTypes:(id)a14
{
  id v38 = a3;
  id v37 = a8;
  id v19 = a14;
  id v20 = a13;
  id v21 = a12;
  id v22 = a10;
  id v23 = a9;
  id v24 = a7;
  id v25 = a6;
  id v26 = a4;
  id v27 = (id)[a5 copy];
  objc_super v28 = (void *)[v25 copy];

  if (!v27 && v28)
  {
    id v27 = v28;
LABEL_6:
    id v27 = v27;
    objc_super v28 = v27;
    goto LABEL_7;
  }
  if (!v28 && v27) {
    goto LABEL_6;
  }
LABEL_7:
  v39.receiver = self;
  v39.super_class = (Class)INIntentDescriptor;
  id v29 = [(INAppDescriptor *)&v39 initWithLocalizedName:v26 bundleIdentifier:v27 extensionBundleIdentifier:v24 counterpartIdentifiers:v23 teamIdentifier:v22 supportedIntents:v21 bundleURL:v20 documentTypes:v19];

  if (v29)
  {
    uint64_t v30 = [v38 copy];
    intentClassName = v29->_intentClassName;
    v29->_intentClassName = (NSString *)v30;

    objc_storeStrong((id *)&v29->_displayableBundleIdentifier, v28);
    uint64_t v32 = [v37 copy];
    uiExtensionBundleIdentifier = v29->_uiExtensionBundleIdentifier;
    v29->_uiExtensionBundleIdentifier = (NSString *)v32;

    v29->_preferredCallProvider = a11;
    v34 = v29;
  }

  return v29;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  int64_t v9 = [v6 setWithObject:v8];
  objc_super v10 = [(INIntentDescriptor *)self initWithIntentClassName:v8 localizedName:0 bundleIdentifier:0 displayableBundleIdentifier:0 extensionBundleIdentifier:v7 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 preferredCallProvider:0 supportedIntents:v9 bundleURL:0 documentTypes:0];

  return v10;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F223C8];
  id v7 = a4;
  id v8 = a3;
  int64_t v9 = (void *)[[v6 alloc] initWithBundleIdentifier:v7 allowPlaceholder:0 error:0];
  objc_super v10 = [v9 localizedName];
  id v11 = objc_msgSend(v9, "in_counterpartIdentifiers");
  id v12 = [v9 teamIdentifier];
  id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  id v14 = objc_msgSend(v9, "in_documentTypes");
  id v15 = [(INIntentDescriptor *)self initWithIntentClassName:v8 localizedName:v10 bundleIdentifier:v7 displayableBundleIdentifier:0 extensionBundleIdentifier:0 uiExtensionBundleIdentifier:0 counterpartIdentifiers:v11 teamIdentifier:v12 preferredCallProvider:0 supportedIntents:v13 bundleURL:0 documentTypes:v14];

  return v15;
}

- (INIntentDescriptor)initWithIntentTypeName:(id)a3
{
  id v4 = a3;
  id v16 = 0;
  id v17 = 0;
  int v5 = INParseCustomIntentTypeName(v4, &v17, &v16);
  id v6 = v17;
  id v7 = v16;
  if (v5)
  {
    self = [(INIntentDescriptor *)self initWithIntentClassName:v6 launchableAppBundleId:v7];
    id v8 = self;
  }
  else
  {
    int64_t v9 = INIntentSchemaGetIntentDescriptionWithType(v4);
    objc_super v10 = v9;
    if (v9)
    {
      id v11 = NSStringFromClass((Class)[v9 facadeClass]);
      id v12 = (void *)MEMORY[0x1E4F1CAD0];
      id v13 = NSStringFromClass((Class)[v10 facadeClass]);
      id v14 = [v12 setWithObject:v13];
      self = [(INIntentDescriptor *)self initWithIntentClassName:v11 localizedName:0 bundleIdentifier:0 displayableBundleIdentifier:0 extensionBundleIdentifier:0 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 preferredCallProvider:0 supportedIntents:v14 bundleURL:0 documentTypes:0];

      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (INIntentDescriptor)initWithIntent:(id)a3
{
  id v3 = a3;
  [v3 launchId];
  id v35 = 0;
  v34 = id v36 = 0;
  INExtractAppInfoFromSiriLaunchIdWithoutLaunchServices(v34, &v36, &v35);
  id v4 = v36;
  id v30 = v35;
  id v5 = v3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 preferredCallProvider];
      v31 = v5;
    }
    else
    {

      uint64_t v6 = 0;
      v31 = 0;
    }
    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v8 preferredCallProvider];
      id v29 = v8;
    }
    else
    {

      id v29 = 0;
    }
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v9;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    v31 = 0;
    id v29 = 0;
    id v7 = 0;
  }

  objc_super v10 = [v5 _className];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v12;
  uint64_t v15 = 2;
  if (!v7) {
    uint64_t v15 = v6;
  }
  uint64_t v28 = v15;

  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  id v17 = [v16 localizedName];
  id v26 = [v5 extensionBundleId];
  v18 = [v5 _uiExtensionBundleId];
  id v19 = objc_msgSend(v16, "in_counterpartIdentifiers");
  id v20 = [v16 teamIdentifier];
  id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
  uint64_t v22 = objc_msgSend(v16, "in_documentTypes");
  id v23 = v4;
  id v27 = v4;
  id v24 = (void *)v22;
  v33 = [(INIntentDescriptor *)self initWithIntentClassName:v14 localizedName:v17 bundleIdentifier:v23 displayableBundleIdentifier:0 extensionBundleIdentifier:v26 uiExtensionBundleIdentifier:v18 counterpartIdentifiers:v19 teamIdentifier:v20 preferredCallProvider:v28 supportedIntents:v21 bundleURL:v30 documentTypes:v22];

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end