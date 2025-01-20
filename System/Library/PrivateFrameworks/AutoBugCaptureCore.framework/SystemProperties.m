@interface SystemProperties
+ (id)sharedInstance;
+ (int)systemPropertiesDeviceClassFromMGQDeviceClass:(int)a3;
- (BOOL)basebandCapability;
- (BOOL)carrierBuild;
- (BOOL)carrierSeedBuild;
- (BOOL)customerBuild;
- (BOOL)customerSeedBuild;
- (BOOL)dualSIMCapable;
- (BOOL)dualSIMEnabled;
- (BOOL)factoryBuild;
- (BOOL)internalBuild;
- (BOOL)internalBuildDisabledByOverride;
- (BOOL)npiDevice;
- (BOOL)seedBuild;
- (BOOL)vendorBuild;
- (NSNumber)carrierSeedBuildOverride;
- (NSNumber)npiDeviceOverride;
- (NSNumber)seedBuildOverride;
- (NSNumber)vendorBuildOverride;
- (NSString)basebandChipset;
- (NSString)basebandFirmwareVersion;
- (NSString)buildPlatform;
- (NSString)buildVariant;
- (NSString)buildVersion;
- (NSString)buildVersionPrefix;
- (NSString)deviceClassString;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (SystemProperties)init;
- (id)description;
- (int)deviceClass;
- (void)setCarrierSeedBuildOverride:(id)a3;
- (void)setInternalBuildDisabledByOverride:(BOOL)a3;
- (void)setNpiDeviceOverride:(id)a3;
- (void)setSeedBuildOverride:(id)a3;
- (void)setVendorBuild:(BOOL)a3;
- (void)setVendorBuildOverride:(id)a3;
@end

@implementation SystemProperties

- (BOOL)carrierSeedBuild
{
  if (self->_carrierSeedBuildOverride) {
    return [(NSNumber *)self->_carrierSeedBuildOverride BOOLValue];
  }
  if (self->_carrierBuild) {
    return [(SystemProperties *)self seedBuild];
  }
  return 0;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SystemProperties_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_instancePred != -1) {
    dispatch_once(&sharedInstance_instancePred, block);
  }
  v2 = (void *)sharedInstance;

  return v2;
}

uint64_t __34__SystemProperties_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

+ (int)systemPropertiesDeviceClassFromMGQDeviceClass:(int)a3
{
  if ((a3 - 1) > 0xB) {
    return -1;
  }
  else {
    return dword_209E3E280[a3 - 1];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  productName = self->_productName;
  uint64_t v5 = [(SystemProperties *)self deviceClassString];
  productType = self->_productType;
  productVersion = self->_productVersion;
  buildPlatform = self->_buildPlatform;
  buildVersion = self->_buildVersion;
  uint64_t v8 = [(SystemProperties *)self buildVariant];
  if (self->_basebandCapability) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  v30 = v9;
  if (self->_dualSIMCapable) {
    v10 = "yes";
  }
  else {
    v10 = "no";
  }
  if (self->_dualSIMEnabled) {
    v11 = "yes";
  }
  else {
    v11 = "no";
  }
  v28 = v11;
  v29 = v10;
  v38 = (void *)v8;
  v39 = (void *)v5;
  v36 = productName;
  v37 = v3;
  v34 = productVersion;
  v35 = productType;
  NSUInteger v31 = [(NSString *)self->_basebandChipset length];
  if (v31)
  {
    id v12 = [NSString alloc];
    basebandChipset = self->_basebandChipset;
    id v14 = [NSString alloc];
    if ([(NSString *)self->_basebandFirmwareVersion length]) {
      basebandFirmwareVersion = (__CFString *)self->_basebandFirmwareVersion;
    }
    else {
      basebandFirmwareVersion = @"Unknown FW Version";
    }
    v27 = (void *)[v14 initWithFormat:@"(%@)", basebandFirmwareVersion];
    v16 = (__CFString *)[v12 initWithFormat:@"%@ %@", basebandChipset, v27];
  }
  else
  {
    v16 = @"No baseband";
  }
  if ([(SystemProperties *)self internalBuild]) {
    v17 = "yes";
  }
  else {
    v17 = "no";
  }
  if (self->_factoryBuild) {
    v18 = "yes";
  }
  else {
    v18 = "no";
  }
  if ([(SystemProperties *)self vendorBuild]) {
    v19 = "yes";
  }
  else {
    v19 = "no";
  }
  if ([(SystemProperties *)self carrierBuild]) {
    v20 = "yes";
  }
  else {
    v20 = "no";
  }
  if ([(SystemProperties *)self seedBuild]) {
    v21 = "yes";
  }
  else {
    v21 = "no";
  }
  if ([(SystemProperties *)self carrierSeedBuild]) {
    v22 = "yes";
  }
  else {
    v22 = "no";
  }
  if ([(SystemProperties *)self customerSeedBuild]) {
    v23 = "yes";
  }
  else {
    v23 = "no";
  }
  serialNumber = (__CFString *)self->_serialNumber;
  if (!serialNumber) {
    serialNumber = @"redacted";
  }
  v25 = objc_msgSend(v37, "initWithFormat:", @"ProductName = %@, ProductClass = %@, ProductType = %@, ProductVersion = %@, BuildVersion = %@, BuildPlatform = %@, BuildVariant = %@, basebandCapability = %s, dualSIMCapable = %s, dualSIMEnabled = %s, Baseband Chipset = %@, InternalBuild = %s, FactoryBuild = %s, VendorBuild = %s, CarrierBuild = %s, SeedBuild = %s, CarrierSeedBuild = %s, CustomerSeedBuild = %s, DeviceSerialNumber = %@", v36, v39, v35, v34, buildVersion, buildPlatform, v38, v30, v29, v28, v16, v17, v18, v19, v20, v21,
                  v22,
                  v23,
                  serialNumber);
  if (v31)
  {
  }

  return v25;
}

- (SystemProperties)init
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)SystemProperties;
  id v2 = [(SystemProperties *)&v30 init];
  if (!v2) {
    return (SystemProperties *)v2;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  *((_DWORD *)v2 + 5) = -1;
  v4 = (void *)*((void *)v2 + 6);
  *((void *)v2 + 6) = @"Unknown Product Type";

  uint64_t v5 = (void *)*((void *)v2 + 7);
  *((void *)v2 + 7) = @"Unknown Product Name";

  v6 = (void *)*((void *)v2 + 8);
  *((void *)v2 + 8) = @"Unknown Product Version";

  v7 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = @"Unknown Build Version";

  uint64_t v8 = (void *)*((void *)v2 + 12);
  *((void *)v2 + 12) = &stru_26BDE2C70;

  v9 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = &stru_26BDE2C70;

  v10 = (void *)*((void *)v2 + 11);
  *((void *)v2 + 11) = @"iOS";

  if (v3)
  {
    Value = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263EFFAB8]);
    if (Value) {
      objc_storeStrong((id *)v2 + 7, Value);
    }
    id v12 = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263EFFAC0]);
    if (v12) {
      objc_storeStrong((id *)v2 + 8, v12);
    }
    v13 = (void *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263EFFAB0]);
    if (v13) {
      objc_storeStrong((id *)v2 + 9, v13);
    }
    CFRelease(v3);
  }
  *((unsigned char *)v2 + 9) = 0;
  *((unsigned char *)v2 + 8) = os_variant_has_internal_diagnostics();
  *((unsigned char *)v2 + 16) = os_variant_has_factory_content();
  *((unsigned char *)v2 + 10) = 0;
  *((unsigned char *)v2 + 14) = 0;
  uint64_t v14 = MGGetStringAnswer();
  v15 = (void *)*((void *)v2 + 6);
  *((void *)v2 + 6) = v14;

  CFStringRef v16 = (const __CFString *)MGGetStringAnswer();
  if (v16) {
    *((unsigned char *)v2 + 11) = CFEqual(v16, @"Vendor");
  }
  if (*((unsigned char *)v2 + 8) || *((unsigned char *)v2 + 11))
  {
    uint64_t v17 = MGGetStringAnswer();
    if (v17)
    {
      v18 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v17;
    }
  }
  *((_DWORD *)v2 + 5) = +[SystemProperties systemPropertiesDeviceClassFromMGQDeviceClass:MGGetSInt32Answer()];
  if (MGGetBoolAnswer()) {
    BOOL v19 = *((unsigned char *)v2 + 8) == 0;
  }
  else {
    BOOL v19 = 0;
  }
  *((unsigned char *)v2 + 10) = v19;
  *((unsigned char *)v2 + 15) = MGGetBoolAnswer();
  *((_WORD *)v2 + 6) = 0;
  uint64_t v20 = MGGetStringAnswer();
  if (v20)
  {
    v21 = *((void *)v2 + 12);
    *((void *)v2 + 12) = v20;
  }
  else
  {
    v21 = symptomsLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "No baseband chipset", buf, 2u);
    }
  }

  uint64_t v22 = MGGetStringAnswer();
  if (v22)
  {
    v23 = *((void *)v2 + 5);
    *((void *)v2 + 5) = v22;
  }
  else
  {
    v23 = symptomsLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_INFO, "No baseband firmware version", buf, 2u);
    }
  }

  if (*((unsigned char *)v2 + 8))
  {
    [*((id *)v2 + 6) rangeOfString:@"iPhone15" options:9];
    if (v24)
    {
      v25 = symptomsLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Enabling NPI flag based on productType match";
LABEL_34:
        _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
    [*((id *)v2 + 12) rangeOfString:@"mav22" options:9];
    if (v27)
    {
      v25 = symptomsLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Enabling NPI flag based on baseband chipset match";
        goto LABEL_34;
      }
LABEL_35:

      *((unsigned char *)v2 + 14) = 1;
    }
  }
  v28 = symptomsLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v32 = v2;
    _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_DEFAULT, "System Properties: %{private}@", buf, 0xCu);
  }

  return (SystemProperties *)v2;
}

- (NSString)deviceClassString
{
  uint64_t deviceClass = self->_deviceClass;
  if (deviceClass > 9) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_263FC38A0[deviceClass]->isa;
  }
}

- (BOOL)internalBuild
{
  return self->_internalBuild && !self->_internalBuildDisabledByOverride;
}

- (BOOL)seedBuild
{
  seedBuildOverride = self->_seedBuildOverride;
  if (seedBuildOverride) {
    LOBYTE(v4) = [(NSNumber *)seedBuildOverride BOOLValue];
  }
  else {
    return self->_seedBuild;
  }
  return v4;
}

- (BOOL)customerSeedBuild
{
  BOOL v3 = [(SystemProperties *)self seedBuild];
  if (v3)
  {
    LOBYTE(v3) = [(SystemProperties *)self customerBuild];
  }
  return v3;
}

- (BOOL)carrierBuild
{
  carrierSeedBuildOverride = self->_carrierSeedBuildOverride;
  if (carrierSeedBuildOverride) {
    LOBYTE(v4) = [(NSNumber *)carrierSeedBuildOverride BOOLValue];
  }
  else {
    return self->_carrierBuild;
  }
  return v4;
}

- (BOOL)vendorBuild
{
  vendorBuildOverride = self->_vendorBuildOverride;
  if (vendorBuildOverride) {
    LOBYTE(v4) = [(NSNumber *)vendorBuildOverride BOOLValue];
  }
  else {
    return self->_vendorBuild;
  }
  return v4;
}

- (BOOL)customerBuild
{
  if ([(SystemProperties *)self internalBuild]
    || [(SystemProperties *)self carrierBuild])
  {
    return 0;
  }
  else
  {
    return ![(SystemProperties *)self vendorBuild];
  }
}

- (BOOL)npiDevice
{
  npiDeviceOverride = self->_npiDeviceOverride;
  if (npiDeviceOverride) {
    LOBYTE(v4) = [(NSNumber *)npiDeviceOverride BOOLValue];
  }
  else {
    return self->_npiDevice;
  }
  return v4;
}

- (void)setInternalBuildDisabledByOverride:(BOOL)a3
{
  if (self->_internalBuildDisabledByOverride != a3)
  {
    self->_internalBuildDisabledByOverride = a3;
    self->_buildVariant = 0;
    MEMORY[0x270F9A758]();
  }
}

- (void)setCarrierSeedBuildOverride:(id)a3
{
  uint64_t v5 = (NSNumber *)a3;
  p_carrierSeedBuildOverride = &self->_carrierSeedBuildOverride;
  if (self->_carrierSeedBuildOverride != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_carrierSeedBuildOverride, a3);
    self->_internalBuildDisabledByOverride = [(NSNumber *)self->_carrierSeedBuildOverride BOOLValue];
    buildVariant = self->_buildVariant;
    self->_buildVariant = 0;

    uint64_t v5 = v8;
  }

  MEMORY[0x270F9A758](p_carrierSeedBuildOverride, v5);
}

- (void)setSeedBuildOverride:(id)a3
{
  uint64_t v5 = (NSNumber *)a3;
  p_seedBuildOverride = &self->_seedBuildOverride;
  if (self->_seedBuildOverride != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_seedBuildOverride, a3);
    buildVariant = self->_buildVariant;
    self->_buildVariant = 0;

    uint64_t v5 = v8;
  }

  MEMORY[0x270F9A758](p_seedBuildOverride, v5);
}

- (void)setNpiDeviceOverride:(id)a3
{
  uint64_t v5 = (NSNumber *)a3;
  npiDeviceOverride = self->_npiDeviceOverride;
  p_npiDeviceOverride = &self->_npiDeviceOverride;
  if (npiDeviceOverride != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_npiDeviceOverride, a3);
    uint64_t v5 = v8;
  }
}

- (NSString)basebandFirmwareVersion
{
  if (![(NSString *)self->_basebandFirmwareVersion length] && self->_basebandChipset)
  {
    BOOL v3 = symptomsLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Updating missing baseband firmware version", buf, 2u);
    }

    BOOL v4 = (NSString *)MGGetStringAnswer();
    if (v4)
    {
      basebandFirmwareVersion = self->_basebandFirmwareVersion;
      self->_basebandFirmwareVersion = v4;
    }
    else
    {
      basebandFirmwareVersion = symptomsLogHandle();
      if (os_log_type_enabled(basebandFirmwareVersion, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_209DBA000, basebandFirmwareVersion, OS_LOG_TYPE_INFO, "No baseband firmware version", v8, 2u);
      }
    }
  }
  v6 = self->_basebandFirmwareVersion;

  return v6;
}

- (NSString)buildVariant
{
  buildVariant = self->_buildVariant;
  if (!buildVariant)
  {
    if ([(SystemProperties *)self internalBuild])
    {
      uint64_t v5 = self->_buildVariant;
      self->_buildVariant = (NSString *)@"Internal";

      BOOL v6 = [(SystemProperties *)self carrierBuild];
      BOOL v7 = [(SystemProperties *)self seedBuild];
      if (v7) {
        uint64_t v8 = @"Seed";
      }
      else {
        uint64_t v8 = 0;
      }
      if (v6)
      {
        BOOL v9 = v7;
        v10 = v8;
        v11 = [(NSString *)self->_buildVariant stringByAppendingString:@"Carrier"];
        id v12 = self->_buildVariant;
        self->_buildVariant = v11;

        BOOL v7 = v9;
        uint64_t v8 = v10;
      }
      if (!v7) {
        goto LABEL_21;
      }
      v13 = self->_buildVariant;
    }
    else
    {
      if ([(SystemProperties *)self carrierBuild])
      {
        uint64_t v14 = @"Carrier";
      }
      else if ([(SystemProperties *)self vendorBuild])
      {
        uint64_t v14 = @"Vendor";
      }
      else
      {
        uint64_t v14 = @"Customer";
      }
      BOOL v15 = [(SystemProperties *)self seedBuild];
      CFStringRef v16 = self->_buildVariant;
      self->_buildVariant = &v14->isa;

      if (!v15) {
        goto LABEL_21;
      }
      v13 = self->_buildVariant;
      uint64_t v8 = @"Seed";
    }
    uint64_t v17 = [(NSString *)v13 stringByAppendingString:v8];
    v18 = self->_buildVariant;
    self->_buildVariant = v17;

LABEL_21:
    buildVariant = self->_buildVariant;
  }

  return buildVariant;
}

- (NSString)serialNumber
{
  if ([(SystemProperties *)self internalBuild] || [(SystemProperties *)self vendorBuild])
  {
    serialNumber = (__CFString *)self->_serialNumber;
    if (!serialNumber) {
      serialNumber = @"Unknown";
    }
    BOOL v4 = serialNumber;
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setVendorBuild:(BOOL)a3
{
  self->_vendorBuild = a3;
}

- (BOOL)dualSIMCapable
{
  return self->_dualSIMCapable;
}

- (BOOL)dualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (NSString)productType
{
  return self->_productType;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)basebandCapability
{
  return self->_basebandCapability;
}

- (BOOL)factoryBuild
{
  return self->_factoryBuild;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)buildVersionPrefix
{
  return self->_buildVersionPrefix;
}

- (NSString)buildPlatform
{
  return self->_buildPlatform;
}

- (NSString)basebandChipset
{
  return self->_basebandChipset;
}

- (BOOL)internalBuildDisabledByOverride
{
  return self->_internalBuildDisabledByOverride;
}

- (NSNumber)carrierSeedBuildOverride
{
  return self->_carrierSeedBuildOverride;
}

- (NSNumber)seedBuildOverride
{
  return self->_seedBuildOverride;
}

- (NSNumber)vendorBuildOverride
{
  return self->_vendorBuildOverride;
}

- (void)setVendorBuildOverride:(id)a3
{
}

- (NSNumber)npiDeviceOverride
{
  return self->_npiDeviceOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npiDeviceOverride, 0);
  objc_storeStrong((id *)&self->_vendorBuildOverride, 0);
  objc_storeStrong((id *)&self->_seedBuildOverride, 0);
  objc_storeStrong((id *)&self->_carrierSeedBuildOverride, 0);
  objc_storeStrong((id *)&self->_basebandChipset, 0);
  objc_storeStrong((id *)&self->_buildPlatform, 0);
  objc_storeStrong((id *)&self->_buildVersionPrefix, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_basebandFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_buildVariant, 0);
}

@end