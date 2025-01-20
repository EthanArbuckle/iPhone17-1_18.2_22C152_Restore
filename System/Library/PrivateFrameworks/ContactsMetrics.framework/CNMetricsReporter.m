@interface CNMetricsReporter
+ (id)log;
+ (void)logDatabaseResolution:(id)a3;
+ (void)sendDictionary:(id)a3 forEvent:(id)a4;
+ (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5;
- (id)compoundKeyForEvent:(id)a3;
- (id)eventKeyPrefix;
- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5;
- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5;
@end

@implementation CNMetricsReporter

- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(CNMetricsReporter *)self compoundKeyForEvent:v9];
  id v11 = v8;
  AnalyticsSendEventLazy();

  if (v5)
  {
    v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1DC767000, v12, OS_LOG_TYPE_INFO, "CNMetrics Collected for %@ (%@)", buf, 0x16u);
    }
  }
}

- (id)compoundKeyForEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNMetricsReporter *)self eventKeyPrefix];
  v6 = [v5 stringByAppendingString:v4];

  return v6;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_0);
  }
  v2 = (void *)log_cn_once_object_1;

  return v2;
}

uint64_t __24__CNMetricsReporter_log__block_invoke()
{
  log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "metrics-reporter");

  return MEMORY[0x1F41817F8]();
}

+ (void)sendDictionary:(id)a3 forEvent:(id)a4
{
}

+ (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 sendDictionary:v9 forEvent:v8 andLog:v5];
}

id __52__CNMetricsReporter_sendDictionary_forEvent_andLog___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5
{
  BOOL v5 = a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v14 = @"application";
  v15[0] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  v13 = (void *)[v11 initWithDictionary:v12];
  [(CNMetricsReporter *)self sendDictionary:v13 forEvent:v10 andLog:v5];
}

- (id)eventKeyPrefix
{
  return &stru_1F37C90A0;
}

+ (void)logDatabaseResolution:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v9 = @"resolution";
  v10[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v8 = (void *)[v6 initWithDictionary:v7];
  [a1 sendDictionary:v8 forEvent:@"com.apple.contacts.databaseIntegrity"];
}

@end