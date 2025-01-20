@interface COFeatureStatus
+ (BOOL)isCOClusterEnabled;
+ (BOOL)isCoordinationEnabled;
+ (BOOL)isDistributedTimersEnabled;
+ (BOOL)isDistributedTimersForHH1Enabled;
+ (BOOL)isFastFoldEnabled;
+ (BOOL)isGlobalMessagingEnabled;
+ (BOOL)isGlobalTimersEnabled;
+ (BOOL)isHomeKitUsingAlarmsAndTimersIDSService;
+ (BOOL)isIPDiscoveryDiffingEnabled;
+ (BOOL)isNoDaemonMessageChannelEnabled;
+ (BOOL)isOpalEnabled;
+ (BOOL)isSharedCompanionLinkClientEnabled;
+ (BOOL)isSlimBallotsEnabled;
@end

@implementation COFeatureStatus

+ (BOOL)isCoordinationEnabled
{
  return 1;
}

+ (BOOL)isCOClusterEnabled
{
  return 1;
}

+ (BOOL)isGlobalMessagingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSharedCompanionLinkClientEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isGlobalTimersEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSlimBallotsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOpalEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFastFoldEnabled
{
  if (isFastFoldEnabled_onceToken != -1) {
    dispatch_once(&isFastFoldEnabled_onceToken, &__block_literal_global_7);
  }
  return isFastFoldEnabled_enabled;
}

void __36__COFeatureStatus_isFastFoldEnabled__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  isFastFoldEnabled_enabled = _os_feature_enabled_impl();
  v0 = +[CODefaults coordinationBundleID];
  v1 = +[CODefaults userDefaultsForIdentifer:v0];

  v2 = [v1 objectForKey:@"fastFold"];
  v3 = v2;
  if (v2)
  {
    if (isFastFoldEnabled_enabled) {
      char v4 = [v2 BOOLValue];
    }
    else {
      char v4 = 0;
    }
    isFastFoldEnabled_enabled = v4;
    v5 = COLogForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109632;
      int v10 = isFastFoldEnabled_enabled;
      __int16 v11 = 1024;
      int v12 = _os_feature_enabled_impl();
      __int16 v13 = 1024;
      int v14 = [v3 BOOLValue];
      v6 = "Fast fold feature status = %d. FF = %d, defaults = %d";
      v7 = v5;
      uint32_t v8 = 20;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = COLogForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109376;
      int v10 = isFastFoldEnabled_enabled;
      __int16 v11 = 1024;
      int v12 = _os_feature_enabled_impl();
      v6 = "Fast fold feature status = %d. FF = %d";
      v7 = v5;
      uint32_t v8 = 14;
LABEL_9:
      _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
}

+ (BOOL)isIPDiscoveryDiffingEnabled
{
  if (isIPDiscoveryDiffingEnabled_onceToken != -1) {
    dispatch_once(&isIPDiscoveryDiffingEnabled_onceToken, &__block_literal_global_10);
  }
  return isIPDiscoveryDiffingEnabled_enabled;
}

void __46__COFeatureStatus_isIPDiscoveryDiffingEnabled__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  isIPDiscoveryDiffingEnabled_enabled = _os_feature_enabled_impl();
  v0 = +[CODefaults coordinationBundleID];
  v1 = +[CODefaults userDefaultsForIdentifer:v0];

  v2 = [v1 objectForKey:@"ipDiffing"];
  v3 = v2;
  if (v2)
  {
    if (isIPDiscoveryDiffingEnabled_enabled) {
      char v4 = [v2 BOOLValue];
    }
    else {
      char v4 = 0;
    }
    isIPDiscoveryDiffingEnabled_enabled = v4;
    v5 = COLogForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109632;
      int v10 = isIPDiscoveryDiffingEnabled_enabled;
      __int16 v11 = 1024;
      int v12 = _os_feature_enabled_impl();
      __int16 v13 = 1024;
      int v14 = [v3 BOOLValue];
      v6 = "IP Diffing feature status = %d. FF = %d, defaults = %d";
      v7 = v5;
      uint32_t v8 = 20;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = COLogForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109376;
      int v10 = isIPDiscoveryDiffingEnabled_enabled;
      __int16 v11 = 1024;
      int v12 = _os_feature_enabled_impl();
      v6 = "IP Diffing feature status = %d. FF = %d";
      v7 = v5;
      uint32_t v8 = 14;
LABEL_9:
      _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
}

+ (BOOL)isNoDaemonMessageChannelEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isHomeKitUsingAlarmsAndTimersIDSService
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDistributedTimersEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDistributedTimersForHH1Enabled
{
  int v2 = +[COFeatureStatus isDistributedTimersEnabled];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

@end