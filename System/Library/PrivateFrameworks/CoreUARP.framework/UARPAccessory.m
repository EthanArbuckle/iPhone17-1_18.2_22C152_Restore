@interface UARPAccessory
+ (id)logger;
- (BOOL)assetTransfersPaused;
- (BOOL)autoDownloadAllowed;
- (BOOL)clientQueryPendingForProperty:(unint64_t)a3;
- (BOOL)downloadOnCellularAllowed;
- (BOOL)enableFirmwareDownloadOnDemand;
- (BOOL)isEqual:(id)a3;
- (BOOL)reachable;
- (BOOL)suppressAutomaticDynamicAssets;
- (BOOL)suppressInfoQueries;
- (BOOL)userInitiatedFirmwareApply;
- (BOOL)userInitiatedFirmwareStaging;
- (NSString)availableFirmwareVersion;
- (NSString)filepathCurrentAsset;
- (NSString)firmwareVersion;
- (NSString)friendlyName;
- (NSString)hwFusingType;
- (NSString)hwRevision;
- (NSString)manufacturer;
- (NSString)modelName;
- (NSString)modelNumber;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSString)serialNumber;
- (NSString)stagedFirmwareVersion;
- (NSUUID)uuid;
- (UARPAccessory)initWithHardwareID:(id)a3 uuid:(id)a4;
- (UARPAccessory)initWithID:(id)a3;
- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6;
- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8;
- (UARPAccessory)initWithModelNumber:(id)a3;
- (UARPAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 uuid:(id)a5;
- (id)bsdNotifications;
- (id)description;
- (id)getID;
- (id)partnerSerialNumbers;
- (id)pendingAssets;
- (id)serviceBsdNotifications;
- (int64_t)transport;
- (unint64_t)capability;
- (unint64_t)uarpVersion;
- (unsigned)firmwareUpdateBytesTotal;
- (unsigned)firmwareUpdateBytesTransferred;
- (void)addPendingAsset:(id)a3;
- (void)addPendingClientPropertyQuery:(unint64_t)a3;
- (void)removePendingAsset:(id)a3;
- (void)removePendingClientPropertyQuery:(unint64_t)a3;
- (void)setAssetTransfersPaused:(BOOL)a3;
- (void)setAutoDownloadAllowed:(BOOL)a3;
- (void)setAvailableFirmwareVersion:(id)a3;
- (void)setCapability:(unint64_t)a3;
- (void)setDownloadOnCellularAllowed:(BOOL)a3;
- (void)setEnableFirmwareDownloadOnDemand:(BOOL)a3;
- (void)setFilepathCurrentAsset:(id)a3;
- (void)setFirmwareUpdateBytesTotal:(unsigned int)a3;
- (void)setFirmwareUpdateBytesTransferred:(unsigned int)a3;
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
- (void)setReachable:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3;
- (void)setSuppressInfoQueries:(BOOL)a3;
- (void)setTransport:(int64_t)a3;
- (void)setUarpVersion:(unint64_t)a3;
- (void)setUserInitiatedFirmwareApply:(BOOL)a3;
- (void)setUserInitiatedFirmwareStaging:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation UARPAccessory

- (UARPAccessory)initWithID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UARPAccessory;
  v6 = [(UARPAccessory *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_id, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    internalPendingAssets = v7->_internalPendingAssets;
    v7->_internalPendingAssets = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    pendingClientPropertyQueries = v7->_pendingClientPropertyQueries;
    v7->_pendingClientPropertyQueries = (NSMutableSet *)v10;
  }
  return v7;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[UARPAccessoryID alloc] initWithManufacturer:v13 modelName:v12 serialNumber:v11 firmwareVersion:v10];

  v15 = [(UARPAccessory *)self initWithID:v14];
  return v15;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[UARPAccessoryID alloc] initWithManufacturer:v19 modelName:v18 serialNumber:v17 firmwareVersion:v16 productGroup:v15 productNumber:v14];

  v21 = [(UARPAccessory *)self initWithID:v20];
  return v21;
}

- (UARPAccessory)initWithModelNumber:(id)a3
{
  id v4 = a3;
  id v5 = [[UARPAccessoryID alloc] initWithModelNumber:v4];

  v6 = [(UARPAccessory *)self initWithID:v5];
  return v6;
}

- (UARPAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[UARPAccessoryID alloc] initWithManufacturer:0 modelName:0 serialNumber:0 firmwareVersion:0 productGroup:v10 productNumber:v9];

  [(UARPAccessoryID *)v11 setUuid:v8];
  id v12 = [(UARPAccessory *)self initWithID:v11];

  return v12;
}

- (UARPAccessory)initWithHardwareID:(id)a3 uuid:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UARPAccessory logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = +[UARPSupportedAccessory supportedAccessories];
    int v25 = 138412290;
    v26 = v9;
    _os_log_impl(&dword_21E079000, v8, OS_LOG_TYPE_INFO, "Supported accessories %@", (uint8_t *)&v25, 0xCu);
  }
  id v10 = +[UARPSupportedAccessory findByHardwareID:v6];
  id v11 = v10;
  if (!v10)
  {
    id v16 = +[UARPAccessory logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPAccessory initWithHardwareID:uuid:]((uint64_t)v6, v16);
    }
    goto LABEL_18;
  }
  id v12 = [v10 appleModelNumber];

  if (!v12)
  {
    uint64_t v18 = [v11 productGroup];
    if (v18)
    {
      id v19 = (void *)v18;
      v20 = [v11 productNumber];

      if (v20)
      {
        v21 = +[UARPAccessory logger];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          v26 = v11;
          _os_log_impl(&dword_21E079000, v21, OS_LOG_TYPE_INFO, "PG/PN based accessory %@", (uint8_t *)&v25, 0xCu);
        }

        v22 = [UARPAccessoryID alloc];
        id v15 = [v11 productGroup];
        v23 = [v11 productNumber];
        id v16 = [(UARPAccessoryID *)v22 initWithProductGroup:v15 productNumber:v23];

        goto LABEL_8;
      }
    }
    id v16 = +[UARPAccessory logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPAccessory initWithHardwareID:uuid:]((uint64_t)v11, v16);
    }
LABEL_18:
    id v17 = 0;
    goto LABEL_19;
  }
  id v13 = +[UARPAccessory logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    v26 = v11;
    _os_log_impl(&dword_21E079000, v13, OS_LOG_TYPE_INFO, "Apple Model Number based accessory %@", (uint8_t *)&v25, 0xCu);
  }

  id v14 = [UARPAccessoryID alloc];
  id v15 = [v11 appleModelNumber];
  id v16 = [(UARPAccessoryID *)v14 initWithModelNumber:v15];
LABEL_8:

  [v16 setUuid:v7];
  -[NSObject setTransport:](v16, "setTransport:", [v6 transport]);
  self = [(UARPAccessory *)self initWithID:v16];
  id v17 = self;
LABEL_19:

  return v17;
}

- (NSString)serialNumber
{
  return [(UARPAccessoryID *)self->_id serialNumber];
}

- (NSString)modelName
{
  return [(UARPAccessoryID *)self->_id modelName];
}

- (NSString)modelNumber
{
  return [(UARPAccessoryID *)self->_id modelNumber];
}

- (NSString)manufacturer
{
  return [(UARPAccessoryID *)self->_id manufacturer];
}

- (id)getID
{
  return self->_id;
}

- (id)description
{
  return [(UARPAccessoryID *)self->_id description];
}

- (NSString)firmwareVersion
{
  return [(UARPAccessoryID *)self->_id firmwareVersion];
}

- (NSString)productNumber
{
  return [(UARPAccessoryID *)self->_id productNumber];
}

- (NSString)productGroup
{
  return [(UARPAccessoryID *)self->_id productGroup];
}

- (NSString)stagedFirmwareVersion
{
  return [(UARPAccessoryID *)self->_id stagedFirmwareVersion];
}

- (BOOL)downloadOnCellularAllowed
{
  return [(UARPAccessoryID *)self->_id downloadOnCellularAllowed];
}

- (BOOL)autoDownloadAllowed
{
  return [(UARPAccessoryID *)self->_id autoDownloadAllowed];
}

- (NSString)hwFusingType
{
  return [(UARPAccessoryID *)self->_id hwFusingType];
}

- (NSString)hwRevision
{
  return [(UARPAccessoryID *)self->_id hwRevision];
}

- (BOOL)suppressAutomaticDynamicAssets
{
  return [(UARPAccessoryID *)self->_id suppressAutomaticDynamicAssets];
}

- (BOOL)suppressInfoQueries
{
  return [(UARPAccessoryID *)self->_id suppressInfoQueries];
}

- (NSString)friendlyName
{
  return [(UARPAccessoryID *)self->_id friendlyName];
}

- (unint64_t)uarpVersion
{
  return [(UARPAccessoryID *)self->_id uarpVersion];
}

- (void)setDownloadOnCellularAllowed:(BOOL)a3
{
}

- (void)setAutoDownloadAllowed:(BOOL)a3
{
}

- (void)setSerialNumber:(id)a3
{
}

- (void)setModelName:(id)a3
{
}

- (void)setModelNumber:(id)a3
{
}

- (void)setManufacturer:(id)a3
{
}

- (void)setFirmwareVersion:(id)a3
{
}

- (void)setProductGroup:(id)a3
{
}

- (void)setProductNumber:(id)a3
{
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void)setHwFusingType:(id)a3
{
}

- (void)setHwRevision:(id)a3
{
}

- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3
{
}

- (void)setSuppressInfoQueries:(BOOL)a3
{
}

- (void)setFriendlyName:(id)a3
{
}

- (void)setUarpVersion:(unint64_t)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAccessory *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = self == v4 || [(UARPAccessoryID *)self->_id isEqual:v4->_id];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addPendingAsset:(id)a3
{
}

- (void)removePendingAsset:(id)a3
{
}

- (id)pendingAssets
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->_internalPendingAssets];
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setAssetTransfersPaused:(BOOL)a3
{
  self->_assetTransfersPaused = a3;
}

- (BOOL)assetTransfersPaused
{
  return self->_assetTransfersPaused;
}

- (void)setTransport:(int64_t)a3
{
}

- (int64_t)transport
{
  return [(UARPAccessoryID *)self->_id transport];
}

- (NSUUID)uuid
{
  return (NSUUID *)[(UARPAccessoryID *)self->_id uuid];
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)capability
{
  return [(UARPAccessoryID *)self->_id capability];
}

- (void)setCapability:(unint64_t)a3
{
}

- (void)addPendingClientPropertyQuery:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pendingClientPropertyQueries addObject:v4];
}

- (void)removePendingClientPropertyQuery:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pendingClientPropertyQueries removeObject:v4];
}

- (BOOL)clientQueryPendingForProperty:(unint64_t)a3
{
  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(pendingClientPropertyQueries) = [(NSMutableSet *)pendingClientPropertyQueries containsObject:v4];

  return (char)pendingClientPropertyQueries;
}

+ (id)logger
{
  if (logger_onceToken != -1) {
    dispatch_once(&logger_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)logger_myLog;
  return v2;
}

uint64_t __23__UARPAccessory_logger__block_invoke()
{
  logger_myLog = (uint64_t)os_log_create("com.apple.accessoryupdater.uarp", "uarpAccessory");
  return MEMORY[0x270F9A758]();
}

- (id)bsdNotifications
{
  v2 = [(UARPAccessoryID *)self->_id modelNumber];
  v3 = +[UARPSupportedAccessory findByAppleModelNumber:v2];

  id v4 = [v3 bsdNotifications];

  return v4;
}

- (id)serviceBsdNotifications
{
  v2 = [(UARPAccessoryID *)self->_id modelNumber];
  v3 = +[UARPSupportedAccessory findByAppleModelNumber:v2];

  id v4 = [v3 serviceBsdNotifications];

  return v4;
}

- (void)setPartnerSerialNumbers:(id)a3
{
  id v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  partnerSerialNumbers = obj->_partnerSerialNumbers;
  obj->_partnerSerialNumbers = v4;

  objc_sync_exit(obj);
}

- (id)partnerSerialNumbers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_partnerSerialNumbers;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)availableFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAvailableFirmwareVersion:(id)a3
{
}

- (BOOL)userInitiatedFirmwareStaging
{
  return self->_userInitiatedFirmwareStaging;
}

- (void)setUserInitiatedFirmwareStaging:(BOOL)a3
{
  self->_userInitiatedFirmwareStaging = a3;
}

- (BOOL)userInitiatedFirmwareApply
{
  return self->_userInitiatedFirmwareApply;
}

- (void)setUserInitiatedFirmwareApply:(BOOL)a3
{
  self->_userInitiatedFirmwareApply = a3;
}

- (unsigned)firmwareUpdateBytesTransferred
{
  return self->_firmwareUpdateBytesTransferred;
}

- (void)setFirmwareUpdateBytesTransferred:(unsigned int)a3
{
  self->_firmwareUpdateBytesTransferred = a3;
}

- (unsigned)firmwareUpdateBytesTotal
{
  return self->_firmwareUpdateBytesTotal;
}

- (void)setFirmwareUpdateBytesTotal:(unsigned int)a3
{
  self->_firmwareUpdateBytesTotal = a3;
}

- (NSString)filepathCurrentAsset
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFilepathCurrentAsset:(id)a3
{
}

- (BOOL)enableFirmwareDownloadOnDemand
{
  return self->_enableFirmwareDownloadOnDemand;
}

- (void)setEnableFirmwareDownloadOnDemand:(BOOL)a3
{
  self->_enableFirmwareDownloadOnDemand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filepathCurrentAsset, 0);
  objc_storeStrong((id *)&self->_availableFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_partnerSerialNumbers, 0);
  objc_storeStrong((id *)&self->_pendingClientPropertyQueries, 0);
  objc_storeStrong((id *)&self->_internalPendingAssets, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithHardwareID:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Unsupported hardwareID %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithHardwareID:(uint64_t)a1 uuid:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Unsupported accessory %@", (uint8_t *)&v2, 0xCu);
}

@end