@interface FBKSSharedConstants
+ (NSString)overrideGeoCountryCode;
+ (NSUserDefaults)sharedUserDefaults;
+ (id)appleSeedURL;
+ (id)appleSeedURLFromDefaults:(id)a3 withEnvironment:(signed __int16)a4;
+ (id)productVersion;
+ (id)swTrain;
+ (id)swVers;
+ (int64_t)platform;
+ (signed)environment;
+ (void)_deriveSystemVersion;
+ (void)initialize;
+ (void)overrideEnvironment:(signed __int16)a3 host:(id)a4;
@end

@implementation FBKSSharedConstants

+ (void)initialize
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 addSuiteNamed:@"group.com.apple.feedback"];

  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:@"production" forKey:@"environment"];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 registerDefaults:v4];
}

+ (id)appleSeedURLFromDefaults:(id)a3 withEnvironment:(signed __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  if ((v4 - 1) > 3)
  {
    v6 = @"https://fba.apple.com/";
  }
  else
  {
    if (FBKSHasInternalUI() && [(id)_overrideHostString length])
    {
      v6 = (__CFString *)(id)_overrideHostString;
    }
    else
    {
      v7 = +[FBKSSharedConstants sharedUserDefaults];
      v6 = [v7 stringForKey:@"developmentHost"];
    }
    v8 = FBKSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[FBKSSharedConstants appleSeedURLFromDefaults:withEnvironment:]((uint64_t)v6, v8);
    }
  }
  v9 = [NSURL URLWithString:v6];
  v10 = v9;
  if (!v9 || ([v9 host], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    uint64_t v12 = [NSURL URLWithString:@"https://fba.apple.com/"];

    v10 = (void *)v12;
  }

  return v10;
}

+ (id)appleSeedURL
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = objc_msgSend(a1, "appleSeedURLFromDefaults:withEnvironment:", v3, objc_msgSend(a1, "environment"));

  return v4;
}

+ (signed)environment
{
  signed __int16 v2 = _cachedEnvironment;
  if (_cachedEnvironment < 0)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v4 = [v3 stringForKey:@"environment"];

    _cachedEnvironment = FBKSEnvironmentFromString(v4);
    return _cachedEnvironment;
  }
  return v2;
}

+ (void)overrideEnvironment:(signed __int16)a3 host:(id)a4
{
  int v5 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  _cachedEnvironment = v5;
  objc_storeStrong((id *)&_overrideHostString, a4);
  v7 = FBKSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446978;
    v9 = "+[FBKSSharedConstants overrideEnvironment:host:]";
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 1024;
    int v13 = _cachedEnvironment;
    __int16 v14 = 2114;
    uint64_t v15 = _overrideHostString;
    _os_log_impl(&dword_24DF86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %hd -> [%hd] [%{public}@]", (uint8_t *)&v8, 0x22u);
  }
}

+ (NSString)overrideGeoCountryCode
{
  if (overrideGeoCountryCode_onceToken != -1) {
    dispatch_once(&overrideGeoCountryCode_onceToken, &__block_literal_global_67);
  }
  signed __int16 v2 = (void *)overrideGeoCountryCode_overrideValue;
  return (NSString *)v2;
}

void __45__FBKSSharedConstants_overrideGeoCountryCode__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (FBKSIsInternalInstall_onceToken != -1) {
    dispatch_once(&FBKSIsInternalInstall_onceToken, &__block_literal_global);
  }
  if (FBKSIsInternalInstall__isInternal)
  {
    v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v1 = [v0 stringForKey:@"geoOverride"];
    uint64_t v2 = [v1 uppercaseString];
    v3 = (void *)overrideGeoCountryCode_overrideValue;
    overrideGeoCountryCode_overrideValue = v2;

    if (overrideGeoCountryCode_overrideValue)
    {
      int v4 = FBKSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138543362;
        uint64_t v6 = overrideGeoCountryCode_overrideValue;
        _os_log_impl(&dword_24DF86000, v4, OS_LOG_TYPE_DEFAULT, "Using geo override: %{public}@", (uint8_t *)&v5, 0xCu);
      }
    }
  }
}

+ (NSUserDefaults)sharedUserDefaults
{
  if (sharedUserDefaults_onceToken != -1) {
    dispatch_once(&sharedUserDefaults_onceToken, &__block_literal_global_69);
  }
  uint64_t v2 = (void *)sharedUserDefaults_userDefaults;
  return (NSUserDefaults *)v2;
}

uint64_t __41__FBKSSharedConstants_sharedUserDefaults__block_invoke()
{
  sharedUserDefaults_userDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"group.com.apple.feedback"];
  return MEMORY[0x270F9A758]();
}

+ (void)_deriveSystemVersion
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24DF86000, log, OS_LOG_TYPE_ERROR, "**** ERROR **** Can't get version dictionary", v1, 2u);
}

+ (id)swVers
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 valueForKey:@"BuildOverride"];

  if (!v4 || (uint64_t v5 = [v4 length], v6 = v4, !v5))
  {
    uint64_t v6 = (void *)_swVers;
    if (!_swVers)
    {
      [a1 _deriveSystemVersion];
      uint64_t v6 = (void *)_swVers;
    }
  }
  id v7 = v6;

  return v7;
}

+ (id)swTrain
{
  uint64_t v2 = (void *)_swTrain;
  if (!_swTrain)
  {
    [a1 _deriveSystemVersion];
    uint64_t v2 = (void *)_swTrain;
  }
  id v3 = v2;
  return v3;
}

+ (id)productVersion
{
  uint64_t v2 = (void *)_productVersion;
  if (!_productVersion)
  {
    [a1 _deriveSystemVersion];
    uint64_t v2 = (void *)_productVersion;
  }
  id v3 = v2;
  return v3;
}

+ (int64_t)platform
{
  return 1;
}

+ (void)appleSeedURLFromDefaults:(uint64_t)a1 withEnvironment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24DF86000, a2, OS_LOG_TYPE_DEBUG, "Using non-production server: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end