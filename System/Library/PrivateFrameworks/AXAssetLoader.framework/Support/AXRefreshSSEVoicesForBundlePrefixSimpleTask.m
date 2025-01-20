@interface AXRefreshSSEVoicesForBundlePrefixSimpleTask
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXRefreshSSEVoicesForBundlePrefixSimpleTask

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withFirstUnlockType];
  v3 = +[AXSimpleAssetTaskTrigger withFirstBootType];
  v7[1] = v3;
  v4 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.SynthesisProvider.updatedVoices"];
  v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (void)run:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  v5 = [(AXSimpleAssetTaskBase *)self trigger];
  v6 = [v5 arguments];
  v7 = [v6 objectForKeyedSubscript:@"notifyArg"];

  v8 = AXLogAssetDaemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AXRefreshSSETask: Task did begin", (uint8_t *)&v15, 2u);
  }

  v9 = AXLogAssetDaemon();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v10)
    {
      int v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AXRefreshSSETask: Will purge and reload bundle hash %@", (uint8_t *)&v15, 0xCu);
    }

    v11 = +[TTSSynthesisProviderVoiceManager sharedInstance];
    [v11 reloadVoicesForBundleIdentifierHash:v7];
  }
  else
  {
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AXRefreshSSETask: Will purge and reload all components for TTSSynthesisProviderVoiceManager", (uint8_t *)&v15, 2u);
    }

    v11 = +[TTSSynthesisProviderVoiceManager sharedInstance];
    [v11 purgeAndReloadAllComponents];
  }

  v12 = +[AXAssetMetadataStore store];
  v13 = +[NSDate date];
  [v12 setValue:v13 forKey:@"RefreshSSEVoicesForBundlePrefixTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  v14 = AXLogAssetDaemon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "AXRefreshSSETask: Task finishing", (uint8_t *)&v15, 2u);
  }

  v4[2](v4, 1);
}

@end