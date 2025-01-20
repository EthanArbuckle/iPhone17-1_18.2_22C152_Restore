@interface UARPSupportedAccessory
+ (id)findByAppleModelNumber:(id)a3;
+ (id)findByHardwareID:(id)a3;
+ (id)supportedAccessories;
+ (id)supportedAccessoriesByTransport:(int64_t)a3;
- (BOOL)allowDownloadOnCellular;
- (BOOL)autoAppliesStagedFirmware;
- (BOOL)dfuMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMFi;
- (BOOL)isSimulator;
- (BOOL)postStagingNotifications;
- (BOOL)reofferFirmwareOnSync;
- (BOOL)supportsAccMode7;
- (BOOL)supportsAnalytics;
- (BOOL)supportsDeveloperSettings;
- (BOOL)supportsFriendlyName;
- (BOOL)supportsHeySiriCompact;
- (BOOL)supportsInternalSettings;
- (BOOL)supportsLogs;
- (BOOL)supportsMappedAnalytics;
- (BOOL)supportsPowerLogging;
- (BOOL)supportsVersions;
- (BOOL)supportsVoiceAssist;
- (BOOL)ttrSolicitLogs;
- (BOOL)updateRequiresPowerAssertion;
- (NSSet)alternativeAppleModelNumbers;
- (NSSet)bsdNotifications;
- (NSSet)downstreamAppleModelNumbers;
- (NSSet)serviceBsdNotifications;
- (NSSet)supplementalAssets;
- (NSString)appleModelNumber;
- (NSString)fusingOverrideUnfused;
- (NSString)identifier;
- (NSString)mobileAssetAppleModelNumber;
- (NSString)modelName;
- (NSString)personalizationNotification;
- (NSString)productCode;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSString)supplementalMobileAssetAppleModelNumber;
- (NSString)updaterName;
- (NSString)vendorName;
- (UARPAccessoryHardwareID)hardwareID;
- (UARPSupportedAccessory)init;
- (UARPSupportedAccessory)initWithBluetoothDictionary:(id)a3;
- (UARPSupportedAccessory)initWithDictionary:(id)a3;
- (UARPSupportedAccessory)initWithHDSDictionary:(id)a3;
- (UARPSupportedAccessory)initWithHIDDictionary:(id)a3;
- (UARPSupportedAccessory)initWithHardwareID:(id)a3 appleModelNumber:(id)a4 capabilities:(unint64_t)a5;
- (UARPSupportedAccessory)initWithHardwareID:(id)a3 capabilities:(unint64_t)a4;
- (UARPSupportedAccessory)initWithHardwareID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 capabilities:(unint64_t)a6;
- (UARPSupportedAccessory)initWithIICDictionary:(id)a3;
- (UARPSupportedAccessory)initWithUSBDictionary:(id)a3;
- (UARPSupportedAccessory)initWithUSBPDDictionary:(id)a3;
- (id)description;
- (id)generatePlist;
- (id)hashIdentifier;
- (id)plistFilename;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (unint64_t)uploaderResponseTimeout;
- (unint64_t)uploaderRetryLimit;
- (void)addAlternativeAppleModelNumber:(id)a3;
- (void)addBSDNotificationName:(id)a3;
- (void)addDownstreamAppleModelNumber:(id)a3;
- (void)addServiceBSDNotificationName:(id)a3;
- (void)addSupplementalAssetName:(id)a3;
- (void)removeAlternativeAppleModelNumber:(id)a3;
- (void)removeDownstreamAppleModelNumbers;
- (void)setAllowDownloadOnCellular:(BOOL)a3;
- (void)setAppleModelNumber:(id)a3;
- (void)setAutoAppliesStagedFirmware:(BOOL)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setDfuMode:(BOOL)a3;
- (void)setFusingOverrideUnfused:(id)a3;
- (void)setHardwareID:(id)a3;
- (void)setIsSimulator:(BOOL)a3;
- (void)setMobileAssetAppleModelNumber:(id)a3;
- (void)setModelName:(id)a3;
- (void)setPersonalizationNotification:(id)a3;
- (void)setPostStagingNotifications:(BOOL)a3;
- (void)setProductCode:(id)a3;
- (void)setProductGroup:(id)a3;
- (void)setProductNumber:(id)a3;
- (void)setReofferFirmwareOnSync:(BOOL)a3;
- (void)setSupplementalMobileAssetAppleModelNumber:(id)a3;
- (void)setSupportsAccMode7:(BOOL)a3;
- (void)setSupportsAnalytics:(BOOL)a3;
- (void)setSupportsDeveloperSettings:(BOOL)a3;
- (void)setSupportsFriendlyName:(BOOL)a3;
- (void)setSupportsHeySiriCompact:(BOOL)a3;
- (void)setSupportsInternalSettings:(BOOL)a3;
- (void)setSupportsLogs:(BOOL)a3;
- (void)setSupportsMappedAnalytics:(BOOL)a3;
- (void)setSupportsPowerLogging:(BOOL)a3;
- (void)setSupportsVersions:(BOOL)a3;
- (void)setSupportsVoiceAssist:(BOOL)a3;
- (void)setTtrSolicitLogs:(BOOL)a3;
- (void)setUpdateRequiresPowerAssertion:(BOOL)a3;
- (void)setUpdaterName:(id)a3;
- (void)setUploaderResponseTimeout:(unint64_t)a3;
- (void)setUploaderRetryLimit:(unint64_t)a3;
- (void)setVendorName:(id)a3;
@end

@implementation UARPSupportedAccessory

- (UARPSupportedAccessory)init
{
  v14.receiver = self;
  v14.super_class = (Class)UARPSupportedAccessory;
  v2 = [(UARPSupportedAccessory *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    bsdNotificationsInternal = v2->_bsdNotificationsInternal;
    v2->_bsdNotificationsInternal = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    serviceBsdNotificationsInternal = v2->_serviceBsdNotificationsInternal;
    v2->_serviceBsdNotificationsInternal = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    supplementalAssetsInternal = v2->_supplementalAssetsInternal;
    v2->_supplementalAssetsInternal = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    downstreamAppleModelNumbers = v2->_downstreamAppleModelNumbers;
    v2->_downstreamAppleModelNumbers = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    alternativeAppleModelNumbers = v2->_alternativeAppleModelNumbers;
    v2->_alternativeAppleModelNumbers = v11;

    *(_OWORD *)&v2->_uploaderResponseTimeout = xmmword_21E1050E0;
  }
  return v2;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 capabilities:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(UARPSupportedAccessory *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_hardwareID, a3);
    v9->_capabilities = a4;
  }

  return v9;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 appleModelNumber:(id)a4 capabilities:(unint64_t)a5
{
  id v9 = a4;
  v10 = [(UARPSupportedAccessory *)self initWithHardwareID:a3 capabilities:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_appleModelNumber, a4);
  }

  return v11;
}

- (UARPSupportedAccessory)initWithHardwareID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 capabilities:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v13 = [(UARPSupportedAccessory *)self initWithHardwareID:a3 capabilities:a6];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_productGroup, a4);
    objc_storeStrong((id *)&v14->_productNumber, a5);
  }

  return v14;
}

- (UARPSupportedAccessory)initWithDictionary:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Transport"];
  if ([v5 isEqualToString:@"Bluetooth"])
  {
    v6 = [(UARPSupportedAccessory *)self initWithBluetoothDictionary:v4];
  }
  else if ([v5 isEqualToString:@"HDS"])
  {
    v6 = [(UARPSupportedAccessory *)self initWithHDSDictionary:v4];
  }
  else if ([v5 isEqualToString:@"HID"])
  {
    v6 = [(UARPSupportedAccessory *)self initWithHIDDictionary:v4];
  }
  else if ([v5 isEqualToString:@"USB-PD"])
  {
    v6 = [(UARPSupportedAccessory *)self initWithUSBPDDictionary:v4];
  }
  else if ([v5 isEqualToString:@"IIC"])
  {
    v6 = [(UARPSupportedAccessory *)self initWithIICDictionary:v4];
  }
  else
  {
    if (![v5 isEqualToString:@"USB"])
    {

      id v7 = 0;
      goto LABEL_50;
    }
    v6 = [(UARPSupportedAccessory *)self initWithUSBDictionary:v4];
  }
  id v7 = v6;
  if (v6)
  {
    v8 = [v4 objectForKeyedSubscript:@"ModelName"];
    uint64_t v9 = [v8 copy];
    modelName = v7->_modelName;
    v7->_modelName = (NSString *)v9;

    id v11 = [v4 objectForKeyedSubscript:@"SupportsPowerlog"];
    v7->_supportsPowerLogging = [v11 BOOLValue];

    id v12 = [v4 objectForKeyedSubscript:@"SupportsHeySiriCompact"];
    v7->_supportsHeySiriCompact = [v12 BOOLValue];

    v13 = [v4 objectForKeyedSubscript:@"SupportsVoiceAssist"];
    v7->_supportsVoiceAssist = [v13 BOOLValue];

    objc_super v14 = [v4 objectForKeyedSubscript:@"SupportsLogs"];
    v7->_supportsLogs = [v14 BOOLValue];

    v15 = [v4 objectForKeyedSubscript:@"SupportsAnalytics"];
    v7->_supportsAnalytics = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:@"SupportsMappedAnalytics"];
    v7->_supportsMappedAnalytics = [v16 BOOLValue];

    v17 = [v4 objectForKeyedSubscript:@"SupportsFriendlyName"];
    v7->_supportsFriendlyName = [v17 BOOLValue];

    v18 = [v4 objectForKeyedSubscript:@"AutoAppliesStagedFirmware"];
    v7->_autoAppliesStagedFirmware = [v18 BOOLValue];

    v19 = [v4 objectForKeyedSubscript:@"SupportsAccMode7"];
    v7->_supportsAccMode7 = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:@"ReofferFirmwareOnSync"];
    v7->_reofferFirmwareOnSync = [v20 BOOLValue];

    v21 = [v4 objectForKeyedSubscript:@"SupportsInternalSettings"];
    v7->_supportsInternalSettings = [v21 BOOLValue];

    v22 = [v4 objectForKeyedSubscript:@"SupportsDeveloperSettings"];
    v7->_supportsDeveloperSettings = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:@"SupportsVersions"];
    v7->_supportsVersions = [v23 BOOLValue];

    v24 = [v4 objectForKeyedSubscript:@"AllowDownloadOnCellular"];
    v7->_allowDownloadOnCellular = [v24 BOOLValue];

    v25 = [v4 objectForKeyedSubscript:@"TtrSolicitLogs"];
    v7->_ttrSolicitLogs = [v25 BOOLValue];

    v26 = [v4 objectForKeyedSubscript:@"UpdateRequiresPowerAssertion"];
    v7->_updateRequiresPowerAssertion = [v26 BOOLValue];

    v27 = [v4 objectForKeyedSubscript:@"IsSimulator"];
    v7->_isSimulator = [v27 BOOLValue];

    v28 = [v4 objectForKeyedSubscript:@"DFUMode"];
    v7->_dfuMode = [v28 BOOLValue];

    v29 = [v4 objectForKeyedSubscript:@"UploaderResponseTimeout"];
    v7->_uploaderResponseTimeout = [v29 unsignedIntValue];

    v30 = [v4 objectForKeyedSubscript:@"UploaderRetryLimit"];
    v7->_uploaderRetryLimit = [v30 unsignedIntValue];

    v31 = [v4 objectForKeyedSubscript:@"UpdaterName"];
    uint64_t v32 = [v31 copy];
    updaterName = v7->_updaterName;
    v7->_updaterName = (NSString *)v32;

    v34 = [v4 objectForKeyedSubscript:@"MobileAssetsModelNumber"];
    [(UARPSupportedAccessory *)v7 setMobileAssetAppleModelNumber:v34];

    v35 = [v4 objectForKeyedSubscript:@"FusingOverrideUnfused"];
    uint64_t v36 = [v35 copy];
    fusingOverrideUnfused = v7->_fusingOverrideUnfused;
    v7->_fusingOverrideUnfused = (NSString *)v36;

    v38 = [v4 objectForKeyedSubscript:@"SupplementalAssetsModelNumber"];
    [(UARPSupportedAccessory *)v7 setSupplementalMobileAssetAppleModelNumber:v38];

    v39 = [v4 objectForKeyedSubscript:@"SupplementalAssets"];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v85 objects:v93 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v86;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v86 != v42) {
            objc_enumerationMutation(v39);
          }
          [(UARPSupportedAccessory *)v7 addSupplementalAssetName:*(void *)(*((void *)&v85 + 1) + 8 * v43++)];
        }
        while (v41 != v43);
        uint64_t v41 = [v39 countByEnumeratingWithState:&v85 objects:v93 count:16];
      }
      while (v41);
    }
    v44 = [v4 objectForKeyedSubscript:@"DownstreamAppleModelNumbers"];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v81 objects:v92 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v82;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v82 != v47) {
            objc_enumerationMutation(v44);
          }
          [(UARPSupportedAccessory *)v7 addDownstreamAppleModelNumber:*(void *)(*((void *)&v81 + 1) + 8 * v48++)];
        }
        while (v46 != v48);
        uint64_t v46 = [v44 countByEnumeratingWithState:&v81 objects:v92 count:16];
      }
      while (v46);
    }
    v68 = v5;
    v49 = [v4 objectForKeyedSubscript:@"AlternativeAppleModelNumbers"];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v77 objects:v91 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v78;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v78 != v52) {
            objc_enumerationMutation(v49);
          }
          [(UARPSupportedAccessory *)v7 addAlternativeAppleModelNumber:*(void *)(*((void *)&v77 + 1) + 8 * v53++)];
        }
        while (v51 != v53);
        uint64_t v51 = [v49 countByEnumeratingWithState:&v77 objects:v91 count:16];
      }
      while (v51);
    }
    v54 = [v4 objectForKeyedSubscript:@"BSDNotifications"];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v74;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v74 != v57) {
            objc_enumerationMutation(v54);
          }
          [(UARPSupportedAccessory *)v7 addBSDNotificationName:*(void *)(*((void *)&v73 + 1) + 8 * v58++)];
        }
        while (v56 != v58);
        uint64_t v56 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
      }
      while (v56);
    }
    v59 = [v4 objectForKeyedSubscript:@"ServiceBSDNotifications"];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v69 objects:v89 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v70;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v70 != v62) {
            objc_enumerationMutation(v59);
          }
          [(UARPSupportedAccessory *)v7 addServiceBSDNotificationName:*(void *)(*((void *)&v69 + 1) + 8 * v63++)];
        }
        while (v61 != v63);
        uint64_t v61 = [v59 countByEnumeratingWithState:&v69 objects:v89 count:16];
      }
      while (v61);
    }
    v64 = [v4 objectForKeyedSubscript:@"PersonalizationNotification"];
    uint64_t v65 = [v64 copy];
    personalizationNotification = v7->_personalizationNotification;
    v7->_personalizationNotification = (NSString *)v65;

    v5 = v68;
  }
LABEL_50:

  return v7;
}

- (UARPSupportedAccessory)initWithBluetoothDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"VendorID"];
  v6 = [v4 objectForKeyedSubscript:@"ProductID"];
  id v7 = [v4 objectForKeyedSubscript:@"BluetoothVendorIDSource"];
  v8 = [v4 objectForKeyedSubscript:@"BluetoothProductVersion"];
  uint64_t v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", [v7 unsignedIntegerValue], (unsigned __int16)objc_msgSend(v5, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v6, "unsignedIntegerValue"), (unsigned __int16)objc_msgSend(v8, "unsignedIntegerValue"));
  v10 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];

  if (v10)
  {
    self = [(UARPSupportedAccessory *)self initWithHardwareID:v9 appleModelNumber:v10 capabilities:0];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (UARPSupportedAccessory)initWithHDSDictionary:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 objectForKeyedSubscript:@"UUID"];
  v8 = (void *)[v6 initWithUUIDString:v7];

  uint64_t v9 = [[UARPAccessoryHardwareHDS alloc] initWithUUID:v8];
  v10 = [v5 objectForKeyedSubscript:@"AppleModelNumber"];

  if (v10)
  {
    self = [(UARPSupportedAccessory *)self initWithHardwareID:v9 appleModelNumber:v10 capabilities:0];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (UARPSupportedAccessory)initWithHIDDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v21 = a3;
  [v21 objectForKeyedSubscript:@"Personalities"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"VendorID"];
        v10 = [v8 objectForKeyedSubscript:@"ProductID"];
        if (v5)
        {
          id v11 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", (unsigned __int16)[v9 unsignedIntegerValue], (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"));
          [(UARPAccessoryHardwareHID *)v5 addPersonality:v11];
        }
        else
        {
          id v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", (unsigned __int16)[v9 unsignedIntegerValue], (unsigned __int16)objc_msgSend(v10, "unsignedIntegerValue"));
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }
  id v12 = [v21 objectForKeyedSubscript:@"AppleModelNumber"];
  if (v12)
  {
    v13 = [v21 objectForKeyedSubscript:@"isPowerSource"];
    objc_super v14 = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v5, v12, [v13 BOOLValue]);
    v15 = v14;
  }
  else
  {
    v13 = [v21 objectForKeyedSubscript:@"ProductGroup"];
    uint64_t v16 = [v21 objectForKeyedSubscript:@"ProductNumber"];
    v17 = (void *)v16;
    if (v13) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    objc_super v14 = self;
    if (v18)
    {
      v15 = 0;
    }
    else
    {
      objc_super v14 = [(UARPSupportedAccessory *)self initWithHardwareID:v5 productGroup:v13 productNumber:v16 capabilities:0];
      v15 = v14;
    }
  }
  return v15;
}

- (UARPSupportedAccessory)initWithUSBPDDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"VendorID"];
  BOOL v18 = [v4 objectForKeyedSubscript:@"ProductID"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"USB-PD Device Class"];
  if ([v6 isEqualToString:@"MagSafe Cable"])
  {
    uint64_t v7 = 0;
  }
  else if ([v6 isEqualToString:@"Power Adapter"])
  {
    uint64_t v7 = 1;
  }
  else
  {
    if (![v6 isEqualToString:@"USB-C to Lightning"])
    {
      uint64_t v16 = 0;
      goto LABEL_18;
    }
    uint64_t v7 = 2;
  }
  v8 = [v4 objectForKeyedSubscript:@"USB-PD Location"];
  if ([v8 isEqualToString:@"SOP"])
  {
    uint64_t v9 = 0;
LABEL_13:
    v10 = [v4 objectForKeyedSubscript:@"SupportsAccMode7"];
    uint64_t v11 = [v10 BOOLValue];

    id v12 = v5;
    v13 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", (unsigned __int16)[v5 unsignedIntegerValue], (unsigned __int16)objc_msgSend(v18, "unsignedIntegerValue"), v7, v9, v11);
    objc_super v14 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];
    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:@"isPowerSource"];
      self = -[UARPSupportedAccessory initWithHardwareID:appleModelNumber:capabilities:](self, "initWithHardwareID:appleModelNumber:capabilities:", v13, v14, [v15 BOOLValue]);

      uint64_t v16 = self;
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v5 = v12;

    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"SOP Prime"])
  {
    uint64_t v9 = 1;
    goto LABEL_13;
  }
  if ([v8 isEqualToString:@"SOP Double Prime"])
  {
    uint64_t v9 = 2;
    goto LABEL_13;
  }
  uint64_t v16 = 0;
LABEL_17:

LABEL_18:
  return v16;
}

- (UARPSupportedAccessory)initWithIICDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(UARPAccessoryHardwareIIC);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];

  if (v6)
  {
    self = [(UARPSupportedAccessory *)self initWithHardwareID:v5 appleModelNumber:v6 capabilities:0];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (UARPSupportedAccessory)initWithUSBDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"VendorID"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"ProductID"];
  uint64_t v7 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", (unsigned __int16)[v5 unsignedIntegerValue], (unsigned __int16)objc_msgSend(v6, "unsignedIntegerValue"));
  v8 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];

  if (v8)
  {
    self = [(UARPSupportedAccessory *)self initWithHardwareID:v7 appleModelNumber:v8 capabilities:0];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isMFi
{
  return self->_productGroup && self->_productNumber;
}

- (NSString)identifier
{
  productGroup = self->_productGroup;
  if (productGroup && (productNumber = self->_productNumber) != 0)
  {
    id v4 = [NSString stringWithFormat:@"%@%@", productGroup, productNumber];
  }
  else
  {
    appleModelNumber = self->_appleModelNumber;
    if (appleModelNumber) {
      id v4 = appleModelNumber;
    }
    else {
      id v4 = @"unknown";
    }
  }
  return (NSString *)v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = v3;
  if (self->_appleModelNumber) {
    [v3 appendFormat:@"Apple Model Number = %@", self->_appleModelNumber];
  }
  if (self->_productCode) {
    [v4 appendFormat:@", Product Code = %@", self->_productCode];
  }
  [v4 appendFormat:@", HardwareID = %@", self->_hardwareID];
  if (self->_mobileAssetAppleModelNumber) {
    [v4 appendFormat:@", Mobile Assets ModelNumber = %@", self->_mobileAssetAppleModelNumber];
  }
  if (self->_productGroup) {
    [v4 appendFormat:@", Product Group = %@", self->_productGroup];
  }
  if (self->_productNumber) {
    [v4 appendFormat:@", Product Number = %@", self->_productNumber];
  }
  if (self->_supportsHeySiriCompact) {
    [v4 appendFormat:@", Supports HSML = YES"];
  }
  if (self->_supportsAnalytics) {
    [v4 appendFormat:@", Supports TICS = YES"];
  }
  if (self->_supportsMappedAnalytics) {
    [v4 appendFormat:@", Supports MTIC = YES"];
  }
  if (self->_supportsFriendlyName) {
    [v4 appendFormat:@", Supports Friendly Name = YES"];
  }
  if ([(NSMutableSet *)self->_downstreamAppleModelNumbers count]) {
    [v4 appendFormat:@", Downstream Apple Model Numbers = %@", self->_downstreamAppleModelNumbers];
  }
  if ([(NSMutableSet *)self->_alternativeAppleModelNumbers count]) {
    [v4 appendFormat:@", Alternative Apple Model Numbers = %@", self->_alternativeAppleModelNumbers];
  }
  if (self->_mobileAssetAppleModelNumber) {
    [v4 appendFormat:@", Mobile Asset Apple Model Numbers = %@", self->_mobileAssetAppleModelNumber];
  }
  id v5 = [(UARPSupportedAccessory *)self bsdNotifications];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(UARPSupportedAccessory *)self bsdNotifications];
    [v4 appendFormat:@", BSD Notifications = %@", v7];
  }
  v8 = [(UARPSupportedAccessory *)self serviceBsdNotifications];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(UARPSupportedAccessory *)self serviceBsdNotifications];
    [v4 appendFormat:@", Service BSD Notifications = %@", v10];
  }
  return v4;
}

- (id)hashIdentifier
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = kUARPSupportedAccessoryKeyTransportBluetooth;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = kUARPSupportedAccessoryKeyTransportB2PHID;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v3 = kUARPSupportedAccessoryKeyTransportHID;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = kUARPSupportedAccessoryKeyTransportUSBPD;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v3 = kUARPSupportedAccessoryKeyTransportUSB;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v3 = kUARPSupportedAccessoryKeyTransportHDS;
            }
            else
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v3 = kUARPSupportedAccessoryKeyTransport;
              if (isKindOfClass) {
                id v3 = kUARPSupportedAccessoryKeyTransportIIC;
              }
            }
          }
        }
      }
    }
  }
  id v5 = *v3;
  uint64_t v6 = NSString;
  uint64_t v7 = [(UARPSupportedAccessory *)self identifier];
  v8 = [v6 stringWithFormat:@"%@-%@", v7, v5];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(UARPSupportedAccessory *)self hashIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPSupportedAccessory *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v8 = 1;
    }
    else
    {
      id v5 = v4;
      uint64_t v6 = [(UARPSupportedAccessory *)self hashIdentifier];
      uint64_t v7 = [(UARPSupportedAccessory *)v5 hashIdentifier];

      char v8 = nullableObjectsEqual(v6, (uint64_t)v7);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)addBSDNotificationName:(id)a3
{
}

- (void)addServiceBSDNotificationName:(id)a3
{
}

- (void)addSupplementalAssetName:(id)a3
{
  id v5 = self->_supplementalMobileAssetAppleModelNumber;
  if (!v5) {
    id v5 = self->_appleModelNumber;
  }
  uint64_t v7 = v5;
  uint64_t v6 = [NSString stringWithFormat:@"%@-%@", v5, a3];
  [(NSMutableSet *)self->_supplementalAssetsInternal addObject:v6];
}

- (void)addDownstreamAppleModelNumber:(id)a3
{
  downstreamAppleModelNumbers = self->_downstreamAppleModelNumbers;
  id v4 = (id)[a3 copy];
  [(NSMutableSet *)downstreamAppleModelNumbers addObject:v4];
}

- (void)removeDownstreamAppleModelNumbers
{
}

- (void)addAlternativeAppleModelNumber:(id)a3
{
  alternativeAppleModelNumbers = self->_alternativeAppleModelNumbers;
  id v4 = (id)[a3 copy];
  [(NSMutableSet *)alternativeAppleModelNumbers addObject:v4];
}

- (void)removeAlternativeAppleModelNumber:(id)a3
{
}

- (NSString)mobileAssetAppleModelNumber
{
  mobileAssetAppleModelNumber = self->_mobileAssetAppleModelNumber;
  if (!mobileAssetAppleModelNumber) {
    mobileAssetAppleModelNumber = self->_appleModelNumber;
  }
  unint64_t v3 = mobileAssetAppleModelNumber;
  return v3;
}

- (void)setMobileAssetAppleModelNumber:(id)a3
{
  self->_mobileAssetAppleModelNumber = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSString)supplementalMobileAssetAppleModelNumber
{
  supplementalMobileAssetAppleModelNumber = self->_supplementalMobileAssetAppleModelNumber;
  if (!supplementalMobileAssetAppleModelNumber) {
    supplementalMobileAssetAppleModelNumber = self->_appleModelNumber;
  }
  unint64_t v3 = supplementalMobileAssetAppleModelNumber;
  return v3;
}

- (void)setSupplementalMobileAssetAppleModelNumber:(id)a3
{
  self->_supplementalMobileAssetAppleModelNumber = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  self->_modelName = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  self->_vendorName = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (BOOL)autoAppliesStagedFirmware
{
  return self->_autoAppliesStagedFirmware;
}

- (void)setAutoAppliesStagedFirmware:(BOOL)a3
{
  self->_autoAppliesStagedFirmware = a3;
}

- (NSSet)bsdNotifications
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_bsdNotificationsInternal];
}

- (NSSet)serviceBsdNotifications
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_serviceBsdNotificationsInternal];
}

- (NSSet)supplementalAssets
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_supplementalAssetsInternal];
}

- (NSSet)downstreamAppleModelNumbers
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_downstreamAppleModelNumbers];
}

- (NSSet)alternativeAppleModelNumbers
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_alternativeAppleModelNumbers];
}

- (NSString)productCode
{
  return self->_productCode;
}

- (void)setProductCode:(id)a3
{
  self->_productCode = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)generatePlist
{
  v2 = self;
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (self->_productGroup) {
    BOOL v3 = self->_productNumber != 0;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v2->_hardwareID;
    [v4 setObject:@"Bluetooth" forKeyedSubscript:@"Transport"];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
    [v4 setObject:v6 forKeyedSubscript:@"VendorID"];

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
    [v4 setObject:v7 forKeyedSubscript:@"ProductID"];

    char v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[UARPAccessoryHardwareID vendorIDSource](v5, "vendorIDSource"));
    [v4 setObject:v8 forKeyedSubscript:@"BluetoothVendorIDSource"];

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productVersion](v5, "productVersion"));
    v10 = kUARPSupportedAccessoryKeyBluetoothProductVersion;
LABEL_9:
    [v4 setObject:v9 forKeyedSubscript:*v10];
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v2->_hardwareID;
    uint64_t v11 = kUARPSupportedAccessoryKeyTransportB2PHID;
LABEL_8:
    [v4 setObject:*v11 forKeyedSubscript:@"Transport"];
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
    [v4 setObject:v12 forKeyedSubscript:@"VendorID"];

    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
    v10 = kUARPSupportedAccessoryKeyProductID;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v53 = v3;
    v54 = v2;
    uint64_t v36 = v2->_hardwareID;
    [v4 setObject:@"HID" forKeyedSubscript:@"Transport"];
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v36, "vendorID"));
    [v4 setObject:v37 forKeyedSubscript:@"VendorID"];

    v38 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v36, "productID"));
    uint64_t v55 = v4;
    [v4 setObject:v38 forKeyedSubscript:@"ProductID"];

    v39 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v52 = v36;
    id obj = [(UARPAccessoryHardwareID *)v36 personalities];
    uint64_t v40 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(obj);
          }
          v44 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v45 = objc_opt_new();
          uint64_t v46 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v44, "vendorID"));
          [v45 setObject:v46 forKeyedSubscript:@"VendorID"];

          uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v44, "productID"));
          [v45 setObject:v47 forKeyedSubscript:@"ProductID"];

          [v39 addObject:v45];
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v41);
    }

    id v4 = v55;
    [v55 setObject:v39 forKeyedSubscript:@"Personalities"];

    v2 = v54;
    BOOL v3 = v53;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v2->_hardwareID;
      [v4 setObject:@"USB-PD" forKeyedSubscript:@"Transport"];
      uint64_t v48 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID vendorID](v5, "vendorID"));
      [v4 setObject:v48 forKeyedSubscript:@"VendorID"];

      v49 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[UARPAccessoryHardwareID productID](v5, "productID"));
      [v4 setObject:v49 forKeyedSubscript:@"ProductID"];

      if ([(UARPAccessoryHardwareID *)v5 supportsAccMode7]) {
        [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsAccMode7"];
      }
      if ([(UARPAccessoryHardwareID *)v5 isMagSafeCable]) {
        [v4 setObject:@"MagSafe Cable" forKeyedSubscript:@"USB-PD Device Class"];
      }
      if ([(UARPAccessoryHardwareID *)v5 isPowerAdapter]) {
        [v4 setObject:@"Power Adapter" forKeyedSubscript:@"USB-PD Device Class"];
      }
      if ([(UARPAccessoryHardwareID *)v5 isUSBCLightning]) {
        [v4 setObject:@"USB-C to Lightning" forKeyedSubscript:@"USB-PD Device Class"];
      }
      if ([(UARPAccessoryHardwareID *)v5 location])
      {
        if ([(UARPAccessoryHardwareID *)v5 location] == 1)
        {
          uint64_t v50 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOPPrime;
        }
        else
        {
          if ([(UARPAccessoryHardwareID *)v5 location] != 2) {
            goto LABEL_11;
          }
          uint64_t v50 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOPDoublePrime;
        }
      }
      else
      {
        uint64_t v50 = kUARPSupportedAccessoryKeyUSBPDLocationTypeSOP;
      }
      [v4 setObject:*v50 forKeyedSubscript:@"USB-PD Location"];
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v2->_hardwareID;
      uint64_t v11 = kUARPSupportedAccessoryKeyTransportUSB;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v2->_hardwareID;
      [v4 setObject:@"HDS" forKeyedSubscript:@"Transport"];
      uint64_t v9 = [(UARPAccessoryHardwareID *)v5 uuid];
      uint64_t v51 = [v9 UUIDString];
      [v4 setObject:v51 forKeyedSubscript:@"UUID"];

      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setObject:@"IIC" forKeyedSubscript:@"Transport"];
    }
  }
LABEL_12:
  if (v3)
  {
    [v4 setObject:v2->_productGroup forKeyedSubscript:@"ProductGroup"];
    v13 = kUARPSupportedAccessoryKeyProductNumber;
    uint64_t v14 = 128;
  }
  else
  {
    v13 = kUARPSupportedAccessoryKeyAppleModelNumber;
    uint64_t v14 = 112;
  }
  [v4 setObject:*(Class *)((char *)&v2->super.isa + v14) forKeyedSubscript:*v13];
  modelName = v2->_modelName;
  if (modelName) {
    [v4 setObject:modelName forKeyedSubscript:@"ModelName"];
  }
  vendorName = (__CFString *)v2->_vendorName;
  if (!vendorName) {
    vendorName = @"Apple Inc.";
  }
  [v4 setObject:vendorName forKeyedSubscript:@"VendorName"];
  if (v2->_capabilities) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isPowerSource"];
  }
  if (v2->_supportsPowerLogging) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsPowerlog"];
  }
  if (v2->_supportsHeySiriCompact) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsHeySiriCompact"];
  }
  BOOL supportsVoiceAssist = v2->_supportsVoiceAssist;
  if (v2->_supportsVoiceAssist)
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsVoiceAssist"];
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v18 addObject:@"VoiceAssist"];
    [v4 setObject:v18 forKeyedSubscript:@"SupplementalAssets"];

    BOOL supportsVoiceAssist = v2->_supportsVoiceAssist;
  }
  if (supportsVoiceAssist || v2->_supportsHeySiriCompact)
  {
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v19 addObject:@"com.apple.corespeech.voicetriggerassetchange"];
    [v4 setObject:v19 forKeyedSubscript:@"BSDNotifications"];
  }
  if (v2->_reofferFirmwareOnSync) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"ReofferFirmwareOnSync"];
  }
  if (v2->_supportsLogs) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsLogs"];
  }
  if (v2->_supportsAnalytics) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsAnalytics"];
  }
  if (v2->_supportsMappedAnalytics) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsMappedAnalytics"];
  }
  if (v2->_supportsFriendlyName) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsFriendlyName"];
  }
  if (v2->_supportsInternalSettings) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsInternalSettings"];
  }
  if (v2->_supportsDeveloperSettings) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsDeveloperSettings"];
  }
  if (v2->_supportsVersions) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SupportsVersions"];
  }
  if (v2->_allowDownloadOnCellular) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"AllowDownloadOnCellular"];
  }
  if (v2->_isSimulator) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IsSimulator"];
  }
  if (v2->_dfuMode) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"DFUMode"];
  }
  if (v2->_updateRequiresPowerAssertion)
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"UpdateRequiresPowerAssertion"];
    if (v2->_updateRequiresPowerAssertion) {
      [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"UpdateRequiresPowerAssertion"];
    }
  }
  if (v2->_autoAppliesStagedFirmware) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"AutoAppliesStagedFirmware"];
  }
  if (v2->_ttrSolicitLogs) {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"TtrSolicitLogs"];
  }
  fusingOverrideUnfused = v2->_fusingOverrideUnfused;
  if (fusingOverrideUnfused) {
    [v4 setObject:fusingOverrideUnfused forKeyedSubscript:@"FusingOverrideUnfused"];
  }
  if (v2->_uploaderResponseTimeout)
  {
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 setObject:v21 forKeyedSubscript:@"UploaderResponseTimeout"];
  }
  if (v2->_uploaderRetryLimit)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 setObject:v22 forKeyedSubscript:@"UploaderRetryLimit"];
  }
  mobileAssetAppleModelNumber = v2->_mobileAssetAppleModelNumber;
  if (mobileAssetAppleModelNumber)
  {
    if ([(NSString *)mobileAssetAppleModelNumber caseInsensitiveCompare:v2->_appleModelNumber]&& !v3)
    {
      [v4 setObject:v2->_mobileAssetAppleModelNumber forKeyedSubscript:@"MobileAssetsModelNumber"];
    }
  }
  supplementalMobileAssetAppleModelNumber = v2->_supplementalMobileAssetAppleModelNumber;
  if (supplementalMobileAssetAppleModelNumber) {
    [v4 setObject:supplementalMobileAssetAppleModelNumber forKeyedSubscript:@"SupplementalAssetsModelNumber"];
  }
  if ([(NSMutableSet *)v2->_downstreamAppleModelNumbers count])
  {
    long long v26 = [(NSMutableSet *)v2->_downstreamAppleModelNumbers allObjects];
    [v4 setObject:v26 forKeyedSubscript:@"DownstreamAppleModelNumbers"];
  }
  if ([(NSMutableSet *)v2->_alternativeAppleModelNumbers count])
  {
    v27 = [(NSMutableSet *)v2->_alternativeAppleModelNumbers allObjects];
    [v4 setObject:v27 forKeyedSubscript:@"AlternativeAppleModelNumbers"];
  }
  if ([(NSMutableSet *)v2->_bsdNotificationsInternal count])
  {
    uint64_t v28 = [(NSMutableSet *)v2->_bsdNotificationsInternal allObjects];
    [v4 setObject:v28 forKeyedSubscript:@"BSDNotifications"];
  }
  if ([(NSMutableSet *)v2->_serviceBsdNotificationsInternal count])
  {
    v29 = [(NSMutableSet *)v2->_serviceBsdNotificationsInternal allObjects];
    [v4 setObject:v29 forKeyedSubscript:@"ServiceBSDNotifications"];
  }
  updaterName = v2->_updaterName;
  if (updaterName) {
    [v4 setObject:updaterName forKeyedSubscript:@"UpdaterName"];
  }
  personalizationNotification = v2->_personalizationNotification;
  if (personalizationNotification) {
    [v4 setObject:personalizationNotification forKeyedSubscript:@"PersonalizationNotification"];
  }
  uint64_t v32 = objc_opt_new();
  v33 = [(UARPSupportedAccessory *)v2 identifier];
  [v32 setObject:v4 forKeyedSubscript:v33];

  v34 = [NSDictionary dictionaryWithDictionary:v32];

  return v34;
}

- (id)plistFilename
{
  v2 = NSString;
  BOOL v3 = [(UARPSupportedAccessory *)self hashIdentifier];
  id v4 = [v2 stringWithFormat:@"%@.plist", v3];

  return v4;
}

+ (id)supportedAccessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  BOOL v3 = +[UARPSupportedAccessoryManager defaultManager];
  id v4 = [v3 setOfAccessories];
  id v5 = [v2 setWithSet:v4];

  return v5;
}

+ (id)supportedAccessoriesByTransport:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = +[UARPSupportedAccessory supportedAccessories];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "hardwareID", (void)v16);
        uint64_t v13 = [v12 transport];

        if (v13 == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v14;
}

+ (id)findByHardwareID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[UARPSupportedAccessory supportedAccessories];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "hardwareID", (void)v12);
        char v10 = [v9 isEqual:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)findByAppleModelNumber:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  +[UARPSupportedAccessory supportedAccessories];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v17 = v9;
          goto LABEL_20;
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v12 = objc_msgSend(v9, "alternativeAppleModelNumbers", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([*(id *)(*((void *)&v19 + 1) + 8 * j) isEqualToString:v3])
              {
                id v17 = v9;

                goto LABEL_20;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v17 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_20:

  return v17;
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setProductGroup:(id)a3
{
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setProductNumber:(id)a3
{
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (UARPAccessoryHardwareID)hardwareID
{
  return (UARPAccessoryHardwareID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHardwareID:(id)a3
{
}

- (BOOL)supportsPowerLogging
{
  return self->_supportsPowerLogging;
}

- (void)setSupportsPowerLogging:(BOOL)a3
{
  self->_supportsPowerLogging = a3;
}

- (BOOL)supportsVoiceAssist
{
  return self->_supportsVoiceAssist;
}

- (void)setSupportsVoiceAssist:(BOOL)a3
{
  self->_BOOL supportsVoiceAssist = a3;
}

- (BOOL)supportsHeySiriCompact
{
  return self->_supportsHeySiriCompact;
}

- (void)setSupportsHeySiriCompact:(BOOL)a3
{
  self->_supportsHeySiriCompact = a3;
}

- (BOOL)supportsLogs
{
  return self->_supportsLogs;
}

- (void)setSupportsLogs:(BOOL)a3
{
  self->_supportsLogs = a3;
}

- (BOOL)supportsAnalytics
{
  return self->_supportsAnalytics;
}

- (void)setSupportsAnalytics:(BOOL)a3
{
  self->_supportsAnalytics = a3;
}

- (BOOL)supportsMappedAnalytics
{
  return self->_supportsMappedAnalytics;
}

- (void)setSupportsMappedAnalytics:(BOOL)a3
{
  self->_supportsMappedAnalytics = a3;
}

- (BOOL)supportsFriendlyName
{
  return self->_supportsFriendlyName;
}

- (void)setSupportsFriendlyName:(BOOL)a3
{
  self->_supportsFriendlyName = a3;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

- (void)setSupportsAccMode7:(BOOL)a3
{
  self->_supportsAccMode7 = a3;
}

- (BOOL)reofferFirmwareOnSync
{
  return self->_reofferFirmwareOnSync;
}

- (void)setReofferFirmwareOnSync:(BOOL)a3
{
  self->_reofferFirmwareOnSync = a3;
}

- (BOOL)supportsInternalSettings
{
  return self->_supportsInternalSettings;
}

- (void)setSupportsInternalSettings:(BOOL)a3
{
  self->_supportsInternalSettings = a3;
}

- (BOOL)supportsDeveloperSettings
{
  return self->_supportsDeveloperSettings;
}

- (void)setSupportsDeveloperSettings:(BOOL)a3
{
  self->_supportsDeveloperSettings = a3;
}

- (BOOL)supportsVersions
{
  return self->_supportsVersions;
}

- (void)setSupportsVersions:(BOOL)a3
{
  self->_supportsVersions = a3;
}

- (BOOL)allowDownloadOnCellular
{
  return self->_allowDownloadOnCellular;
}

- (void)setAllowDownloadOnCellular:(BOOL)a3
{
  self->_allowDownloadOnCellular = a3;
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (void)setIsSimulator:(BOOL)a3
{
  self->_isSimulator = a3;
}

- (BOOL)dfuMode
{
  return self->_dfuMode;
}

- (void)setDfuMode:(BOOL)a3
{
  self->_dfuMode = a3;
}

- (BOOL)updateRequiresPowerAssertion
{
  return self->_updateRequiresPowerAssertion;
}

- (void)setUpdateRequiresPowerAssertion:(BOOL)a3
{
  self->_updateRequiresPowerAssertion = a3;
}

- (BOOL)ttrSolicitLogs
{
  return self->_ttrSolicitLogs;
}

- (void)setTtrSolicitLogs:(BOOL)a3
{
  self->_ttrSolicitLogs = a3;
}

- (NSString)fusingOverrideUnfused
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFusingOverrideUnfused:(id)a3
{
}

- (NSString)updaterName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUpdaterName:(id)a3
{
}

- (NSString)personalizationNotification
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPersonalizationNotification:(id)a3
{
}

- (unint64_t)uploaderResponseTimeout
{
  return self->_uploaderResponseTimeout;
}

- (void)setUploaderResponseTimeout:(unint64_t)a3
{
  self->_uploaderResponseTimeout = a3;
}

- (unint64_t)uploaderRetryLimit
{
  return self->_uploaderRetryLimit;
}

- (void)setUploaderRetryLimit:(unint64_t)a3
{
  self->_uploaderRetryLimit = a3;
}

- (BOOL)postStagingNotifications
{
  return self->_postStagingNotifications;
}

- (void)setPostStagingNotifications:(BOOL)a3
{
  self->_postStagingNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationNotification, 0);
  objc_storeStrong((id *)&self->_updaterName, 0);
  objc_storeStrong((id *)&self->_fusingOverrideUnfused, 0);
  objc_storeStrong((id *)&self->_hardwareID, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_supplementalMobileAssetAppleModelNumber, 0);
  objc_storeStrong((id *)&self->_mobileAssetAppleModelNumber, 0);
  objc_storeStrong((id *)&self->_alternativeAppleModelNumbers, 0);
  objc_storeStrong((id *)&self->_downstreamAppleModelNumbers, 0);
  objc_storeStrong((id *)&self->_supplementalAssetsInternal, 0);
  objc_storeStrong((id *)&self->_serviceBsdNotificationsInternal, 0);
  objc_storeStrong((id *)&self->_bsdNotificationsInternal, 0);
}

@end