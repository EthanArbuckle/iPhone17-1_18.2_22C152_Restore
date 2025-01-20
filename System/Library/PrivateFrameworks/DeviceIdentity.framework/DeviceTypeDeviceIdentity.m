@interface DeviceTypeDeviceIdentity
+ (id)sharedInstance;
- (BOOL)device_supports_dcrt_oob;
- (BOOL)device_supports_eda_certificates;
- (BOOL)device_supports_mfi_certificates;
- (BOOL)has_baseband;
- (BOOL)has_internal_diagnostics;
- (BOOL)is_audio_accessory;
- (BOOL)is_dev_board;
- (BOOL)is_devfused_undemoted;
- (BOOL)is_fpga;
- (BOOL)is_internal_build;
- (BOOL)is_ipad;
- (BOOL)is_iphone;
- (BOOL)is_ipod;
- (BOOL)is_prodfused_demoted;
- (BOOL)runningInRAMDisk;
- (BOOL)should_hactivate;
- (DeviceTypeDeviceIdentity)init;
- (NSString)device_class;
- (NSString)hardware_model;
- (NSString)product_type;
- (NSString)soc_generation;
- (id)copyBootArgs;
- (id)copyBootSessionUUID;
- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5;
- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4;
- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5;
@end

@implementation DeviceTypeDeviceIdentity

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_device_type;
  return v2;
}

uint64_t __42__DeviceTypeDeviceIdentity_sharedInstance__block_invoke()
{
  sharedInstance_device_type = objc_alloc_init(DeviceTypeDeviceIdentity);
  return MEMORY[0x1F41817F8]();
}

- (DeviceTypeDeviceIdentity)init
{
  v60.receiver = self;
  v60.super_class = (Class)DeviceTypeDeviceIdentity;
  v2 = [(DeviceTypeDeviceIdentity *)&v60 init];
  if (v2)
  {
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_is_internal_build = os_variant_allows_internal_security_policies();
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v3 = +[GestaltHlprDeviceIdentity getSharedInstance];
    v4 = (void *)[v3 copyAnswer:@"ProductType"];
    uint64_t v5 = isNSString(v4);
    product_type = v2->_product_type;
    v2->_product_type = (NSString *)v5;

    v7 = (void *)[v3 copyAnswer:@"HWModelStr"];
    uint64_t v8 = isNSString(v7);
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = (NSString *)v8;

    v2->_is_ipod = [(NSString *)v2->_product_type hasPrefix:@"iPod"];
    v2->_is_ipad = [(NSString *)v2->_product_type hasPrefix:@"iPad"];
    v2->_is_iphone = [(NSString *)v2->_product_type hasPrefix:@"iPhone"];
    v2->_is_audio_accessory = [(NSString *)v2->_product_type hasPrefix:@"AudioAccessory"];
    v2->_is_dev_board = [(NSString *)v2->_hardware_model hasSuffix:@"DEV"];
    v10 = (void *)[v3 copyAnswer:@"DeviceClass"];
    uint64_t v11 = isNSString(v10);
    device_class = v2->_device_class;
    v2->_device_class = (NSString *)v11;

    v2->_has_baseband = [v3 getBoolAnswer:@"HasBaseband"];
    v13 = [@"IODeviceTree" stringByAppendingString:@":/arm-io"];
    id v14 = [(DeviceTypeDeviceIdentity *)v2 copyDeviceTreeString:v13 key:@"soc-generation" defaultValue:0];
    uint64_t v15 = [v14 uppercaseString];
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = (NSString *)v15;

    v17 = +[GestaltHlprDeviceIdentity getSharedInstance];
    v18 = (void *)[v17 copyAnswer:@"ChipID"];
    v19 = isNSNumber(v18);

    if (([v19 isEqualToNumber:&unk_1F38E5190] & 1) != 0
      || ([v19 isEqualToNumber:&unk_1F38E51A8] & 1) != 0
      || ([v19 isEqualToNumber:&unk_1F38E51C0] & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }
    else
    {
      int v20 = [v19 isEqualToNumber:&unk_1F38E51D8] ^ 1;
    }
    v2->_device_supports_mfi_certificates = v20;
    if (([v19 isEqualToNumber:&unk_1F38E51D8] & 1) != 0
      || ([v19 isEqualToNumber:&unk_1F38E51A8] & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      int v21 = [v19 isEqualToNumber:&unk_1F38E51C0] ^ 1;
    }
    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = [v3 getBoolAnswer:@"DeviceSupportsFairPlaySecureVideoPath"];
    v22 = [@"IODeviceTree" stringByAppendingString:@":/product"];
    id v23 = [(DeviceTypeDeviceIdentity *)v2 copyDeviceTreeInt:v22 key:@"allow-hactivation" defaultValue:0];

    v24 = (void *)[v3 copyAnswer:@"CertificateProductionStatus"];
    v25 = isNSNumber(v24);

    v26 = (void *)[v3 copyAnswer:@"EffectiveProductionStatusAp"];
    v27 = isNSNumber(v26);

    v28 = (void *)[v3 copyAnswer:@"CertificateSecurityMode"];
    v29 = isNSNumber(v28);

    v30 = (void *)[v3 copyAnswer:@"EffectiveSecurityModeSEP"];
    v31 = isNSNumber(v30);

    if (v25 && v27 && v31 && v29)
    {
      if ([v25 isEqualToNumber:&unk_1F38E51F0]
        && [v27 isEqualToNumber:&unk_1F38E5208]
        && [v29 isEqualToNumber:&unk_1F38E51F0]
        && [v31 isEqualToNumber:&unk_1F38E51F0])
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }
      if ([v25 isEqualToNumber:&unk_1F38E5208]
        && [v27 isEqualToNumber:&unk_1F38E5208]
        && [v29 isEqualToNumber:&unk_1F38E51F0]
        && [v31 isEqualToNumber:&unk_1F38E51F0])
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }
    if (!v2->_is_internal_build) {
      goto LABEL_50;
    }
    if (!v2->_should_hactivate) {
      v2->_should_hactivate = [v3 getBoolAnswer:@"ShouldHactivate"];
    }
    id v32 = [(DeviceTypeDeviceIdentity *)v2 copyBootArgs];
    v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v55 = v32;
    v34 = [v32 componentsSeparatedByCharactersInSet:v33];

    if ([(NSString *)v2->_product_type containsString:@"iFPGA"])
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }
    v56 = v29;
    if (v2->_is_dev_board) {
      v2->_should_hactivate = 1;
    }
    uint64_t v35 = isNSNumber(v23);
    if (v35)
    {
      v36 = (void *)v35;
      int v37 = [v23 BOOLValue];

      if (v37) {
        v2->_should_hactivate = 1;
      }
    }
    if ([v34 containsObject:@"disable-hactivation-ma=1"]) {
      v2->_should_hactivate = 0;
    }
    v58 = v27;
    v59 = v34;
    v57 = v23;
    v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v39 = [v38 fileExistsAtPath:@"/AppleInternal/Lockdown/.hactivateoff"];

    if (v39) {
      v2->_should_hactivate = 0;
    }
    v40 = v31;
    id v41 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v42 = [v41 persistentDomainForName:@"com.apple.mobileactivationd"];

    v43 = [v42 objectForKeyedSubscript:@"DisableHactivation"];
    uint64_t v44 = isNSNumber(v43);
    if (v44)
    {
      v45 = (void *)v44;
      v46 = [v42 objectForKeyedSubscript:@"DisableHactivation"];
      int v47 = [v46 BOOLValue];

      if (v47) {
        v2->_should_hactivate = 0;
      }
    }
    else
    {
    }
    v48 = v59;
    if (is_virtual_machine())
    {
      v49 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
      id v50 = [(DeviceTypeDeviceIdentity *)v2 copyDeviceTreeInt:v49 key:@"enable-avp-fairplay" defaultValue:0];

      uint64_t v51 = isNSNumber(v50);
      v31 = v40;
      if (v51)
      {
        v52 = (void *)v51;
        int v53 = [v50 BOOLValue];

        v27 = v58;
        if (v53) {
          v2->_should_hactivate = 0;
        }
        id v23 = v57;
        v48 = v59;
        goto LABEL_49;
      }
    }
    else
    {
      id v50 = 0;
      v31 = v40;
    }
    id v23 = v57;
    v27 = v58;
LABEL_49:

    v29 = v56;
LABEL_50:
  }
  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], (const char *)[a3 fileSystemRepresentation]);
    if (v8)
    {
      io_object_t v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFTypeRef CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyBootSessionUUID
{
  size_t size = 0;
  v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v3 = malloc_type_malloc(size, 0x14BD9A43uLL);
    if (v3)
    {
      v4 = v3;
      v2 = 0;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0)) {
        v2 = (void *)[[NSString alloc] initWithUTF8String:v4];
      }
      free(v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)copyBootArgs
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(v5, 0x400uLL);
  size_t v4 = 1024;
  int v2 = sysctlbyname("kern.bootargs", v5, &v4, 0, 0);
  id result = 0;
  if (!v2) {
    return (id)[[NSString alloc] initWithUTF8String:v5];
  }
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [NSNumber numberWithInt:v5];
  id v11 = 0;
  unsigned int v17 = v5;
  if (v8 && v9)
  {
    id v11 = [(DeviceTypeDeviceIdentity *)self copyDeviceTreeProperty:v8 key:v9];
    v12 = isNSData(v11);
    if (v12)
    {
    }
    else
    {
      v13 = isNSNumber(v11);

      if (!v13) {
        goto LABEL_10;
      }
    }
    id v14 = isNSData(v11);

    if (v14)
    {
      if ([v11 length] == 4)
      {
        [v11 getBytes:&v17 length:4];
        uint64_t v15 = [NSNumber numberWithInt:v17];

        v10 = (void *)v15;
      }
    }
    else
    {
      id v11 = v11;

      v10 = v11;
    }
  }
LABEL_10:

  return v10;
}

- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  id v10 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  id v11 = v8;
  if (a4)
  {
    id v10 = [(DeviceTypeDeviceIdentity *)self copyDeviceTreeProperty:a3 key:a4];
    uint64_t v12 = isNSData(v10);
    if (v12)
    {
      v13 = (void *)v12;
      uint64_t v14 = [v10 length];

      if (v14)
      {
        id v15 = [NSString alloc];
        id v10 = v10;
        id v11 = objc_msgSend(v15, "initWithUTF8String:", objc_msgSend(v10, "bytes"));

        goto LABEL_7;
      }
    }
LABEL_6:
    id v11 = v9;
  }
LABEL_7:

  return v11;
}

- (BOOL)runningInRAMDisk
{
  id v2 = [(DeviceTypeDeviceIdentity *)self copyBootArgs];
  if (v2
    && ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v2 componentsSeparatedByCharactersInSet:v3],
        size_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    char v5 = [v4 containsObject:@"-restore"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)product_type
{
  return self->_product_type;
}

- (NSString)device_class
{
  return self->_device_class;
}

- (NSString)hardware_model
{
  return self->_hardware_model;
}

- (NSString)soc_generation
{
  return self->_soc_generation;
}

- (BOOL)device_supports_dcrt_oob
{
  return self->_device_supports_dcrt_oob;
}

- (BOOL)device_supports_mfi_certificates
{
  return self->_device_supports_mfi_certificates;
}

- (BOOL)device_supports_eda_certificates
{
  return self->_device_supports_eda_certificates;
}

- (BOOL)is_prodfused_demoted
{
  return self->_is_prodfused_demoted;
}

- (BOOL)is_devfused_undemoted
{
  return self->_is_devfused_undemoted;
}

- (BOOL)is_dev_board
{
  return self->_is_dev_board;
}

- (BOOL)is_fpga
{
  return self->_is_fpga;
}

- (BOOL)is_ipod
{
  return self->_is_ipod;
}

- (BOOL)is_ipad
{
  return self->_is_ipad;
}

- (BOOL)is_iphone
{
  return self->_is_iphone;
}

- (BOOL)is_audio_accessory
{
  return self->_is_audio_accessory;
}

- (BOOL)has_baseband
{
  return self->_has_baseband;
}

- (BOOL)should_hactivate
{
  return self->_should_hactivate;
}

- (BOOL)is_internal_build
{
  return self->_is_internal_build;
}

- (BOOL)has_internal_diagnostics
{
  return self->_has_internal_diagnostics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soc_generation, 0);
  objc_storeStrong((id *)&self->_hardware_model, 0);
  objc_storeStrong((id *)&self->_device_class, 0);
  objc_storeStrong((id *)&self->_product_type, 0);
}

@end