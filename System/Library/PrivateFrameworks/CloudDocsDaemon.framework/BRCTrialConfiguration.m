@interface BRCTrialConfiguration
+ (id)defaultConfiguration;
- (BOOL)BOOLForFactor:(id)a3 client:(id)a4 namespace:(id)a5 byDefault:(BOOL)a6;
- (BOOL)enabledForFPFSMigration;
- (BRCTrialConfiguration)init;
- (NSString)factorPackId;
- (NSString)rampId;
- (NSString)rolloutId;
- (int64_t)longLongForFactor:(id)a3 client:(id)a4 namespace:(id)a5 min:(int64_t)a6 max:(int64_t)a7 byDefault:(int64_t)a8;
- (void)refresh;
@end

@implementation BRCTrialConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)defaultConfiguration_defaultConfiguration;
  return v2;
}

void __45__BRCTrialConfiguration_defaultConfiguration__block_invoke()
{
  v0 = objc_alloc_init(BRCTrialConfiguration);
  v1 = (void *)defaultConfiguration_defaultConfiguration;
  defaultConfiguration_defaultConfiguration = (uint64_t)v0;
}

- (BRCTrialConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)BRCTrialConfiguration;
  v2 = [(BRCTrialConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BRCTrialConfiguration *)v2 refresh];
  }
  return v3;
}

- (void)refresh
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed loading trial client%@", v1, 0xCu);
}

- (int64_t)longLongForFactor:(id)a3 client:(id)a4 namespace:(id)a5 min:(int64_t)a6 max:(int64_t)a7 byDefault:(int64_t)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a6 >= a7)
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:]();
    }
  }
  if (a6 > a8)
  {
    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:]();
    }
  }
  if (a8 > a7)
  {
    v27 = brc_bread_crumbs();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCTrialConfiguration longLongForFactor:client:namespace:min:max:byDefault:]();
    }
  }
  v16 = [v14 levelForFactor:v13 withNamespaceName:v15];
  v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 longValue];
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138412802;
      id v30 = v13;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      v34 = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Trial config for %@: %lld%@", (uint8_t *)&v29, 0x20u);
    }

    if (v18 <= a7 && v18 >= a6) {
      a8 = v18;
    }
  }

  return a8;
}

- (BOOL)BOOLForFactor:(id)a3 client:(id)a4 namespace:(id)a5 byDefault:(BOOL)a6
{
  LOBYTE(v6) = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [a4 levelForFactor:v9 withNamespaceName:a5];
  v11 = v10;
  if (v10)
  {
    int v6 = [v10 BOOLeanValue];
    v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 1024;
      int v18 = v6;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Trial config for %@: %d%@", (uint8_t *)&v15, 0x1Cu);
    }
  }
  return v6;
}

- (NSString)factorPackId
{
  return self->factorPackId;
}

- (NSString)rolloutId
{
  return self->rolloutId;
}

- (NSString)rampId
{
  return self->rampId;
}

- (BOOL)enabledForFPFSMigration
{
  return self->enabledForFPFSMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rampId, 0);
  objc_storeStrong((id *)&self->rolloutId, 0);
  objc_storeStrong((id *)&self->factorPackId, 0);
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: def <= max%@", v2, v3, v4, v5, v6);
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: min <= def%@", v2, v3, v4, v5, v6);
}

- (void)longLongForFactor:client:namespace:min:max:byDefault:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: min < max%@", v2, v3, v4, v5, v6);
}

@end