@interface ASDApplicationMetadata
+ (BOOL)supportsSecureCoding;
- (ASDApplicationMetadata)initWithBundleID:(id)a3;
- (ASDApplicationMetadata)initWithCoder:(id)a3;
- (BOOL)deviceBasedVPP;
- (BOOL)isBeta;
- (BOOL)isClip;
- (NSNumber)accountID;
- (NSNumber)downloaderID;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)familyID;
- (NSNumber)installOrder;
- (NSNumber)itemID;
- (NSNumber)purchaserDSID;
- (NSNumber)storeFront;
- (NSString)accountName;
- (NSString)altDSID;
- (NSString)artworkPath;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)cohort;
- (NSString)deviceVendorID;
- (NSString)itemName;
- (NSString)shortVersion;
- (NSString)vendorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setArtworkPath:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCohort:(id)a3;
- (void)setDeviceBasedVPP:(BOOL)a3;
- (void)setDeviceVendorID:(id)a3;
- (void)setDownloaderID:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setInstallOrder:(id)a3;
- (void)setIsBeta:(BOOL)a3;
- (void)setIsClip:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setPurchaserDSID:(id)a3;
- (void)setShortVersion:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ASDApplicationMetadata

- (ASDApplicationMetadata)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDApplicationMetadata;
  v6 = [(ASDApplicationMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDApplicationMetadata allocWithZone:](ASDApplicationMetadata, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountName copyWithZone:a3];
  accountName = v5->_accountName;
  v5->_accountName = (NSString *)v6;

  uint64_t v8 = [(NSNumber *)self->_accountID copyWithZone:a3];
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v8;

  uint64_t v10 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_artworkPath copyWithZone:a3];
  artworkPath = v5->_artworkPath;
  v5->_artworkPath = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_cohort copyWithZone:a3];
  cohort = v5->_cohort;
  v5->_cohort = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_deviceVendorID copyWithZone:a3];
  deviceVendorID = v5->_deviceVendorID;
  v5->_deviceVendorID = (NSString *)v20;

  v5->_deviceBasedVPP = self->_deviceBasedVPP;
  uint64_t v22 = [(NSNumber *)self->_downloaderID copyWithZone:a3];
  downloaderID = v5->_downloaderID;
  v5->_downloaderID = (NSNumber *)v22;

  uint64_t v24 = [(NSNumber *)self->_externalVersionIdentifier copyWithZone:a3];
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v24;

  uint64_t v26 = [(NSNumber *)self->_familyID copyWithZone:a3];
  familyID = v5->_familyID;
  v5->_familyID = (NSNumber *)v26;

  v5->_isBeta = self->_isBeta;
  v5->_isClip = self->_isClip;
  uint64_t v28 = [(NSNumber *)self->_installOrder copyWithZone:a3];
  installOrder = v5->_installOrder;
  v5->_installOrder = (NSNumber *)v28;

  uint64_t v30 = [(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v30;

  uint64_t v32 = [(NSString *)self->_itemName copyWithZone:a3];
  itemName = v5->_itemName;
  v5->_itemName = (NSString *)v32;

  uint64_t v34 = [(NSNumber *)self->_purchaserDSID copyWithZone:a3];
  purchaserDSID = v5->_purchaserDSID;
  v5->_purchaserDSID = (NSNumber *)v34;

  uint64_t v36 = [(NSString *)self->_shortVersion copyWithZone:a3];
  shortVersion = v5->_shortVersion;
  v5->_shortVersion = (NSString *)v36;

  uint64_t v38 = [(NSNumber *)self->_storeFront copyWithZone:a3];
  storeFront = v5->_storeFront;
  v5->_storeFront = (NSNumber *)v38;

  uint64_t v40 = [(NSString *)self->_vendorName copyWithZone:a3];
  vendorName = v5->_vendorName;
  v5->_vendorName = (NSString *)v40;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDApplicationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDApplicationMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountName"];
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkPath"];
    artworkPath = v5->_artworkPath;
    v5->_artworkPath = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cohort"];
    cohort = v5->_cohort;
    v5->_cohort = (NSString *)v18;

    v5->_deviceBasedVPP = [v4 decodeBoolForKey:@"deviceBasedVPP"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceVendorID"];
    deviceVendorID = v5->_deviceVendorID;
    v5->_deviceVendorID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloaderID"];
    downloaderID = v5->_downloaderID;
    v5->_downloaderID = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalVersionIdentifier"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyID"];
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installOrder"];
    installOrder = v5->_installOrder;
    v5->_installOrder = (NSNumber *)v30;

    v5->_isBeta = [v4 decodeBoolForKey:@"isBeta"];
    v5->_isClip = [v4 decodeBoolForKey:@"isClip"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];
    itemName = v5->_itemName;
    v5->_itemName = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaserDSID"];
    purchaserDSID = v5->_purchaserDSID;
    v5->_purchaserDSID = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortVersion"];
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeFront"];
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vendorName"];
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v40;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountName = self->_accountName;
  id v5 = a3;
  [v5 encodeObject:accountName forKey:@"accountName"];
  [v5 encodeObject:self->_accountID forKey:@"accountID"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_artworkPath forKey:@"artworkPath"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v5 encodeObject:self->_cohort forKey:@"cohort"];
  [v5 encodeObject:self->_deviceVendorID forKey:@"deviceVendorID"];
  [v5 encodeBool:self->_deviceBasedVPP forKey:@"deviceBasedVPP"];
  [v5 encodeObject:self->_downloaderID forKey:@"downloaderID"];
  [v5 encodeObject:self->_externalVersionIdentifier forKey:@"externalVersionIdentifier"];
  [v5 encodeObject:self->_familyID forKey:@"familyID"];
  [v5 encodeObject:self->_installOrder forKey:@"installOrder"];
  [v5 encodeBool:self->_isBeta forKey:@"isBeta"];
  [v5 encodeBool:self->_isClip forKey:@"isClip"];
  [v5 encodeObject:self->_itemID forKey:@"itemID"];
  [v5 encodeObject:self->_itemName forKey:@"itemName"];
  [v5 encodeObject:self->_purchaserDSID forKey:@"purchaserDSID"];
  [v5 encodeObject:self->_shortVersion forKey:@"shortVersion"];
  [v5 encodeObject:self->_storeFront forKey:@"storeFront"];
  [v5 encodeObject:self->_vendorName forKey:@"vendorName"];
}

- (id)description
{
  downloaderID = self->_downloaderID;
  bundleID = self->_bundleID;
  itemID = self->_itemID;
  itemName = self->_itemName;
  if (downloaderID) {
    [NSString stringWithFormat:@"{ bundleID: %@ itemName: %@ itemID: %@ downloaderID %@ familyID: %@ }", bundleID, itemName, itemID, downloaderID, self->_familyID];
  }
  else {
  uint64_t v6 = [NSString stringWithFormat:@"{ bundleID: %@ itemName: %@ itemID: %@ installOrder: %@ }", bundleID, itemName, itemID, self->_installOrder, v8];
  }
  return v6;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)artworkPath
{
  return self->_artworkPath;
}

- (void)setArtworkPath:(id)a3
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

- (NSString)cohort
{
  return self->_cohort;
}

- (void)setCohort:(id)a3
{
}

- (NSString)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(id)a3
{
}

- (BOOL)deviceBasedVPP
{
  return self->_deviceBasedVPP;
}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  self->_deviceBasedVPP = a3;
}

- (NSNumber)downloaderID
{
  return self->_downloaderID;
}

- (void)setDownloaderID:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (void)setIsClip:(BOOL)a3
{
  self->_isClip = a3;
}

- (NSNumber)installOrder
{
  return self->_installOrder;
}

- (void)setInstallOrder:(id)a3
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

- (NSNumber)purchaserDSID
{
  return self->_purchaserDSID;
}

- (void)setPurchaserDSID:(id)a3
{
}

- (NSNumber)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installOrder, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_downloaderID, 0);
  objc_storeStrong((id *)&self->_deviceVendorID, 0);
  objc_storeStrong((id *)&self->_cohort, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artworkPath, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end