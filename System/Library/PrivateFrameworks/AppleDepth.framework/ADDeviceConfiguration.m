@interface ADDeviceConfiguration
+ (BOOL)BOOLForKey:(id)a3;
+ (BOOL)deviceList:(id)a3 containsDeviceName:(id)a4;
+ (BOOL)isInternalBuild;
+ (double)doubleForKey:(id)a3;
+ (float)floatForKey:(id)a3;
+ (id)getDefaultConfiguration;
+ (id)getDeviceName;
+ (id)listForKey:(id)a3;
+ (id)numberForKey:(id)a3;
+ (id)sharedConfiguration;
+ (id)stringForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3;
+ (unint64_t)getLidarType:(id)a3;
- (ADDeviceConfiguration)init;
- (BOOL)createPropertyForKey:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateValue:(id)a3 forKey:(id)a4;
@end

@implementation ADDeviceConfiguration

+ (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedConfiguration];
  v6 = [v5[3] objectForKeyedSubscript:v4];

  v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if (v8) {
    char v9 = 0;
  }
  else {
    char v9 = [v6 BOOLValue];
  }

  return v9;
}

+ (id)stringForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedConfiguration];
  v6 = [v5[3] objectForKeyedSubscript:v4];

  v7 = [MEMORY[0x263EFF9D0] null];
  if ([v6 isEqual:v7])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = v6;
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

+ (id)sharedConfiguration
{
  v2 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  if (!+[ADDeviceConfiguration sharedConfiguration]::defaults)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__ADDeviceConfiguration_sharedConfiguration__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[ADDeviceConfiguration sharedConfiguration]::onceToken != -1) {
      dispatch_once(&+[ADDeviceConfiguration sharedConfiguration]::onceToken, block);
    }
    v2 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  }
  return v2;
}

+ (id)getDeviceName
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)listForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedConfiguration];
  v6 = [v5[3] objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 componentsSeparatedByString:@","];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDefaults, 0);
  objc_storeStrong((id *)&self->_appleDepthUserDefaults, 0);
  objc_storeStrong((id *)&self->_globalUserDefaults, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = (NSUserDefaults *)a4;
  id v11 = a5;
  if (self->_ignoreValueUpdate) {
    goto LABEL_23;
  }
  globalUserDefaults = self->_globalUserDefaults;
  if (self->_appleDepthUserDefaults != v10)
  {
    if (globalUserDefaults != v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error getting defaults key", buf, 2u);
      }
      goto LABEL_23;
    }
    goto LABEL_8;
  }
  if (globalUserDefaults == v10)
  {
LABEL_8:
    id v13 = v9;
    goto LABEL_9;
  }
  id v13 = [NSString stringWithFormat:@"%@.%@", @"com.apple.AppleDepth", v9];
LABEL_9:
  v14 = v13;
  appleDepthUserDefaults = self->_appleDepthUserDefaults;
  id v16 = v9;
  v17 = v16;
  v18 = v16;
  if (appleDepthUserDefaults != v10)
  {
    if ([v16 hasPrefix:@"com.apple.AppleDepth"])
    {
      v18 = [v17 substringFromIndex:objc_msgSend(@"com.apple.AppleDepth", "length") + 1];
    }
    else
    {
      v18 = 0;
    }
  }
  v19 = [(NSUserDefaults *)self->_globalUserDefaults objectForKey:v14];
  uint64_t v20 = [(NSUserDefaults *)self->_appleDepthUserDefaults objectForKey:v18];
  v21 = (void *)v20;
  if (v19 && v20)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot set configuration. %{public}@ is set in both global domain and in com.apple.appleDepth. please only use one.", buf, 0xCu);
    }
  }
  else
  {
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = v19;
    }
    [(ADDeviceConfiguration *)self updateValue:v22 forKey:v18];
  }

LABEL_23:
}

- (void)updateValue:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(ADDeviceConfiguration *)self willChangeValueForKey:v9];
  v10 = v8;
  if (!v8)
  {
    id v4 = +[ADDeviceConfiguration getDefaultConfiguration];
    v5 = [v4 objectForKeyedSubscript:v9];
    v10 = (void *)[v5 copy];
  }
  [(NSMutableDictionary *)self->_currentDefaults setObject:v10 forKeyedSubscript:v9];
  if (!v8)
  {
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(NSMutableDictionary *)self->_currentDefaults objectForKeyedSubscript:v9];
    int v21 = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADDeviceConfiguration: (%@)=>(%@)", (uint8_t *)&v21, 0x16u);
  }
  if ([v9 isEqualToString:kADDeviceConfigurationKeyJasperPerformanceOverridePath])
  {
    v12 = [(NSMutableDictionary *)self->_currentDefaults objectForKeyedSubscript:v9];
    id v13 = [MEMORY[0x263EFF9D0] null];
    char v14 = [v12 isEqual:v13];

    if (v14)
    {
      [MEMORY[0x263F26C98] resetPerformanceOverrides];
    }
    else
    {
      v15 = [(NSMutableDictionary *)self->_currentDefaults objectForKeyedSubscript:v9];
      [MEMORY[0x263F26C98] setPerformanceOverrides:v15];
    }
  }
  if ([v9 isEqualToString:kADDeviceConfigurationKeyJasperPerformanceEmulatedDevice])
  {
    id v16 = [(NSMutableDictionary *)self->_currentDefaults objectForKeyedSubscript:v9];
    v17 = [MEMORY[0x263EFF9D0] null];
    int v18 = [v16 isEqual:v17];

    if (v18)
    {

      id v16 = 0;
    }
    [MEMORY[0x263F26C98] setEmulatedDevice:v16];
  }
  if ([v9 isEqualToString:kADDeviceConfigurationKeyVerboseLogs])
  {
    v19 = [(NSMutableDictionary *)self->_currentDefaults objectForKeyedSubscript:v9];
    int v20 = [v19 BOOLValue];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109120;
      LODWORD(v22) = v20;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setting verboseLogs: %d", (uint8_t *)&v21, 8u);
    }
    ADDebugUtilsADVerboseLogsEnabled = v20;
  }
  [(ADDeviceConfiguration *)self didChangeValueForKey:v9];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = +[ADDeviceConfiguration getDefaultConfiguration];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(NSUserDefaults *)self->_appleDepthUserDefaults removeObserver:self forKeyPath:v7 context:0];
        globalUserDefaults = self->_globalUserDefaults;
        id v9 = [NSString stringWithFormat:@"%@.%@", @"com.apple.AppleDepth", v7];
        [(NSUserDefaults *)globalUserDefaults removeObserver:self forKeyPath:v9 context:0];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)ADDeviceConfiguration;
  [(ADDeviceConfiguration *)&v10 dealloc];
}

- (ADDeviceConfiguration)init
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)ADDeviceConfiguration;
  v2 = [(ADDeviceConfiguration *)&v24 init];
  if (v2)
  {
    v3 = +[ADDeviceConfiguration getDefaultConfiguration];
    uint64_t v4 = [v3 mutableCopy];
    currentDefaults = v2->_currentDefaults;
    v2->_currentDefaults = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    globalUserDefaults = v2->_globalUserDefaults;
    v2->_globalUserDefaults = (NSUserDefaults *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AppleDepth"];
    appleDepthUserDefaults = v2->_appleDepthUserDefaults;
    v2->_appleDepthUserDefaults = (NSUserDefaults *)v8;

    v2->_ignoreValueUpdate = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v10 = +[ADDeviceConfiguration getDefaultConfiguration];
    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v15 = v2->_globalUserDefaults;
          uint64_t v16 = [NSString stringWithFormat:@"%@.%@", @"com.apple.AppleDepth", v14];
          [(NSUserDefaults *)v15 addObserver:v2 forKeyPath:v16 options:7 context:0];

          v2->_ignoreValueUpdate = 1;
          [(NSUserDefaults *)v2->_appleDepthUserDefaults addObserver:v2 forKeyPath:v14 options:7 context:0];
          v2->_ignoreValueUpdate = 0;
          if (![(ADDeviceConfiguration *)v2 createPropertyForKey:v14])
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v26 = v14;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed setting property for configuration key %{public}@", buf, 0xCu);
            }

            v17 = 0;
            goto LABEL_15;
          }
        }
        objc_super v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  v17 = v2;
LABEL_15:

  return v17;
}

- (BOOL)createPropertyForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "substringToIndex:", 1, 0x215FD7C0ALL, 0x215FD7C0CLL, 0x215FD7C12, 0x215FD65B8);
  uint64_t v5 = [v4 uppercaseString];
  uint64_t v6 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);

  uint64_t v7 = [v6 stringByAppendingString:@":"];

  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSSelectorFromString((NSString *)v3);
  if (class_addMethod(v8, v9, (IMP)getterDummy, "@@:")
    && (objc_super v10 = (objc_class *)objc_opt_class(),
        uint64_t v11 = NSSelectorFromString(v7),
        class_addMethod(v10, v11, (IMP)setterDummy, "v@:@")))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    BOOL v13 = class_addProperty(v12, (const char *)[v3 UTF8String], &v15, 2u);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)isInternalBuild
{
  return MEMORY[0x270F95FB8](@"InternalBuild", a2);
}

+ (unint64_t)getLidarType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uppercaseString];

  if (!+[ADDeviceConfiguration getLidarType:]::supportedJasperDevices) {
    +[ADDeviceConfiguration getLidarType:]::supportedJasperDevices = (uint64_t)&unk_26C698508;
  }
  uint64_t v5 = (void *)+[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices;
  if (!+[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices)
  {
    uint64_t v5 = &unk_26C698520;
    +[ADDeviceConfiguration getLidarType:]::supportedPeridotDevices = (uint64_t)&unk_26C698520;
  }
  if (+[ADDeviceConfiguration deviceList:v5 containsDeviceName:v4])
  {
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = +[ADDeviceConfiguration deviceList:containsDeviceName:](ADDeviceConfiguration, "deviceList:containsDeviceName:", +[ADDeviceConfiguration getLidarType:]::supportedJasperDevices, v4);
  }

  return v6;
}

+ (BOOL)deviceList:(id)a3 containsDeviceName:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "hasPrefix:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)numberForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConfiguration];
  id v6 = [v5[3] objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = NSNumber;
    [v6 doubleValue];
    objc_msgSend(v8, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v7;

  return v9;
}

+ (double)doubleForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConfiguration];
  id v6 = [v5[3] objectForKeyedSubscript:v4];

  id v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  double v9 = 0.0;
  if ((v8 & 1) == 0)
  {
    [v6 doubleValue];
    double v9 = v10;
  }

  return v9;
}

+ (float)floatForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConfiguration];
  id v6 = [v5[3] objectForKeyedSubscript:v4];

  id v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  float v9 = 0.0;
  if ((v8 & 1) == 0)
  {
    [v6 floatValue];
    float v9 = v10;
  }

  return v9;
}

+ (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedConfiguration];
  id v6 = [v5[3] objectForKeyedSubscript:v4];

  id v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if (v8) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = [v6 integerValue];
  }

  return v9;
}

void __44__ADDeviceConfiguration_sharedConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = AppleDepthRuntimeVersionString;
    id v3 = [(id)objc_opt_class() getDeviceName];
    int v24 = 138412546;
    uint64_t v25 = (__CFString *)v2;
    __int16 v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Initializing default configuration for AppleDepth-%@ for device %@", (uint8_t *)&v24, 0x16u);
  }
  id v4 = objc_alloc_init(*(Class *)(a1 + 32));
  id v5 = (void *)+[ADDeviceConfiguration sharedConfiguration]::defaults;
  +[ADDeviceConfiguration sharedConfiguration]::defaults = (uint64_t)v4;

  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = [(id)objc_opt_class() getDeviceName];
    uint64_t v8 = [v6 getLidarType:v7];
    int v24 = 134217984;
    uint64_t v25 = (__CFString *)v8;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "lidar type: %lu", (uint8_t *)&v24, 0xCu);
  }
  int64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  float v10 = [v9 infoDictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"BuildInformationString"];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    uint64_t v25 = v11;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "AppleDepth build information: %@", (uint8_t *)&v24, 0xCu);
  }
  if ([(__CFString *)v11 hasSuffix:@"(AppleDepth-)"])
  {
    long long v12 = @"official";
  }
  else if ([(__CFString *)v11 isEqualToString:@"unknown"])
  {
    long long v12 = @"local build";
  }
  else
  {
    long long v12 = @"root";
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    uint64_t v25 = v12;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "AppleDepth source: %@", (uint8_t *)&v24, 0xCu);
  }
  id v13 = [v9 bundleIdentifier];
  [v13 UTF8String];
  int v14 = os_variant_allows_internal_security_policies();

  if (v14)
  {
    CFDictionaryRef v15 = IOServiceNameMatching("options");
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v15);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"boot-args", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    int v18 = [CFProperty containsString:@"enforceModelSignatureChecks=0"];
    if (([(__CFString *)v12 isEqualToString:@"official"] | v18))
    {
      BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      if (MatchingService && CFProperty)
      {
        if (v19)
        {
          long long v20 = @"not ";
          if (v18) {
            long long v20 = &stru_26C6879A8;
          }
          int v24 = 138412546;
          uint64_t v25 = @"enforceModelSignatureChecks=0";
          __int16 v26 = 2112;
          v27 = v20;
          long long v21 = &_os_log_internal;
          long long v22 = "%@ is %@set";
          uint32_t v23 = 22;
          goto LABEL_27;
        }
LABEL_28:
        IOObjectRelease(MatchingService);

        goto LABEL_29;
      }
      if (!v19) {
        goto LABEL_28;
      }
      LOWORD(v24) = 0;
      long long v21 = &_os_log_internal;
      long long v22 = "Unable to verify boot-args";
      uint32_t v23 = 2;
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v24 = 138412290;
      uint64_t v25 = @"enforceModelSignatureChecks=0";
      long long v21 = &_os_log_internal;
      long long v22 = "Missing required boot-arg: %@";
      uint32_t v23 = 12;
    }
LABEL_27:
    _os_log_impl(&dword_215F16000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v24, v23);
    goto LABEL_28;
  }
LABEL_29:
}

+ (id)getDefaultConfiguration
{
  v19[25] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
  if (!+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems)
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 bundleIdentifier];

    id v6 = v5;
    [v6 UTF8String];
    if (os_variant_allows_internal_security_policies())
    {
      id v7 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 2uLL, 1);
      uint64_t v8 = [v7 objectAtIndex:0];
      uint64_t v9 = [v8 stringByAppendingPathComponent:v6];

      id v3 = (void *)v9;
    }
    v18[0] = kADDeviceConfigurationKeyJasperColorInFieldForceAngularVelocityLogic;
    v18[1] = kADDeviceConfigurationKeyJasperColorInFieldAngularVelocityThreshold;
    v19[0] = &unk_26C6983E8;
    v19[1] = &unk_26C698400;
    v18[2] = kADDeviceConfigurationKeyJasperColorInFieldForceRun;
    v18[3] = kADDeviceConfigurationKeyJasperColorInFieldDisableSDF;
    v19[2] = &unk_26C6983E8;
    v19[3] = &unk_26C6983E8;
    v18[4] = kADDeviceConfigurationKeyJasperColorInFieldOperationMode;
    v18[5] = kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames;
    v19[4] = &unk_26C698418;
    v19[5] = &unk_26C698430;
    v18[6] = kADDeviceConfigurationKeyJasperColorIsfCapacity;
    v18[7] = kADDeviceConfigurationKeyJasperColorIsfOutliers;
    v19[6] = &unk_26C698448;
    v19[7] = &unk_26C698460;
    v18[8] = kADDeviceConfigurationKeyJasperColorInfieldFrequency;
    v18[9] = kADDeviceConfigurationKeyPearlColorInFieldOperationMode;
    v19[8] = &unk_26C698418;
    v19[9] = &unk_26C698418;
    v18[10] = kADDeviceConfigurationKeyPearlColorInFieldMinRotationBetweenFrames;
    v18[11] = kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS;
    v19[10] = &unk_26C698430;
    v19[11] = &unk_26C698478;
    v18[12] = kADDeviceConfigurationKeyPearlColorIsfOutliers_iOS;
    v18[13] = kADDeviceConfigurationKeyPearlColorIsfCapacity;
    v19[12] = &unk_26C698430;
    v19[13] = &unk_26C698490;
    v18[14] = kADDeviceConfigurationKeyPearlColorIsfOutliers;
    v18[15] = kADDeviceConfigurationKeyPearlColorMinimumLuxLevel;
    v19[14] = &unk_26C6984A8;
    v19[15] = &unk_26C6984C0;
    v19[16] = kADDeviceConfigurationKeyPearlColorStdThresholdNoOverride;
    v18[16] = kADDeviceConfigurationKeyPearlColorStdThreshold_iOS;
    v18[17] = kADDeviceConfigurationKeyJasperPerformanceOverridePath;
    float v10 = [MEMORY[0x263EFF9D0] null];
    v19[17] = v10;
    v18[18] = kADDeviceConfigurationKeyJasperPerformanceEmulatedDevice;
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    v19[18] = v11;
    v19[19] = v3;
    v18[19] = kADDeviceConfigurationKeyModelConfigurationFolder;
    v18[20] = kADDeviceConfigurationKeyEnabledLoggers;
    long long v12 = [MEMORY[0x263EFF9D0] null];
    v19[20] = v12;
    v18[21] = kADDeviceConfigurationKeyLoggingHostName;
    id v13 = [MEMORY[0x263EFF9D0] null];
    v19[21] = v13;
    v18[22] = kADDeviceConfigurationKeyLogFolder;
    int v14 = [MEMORY[0x263EFF9D0] null];
    v19[22] = v14;
    v19[23] = MEMORY[0x263EFFA80];
    v18[23] = kADDeviceConfigurationKeyLoggingPriorityForceAll;
    v18[24] = kADDeviceConfigurationKeyVerboseLogs;
    v19[24] = MEMORY[0x263EFFA80];
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:25];
    uint64_t v16 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
    +[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems = v15;

    uint64_t v2 = (void *)+[ADDeviceConfiguration getDefaultConfiguration]::s_allADDeviceConfigurationItems;
  }
  return v2;
}

@end