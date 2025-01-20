@interface HMDCHIPAccessoryStorage
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateUsingAccessoryModel:(id)a3;
- (BOOL)wedSupport;
- (HMDCHIPAccessoryStorage)initWithCoder:(id)a3;
- (NSData)attributeDatabase;
- (NSDictionary)debugDictionaryRepresentation;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)softwareVersionNumber;
- (NSNumber)supportedLinkLayerTypes;
- (NSNumber)vendorID;
- (NSSet)pairings;
- (NSString)extendedMACAddress;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeDatabase:(id)a3;
- (void)setExtendedMACAddress:(id)a3;
- (void)setNodeID:(id)a3;
- (void)setPairings:(id)a3;
- (void)setProductID:(id)a3;
- (void)setSoftwareVersionNumber:(id)a3;
- (void)setSupportedLinkLayerTypes:(id)a3;
- (void)setVendorID:(id)a3;
- (void)setWedSupport:(BOOL)a3;
- (void)updateAccessoryModel:(id)a3;
@end

@implementation HMDCHIPAccessoryStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLinkLayerTypes, 0);
  objc_storeStrong((id *)&self->_softwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_extendedMACAddress, 0);
  objc_storeStrong((id *)&self->_pairings, 0);
  objc_storeStrong((id *)&self->_attributeDatabase, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

- (void)setSupportedLinkLayerTypes:(id)a3
{
}

- (NSNumber)supportedLinkLayerTypes
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSoftwareVersionNumber:(id)a3
{
}

- (NSNumber)softwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExtendedMACAddress:(id)a3
{
}

- (NSString)extendedMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWedSupport:(BOOL)a3
{
  self->_wedSupport = a3;
}

- (BOOL)wedSupport
{
  return self->_wedSupport;
}

- (void)setPairings:(id)a3
{
}

- (NSSet)pairings
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttributeDatabase:(id)a3
{
}

- (NSData)attributeDatabase
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNodeID:(id)a3
{
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMDCHIPAccessoryStorage *)self nodeID];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMDCHIPAccessoryStorage *)self nodeID];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F424F8]);
    v6 = [(HMDCHIPAccessoryStorage *)self nodeID];
    v7 = (void *)[v5 initWithName:@"Node ID" value:v6];
    [v3 addObject:v7];
  }
  v8 = [(HMDCHIPAccessoryStorage *)self vendorID];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F424F8]);
    v10 = [(HMDCHIPAccessoryStorage *)self vendorID];
    v11 = (void *)[v9 initWithName:@"Vendor ID" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMDCHIPAccessoryStorage *)self productID];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F424F8]);
    v14 = [(HMDCHIPAccessoryStorage *)self productID];
    v15 = (void *)[v13 initWithName:@"Product ID" value:v14];
    [v3 addObject:v15];
  }
  v16 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x263F424F8]);
    v18 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
    v19 = (void *)[v17 initWithName:@"Attribute Database" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMDCHIPAccessoryStorage *)self pairings];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x263F424F8]);
    v22 = [(HMDCHIPAccessoryStorage *)self pairings];
    v23 = (void *)[v21 initWithName:@"Pairings" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x263F424F8]);
    v26 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
    v27 = (void *)[v25 initWithName:@"eMAC" value:v26];
    [v3 addObject:v27];
  }
  id v28 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCHIPAccessoryStorage *)self wedSupport];
  v29 = HMFBooleanToString();
  v30 = (void *)[v28 initWithName:@"WED" value:v29];
  [v3 addObject:v30];

  v31 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];

  if (v31)
  {
    id v32 = objc_alloc(MEMORY[0x263F424F8]);
    v33 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
    v34 = (void *)[v32 initWithName:@"softwareVersionNumber" value:v33];
    [v3 addObject:v34];
  }
  v35 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];

  if (v35)
  {
    id v36 = objc_alloc(MEMORY[0x263F424F8]);
    v37 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
    v38 = (void *)[v36 initWithName:@"supportedLinkLayerTypes" value:v37];
    [v3 addObject:v38];
  }
  v39 = (void *)[v3 copy];

  return v39;
}

- (HMDCHIPAccessoryStorage)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPAccessoryStorage *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.nodeID"];
  [(HMDCHIPAccessoryStorage *)v5 setNodeID:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.vendorID"];
  [(HMDCHIPAccessoryStorage *)v5 setVendorID:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.productID"];
  [(HMDCHIPAccessoryStorage *)v5 setProductID:v8];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.attributeDatabase"];
  [(HMDCHIPAccessoryStorage *)v5 setAttributeDatabase:v9];

  v10 = (void *)MEMORY[0x263EFFA08];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v12 = [v10 setWithArray:v11];
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HMCAS.ck.pairings"];
  [(HMDCHIPAccessoryStorage *)v5 setPairings:v13];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.wedSupport"];
  -[HMDCHIPAccessoryStorage setWedSupport:](v5, "setWedSupport:", [v14 BOOLValue]);
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.eMAC"];
  [(HMDCHIPAccessoryStorage *)v5 setExtendedMACAddress:v15];

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.softwareVersionNumber"];
  [(HMDCHIPAccessoryStorage *)v5 setSoftwareVersionNumber:v16];

  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCAS.ck.supportedLinkLayerTypes"];

  [(HMDCHIPAccessoryStorage *)v5 setSupportedLinkLayerTypes:v17];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  if ((objc_msgSend(v13, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v13, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
    || objc_msgSend(v13, "hmd_isForRemoteUserAdministrator"))
  {
    id v4 = [(HMDCHIPAccessoryStorage *)self nodeID];
    [v13 encodeObject:v4 forKey:@"HMCAS.ck.nodeID"];

    id v5 = [(HMDCHIPAccessoryStorage *)self pairings];
    [v13 encodeObject:v5 forKey:@"HMCAS.ck.pairings"];

    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"));
    [v13 encodeObject:v6 forKey:@"HMCAS.ck.wedSupport"];

    v7 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
    [v13 encodeObject:v7 forKey:@"HMCAS.ck.eMAC"];

    v8 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
    [v13 encodeObject:v8 forKey:@"HMCAS.ck.supportedLinkLayerTypes"];

    if (objc_msgSend(v13, "hmd_isForLocalStore"))
    {
      id v9 = [(HMDCHIPAccessoryStorage *)self vendorID];
      [v13 encodeObject:v9 forKey:@"HMCAS.ck.vendorID"];

      v10 = [(HMDCHIPAccessoryStorage *)self productID];
      [v13 encodeObject:v10 forKey:@"HMCAS.ck.productID"];

      v11 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
      [v13 encodeObject:v11 forKey:@"HMCAS.ck.attributeDatabase"];

      v12 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
      [v13 encodeObject:v12 forKey:@"HMCAS.softwareVersionNumber"];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMDCHIPAccessoryStorage allocWithZone:a3] init];
  id v5 = [(HMDCHIPAccessoryStorage *)self nodeID];
  [(HMDCHIPAccessoryStorage *)v4 setNodeID:v5];

  v6 = [(HMDCHIPAccessoryStorage *)self vendorID];
  [(HMDCHIPAccessoryStorage *)v4 setVendorID:v6];

  v7 = [(HMDCHIPAccessoryStorage *)self productID];
  [(HMDCHIPAccessoryStorage *)v4 setProductID:v7];

  v8 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
  [(HMDCHIPAccessoryStorage *)v4 setAttributeDatabase:v8];

  id v9 = [(HMDCHIPAccessoryStorage *)self pairings];
  [(HMDCHIPAccessoryStorage *)v4 setPairings:v9];

  [(HMDCHIPAccessoryStorage *)v4 setWedSupport:[(HMDCHIPAccessoryStorage *)self wedSupport]];
  v10 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
  [(HMDCHIPAccessoryStorage *)v4 setExtendedMACAddress:v10];

  v11 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
  [(HMDCHIPAccessoryStorage *)v4 setSoftwareVersionNumber:v11];

  v12 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
  [(HMDCHIPAccessoryStorage *)v4 setSupportedLinkLayerTypes:v12];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(HMDCHIPAccessoryStorage *)self nodeID];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMDCHIPAccessoryStorage *)self vendorID];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDCHIPAccessoryStorage *)self productID];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(HMDCHIPAccessoryStorage *)self pairings];
  uint64_t v12 = v10 ^ [v11 hash];

  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCHIPAccessoryStorage wedSupport](self, "wedSupport"));
  uint64_t v14 = [v13 hash];

  v15 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
  uint64_t v16 = v12 ^ [v15 hash];

  id v17 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
  uint64_t v18 = v16 ^ [v17 hash] ^ v14;

  v19 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
  unint64_t v20 = v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_14;
  }
  v7 = [(HMDCHIPAccessoryStorage *)self nodeID];
  uint64_t v8 = [v6 nodeID];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = [(HMDCHIPAccessoryStorage *)self vendorID];
  v11 = [v6 vendorID];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_14;
  }
  id v13 = [(HMDCHIPAccessoryStorage *)self productID];
  uint64_t v14 = [v6 productID];
  int v15 = HMFEqualObjects();

  if (!v15) {
    goto LABEL_14;
  }
  uint64_t v16 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
  id v17 = [v6 attributeDatabase];
  int v18 = HMFEqualObjects();

  if (!v18) {
    goto LABEL_14;
  }
  int v19 = [(HMDCHIPAccessoryStorage *)self wedSupport];
  if (v19 != [v6 wedSupport]) {
    goto LABEL_14;
  }
  unint64_t v20 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
  id v21 = [v6 extendedMACAddress];
  int v22 = HMFEqualObjects();

  if (!v22) {
    goto LABEL_14;
  }
  v23 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
  v24 = [v6 softwareVersionNumber];
  int v25 = HMFEqualObjects();

  if (!v25) {
    goto LABEL_14;
  }
  v26 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
  v27 = [v6 supportedLinkLayerTypes];
  int v28 = HMFEqualObjects();

  if (v28)
  {
    v29 = [(HMDCHIPAccessoryStorage *)self pairings];
    v30 = [v6 pairings];
    char v31 = HMFEqualObjects();
  }
  else
  {
LABEL_14:
    char v31 = 0;
  }

  return v31;
}

- (void)updateAccessoryModel:(id)a3
{
  id v13 = a3;
  id v4 = [(HMDCHIPAccessoryStorage *)self nodeID];
  if (v4) {
    [v13 setChipNodeID:v4];
  }
  id v5 = [(HMDCHIPAccessoryStorage *)self vendorID];
  if (v5) {
    [v13 setChipVendorID:v5];
  }
  id v6 = [(HMDCHIPAccessoryStorage *)self productID];
  if (v6) {
    [v13 setChipProductID:v6];
  }
  v7 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
  if (v7) {
    [v13 setChipAttributeDatabase:v7];
  }
  uint64_t v8 = [(HMDCHIPAccessoryStorage *)self pairings];
  if (v8) {
    [v13 setChipPairings:v8];
  }
  if ([(HMDCHIPAccessoryStorage *)self wedSupport])
  {
    int v9 = [NSNumber numberWithBool:1];
    [v13 setChipWEDSupport:v9];
  }
  uint64_t v10 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
  if (v10) {
    [v13 setChipExtendedMACAddress:v10];
  }
  v11 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
  if (v11) {
    [v13 setMatterSoftwareVersionNumber:v11];
  }
  int v12 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
  if (v12) {
    [v13 setSupportedLinkLayerTypes:v12];
  }
}

- (BOOL)updateUsingAccessoryModel:(id)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 setProperties];
  if (![v6 containsObject:@"chipNodeID"])
  {

    goto LABEL_7;
  }
  v7 = [(HMDCHIPAccessoryStorage *)self nodeID];
  v3 = [v5 chipNodeID];
  char v8 = HMFEqualObjects();

  if (v8)
  {
LABEL_7:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  int v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = [(HMDCHIPAccessoryStorage *)v10 nodeID];
    id v13 = [v5 chipNodeID];
    int v101 = 138543874;
    v102 = v11;
    __int16 v103 = 2112;
    v104 = v12;
    __int16 v105 = 2112;
    v106 = v13;
    _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Updating storage node ID from %@ to %@", (uint8_t *)&v101, 0x20u);
  }
  uint64_t v14 = [v5 chipNodeID];
  [(HMDCHIPAccessoryStorage *)v10 setNodeID:v14];

  BOOL v15 = 1;
LABEL_8:
  uint64_t v16 = [(HMDCHIPAccessoryStorage *)self vendorID];
  if (v16)
  {
    v3 = [(HMDCHIPAccessoryStorage *)self vendorID];
    if (([v3 isEqualToNumber:&unk_26E4712A8] & 1) == 0) {
      goto LABEL_18;
    }
  }
  id v17 = [v5 setProperties];
  if (![v17 containsObject:@"chipVendorID"])
  {

    if (!v16) {
      goto LABEL_20;
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  int v18 = [(HMDCHIPAccessoryStorage *)self vendorID];
  int v19 = [v5 chipVendorID];
  char v20 = HMFEqualObjects();

  if (v16)
  {
  }
  if ((v20 & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    int v22 = self;
    v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [(HMDCHIPAccessoryStorage *)v22 vendorID];
      int v25 = [v5 chipVendorID];
      int v101 = 138543874;
      v102 = v23;
      __int16 v103 = 2112;
      v104 = v24;
      __int16 v105 = 2112;
      v106 = v25;
      _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Updating storage vendor ID from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    uint64_t v16 = [v5 chipVendorID];
    [(HMDCHIPAccessoryStorage *)v22 setVendorID:v16];
    BOOL v15 = 1;
    goto LABEL_19;
  }
LABEL_20:
  v26 = [(HMDCHIPAccessoryStorage *)self productID];
  if (v26)
  {
    v3 = [(HMDCHIPAccessoryStorage *)self productID];
    if (([v3 isEqualToNumber:&unk_26E4712A8] & 1) == 0)
    {
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
  }
  v27 = [v5 setProperties];
  if (![v27 containsObject:@"chipProductID"])
  {

    if (!v26) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  int v28 = [(HMDCHIPAccessoryStorage *)self productID];
  v29 = [v5 chipProductID];
  char v30 = HMFEqualObjects();

  if (v26)
  {
  }
  if ((v30 & 1) == 0)
  {
    char v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [(HMDCHIPAccessoryStorage *)v32 productID];
      id v36 = [v5 chipProductID];
      int v101 = 138543874;
      v102 = v34;
      __int16 v103 = 2112;
      v104 = v35;
      __int16 v105 = 2112;
      v106 = v36;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating storage product ID from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v26 = [v5 chipProductID];
    [(HMDCHIPAccessoryStorage *)v32 setProductID:v26];
    BOOL v15 = 1;
    goto LABEL_31;
  }
LABEL_32:
  v37 = [v5 setProperties];
  if ([v37 containsObject:@"chipAttributeDatabase"])
  {
    v38 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
    v39 = [v5 chipAttributeDatabase];
    char v40 = HMFEqualObjects();

    if (v40) {
      goto LABEL_38;
    }
    v41 = (void *)MEMORY[0x230FBD990]();
    v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = HMFGetLogIdentifier();
      v45 = [(HMDCHIPAccessoryStorage *)v42 attributeDatabase];
      v46 = [v5 chipAttributeDatabase];
      int v101 = 138543874;
      v102 = v44;
      __int16 v103 = 2112;
      v104 = v45;
      __int16 v105 = 2112;
      v106 = v46;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Updating storage attribute database from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v37 = [v5 chipAttributeDatabase];
    [(HMDCHIPAccessoryStorage *)v42 setAttributeDatabase:v37];
    BOOL v15 = 1;
  }

LABEL_38:
  v47 = [v5 setProperties];
  if ([v47 containsObject:@"chipPairingsData"])
  {
    v48 = [(HMDCHIPAccessoryStorage *)self pairings];
    v49 = [v5 chipPairings];
    char v50 = HMFEqualObjects();

    if (v50) {
      goto LABEL_44;
    }
    v51 = (void *)MEMORY[0x230FBD990]();
    v52 = self;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [(HMDCHIPAccessoryStorage *)v52 pairings];
      v56 = [v5 chipPairings];
      int v101 = 138543874;
      v102 = v54;
      __int16 v103 = 2112;
      v104 = v55;
      __int16 v105 = 2112;
      v106 = v56;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating storage pairings from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v47 = [v5 chipPairings];
    [(HMDCHIPAccessoryStorage *)v52 setPairings:v47];
    BOOL v15 = 1;
  }

LABEL_44:
  v57 = [v5 setProperties];
  if ([v57 containsObject:@"chipWEDSupport"])
  {
    int v58 = [(HMDCHIPAccessoryStorage *)self wedSupport];
    v59 = [v5 chipWEDSupport];
    int v60 = [v59 BOOLValue];

    if (v58 == v60) {
      goto LABEL_50;
    }
    v61 = (void *)MEMORY[0x230FBD990]();
    v62 = self;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      v64 = HMFGetLogIdentifier();
      [(HMDCHIPAccessoryStorage *)v62 wedSupport];
      v65 = HMFBooleanToString();
      v66 = [v5 chipWEDSupport];
      [v66 BOOLValue];
      v67 = HMFBooleanToString();
      int v101 = 138543874;
      v102 = v64;
      __int16 v103 = 2112;
      v104 = v65;
      __int16 v105 = 2112;
      v106 = v67;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating storage WED support from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v57 = [v5 chipWEDSupport];
    -[HMDCHIPAccessoryStorage setWedSupport:](v62, "setWedSupport:", [v57 BOOLValue]);
    BOOL v15 = 1;
  }

LABEL_50:
  v68 = [v5 setProperties];
  if ([v68 containsObject:@"chipExtendedMACAddress"])
  {
    v69 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
    v70 = [v5 chipExtendedMACAddress];
    char v71 = HMFEqualObjects();

    if (v71) {
      goto LABEL_56;
    }
    v72 = (void *)MEMORY[0x230FBD990]();
    v73 = self;
    v74 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      v75 = HMFGetLogIdentifier();
      v76 = [(HMDCHIPAccessoryStorage *)v73 extendedMACAddress];
      v77 = [v5 chipExtendedMACAddress];
      int v101 = 138543874;
      v102 = v75;
      __int16 v103 = 2112;
      v104 = v76;
      __int16 v105 = 2112;
      v106 = v77;
      _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_INFO, "%{public}@Updating storage eMAC Address from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v68 = [v5 chipExtendedMACAddress];
    [(HMDCHIPAccessoryStorage *)v73 setExtendedMACAddress:v68];
    BOOL v15 = 1;
  }

LABEL_56:
  v78 = [v5 setProperties];
  if ([v78 containsObject:@"matterSoftwareVersionNumber"])
  {
    v79 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
    v80 = [v5 matterSoftwareVersionNumber];
    char v81 = HMFEqualObjects();

    if (v81) {
      goto LABEL_62;
    }
    v82 = (void *)MEMORY[0x230FBD990]();
    v83 = self;
    v84 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      v85 = HMFGetLogIdentifier();
      v86 = [(HMDCHIPAccessoryStorage *)v83 softwareVersionNumber];
      v87 = [v5 matterSoftwareVersionNumber];
      int v101 = 138543874;
      v102 = v85;
      __int16 v103 = 2112;
      v104 = v86;
      __int16 v105 = 2112;
      v106 = v87;
      _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_INFO, "%{public}@Updating accessory software version number from %@ to %@", (uint8_t *)&v101, 0x20u);
    }
    v78 = [v5 matterSoftwareVersionNumber];
    [(HMDCHIPAccessoryStorage *)v83 setSoftwareVersionNumber:v78];
    BOOL v15 = 1;
  }

LABEL_62:
  v88 = [v5 setProperties];
  v89 = (void *)[v88 containsObject:@"supportedLinkLayerTypes"];

  if (v89)
  {
    v90 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
    if (v90)
    {
      v89 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
      if (([v89 isEqualToNumber:&unk_26E4712A8] & 1) == 0)
      {

LABEL_72:
        goto LABEL_73;
      }
    }
    v91 = [(HMDCHIPAccessoryStorage *)self supportedLinkLayerTypes];
    v92 = [v5 supportedLinkLayerTypes];
    char v93 = HMFEqualObjects();

    if (v90)
    {
    }
    if ((v93 & 1) == 0)
    {
      v94 = (void *)MEMORY[0x230FBD990]();
      v95 = self;
      v96 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        v97 = HMFGetLogIdentifier();
        v98 = [(HMDCHIPAccessoryStorage *)v95 supportedLinkLayerTypes];
        v99 = [v5 supportedLinkLayerTypes];
        int v101 = 138543874;
        v102 = v97;
        __int16 v103 = 2112;
        v104 = v98;
        __int16 v105 = 2112;
        v106 = v99;
        _os_log_impl(&dword_22F52A000, v96, OS_LOG_TYPE_INFO, "%{public}@Updating matter accessory supported link layer types from %@ to %@", (uint8_t *)&v101, 0x20u);
      }
      v90 = [v5 supportedLinkLayerTypes];
      [(HMDCHIPAccessoryStorage *)v95 setSupportedLinkLayerTypes:v90];
      BOOL v15 = 1;
      goto LABEL_72;
    }
  }
LABEL_73:

  return v15;
}

- (NSDictionary)debugDictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDCHIPAccessoryStorage *)self nodeID];
  [v3 setObject:v4 forKeyedSubscript:@"Node ID"];

  id v5 = [(HMDCHIPAccessoryStorage *)self vendorID];
  [v3 setObject:v5 forKeyedSubscript:@"Vendor ID"];

  id v6 = [(HMDCHIPAccessoryStorage *)self productID];
  [v3 setObject:v6 forKeyedSubscript:@"Product ID"];

  v7 = [(HMDCHIPAccessoryStorage *)self attributeDatabase];
  [v3 setObject:v7 forKeyedSubscript:@"Attribute Database"];

  char v8 = [(HMDCHIPAccessoryStorage *)self pairings];
  int v9 = [v8 description];
  [v3 setObject:v9 forKeyedSubscript:@"Pairings"];

  [(HMDCHIPAccessoryStorage *)self wedSupport];
  uint64_t v10 = HMFBooleanToString();
  v11 = [v10 description];
  [v3 setObject:v11 forKeyedSubscript:@"WED"];

  int v12 = [(HMDCHIPAccessoryStorage *)self extendedMACAddress];
  id v13 = [v12 description];
  [v3 setObject:v13 forKeyedSubscript:@"eMAC"];

  uint64_t v14 = [(HMDCHIPAccessoryStorage *)self softwareVersionNumber];
  [v3 setObject:v14 forKeyedSubscript:@"softwareVersionNumber"];

  BOOL v15 = (void *)[v3 copy];
  return (NSDictionary *)v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_73794 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_73794, &__block_literal_global_73795);
  }
  v2 = (void *)logCategory__hmf_once_v11_73796;
  return v2;
}

void __38__HMDCHIPAccessoryStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_73796;
  logCategory__hmf_once_v11_73796 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end