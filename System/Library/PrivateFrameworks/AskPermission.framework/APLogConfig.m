@interface APLogConfig
+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5;
+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4;
+ (id)sharedConfig;
+ (id)sharedDaemonConfig;
+ (id)sharedExtensionConfig;
+ (id)sharedFrameworkConfig;
+ (id)sharedPluginConfig;
+ (id)sharedSettingsConfig;
+ (id)sharedUIServiceConfig;
- (APLogConfig)init;
- (BOOL)isEqual:(id)a3;
- (NSString)category;
- (NSString)subsystem;
- (OS_dispatch_queue)propertyAccessQueue;
- (OS_os_log)OSLogObject;
- (OS_os_log)backingOSLogObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBackingOSLogObject:(id)a3;
- (void)setCategory:(id)a3;
- (void)setPropertyAccessQueue:(id)a3;
- (void)setSubsystem:(id)a3;
@end

@implementation APLogConfig

- (APLogConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)APLogConfig;
  v2 = [(APLogConfig *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AskPermission.APLogConfig", MEMORY[0x263EF83A8]);
    propertyAccessQueue = v2->_propertyAccessQueue;
    v2->_propertyAccessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__APLogConfig_sharedConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedConfig_ap_once_token___COUNTER__, block);
  }
  v2 = (void *)sharedConfig_ap_once_object___COUNTER__;
  return v2;
}

uint64_t __27__APLogConfig_sharedConfig__block_invoke(uint64_t a1)
{
  sharedConfig_ap_once_object___COUNTER__ = [*(id *)(a1 + 32) _createLogConfigWithSubsystem:@"com.apple.AskPermission" category:@"general"];
  return MEMORY[0x270F9A758]();
}

+ (id)sharedDaemonConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__APLogConfig_sharedDaemonConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDaemonConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedDaemonConfig_ap_once_token___COUNTER__, block);
  }
  v2 = (void *)sharedDaemonConfig_ap_once_object___COUNTER__;
  return v2;
}

void __33__APLogConfig_sharedDaemonConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"daemon"];
  dispatch_queue_t v3 = (void *)sharedDaemonConfig_ap_once_object___COUNTER__;
  sharedDaemonConfig_ap_once_object___COUNTER__ = v2;
}

+ (id)sharedExtensionConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedExtensionConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedExtensionConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedExtensionConfig_ap_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedExtensionConfig_ap_once_object___COUNTER__;
  return v2;
}

void __36__APLogConfig_sharedExtensionConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"extension"];
  dispatch_queue_t v3 = (void *)sharedExtensionConfig_ap_once_object___COUNTER__;
  sharedExtensionConfig_ap_once_object___COUNTER__ = v2;
}

+ (id)sharedFrameworkConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedFrameworkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFrameworkConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedFrameworkConfig_ap_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedFrameworkConfig_ap_once_object___COUNTER__;
  return v2;
}

void __36__APLogConfig_sharedFrameworkConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"framework"];
  dispatch_queue_t v3 = (void *)sharedFrameworkConfig_ap_once_object___COUNTER__;
  sharedFrameworkConfig_ap_once_object___COUNTER__ = v2;
}

+ (id)sharedSettingsConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__APLogConfig_sharedSettingsConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettingsConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedSettingsConfig_ap_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedSettingsConfig_ap_once_object___COUNTER__;
  return v2;
}

void __35__APLogConfig_sharedSettingsConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"settings"];
  dispatch_queue_t v3 = (void *)sharedSettingsConfig_ap_once_object___COUNTER__;
  sharedSettingsConfig_ap_once_object___COUNTER__ = v2;
}

+ (id)sharedPluginConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__APLogConfig_sharedPluginConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPluginConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedPluginConfig_ap_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedPluginConfig_ap_once_object___COUNTER__;
  return v2;
}

void __33__APLogConfig_sharedPluginConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"plugin"];
  dispatch_queue_t v3 = (void *)sharedPluginConfig_ap_once_object___COUNTER__;
  sharedPluginConfig_ap_once_object___COUNTER__ = v2;
}

+ (id)sharedUIServiceConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__APLogConfig_sharedUIServiceConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUIServiceConfig_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&sharedUIServiceConfig_ap_once_token___COUNTER__, block);
  }
  uint64_t v2 = (void *)sharedUIServiceConfig_ap_once_object___COUNTER__;
  return v2;
}

void __36__APLogConfig_sharedUIServiceConfig__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 sharedConfig];
  uint64_t v2 = [v1 _createLogConfigWithBaseConfig:v4 subystem:0 category:@"uiservice"];
  dispatch_queue_t v3 = (void *)sharedUIServiceConfig_ap_once_object___COUNTER__;
  sharedUIServiceConfig_ap_once_object___COUNTER__ = v2;
}

- (OS_os_log)OSLogObject
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  dispatch_queue_t v3 = [(APLogConfig *)self propertyAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__APLogConfig_OSLogObject__block_invoke;
  block[3] = &unk_26474E438;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v3, block);

  id v4 = (void *)v11[5];
  if (!v4)
  {
    v5 = [(APLogConfig *)self propertyAccessQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__APLogConfig_OSLogObject__block_invoke_2;
    v8[3] = &unk_26474E438;
    v8[4] = self;
    v8[5] = &v10;
    dispatch_barrier_sync(v5, v8);

    id v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (OS_os_log *)v6;
}

uint64_t __26__APLogConfig_OSLogObject__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) backingOSLogObject];
  return MEMORY[0x270F9A758]();
}

id *__26__APLogConfig_OSLogObject__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backingOSLogObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  result = (id *)(v5 + 40);
  if (v7) {
    return result;
  }
  objc_storeStrong(result, &_os_log_internal);
  id v8 = [*(id *)(a1 + 32) subsystem];
  if (![v8 length]) {
    goto LABEL_5;
  }
  v9 = [*(id *)(a1 + 32) category];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v8 = [*(id *)(a1 + 32) subsystem];
    v11 = (const char *)[v8 UTF8String];
    id v12 = [*(id *)(a1 + 32) category];
    os_log_t v13 = os_log_create(v11, (const char *)[v12 UTF8String]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_5:
  }
  v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return (id *)[v16 setBackingOSLogObject:v17];
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)APLogConfig;
  id v4 = [(APLogConfig *)&v9 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: {\n", v4];

  id v6 = [(APLogConfig *)self category];
  [v5 appendFormat:@"  category: %@\n", v6];

  uint64_t v7 = [(APLogConfig *)self subsystem];
  [v5 appendFormat:@"  subsystem: %@\n", v7];

  [v5 appendString:@"}"];
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(APLogConfig *)self category];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(APLogConfig *)self subsystem];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (APLogConfig *)a3;
  if (self == v5)
  {
    char v7 = 1;
    goto LABEL_18;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v8 = [(APLogConfig *)self category];
    if (v8 || ([(APLogConfig *)v5 category], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v9 = [(APLogConfig *)self category];
      uint64_t v10 = [(APLogConfig *)v5 category];
      int v11 = [v9 isEqual:v10];

      if (v8)
      {

        if (!v11) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v11 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    id v12 = [(APLogConfig *)self subsystem];
    if (v12 || ([(APLogConfig *)v5 subsystem], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      os_log_t v13 = [(APLogConfig *)self subsystem];
      uint64_t v14 = [(APLogConfig *)v5 subsystem];
      int v15 = [v13 isEqual:v14] ^ 1;

      if (v12)
      {
LABEL_17:

        char v7 = v15 ^ 1;
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }

    goto LABEL_17;
  }
LABEL_3:
  char v7 = 0;
LABEL_18:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[APLogConfig allocWithZone:](APLogConfig, "allocWithZone:") init];
  uint64_t v6 = [(APLogConfig *)self category];
  uint64_t v7 = [v6 copyWithZone:a3];
  category = v5->_category;
  v5->_category = (NSString *)v7;

  objc_super v9 = [(APLogConfig *)self subsystem];
  uint64_t v10 = [v9 copyWithZone:a3];
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(APLogConfig *)+[APMutableLogConfig allocWithZone:](APMutableLogConfig, "allocWithZone:") init];
  uint64_t v6 = [(APLogConfig *)self category];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(APLogConfig *)v5 setCategory:v7];

  id v8 = [(APLogConfig *)self subsystem];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [(APLogConfig *)v5 setSubsystem:v9];

  return v5;
}

+ (id)_createLogConfigWithSubsystem:(id)a3 category:(id)a4
{
  return (id)[a1 _createLogConfigWithBaseConfig:0 subystem:a3 category:a4];
}

+ (id)_createLogConfigWithBaseConfig:(id)a3 subystem:(id)a4 category:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7) {
    uint64_t v10 = (APMutableLogConfig *)[v7 mutableCopy];
  }
  else {
    uint64_t v10 = objc_alloc_init(APMutableLogConfig);
  }
  int v11 = v10;
  if (v8) {
    [(APLogConfig *)v10 setSubsystem:v8];
  }
  if (v9) {
    [(APLogConfig *)v11 setCategory:v9];
  }
  id v12 = (void *)[(APMutableLogConfig *)v11 copy];

  return v12;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
}

- (OS_os_log)backingOSLogObject
{
  return self->_backingOSLogObject;
}

- (void)setBackingOSLogObject:(id)a3
{
}

- (OS_dispatch_queue)propertyAccessQueue
{
  return self->_propertyAccessQueue;
}

- (void)setPropertyAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAccessQueue, 0);
  objc_storeStrong((id *)&self->_backingOSLogObject, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end