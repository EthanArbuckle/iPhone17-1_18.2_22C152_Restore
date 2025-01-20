@interface CPAnalyticsCoreAnalyticsHelper
+ (BOOL)isValidCoreAnalyticsValueType:(id)a3;
+ (id)buildCACompatiblePayload:(id)a3;
+ (id)caCompatiblePayloadKey:(id)a3;
+ (void)analyticsSendEventLazy:(id)a3 payload:(id)a4;
+ (void)sendCoreAnalyticsEvent:(id)a3 withPayload:(id)a4 shouldSanitize:(BOOL)a5;
@end

@implementation CPAnalyticsCoreAnalyticsHelper

+ (id)buildCACompatiblePayload:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__CPAnalyticsCoreAnalyticsHelper_buildCACompatiblePayload___block_invoke;
  v9[3] = &unk_26423C7B0;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __59__CPAnalyticsCoreAnalyticsHelper_buildCACompatiblePayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 40) isValidCoreAnalyticsValueType:v6])
  {
    id v7 = +[CPAnalyticsCoreAnalyticsHelper caCompatiblePayloadKey:v5];
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
  else
  {
    v8 = CPAnalyticsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543618;
      uint64_t v10 = objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_215355000, v8, OS_LOG_TYPE_INFO, "[CPAnalyticsCoreAnalyticsHelper] Dropping payload with unsupported value class:%{public}@, key:%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

+ (BOOL)isValidCoreAnalyticsValueType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)caCompatiblePayloadKey:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 alphanumericCharacterSet];
  id v6 = [v5 invertedSet];

  id v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  v8 = [v7 componentsJoinedByString:@"_"];

  return v8;
}

+ (void)analyticsSendEventLazy:(id)a3 payload:(id)a4
{
}

+ (void)sendCoreAnalyticsEvent:(id)a3 withPayload:(id)a4 shouldSanitize:(BOOL)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__CPAnalyticsCoreAnalyticsHelper_sendCoreAnalyticsEvent_withPayload_shouldSanitize___block_invoke;
  v10[3] = &unk_26423C788;
  BOOL v13 = a5;
  id v11 = v8;
  id v12 = a1;
  id v9 = v8;
  [a1 analyticsSendEventLazy:a3 payload:v10];
}

id __84__CPAnalyticsCoreAnalyticsHelper_sendCoreAnalyticsEvent_withPayload_shouldSanitize___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v1 = [*(id *)(a1 + 40) buildCACompatiblePayload:*(void *)(a1 + 32)];
  }
  else
  {
    id v1 = *(id *)(a1 + 32);
  }
  return v1;
}

@end