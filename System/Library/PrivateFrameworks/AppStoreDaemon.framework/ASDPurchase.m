@interface ASDPurchase
+ (BOOL)supportsSecureCoding;
- (ASDPurchase)init;
- (ASDPurchase)initWithCoder:(id)a3;
- (BOOL)createsJobs;
- (BOOL)displaysOnLockScreen;
- (BOOL)forceWatchInstall;
- (BOOL)installUniversalVariant;
- (BOOL)isBackgroundUpdate;
- (BOOL)isCompatibilityUpdate;
- (BOOL)isDSIDLess;
- (BOOL)isDefaultBrowser;
- (BOOL)isIOSBinaryMacOSCompatible;
- (BOOL)isRedownload;
- (BOOL)isRefresh;
- (BOOL)isUpdate;
- (BOOL)sendGUID;
- (BOOL)shouldCancelForInstalledBundleItems;
- (NSArray)appCapabilities;
- (NSArray)gratisIdentifiers;
- (NSArray)requiredCapabilities;
- (NSDictionary)additionalHeaders;
- (NSDictionary)metricsOverlay;
- (NSNumber)accountIdentifier;
- (NSNumber)itemID;
- (NSNumber)ownerDSID;
- (NSNumber)purchaserDSID;
- (NSString)affiliateIdentifier;
- (NSString)bagKey;
- (NSString)bundleID;
- (NSString)buyParameters;
- (NSString)clientID;
- (NSString)downloadVolume;
- (NSString)installVolume;
- (NSString)itemName;
- (NSString)preflightURLString;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (NSString)referrerName;
- (NSString)referrerURL;
- (NSString)vendorName;
- (NSXPCListenerEndpoint)paymentViewServiceListener;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstValueForBuyParameter:(id)a3;
- (int64_t)extensionsToEnable;
- (int64_t)purchaseID;
- (int64_t)softwarePlatform;
- (void)appendValue:(id)a3 forBuyParameter:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAppCapabilities:(id)a3;
- (void)setBagKey:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setClientID:(id)a3;
- (void)setCreatesJobs:(BOOL)a3;
- (void)setDisplaysOnLockScreen:(BOOL)a3;
- (void)setDownloadVolume:(id)a3;
- (void)setExtensionsToEnable:(int64_t)a3;
- (void)setForceWatchInstall:(BOOL)a3;
- (void)setGratisIdentifiers:(id)a3;
- (void)setIOSBinaryMacOSCompatible:(BOOL)a3;
- (void)setInstallUniversalVariant:(BOOL)a3;
- (void)setInstallVolume:(id)a3;
- (void)setIsBackgroundUpdate:(BOOL)a3;
- (void)setIsCompatibilityUpdate:(BOOL)a3;
- (void)setIsDSIDLess:(BOOL)a3;
- (void)setIsDefaultBrowser:(BOOL)a3;
- (void)setIsRedownload:(BOOL)a3;
- (void)setIsRefresh:(BOOL)a3;
- (void)setIsUpdate:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setOwnerDSID:(id)a3;
- (void)setPaymentViewServiceListener:(id)a3;
- (void)setPreflightURLString:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPurchaseID:(int64_t)a3;
- (void)setPurchaserDSID:(id)a3;
- (void)setReferrerName:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setSendGUID:(BOOL)a3;
- (void)setShouldCancelForInstalledBundleItems:(BOOL)a3;
- (void)setSoftwarePlatform:(int64_t)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ASDPurchase

- (ASDPurchase)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASDPurchase;
  result = [(ASDPurchase *)&v3 init];
  if (result)
  {
    result->_createsJobs = 1;
    result->_softwarePlatform = 1;
  }
  return result;
}

- (NSString)buyParameters
{
  if (self->_buyParameters)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v3 setQueryItems:self->_buyParameters];
    v4 = [v3 percentEncodedQuery];
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setBuyParameters:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F29088]);
    [(NSArray *)v4 setPercentEncodedQuery:v7];
    v5 = [(NSArray *)v4 queryItems];
    buyParameters = self->_buyParameters;
    self->_buyParameters = v5;
  }
  else
  {
    v4 = self->_buyParameters;
    self->_buyParameters = 0;
  }
}

- (void)appendValue:(id)a3 forBuyParameter:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F290C8];
  id v7 = a4;
  id v8 = a3;
  id v12 = (id)[[v6 alloc] initWithName:v7 value:v8];

  buyParameters = self->_buyParameters;
  if (buyParameters) {
    [(NSArray *)buyParameters arrayByAddingObject:v12];
  }
  else {
  v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
  }
  v11 = self->_buyParameters;
  self->_buyParameters = v10;
}

- (id)firstValueForBuyParameter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_buyParameters;
  v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          v6 = [v9 value];
          goto LABEL_11;
        }
      }
      v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDPurchase allocWithZone:](ASDPurchase, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSNumber *)v6;

  uint64_t v8 = [(NSDictionary *)self->_additionalHeaders copyWithZone:a3];
  additionalHeaders = v5->_additionalHeaders;
  v5->_additionalHeaders = (NSDictionary *)v8;

  uint64_t v10 = [(NSString *)self->_affiliateIdentifier copyWithZone:a3];
  affiliateIdentifier = v5->_affiliateIdentifier;
  v5->_affiliateIdentifier = (NSString *)v10;

  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_appCapabilities, 1);
  appCapabilities = v5->_appCapabilities;
  v5->_appCapabilities = (NSArray *)v12;

  uint64_t v14 = [(NSString *)self->_bagKey copyWithZone:a3];
  bagKey = v5->_bagKey;
  v5->_bagKey = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  uint64_t v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_buyParameters, 1);
  buyParameters = v5->_buyParameters;
  v5->_buyParameters = (NSArray *)v18;

  uint64_t v20 = [(NSString *)self->_clientID copyWithZone:a3];
  clientID = v5->_clientID;
  v5->_clientID = (NSString *)v20;

  v5->_createsJobs = self->_createsJobs;
  v5->_isDefaultBrowser = self->_isDefaultBrowser;
  v5->_displaysOnLockScreen = self->_displaysOnLockScreen;
  v5->_extensionsToEnable = self->_extensionsToEnable;
  v5->_forceWatchInstall = self->_forceWatchInstall;
  uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_gratisIdentifiers, 1);
  gratisIdentifiers = v5->_gratisIdentifiers;
  v5->_gratisIdentifiers = (NSArray *)v22;

  v5->_isBackgroundUpdate = self->_isBackgroundUpdate;
  v5->_isDSIDLess = self->_isDSIDLess;
  v5->_isRedownload = self->_isRedownload;
  v5->_isRefresh = self->_isRefresh;
  v5->_isUpdate = self->_isUpdate;
  uint64_t v24 = [(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v24;

  uint64_t v26 = [(NSString *)self->_itemName copyWithZone:a3];
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v26;

  uint64_t v28 = [(NSDictionary *)self->_metricsOverlay copyWithZone:a3];
  metricsOverlay = v5->_metricsOverlay;
  v5->_metricsOverlay = (NSDictionary *)v28;

  v5->_purchaseID = self->_purchaseID;
  uint64_t v30 = [(NSString *)self->_presentingSceneBundleIdentifier copyWithZone:a3];
  presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
  v5->_presentingSceneBundleIdentifier = (NSString *)v30;

  uint64_t v32 = [(NSString *)self->_presentingSceneIdentifier copyWithZone:a3];
  presentingSceneIdentifier = v5->_presentingSceneIdentifier;
  v5->_presentingSceneIdentifier = (NSString *)v32;

  uint64_t v34 = [(NSString *)self->_referrerName copyWithZone:a3];
  referrerName = v5->_referrerName;
  v5->_referrerName = (NSString *)v34;

  uint64_t v36 = [(NSString *)self->_referrerURL copyWithZone:a3];
  referrerURL = v5->_referrerURL;
  v5->_referrerURL = (NSString *)v36;

  v5->_sendGUID = self->_sendGUID;
  v5->_softwarePlatform = self->_softwarePlatform;
  uint64_t v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_requiredCapabilities, 1);
  requiredCapabilities = v5->_requiredCapabilities;
  v5->_requiredCapabilities = (NSArray *)v38;

  v5->_shouldCancelForInstalledBundleItems = self->_shouldCancelForInstalledBundleItems;
  uint64_t v40 = [(NSString *)self->_vendorName copyWithZone:a3];
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v40;

  uint64_t v42 = [(NSString *)self->_preflightURLString copyWithZone:a3];
  preflightURLString = v5->_preflightURLString;
  v5->_preflightURLString = (NSString *)v42;

  v5->_installUniversalVariant = self->_installUniversalVariant;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPurchase *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"additionalHeaders"];
    additionalHeaders = v5->_additionalHeaders;
    v5->_additionalHeaders = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"affiliateIdentifier"];
    affiliateIdentifier = v5->_affiliateIdentifier;
    v5->_affiliateIdentifier = (NSString *)v13;

    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"appCapabilities"];
    appCapabilities = v5->_appCapabilities;
    v5->_appCapabilities = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bagKey"];
    bagKey = v5->_bagKey;
    v5->_bagKey = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v22;

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"buyParameters"];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v29;

    v5->_createsJobs = [v4 decodeBoolForKey:@"createsJobs"];
    v5->_isDefaultBrowser = [v4 decodeBoolForKey:@"isDefaultBrowser"];
    v5->_displaysOnLockScreen = [v4 decodeBoolForKey:@"displaysOnLockScreen"];
    v5->_extensionsToEnable = [v4 decodeIntegerForKey:@"extensionsToEnable"];
    v5->_forceWatchInstall = [v4 decodeBoolForKey:@"forceWatchInstall"];
    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"gratisIdentifiers"];
    gratisIdentifiers = v5->_gratisIdentifiers;
    v5->_gratisIdentifiers = (NSArray *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v36;

    v5->_isBackgroundUpdate = [v4 decodeBoolForKey:@"isBackgroundUpdate"];
    v5->_isDSIDLess = [v4 decodeBoolForKey:@"isDSIDless"];
    v5->_isRedownload = [v4 decodeBoolForKey:@"isRedownload"];
    v5->_isRefresh = [v4 decodeBoolForKey:@"isRefresh"];
    v5->_isUpdate = [v4 decodeBoolForKey:@"isUpdate"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v38;

    uint64_t v40 = objc_msgSend(v4, "asd_decodeJSONDictionaryForKey:", @"metricsOverlay");
    metricsOverlay = v5->_metricsOverlay;
    v5->_metricsOverlay = (NSDictionary *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneBundleIdentifier"];
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneIdentifier"];
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v44;

    v5->_purchaseID = [v4 decodeInt64ForKey:@"purchaseID"];
    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerName"];
    referrerName = v5->_referrerName;
    v5->_referrerName = (NSString *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerURL"];
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSString *)v48;

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"requiredCapabilities"];
    requiredCapabilities = v5->_requiredCapabilities;
    v5->_requiredCapabilities = (NSArray *)v53;

    v5->_sendGUID = [v4 decodeBoolForKey:@"sendGUID"];
    v5->_shouldCancelForInstalledBundleItems = [v4 decodeBoolForKey:@"shouldCancelForInstalledBundleItems"];
    v5->_softwarePlatform = [v4 decodeIntegerForKey:@"softwarePlatform"];
    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preflightURL"];
    preflightURLString = v5->_preflightURLString;
    v5->_preflightURLString = (NSString *)v57;

    v5->_installUniversalVariant = [v4 decodeBoolForKey:@"installUniversalVariant"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_additionalHeaders forKey:@"additionalHeaders"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_affiliateIdentifier forKey:@"affiliateIdentifier"];
  [v5 encodeObject:self->_appCapabilities forKey:@"appCapabilities"];
  [v5 encodeObject:self->_bagKey forKey:@"bagKey"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_buyParameters forKey:@"buyParameters"];
  [v5 encodeObject:self->_clientID forKey:@"clientID"];
  [v5 encodeBool:self->_createsJobs forKey:@"createsJobs"];
  [v5 encodeBool:self->_displaysOnLockScreen forKey:@"displaysOnLockScreen"];
  [v5 encodeInteger:self->_extensionsToEnable forKey:@"extensionsToEnable"];
  [v5 encodeBool:self->_forceWatchInstall forKey:@"forceWatchInstall"];
  [v5 encodeObject:self->_gratisIdentifiers forKey:@"gratisIdentifiers"];
  [v5 encodeBool:self->_isBackgroundUpdate forKey:@"isBackgroundUpdate"];
  [v5 encodeBool:self->_isDSIDLess forKey:@"isDSIDless"];
  [v5 encodeBool:self->_isDefaultBrowser forKey:@"isDefaultBrowser"];
  [v5 encodeBool:self->_isRedownload forKey:@"isRedownload"];
  [v5 encodeBool:self->_isRefresh forKey:@"isRefresh"];
  [v5 encodeBool:self->_isUpdate forKey:@"isUpdate"];
  [v5 encodeObject:self->_itemID forKey:@"itemID"];
  [v5 encodeObject:self->_itemName forKey:@"itemName"];
  [v5 encodeObject:self->_presentingSceneBundleIdentifier forKey:@"presentingSceneBundleIdentifier"];
  [v5 encodeObject:self->_presentingSceneIdentifier forKey:@"presentingSceneIdentifier"];
  [v5 encodeInt64:self->_purchaseID forKey:@"purchaseID"];
  [v5 encodeObject:self->_referrerName forKey:@"referrerName"];
  [v5 encodeObject:self->_referrerURL forKey:@"referrerURL"];
  [v5 encodeObject:self->_requiredCapabilities forKey:@"requiredCapabilities"];
  [v5 encodeBool:self->_sendGUID forKey:@"sendGUID"];
  [v5 encodeBool:self->_shouldCancelForInstalledBundleItems forKey:@"shouldCancelForInstalledBundleItems"];
  [v5 encodeInteger:self->_softwarePlatform forKey:@"softwarePlatform"];
  [v5 encodeObject:self->_vendorName forKey:@"vendorName"];
  [v5 encodeObject:self->_preflightURLString forKey:@"preflightURL"];
  [v5 encodeBool:self->_installUniversalVariant forKey:@"installUniversalVariant"];
  metricsOverlay = self->_metricsOverlay;
  if (metricsOverlay) {
    objc_msgSend(v5, "asd_encodeJSONDictionary:forKey:", metricsOverlay, @"metricsOverlay");
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@]: bundleID: %@ accountID: %@ bagKey: %@ buyParams: %@ extensionsToEnable: %lu isBackgroundUpdate: %d isRedownload: %d isUpdate: %d itemID: %@ itemName: %@ purchaseID: %lld vendorName: %@ softwarePlatform: %ld]", objc_opt_class(), self->_bundleID, self->_accountIdentifier, self->_bagKey, self->_buyParameters, self->_extensionsToEnable, self->_isBackgroundUpdate, self->_isRedownload, self->_isUpdate, self->_itemID, self->_itemName, self->_purchaseID, self->_vendorName, self->_softwarePlatform];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (void)setAffiliateIdentifier:(id)a3
{
}

- (NSArray)appCapabilities
{
  return self->_appCapabilities;
}

- (void)setAppCapabilities:(id)a3
{
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (BOOL)createsJobs
{
  return self->_createsJobs;
}

- (void)setCreatesJobs:(BOOL)a3
{
  self->_createsJobs = a3;
}

- (BOOL)isDefaultBrowser
{
  return self->_isDefaultBrowser;
}

- (void)setIsDefaultBrowser:(BOOL)a3
{
  self->_isDefaultBrowser = a3;
}

- (BOOL)displaysOnLockScreen
{
  return self->_displaysOnLockScreen;
}

- (void)setDisplaysOnLockScreen:(BOOL)a3
{
  self->_displaysOnLockScreen = a3;
}

- (NSString)downloadVolume
{
  return self->_downloadVolume;
}

- (void)setDownloadVolume:(id)a3
{
}

- (int64_t)extensionsToEnable
{
  return self->_extensionsToEnable;
}

- (void)setExtensionsToEnable:(int64_t)a3
{
  self->_extensionsToEnable = a3;
}

- (BOOL)forceWatchInstall
{
  return self->_forceWatchInstall;
}

- (void)setForceWatchInstall:(BOOL)a3
{
  self->_forceWatchInstall = a3;
}

- (NSArray)gratisIdentifiers
{
  return self->_gratisIdentifiers;
}

- (void)setGratisIdentifiers:(id)a3
{
}

- (NSString)installVolume
{
  return self->_installVolume;
}

- (void)setInstallVolume:(id)a3
{
}

- (BOOL)isIOSBinaryMacOSCompatible
{
  return self->_iOSBinaryMacOSCompatible;
}

- (void)setIOSBinaryMacOSCompatible:(BOOL)a3
{
  self->_iOSBinaryMacOSCompatible = a3;
}

- (BOOL)isDSIDLess
{
  return self->_isDSIDLess;
}

- (void)setIsDSIDLess:(BOOL)a3
{
  self->_isDSIDLess = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void)setIsUpdate:(BOOL)a3
{
  self->_isUpdate = a3;
}

- (BOOL)isBackgroundUpdate
{
  return self->_isBackgroundUpdate;
}

- (void)setIsBackgroundUpdate:(BOOL)a3
{
  self->_isBackgroundUpdate = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
}

- (NSXPCListenerEndpoint)paymentViewServiceListener
{
  return self->_paymentViewServiceListener;
}

- (void)setPaymentViewServiceListener:(id)a3
{
}

- (NSString)referrerName
{
  return self->_referrerName;
}

- (void)setReferrerName:(id)a3
{
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (BOOL)isRedownload
{
  return self->_isRedownload;
}

- (void)setIsRedownload:(BOOL)a3
{
  self->_isRedownload = a3;
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (int64_t)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(int64_t)a3
{
  self->_purchaseID = a3;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (BOOL)shouldCancelForInstalledBundleItems
{
  return self->_shouldCancelForInstalledBundleItems;
}

- (void)setShouldCancelForInstalledBundleItems:(BOOL)a3
{
  self->_shouldCancelForInstalledBundleItems = a3;
}

- (NSString)preflightURLString
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPreflightURLString:(id)a3
{
}

- (BOOL)installUniversalVariant
{
  return self->_installUniversalVariant;
}

- (void)setInstallUniversalVariant:(BOOL)a3
{
  self->_installUniversalVariant = a3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (BOOL)isCompatibilityUpdate
{
  return self->_isCompatibilityUpdate;
}

- (void)setIsCompatibilityUpdate:(BOOL)a3
{
  self->_isCompatibilityUpdate = a3;
}

- (BOOL)isRefresh
{
  return self->_isRefresh;
}

- (void)setIsRefresh:(BOOL)a3
{
  self->_isRefresh = a3;
}

- (NSNumber)ownerDSID
{
  return self->_ownerDSID;
}

- (void)setOwnerDSID:(id)a3
{
}

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(id)a3
{
}

- (BOOL)sendGUID
{
  return self->_sendGUID;
}

- (void)setSendGUID:(BOOL)a3
{
  self->_sendGUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_ownerDSID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_preflightURLString, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referrerName, 0);
  objc_storeStrong((id *)&self->_paymentViewServiceListener, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_installVolume, 0);
  objc_storeStrong((id *)&self->_gratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_downloadVolume, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong((id *)&self->_appCapabilities, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end