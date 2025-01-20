@interface DRSSystemProfile
+ (id)SHA256DigestForString:(id)a3;
+ (id)sharedInstance;
+ (unint64_t)hashForSHA256Digest:(id)a3;
- (BOOL)allowsAutomatedDeviceGroupOverride;
- (BOOL)allowsBuildVariantOverride;
- (BOOL)allowsCustomerAnalyticsOverride;
- (BOOL)customerApprovesAnalytics;
- (BOOL)hasForbiddenAutomatedDeviceGroup;
- (BOOL)isCarrier;
- (BOOL)isCarrierVal;
- (BOOL)isInternal;
- (BOOL)isInternalVal;
- (BOOL)isLogUploadEnabled;
- (BOOL)isSeed;
- (BOOL)isSeedVal;
- (BOOL)isTaskingEnabled;
- (BOOL)overridingCustomerApprovesAnalyticsValue;
- (BOOL)overridingIsCarrier;
- (BOOL)overridingIsInternal;
- (BOOL)overridingIsSeed;
- (DRSSystemProfile)init;
- (NSData)deviceSHA256Digest;
- (NSString)automatedDeviceGroup;
- (NSString)build;
- (NSString)buildVariant;
- (NSString)deviceCategory;
- (NSString)deviceModel;
- (NSString)overridingAutomatedDeviceGroup;
- (NSString)platformString;
- (unint64_t)deviceHash;
- (unint64_t)uploadSessionUploadCapBytes;
- (unsigned)platform;
- (void)_populateBuild;
- (void)_populateBuildVariant;
- (void)_populateCarrier;
- (void)_populateDeviceCategory;
- (void)_populateDeviceHash;
- (void)_populateDeviceModel;
- (void)_populatePlatform;
- (void)setAllowsAutomatedDeviceGroupOverride:(BOOL)a3;
- (void)setAllowsBuildVariantOverride:(BOOL)a3;
- (void)setAllowsCustomerAnalyticsOverride:(BOOL)a3;
- (void)setOverridingAutomatedDeviceGroup:(id)a3;
- (void)setOverridingCustomerApprovesAnalyticsValue:(BOOL)a3;
- (void)setOverridingIsCarrier:(BOOL)a3;
- (void)setOverridingIsInternal:(BOOL)a3;
- (void)setOverridingIsSeed:(BOOL)a3;
@end

@implementation DRSSystemProfile

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sharedProfile;

  return v2;
}

void __34__DRSSystemProfile_sharedInstance__block_invoke()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(DRSSystemProfile);
  v1 = (void *)sharedInstance_sharedProfile;
  sharedInstance_sharedProfile = (uint64_t)v0;

  v2 = DPLogHandle_SystemProfile();
  if (os_signpost_enabled(v2))
  {
    v3 = [(id)sharedInstance_sharedProfile build];
    v4 = [(id)sharedInstance_sharedProfile buildVariant];
    v5 = [(id)sharedInstance_sharedProfile deviceCategory];
    v6 = [(id)sharedInstance_sharedProfile deviceModel];
    v7 = [(id)sharedInstance_sharedProfile platformString];
    *(_DWORD *)buf = 138546434;
    v9 = v3;
    __int16 v10 = 2114;
    v11 = v4;
    __int16 v12 = 2114;
    v13 = v5;
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = v7;
    __int16 v18 = 2050;
    uint64_t v19 = [(id)sharedInstance_sharedProfile deviceHash];
    __int16 v20 = 1026;
    int v21 = [(id)sharedInstance_sharedProfile isInternal];
    __int16 v22 = 1026;
    int v23 = [(id)sharedInstance_sharedProfile isSeed];
    __int16 v24 = 1026;
    int v25 = [(id)sharedInstance_sharedProfile isCarrier];
    __int16 v26 = 1026;
    int v27 = [(id)sharedInstance_sharedProfile customerApprovesAnalytics];
    __int16 v28 = 1026;
    int v29 = [(id)sharedInstance_sharedProfile isLogUploadEnabled];
    __int16 v30 = 1026;
    int v31 = [(id)sharedInstance_sharedProfile isTaskingEnabled];
    __int16 v32 = 2050;
    uint64_t v33 = [(id)sharedInstance_sharedProfile uploadSessionUploadCapBytes];
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SystemProfileSingleton", "build                       = %{public}@\nbuildVariant                = %{public}@\ndeviceCategory              = %{public}@\ndeviceModel                 = %{public}@\nplatformString              = %{public}@\ndeviceHash                  = %{public}#llx\nisInternal                  = %{public}u\nisSeed                      = %{public}u\nisCarrier                   = %{public}u\ncustomerApprovesAnalytics   = %{public}u\nisLogUploadEnabled          = %{public}u\nisTaskingEnabled            = %{public}u\nuploadSessionUploadCapBytes = %{public}llu\n", buf,
      0x6Cu);
  }
}

- (void)_populateDeviceCategory
{
  switch(MGGetSInt32Answer())
  {
    case 1u:
      deviceCategory = self->_deviceCategory;
      v4 = @"iPhone";
      goto LABEL_12;
    case 2u:
      deviceCategory = self->_deviceCategory;
      v4 = @"iPod";
      goto LABEL_12;
    case 3u:
      deviceCategory = self->_deviceCategory;
      v4 = @"iPad";
      goto LABEL_12;
    case 4u:
      deviceCategory = self->_deviceCategory;
      v4 = @"AppleTV";
      goto LABEL_12;
    case 5u:
      deviceCategory = self->_deviceCategory;
      v4 = @"iFPGA";
      goto LABEL_12;
    case 6u:
      deviceCategory = self->_deviceCategory;
      v4 = @"Watch";
      goto LABEL_12;
    case 7u:
      deviceCategory = self->_deviceCategory;
      v4 = @"AudioAccessory";
      goto LABEL_12;
    case 8u:
      deviceCategory = self->_deviceCategory;
      v4 = @"Bridge";
      goto LABEL_12;
    case 9u:
      deviceCategory = self->_deviceCategory;
      v4 = @"Mac";
      goto LABEL_12;
    case 0xAu:
      deviceCategory = self->_deviceCategory;
      v4 = @"AppleDisplay";
LABEL_12:
      self->_deviceCategory = &v4->isa;

      break;
    default:
      return;
  }
}

- (void)_populateDeviceModel
{
  v3 = MGGetStringAnswer();
  if (v3)
  {
    v4 = v3;
    objc_storeStrong((id *)&self->_deviceModel, v3);
    v3 = v4;
  }
}

- (void)_populateCarrier
{
  self->_isCarrierVal = 0;
  if (![(DRSSystemProfile *)self isInternal])
  {
    CFStringRef v3 = (const __CFString *)MGGetStringAnswer();
    if (v3)
    {
      CFStringRef v4 = v3;
      self->_isCarrierVal = CFEqual(v3, @"Carrier");
      CFRelease(v4);
    }
  }
}

- (void)_populateBuild
{
  CFDictionaryRef v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263EFFAB0]);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj) {
      objc_storeStrong((id *)&self->_build, obj);
    }
    CFRelease(v4);
  }
  else
  {
    v5 = DPLogHandle_SystemProfileError();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OsVersionReadFailure", "Could not fetch OS version using _CFCopySystemVersionDictionary", buf, 2u);
    }
  }
}

+ (id)SHA256DigestForString:(id)a3
{
  CFDictionaryRef v3 = [a3 dataUsingEncoding:4];
  CFDictionaryRef v4 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v5 = v3;
  v6 = (const void *)[v5 bytes];
  CC_LONG v7 = [v5 length];
  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);

  return v8;
}

+ (unint64_t)hashForSHA256Digest:(id)a3
{
  id v3 = a3;
  if ([v3 length] != 32)
  {
    __int16 v10 = DPLogHandle_SystemProfileError();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[DRSSystemProfile hashForSHA256Digest:](v3, v10);
    }

    goto LABEL_9;
  }
  id v4 = v3;
  id v5 = (uint64_t *)[v4 bytes];
  unsigned int v6 = [v4 length];
  uint64_t v7 = (v6 >> 3);
  if (!(v6 >> 3))
  {
LABEL_9:
    unint64_t v8 = 0;
    goto LABEL_10;
  }
  unint64_t v8 = 0;
  do
  {
    uint64_t v9 = *v5++;
    v8 ^= v9;
    --v7;
  }
  while (v7);
LABEL_10:

  return v8;
}

- (void)_populateDeviceHash
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_209E70000, log, OS_LOG_TYPE_FAULT, "Failed to lookup 'kMGQUniqueDeviceID'", v1, 2u);
}

- (NSString)platformString
{
  unsigned int v2 = [(DRSSystemProfile *)self platform];
  if (v2 > 6) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_263FCA2D8[(char)v2]->isa;
  }
}

- (void)_populatePlatform
{
  self->_platform = 2;
}

- (NSString)buildVariant
{
  int v3 = [(DRSSystemProfile *)self isInternal];
  int v4 = [(DRSSystemProfile *)self isSeed];
  int v5 = [(DRSSystemProfile *)self isCarrier];

  return (NSString *)DRSSystemProfileVariantStringForParameters(v3, v4, v5);
}

- (void)_populateBuildVariant
{
  self->_isInternalVal = os_variant_has_internal_diagnostics();
  self->_isSeedVal = 0;

  [(DRSSystemProfile *)self _populateCarrier];
}

- (BOOL)isSeed
{
  if ([(DRSSystemProfile *)self allowsBuildVariantOverride])
  {
    return [(DRSSystemProfile *)self overridingIsSeed];
  }
  else
  {
    return [(DRSSystemProfile *)self isSeedVal];
  }
}

- (BOOL)isInternal
{
  if ([(DRSSystemProfile *)self allowsBuildVariantOverride])
  {
    return [(DRSSystemProfile *)self overridingIsInternal];
  }
  else
  {
    return [(DRSSystemProfile *)self isInternalVal];
  }
}

- (BOOL)isCarrier
{
  if ([(DRSSystemProfile *)self allowsBuildVariantOverride])
  {
    return [(DRSSystemProfile *)self overridingIsCarrier];
  }
  else
  {
    return [(DRSSystemProfile *)self isCarrierVal];
  }
}

- (BOOL)customerApprovesAnalytics
{
  if ([(DRSSystemProfile *)self allowsCustomerAnalyticsOverride])
  {
    return [(DRSSystemProfile *)self overridingCustomerApprovesAnalyticsValue];
  }
  else
  {
    return MEMORY[0x270F24B48]();
  }
}

- (DRSSystemProfile)init
{
  v8.receiver = self;
  v8.super_class = (Class)DRSSystemProfile;
  unsigned int v2 = [(DRSSystemProfile *)&v8 init];
  int v3 = v2;
  if (v2)
  {
    build = v2->_build;
    v2->_build = (NSString *)@"Unknown";

    deviceModel = v3->_deviceModel;
    v3->_deviceModel = (NSString *)@"Unknown";

    deviceCategory = v3->_deviceCategory;
    v3->_deviceCategory = (NSString *)@"Unknown";

    [(DRSSystemProfile *)v3 _populateBuildVariant];
    [(DRSSystemProfile *)v3 _populateBuild];
    [(DRSSystemProfile *)v3 _populateDeviceModel];
    [(DRSSystemProfile *)v3 _populateDeviceCategory];
    [(DRSSystemProfile *)v3 _populatePlatform];
    [(DRSSystemProfile *)v3 _populateDeviceHash];
  }
  return v3;
}

- (BOOL)isLogUploadEnabled
{
  BOOL v3 = [(DRSSystemProfile *)self customerApprovesAnalytics];
  if (v3) {
    LOBYTE(v3) = ![(DRSSystemProfile *)self hasForbiddenAutomatedDeviceGroup];
  }
  return v3;
}

- (BOOL)isTaskingEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DRSSystemProfile *)self customerApprovesAnalytics];
  if (v3) {
    BOOL v4 = ![(DRSSystemProfile *)self isCarrier];
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = DPLogHandle_SystemProfile();
  if (os_signpost_enabled(v5))
  {
    v7[0] = 67240704;
    v7[1] = v3;
    __int16 v8 = 1026;
    BOOL v9 = [(DRSSystemProfile *)self isCarrier];
    __int16 v10 = 1026;
    BOOL v11 = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IsTaskingEnabledDetails", "customerApprovesAnalytics = %{public}u isCarrier = %{public}u isTaskingEnabled = %{public}u", (uint8_t *)v7, 0x14u);
  }

  return v4;
}

- (unint64_t)uploadSessionUploadCapBytes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__DRSSystemProfile_uploadSessionUploadCapBytes__block_invoke;
  block[3] = &unk_263FC9990;
  block[4] = self;
  if (uploadSessionUploadCapBytes_onceToken_0 != -1) {
    dispatch_once(&uploadSessionUploadCapBytes_onceToken_0, block);
  }
  return uploadSessionUploadCapBytes_cap_0;
}

uint64_t __47__DRSSystemProfile_uploadSessionUploadCapBytes__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInternal];
  if (result)
  {
    uint64_t v3 = 0x140000000;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isSeed];
    uint64_t v3 = 0x8000000;
    if (result) {
      uint64_t v3 = 0x40000000;
    }
  }
  uploadSessionUploadCapBytes_cap_0 = v3;
  return result;
}

- (NSString)automatedDeviceGroup
{
  if (automatedDeviceGroup_onceToken != -1) {
    dispatch_once(&automatedDeviceGroup_onceToken, &__block_literal_global_83);
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__4;
  __int16 v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__DRSSystemProfile_automatedDeviceGroup__block_invoke_85;
  v5[3] = &unk_263FCA2B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)automatedDeviceGroup_automatedDeviceGroupSyncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __40__DRSSystemProfile_automatedDeviceGroup__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("DRSSystemProfile automated device group sync queue", 0);
  v1 = (void *)automatedDeviceGroup_automatedDeviceGroupSyncQueue;
  automatedDeviceGroup_automatedDeviceGroupSyncQueue = (uint64_t)v0;
}

void __40__DRSSystemProfile_automatedDeviceGroup__block_invoke_85(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) allowsAutomatedDeviceGroupOverride];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 overridingAutomatedDeviceGroup];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = DPLogHandle_SystemProfile();
    if (os_signpost_enabled(v7))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v21 = 138543362;
      uint64_t v22 = v8;
      BOOL v9 = "AutomatedDeviceGroupOverridden";
      __int16 v10 = "Got an overridden value: '%{public}@'";
      id v11 = v7;
      uint32_t v12 = 12;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v9, v10, (uint8_t *)&v21, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ([v3 isInternal])
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    if (v13 - *(double *)&automatedDeviceGroup_lastQueryTimestamp >= 60.0)
    {
      automatedDeviceGroup_lastQueryTimestamp = *(void *)&v13;
      uint64_t v17 = [MEMORY[0x263F5B620] automatedDeviceGroup];
      __int16 v18 = (void *)automatedDeviceGroup_automatedDeviceGroup;
      automatedDeviceGroup_automatedDeviceGroup = v17;

      __int16 v14 = DPLogHandle_SystemProfile();
      if (os_signpost_enabled(v14))
      {
        int v21 = 138543362;
        uint64_t v22 = automatedDeviceGroup_automatedDeviceGroup;
        v15 = "AutomatedDeviceGroupLookup";
        __int16 v16 = "Got a new automated device group: '%{public}@'";
        goto LABEL_13;
      }
    }
    else
    {
      __int16 v14 = DPLogHandle_SystemProfile();
      if (os_signpost_enabled(v14))
      {
        int v21 = 134217984;
        uint64_t v22 = 0x404E000000000000;
        v15 = "AutomatedDeviceGroupLookupHysteresis";
        __int16 v16 = "Skipping fresh lookup due to hysteresis of %.2fsec";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, (uint8_t *)&v21, 0xCu);
      }
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    id v20 = (id)automatedDeviceGroup_automatedDeviceGroup;
    uint64_t v7 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
    goto LABEL_15;
  }
  uint64_t v7 = DPLogHandle_SystemProfile();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    BOOL v9 = "AutomatedDeviceGroupSkipped";
    __int16 v10 = "Skipping automated device group lookup since we are not 'Internal'";
    id v11 = v7;
    uint32_t v12 = 2;
    goto LABEL_10;
  }
LABEL_15:
}

- (BOOL)hasForbiddenAutomatedDeviceGroup
{
  return 0;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (unint64_t)deviceHash
{
  return self->_deviceHash;
}

- (unsigned)platform
{
  return self->_platform;
}

- (BOOL)allowsCustomerAnalyticsOverride
{
  return self->_allowsCustomerAnalyticsOverride;
}

- (void)setAllowsCustomerAnalyticsOverride:(BOOL)a3
{
  self->_allowsCustomerAnalyticsOverride = a3;
}

- (BOOL)allowsBuildVariantOverride
{
  return self->_allowsBuildVariantOverride;
}

- (void)setAllowsBuildVariantOverride:(BOOL)a3
{
  self->_allowsBuildVariantOverride = a3;
}

- (BOOL)allowsAutomatedDeviceGroupOverride
{
  return self->_allowsAutomatedDeviceGroupOverride;
}

- (void)setAllowsAutomatedDeviceGroupOverride:(BOOL)a3
{
  self->_allowsAutomatedDeviceGroupOverride = a3;
}

- (BOOL)overridingCustomerApprovesAnalyticsValue
{
  return self->_overridingCustomerApprovesAnalyticsValue;
}

- (void)setOverridingCustomerApprovesAnalyticsValue:(BOOL)a3
{
  self->_overridingCustomerApprovesAnalyticsValue = a3;
}

- (BOOL)overridingIsCarrier
{
  return self->_overridingIsCarrier;
}

- (void)setOverridingIsCarrier:(BOOL)a3
{
  self->_overridingIsCarrier = a3;
}

- (BOOL)overridingIsSeed
{
  return self->_overridingIsSeed;
}

- (void)setOverridingIsSeed:(BOOL)a3
{
  self->_overridingIsSeed = a3;
}

- (BOOL)overridingIsInternal
{
  return self->_overridingIsInternal;
}

- (void)setOverridingIsInternal:(BOOL)a3
{
  self->_overridingIsInternal = a3;
}

- (NSString)overridingAutomatedDeviceGroup
{
  return self->_overridingAutomatedDeviceGroup;
}

- (void)setOverridingAutomatedDeviceGroup:(id)a3
{
}

- (NSData)deviceSHA256Digest
{
  return self->_deviceSHA256Digest;
}

- (BOOL)isInternalVal
{
  return self->_isInternalVal;
}

- (BOOL)isSeedVal
{
  return self->_isSeedVal;
}

- (BOOL)isCarrierVal
{
  return self->_isCarrierVal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSHA256Digest, 0);
  objc_storeStrong((id *)&self->_overridingAutomatedDeviceGroup, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceCategory, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

+ (void)hashForSHA256Digest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = [a1 length];
  __int16 v5 = 1024;
  int v6 = 32;
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "Attempted to generate a hash from a digest of unexpected length %lu (expected %d)", (uint8_t *)&v3, 0x12u);
}

@end