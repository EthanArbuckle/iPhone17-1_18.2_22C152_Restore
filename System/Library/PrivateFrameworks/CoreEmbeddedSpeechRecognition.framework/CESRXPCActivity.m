@interface CESRXPCActivity
- (void)registerDailyANECompilationActivity;
- (void)registerDailySubscriptionCleanupActivity;
- (void)registerPostUpgradeANECompilationActivity;
- (void)registerPostUpgradeSubscriptionActivity;
- (void)registerXPCActivities;
@end

@implementation CESRXPCActivity

- (void)registerDailyANECompilationActivity
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerDailyANECompilationActivity]";
      _os_log_debug_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    _RegisterXPCActivity("com.apple.siri.xpc_activity.daily-speech-ane-compilation", (void *)*MEMORY[0x1E4F14158], &__block_literal_global_302, &__block_literal_global_304);
  }
}

- (void)registerPostUpgradeANECompilationActivity
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerPostUpgradeANECompilationActivity]";
      _os_log_debug_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    _RegisterXPCActivity("com.apple.siri.xpc_activity.post-upgrade-speech-ane-compilation", (void *)*MEMORY[0x1E4F14158], &__block_literal_global_293_1089, &__block_literal_global_295);
  }
}

- (void)registerDailySubscriptionCleanupActivity
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerDailySubscriptionCleanupActivity]";
    _os_log_debug_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily Subscription Cleanup XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  _RegisterXPCActivity("com.apple.siri.xpc_activity.daily-subscription-cleanup", (void *)*MEMORY[0x1E4F14158], &__block_literal_global_288, &__block_literal_global_290);
}

- (void)registerPostUpgradeSubscriptionActivity
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerPostUpgradeSubscriptionActivity]";
    _os_log_debug_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade Subscription XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  _RegisterXPCActivity("com.apple.siri.xpc_activity.post-upgrade-subscriptions", (void *)*MEMORY[0x1E4F14158], &__block_literal_global_1095, &__block_literal_global_277);
}

- (void)registerXPCActivities
{
  [(CESRXPCActivity *)self registerPostUpgradeSubscriptionActivity];
  [(CESRXPCActivity *)self registerDailySubscriptionCleanupActivity];
  [(CESRXPCActivity *)self registerPostUpgradeANECompilationActivity];

  [(CESRXPCActivity *)self registerDailyANECompilationActivity];
}

@end