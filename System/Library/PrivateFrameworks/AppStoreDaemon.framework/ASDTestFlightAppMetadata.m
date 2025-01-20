@interface ASDTestFlightAppMetadata
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (ASDTestFlightAppGenre)genre;
- (ASDTestFlightAppMetadata)initWithBundleID:(id)a3;
- (ASDTestFlightAppMetadata)initWithCoder:(id)a3;
- (BOOL)hasMessagesExtension;
- (BOOL)isLaunchProhibited;
- (BOOL)requiresPowerPluggedIn;
- (BOOL)userInitiated;
- (NSArray)genreIDs;
- (NSArray)provisioningProfiles;
- (NSArray)subGenres;
- (NSData)packageDPInfo;
- (NSData)packageSINF;
- (NSData)receipt;
- (NSDictionary)backgroundAssetMetadata;
- (NSDictionary)placeholderEntitlements;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)initialODRSize;
- (NSNumber)itemID;
- (NSNumber)packageSize;
- (NSNumber)storeFront;
- (NSString)betaBuildGroupID;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)companionBundleID;
- (NSString)itemName;
- (NSString)shortBundleVersion;
- (NSString)storeCohort;
- (NSString)token;
- (NSString)variantID;
- (NSString)vendorName;
- (NSURL)artworkURL;
- (NSURL)existingBundleURL;
- (NSURL)messagesArtworkURL;
- (NSURL)packageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (int64_t)packageCompression;
- (int64_t)softwarePlatform;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setBackgroundAssetMetadata:(id)a3;
- (void)setBetaBuildGroupID:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCompanionBundleID:(id)a3;
- (void)setExistingBundleURL:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setGenre:(id)a3;
- (void)setGenreIDs:(id)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setInitialODRSize:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setMessagesArtworkURL:(id)a3;
- (void)setPackageCompression:(int64_t)a3;
- (void)setPackageDPInfo:(id)a3;
- (void)setPackageSINF:(id)a3;
- (void)setPackageSize:(id)a3;
- (void)setPackageURL:(id)a3;
- (void)setPlaceholderEntitlements:(id)a3;
- (void)setProvisioningProfiles:(id)a3;
- (void)setReceipt:(id)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setShortBundleVersion:(id)a3;
- (void)setSoftwarePlatform:(int64_t)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setSubGenres:(id)a3;
- (void)setToken:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setVariantID:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ASDTestFlightAppMetadata

- (ASDTestFlightAppMetadata)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTestFlightAppMetadata;
  v6 = [(ASDTestFlightAppMetadata *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_userInitiated = 1;
  }

  return v7;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_requiresPowerPluggedIn_wasSet = 1;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
  if (!self->_requiresPowerPluggedIn_wasSet) {
    self->_requiresPowerPluggedIn = !a3;
  }
}

- (int64_t)metadataType
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[ASDTestFlightAppMetadata allocWithZone:](ASDTestFlightAppMetadata, "allocWithZone:");
  v6 = (void *)[(NSString *)self->_bundleID copyWithZone:a3];
  uint64_t v7 = [(ASDTestFlightAppMetadata *)v5 initWithBundleID:v6];

  objc_storeStrong((id *)(v7 + 16), self->_account);
  uint64_t v8 = [(NSURL *)self->_artworkURL copyWithZone:a3];
  objc_super v9 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = v8;

  uint64_t v10 = [(NSDictionary *)self->_backgroundAssetMetadata copyWithZone:a3];
  v11 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_betaBuildGroupID copyWithZone:a3];
  v13 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  v15 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v14;

  uint64_t v16 = [(NSString *)self->_companionBundleID copyWithZone:a3];
  v17 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v16;

  uint64_t v18 = [(NSURL *)self->_existingBundleURL copyWithZone:a3];
  v19 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v18;

  uint64_t v20 = [(NSNumber *)self->_externalVersionIdentifier copyWithZone:a3];
  v21 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = v20;

  id v22 = [(ASDTestFlightAppGenre *)self->_genre copyWithZone:a3];
  v23 = *(void **)(v7 + 88);
  *(void *)(v7 + 88) = v22;

  uint64_t v24 = [(NSArray *)self->_genreIDs copyWithZone:a3];
  v25 = *(void **)(v7 + 96);
  *(void *)(v7 + 96) = v24;

  *(unsigned char *)(v7 + 11) = self->_hasMessagesExtension;
  uint64_t v26 = [(NSNumber *)self->_initialODRSize copyWithZone:a3];
  v27 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = v26;

  uint64_t v28 = [(NSNumber *)self->_itemID copyWithZone:a3];
  v29 = *(void **)(v7 + 112);
  *(void *)(v7 + 112) = v28;

  uint64_t v30 = [(NSString *)self->_itemName copyWithZone:a3];
  v31 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v30;

  *(unsigned char *)(v7 + 12) = self->_launchProhibited;
  uint64_t v32 = [(NSURL *)self->_messagesArtworkURL copyWithZone:a3];
  v33 = *(void **)(v7 + 136);
  *(void *)(v7 + 136) = v32;

  *(void *)(v7 + 144) = self->_packageCompression;
  uint64_t v34 = [(NSData *)self->_packageDPInfo copyWithZone:a3];
  v35 = *(void **)(v7 + 152);
  *(void *)(v7 + 152) = v34;

  uint64_t v36 = [(NSData *)self->_packageSINF copyWithZone:a3];
  v37 = *(void **)(v7 + 160);
  *(void *)(v7 + 160) = v36;

  uint64_t v38 = [(NSNumber *)self->_packageSize copyWithZone:a3];
  v39 = *(void **)(v7 + 168);
  *(void *)(v7 + 168) = v38;

  uint64_t v40 = [(NSURL *)self->_packageURL copyWithZone:a3];
  v41 = *(void **)(v7 + 176);
  *(void *)(v7 + 176) = v40;

  uint64_t v42 = [(NSDictionary *)self->_placeholderEntitlements copyWithZone:a3];
  v43 = *(void **)(v7 + 128);
  *(void *)(v7 + 128) = v42;

  uint64_t v44 = [(NSArray *)self->_provisioningProfiles copyWithZone:a3];
  v45 = *(void **)(v7 + 184);
  *(void *)(v7 + 184) = v44;

  uint64_t v46 = [(NSData *)self->_receipt copyWithZone:a3];
  v47 = *(void **)(v7 + 192);
  *(void *)(v7 + 192) = v46;

  *(unsigned char *)(v7 + 9) = self->_requiresPowerPluggedIn;
  uint64_t v48 = [(NSString *)self->_shortBundleVersion copyWithZone:a3];
  v49 = *(void **)(v7 + 200);
  *(void *)(v7 + 200) = v48;

  *(void *)(v7 + 208) = self->_softwarePlatform;
  uint64_t v50 = [(NSString *)self->_storeCohort copyWithZone:a3];
  v51 = *(void **)(v7 + 216);
  *(void *)(v7 + 216) = v50;

  uint64_t v52 = [(NSNumber *)self->_storeFront copyWithZone:a3];
  v53 = *(void **)(v7 + 224);
  *(void *)(v7 + 224) = v52;

  uint64_t v54 = [(NSArray *)self->_subGenres copyWithZone:a3];
  v55 = *(void **)(v7 + 232);
  *(void *)(v7 + 232) = v54;

  uint64_t v56 = [(NSString *)self->_token copyWithZone:a3];
  v57 = *(void **)(v7 + 240);
  *(void *)(v7 + 240) = v56;

  *(unsigned char *)(v7 + 10) = self->_userInitiated;
  uint64_t v58 = [(NSString *)self->_vendorName copyWithZone:a3];
  v59 = *(void **)(v7 + 256);
  *(void *)(v7 + 256) = v58;

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightAppMetadata)initWithCoder:(id)a3
{
  v81[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BI"];
  v6 = [(ASDTestFlightAppMetadata *)self initWithBundleID:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AC"];
    account = v6->_account;
    v6->_account = (ACAccount *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AU"];
    artworkURL = v6->_artworkURL;
    v6->_artworkURL = (NSURL *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v81[2] = objc_opt_class();
    v81[3] = objc_opt_class();
    v81[4] = objc_opt_class();
    v81[5] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:6];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"BA"];
    backgroundAssetMetadata = v6->_backgroundAssetMetadata;
    v6->_backgroundAssetMetadata = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GI"];
    betaBuildGroupID = v6->_betaBuildGroupID;
    v6->_betaBuildGroupID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BV"];
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CI"];
    companionBundleID = v6->_companionBundleID;
    v6->_companionBundleID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EB"];
    existingBundleURL = v6->_existingBundleURL;
    v6->_existingBundleURL = (NSURL *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EV"];
    externalVersionIdentifier = v6->_externalVersionIdentifier;
    v6->_externalVersionIdentifier = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GE"];
    genre = v6->_genre;
    v6->_genre = (ASDTestFlightAppGenre *)v26;

    uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"GN"];
    genreIDs = v6->_genreIDs;
    v6->_genreIDs = (NSArray *)v31;

    v6->_hasMessagesExtension = [v4 decodeBoolForKey:@"HM"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IO"];
    initialODRSize = v6->_initialODRSize;
    v6->_initialODRSize = (NSNumber *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ID"];
    itemID = v6->_itemID;
    v6->_itemID = (NSNumber *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IN"];
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v37;

    v6->_launchProhibited = [v4 decodeBoolForKey:@"LP"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MU"];
    messagesArtworkURL = v6->_messagesArtworkURL;
    v6->_messagesArtworkURL = (NSURL *)v39;

    v6->_packageCompression = [v4 decodeIntegerForKey:@"PC"];
    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PD"];
    packageDPInfo = v6->_packageDPInfo;
    v6->_packageDPInfo = (NSData *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PS"];
    packageSINF = v6->_packageSINF;
    v6->_packageSINF = (NSData *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PZ"];
    packageSize = v6->_packageSize;
    v6->_packageSize = (NSNumber *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PU"];
    packageURL = v6->_packageURL;
    v6->_packageURL = (NSURL *)v47;

    v49 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v49, "setWithObjects:", v50, v51, v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"PE"];
    placeholderEntitlements = v6->_placeholderEntitlements;
    v6->_placeholderEntitlements = (NSDictionary *)v54;

    uint64_t v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"PV"];
    provisioningProfiles = v6->_provisioningProfiles;
    v6->_provisioningProfiles = (NSArray *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RC"];
    receipt = v6->_receipt;
    v6->_receipt = (NSData *)v61;

    v6->_requiresPowerPluggedIn = [v4 decodeBoolForKey:@"RP"];
    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SV"];
    shortBundleVersion = v6->_shortBundleVersion;
    v6->_shortBundleVersion = (NSString *)v63;

    v6->_softwarePlatform = [v4 decodeIntegerForKey:@"SP"];
    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SC"];
    storeCohort = v6->_storeCohort;
    v6->_storeCohort = (NSString *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SF"];
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"SG"];
    subGenres = v6->_subGenres;
    v6->_subGenres = (NSArray *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TK"];
    token = v6->_token;
    v6->_token = (NSString *)v74;

    v6->_userInitiated = [v4 decodeBoolForKey:@"UI"];
    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VA"];
    variantID = v6->_variantID;
    v6->_variantID = (NSString *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VN"];
    vendorName = v6->_vendorName;
    v6->_vendorName = (NSString *)v78;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [v5 encodeObject:account forKey:@"AC"];
  [v5 encodeObject:self->_artworkURL forKey:@"AU"];
  [v5 encodeObject:self->_backgroundAssetMetadata forKey:@"BA"];
  [v5 encodeObject:self->_betaBuildGroupID forKey:@"GI"];
  [v5 encodeObject:self->_bundleID forKey:@"BI"];
  [v5 encodeObject:self->_bundleVersion forKey:@"BV"];
  [v5 encodeObject:self->_companionBundleID forKey:@"CI"];
  [v5 encodeObject:self->_existingBundleURL forKey:@"EB"];
  [v5 encodeObject:self->_externalVersionIdentifier forKey:@"EV"];
  [v5 encodeObject:self->_genre forKey:@"GE"];
  [v5 encodeObject:self->_genreIDs forKey:@"GN"];
  [v5 encodeBool:self->_hasMessagesExtension forKey:@"HM"];
  [v5 encodeObject:self->_initialODRSize forKey:@"IO"];
  [v5 encodeObject:self->_itemID forKey:@"ID"];
  [v5 encodeObject:self->_itemName forKey:@"IN"];
  [v5 encodeBool:self->_launchProhibited forKey:@"LP"];
  [v5 encodeObject:self->_messagesArtworkURL forKey:@"MU"];
  [v5 encodeInteger:self->_packageCompression forKey:@"PC"];
  [v5 encodeObject:self->_packageDPInfo forKey:@"PD"];
  [v5 encodeObject:self->_packageSINF forKey:@"PS"];
  [v5 encodeObject:self->_packageSize forKey:@"PZ"];
  [v5 encodeObject:self->_packageURL forKey:@"PU"];
  [v5 encodeObject:self->_placeholderEntitlements forKey:@"PE"];
  [v5 encodeObject:self->_provisioningProfiles forKey:@"PV"];
  [v5 encodeObject:self->_receipt forKey:@"RC"];
  [v5 encodeBool:self->_requiresPowerPluggedIn forKey:@"RP"];
  [v5 encodeObject:self->_shortBundleVersion forKey:@"SV"];
  [v5 encodeInteger:self->_softwarePlatform forKey:@"SP"];
  [v5 encodeObject:self->_storeCohort forKey:@"SC"];
  [v5 encodeObject:self->_storeFront forKey:@"SF"];
  [v5 encodeObject:self->_subGenres forKey:@"SG"];
  [v5 encodeObject:self->_token forKey:@"TK"];
  [v5 encodeBool:self->_userInitiated forKey:@"UI"];
  [v5 encodeObject:self->_variantID forKey:@"VA"];
  [v5 encodeObject:self->_vendorName forKey:@"VN"];
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSDictionary)backgroundAssetMetadata
{
  return self->_backgroundAssetMetadata;
}

- (void)setBackgroundAssetMetadata:(id)a3
{
}

- (NSString)betaBuildGroupID
{
  return self->_betaBuildGroupID;
}

- (void)setBetaBuildGroupID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)companionBundleID
{
  return self->_companionBundleID;
}

- (void)setCompanionBundleID:(id)a3
{
}

- (NSURL)existingBundleURL
{
  return self->_existingBundleURL;
}

- (void)setExistingBundleURL:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (ASDTestFlightAppGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSArray)genreIDs
{
  return self->_genreIDs;
}

- (void)setGenreIDs:(id)a3
{
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
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

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSDictionary)placeholderEntitlements
{
  return self->_placeholderEntitlements;
}

- (void)setPlaceholderEntitlements:(id)a3
{
}

- (NSURL)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
}

- (int64_t)packageCompression
{
  return self->_packageCompression;
}

- (void)setPackageCompression:(int64_t)a3
{
  self->_packageCompression = a3;
}

- (NSData)packageDPInfo
{
  return self->_packageDPInfo;
}

- (void)setPackageDPInfo:(id)a3
{
}

- (NSData)packageSINF
{
  return self->_packageSINF;
}

- (void)setPackageSINF:(id)a3
{
}

- (NSNumber)packageSize
{
  return self->_packageSize;
}

- (void)setPackageSize:(id)a3
{
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
}

- (NSData)receipt
{
  return self->_receipt;
}

- (void)setReceipt:(id)a3
{
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (void)setStoreCohort:(id)a3
{
}

- (NSNumber)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (NSArray)subGenres
{
  return self->_subGenres;
}

- (void)setSubGenres:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_subGenres, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_packageSize, 0);
  objc_storeStrong((id *)&self->_packageSINF, 0);
  objc_storeStrong((id *)&self->_packageDPInfo, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_placeholderEntitlements, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_genreIDs, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_existingBundleURL, 0);
  objc_storeStrong((id *)&self->_companionBundleID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_betaBuildGroupID, 0);
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end