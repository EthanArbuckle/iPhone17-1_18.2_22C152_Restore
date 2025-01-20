@interface ELSDefaults
+ (id)sharedInstance;
- (ELSDefaults)init;
- (unint64_t)_getCloudKitEnvironment;
- (unint64_t)cloudKitEnvironment;
@end

@implementation ELSDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __29__ELSDefaults_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ELSDefaults);
  return MEMORY[0x270F9A758]();
}

- (ELSDefaults)init
{
  v5.receiver = self;
  v5.super_class = (Class)ELSDefaults;
  v2 = [(ELSDefaults *)&v5 init];
  v3 = v2;
  if (v2) {
    v2->_cloudKitEnvironment = [(ELSDefaults *)v2 _getCloudKitEnvironment];
  }
  return v3;
}

- (unint64_t)_getCloudKitEnvironment
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.enhanced-logging-state"];
  v3 = [v2 valueForKey:@"environment"];
  if (v3)
  {
    v4 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_21F731000, v4, OS_LOG_TYPE_DEFAULT, "Using CloudKit environment set in user defaults: %@", (uint8_t *)&v11, 0xCu);
    }

    unint64_t v5 = [v3 integerValue];
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AppleServiceToolkit"];
    uint64_t v7 = [v6 integerForKey:@"Server"];
    v8 = ELSLogHandleForCategory(11);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_21F731000, v8, OS_LOG_TYPE_DEFAULT, "Using UAT CloudKit environment", (uint8_t *)&v11, 2u);
      }
      unint64_t v5 = 1;
    }
    else
    {
      if (v9)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_21F731000, v8, OS_LOG_TYPE_DEFAULT, "Using production CloudKit environment", (uint8_t *)&v11, 2u);
      }
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (unint64_t)cloudKitEnvironment
{
  return self->_cloudKitEnvironment;
}

@end