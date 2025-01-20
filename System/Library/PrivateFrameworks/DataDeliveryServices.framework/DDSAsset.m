@interface DDSAsset
+ (id)debuggingIDsForAssets:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DDSAsset)initWithAttributes:(id)a3 localURL:(id)a4;
- (NSDictionary)attributes;
- (NSString)assetType;
- (NSString)assetUUID;
- (NSString)dataType;
- (NSString)debuggingID;
- (NSString)installDate;
- (NSString)locale;
- (NSString)shortName;
- (NSString)uniqueIdentifier;
- (NSURL)localURL;
- (id)description;
- (unint64_t)assetState;
- (unint64_t)compatibilityVersion;
- (unint64_t)contentVersion;
- (unint64_t)hash;
@end

@implementation DDSAsset

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(DDSAsset *)self attributes];
    v8 = [v6 attributes];
    if (!DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      BOOL v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v9 = [(DDSAsset *)self localURL];
    v10 = [v6 localURL];
    if (!DDSObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
    {
      BOOL v20 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v11 = [(DDSAsset *)self assetUUID];
    v12 = [v6 assetUUID];
    if (!DDSObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
    {
      BOOL v20 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v13 = [(DDSAsset *)self uniqueIdentifier];
    v32 = [v6 uniqueIdentifier];
    if (!DDSObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v32))
    {
      BOOL v20 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v29 = v11;
    unint64_t v14 = [(DDSAsset *)self shortName];
    v30 = [v6 shortName];
    v31 = (void *)v14;
    if (DDSObjectsAreEqualOrNil(v14, (uint64_t)v30))
    {
      v28 = v13;
      unint64_t v15 = [(DDSAsset *)self compatibilityVersion];
      if (v15 == [v6 compatibilityVersion])
      {
        unint64_t v16 = [(DDSAsset *)self locale];
        v26 = [v6 locale];
        v27 = (void *)v16;
        if (DDSObjectsAreEqualOrNil(v16, (uint64_t)v26))
        {
          unint64_t v17 = [(DDSAsset *)self installDate];
          v24 = [v6 installDate];
          v25 = (void *)v17;
          if (DDSObjectsAreEqualOrNil(v17, (uint64_t)v24))
          {
            unint64_t v18 = [(DDSAsset *)self debuggingID];
            v22 = [v6 debuggingID];
            v23 = (void *)v18;
            if (DDSObjectsAreEqualOrNil(v18, (uint64_t)v22))
            {
              unint64_t v19 = [(DDSAsset *)self contentVersion];
              BOOL v20 = v19 == [v6 contentVersion];
            }
            else
            {
              BOOL v20 = 0;
            }
            v13 = v28;
            v11 = v29;
          }
          else
          {
            BOOL v20 = 0;
            v13 = v28;
            v11 = v29;
          }
        }
        else
        {
          BOOL v20 = 0;
          v13 = v28;
          v11 = v29;
        }

        goto LABEL_29;
      }
      BOOL v20 = 0;
      v13 = v28;
    }
    else
    {
      BOOL v20 = 0;
    }
    v11 = v29;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v20 = 0;
LABEL_34:

  return v20;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)installDate
{
  return self->_installDate;
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSURL)localURL
{
  return self->_localURL;
}

+ (id)debuggingIDsForAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "debuggingID", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)debuggingID
{
  return self->_debuggingID;
}

- (DDSAsset)initWithAttributes:(id)a3 localURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DDSAsset;
  uint64_t v8 = [(DDSAsset *)&v33 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    localURL = v8->_localURL;
    v8->_localURL = (NSURL *)v11;

    uint64_t v13 = assetUUIDWithLocalURL(v7);
    assetUUID = v8->_assetUUID;
    v8->_assetUUID = (NSString *)v13;

    uint64_t v15 = uniqueIdentifierWithAttributes(v6);
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v15;

    uint64_t v17 = shortNameWithAttributes(v6);
    shortName = v8->_shortName;
    v8->_shortName = (NSString *)v17;

    unint64_t v19 = objc_msgSend(v6, "dds_numberForKey:", @"_CompatibilityVersion");
    v8->_compatibilityVersion = [v19 unsignedIntegerValue];

    BOOL v20 = objc_msgSend(v6, "dds_numberForKey:", @"_ContentVersion");
    v8->_contentVersion = [v20 unsignedIntegerValue];

    uint64_t v21 = objc_msgSend(v6, "dds_stringForKey:", @"AssetLocale");
    locale = v8->_locale;
    v8->_locale = (NSString *)v21;

    uint64_t v23 = objc_msgSend(v6, "dds_stringForKey:", @"__InstallDate");
    installDate = v8->_installDate;
    v8->_installDate = (NSString *)v23;

    id v25 = v6;
    v26 = assetUUIDWithLocalURL(v7);
    if (DDS_LOG_REDACTED()) {
      uniqueIdentifierWithAttributes(v25);
    }
    else {
    v27 = shortNameWithAttributes(v25);
    }

    uint64_t v28 = [NSString stringWithFormat:@"%@::%@", v27, v26];

    debuggingID = v8->_debuggingID;
    v8->_debuggingID = (NSString *)v28;

    uint64_t v30 = [NSString stringWithFormat:@"<%@: %p, %@>", objc_opt_class(), v8, v8->_debuggingID];
    description = v8->_description;
    v8->_description = (NSString *)v30;
  }
  return v8;
}

- (unint64_t)hash
{
  id v3 = [(DDSAsset *)self attributes];
  uint64_t v4 = [v3 hash];

  id v5 = [(DDSAsset *)self localURL];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(DDSAsset *)self assetUUID];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(DDSAsset *)self uniqueIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  uint64_t v11 = [(DDSAsset *)self shortName];
  uint64_t v12 = [v11 hash];

  unint64_t v13 = v12 ^ [(DDSAsset *)self compatibilityVersion];
  long long v14 = [(DDSAsset *)self locale];
  uint64_t v15 = v10 ^ v13 ^ [v14 hash];

  unint64_t v16 = [(DDSAsset *)self installDate];
  uint64_t v17 = [v16 hash];

  unint64_t v18 = [(DDSAsset *)self debuggingID];
  uint64_t v19 = v17 ^ [v18 hash];

  return v15 ^ v19 ^ [(DDSAsset *)self contentVersion];
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)assetState
{
  return self->_assetState;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggingID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end