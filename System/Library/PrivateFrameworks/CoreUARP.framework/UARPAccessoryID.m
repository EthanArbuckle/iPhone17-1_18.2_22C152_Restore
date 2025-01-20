@interface UARPAccessoryID
+ (BOOL)supportsSecureCoding;
- (BOOL)analyticsIsEqual:(id)a3;
- (BOOL)autoDownloadAllowed;
- (BOOL)downloadOnCellularAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)shareAnalyticsEventsWithThirdParty;
- (BOOL)suppressAutomaticDynamicAssets;
- (BOOL)suppressInfoQueries;
- (NSString)firmwareVersion;
- (NSString)friendlyName;
- (NSString)hwFusingType;
- (NSString)hwRevision;
- (NSString)manufacturer;
- (NSString)modelAnalytics;
- (NSString)modelIdentifier;
- (NSString)modelName;
- (NSString)modelNumber;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSString)serialNumber;
- (NSString)stagedFirmwareVersion;
- (UARPAccessoryID)initWithCoder:(id)a3;
- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6;
- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8;
- (UARPAccessoryID)initWithModelNumber:(id)a3;
- (UARPAccessoryID)initWithProductGroup:(id)a3 productNumber:(id)a4;
- (UARPAccessoryID)initWithoutUUID;
- (const)assetAvailabilityUpdateNotification;
- (const)supplementalAssetAvailabilityUpdateNotification;
- (id)computeModelIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countryCode;
- (id)description;
- (id)partnerSerialNumbers;
- (id)uuid;
- (int64_t)transport;
- (unint64_t)capability;
- (unint64_t)hash;
- (unint64_t)uarpVersion;
- (void)encodeWithCoder:(id)a3;
- (void)initCountryCode;
- (void)setAutoDownloadAllowed:(BOOL)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setDownloadOnCellularAllowed:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHwFusingType:(id)a3;
- (void)setHwRevision:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setPartnerSerialNumbers:(id)a3;
- (void)setProductGroup:(id)a3;
- (void)setProductNumber:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3;
- (void)setSuppressInfoQueries:(BOOL)a3;
- (void)setTransport:(int64_t)a3;
- (void)setUarpVersion:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation UARPAccessoryID

- (BOOL)analyticsIsEqual:(id)a3
{
  id v4 = a3;
  v5 = [(UARPAccessoryID *)self modelNumber];
  v6 = [v4 modelNumber];
  if ([v5 isEqual:v6])
  {
    v7 = [(UARPAccessoryID *)self serialNumber];
    v8 = [v4 serialNumber];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAccessoryID)initWithoutUUID
{
  v6.receiver = self;
  v6.super_class = (Class)UARPAccessoryID;
  v2 = [(UARPAccessoryID *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    v2->_uarpVersion = 0;
    [(UARPAccessoryID *)v2 initCountryCode];
  }
  return v2;
}

- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(UARPAccessoryID *)self initWithoutUUID];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    manufacturer = v14->_manufacturer;
    v14->_manufacturer = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    modelName = v14->_modelName;
    v14->_modelName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    serialNumber = v14->_serialNumber;
    v14->_serialNumber = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    firmwareVersion = v14->_firmwareVersion;
    v14->_firmwareVersion = (NSString *)v21;
  }
  return v14;
}

- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v16 = [(UARPAccessoryID *)self initWithManufacturer:a3 modelName:a4 serialNumber:a5 firmwareVersion:a6];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    productGroup = v16->_productGroup;
    v16->_productGroup = (NSString *)v17;

    uint64_t v19 = [v15 copy];
    productNumber = v16->_productNumber;
    v16->_productNumber = (NSString *)v19;
  }
  return v16;
}

- (void)initCountryCode
{
  id v6 = [MEMORY[0x263F41768] sharedConfiguration];
  v3 = [v6 countryCode];
  id v4 = (NSString *)[v3 copy];
  countryCode = self->_countryCode;
  self->_countryCode = v4;
}

- (UARPAccessoryID)initWithModelNumber:(id)a3
{
  id v4 = a3;
  v5 = [(UARPAccessoryID *)self initWithoutUUID];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;
  }
  return v5;
}

- (UARPAccessoryID)initWithProductGroup:(id)a3 productNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UARPAccessoryID *)self initWithoutUUID];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    productGroup = v8->_productGroup;
    v8->_productGroup = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    productNumber = v8->_productNumber;
    v8->_productNumber = (NSString *)v11;
  }
  return v8;
}

- (UARPAccessoryID)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)UARPAccessoryID;
  v5 = [(UARPAccessoryID *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productGroup"];
    productGroup = v5->_productGroup;
    v5->_productGroup = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productNumber"];
    productNumber = v5->_productNumber;
    v5->_productNumber = (NSString *)v10;

    v5->_autoDownloadAllowed = [v4 decodeBoolForKey:@"autoDownloadAllowed"];
    v5->_downloadOnCellularAllowed = [v4 decodeBoolForKey:@"downloadOnCellularAllowed"];
    v5->_transport = [v4 decodeIntegerForKey:@"transport"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastAddedDate"];
    lastAddedDate = v5->_lastAddedDate;
    v5->_lastAddedDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagedFirmwareVersion"];
    stagedFirmwareVersion = v5->_stagedFirmwareVersion;
    v5->_stagedFirmwareVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturer"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelNumber"];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareVersion"];
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capability"];
    v5->_capability = [v28 unsignedLongLongValue];

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hwFusingType"];
    hwFusingType = v5->_hwFusingType;
    v5->_hwFusingType = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hwRevision"];
    hwRevision = v5->_hwRevision;
    v5->_hwRevision = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendlyName"];
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v33;

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uarpVersion"];
    v5->_uarpVersion = [v35 unsignedLongLongValue];

    v36 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    v38 = [v36 setWithArray:v37];
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"partnerSerialNumbers"];
    partnerSerialNumbers = v5->_partnerSerialNumbers;
    v5->_partnerSerialNumbers = (NSArray *)v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v7 encodeObject:v4->_manufacturer forKey:@"manufacturer"];
  [v7 encodeObject:v4->_modelName forKey:@"modelName"];
  [v7 encodeObject:v4->_modelNumber forKey:@"modelNumber"];
  [v7 encodeObject:v4->_serialNumber forKey:@"serialNumber"];
  [v7 encodeObject:v4->_firmwareVersion forKey:@"firmwareVersion"];
  [v7 encodeObject:v4->_productGroup forKey:@"productGroup"];
  [v7 encodeObject:v4->_productNumber forKey:@"productNumber"];
  [v7 encodeBool:v4->_autoDownloadAllowed forKey:@"autoDownloadAllowed"];
  [v7 encodeBool:v4->_downloadOnCellularAllowed forKey:@"downloadOnCellularAllowed"];
  [v7 encodeInteger:v4->_transport forKey:@"transport"];
  [v7 encodeObject:v4->_lastAddedDate forKey:@"lastAddedDate"];
  [v7 encodeObject:v4->_countryCode forKey:@"countryCode"];
  [v7 encodeObject:v4->_stagedFirmwareVersion forKey:@"stagedFirmwareVersion"];
  [v7 encodeObject:v4->_uuid forKey:@"uuid"];
  v5 = [NSNumber numberWithUnsignedLongLong:v4->_capability];
  [v7 encodeObject:v5 forKey:@"capability"];

  [v7 encodeObject:v4->_hwFusingType forKey:@"hwFusingType"];
  [v7 encodeObject:v4->_hwRevision forKey:@"hwRevision"];
  [v7 encodeObject:v4->_friendlyName forKey:@"friendlyName"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4->_uarpVersion];
  [v7 encodeObject:v6 forKey:@"uarpVersion"];

  [v7 encodeObject:v4->_partnerSerialNumbers forKey:@"partnerSerialNumbers"];
  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UARPAccessoryID);
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSUUID *)v5->_uuid copy];
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v6;

  uint64_t v8 = [(NSString *)v5->_manufacturer copy];
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v8;

  uint64_t v10 = [(NSString *)v5->_modelName copy];
  modelName = v4->_modelName;
  v4->_modelName = (NSString *)v10;

  uint64_t v12 = [(NSString *)v5->_modelNumber copy];
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v12;

  uint64_t v14 = [(NSString *)v5->_serialNumber copy];
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v14;

  uint64_t v16 = [(NSString *)v5->_firmwareVersion copy];
  firmwareVersion = v4->_firmwareVersion;
  v4->_firmwareVersion = (NSString *)v16;

  uint64_t v18 = [(NSString *)v5->_productGroup copy];
  productGroup = v4->_productGroup;
  v4->_productGroup = (NSString *)v18;

  uint64_t v20 = [(NSString *)v5->_productNumber copy];
  productNumber = v4->_productNumber;
  v4->_productNumber = (NSString *)v20;

  v4->_autoDownloadAllowed = v5->_autoDownloadAllowed;
  v4->_downloadOnCellularAllowed = v5->_downloadOnCellularAllowed;
  v4->_transport = v5->_transport;
  objc_storeStrong((id *)&v4->_lastAddedDate, v5->_lastAddedDate);
  uint64_t v22 = [(NSString *)v5->_countryCode copy];
  countryCode = v4->_countryCode;
  v4->_countryCode = (NSString *)v22;

  uint64_t v24 = [(NSString *)v5->_stagedFirmwareVersion copy];
  stagedFirmwareVersion = v4->_stagedFirmwareVersion;
  v4->_stagedFirmwareVersion = (NSString *)v24;

  v4->_capability = v5->_capability;
  objc_storeStrong((id *)&v4->_hwFusingType, v5->_hwFusingType);
  objc_storeStrong((id *)&v4->_hwRevision, v5->_hwRevision);
  uint64_t v26 = [(NSString *)v5->_friendlyName copy];
  friendlyName = v4->_friendlyName;
  v4->_friendlyName = (NSString *)v26;

  v4->_uarpVersion = v5->_uarpVersion;
  uint64_t v28 = [(NSArray *)v5->_partnerSerialNumbers copy];
  partnerSerialNumbers = v4->_partnerSerialNumbers;
  v4->_partnerSerialNumbers = (NSArray *)v28;

  objc_sync_exit(v5);
  return v4;
}

- (id)uuid
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_uuid;
  objc_sync_exit(v2);

  return v3;
}

- (void)setUuid:(id)a3
{
  id v4 = (NSUUID *)a3;
  obj = self;
  objc_sync_enter(obj);
  uuid = obj->_uuid;
  obj->_uuid = v4;

  objc_sync_exit(obj);
}

- (void)setCountryCode:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  countryCode = v4->_countryCode;
  v4->_countryCode = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setManufacturer:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setModelName:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  modelName = v4->_modelName;
  v4->_modelName = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setModelNumber:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setSerialNumber:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setProductGroup:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  productGroup = v4->_productGroup;
  v4->_productGroup = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setProductNumber:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  productNumber = v4->_productNumber;
  v4->_productNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setFirmwareVersion:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  firmwareVersion = v4->_firmwareVersion;
  v4->_firmwareVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setStagedFirmwareVersion:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  stagedFirmwareVersion = v4->_stagedFirmwareVersion;
  v4->_stagedFirmwareVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setHwFusingType:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  hwFusingType = v4->_hwFusingType;
  v4->_hwFusingType = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setHwRevision:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  hwRevision = v4->_hwRevision;
  v4->_hwRevision = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_suppressAutomaticDynamicAssets = a3;
  objc_sync_exit(obj);
}

- (void)setSuppressInfoQueries:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_suppressInfoQueries = a3;
  objc_sync_exit(obj);
}

- (void)setFriendlyName:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  friendlyName = v4->_friendlyName;
  v4->_friendlyName = (NSString *)v5;

  objc_sync_exit(v4);
}

- (unint64_t)uarpVersion
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t uarpVersion = v2->_uarpVersion;
  objc_sync_exit(v2);

  return uarpVersion;
}

- (void)setUarpVersion:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t uarpVersion = a3;
  objc_sync_exit(obj);
}

- (id)countryCode
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_countryCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapability:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_capability = a3;
  objc_sync_exit(obj);
}

- (unint64_t)capability
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t capability = v2->_capability;
  objc_sync_exit(v2);

  return capability;
}

- (id)computeModelIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_productGroup && v2->_productNumber)
  {
    v3 = (NSString *)[[NSString alloc] initWithFormat:@"%@-%@", v2->_productGroup, v2->_productNumber];
LABEL_6:
    uint64_t v5 = v3;
    goto LABEL_8;
  }
  modelNumber = v2->_modelNumber;
  if (modelNumber)
  {
    v3 = modelNumber;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
LABEL_8:
  objc_sync_exit(v2);

  return v5;
}

- (NSString)modelIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(UARPAccessoryID *)v2 computeModelIdentifier];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)modelAnalytics
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(UARPAccessoryID *)v2 computeModelIdentifier];
  if (!v3) {
    v3 = v2->_modelName;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shareAnalyticsEventsWithThirdParty
{
  v3 = [(UARPAccessoryID *)self productGroup];
  if (v3)
  {
    id v4 = [(UARPAccessoryID *)self productNumber];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (const)assetAvailabilityUpdateNotification
{
  v2 = NSString;
  v3 = [(UARPAccessoryID *)self uuid];
  id v4 = [v2 stringWithFormat:@"com.apple.uarp.aau.%@", v3];
  BOOL v5 = (const char *)[v4 UTF8String];

  return v5;
}

- (const)supplementalAssetAvailabilityUpdateNotification
{
  v2 = NSString;
  v3 = [(UARPAccessoryID *)self uuid];
  id v4 = [v2 stringWithFormat:@"com.apple.uarp.saau.%@", v3];
  BOOL v5 = (const char *)[v4 UTF8String];

  return v5;
}

- (void)setPartnerSerialNumbers:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  partnerSerialNumbers = v4->_partnerSerialNumbers;
  v4->_partnerSerialNumbers = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)partnerSerialNumbers
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(NSArray *)v2->_partnerSerialNumbers containsObject:v2->_serialNumber]) {
    v3 = 0;
  }
  else {
    v3 = v2->_partnerSerialNumbers;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAccessoryID *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(UARPAccessoryID *)self uuid];
      id v7 = [(UARPAccessoryID *)v5 uuid];

      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(UARPAccessoryID *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(UARPAccessoryID *)self uuid];
  id v7 = [v3 stringWithFormat:@"<%@: uuid=%@ ", v5, v6];

  char v8 = [(UARPAccessoryID *)self manufacturer];

  if (v8)
  {
    uint64_t v9 = [(UARPAccessoryID *)self manufacturer];
    [v7 appendFormat:@"manufacturer=%@ ", v9];
  }
  uint64_t v10 = [(UARPAccessoryID *)self modelName];

  if (v10)
  {
    uint64_t v11 = [(UARPAccessoryID *)self modelName];
    [v7 appendFormat:@"model=%@ ", v11];
  }
  uint64_t v12 = [(UARPAccessoryID *)self modelNumber];

  if (v12)
  {
    id v13 = [(UARPAccessoryID *)self modelNumber];
    [v7 appendFormat:@"modelNumber=%@ ", v13];
  }
  uint64_t v14 = [(UARPAccessoryID *)self friendlyName];

  if (v14)
  {
    id v15 = [(UARPAccessoryID *)self friendlyName];
    [v7 appendFormat:@"friendlyName=%@ ", v15];
  }
  uint64_t v16 = [(UARPAccessoryID *)self hwFusingType];

  if (v16)
  {
    uint64_t v17 = [(UARPAccessoryID *)self hwFusingType];
    [v7 appendFormat:@"hwFusing=%@ ", v17];
  }
  uint64_t v18 = [(UARPAccessoryID *)self hwRevision];

  if (v18)
  {
    uint64_t v19 = [(UARPAccessoryID *)self hwRevision];
    [v7 appendFormat:@"hwRevision=%@ ", v19];
  }
  uint64_t v20 = [(UARPAccessoryID *)self serialNumber];
  uint64_t v21 = [(UARPAccessoryID *)self firmwareVersion];
  [v7 appendFormat:@"sn=%@ fw=%@ ", v20, v21];

  uint64_t v22 = [(UARPAccessoryID *)self stagedFirmwareVersion];

  if (v22)
  {
    v23 = [(UARPAccessoryID *)self stagedFirmwareVersion];
    [v7 appendFormat:@"stagedFW=%@ ", v23];
  }
  uint64_t v24 = [(UARPAccessoryID *)self productGroup];

  if (v24)
  {
    v25 = [(UARPAccessoryID *)self productGroup];
    [v7 appendFormat:@"pg=%@ ", v25];
  }
  uint64_t v26 = [(UARPAccessoryID *)self productNumber];

  if (v26)
  {
    v27 = [(UARPAccessoryID *)self productNumber];
    [v7 appendFormat:@"pn=%@ ", v27];
  }
  [v7 appendString:@">"];
  uint64_t v28 = [NSString stringWithString:v7];

  return v28;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)stagedFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)hwFusingType
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)hwRevision
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)downloadOnCellularAllowed
{
  return self->_downloadOnCellularAllowed;
}

- (void)setDownloadOnCellularAllowed:(BOOL)a3
{
  self->_downloadOnCellularAllowed = a3;
}

- (BOOL)autoDownloadAllowed
{
  return self->_autoDownloadAllowed;
}

- (void)setAutoDownloadAllowed:(BOOL)a3
{
  self->_autoDownloadAllowed = a3;
}

- (BOOL)suppressAutomaticDynamicAssets
{
  return self->_suppressAutomaticDynamicAssets;
}

- (BOOL)suppressInfoQueries
{
  return self->_suppressInfoQueries;
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_hwRevision, 0);
  objc_storeStrong((id *)&self->_hwFusingType, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_partnerSerialNumbers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
}

@end