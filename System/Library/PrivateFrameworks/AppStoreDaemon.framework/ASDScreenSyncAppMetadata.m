@interface ASDScreenSyncAppMetadata
+ (BOOL)supportsSecureCoding;
- (ASDScreenSyncAppMetadata)initWithBundleID:(id)a3;
- (ASDScreenSyncAppMetadata)initWithCoder:(id)a3;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)itemID;
- (NSNumber)purchaserDSID;
- (NSNumber)storeFront;
- (NSString)accountName;
- (NSString)bundleID;
- (NSString)itemName;
- (NSString)vendorName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemName:(id)a3;
- (void)setPurchaserDSID:(id)a3;
- (void)setStoreFront:(id)a3;
- (void)setVendorName:(id)a3;
@end

@implementation ASDScreenSyncAppMetadata

- (ASDScreenSyncAppMetadata)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDScreenSyncAppMetadata;
  v6 = [(ASDScreenSyncAppMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (int64_t)metadataType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[ASDScreenSyncAppMetadata allocWithZone:](ASDScreenSyncAppMetadata, "allocWithZone:");
  v6 = (void *)[(NSString *)self->_bundleID copyWithZone:a3];
  v7 = [(ASDScreenSyncAppMetadata *)v5 initWithBundleID:v6];

  uint64_t v8 = [(NSString *)self->_accountName copyWithZone:a3];
  accountName = v7->_accountName;
  v7->_accountName = (NSString *)v8;

  uint64_t v10 = [(NSNumber *)self->_externalVersionIdentifier copyWithZone:a3];
  externalVersionIdentifier = v7->_externalVersionIdentifier;
  v7->_externalVersionIdentifier = (NSNumber *)v10;

  uint64_t v12 = [(NSNumber *)self->_itemID copyWithZone:a3];
  itemID = v7->_itemID;
  v7->_itemID = (NSNumber *)v12;

  uint64_t v14 = [(NSString *)self->_itemName copyWithZone:a3];
  itemName = v7->_itemName;
  v7->_itemName = (NSString *)v14;

  uint64_t v16 = [(NSNumber *)self->_purchaserDSID copyWithZone:a3];
  purchaserDSID = v7->_purchaserDSID;
  v7->_purchaserDSID = (NSNumber *)v16;

  uint64_t v18 = [(NSNumber *)self->_storeFront copyWithZone:a3];
  storeFront = v7->_storeFront;
  v7->_storeFront = (NSNumber *)v18;

  uint64_t v20 = [(NSString *)self->_vendorName copyWithZone:a3];
  vendorName = v7->_vendorName;
  v7->_vendorName = (NSString *)v20;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDScreenSyncAppMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BI"];
  v6 = [(ASDScreenSyncAppMetadata *)self initWithBundleID:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AN"];
    accountName = v6->_accountName;
    v6->_accountName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EV"];
    externalVersionIdentifier = v6->_externalVersionIdentifier;
    v6->_externalVersionIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ID"];
    itemID = v6->_itemID;
    v6->_itemID = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IN"];
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SF"];
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VN"];
    vendorName = v6->_vendorName;
    v6->_vendorName = (NSString *)v17;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  accountName = self->_accountName;
  id v5 = a3;
  [v5 encodeObject:accountName forKey:@"AN"];
  [v5 encodeObject:self->_bundleID forKey:@"BI"];
  [v5 encodeObject:self->_externalVersionIdentifier forKey:@"EV"];
  [v5 encodeObject:self->_itemID forKey:@"ID"];
  [v5 encodeObject:self->_itemName forKey:@"IN"];
  [v5 encodeObject:self->_purchaserDSID forKey:@"PD"];
  [v5 encodeObject:self->_storeFront forKey:@"SF"];
  [v5 encodeObject:self->_vendorName forKey:@"VN"];
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountName:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)externalVersionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setItemName:(id)a3
{
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPurchaserDSID:(id)a3
{
}

- (NSNumber)storeFront
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStoreFront:(id)a3
{
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVendorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_purchaserDSID, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end