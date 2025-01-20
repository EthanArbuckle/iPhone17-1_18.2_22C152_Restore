@interface AWClientPreferences
+ (void)initialize;
@end

@implementation AWClientPreferences

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  v3 = @"LogLevel";
  id v4 = &__block_literal_global_294;
  if (registerForPrefsChange_onceToken != -1) {
    dispatch_once(&registerForPrefsChange_onceToken, &__block_literal_global_277);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __registerForPrefsChange_block_invoke_284;
  v13[3] = &unk_1E606A2B0;
  id v14 = &__block_literal_global_294;
  uint64_t v15 = v2;
  id v5 = &__block_literal_global_294;
  v6 = (void *)MEMORY[0x1B3EC18C0](v13);
  v7 = registerForPrefsChange_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __registerForPrefsChange_block_invoke_2_287;
  v10[3] = &unk_1E606ABB0;
  v11 = @"LogLevel";
  id v12 = v6;
  id v8 = v6;
  v9 = @"LogLevel";
  dispatch_sync(v7, v10);
}

uint64_t __33__AWClientPreferences_initialize__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t result = [a2 intValue];
  }
  else {
    uint64_t result = 5;
  }
  currentLogLevel = result;
  return result;
}

@end