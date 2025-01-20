@interface EDForceRecategorizationUpgradeStep
+ (BOOL)runWithConnection:(id)a3 error:(id *)a4;
+ (id)log;
@end

@implementation EDForceRecategorizationUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EDForceRecategorizationUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1) {
    dispatch_once(&log_onceToken_34, block);
  }
  v2 = (void *)log_log_34;

  return v2;
}

void __41__EDForceRecategorizationUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_34;
  log_log_34 = (uint64_t)v1;
}

+ (BOOL)runWithConnection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"message_global_data"];
  v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 setObject:v7 forKeyedSubscript:@"model_category"];

  v8 = [MEMORY[0x1E4F1CA98] null];
  [v6 setObject:v8 forKeyedSubscript:@"model_subcategory"];

  v9 = [MEMORY[0x1E4F1CA98] null];
  [v6 setObject:v9 forKeyedSubscript:@"category_model_version"];

  v10 = [MEMORY[0x1E4F1CA98] null];
  [v6 setObject:v10 forKeyedSubscript:@"model_analytics"];

  [v6 setObject:&unk_1F35BAC10 forKeyedSubscript:@"model_high_impact"];
  LOBYTE(a4) = [v5 executeUpdateStatement:v6 error:a4];

  return (char)a4;
}

@end