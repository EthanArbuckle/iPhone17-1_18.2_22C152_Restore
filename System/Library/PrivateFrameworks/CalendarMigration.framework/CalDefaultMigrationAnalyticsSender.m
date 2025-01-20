@interface CalDefaultMigrationAnalyticsSender
+ (id)sharedInstance;
- (void)sendEvent:(id)a3 withPayload:(id)a4;
@end

@implementation CalDefaultMigrationAnalyticsSender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __52__CalDefaultMigrationAnalyticsSender_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
}

@end