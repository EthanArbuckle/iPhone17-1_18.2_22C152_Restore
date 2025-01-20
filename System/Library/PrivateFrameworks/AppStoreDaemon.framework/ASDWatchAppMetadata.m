@interface ASDWatchAppMetadata
+ (BOOL)supportsSecureCoding;
+ (id)metadataFromStoreMetadata:(id)a3;
- (ASDWatchAppMetadata)initWithCoder:(id)a3;
- (ASDWatchAppMetadata)initWithItemID:(id)a3;
- (ASDWatchAppMetadata)initWithItemID:(id)a3 externalVersionID:(id)a4;
- (ASDWatchAppMetadata)initWithStoreMetadata:(id)a3;
- (BOOL)isUserInitiated;
- (BOOL)skipIfInstalled;
- (NSNumber)downloaderID;
- (NSNumber)externalVersionID;
- (NSNumber)itemID;
- (NSNumber)previousExternalVersionID;
- (NSNumber)purchaserID;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)bundleID;
- (NSString)previousVariantID;
- (NSString)redownloadParams;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDownloaderID:(id)a3;
- (void)setExternalVersionID:(id)a3;
- (void)setItemID:(id)a3;
- (void)setPreviousExternalVersionID:(id)a3;
- (void)setPreviousVariantID:(id)a3;
- (void)setPurchaserID:(id)a3;
- (void)setRedownloadParams:(id)a3;
- (void)setSkipIfInstalled:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation ASDWatchAppMetadata

+ (id)metadataFromStoreMetadata:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStoreMetadata:v4];

  return v5;
}

- (ASDWatchAppMetadata)initWithItemID:(id)a3
{
  return [(ASDWatchAppMetadata *)self initWithItemID:a3 externalVersionID:0];
}

- (ASDWatchAppMetadata)initWithItemID:(id)a3 externalVersionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDWatchAppMetadata;
  v8 = [(ASDWatchAppMetadata *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    itemID = v8->_itemID;
    v8->_itemID = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    externalVersionID = v8->_externalVersionID;
    v8->_externalVersionID = (NSNumber *)v11;
  }
  return v8;
}

- (ASDWatchAppMetadata)initWithStoreMetadata:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDWatchAppMetadata;
  v5 = [(ASDWatchAppMetadata *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 appleID];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = [v4 softwareVersionBundleID];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 downloaderID];
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v12;

    uint64_t v14 = [v4 softwareVersionExternalIdentifier];
    externalVersionID = v5->_externalVersionID;
    v5->_externalVersionID = (NSNumber *)v14;

    uint64_t v16 = [v4 itemID];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v16;

    uint64_t v18 = [v4 purchaserID];
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v18;

    uint64_t v20 = [v4 redownloadParams];
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v20;
  }
  return v5;
}

- (int64_t)metadataType
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDWatchAppMetadata allocWithZone:](ASDWatchAppMetadata, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_altDSID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setAltDSID:v6];

  id v7 = (void *)[(NSString *)self->_appleID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setAppleID:v7];

  uint64_t v8 = (void *)[(NSString *)self->_bundleID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setBundleID:v8];

  uint64_t v9 = (void *)[(NSNumber *)self->_downloaderID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setDownloaderID:v9];

  uint64_t v10 = (void *)[(NSNumber *)self->_externalVersionID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setExternalVersionID:v10];

  uint64_t v11 = (void *)[(NSNumber *)self->_itemID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setItemID:v11];

  uint64_t v12 = (void *)[(NSNumber *)self->_previousExternalVersionID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setPreviousExternalVersionID:v12];

  v13 = (void *)[(NSString *)self->_previousVariantID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setPreviousVariantID:v13];

  uint64_t v14 = (void *)[(NSNumber *)self->_purchaserID copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setPurchaserID:v14];

  v15 = (void *)[(NSString *)self->_redownloadParams copyWithZone:a3];
  [(ASDWatchAppMetadata *)v5 setRedownloadParams:v15];

  [(ASDWatchAppMetadata *)v5 setSkipIfInstalled:self->_skipIfInstalled];
  [(ASDWatchAppMetadata *)v5 setUserInitiated:self->_userInitiated];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDWatchAppMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ASDWatchAppMetadata;
  v5 = [(ASDWatchAppMetadata *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AD"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AI"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BI"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DI"];
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EV"];
    externalVersionID = v5->_externalVersionID;
    v5->_externalVersionID = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PE"];
    previousExternalVersionID = v5->_previousExternalVersionID;
    v5->_previousExternalVersionID = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PV"];
    previousVariantID = v5->_previousVariantID;
    v5->_previousVariantID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PI"];
    purchaserID = v5->_purchaserID;
    v5->_purchaserID = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BP"];
    redownloadParams = v5->_redownloadParams;
    v5->_redownloadParams = (NSString *)v24;

    v5->_skipIfInstalled = [v4 decodeBoolForKey:@"SK"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"UI"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"AD"];
  [v5 encodeObject:self->_appleID forKey:@"AI"];
  [v5 encodeObject:self->_bundleID forKey:@"BI"];
  [v5 encodeObject:self->_downloaderID forKey:@"DI"];
  [v5 encodeObject:self->_externalVersionID forKey:@"EV"];
  [v5 encodeObject:self->_itemID forKey:@"ID"];
  [v5 encodeObject:self->_previousExternalVersionID forKey:@"PE"];
  [v5 encodeObject:self->_previousVariantID forKey:@"PV"];
  [v5 encodeObject:self->_purchaserID forKey:@"PI"];
  [v5 encodeObject:self->_redownloadParams forKey:@"BP"];
  [v5 encodeBool:self->_skipIfInstalled forKey:@"SK"];
  [v5 encodeBool:self->_userInitiated forKey:@"UI"];
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)downloaderID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownloaderID:(id)a3
{
}

- (NSNumber)externalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExternalVersionID:(id)a3
{
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setItemID:(id)a3
{
}

- (NSNumber)previousExternalVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousExternalVersionID:(id)a3
{
}

- (NSString)previousVariantID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPreviousVariantID:(id)a3
{
}

- (NSNumber)purchaserID
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPurchaserID:(id)a3
{
}

- (NSString)redownloadParams
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRedownloadParams:(id)a3
{
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)skipIfInstalled
{
  return self->_skipIfInstalled;
}

- (void)setSkipIfInstalled:(BOOL)a3
{
  self->_skipIfInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_purchaserID, 0);
  objc_storeStrong((id *)&self->_previousVariantID, 0);
  objc_storeStrong((id *)&self->_previousExternalVersionID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_downloaderID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end