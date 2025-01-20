@interface RPStringUtility
+ (BOOL)isInvalidBundleId:(id)a3;
+ (id)numberFromString:(id)a3;
+ (unint64_t)rotatingDeviceUniqueID;
+ (void)rotatingDeviceUniqueID;
@end

@implementation RPStringUtility

+ (id)numberFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08A30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v5 numberFromString:v4];

  return v6;
}

+ (unint64_t)rotatingDeviceUniqueID
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"kSCDeviceUniqueID"];
    if (!v4)
    {
      id v5 = [MEMORY[0x263F08C38] UUID];
      id v4 = [v5 UUIDString];

      [v3 setObject:v4 forKey:@"kSCDeviceUniqueID"];
      [v3 synchronize];
    }
    v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    v7 = [MEMORY[0x263EFF910] date];
    v8 = [v6 components:8196 fromDate:v7];

    uint64_t v9 = [v8 weekOfYear];
    uint64_t v10 = [v8 yearForWeekOfYear];
    v11 = [NSString stringWithFormat:@"%@%lu%lu", v4, v10, v9];
    unint64_t v12 = [v11 hash];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPStringUtility rotatingDeviceUniqueID]();
    }
    unint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)isInvalidBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && [v3 caseInsensitiveCompare:@"(null)"]
    && [v3 caseInsensitiveCompare:@"Unknown"])
  {
    BOOL v4 = 0;
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPStringUtility isInvalidBundleId:]((uint64_t)v3);
    }
    BOOL v4 = 1;
  }

  return v4;
}

+ (void)rotatingDeviceUniqueID
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v0 = 136446466;
  v1 = "+[RPStringUtility rotatingDeviceUniqueID]";
  __int16 v2 = 1024;
  int v3 = 33;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Could not get NSUserDefaults shared defaults object", (uint8_t *)&v0, 0x12u);
}

+ (void)isInvalidBundleId:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136446722;
  __int16 v2 = "+[RPStringUtility isInvalidBundleId:]";
  __int16 v3 = 1024;
  int v4 = 54;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d bundleID=%@ is invalid", (uint8_t *)&v1, 0x1Cu);
}

@end