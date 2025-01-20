@interface MIStoreMetadataDistributor
+ (BOOL)supportsSecureCoding;
- (BOOL)distributorIsFirstPartyApple;
- (BOOL)distributorIsThirdParty;
- (BOOL)isEqual:(id)a3;
- (MIStoreMetadataDistributor)initWithCoder:(id)a3;
- (MIStoreMetadataDistributor)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)localizedDistributorName;
- (NSNumber)marketplaceItemID;
- (NSString)accountID;
- (NSString)developerID;
- (NSString)developerName;
- (NSString)distributorID;
- (NSString)distributorNameForCurrentLocale;
- (NSString)domain;
- (NSString)marketplaceDomain;
- (NSURL)shareURL;
- (NSURL)sourceURL;
- (NSURL)supportPageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)distributorType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setDeveloperID:(id)a3;
- (void)setDeveloperName:(id)a3;
- (void)setDistributorID:(id)a3;
- (void)setDomain:(id)a3;
- (void)setLocalizedDistributorName:(id)a3;
- (void)setMarketplaceDomain:(id)a3;
- (void)setMarketplaceItemID:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setSupportPageURL:(id)a3;
@end

@implementation MIStoreMetadataDistributor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStoreMetadataDistributor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(MIStoreMetadataDistributor *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:distributorID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setDistributorID:v6];
    }
    else if (v6 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = distributorID;
      MOLogWrite();
    }

    v7 = [v4 objectForKeyedSubscript:accountID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setAccountID:v7];
    }
    else if (v7 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = accountID;
      MOLogWrite();
    }

    v8 = [v4 objectForKeyedSubscript:domain];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setDomain:v8];
    }
    else if (v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v32 = domain;
      MOLogWrite();
    }

    v9 = [v4 objectForKeyedSubscript:::supportPageURL];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
      supportPageURL = v5->_supportPageURL;
      v5->_supportPageURL = (NSURL *)v12;
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", ::sourceURL, v32);
    objc_opt_class();
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
      sourceURL = v5->_sourceURL;
      v5->_sourceURL = (NSURL *)v17;
    }
    v19 = [v4 objectForKeyedSubscript:localizedDistributorName];
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v19, v20, v21))
      {
        [(MIStoreMetadataDistributor *)v5 setLocalizedDistributorName:v19];
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        MOLogWrite();
      }
    }
    v22 = [v4 objectForKeyedSubscript:developerID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setDeveloperID:v22];
    }
    else if (v22 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v33 = developerID;
      MOLogWrite();
    }

    v23 = [v4 objectForKeyedSubscript:developerName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setDeveloperName:v23];
    }
    else if (v23 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      uint64_t v33 = developerName;
      MOLogWrite();
    }

    v24 = [v4 objectForKeyedSubscript:::shareURL];
    objc_opt_class();
    id v25 = v24;
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }

    if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
      shareURL = v5->_shareURL;
      v5->_shareURL = (NSURL *)v27;
    }
    v29 = objc_msgSend(v4, "objectForKeyedSubscript:", marketplaceItemID, v33);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setMarketplaceItemID:v29];
    }
    else if (v29 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }

    v30 = [v4 objectForKeyedSubscript:marketplaceDomain];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MIStoreMetadataDistributor *)v5 setMarketplaceDomain:v30];
    }
    else if (v30 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }
  }
  return v5;
}

- (MIStoreMetadataDistributor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStoreMetadataDistributor *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distributorID"];
    distributorID = v5->_distributorID;
    v5->_distributorID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportPageURL"];
    supportPageURL = v5->_supportPageURL;
    v5->_supportPageURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v14;

    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"localizedDistributorName"];
    localizedDistributorName = v5->_localizedDistributorName;
    v5->_localizedDistributorName = (NSDictionary *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerID"];
    developerID = v5->_developerID;
    v5->_developerID = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerName"];
    developerName = v5->_developerName;
    v5->_developerName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketplaceItemID"];
    marketplaceItemID = v5->_marketplaceItemID;
    v5->_marketplaceItemID = (NSNumber *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"marketplaceDomain"];
    marketplaceDomain = v5->_marketplaceDomain;
    v5->_marketplaceDomain = (NSString *)v29;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(MIStoreMetadataDistributor *)self distributorID];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDistributorID:v7];

  uint64_t v8 = [(MIStoreMetadataDistributor *)self accountID];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setAccountID:v9];

  uint64_t v10 = [(MIStoreMetadataDistributor *)self domain];
  id v11 = (void *)[v10 copyWithZone:a3];
  [v5 setDomain:v11];

  uint64_t v12 = [(MIStoreMetadataDistributor *)self supportPageURL];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setSupportPageURL:v13];

  uint64_t v14 = [(MIStoreMetadataDistributor *)self sourceURL];
  id v15 = (void *)[v14 copyWithZone:a3];
  [v5 setSourceURL:v15];

  id v16 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  uint64_t v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLocalizedDistributorName:v17];

  v18 = [(MIStoreMetadataDistributor *)self developerID];
  uint64_t v19 = (void *)[v18 copyWithZone:a3];
  [v5 setDeveloperID:v19];

  uint64_t v20 = [(MIStoreMetadataDistributor *)self developerName];
  uint64_t v21 = (void *)[v20 copyWithZone:a3];
  [v5 setDeveloperName:v21];

  v22 = [(MIStoreMetadataDistributor *)self shareURL];
  uint64_t v23 = (void *)[v22 copyWithZone:a3];
  [v5 setShareURL:v23];

  v24 = [(MIStoreMetadataDistributor *)self marketplaceItemID];
  uint64_t v25 = (void *)[v24 copyWithZone:a3];
  [v5 setMarketplaceItemID:v25];

  id v26 = [(MIStoreMetadataDistributor *)self marketplaceDomain];
  uint64_t v27 = (void *)[v26 copyWithZone:a3];
  [v5 setMarketplaceDomain:v27];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStoreMetadataDistributor *)self distributorID];
  [v4 encodeObject:v5 forKey:@"distributorID"];

  uint64_t v6 = [(MIStoreMetadataDistributor *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  v7 = [(MIStoreMetadataDistributor *)self domain];
  [v4 encodeObject:v7 forKey:@"domain"];

  uint64_t v8 = [(MIStoreMetadataDistributor *)self supportPageURL];
  [v4 encodeObject:v8 forKey:@"supportPageURL"];

  v9 = [(MIStoreMetadataDistributor *)self sourceURL];
  [v4 encodeObject:v9 forKey:@"sourceURL"];

  uint64_t v10 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  [v4 encodeObject:v10 forKey:@"localizedDistributorName"];

  id v11 = [(MIStoreMetadataDistributor *)self developerID];
  [v4 encodeObject:v11 forKey:@"developerID"];

  uint64_t v12 = [(MIStoreMetadataDistributor *)self developerName];
  [v4 encodeObject:v12 forKey:@"developerName"];

  v13 = [(MIStoreMetadataDistributor *)self shareURL];
  [v4 encodeObject:v13 forKey:@"shareURL"];

  uint64_t v14 = [(MIStoreMetadataDistributor *)self marketplaceItemID];
  [v4 encodeObject:v14 forKey:@"marketplaceItemID"];

  id v15 = [(MIStoreMetadataDistributor *)self marketplaceDomain];
  [v4 encodeObject:v15 forKey:@"marketplaceDomain"];
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(MIStoreMetadataDistributor *)self distributorID];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:distributorID];
  }

  v5 = [(MIStoreMetadataDistributor *)self accountID];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:accountID];
  }

  uint64_t v6 = [(MIStoreMetadataDistributor *)self domain];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:domain];
  }

  v7 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:localizedDistributorName];
  }

  uint64_t v8 = [(MIStoreMetadataDistributor *)self supportPageURL];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 absoluteString];
    [v3 setObject:v10 forKeyedSubscript:supportPageURL];
  }
  id v11 = [(MIStoreMetadataDistributor *)self sourceURL];
  uint64_t v12 = v11;
  if (v11)
  {
    v13 = [v11 absoluteString];
    [v3 setObject:v13 forKeyedSubscript:sourceURL];
  }
  uint64_t v14 = [(MIStoreMetadataDistributor *)self developerID];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:developerID];
  }

  id v15 = [(MIStoreMetadataDistributor *)self developerName];
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:developerName];
  }

  id v16 = [(MIStoreMetadataDistributor *)self shareURL];
  uint64_t v17 = v16;
  if (v16)
  {
    v18 = [v16 absoluteString];
    [v3 setObject:v18 forKeyedSubscript:shareURL];
  }
  uint64_t v19 = [(MIStoreMetadataDistributor *)self marketplaceItemID];
  if (v19) {
    [v3 setObject:v19 forKeyedSubscript:marketplaceItemID];
  }

  uint64_t v20 = [(MIStoreMetadataDistributor *)self marketplaceDomain];
  if (v20) {
    [v3 setObject:v20 forKeyedSubscript:marketplaceDomain];
  }

  uint64_t v21 = (void *)[v3 copy];
  return (NSDictionary *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStoreMetadataDistributor *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MIStoreMetadataDistributor *)self distributorID];
      v7 = [(MIStoreMetadataDistributor *)v5 distributorID];
      if (MICompareObjects(v6, v7))
      {
        uint64_t v8 = [(MIStoreMetadataDistributor *)self accountID];
        v9 = [(MIStoreMetadataDistributor *)v5 accountID];
        if (MICompareObjects(v8, v9))
        {
          uint64_t v10 = [(MIStoreMetadataDistributor *)self domain];
          id v11 = [(MIStoreMetadataDistributor *)v5 domain];
          if (MICompareObjects(v10, v11))
          {
            uint64_t v12 = [(MIStoreMetadataDistributor *)self supportPageURL];
            v37 = [(MIStoreMetadataDistributor *)v5 supportPageURL];
            v38 = v12;
            if (MICompareObjects(v12, v37))
            {
              v13 = [(MIStoreMetadataDistributor *)self sourceURL];
              v35 = [(MIStoreMetadataDistributor *)v5 sourceURL];
              v36 = v13;
              if (MICompareObjects(v13, v35))
              {
                uint64_t v14 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
                uint64_t v33 = [(MIStoreMetadataDistributor *)v5 localizedDistributorName];
                v34 = v14;
                if (MICompareObjects(v14, v33))
                {
                  id v15 = [(MIStoreMetadataDistributor *)self developerID];
                  v31 = [(MIStoreMetadataDistributor *)v5 developerID];
                  uint64_t v32 = v15;
                  if (MICompareObjects(v15, v31))
                  {
                    id v16 = [(MIStoreMetadataDistributor *)self developerName];
                    uint64_t v29 = [(MIStoreMetadataDistributor *)v5 developerName];
                    v30 = v16;
                    if (MICompareObjects(v16, v29))
                    {
                      uint64_t v17 = [(MIStoreMetadataDistributor *)self shareURL];
                      uint64_t v27 = [(MIStoreMetadataDistributor *)v5 shareURL];
                      v28 = v17;
                      if (MICompareObjects(v17, v27))
                      {
                        uint64_t v18 = [(MIStoreMetadataDistributor *)self marketplaceItemID];
                        uint64_t v19 = [(MIStoreMetadataDistributor *)v5 marketplaceItemID];
                        id v26 = (void *)v18;
                        uint64_t v20 = (void *)v18;
                        uint64_t v21 = v19;
                        if (MICompareObjects(v20, v19))
                        {
                          uint64_t v25 = [(MIStoreMetadataDistributor *)self marketplaceDomain];
                          v24 = [(MIStoreMetadataDistributor *)v5 marketplaceDomain];
                          BOOL v22 = MICompareObjects(v25, v24);
                        }
                        else
                        {
                          BOOL v22 = 0;
                        }
                      }
                      else
                      {
                        BOOL v22 = 0;
                      }
                    }
                    else
                    {
                      BOOL v22 = 0;
                    }
                  }
                  else
                  {
                    BOOL v22 = 0;
                  }
                }
                else
                {
                  BOOL v22 = 0;
                }
              }
              else
              {
                BOOL v22 = 0;
              }
            }
            else
            {
              BOOL v22 = 0;
            }
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v25 = [(MIStoreMetadataDistributor *)self distributorID];
  uint64_t v3 = [v25 hash];
  v24 = [(MIStoreMetadataDistributor *)self accountID];
  uint64_t v4 = [v24 hash] ^ v3;
  uint64_t v23 = [(MIStoreMetadataDistributor *)self domain];
  uint64_t v5 = [v23 hash];
  uint64_t v6 = [(MIStoreMetadataDistributor *)self supportPageURL];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  uint64_t v8 = [(MIStoreMetadataDistributor *)self sourceURL];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = [(MIStoreMetadataDistributor *)self developerID];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  uint64_t v14 = [(MIStoreMetadataDistributor *)self developerName];
  uint64_t v15 = [v14 hash];
  id v16 = [(MIStoreMetadataDistributor *)self shareURL];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = [(MIStoreMetadataDistributor *)self marketplaceItemID];
  uint64_t v19 = v17 ^ [v18 hash];
  uint64_t v20 = [(MIStoreMetadataDistributor *)self marketplaceDomain];
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (id)description
{
  v2 = [(MIStoreMetadataDistributor *)self dictionaryRepresentation];
  uint64_t v3 = [v2 description];

  return v3;
}

- (unint64_t)distributorType
{
  v2 = [(MIStoreMetadataDistributor *)self distributorID];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"com.apple.AppStore"])
    {
      unint64_t v4 = 1;
    }
    else if ([v3 isEqualToString:@"com.apple.TestFlight"])
    {
      unint64_t v4 = 2;
    }
    else
    {
      unint64_t v4 = -1;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)distributorIsFirstPartyApple
{
  return [(MIStoreMetadataDistributor *)self distributorType] - 1 < 2;
}

- (BOOL)distributorIsThirdParty
{
  return [(MIStoreMetadataDistributor *)self distributorType] == -1;
}

- (NSString)distributorNameForCurrentLocale
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  unint64_t v4 = [(MIStoreMetadataDistributor *)self localizedDistributorName];
  uint64_t v5 = [v4 allKeys];

  if (![v5 count]) {
    goto LABEL_11;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CFArrayRef v6 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v5, 0);
  uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11)
        {
          uint64_t v12 = (void *)v11;

          goto LABEL_13;
        }
      }
      uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = [v3 objectForKeyedSubscript:&stru_1F16FEFE8];

  if (!v12)
  {
LABEL_11:
    uint64_t v12 = [(MIStoreMetadataDistributor *)self distributorID];
  }
LABEL_13:

  return (NSString *)v12;
}

- (NSString)distributorID
{
  return self->_distributorID;
}

- (void)setDistributorID:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSURL)supportPageURL
{
  return self->_supportPageURL;
}

- (void)setSupportPageURL:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSDictionary)localizedDistributorName
{
  return self->_localizedDistributorName;
}

- (void)setLocalizedDistributorName:(id)a3
{
}

- (NSString)developerID
{
  return self->_developerID;
}

- (void)setDeveloperID:(id)a3
{
}

- (NSString)developerName
{
  return self->_developerName;
}

- (void)setDeveloperName:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSNumber)marketplaceItemID
{
  return self->_marketplaceItemID;
}

- (void)setMarketplaceItemID:(id)a3
{
}

- (NSString)marketplaceDomain
{
  return self->_marketplaceDomain;
}

- (void)setMarketplaceDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marketplaceDomain, 0);
  objc_storeStrong((id *)&self->_marketplaceItemID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_developerID, 0);
  objc_storeStrong((id *)&self->_localizedDistributorName, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_supportPageURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
}

@end