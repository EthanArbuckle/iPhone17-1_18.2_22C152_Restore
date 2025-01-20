@interface ATXABHelper
+ (id)abGroupForConsumerSubType:(unsigned __int8)a3;
+ (id)abGroupNilString;
+ (id)abGroupOverride;
+ (void)abGroupOverride;
@end

@implementation ATXABHelper

+ (id)abGroupNilString
{
  v2 = +[ATXAggregateKeys abGroupNilString];
  v3 = v2;
  if (!v2) {
    v2 = @"unknown";
  }
  v4 = v2;

  return v4;
}

+ (id)abGroupForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = (void *)MEMORY[0x1AD0D3C30](a1, a2);
  if (abGroupForConsumerSubType__onceToken != -1) {
    dispatch_once(&abGroupForConsumerSubType__onceToken, &__block_literal_global_39);
  }
  v5 = +[ATXABHelper abGroupOverride];
  if (v5) {
    goto LABEL_4;
  }
  id v15 = (id)abGroupForConsumerSubType__cache;
  objc_sync_enter(v15);
  v16 = (void *)abGroupForConsumerSubType__cache;
  v17 = [NSNumber numberWithUnsignedChar:v3];
  v18 = [v16 objectForKeyedSubscript:v17];

  objc_sync_exit(v15);
  if (!v18)
  {
LABEL_4:
    v6 = +[ATXAppPredictorAssetMapping sharedInstanceWithMobileAssets];
    v7 = [v6 getAssetFileAndSubscoreForConsumerSubType:v3];
    v8 = [v7 first];
    v9 = [ATXAssetsABHelper alloc];
    v10 = +[ATXABHelper abGroupOverride];
    v11 = [(ATXAssetsABHelper *)v9 initWithAssetsForResource:v8 ofType:@"plplist" specifiedABGroup:v10];

    v12 = [(ATXAssetsABHelper *)v11 groupIdentifier];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[ATXABHelper abGroupNilString];
    }
    v18 = v14;

    if (!v5)
    {
      id v19 = (id)abGroupForConsumerSubType__cache;
      objc_sync_enter(v19);
      v20 = (void *)abGroupForConsumerSubType__cache;
      v21 = [NSNumber numberWithUnsignedChar:v3];
      [v20 setObject:v18 forKeyedSubscript:v21];

      objc_sync_exit(v19);
    }
  }

  return v18;
}

uint64_t __41__ATXABHelper_abGroupForConsumerSubType___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = abGroupForConsumerSubType__cache;
  abGroupForConsumerSubType__cache = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)abGroupOverride
{
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    v4 = [v3 objectForKey:@"appPredictionABGroupOverride"];
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ATXABHelper abGroupOverride];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)abGroupOverride
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "Using A/B group override: %@", (uint8_t *)&v2, 0xCu);
}

@end