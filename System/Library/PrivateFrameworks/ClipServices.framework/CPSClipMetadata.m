@interface CPSClipMetadata
+ (BOOL)supportsSecureCoding;
+ (id)fullAppOnlyClipBundleIDs;
- (BOOL)_preferAMPDefaultNameAndCaptionForCurrentLocale;
- (BOOL)canUpdateOnPhysicalInovcation;
- (BOOL)canUpdateOnPhysicalInvocation;
- (BOOL)clipIncompatibleWithCurrentDevice;
- (BOOL)clipRequestsLocationConfirmationPermission;
- (BOOL)clipRequestsNotificationPermission;
- (BOOL)deviceCapabilitiesDontMatch;
- (BOOL)fullAppOnly;
- (BOOL)hasAppMetadata;
- (BOOL)hasBusinessItemMetadata;
- (BOOL)hasFullAppInstalledOnSystem;
- (BOOL)hasUpToDateVersionInstalledOnSystemIsPlaceholder:(BOOL *)a3;
- (BOOL)hasValidAssociatedDomainsToLaunchAppClip;
- (BOOL)isDeveloperOverride;
- (BOOL)isExpired;
- (BOOL)isPhysicalInvocationAllowed;
- (BOOL)isPoweredByThirdParty;
- (CPSClipInvocationPolicy)invocationPolicy;
- (CPSClipMetadata)initWithBusinessItem:(id)a3;
- (CPSClipMetadata)initWithCoder:(id)a3;
- (CPSClipMetadata)initWithDemoBundleURL:(id)a3;
- (CPSClipMetadata)initWithDeveloperOverride:(id)a3 invocationURL:(id)a4;
- (CPSClipMetadata)initWithDictionary:(id)a3 bundleURL:(id)a4;
- (CPSClipMetadata)initWithUncheckedDictionary:(id)a3;
- (NSArray)clipVerifiedAssociatedDomains;
- (NSArray)test_clipVerifiedAssociatedDomains;
- (NSArray)test_mocProductVariants;
- (NSDate)expirationDate;
- (NSDictionary)amsDictionary;
- (NSDictionary)clipBusinessIconStyleAttributes;
- (NSNumber)clipMapItemMUID;
- (NSNumber)clipSize;
- (NSNumber)itemID;
- (NSString)bundleDisplayName;
- (NSString)buyParams;
- (NSString)clipBundleID;
- (NSString)clipCaption;
- (NSString)clipMinimumOSVersion;
- (NSString)clipName;
- (NSString)clipOpenButtonTitle;
- (NSString)clipURLHash;
- (NSString)fullAppBundleID;
- (NSString)fullAppCachedIconFilePath;
- (NSString)fullAppCaption;
- (NSString)fullAppContentRating;
- (NSString)fullAppName;
- (NSString)fullAppShortName;
- (NSString)localizedSubtitleForClipSuggestion;
- (NSString)localizedTitleForClipSuggestion;
- (NSString)provider;
- (NSString)test_mocProductVersion;
- (NSString)webClipID;
- (NSURL)clipBusinessIconURL;
- (NSURL)clipHeroImageURL;
- (NSURL)clipIpaURL;
- (NSURL)clipLaunchURL;
- (NSURL)clipRequestURL;
- (NSURL)clipTargetURL;
- (NSURL)clipURL;
- (NSURL)fullAppIconURL;
- (NSURL)fullAppStoreURL;
- (id)_itemIDFromAppURLString:(id)a3;
- (id)_thinnedSizeWithVariantsInfo:(id)a3;
- (id)_thinnedSizeWithVariantsInfo:(id)a3 productVariants:(id)a4 productVersion:(id)a5;
- (id)description;
- (int64_t)clipAction;
- (unint64_t)clipVersionIdentifier;
- (void)_updateInvocationPolicy:(id)a3;
- (void)_updateWithAMSMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hasValidAssociatedDomainsToLaunchAppClip;
- (void)setAmsDictionary:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setClipBundleID:(id)a3;
- (void)setClipIncompatibleWithCurrentDevice:(BOOL)a3;
- (void)setClipIpaURL:(id)a3;
- (void)setClipRequestURL:(id)a3;
- (void)setClipSize:(id)a3;
- (void)setClipURL:(id)a3;
- (void)setClipURLHash:(id)a3;
- (void)setClipVersionIdentifier:(unint64_t)a3;
- (void)setDeviceCapabilitiesDontMatch:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFullAppBundleID:(id)a3;
- (void)setFullAppCachedIconFilePath:(id)a3;
- (void)setFullAppCaption:(id)a3;
- (void)setFullAppContentRating:(id)a3;
- (void)setFullAppIconURL:(id)a3;
- (void)setFullAppName:(id)a3;
- (void)setFullAppOnly:(BOOL)a3;
- (void)setFullAppShortName:(id)a3;
- (void)setFullAppStoreURL:(id)a3;
- (void)setInvocationPolicy:(id)a3;
- (void)setItemID:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTest_clipVerifiedAssociatedDomains:(id)a3;
- (void)setTest_mocProductVariants:(id)a3;
- (void)setTest_mocProductVersion:(id)a3;
- (void)setWebClipID:(id)a3;
- (void)updateWithStoreClipMetadata:(id)a3;
- (void)updateWithStoreParentAppMetadata:(id)a3;
@end

@implementation CPSClipMetadata

- (NSString)localizedTitleForClipSuggestion
{
  v3 = [(CPSClipMetadata *)self clipName];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(CPSClipMetadata *)self fullAppName];
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)localizedSubtitleForClipSuggestion
{
  if ([(CPSClipMetadata *)self isPoweredByThirdParty])
  {
    v3 = [(CPSClipMetadata *)self fullAppName];
    id v4 = +[CPSUtilities poweredByCaptionForAppName:v3];
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  v3 = [(CPSClipMetadata *)self clipCaption];
  if ([v3 length])
  {
    id v4 = v3;
    v3 = v4;
    goto LABEL_5;
  }
  uint64_t v6 = [(CPSClipMetadata *)self fullAppCaption];
  v7 = (void *)v6;
  v8 = &stru_26C629F40;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v5 = v8;

LABEL_9:

  return (NSString *)v5;
}

- (CPSClipMetadata)initWithDemoBundleURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSClipMetadata;
  v5 = [(CPSClipMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = [v4 URLByAppendingPathComponent:@"Info.json"];
    v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7];
    if ([v8 length])
    {
      uint64_t v12 = 0;
      v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v12];
      if (v12)
      {
        v10 = 0;
      }
      else
      {
        uint64_t v6 = [(CPSClipMetadata *)v6 initWithDictionary:v9 bundleURL:v4];
        v10 = v6;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CPSClipMetadata)initWithDictionary:(id)a3 bundleURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v7 mutableCopy];
  v9 = objc_msgSend(v7, "safari_stringForKey:", @"abrClipHeroImage");
  v10 = [v6 URLByAppendingPathComponent:v9];
  [v8 setObject:v10 forKeyedSubscript:@"abrClipHeroImage"];

  v11 = objc_msgSend(v7, "safari_stringForKey:", @"storeClipHeroImage");
  uint64_t v12 = [v6 URLByAppendingPathComponent:v11];
  [v8 setObject:v12 forKeyedSubscript:@"storeClipHeroImage"];

  objc_super v13 = objc_msgSend(v7, "safari_stringForKey:", @"fullAppIconURL");

  v14 = [v6 URLByAppendingPathComponent:v13];

  [v8 setObject:v14 forKeyedSubscript:@"fullAppIconURL"];
  v15 = [(CPSClipMetadata *)self initWithUncheckedDictionary:v8];

  return v15;
}

- (CPSClipMetadata)initWithUncheckedDictionary:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)CPSClipMetadata;
  v5 = [(CPSClipMetadata *)&v65 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_stringForKey:", @"abrClipName");
    abrClipName = v5->_abrClipName;
    v5->_abrClipName = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "safari_stringForKey:", @"abrClipCaption");
    abrClipCaption = v5->_abrClipCaption;
    v5->_abrClipCaption = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "safari_URLForKey:", @"abrClipHeroImage");
    abrClipHeroImageURL = v5->_abrClipHeroImageURL;
    v5->_abrClipHeroImageURL = (NSURL *)v10;

    uint64_t v12 = objc_msgSend(v4, "safari_numberForKey:", @"abrClipAction");
    v5->_clipAction = [v12 integerValue];

    uint64_t v13 = objc_msgSend(v4, "safari_stringForKey:", @"storeClipName");
    storeClipName = v5->_storeClipName;
    v5->_storeClipName = (NSString *)v13;

    uint64_t v15 = objc_msgSend(v4, "safari_stringForKey:", @"storeClipCaption");
    storeClipCaption = v5->_storeClipCaption;
    v5->_storeClipCaption = (NSString *)v15;

    uint64_t v17 = objc_msgSend(v4, "safari_URLForKey:", @"storeClipHeroImage");
    storeClipHeroImageURL = v5->_storeClipHeroImageURL;
    v5->_storeClipHeroImageURL = (NSURL *)v17;

    uint64_t v19 = objc_msgSend(v4, "safari_stringForKey:", @"clipBundleID");
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v19;

    v5->_clipIncompatibleWithCurrentDevice = objc_msgSend(v4, "safari_BOOLForKey:", @"clipIncompatibleWithCurrentDevice");
    uint64_t v21 = objc_msgSend(v4, "safari_URLForKey:", @"clipBusinessIconURL");
    clipBusinessIconURL = v5->_clipBusinessIconURL;
    v5->_clipBusinessIconURL = (NSURL *)v21;

    uint64_t v23 = objc_msgSend(v4, "safari_dictionaryForKey:", @"clipBusinessIconStyleAttributes");
    clipBusinessIconStyleAttributes = v5->_clipBusinessIconStyleAttributes;
    v5->_clipBusinessIconStyleAttributes = (NSDictionary *)v23;

    uint64_t v25 = objc_msgSend(v4, "safari_numberForKey:", @"clipMapItemMUID");
    clipMapItemMUID = v5->_clipMapItemMUID;
    v5->_clipMapItemMUID = (NSNumber *)v25;

    v27 = NSURL;
    v28 = objc_msgSend(v4, "safari_stringForKey:", @"clipIpaURL");
    uint64_t v29 = [v27 URLWithString:v28];
    clipIpaURL = v5->_clipIpaURL;
    v5->_clipIpaURL = (NSURL *)v29;

    v5->_clipRequestsNotificationPermission = objc_msgSend(v4, "safari_BOOLForKey:", @"clipRequestsNotificationPermission");
    v5->_clipRequestsLocationConfirmationPermission = objc_msgSend(v4, "safari_BOOLForKey:", @"clipRequestsLocationConfirmationPermission");
    uint64_t v31 = objc_msgSend(v4, "safari_URLForKey:", @"clipURL");
    clipURL = v5->_clipURL;
    v5->_clipURL = (NSURL *)v31;

    uint64_t v33 = objc_msgSend(v4, "safari_URLForKey:", @"clipRequestURL");
    clipRequestURL = v5->_clipRequestURL;
    v5->_clipRequestURL = (NSURL *)v33;

    uint64_t v35 = objc_msgSend(v4, "safari_URLForKey:", @"clipTargetURL");
    clipTargetURL = v5->_clipTargetURL;
    v5->_clipTargetURL = (NSURL *)v35;

    v5->_hasBusinessItemMetadata = objc_msgSend(v4, "safari_BOOLForKey:", @"hasBusinessItemMetadata");
    v5->_hasAppMetadata = 1;
    v5->_poweredByThirdParty = objc_msgSend(v4, "safari_BOOLForKey:", @"poweredByThirdParty");
    uint64_t v37 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppName");
    fullAppName = v5->_fullAppName;
    v5->_fullAppName = (NSString *)v37;

    uint64_t v39 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppShortName");
    fullAppShortName = v5->_fullAppShortName;
    v5->_fullAppShortName = (NSString *)v39;

    uint64_t v41 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppCaption");
    fullAppCaption = v5->_fullAppCaption;
    v5->_fullAppCaption = (NSString *)v41;

    uint64_t v43 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppContentRating");
    fullAppContentRating = v5->_fullAppContentRating;
    v5->_fullAppContentRating = (NSString *)v43;

    uint64_t v45 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppBundleID");
    fullAppBundleID = v5->_fullAppBundleID;
    v5->_fullAppBundleID = (NSString *)v45;

    v47 = NSURL;
    v48 = objc_msgSend(v4, "safari_stringForKey:", @"fullAppStoreURL");
    uint64_t v49 = [v47 URLWithString:v48];
    fullAppStoreURL = v5->_fullAppStoreURL;
    v5->_fullAppStoreURL = (NSURL *)v49;

    uint64_t v51 = objc_msgSend(v4, "safari_URLForKey:", @"fullAppIconURL");
    fullAppIconURL = v5->_fullAppIconURL;
    v5->_fullAppIconURL = (NSURL *)v51;

    uint64_t v53 = objc_msgSend(v4, "safari_numberForKey:", @"itemID");
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v53;

    uint64_t v55 = objc_msgSend(v4, "safari_stringForKey:", @"webClipID");
    webClipID = v5->_webClipID;
    v5->_webClipID = (NSString *)v55;

    uint64_t v57 = objc_msgSend(v4, "safari_stringForKey:", @"provider");
    provider = v5->_provider;
    v5->_provider = (NSString *)v57;

    uint64_t v59 = objc_msgSend(v4, "safari_arrayForKey:", @"clipVerifiedAssociatedDomains");
    clipVerifiedAssociatedDomains = v5->_clipVerifiedAssociatedDomains;
    v5->_clipVerifiedAssociatedDomains = (NSArray *)v59;

    v5->_deviceCapabilitiesDontMatch = objc_msgSend(v4, "safari_BOOLForKey:", @"deviceCapabilitiesDontMatch");
    v5->_isDeveloperOverride = objc_msgSend(v4, "safari_BOOLForKey:", @"isDeveloperOverride");
    uint64_t v61 = objc_msgSend(v4, "safari_numberForKey:", @"thinnedSize");
    clipSize = v5->_clipSize;
    v5->_clipSize = (NSNumber *)v61;

    v63 = v5;
  }

  return v5;
}

- (CPSClipMetadata)initWithBusinessItem:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CPSClipMetadata;
  v5 = [(CPSClipMetadata *)&v36 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_hasBusinessItemMetadata = 1;
    uint64_t v7 = [v4 title];
    abrClipName = v6->_abrClipName;
    v6->_abrClipName = (NSString *)v7;

    uint64_t v9 = [v4 subtitle];
    abrClipCaption = v6->_abrClipCaption;
    v6->_abrClipCaption = (NSString *)v9;

    v35[0] = (unint64_t)_CPSHeroImagePreferredSize();
    v35[1] = (unint64_t)v11;
    v35[2] = "bb";
    v35[3] = "heic";
    uint64_t v12 = [v4 heroImageURLForSpecifier:v35];
    abrClipHeroImageURL = v6->_abrClipHeroImageURL;
    v6->_abrClipHeroImageURL = (NSURL *)v12;

    if (!v6->_abrClipHeroImageURL)
    {
      uint64_t v14 = [v4 heroImageURL];
      uint64_t v15 = v6->_abrClipHeroImageURL;
      v6->_abrClipHeroImageURL = (NSURL *)v14;
    }
    uint64_t v16 = [v4 action];
    uint64_t v17 = v16 == 2;
    if (v16 == 3) {
      uint64_t v17 = 2;
    }
    if ((unint64_t)(v16 - 4) >= 0xFFFFFFFFFFFFFFFDLL) {
      int64_t v18 = v17;
    }
    else {
      int64_t v18 = 0;
    }
    v6->_clipAction = v18;
    uint64_t v19 = [v4 bundleID];
    clipBundleID = v6->_clipBundleID;
    v6->_clipBundleID = (NSString *)v19;

    uint64_t v21 = [v4 linkURL];
    clipURL = v6->_clipURL;
    v6->_clipURL = (NSURL *)v21;

    uint64_t v23 = [v4 iconImageURL];
    clipBusinessIconURL = v6->_clipBusinessIconURL;
    v6->_clipBusinessIconURL = (NSURL *)v23;

    uint64_t v25 = [v4 redirectURL];
    clipTargetURL = v6->_clipTargetURL;
    v6->_clipTargetURL = (NSURL *)v25;

    uint64_t v27 = [v4 fullHash];
    clipURLHash = v6->_clipURLHash;
    v6->_clipURLHash = (NSString *)v27;

    v6->_poweredByThirdParty = [v4 isPoweredBy];
    uint64_t v29 = [v4 mapIconStyleAttributes];
    clipBusinessIconStyleAttributes = v6->_clipBusinessIconStyleAttributes;
    v6->_clipBusinessIconStyleAttributes = (NSDictionary *)v29;

    uint64_t v31 = [v4 mapItemMUID];
    clipMapItemMUID = v6->_clipMapItemMUID;
    v6->_clipMapItemMUID = (NSNumber *)v31;

    uint64_t v33 = v6;
  }

  return v6;
}

- (CPSClipMetadata)initWithDeveloperOverride:(id)a3 invocationURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CPSClipMetadata;
  uint64_t v8 = [(CPSClipMetadata *)&v32 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clipURL, a4);
    objc_storeStrong((id *)&v9->_clipRequestURL, a4);
    uint64_t v10 = [v6 clipBundleID];
    clipBundleID = v9->_clipBundleID;
    v9->_clipBundleID = (NSString *)v10;

    uint64_t v12 = [v6 title];
    abrClipName = v9->_abrClipName;
    v9->_abrClipName = (NSString *)v12;

    uint64_t v14 = [v6 subtitle];
    abrClipCaption = v9->_abrClipCaption;
    v9->_abrClipCaption = (NSString *)v14;

    v9->_clipAction = [v6 action];
    v9->_isDeveloperOverride = 1;
    uint64_t v16 = [v6 heroImageURL];
    abrClipHeroImageURL = v9->_abrClipHeroImageURL;
    v9->_abrClipHeroImageURL = (NSURL *)v16;

    int64_t v18 = NSURL;
    uint64_t v19 = [v6 invocationURL];
    v20 = [v19 stringByAppendingPathComponent:@"/AppIcon.png"];
    uint64_t v21 = [v18 URLWithString:v20];
    fullAppIconURL = v9->_fullAppIconURL;
    v9->_fullAppIconURL = (NSURL *)v21;

    id v23 = objc_alloc(MEMORY[0x263F01878]);
    v24 = [v6 clipBundleID];
    uint64_t v25 = (void *)[v23 initWithBundleIdentifier:v24 allowPlaceholder:0 error:0];

    uint64_t v26 = [v25 localizedName];
    fullAppName = v9->_fullAppName;
    v9->_fullAppName = (NSString *)v26;

    v28 = [v25 appClipMetadata];
    v9->_clipRequestsNotificationPermission = [v28 wantsEphemeralNotifications];

    uint64_t v29 = [v25 appClipMetadata];
    v9->_clipRequestsLocationConfirmationPermission = [v29 wantsLocationConfirmation];

    v9->_hasAppMetadata = 1;
    v30 = v9;
  }
  return v9;
}

- (CPSClipMetadata)initWithCoder:(id)a3
{
  v81[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)CPSClipMetadata;
  v5 = [(CPSClipMetadata *)&v79 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abrClipName"];
    abrClipName = v5->_abrClipName;
    v5->_abrClipName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abrClipCaption"];
    abrClipCaption = v5->_abrClipCaption;
    v5->_abrClipCaption = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abrClipHeroImage"];
    abrClipHeroImageURL = v5->_abrClipHeroImageURL;
    v5->_abrClipHeroImageURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abrClipAction"];
    v5->_clipAction = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeClipName"];
    storeClipName = v5->_storeClipName;
    v5->_storeClipName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeClipCaption"];
    storeClipCaption = v5->_storeClipCaption;
    v5->_storeClipCaption = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeClipHeroImage"];
    storeClipHeroImageURL = v5->_storeClipHeroImageURL;
    v5->_storeClipHeroImageURL = (NSURL *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppIconURL"];
    fullAppIconURL = v5->_fullAppIconURL;
    v5->_fullAppIconURL = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppIconFilePath"];
    fullAppCachedIconFilePath = v5->_fullAppCachedIconFilePath;
    v5->_fullAppCachedIconFilePath = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppStoreURL"];
    fullAppStoreURL = v5->_fullAppStoreURL;
    v5->_fullAppStoreURL = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipBundleID"];
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipMinimumOSVersion"];
    clipMinimumOSVersion = v5->_clipMinimumOSVersion;
    v5->_clipMinimumOSVersion = (NSString *)v27;

    v5->_clipIncompatibleWithCurrentDevice = [v4 decodeBoolForKey:@"clipIncompatibleWithCurrentDevice"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipIpaURL"];
    clipIpaURL = v5->_clipIpaURL;
    v5->_clipIpaURL = (NSURL *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppBundleID"];
    fullAppBundleID = v5->_fullAppBundleID;
    v5->_fullAppBundleID = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppName"];
    fullAppName = v5->_fullAppName;
    v5->_fullAppName = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppShortName"];
    fullAppShortName = v5->_fullAppShortName;
    v5->_fullAppShortName = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppCaption"];
    fullAppCaption = v5->_fullAppCaption;
    v5->_fullAppCaption = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppContentRating"];
    fullAppContentRating = v5->_fullAppContentRating;
    v5->_fullAppContentRating = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webClipID"];
    webClipID = v5->_webClipID;
    v5->_webClipID = (NSString *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipBuyParams"];
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provider"];
    provider = v5->_provider;
    v5->_provider = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipURL"];
    clipURL = v5->_clipURL;
    v5->_clipURL = (NSURL *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipRequestURL"];
    clipRequestURL = v5->_clipRequestURL;
    v5->_clipRequestURL = (NSURL *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipTargetURL"];
    clipTargetURL = v5->_clipTargetURL;
    v5->_clipTargetURL = (NSURL *)v53;

    v5->_clipRequestsNotificationPermission = [v4 decodeBoolForKey:@"clipRequestsNotificationPermission"];
    v5->_clipRequestsLocationConfirmationPermission = [v4 decodeBoolForKey:@"clipRequestsLocationConfirmationPermission"];
    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipURLHash"];
    clipURLHash = v5->_clipURLHash;
    v5->_clipURLHash = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipBusinessIconURL"];
    clipBusinessIconURL = v5->_clipBusinessIconURL;
    v5->_clipBusinessIconURL = (NSURL *)v57;

    uint64_t v59 = (void *)MEMORY[0x263EFFA08];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v81[2] = objc_opt_class();
    v81[3] = objc_opt_class();
    v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    uint64_t v61 = [v59 setWithArray:v60];
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"clipBusinessIconStyleAttributes"];
    clipBusinessIconStyleAttributes = v5->_clipBusinessIconStyleAttributes;
    v5->_clipBusinessIconStyleAttributes = (NSDictionary *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipMapItemMUID"];
    clipMapItemMUID = v5->_clipMapItemMUID;
    v5->_clipMapItemMUID = (NSNumber *)v64;

    v66 = (void *)MEMORY[0x263EFFA08];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
    v68 = [v66 setWithArray:v67];
    uint64_t v69 = [v4 decodeObjectOfClasses:v68 forKey:@"clipVerifiedAssociatedDomains"];
    clipVerifiedAssociatedDomains = v5->_clipVerifiedAssociatedDomains;
    v5->_clipVerifiedAssociatedDomains = (NSArray *)v69;

    v5->_hasBusinessItemMetadata = [v4 decodeBoolForKey:@"hasBusinessItemMetadata"];
    v5->_hasAppMetadata = [v4 decodeBoolForKey:@"hasAppMetadata"];
    v5->_poweredByThirdParty = [v4 decodeBoolForKey:@"poweredByThirdParty"];
    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationPolicy"];
    invocationPolicy = v5->_invocationPolicy;
    v5->_invocationPolicy = (CPSClipInvocationPolicy *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v73;

    v5->_deviceCapabilitiesDontMatch = [v4 decodeBoolForKey:@"deviceCapabilitiesDontMatch"];
    v5->_isDeveloperOverride = [v4 decodeBoolForKey:@"isDeveloperOverride"];
    v5->_fullAppOnly = [v4 decodeBoolForKey:@"fullAppOnly"];
    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thinnedSize"];
    clipSize = v5->_clipSize;
    v5->_clipSize = (NSNumber *)v75;

    v77 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  abrClipName = self->_abrClipName;
  id v6 = a3;
  [v6 encodeObject:abrClipName forKey:@"abrClipName"];
  [v6 encodeObject:self->_abrClipCaption forKey:@"abrClipCaption"];
  [v6 encodeObject:self->_abrClipHeroImageURL forKey:@"abrClipHeroImage"];
  v5 = [NSNumber numberWithInteger:self->_clipAction];
  [v6 encodeObject:v5 forKey:@"abrClipAction"];

  [v6 encodeObject:self->_storeClipName forKey:@"storeClipName"];
  [v6 encodeObject:self->_storeClipCaption forKey:@"storeClipCaption"];
  [v6 encodeObject:self->_storeClipHeroImageURL forKey:@"storeClipHeroImage"];
  [v6 encodeObject:self->_fullAppIconURL forKey:@"fullAppIconURL"];
  [v6 encodeObject:self->_fullAppCachedIconFilePath forKey:@"fullAppIconFilePath"];
  [v6 encodeObject:self->_fullAppStoreURL forKey:@"fullAppStoreURL"];
  [v6 encodeObject:self->_clipBundleID forKey:@"clipBundleID"];
  [v6 encodeObject:self->_clipMinimumOSVersion forKey:@"clipMinimumOSVersion"];
  [v6 encodeBool:self->_clipIncompatibleWithCurrentDevice forKey:@"clipIncompatibleWithCurrentDevice"];
  [v6 encodeObject:self->_clipIpaURL forKey:@"clipIpaURL"];
  [v6 encodeObject:self->_fullAppBundleID forKey:@"fullAppBundleID"];
  [v6 encodeObject:self->_fullAppName forKey:@"fullAppName"];
  [v6 encodeObject:self->_fullAppShortName forKey:@"fullAppShortName"];
  [v6 encodeObject:self->_fullAppCaption forKey:@"fullAppCaption"];
  [v6 encodeObject:self->_fullAppContentRating forKey:@"fullAppContentRating"];
  [v6 encodeObject:self->_itemID forKey:@"itemID"];
  [v6 encodeObject:self->_webClipID forKey:@"webClipID"];
  [v6 encodeObject:self->_buyParams forKey:@"clipBuyParams"];
  [v6 encodeObject:self->_provider forKey:@"provider"];
  [v6 encodeObject:self->_clipURL forKey:@"clipURL"];
  [v6 encodeObject:self->_clipRequestURL forKey:@"clipRequestURL"];
  [v6 encodeObject:self->_clipTargetURL forKey:@"clipTargetURL"];
  [v6 encodeBool:self->_clipRequestsNotificationPermission forKey:@"clipRequestsNotificationPermission"];
  [v6 encodeBool:self->_clipRequestsLocationConfirmationPermission forKey:@"clipRequestsLocationConfirmationPermission"];
  [v6 encodeObject:self->_clipURLHash forKey:@"clipURLHash"];
  [v6 encodeObject:self->_clipBusinessIconURL forKey:@"clipBusinessIconURL"];
  [v6 encodeObject:self->_clipBusinessIconStyleAttributes forKey:@"clipBusinessIconStyleAttributes"];
  [v6 encodeObject:self->_clipMapItemMUID forKey:@"clipMapItemMUID"];
  [v6 encodeObject:self->_clipVerifiedAssociatedDomains forKey:@"clipVerifiedAssociatedDomains"];
  [v6 encodeBool:self->_hasBusinessItemMetadata forKey:@"hasBusinessItemMetadata"];
  [v6 encodeBool:self->_hasAppMetadata forKey:@"hasAppMetadata"];
  [v6 encodeBool:self->_poweredByThirdParty forKey:@"poweredByThirdParty"];
  [v6 encodeObject:self->_invocationPolicy forKey:@"invocationPolicy"];
  [v6 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v6 encodeBool:self->_deviceCapabilitiesDontMatch forKey:@"deviceCapabilitiesDontMatch"];
  [v6 encodeBool:self->_isDeveloperOverride forKey:@"isDeveloperOverride"];
  [v6 encodeBool:self->_fullAppOnly forKey:@"fullAppOnly"];
  [v6 encodeObject:self->_clipSize forKey:@"thinnedSize"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fullAppOnlyClipBundleIDs
{
  if (fullAppOnlyClipBundleIDs_onceToken != -1) {
    dispatch_once(&fullAppOnlyClipBundleIDs_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs;

  return v2;
}

void __43__CPSClipMetadata_fullAppOnlyClipBundleIDs__block_invoke()
{
  v0 = (void *)fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs;
  fullAppOnlyClipBundleIDs_fullAppOnlyClipBundleIDs = (uint64_t)&unk_26C632B88;
}

- (void)updateWithStoreParentAppMetadata:(id)a3
{
  id v20 = a3;
  id v4 = objc_msgSend(v20, "safari_stringForKey:", @"bundleId");
  [(CPSClipMetadata *)self setFullAppBundleID:v4];

  v5 = NSNumber;
  id v6 = objc_msgSend(v20, "safari_stringForKey:", @"id");
  id v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
  [(CPSClipMetadata *)self setItemID:v7];

  uint64_t v8 = objc_msgSend(v20, "safari_stringForKey:", @"name");
  if ([v8 length]) {
    [(CPSClipMetadata *)self setFullAppName:v8];
  }
  uint64_t v9 = objc_msgSend(v20, "safari_stringForKey:", @"artistName");
  [(CPSClipMetadata *)self setProvider:v9];

  uint64_t v10 = objc_msgSend(v20, "safari_dictionaryForKey:", @"artwork");
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = NSURL;
    uint64_t v13 = objc_msgSend(v10, "safari_stringForKey:", @"url");
    uint64_t v14 = objc_msgSend(v12, "cps_resolvedURLWithStoreIconURLString:iconSize:", v13, 180);
    [(CPSClipMetadata *)self setFullAppIconURL:v14];
  }
  if (!self->_clipBundleID) {
    [(CPSClipMetadata *)self setClipBundleID:self->_fullAppBundleID];
  }
  uint64_t v15 = objc_msgSend(v20, "safari_arrayForKey:", @"offers");
  uint64_t v16 = [v15 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_msgSend(v16, "safari_dictionaryForKey:", @"version");
    int64_t v18 = objc_msgSend(v17, "safari_numberForKey:", @"externalId");
    uint64_t v19 = v18;
    if (v18) {
      -[CPSClipMetadata setClipVersionIdentifier:](self, "setClipVersionIdentifier:", [v18 unsignedLongLongValue]);
    }
  }
}

- (void)updateWithStoreClipMetadata:(id)a3
{
  id v104 = a3;
  id v4 = (NSDictionary *)[v104 copy];
  amsDictionary = self->_amsDictionary;
  self->_amsDictionary = v4;

  self->_hasAppMetadata = self->_amsDictionary != 0;
  id v6 = objc_msgSend(v104, "safari_dictionaryForKey:", @"attributes");
  id v7 = objc_msgSend(v6, "safari_stringForKey:", @"appName");
  [(CPSClipMetadata *)self setFullAppName:v7];

  objc_msgSend(v6, "safari_stringForKey:", @"name");
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppName = v8;
  if (!v8) {
    fullAppName = self->_fullAppName;
  }
  objc_storeStrong((id *)&self->_storeClipName, fullAppName);

  uint64_t v10 = objc_msgSend(v6, "safari_stringForKey:", @"appShortName");
  [(CPSClipMetadata *)self setFullAppShortName:v10];

  double v11 = objc_msgSend(v6, "safari_stringForKey:", @"artistName");
  [(CPSClipMetadata *)self setProvider:v11];

  uint64_t v12 = objc_msgSend(v6, "safari_stringForKey:", @"targetURL");
  if (v12)
  {
    uint64_t v13 = [NSURL URLWithString:v12];
    clipTargetURL = self->_clipTargetURL;
    self->_clipTargetURL = v13;
  }
  uint64_t v15 = objc_msgSend(v6, "safari_arrayForKey:", @"deviceFamilies");
  uint64_t v16 = +[CPSUtilities lowercasedDeviceFamilyName];
  uint64_t v17 = 0;
  v98 = (void *)v16;
  if (v16 && v15)
  {
    if (+[CPSUtilities deviceIsPad]) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = [v15 containsObject:v98] ^ 1;
    }
  }
  [(CPSClipMetadata *)self setClipIncompatibleWithCurrentDevice:v17];
  v99 = objc_msgSend(v6, "safari_dictionaryForKey:", @"appContentRatingsBySystem");
  int64_t v18 = objc_msgSend(v99, "safari_dictionaryForKey:", @"appsBrazil");
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = NSString;
    uint64_t v21 = objc_msgSend(v18, "safari_numberForKey:", @"rank");
    [v20 stringWithFormat:@"rank%@-Brazil", v21];
  }
  else
  {
    uint64_t v21 = objc_msgSend(v99, "safari_dictionaryForKey:", @"appsApple");
    objc_msgSend(v21, "safari_stringForKey:", @"name");
  v22 = };
  [(CPSClipMetadata *)self setFullAppContentRating:v22];

  v97 = objc_msgSend(v6, "safari_dictionaryForKey:", @"platformAttributes");
  uint64_t v23 = objc_msgSend(v97, "safari_dictionaryForKey:", @"ios");
  v24 = objc_msgSend(v23, "safari_stringForKey:", @"appSubtitle");
  if (v24)
  {
    [(CPSClipMetadata *)self setFullAppCaption:v24];
  }
  else
  {
    v100 = v15;
    v102 = v12;
    v95 = v6;
    uint64_t v25 = objc_msgSend(v104, "safari_dictionaryForKey:", @"relationships");
    uint64_t v26 = objc_msgSend(v25, "safari_dictionaryForKey:", @"app-genres");
    uint64_t v27 = objc_msgSend(v26, "safari_arrayForKey:", @"data");

    v28 = [v27 objectEnumerator];
    uint64_t v29 = [v28 nextObject];
    if (v29)
    {
      v30 = v29;
      uint64_t v31 = objc_msgSend(v29, "safari_stringForKey:", @"id");
      objc_super v32 = objc_msgSend(v30, "safari_dictionaryForKey:", @"attributes");
      uint64_t v33 = objc_msgSend(v32, "safari_stringForKey:", @"name");

      if (v31 && [v31 isEqualToString:@"6014"])
      {
        uint64_t v34 = [v28 nextObject];

        if (v34)
        {
          v93 = v27;
          v87 = v19;
          v30 = (void *)v34;
          while (1)
          {
            uint64_t v35 = objc_msgSend(v30, "safari_dictionaryForKey:", @"attributes");
            objc_super v36 = objc_msgSend(v35, "safari_stringForKey:", @"parentId");

            if (v36)
            {
              if ([v36 isEqualToString:@"6014"]) {
                break;
              }
            }

            uint64_t v37 = [v28 nextObject];

            v30 = (void *)v37;
            if (!v37) {
              goto LABEL_27;
            }
          }
          v38 = objc_msgSend(v30, "safari_dictionaryForKey:", @"attributes");
          uint64_t v39 = objc_msgSend(v38, "safari_stringForKey:", @"name");

          uint64_t v33 = (void *)v39;
LABEL_27:
          uint64_t v19 = v87;
          uint64_t v27 = v93;
        }
        else
        {
          v30 = 0;
        }
      }
    }
    else
    {
      uint64_t v33 = 0;
    }

    [(CPSClipMetadata *)self setFullAppCaption:v33];
    id v6 = v95;
    uint64_t v15 = v100;
    uint64_t v12 = v102;
  }

  objc_msgSend(v23, "safari_stringForKey:", @"subtitle");
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  fullAppCaption = v40;
  if (!v40) {
    fullAppCaption = self->_fullAppCaption;
  }
  objc_storeStrong((id *)&self->_storeClipCaption, fullAppCaption);

  if (!self->_hasBusinessItemMetadata)
  {
    objc_msgSend(v23, "safari_stringForKey:", @"action");
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    if ([v42 isEqualToString:@"OPEN"])
    {
      int64_t v43 = 0;
    }
    else if ([v42 isEqualToString:@"VIEW"])
    {
      int64_t v43 = 1;
    }
    else if ([v42 isEqualToString:@"PLAY"])
    {
      int64_t v43 = 2;
    }
    else
    {
      int64_t v43 = 0;
    }

    self->_clipAction = v43;
  }
  objc_msgSend(v23, "safari_stringForKey:", @"minimumOSVersion");
  v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  clipMinimumOSVersion = self->_clipMinimumOSVersion;
  self->_clipMinimumOSVersion = v44;

  v46 = objc_msgSend(v23, "safari_dictionaryForKey:", @"heroArtwork");
  uint64_t v47 = v46;
  if (v46)
  {
    v48 = objc_msgSend(v46, "safari_stringForKey:", @"url");
    if ([v48 length])
    {
      objc_msgSend(NSURL, "cps_resolvedURLWithStoreIconURLString:iconSize:", v48, 1024);
      uint64_t v49 = (NSURL *)objc_claimAutoreleasedReturnValue();
      storeClipHeroImageURL = self->_storeClipHeroImageURL;
      self->_storeClipHeroImageURL = v49;
    }
  }
  v96 = v47;
  v103 = v23;
  uint64_t v51 = objc_msgSend(v23, "safari_dictionaryForKey:", @"appArtwork");
  v52 = v51;
  if (v51)
  {
    uint64_t v53 = NSURL;
    v54 = objc_msgSend(v51, "safari_stringForKey:", @"url");
    uint64_t v55 = objc_msgSend(v53, "cps_resolvedURLWithStoreIconURLString:iconSize:", v54, 180);
    [(CPSClipMetadata *)self setFullAppIconURL:v55];
  }
  v94 = v52;
  v56 = objc_msgSend(v103, "safari_stringForKey:", @"bundleId");
  [(CPSClipMetadata *)self setClipBundleID:v56];

  uint64_t v57 = objc_msgSend(v103, "safari_stringForKey:", @"appBundleId");
  [(CPSClipMetadata *)self setFullAppBundleID:v57];

  uint64_t v58 = objc_msgSend(v103, "safari_arrayForKey:", @"verifiedAssociatedDomains");
  uint64_t v59 = (void *)v58;
  if (v58) {
    v60 = (void *)v58;
  }
  else {
    v60 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)&self->_clipVerifiedAssociatedDomains, v60);

  uint64_t v61 = objc_msgSend(v103, "safari_numberForKey:", @"externalVersionId");
  uint64_t v62 = v61;
  if (v61) {
    -[CPSClipMetadata setClipVersionIdentifier:](self, "setClipVersionIdentifier:", [v61 unsignedLongLongValue]);
  }
  v92 = v62;
  v91 = objc_msgSend(v103, "safari_arrayForKey:", @"variantsInfo");
  uint64_t v63 = -[CPSClipMetadata _thinnedSizeWithVariantsInfo:](self, "_thinnedSizeWithVariantsInfo:");
  v90 = (void *)v63;
  if (v63) {
    uint64_t v64 = (void *)v63;
  }
  else {
    uint64_t v64 = &unk_26C632BB8;
  }
  [(CPSClipMetadata *)self setClipSize:v64];
  v89 = objc_msgSend(v104, "safari_dictionaryForKey:", @"relationships");
  objc_super v65 = objc_msgSend(v89, "safari_dictionaryForKey:", @"app");
  v66 = objc_msgSend(v65, "safari_arrayForKey:", @"data");
  v67 = [v66 firstObject];

  objc_opt_class();
  v101 = v67;
  if (objc_opt_isKindOfClass())
  {
    v68 = NSNumber;
    uint64_t v69 = objc_msgSend(v67, "safari_stringForKey:", @"id");
    v70 = objc_msgSend(v68, "numberWithLongLong:", objc_msgSend(v69, "longLongValue"));
    [(CPSClipMetadata *)self setItemID:v70];
  }
  uint64_t v71 = objc_msgSend(v6, "safari_stringForKey:", @"appUrl");
  v72 = [NSURL URLWithString:v71];
  [(CPSClipMetadata *)self setFullAppStoreURL:v72];

  if (!self->_itemID)
  {
    uint64_t v73 = [(CPSClipMetadata *)self _itemIDFromAppURLString:v71];
    [(CPSClipMetadata *)self setItemID:v73];
  }
  if (+[CPSClipURL usesDemoMetadata])
  {
    v74 = NSURL;
    uint64_t v75 = objc_msgSend(v104, "safari_stringForKey:", @"clipIpaURL");
    v76 = [v74 URLWithString:v75];
    clipIpaURL = self->_clipIpaURL;
    self->_clipIpaURL = v76;
  }
  v78 = v103;
  objc_super v79 = objc_msgSend(v103, "safari_arrayForKey:", @"permissions");
  self->_clipRequestsLocationConfirmationPermission = [v79 containsObject:@"locationConfirmation"];
  self->_clipRequestsNotificationPermission = [v79 containsObject:@"ephemeralUserNotifications"];
  v80 = objc_msgSend(v103, "safari_arrayForKey:", @"requiredCapabilities");
  self->_deviceCapabilitiesDontMatch = !+[CPSUtilities deviceHasCapabilities:v80];
  if (objc_msgSend(v6, "safari_BOOLForKey:", @"fullAppOnly"))
  {
    self->_fullAppOnly = 1;
    v81 = v98;
  }
  else
  {
    [(id)objc_opt_class() fullAppOnlyClipBundleIDs];
    v88 = v19;
    v82 = v15;
    v84 = v83 = v6;
    [(CPSClipMetadata *)self clipBundleID];
    v86 = v85 = v12;
    self->_fullAppOnly = [v84 containsObject:v86];

    uint64_t v12 = v85;
    id v6 = v83;
    uint64_t v15 = v82;
    v81 = v98;
    v78 = v103;
    uint64_t v19 = v88;
  }
}

- (id)_thinnedSizeWithVariantsInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CPSClipMetadata *)self test_mocProductVariants];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[CPSUtilities productVariants];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [(CPSClipMetadata *)self test_mocProductVersion];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[CPSUtilities osVersion];
  }
  uint64_t v12 = v11;

  uint64_t v13 = [(CPSClipMetadata *)self _thinnedSizeWithVariantsInfo:v4 productVariants:v8 productVersion:v12];

  return v13;
}

- (id)_thinnedSizeWithVariantsInfo:(id)a3 productVariants:(id)a4 productVersion:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  objc_super v36 = [MEMORY[0x263EFF980] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "safari_arrayForKey:", @"targets");
        uint64_t v15 = objc_msgSend(v13, "safari_numberForKey:", @"size");
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke;
        v45[3] = &unk_26424F660;
        id v46 = v35;
        id v47 = v8;
        id v48 = v15;
        id v49 = v36;
        id v16 = v15;
        [v14 enumerateObjectsUsingBlock:v45];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v10);
  }

  id v17 = (id)[v36 sortedArrayUsingComparator:&__block_literal_global_286];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = v8;
  uint64_t v33 = [v18 countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v33)
  {
    uint64_t v19 = *(void *)v42;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v18);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v22 = [v36 reverseObjectEnumerator];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v38;
          while (2)
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void **)(*((void *)&v37 + 1) + 8 * k);
              v28 = [v27 device];
              char v29 = [v28 isEqualToString:v21];

              if (v29)
              {
                v30 = [v27 size];

                goto LABEL_26;
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v19 = v32;
      }
      v30 = &unk_26C632BB8;
      uint64_t v33 = [v18 countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v33);
  }
  else
  {
    v30 = &unk_26C632BB8;
  }
LABEL_26:

  return v30;
}

void __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "safari_stringForKey:", @"osVersion");
  if ([v4 compare:*(void *)(a1 + 32)] != 1)
  {
    v5 = objc_msgSend(v3, "safari_arrayForKey:", @"devices");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
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
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([*(id *)(a1 + 40) containsObject:v10])
          {
            uint64_t v11 = objc_alloc_init(CPSDeviceVariant);
            [(CPSDeviceVariant *)v11 setOsVersion:v4];
            [(CPSDeviceVariant *)v11 setSize:*(void *)(a1 + 48)];
            [(CPSDeviceVariant *)v11 setDevice:v10];
            [*(id *)(a1 + 56) addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __79__CPSClipMetadata__thinnedSizeWithVariantsInfo_productVariants_productVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 osVersion];
  uint64_t v6 = [v4 osVersion];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)hasUpToDateVersionInstalledOnSystemIsPlaceholder:(BOOL *)a3
{
  v5 = [(CPSClipMetadata *)self clipBundleID];
  uint64_t v6 = +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:v5 isPlaceholder:a3];

  if (v6) {
    BOOL v7 = self->_isDeveloperOverride || [v6 unsignedLongLongValue] >= self->_clipVersionIdentifier;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isPhysicalInvocationAllowed
{
  if ([(CPSClipMetadata *)self canUpdateOnPhysicalInvocation]) {
    return 1;
  }
  char v8 = 0;
  id v4 = [(CPSClipMetadata *)self clipBundleID];
  v5 = +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:v4 isPlaceholder:&v8];

  if (v5) {
    BOOL v6 = v8 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v3 = v6 || [(CPSClipMetadata *)self hasFullAppInstalledOnSystem];

  return v3;
}

- (BOOL)canUpdateOnPhysicalInvocation
{
  return (CPSSimulateLargeSizeAppClipForTesting() & 1) == 0
      && [(NSNumber *)self->_clipSize unsignedLongLongValue] <= 0xF00000;
}

- (BOOL)hasFullAppInstalledOnSystem
{
  BOOL v3 = [(CPSClipMetadata *)self fullAppBundleID];

  if (!v3) {
    return 0;
  }
  char v9 = 0;
  id v4 = [(CPSClipMetadata *)self fullAppBundleID];
  v5 = +[CPSUtilities versionIdentifierForAppWithBundleIdentifier:v4 isPlaceholder:&v9];
  if (v5) {
    BOOL v6 = v9 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v6;

  return v7;
}

- (id)_itemIDFromAppURLString:(id)a3
{
  BOOL v3 = [a3 lastPathComponent];
  if ([v3 hasPrefix:@"id"])
  {
    id v4 = [v3 substringFromIndex:2];
    v5 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    BOOL v6 = [v5 invertedSet];

    if ([v4 rangeOfCharacterFromSet:v6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateWithAMSMetadata:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    long long v37 = v4;
    v5 = [v4 amsDictionary];
    amsDictionary = self->_amsDictionary;
    self->_amsDictionary = v5;

    self->_hasAppMetadata = self->_amsDictionary != 0;
    BOOL v7 = [v37 fullAppBundleID];
    [(CPSClipMetadata *)self setFullAppBundleID:v7];

    char v8 = [v37 fullAppName];
    [(CPSClipMetadata *)self setFullAppName:v8];

    char v9 = [v37 fullAppShortName];
    [(CPSClipMetadata *)self setFullAppShortName:v9];

    uint64_t v10 = [v37 fullAppIconURL];
    [(CPSClipMetadata *)self setFullAppIconURL:v10];

    uint64_t v11 = [v37 fullAppStoreURL];
    [(CPSClipMetadata *)self setFullAppStoreURL:v11];

    long long v12 = [v37 fullAppCaption];
    [(CPSClipMetadata *)self setFullAppCaption:v12];

    long long v13 = [v37 fullAppCachedIconFilePath];
    [(CPSClipMetadata *)self setFullAppCachedIconFilePath:v13];

    long long v14 = [v37 clipVerifiedAssociatedDomains];
    long long v15 = (NSArray *)[v14 copy];
    clipVerifiedAssociatedDomains = self->_clipVerifiedAssociatedDomains;
    self->_clipVerifiedAssociatedDomains = v15;

    uint64_t v17 = (NSString *)[v37[1] copy];
    storeClipName = self->_storeClipName;
    self->_storeClipName = v17;

    uint64_t v19 = (NSString *)[v37[2] copy];
    storeClipCaption = self->_storeClipCaption;
    self->_storeClipCaption = v19;

    if (!self->_hasBusinessItemMetadata) {
      self->_clipAction = [v37 clipAction];
    }
    objc_storeStrong((id *)&self->_storeClipHeroImageURL, v37[3]);
    self->_clipVersionIdentifier = [v37 clipVersionIdentifier];
    uint64_t v21 = [v37 itemID];
    if (v21) {
      [(CPSClipMetadata *)self setItemID:v21];
    }
    v22 = [v37 fullAppContentRating];
    if (v22) {
      [(CPSClipMetadata *)self setFullAppContentRating:v22];
    }
    uint64_t v23 = [v37 provider];
    [(CPSClipMetadata *)self setProvider:v23];

    uint64_t v24 = [v37 buyParams];
    [(CPSClipMetadata *)self setBuyParams:v24];

    -[CPSClipMetadata setClipIncompatibleWithCurrentDevice:](self, "setClipIncompatibleWithCurrentDevice:", [v37 clipIncompatibleWithCurrentDevice]);
    if (+[CPSClipURL usesDemoMetadata])
    {
      uint64_t v25 = [v37 clipIpaURL];
      [(CPSClipMetadata *)self setClipIpaURL:v25];

      uint64_t v26 = [v37 clipBundleID];

      if (v26)
      {
        uint64_t v27 = [v37 clipBundleID];
        [(CPSClipMetadata *)self setClipBundleID:v27];
      }
    }
    self->_clipRequestsNotificationPermission = [v37 clipRequestsNotificationPermission];
    self->_clipRequestsLocationConfirmationPermission = [v37 clipRequestsLocationConfirmationPermission];
    self->_deviceCapabilitiesDontMatch = [v37 deviceCapabilitiesDontMatch];
    v28 = [v37 clipMinimumOSVersion];
    clipMinimumOSVersion = self->_clipMinimumOSVersion;
    self->_clipMinimumOSVersion = v28;

    v30 = [v37 expirationDate];
    expirationDate = self->_expirationDate;
    self->_expirationDate = v30;

    self->_fullAppOnly = [v37 fullAppOnly];
    uint64_t v32 = [v37 clipSize];
    clipSize = self->_clipSize;
    self->_clipSize = v32;

    if (!self->_clipTargetURL)
    {
      uint64_t v34 = [v37 clipTargetURL];
      clipTargetURL = self->_clipTargetURL;
      self->_clipTargetURL = v34;
    }
    objc_super v36 = [v37 invocationPolicy];
    [(CPSClipMetadata *)self _updateInvocationPolicy:v36];

    id v4 = v37;
  }
}

- (void)_updateInvocationPolicy:(id)a3
{
  id v4 = a3;
  v5 = [(CPSClipMetadata *)self invocationPolicy];
  if ([v5 isEligible])
  {
  }
  else
  {
    BOOL v6 = [(CPSClipMetadata *)self invocationPolicy];
    int v7 = [v6 isRecoverable];
    if (!v4 || !v7 || [v4 isEligible])
    {

      goto LABEL_8;
    }
    char v11 = [v4 isRecoverable];

    if (v11) {
      goto LABEL_8;
    }
  }
  [(CPSClipMetadata *)self setInvocationPolicy:v4];
LABEL_8:
  char v8 = [(CPSClipMetadata *)self invocationPolicy];
  if (![v8 isEligible] || !CPSShouldValidateAssociatedDomains())
  {
LABEL_14:

    goto LABEL_15;
  }
  BOOL v9 = [(CPSClipMetadata *)self hasValidAssociatedDomainsToLaunchAppClip];

  if (!v9)
  {
    uint64_t v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CPSClipMetadata _updateInvocationPolicy:](v10, self);
    }
    char v8 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:13];
    [(CPSClipMetadata *)self setInvocationPolicy:v8];
    goto LABEL_14;
  }
LABEL_15:
}

- (BOOL)_preferAMPDefaultNameAndCaptionForCurrentLocale
{
  v14[3] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"zh_TW"];
  v14[0] = v4;
  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"zh_HK"];
  v14[1] = v5;
  BOOL v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"zh_MO"];
  v14[2] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  char v8 = [v3 setWithArray:v7];

  BOOL v9 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  if ([v8 containsObject:v9])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.Bridge.AppClip", @"com.apple.supportapp.Clip", @"com.shazam.Shazam.Clip", 0);
    char v11 = [(CPSClipMetadata *)self clipBundleID];
    char v12 = [v10 containsObject:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSString)clipName
{
  if ([(CPSClipMetadata *)self _preferAMPDefaultNameAndCaptionForCurrentLocale])
  {
    p_storeClipName = &self->_storeClipName;
  }
  else
  {
    abrClipName = self->_abrClipName;
    p_abrClipName = &self->_abrClipName;
    uint64_t v6 = [(NSString *)abrClipName length];
    p_storeClipName = p_abrClipName - 3;
    if (v6) {
      p_storeClipName = p_abrClipName;
    }
  }
  int v7 = *p_storeClipName;

  return v7;
}

- (NSString)clipCaption
{
  if ([(CPSClipMetadata *)self _preferAMPDefaultNameAndCaptionForCurrentLocale])
  {
    p_storeClipCaption = &self->_storeClipCaption;
  }
  else
  {
    abrClipCaption = self->_abrClipCaption;
    p_abrClipCaption = &self->_abrClipCaption;
    uint64_t v6 = [(NSString *)abrClipCaption length];
    p_storeClipCaption = p_abrClipCaption - 3;
    if (v6) {
      p_storeClipCaption = p_abrClipCaption;
    }
  }
  int v7 = *p_storeClipCaption;

  return v7;
}

- (NSString)clipOpenButtonTitle
{
  unint64_t clipAction = self->_clipAction;
  if (clipAction <= 2)
  {
    _CPSLocalizedString(off_26424F6A0[clipAction], &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
    self = (CPSClipMetadata *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)self;
}

- (NSURL)clipHeroImageURL
{
  abrClipHeroImageURL = self->_abrClipHeroImageURL;
  if (!abrClipHeroImageURL) {
    abrClipHeroImageURL = self->_storeClipHeroImageURL;
  }
  return abrClipHeroImageURL;
}

- (NSURL)clipLaunchURL
{
  clipTargetURL = self->_clipTargetURL;
  if (!clipTargetURL)
  {
    clipTargetURL = self->_clipRequestURL;
    if (!clipTargetURL) {
      clipTargetURL = self->_clipURL;
    }
  }
  BOOL v3 = clipTargetURL;

  return v3;
}

- (BOOL)hasValidAssociatedDomainsToLaunchAppClip
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CPSClipMetadata *)self clipLaunchURL];
  if (v3)
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    v5 = [v4 host];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v3, "cps_fallbackBundleIdentifier");
      int v7 = [(CPSClipMetadata *)self clipBundleID];
      char v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        BOOL v9 = 1;
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        obuint64_t j = self->_clipVerifiedAssociatedDomains;
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v21 = v6;
          v22 = v4;
          uint64_t v12 = *(void *)v27;
          uint64_t v23 = v3;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(obj);
              }
              long long v14 = (void *)MEMORY[0x263F6BD78];
              uint64_t v32 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              long long v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v32, 1, v21, v22, v23);
              id v25 = 0;
              id v16 = [v14 serviceSpecifiersWithEntitlementValue:v15 error:&v25];
              id v17 = v25;
              id v18 = [v16 firstObject];

              if (v18)
              {
                if ([v18 domainEncompassesDomain:v5])
                {

                  BOOL v9 = 1;
                  goto LABEL_20;
                }
              }
              else
              {
                uint64_t v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  [(CPSClipMetadata *)v30 hasValidAssociatedDomainsToLaunchAppClip];
                }
              }
            }
            uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v33 count:16];
          }
          while (v11);
          BOOL v9 = 0;
LABEL_20:
          id v4 = v22;
          BOOL v3 = v23;
          uint64_t v6 = v21;
        }
        else
        {
          BOOL v9 = 0;
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSArray)test_clipVerifiedAssociatedDomains
{
  return self->_clipVerifiedAssociatedDomains;
}

- (void)setTest_clipVerifiedAssociatedDomains:(id)a3
{
}

- (BOOL)isExpired
{
  if (!self->_expirationDate) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x263EFF910] now];
  BOOL v4 = [v3 compare:self->_expirationDate] != -1;

  return v4;
}

- (NSString)bundleDisplayName
{
  if ([(NSString *)self->_fullAppShortName length])
  {
    BOOL v3 = self->_fullAppShortName;
  }
  else
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:self->_clipBundleID allowPlaceholder:0 error:0];
    BOOL v3 = [v4 localizedName];
  }

  return v3;
}

- (id)description
{
  uint64_t v24 = NSString;
  uint64_t v33 = [(CPSClipMetadata *)self clipName];
  storeClipCaption = self->_storeClipCaption;
  abrClipCaption = self->_abrClipCaption;
  uint64_t v34 = [(CPSClipMetadata *)self clipCaption];
  uint64_t v32 = [(CPSClipMetadata *)self clipBundleID];
  uint64_t v31 = [(CPSClipMetadata *)self clipHeroImageURL];
  v30 = [(CPSClipMetadata *)self clipOpenButtonTitle];
  long long v29 = [(CPSClipMetadata *)self clipURL];
  uint64_t v21 = [(CPSClipMetadata *)self clipIpaURL];
  long long v28 = [(CPSClipMetadata *)self clipRequestURL];
  id v20 = [(CPSClipMetadata *)self clipMinimumOSVersion];
  uint64_t v19 = [(CPSClipMetadata *)self fullAppName];
  id v18 = [(CPSClipMetadata *)self fullAppShortName];
  id v17 = [(CPSClipMetadata *)self fullAppCaption];
  id v16 = [(CPSClipMetadata *)self fullAppContentRating];
  long long v27 = [(CPSClipMetadata *)self fullAppBundleID];
  long long v26 = [(CPSClipMetadata *)self fullAppStoreURL];
  BOOL v3 = [(CPSClipMetadata *)self fullAppIconURL];
  if ([(CPSClipMetadata *)self isPoweredByThirdParty]) {
    BOOL v4 = @"YES";
  }
  else {
    BOOL v4 = @"NO";
  }
  long long v15 = v4;
  v5 = [(CPSClipMetadata *)self provider];
  uint64_t v6 = [(CPSClipMetadata *)self webClipID];
  int v7 = [(CPSClipMetadata *)self clipURLHash];
  unint64_t v8 = [(CPSClipMetadata *)self clipVersionIdentifier];
  if ([(CPSClipMetadata *)self clipRequestsLocationConfirmationPermission]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  if ([(CPSClipMetadata *)self clipRequestsNotificationPermission]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  uint64_t v11 = [(CPSClipMetadata *)self expirationDate];
  uint64_t v12 = [(CPSClipMetadata *)self bundleDisplayName];
  long long v13 = [(CPSClipMetadata *)self clipSize];
  objc_msgSend(v24, "stringWithFormat:", @"\n  clipName = %@,\n  abrClipCaption = %@,\n  storeClipCaption = %@, \n  clipCaption = %@,\n  clipBundleID = %@,\n  clipHeroImageURL = %@,\n  clipOpenButtonTitle = %@,\n  clipURL = %@,\n  clipIpaURL = %@,\n  clipRequestURL = %@,\n  clipMinimumOSVersion = %@,\n  fullAppName = %@,\n  fullAppShortName = %@,\n  fullAppCaption = %@,\n  fullAppContentRating = %@,\n  fullAppBundleID = %@,\n  fullAppStoreURL = %@,\n  fullAppIconURL = %@, \n  isPoweredBy = %@, \n  provider = %@, \n  webClipID = %@, \n  clipURLHash = %@, \n  clipVersionIdentifier = %llu \n  clipRequestsLocationConfirmationPermission = %@ \n  clipRequestsNotificationPermission = %@ \n  expirationDate = %@ \n  bundleDisplayName = %@ \n  thinnedSize = %@ \n", v33, abrClipCaption, storeClipCaption, v34, v32, v31, v30, v29, v21, v28, v20, v19, v18, v17, v16, v27,
    v26,
    v3,
    v15,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
  id v25 = v13);

  return v25;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
}

- (int64_t)clipAction
{
  return self->_clipAction;
}

- (NSString)clipMinimumOSVersion
{
  return self->_clipMinimumOSVersion;
}

- (BOOL)clipIncompatibleWithCurrentDevice
{
  return self->_clipIncompatibleWithCurrentDevice;
}

- (void)setClipIncompatibleWithCurrentDevice:(BOOL)a3
{
  self->_clipIncompatibleWithCurrentDevice = a3;
}

- (NSURL)clipIpaURL
{
  return self->_clipIpaURL;
}

- (void)setClipIpaURL:(id)a3
{
}

- (NSURL)clipRequestURL
{
  return self->_clipRequestURL;
}

- (void)setClipRequestURL:(id)a3
{
}

- (NSURL)clipURL
{
  return self->_clipURL;
}

- (void)setClipURL:(id)a3
{
}

- (NSURL)clipTargetURL
{
  return self->_clipTargetURL;
}

- (NSURL)clipBusinessIconURL
{
  return self->_clipBusinessIconURL;
}

- (NSDictionary)clipBusinessIconStyleAttributes
{
  return self->_clipBusinessIconStyleAttributes;
}

- (NSNumber)clipMapItemMUID
{
  return self->_clipMapItemMUID;
}

- (BOOL)clipRequestsNotificationPermission
{
  return self->_clipRequestsNotificationPermission;
}

- (BOOL)clipRequestsLocationConfirmationPermission
{
  return self->_clipRequestsLocationConfirmationPermission;
}

- (NSString)clipURLHash
{
  return self->_clipURLHash;
}

- (void)setClipURLHash:(id)a3
{
}

- (NSArray)clipVerifiedAssociatedDomains
{
  return self->_clipVerifiedAssociatedDomains;
}

- (BOOL)hasBusinessItemMetadata
{
  return self->_hasBusinessItemMetadata;
}

- (BOOL)hasAppMetadata
{
  return self->_hasAppMetadata;
}

- (BOOL)isPoweredByThirdParty
{
  return self->_poweredByThirdParty;
}

- (CPSClipInvocationPolicy)invocationPolicy
{
  return self->_invocationPolicy;
}

- (void)setInvocationPolicy:(id)a3
{
}

- (BOOL)deviceCapabilitiesDontMatch
{
  return self->_deviceCapabilitiesDontMatch;
}

- (void)setDeviceCapabilitiesDontMatch:(BOOL)a3
{
  self->_deviceCapabilitiesDontMatch = a3;
}

- (NSString)fullAppName
{
  return self->_fullAppName;
}

- (void)setFullAppName:(id)a3
{
}

- (NSString)fullAppShortName
{
  return self->_fullAppShortName;
}

- (void)setFullAppShortName:(id)a3
{
}

- (NSString)fullAppCaption
{
  return self->_fullAppCaption;
}

- (void)setFullAppCaption:(id)a3
{
}

- (NSString)fullAppContentRating
{
  return self->_fullAppContentRating;
}

- (void)setFullAppContentRating:(id)a3
{
}

- (NSString)fullAppBundleID
{
  return self->_fullAppBundleID;
}

- (void)setFullAppBundleID:(id)a3
{
}

- (NSURL)fullAppStoreURL
{
  return self->_fullAppStoreURL;
}

- (void)setFullAppStoreURL:(id)a3
{
}

- (NSURL)fullAppIconURL
{
  return self->_fullAppIconURL;
}

- (void)setFullAppIconURL:(id)a3
{
}

- (NSString)fullAppCachedIconFilePath
{
  return self->_fullAppCachedIconFilePath;
}

- (void)setFullAppCachedIconFilePath:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)webClipID
{
  return self->_webClipID;
}

- (void)setWebClipID:(id)a3
{
}

- (NSNumber)clipSize
{
  return self->_clipSize;
}

- (void)setClipSize:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (BOOL)isDeveloperOverride
{
  return self->_isDeveloperOverride;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)fullAppOnly
{
  return self->_fullAppOnly;
}

- (void)setFullAppOnly:(BOOL)a3
{
  self->_fullAppOnly = a3;
}

- (NSDictionary)amsDictionary
{
  return self->_amsDictionary;
}

- (void)setAmsDictionary:(id)a3
{
}

- (unint64_t)clipVersionIdentifier
{
  return self->_clipVersionIdentifier;
}

- (void)setClipVersionIdentifier:(unint64_t)a3
{
  self->_clipVersionIdentifier = a3;
}

- (BOOL)canUpdateOnPhysicalInovcation
{
  return self->_canUpdateOnPhysicalInovcation;
}

- (NSString)test_mocProductVersion
{
  return self->_test_mocProductVersion;
}

- (void)setTest_mocProductVersion:(id)a3
{
}

- (NSArray)test_mocProductVariants
{
  return self->_test_mocProductVariants;
}

- (void)setTest_mocProductVariants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_mocProductVariants, 0);
  objc_storeStrong((id *)&self->_test_mocProductVersion, 0);
  objc_storeStrong((id *)&self->_amsDictionary, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_clipSize, 0);
  objc_storeStrong((id *)&self->_webClipID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_fullAppCachedIconFilePath, 0);
  objc_storeStrong((id *)&self->_fullAppIconURL, 0);
  objc_storeStrong((id *)&self->_fullAppStoreURL, 0);
  objc_storeStrong((id *)&self->_fullAppBundleID, 0);
  objc_storeStrong((id *)&self->_fullAppContentRating, 0);
  objc_storeStrong((id *)&self->_fullAppCaption, 0);
  objc_storeStrong((id *)&self->_fullAppShortName, 0);
  objc_storeStrong((id *)&self->_fullAppName, 0);
  objc_storeStrong((id *)&self->_invocationPolicy, 0);
  objc_storeStrong((id *)&self->_clipVerifiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_clipURLHash, 0);
  objc_storeStrong((id *)&self->_clipMapItemMUID, 0);
  objc_storeStrong((id *)&self->_clipBusinessIconStyleAttributes, 0);
  objc_storeStrong((id *)&self->_clipBusinessIconURL, 0);
  objc_storeStrong((id *)&self->_clipTargetURL, 0);
  objc_storeStrong((id *)&self->_clipURL, 0);
  objc_storeStrong((id *)&self->_clipRequestURL, 0);
  objc_storeStrong((id *)&self->_clipIpaURL, 0);
  objc_storeStrong((id *)&self->_clipMinimumOSVersion, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_abrClipHeroImageURL, 0);
  objc_storeStrong((id *)&self->_abrClipCaption, 0);
  objc_storeStrong((id *)&self->_abrClipName, 0);
  objc_storeStrong((id *)&self->_storeClipHeroImageURL, 0);
  objc_storeStrong((id *)&self->_storeClipCaption, 0);

  objc_storeStrong((id *)&self->_storeClipName, 0);
}

- (void)_updateInvocationPolicy:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  BOOL v4 = [a2 clipRequestURL];
  v5 = [a2 clipBundleID];
  int v6 = 138740227;
  int v7 = v4;
  __int16 v8 = 2117;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_21559C000, v3, OS_LOG_TYPE_ERROR, "Clip failed associated domain check. url = %{sensitive}@ bundleID = %{sensitive}@", (uint8_t *)&v6, 0x16u);
}

- (void)hasValidAssociatedDomainsToLaunchAppClip
{
  int v7 = a2;
  __int16 v8 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_21559C000, v7, OS_LOG_TYPE_ERROR, "Cannot parse associatd domain. Error: %{public}@", a1, 0xCu);
}

@end