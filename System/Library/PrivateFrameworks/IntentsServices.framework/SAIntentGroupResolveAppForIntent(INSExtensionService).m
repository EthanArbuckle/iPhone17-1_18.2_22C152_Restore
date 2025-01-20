@interface SAIntentGroupResolveAppForIntent(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
- (void)ins_resolveAppForIntent:()INSExtensionService completionHandler:;
@end

@implementation SAIntentGroupResolveAppForIntent(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 625;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 624;
}

- (void)ins_resolveAppForIntent:()INSExtensionService completionHandler:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x263F0F810];
  v9 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "-[SAIntentGroupResolveAppForIntent(INSExtensionService) ins_resolveAppForIntent:completionHandler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_2163DF000, v9, OS_LOG_TYPE_INFO, "%s ins_resolveAppForIntent: %@", (uint8_t *)&v15, 0x16u);
  }
  v10 = [a1 appsList];
  v11 = [v10 valueForKey:@"appIdentifyingInfo"];
  v12 = [v11 valueForKey:@"bundleId"];

  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "-[SAIntentGroupResolveAppForIntent(INSExtensionService) ins_resolveAppForIntent:completionHandler:]";
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_2163DF000, v13, OS_LOG_TYPE_INFO, "%s appList = %@", (uint8_t *)&v15, 0x16u);
  }
  id v14 = objc_alloc_init(MEMORY[0x263F64A08]);
  [v14 setAppsList:v10];
  v7[2](v7, v14, 0);
}

@end