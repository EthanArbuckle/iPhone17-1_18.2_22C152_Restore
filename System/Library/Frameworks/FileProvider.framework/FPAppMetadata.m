@interface FPAppMetadata
+ (BOOL)_isContainerIDPermitted:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_entitledCloudDocsContainerIDForAppProxy:(id)a3;
+ (id)_entitledUbiquityContainerIDForAppProxy:(id)a3;
+ (id)_localizedCustomDisplayNameForAppProxy:(id)a3;
+ (id)findBundleIDForCurrentPlatformInSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManaged;
- (BOOL)useDefaultProviderDomainID;
- (FPAppMetadata)initWithAppProxy:(id)a3 providerDomainID:(id)a4;
- (FPAppMetadata)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)displayName;
- (NSString)providerDomainID;
- (NSURL)documentsURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setProviderDomainID:(id)a3;
@end

@implementation FPAppMetadata

- (NSURL)documentsURL
{
  return self->_documentsURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_documentsURL forKey:@"_documentsURL"];
  [v5 encodeObject:self->_providerDomainID forKey:@"_providerDomainID"];
  [v5 encodeBool:self->_useDefaultProviderDomainID forKey:@"_useDefaultProviderDomainID"];
  [v5 encodeBool:self->_isManaged forKey:@"_isManaged"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPAppMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPAppMetadata;
  id v5 = [(FPAppMetadata *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_documentsURL"];
    documentsURL = v5->_documentsURL;
    v5->_documentsURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_providerDomainID"];
    providerDomainID = v5->_providerDomainID;
    v5->_providerDomainID = (NSString *)v12;

    v5->_useDefaultProviderDomainID = [v4 decodeBoolForKey:@"_useDefaultProviderDomainID"];
    v5->_isManaged = [v4 decodeBoolForKey:@"_isManaged"];
  }

  return v5;
}

- (FPAppMetadata)initWithAppProxy:(id)a3 providerDomainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleIdentifier];
  v9 = [(id)objc_opt_class() _localizedCustomDisplayNameForAppProxy:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 localizedName];
  }
  uint64_t v12 = v11;
  v13 = [v6 dataContainerURL];
  v14 = [v13 URLByAppendingPathComponent:@"Documents"];

  if (v6 && [v8 length])
  {
    objc_super v15 = 0;
    if ([v12 length] && v14)
    {
      v22.receiver = self;
      v22.super_class = (Class)FPAppMetadata;
      v16 = [(FPAppMetadata *)&v22 init];
      v17 = v16;
      if (v16)
      {
        objc_storeStrong((id *)&v16->_bundleID, v8);
        objc_storeStrong((id *)&v17->_displayName, v12);
        objc_storeStrong((id *)&v17->_documentsURL, v14);
        if (v7)
        {
          objc_storeStrong((id *)&v17->_providerDomainID, a4);
        }
        else
        {
          uint64_t v18 = objc_msgSend(NSString, "fp_defaultProviderDomainID");
          providerDomainID = v17->_providerDomainID;
          v17->_providerDomainID = (NSString *)v18;

          v17->_useDefaultProviderDomainID = 1;
        }
        v20 = [MEMORY[0x1E4F74230] sharedConnection];
        v17->_isManaged = [v20 isAppManaged:v8];
      }
      self = v17;
      objc_super v15 = self;
    }
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPAppMetadata *)a3;
  id v5 = v4;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [(FPAppMetadata *)self bundleID];
        id v7 = [(FPAppMetadata *)v5 bundleID];
        if (![v6 isEqual:v7])
        {
          LOBYTE(v16) = 0;
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v8 = [(FPAppMetadata *)self displayName];
        v9 = [(FPAppMetadata *)v5 displayName];
        if (![v8 isEqual:v9])
        {
          LOBYTE(v16) = 0;
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v10 = [(FPAppMetadata *)self documentsURL];
        id v11 = [(FPAppMetadata *)v5 documentsURL];
        if (![v10 isEqual:v11])
        {
          LOBYTE(v16) = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v12 = [(FPAppMetadata *)self providerDomainID];
        uint64_t v13 = [(FPAppMetadata *)v5 providerDomainID];
        v14 = (void *)v13;
        if (v12 == (void *)v13)
        {
          objc_super v22 = v12;
        }
        else
        {
          v21 = (void *)v13;
          objc_super v15 = [(FPAppMetadata *)self providerDomainID];
          [(FPAppMetadata *)v5 providerDomainID];
          uint64_t v24 = v23 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            LOBYTE(v16) = 0;
            v14 = v21;
            v19 = (void *)v24;
LABEL_22:

LABEL_23:
            goto LABEL_24;
          }
          objc_super v22 = v12;
          v14 = v21;
        }
        BOOL v17 = [(FPAppMetadata *)self useDefaultProviderDomainID];
        if (v17 == [(FPAppMetadata *)v5 useDefaultProviderDomainID])
        {
          BOOL v18 = [(FPAppMetadata *)self isManaged];
          BOOL v16 = v18 ^ [(FPAppMetadata *)v5 isManaged] ^ 1;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
        uint64_t v12 = v22;
        v19 = (void *)v24;
        if (v22 == v14) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
    LOBYTE(v16) = 0;
  }
LABEL_27:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(FPAppMetadata *)self bundleID];
  [v4 setValue:v5 forKey:@"bundleID"];

  id v6 = [(FPAppMetadata *)self displayName];
  [v4 setValue:v6 forKey:@"displayName"];

  id v7 = [(FPAppMetadata *)self documentsURL];
  [v4 setValue:v7 forKey:@"documentsURL"];

  uint64_t v8 = [(FPAppMetadata *)self providerDomainID];
  [v4 setValue:v8 forKey:@"providerDomainID"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FPAppMetadata useDefaultProviderDomainID](self, "useDefaultProviderDomainID"));
  [v4 setValue:v9 forKey:@"useDefaultProviderDomainID"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FPAppMetadata isManaged](self, "isManaged"));
  [v4 setValue:v10 forKey:@"isManaged"];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FPAppMetadata *)self bundleID];
  if ([(FPAppMetadata *)self isManaged]) {
    id v6 = @" (managed)";
  }
  else {
    id v6 = @" ";
  }
  id v7 = [(FPAppMetadata *)self displayName];
  uint64_t v8 = [(FPAppMetadata *)self providerDomainID];
  BOOL v9 = [(FPAppMetadata *)self useDefaultProviderDomainID];
  uint64_t v10 = &stru_1EF68D1F8;
  if (v9) {
    uint64_t v10 = @"[default]";
  }
  id v11 = [v3 stringWithFormat:@"<%@:%p %@%@n:'%@' p:'%@'%@>", v4, self, v5, v6, v7, v8, v10];

  return v11;
}

+ (id)findBundleIDForCurrentPlatformInSet:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 anyObject];
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CA80] set];
      id v6 = [MEMORY[0x1E4F1CA80] set];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v3;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            [v12 rangeOfString:@"mobile" options:1];
            uint64_t v13 = v5;
            if (v14) {
              goto LABEL_18;
            }
            [v12 rangeOfString:@"ios" options:1];
            uint64_t v13 = v5;
            if (v15) {
              goto LABEL_18;
            }
            [v12 rangeOfString:@"ipad" options:1];
            uint64_t v13 = v5;
            if (v16) {
              goto LABEL_18;
            }
            [v12 rangeOfString:@"touch" options:1];
            uint64_t v13 = v5;
            if (v17) {
              goto LABEL_18;
            }
            char v18 = [v12 containsString:@".iWork."];
            uint64_t v13 = v6;
            if ((v18 & 1) == 0)
            {
              char v19 = [v12 containsString:@".iMovieApp"];
              uint64_t v13 = v6;
              if ((v19 & 1) == 0)
              {
                [v12 rangeOfString:@"mac" options:1];
                uint64_t v13 = v6;
                if (!v20)
                {
                  [v12 rangeOfString:@"osx" options:1];
                  uint64_t v13 = v6;
                  if (!v21) {
                    continue;
                  }
                }
              }
            }
LABEL_18:
            [v13 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v9);
      }

      if ([v5 count])
      {
        uint64_t v4 = [v5 anyObject];
      }
      else
      {
        objc_super v22 = (void *)[v7 mutableCopy];
        [v22 minusSet:v6];
        if ([v22 count]) {
          v23 = v22;
        }
        else {
          v23 = v7;
        }
        uint64_t v4 = [v23 anyObject];
      }
      id v3 = v25;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_localizedCustomDisplayNameForAppProxy:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [v4 objectForInfoDictionaryKey:@"NSUbiquitousContainers" ofClass:objc_opt_class()];
    if (v5
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (([a1 _entitledCloudDocsContainerIDForAppProxy:v4],
           (id v6 = objc_claimAutoreleasedReturnValue()) != 0)
       || ([a1 _entitledUbiquityContainerIDForAppProxy:v4],
           (id v6 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      id v7 = [v5 objectForKeyedSubscript:v6];
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v8 = [v7 objectForKeyedSubscript:@"NSUbiquitousContainerName"];
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"NSUbiquitousContainerName"];
          uint64_t v10 = [v4 localizedValuesForKeys:v9 fromTable:@"InfoPlist"];
          uint64_t v11 = [v10 stringForKey:@"NSUbiquitousContainerName"];
          uint64_t v12 = (void *)v11;
          if (v11) {
            uint64_t v13 = (void *)v11;
          }
          else {
            uint64_t v13 = v8;
          }
          id v14 = v13;
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (BOOL)_isContainerIDPermitted:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (_isContainerIDPermitted__onceToken != -1)
  {
    dispatch_once(&_isContainerIDPermitted__onceToken, &__block_literal_global_38);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  int v5 = [(id)_isContainerIDPermitted__prohibitedContainerIDs containsObject:v4] ^ 1;
LABEL_6:

  return v5;
}

uint64_t __41__FPAppMetadata__isContainerIDPermitted___block_invoke()
{
  _isContainerIDPermitted__prohibitedContainerIDs = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.CloudDocs", @"com.apple.Desktop", @"com.apple.Documents", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)_entitledCloudDocsContainerIDForAppProxy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 entitlementValueForKey:@"com.apple.developer.icloud-services" ofClass:v5 valuesOfClass:objc_opt_class()];
  id v7 = v6;
  if (!v6 || ![v6 containsObject:@"CloudDocuments"])
  {
    id v14 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v4 entitlementValueForKey:@"com.apple.developer.icloud-container-identifiers" ofClass:v8 valuesOfClass:objc_opt_class()];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 firstObject];
    if (v11)
    {
      if ([a1 _isContainerIDPermitted:v11]) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      goto LABEL_12;
    }
LABEL_13:
    id v14 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [v4 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
  if (!v11) {
    goto LABEL_13;
  }
  id v13 = [@"iCloud." stringByAppendingString:v11];
LABEL_12:
  id v14 = v13;
LABEL_14:

LABEL_15:

  return v14;
}

+ (id)_entitledUbiquityContainerIDForAppProxy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 entitlementValueForKey:@"com.apple.developer.ubiquity-container-identifiers" ofClass:v5 valuesOfClass:objc_opt_class()];

  if (v6)
  {
    id v7 = [v6 firstObject];
    if (v7)
    {
      if ([a1 _isContainerIDPermitted:v7]) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (void)setProviderDomainID:(id)a3
{
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)useDefaultProviderDomainID
{
  return self->_useDefaultProviderDomainID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end