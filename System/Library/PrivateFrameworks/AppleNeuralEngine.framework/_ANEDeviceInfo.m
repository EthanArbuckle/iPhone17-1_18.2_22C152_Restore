@interface _ANEDeviceInfo
+ (BOOL)hasANE;
+ (BOOL)isBoolBootArgSetTrue:(id)a3;
+ (BOOL)isExcessivePowerDrainWhenIdle;
+ (BOOL)isInternalBuild;
+ (BOOL)isVirtualMachine;
+ (BOOL)precompiledModelChecksDisabled;
+ (id)aneArchitectureType;
+ (id)aneSubType;
+ (id)aneSubTypeProductVariant;
+ (id)aneSubTypeVariant;
+ (id)bootArgs;
+ (id)buildVersion;
+ (id)productName;
+ (int64_t)aneBoardType;
+ (unsigned)numANECores;
+ (unsigned)numANEs;
+ (void)aneSubType;
+ (void)numANECores;
+ (void)numANEs;
@end

@implementation _ANEDeviceInfo

+ (BOOL)isExcessivePowerDrainWhenIdle
{
  return [a1 aneBoardType] == 96;
}

+ (id)aneSubTypeProductVariant
{
  uint64_t v2 = [a1 aneBoardType];
  v3 = +[_ANELog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[_ANEDeviceInfo aneSubType];
  }

  v10 = +[_ANEVirtualClient sharedConnection];

  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke_65;
    v14[3] = &unk_1E6C1C0C8;
    v15 = &__block_literal_global_64;
    uint64_t v16 = v2;
    if (+[_ANEDeviceInfo aneSubTypeProductVariant]::onceToken != -1) {
      dispatch_once(&+[_ANEDeviceInfo aneSubTypeProductVariant]::onceToken, v14);
    }
    v11 = v15;
  }
  else
  {
    v11 = (void *)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
    +[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr = (uint64_t)&stru_1F35E5710;
  }

  v12 = (void *)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
  return v12;
}

+ (BOOL)isInternalBuild
{
  if (+[_ANEDeviceInfo isInternalBuild]::onceTokenIsInternalBuild != -1) {
    dispatch_once(&+[_ANEDeviceInfo isInternalBuild]::onceTokenIsInternalBuild, &__block_literal_global);
  }
  return +[_ANEDeviceInfo isInternalBuild]::isInternalBuild;
}

+ (id)aneSubTypeVariant
{
  uint64_t v2 = [a1 aneBoardType];
  v3 = +[_ANELog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[_ANEDeviceInfo aneSubType];
  }

  v10 = +[_ANEVirtualClient sharedConnection];

  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke_62;
    v17[3] = &unk_1E6C1C0C8;
    v18 = &__block_literal_global_55;
    uint64_t v19 = v2;
    if (+[_ANEDeviceInfo aneSubTypeVariant]::onceTokenSubVariantType != -1) {
      dispatch_once(&+[_ANEDeviceInfo aneSubTypeVariant]::onceTokenSubVariantType, v17);
    }
    v11 = v18;
  }
  else
  {
    *((void *)&v13 + 1) = v2;
    *(void *)&long long v13 = v2 - 64;
    unint64_t v12 = v13 >> 4;
    if (v12 > 0xD) {
      v14 = &stru_1F35E5710;
    }
    else {
      v14 = off_1E6C1C108[v12];
    }
    v11 = (void *)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
    +[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr = (uint64_t)v14;
  }

  v15 = (void *)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
  return v15;
}

+ (id)aneSubType
{
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __28___ANEDeviceInfo_aneSubType__block_invoke;
  v18[3] = &__block_descriptor_40_e8_v16__0q8l;
  v18[4] = a2;
  v3 = (void (**)(void, void))MEMORY[0x1E0193A40](v18);
  uint64_t v4 = [a1 aneBoardType];
  uint64_t v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[_ANEDeviceInfo aneSubType];
  }

  unint64_t v12 = +[_ANEVirtualClient sharedConnection];

  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28___ANEDeviceInfo_aneSubType__block_invoke_53;
    block[3] = &unk_1E6C1C0C8;
    uint64_t v16 = v3;
    uint64_t v17 = v4;
    if (+[_ANEDeviceInfo aneSubType]::onceTokenSubType != -1) {
      dispatch_once(&+[_ANEDeviceInfo aneSubType]::onceTokenSubType, block);
    }
  }
  else
  {
    v3[2](v3, v4);
  }
  id v13 = (id)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;

  return v13;
}

+ (BOOL)hasANE
{
  uint64_t v2 = +[_ANEVirtualClient sharedConnection];

  if (!v2)
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      if (+[_ANEDeviceInfo hasANE]::onceTokenHasANE == -1) {
        return +[_ANEDeviceInfo hasANE]::hasANE;
      }
      uint64_t v5 = &__block_literal_global_7;
    }
    else
    {
      if (+[_ANEDeviceInfo hasANE]::onceTokenHasANE == -1) {
        return +[_ANEDeviceInfo hasANE]::hasANE;
      }
      uint64_t v5 = &__block_literal_global_9;
    }
    dispatch_once(&+[_ANEDeviceInfo hasANE]::onceTokenHasANE, v5);
    return +[_ANEDeviceInfo hasANE]::hasANE;
  }
  v3 = +[_ANEVirtualClient sharedConnection];
  +[_ANEDeviceInfo hasANE]::hasANE = [v3 hasANE];

  return +[_ANEDeviceInfo hasANE]::hasANE;
}

+ (int64_t)aneBoardType
{
  uint64_t v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    v3 = +[_ANEVirtualClient sharedConnection];
    +[_ANEDeviceInfo aneBoardType]::boardType = [v3 aneBoardtype];
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine]) {
      return 1;
    }
    if (+[_ANEDeviceInfo aneBoardType]::onceTokenBoardType != -1) {
      dispatch_once(&+[_ANEDeviceInfo aneBoardType]::onceTokenBoardType, &__block_literal_global_20);
    }
  }
  return +[_ANEDeviceInfo aneBoardType]::boardType;
}

+ (BOOL)isVirtualMachine
{
  if (+[_ANEDeviceInfo isVirtualMachine]::onceToken != -1) {
    dispatch_once(&+[_ANEDeviceInfo isVirtualMachine]::onceToken, &__block_literal_global_3);
  }
  return +[_ANEDeviceInfo isVirtualMachine]::isVirtualMachine;
}

+ (void)aneSubType
{
}

+ (unsigned)numANECores
{
  v3 = +[_ANEDeviceInfo aneSubType];
  unsigned int v4 = +[_ANEDeviceInfo numANEs];
  if ([v3 isEqual:@"h11"] & 1) != 0 || (objc_msgSend(v3, "isEqual:", @"h12"))
  {
    int v5 = 8;
  }
  else
  {
    if (([v3 isEqual:@"m9"] & 1) == 0)
    {
      if (([v3 isEqual:@"h13"] & 1) != 0
        || ([v3 isEqual:@"h14"] & 1) != 0
        || ([v3 isEqual:@"h15"] & 1) != 0
        || ([v3 isEqual:@"h16"] & 1) != 0)
      {
        int v5 = 16;
        goto LABEL_4;
      }
      if ([v3 isEqual:@"m11"])
      {
        int v5 = 4;
        goto LABEL_4;
      }
      uint64_t v7 = +[_ANELog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        +[_ANEDeviceInfo numANECores]();
      }
    }
    int v5 = 2;
  }
LABEL_4:

  return v5 * v4;
}

+ (unsigned)numANEs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!+[_ANEDeviceInfo hasANE])
  {
    uint64_t v8 = NSStringFromSelector(a2);
    NSLog(&cfstr_AnedeviceinfoN_2.isa, v8);

    return 0;
  }
  unsigned int valuePtr = 1;
  CFDictionaryRef v3 = IOServiceMatching("H1xANELoadBalancer");
  unsigned int v4 = (mach_port_t *)MEMORY[0x1E4F2EEF0];
  if (v3 && (io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EEF0], v3)) != 0)
  {
    io_object_t v6 = MatchingService;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"DeviceProperties", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v6);
  }
  else
  {
    CFDictionaryRef CFProperty = 0;
  }
  CFDictionaryRef v10 = IOServiceMatching("H11ANEIn");
  if (v10 && (io_service_t v11 = IOServiceGetMatchingService(*v4, v10)) != 0)
  {
    io_object_t v12 = v11;
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v14 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v11, @"DeviceProperties", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v12);
    if (CFProperty) {
      CFMutableDictionaryRef MutableCopy = CFProperty;
    }
    else {
      CFMutableDictionaryRef MutableCopy = v14;
    }
    if (CFProperty && v14)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v13, 0, CFProperty);
      CFDictionaryApplyFunction(v14, (CFDictionaryApplierFunction)getANEDeviceProperties(__CFString const*)::{lambda(__CFDictionary const*,__CFDictionary const*)#1}::operator() const(__CFDictionary const*,__CFDictionary const*)::{lambda(void const*,void const*,void *)#1}::__invoke, MutableCopy);
      CFRelease(CFProperty);
      CFRelease(v14);
    }
    if (MutableCopy) {
      goto LABEL_16;
    }
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFProperty;
    if (CFProperty)
    {
LABEL_16:
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, @"ANEDevicePropertyNumANEs");
      if (Value)
      {
        CFNumberRef v17 = Value;
        CFTypeID v18 = CFGetTypeID(Value);
        if (v18 == CFNumberGetTypeID() && !CFNumberGetValue(v17, kCFNumberSInt32Type, &valuePtr))
        {
          uint64_t v19 = +[_ANELog framework];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            +[_ANEDeviceInfo numANEs]();
          }
        }
      }
      if (!valuePtr)
      {
        v20 = +[_ANELog framework];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          +[_ANEDeviceInfo numANEs]();
        }

        unsigned int valuePtr = 1;
      }
      CFRelease(MutableCopy);
      return valuePtr;
    }
  }
  v21 = +[_ANELog framework];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_impl(&dword_1DB8AB000, v21, OS_LOG_TYPE_INFO, "%@: [_ANEDeviceInfo numANEs] Properties not found, default to 1 ANE", buf, 0xCu);
  }
  return 1;
}

+ (id)aneArchitectureType
{
  uint64_t v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    CFDictionaryRef v3 = +[_ANEVirtualClient sharedConnection];
    uint64_t v4 = [v3 aneArchitectureTypeStr];
    int v5 = (void *)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
    +[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr = v4;
  }
  else
  {
    if (+[_ANEDeviceInfo isVirtualMachine])
    {
      id v6 = 0;
      goto LABEL_8;
    }
    if (+[_ANEDeviceInfo aneArchitectureType]::onceTokenArchitectureType != -1) {
      dispatch_once(&+[_ANEDeviceInfo aneArchitectureType]::onceTokenArchitectureType, &__block_literal_global_14);
    }
  }
  id v6 = (id)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
LABEL_8:
  return v6;
}

+ (id)buildVersion
{
  if (+[_ANEDeviceInfo buildVersion]::onceToken != -1) {
    dispatch_once(&+[_ANEDeviceInfo buildVersion]::onceToken, &__block_literal_global_67);
  }
  uint64_t v2 = (void *)+[_ANEDeviceInfo buildVersion]::buildVersionStr;
  return v2;
}

+ (id)productName
{
  if (+[_ANEDeviceInfo productName]::onceToken != -1) {
    dispatch_once(&+[_ANEDeviceInfo productName]::onceToken, &__block_literal_global_72);
  }
  uint64_t v2 = (void *)+[_ANEDeviceInfo productName]::productNameStr;
  return v2;
}

+ (id)bootArgs
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x400uLL, 0x94C61774uLL);
  size_t v5 = 1023;
  if (sysctlbyname("kern.bootargs", v2, &v5, 0, 0))
  {
    CFDictionaryRef v3 = &stru_1F35E5710;
  }
  else
  {
    v2[1023] = 0;
    objc_msgSend(NSString, "stringWithFormat:", @"%s", v2);
    CFDictionaryRef v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  free(v2);
  return v3;
}

+ (BOOL)isBoolBootArgSetTrue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[_ANEDeviceInfo bootArgs];
  if ([v4 rangeOfString:v3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"%@=0", v3];
    BOOL v5 = [v4 rangeOfString:v6] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

+ (BOOL)precompiledModelChecksDisabled
{
  id v3 = [a1 bootArgs];
  int v4 = [v3 containsString:@"enforceModelSignatureChecks=0"];
  if (v4)
  {
    BOOL v5 = NSStringFromSelector(a2);
    NSLog(&cfstr_BootArgsHasAll.isa, v5, @"enforceModelSignatureChecks=0");
  }
  return v4;
}

+ (void)numANEs
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@:  [_ANEDeviceInfo numANEs] Failed to get numANEs, default to 1 ANE", v5);
}

+ (void)numANECores
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_0(&dword_1DB8AB000, v3, v4, "%@: Unknown aneSubType", v5);
}

@end