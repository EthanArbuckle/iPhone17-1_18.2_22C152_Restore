@interface CSLPRFDeviceUtilities
+ (BOOL)activePairedWatchSupportsLiveActivities;
+ (BOOL)activePairedWatchSupportsMoonstoneActions;
+ (BOOL)isHermes;
+ (BOOL)isTinker:(id)a3;
+ (id)activeWatch;
+ (id)bridgeController;
+ (id)screenImageNameWithPrefix:(id)a3;
+ (int64_t)seriesForProductType:(id)a3;
@end

@implementation CSLPRFDeviceUtilities

+ (id)screenImageNameWithPrefix:(id)a3
{
  id v4 = a3;
  v5 = [a1 activeWatch];
  v6 = [v5 valueForProperty:*MEMORY[0x263F57628]];
  uint64_t v7 = [a1 seriesForProductType:v6];
  v8 = @"%@-Default";
  if (v7 == 4) {
    v8 = @"%@-S4_Default";
  }
  if (v7 == 3) {
    v9 = @"%@-S3_Default";
  }
  else {
    v9 = v8;
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v4);

  return v10;
}

+ (BOOL)isHermes
{
  v2 = [a1 activeWatch];
  v3 = [v2 valueForProperty:*MEMORY[0x263F57568]];
  BOOL v4 = [v3 intValue] == 1;

  return v4;
}

+ (BOOL)isTinker:(id)a3
{
  id v3 = a3;
  BOOL v4 = (id *)MEMORY[0x263F83300];
  if (objc_opt_respondsToSelector())
  {
    v5 = [*v4 bridgeController];
    char v6 = [v5 isTinkerPairing];
  }
  else
  {
    v5 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    char v6 = [v5 BOOLValue];
  }
  BOOL v7 = v6;

  return v7;
}

+ (int64_t)seriesForProductType:(id)a3
{
  *(void *)&v15[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v13 = 0;
  BOOL v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"Watch(\\d+)," options:1 error:&v13];
  id v5 = v13;
  char v6 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rangeAtIndex:1];
    v10 = objc_msgSend(v3, "substringWithRange:", v8, v9);
    int64_t v11 = [v10 integerValue];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240450;
      v15[0] = v11;
      LOWORD(v15[1]) = 2114;
      *(void *)((char *)&v15[1] + 2) = v3;
      _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, "Series %{public}d detected in %{public}@", buf, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v15 = v3;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not extract series information from %{public}@", buf, 0xCu);
    }
    int64_t v11 = 0;
  }

  return v11;
}

+ (id)bridgeController
{
  v2 = (id *)MEMORY[0x263F83300];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*v2 bridgeController];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, ">>>> no bridgeController", v5, 2u);
    }
    id v3 = 0;
  }
  return v3;
}

+ (BOOL)activePairedWatchSupportsMoonstoneActions
{
  v2 = [a1 activeWatch];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AB707200-CFE3-4419-8DF0-A17D17C8764D"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (BOOL)activePairedWatchSupportsLiveActivities
{
  v2 = [a1 activeWatch];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6B0579F9-ED84-4E5E-B753-83D35793F919"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

+ (id)activeWatch
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (id *)MEMORY[0x263F83300];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v6 = *v2;
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ doesn't provide to activeWatch", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_8;
  }
  id v3 = [*v2 activeWatch];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    id v4 = *v2;
    id v5 = [v3 pairingID];
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, "%@ UIApp provided device %@", (uint8_t *)&v11, 0x16u);
  }
  if (!v3)
  {
LABEL_8:
    BOOL v7 = [MEMORY[0x263F57730] sharedInstance];
    uint64_t v8 = [MEMORY[0x263F57730] activeDeviceSelectorBlock];
    uint64_t v9 = [v7 getAllDevicesWithArchivedAltAccountDevicesMatching:v8];
    id v3 = [v9 firstObject];
  }
  return v3;
}

@end