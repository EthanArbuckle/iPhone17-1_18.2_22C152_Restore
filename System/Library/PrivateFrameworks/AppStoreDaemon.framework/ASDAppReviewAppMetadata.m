@interface ASDAppReviewAppMetadata
+ (BOOL)supportsSecureCoding;
- (ASDAppReviewAppMetadata)initWithCoder:(id)a3;
- (ASDAppReviewAppMetadata)initWithStoreMetadata:(id)a3;
- (BOOL)hasMessagesExtension;
- (BOOL)isBeta;
- (BOOL)isLaunchProhibited;
- (MIStoreMetadata)storeMetadata;
- (NSData)onDemandResourceManifest;
- (NSData)packageDPInfo;
- (NSData)packageSINF;
- (NSDictionary)backgroundAssetMetadata;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)initialODRSize;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)itemName;
- (NSString)variantID;
- (NSString)vendorName;
- (NSURL)artworkURL;
- (NSURL)messagesArtworkURL;
- (NSURL)packageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setBackgroundAssetMetadata:(id)a3;
- (void)setBeta:(BOOL)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setHasMessagesExtension:(BOOL)a3;
- (void)setInitialODRSize:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setMessagesArtworkURL:(id)a3;
- (void)setOnDemandResourceManifest:(id)a3;
- (void)setPackageDPInfo:(id)a3;
- (void)setPackageSINF:(id)a3;
- (void)setPackageURL:(id)a3;
- (void)setStoreMetadata:(id)a3;
- (void)setVariantID:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ASDAppReviewAppMetadata

- (ASDAppReviewAppMetadata)initWithStoreMetadata:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDAppReviewAppMetadata;
  v6 = [(ASDAppReviewAppMetadata *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeMetadata, a3);
    uint64_t v8 = [v5 softwareVersionBundleID];
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    v7->_hasMessagesExtension = [v5 hasMessagesExtension];
    uint64_t v10 = [v5 initialODRSize];
    initialODRSize = v7->_initialODRSize;
    v7->_initialODRSize = (NSNumber *)v10;

    uint64_t v12 = [v5 itemID];
    itemID = v7->_itemID;
    v7->_itemID = (NSNumber *)v12;

    uint64_t v14 = [v5 itemName];
    itemName = v7->_itemName;
    v7->_itemName = (NSString *)v14;

    v7->_launchProhibited = [v5 isLaunchProhibited];
    uint64_t v16 = [v5 artistName];
    vendorName = v7->_vendorName;
    v7->_vendorName = (NSString *)v16;

    uint64_t v18 = [v5 softwareVersionExternalIdentifier];
    externalVersionIdentifier = v7->_externalVersionIdentifier;
    v7->_externalVersionIdentifier = (NSNumber *)v18;

    if (!v7->_externalVersionIdentifier)
    {
      v7->_beta = 1;
      uint64_t v20 = [v5 betaExternalVersionIdentifier];
      v21 = v7->_externalVersionIdentifier;
      v7->_externalVersionIdentifier = (NSNumber *)v20;
    }
  }

  return v7;
}

- (int64_t)metadataType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDAppReviewAppMetadata allocWithZone:](ASDAppReviewAppMetadata, "allocWithZone:") init];
  uint64_t v6 = [(NSURL *)self->_artworkURL copyWithZone:a3];
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = (NSURL *)v6;

  uint64_t v8 = [(NSDictionary *)self->_backgroundAssetMetadata copyWithZone:a3];
  backgroundAssetMetadata = v5->_backgroundAssetMetadata;
  v5->_backgroundAssetMetadata = (NSDictionary *)v8;

  uint64_t v10 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v10;

  uint64_t v12 = [(NSNumber *)self->_externalVersionIdentifier copyWithZone:a3];
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v12;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  uint64_t v14 = [(NSNumber *)self->_initialODRSize copyWithZone:a3];
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = (NSNumber *)v14;

  uint64_t v16 = [(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v16;

  uint64_t v18 = [(NSString *)self->_itemName copyWithZone:a3];
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v18;

  v5->_launchProhibited = self->_launchProhibited;
  uint64_t v20 = [(NSURL *)self->_messagesArtworkURL copyWithZone:a3];
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = (NSURL *)v20;

  uint64_t v22 = [(NSData *)self->_packageDPInfo copyWithZone:a3];
  packageDPInfo = v5->_packageDPInfo;
  v5->_packageDPInfo = (NSData *)v22;

  uint64_t v24 = [(NSData *)self->_packageSINF copyWithZone:a3];
  packageSINF = v5->_packageSINF;
  v5->_packageSINF = (NSData *)v24;

  uint64_t v26 = [(NSURL *)self->_packageURL copyWithZone:a3];
  packageURL = v5->_packageURL;
  v5->_packageURL = (NSURL *)v26;

  uint64_t v28 = [(NSString *)self->_vendorName copyWithZone:a3];
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v28;

  uint64_t v30 = [(NSData *)self->_onDemandResourceManifest copyWithZone:a3];
  onDemandResourceManifest = v5->_onDemandResourceManifest;
  v5->_onDemandResourceManifest = (NSData *)v30;

  uint64_t v32 = [(MIStoreMetadata *)self->_storeMetadata copyWithZone:a3];
  storeMetadata = v5->_storeMetadata;
  v5->_storeMetadata = (MIStoreMetadata *)v32;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppReviewAppMetadata)initWithCoder:(id)a3
{
  v41[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ASDAppReviewAppMetadata;
  id v5 = [(ASDAppReviewAppMetadata *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AU"];
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v41[3] = objc_opt_class();
    v41[4] = objc_opt_class();
    v41[5] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];
    uint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"BA"];
    backgroundAssetMetadata = v5->_backgroundAssetMetadata;
    v5->_backgroundAssetMetadata = (NSDictionary *)v11;

    v5->_beta = [v4 decodeBoolForKey:@"BE"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BI"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EV"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v15;

    v5->_hasMessagesExtension = [v4 decodeBoolForKey:@"HM"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IO"];
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IN"];
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v21;

    v5->_launchProhibited = [v4 decodeBoolForKey:@"LP"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MU"];
    messagesArtworkURL = v5->_messagesArtworkURL;
    v5->_messagesArtworkURL = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PD"];
    packageDPInfo = v5->_packageDPInfo;
    v5->_packageDPInfo = (NSData *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PS"];
    packageSINF = v5->_packageSINF;
    v5->_packageSINF = (NSData *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PU"];
    packageURL = v5->_packageURL;
    v5->_packageURL = (NSURL *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VA"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VN"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OM"];
    onDemandResourceManifest = v5->_onDemandResourceManifest;
    v5->_onDemandResourceManifest = (NSData *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SM"];
    storeMetadata = v5->_storeMetadata;
    v5->_storeMetadata = (MIStoreMetadata *)v37;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  artworkURL = self->_artworkURL;
  id v5 = a3;
  [v5 encodeObject:artworkURL forKey:@"AU"];
  [v5 encodeObject:self->_backgroundAssetMetadata forKey:@"BA"];
  [v5 encodeBool:self->_beta forKey:@"BE"];
  [v5 encodeObject:self->_bundleID forKey:@"BI"];
  [v5 encodeObject:self->_externalVersionIdentifier forKey:@"EV"];
  [v5 encodeBool:self->_hasMessagesExtension forKey:@"HM"];
  [v5 encodeObject:self->_initialODRSize forKey:@"IO"];
  [v5 encodeObject:self->_itemID forKey:@"ID"];
  [v5 encodeObject:self->_itemName forKey:@"IN"];
  [v5 encodeBool:self->_launchProhibited forKey:@"LP"];
  [v5 encodeObject:self->_messagesArtworkURL forKey:@"MU"];
  [v5 encodeObject:self->_packageDPInfo forKey:@"PD"];
  [v5 encodeObject:self->_packageSINF forKey:@"PS"];
  [v5 encodeObject:self->_packageURL forKey:@"PU"];
  [v5 encodeObject:self->_variantID forKey:@"VA"];
  [v5 encodeObject:self->_vendorName forKey:@"VN"];
  [v5 encodeObject:self->_onDemandResourceManifest forKey:@"OM"];
  [v5 encodeObject:self->_storeMetadata forKey:@"SM"];
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

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
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

- (NSURL)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
}

- (NSData)onDemandResourceManifest
{
  return self->_onDemandResourceManifest;
}

- (void)setOnDemandResourceManifest:(id)a3
{
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

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
}

- (MIStoreMetadata)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
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
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_packageSINF, 0);
  objc_storeStrong((id *)&self->_packageDPInfo, 0);
  objc_storeStrong((id *)&self->_onDemandResourceManifest, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
}

@end