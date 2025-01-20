@interface HDSDefaults
+ (BOOL)disableNeedsSetup;
+ (BOOL)forceFailSetupLater;
+ (BOOL)forceFailTCServerResponse;
+ (BOOL)forceFailiTunesAuth;
+ (BOOL)sysDropEnabled;
+ (BOOL)sysDropForceErrorEarlyEnabled;
+ (BOOL)sysDropForceErrorLateEnabled;
+ (BOOL)sysDropProfileInstalled;
+ (BOOL)waitForAccessorySync;
+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4;
+ (id)sharedDefaults;
+ (id)sharedInstance;
+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4;
+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4;
+ (int64_t)timeoutForSSIDFetch;
+ (unsigned)sysDropBuildMode;
+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4;
+ (void)setSysDropMode:(BOOL)a3;
- (HDSDefaults)init;
- (NSUserDefaults)defaults;
- (void)setDefaults:(id)a3;
@end

@implementation HDSDefaults

- (HDSDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDSDefaults;
  v2 = [(HDSDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.HomeDeviceSetup"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __29__HDSDefaults_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HDSDefaults);
  uint64_t v1 = sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)sharedDefaults
{
  v2 = +[HDSDefaults sharedInstance];
  uint64_t v3 = [v2 defaults];

  return v3;
}

+ (int64_t)timeoutForSSIDFetch
{
  return [a1 getIntegerForKey:@"ssidfetchTimeout" defaultValue:0];
}

+ (BOOL)sysDropEnabled
{
  return [a1 getBoolForKey:@"SysDrop" defaultValue:1] != 0;
}

+ (void)setSysDropMode:(BOOL)a3
{
}

+ (unsigned)sysDropBuildMode
{
  unsigned int result = [a1 getIntegerForKey:@"SysDropBuildMode" defaultValue:0];
  if (!result)
  {
    if ((isInternalBuild() & 1) != 0 || ![a1 sysDropProfileInstalled])
    {
      unsigned int result = isInternalBuild();
      if (result)
      {
        unsigned int result = _os_feature_enabled_impl();
        if (result) {
          return [a1 sysDropEnabled];
        }
      }
    }
    else if (_os_feature_enabled_impl())
    {
      return 3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (BOOL)sysDropForceErrorEarlyEnabled
{
  return [a1 getBoolForKey:@"SysDropEarlyError" defaultValue:0] != 0;
}

+ (BOOL)sysDropForceErrorLateEnabled
{
  return [a1 getBoolForKey:@"SysDropLateError" defaultValue:0] != 0;
}

+ (BOOL)disableNeedsSetup
{
  return [a1 getBoolForKey:@"disableNeedsSetup" defaultValue:0] != 0;
}

+ (BOOL)forceFailiTunesAuth
{
  return [a1 getBoolForKey:@"ForceFailiTunes" defaultValue:0] != 0;
}

+ (BOOL)waitForAccessorySync
{
  return [a1 getBoolForKey:@"accessorySyncEnabled" defaultValue:0] != 0;
}

+ (BOOL)forceFailTCServerResponse
{
  return [a1 getBoolForKey:@"failTermsServer" defaultValue:0] != 0;
}

+ (BOOL)forceFailSetupLater
{
  return [a1 getBoolForKey:@"failSetupLate" defaultValue:0] != 0;
}

+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    a4 = [v7 integerForKey:v6];
  }

  return a4;
}

+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    [v7 doubleForKey:v6];
    a4 = v9;
  }

  return a4;
}

+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  v7 = [a1 sharedDefaults];
  v8 = [v7 objectForKey:v6];

  if (v8) {
    unsigned int v4 = [v7 BOOLForKey:v6];
  }

  return v4;
}

+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 sharedDefaults];
  [v7 setBool:v4 forKey:v6];
}

+ (BOOL)sysDropProfileInstalled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v3 = [v2 installedProfilesWithFilterFlags:3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        double v9 = v8;
        if (v8 && [v8 isEqualToString:@"com.apple.homedevicesetup.sysdrop"])
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end