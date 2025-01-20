@interface AFSystemAssistantExperienceStatusManager
+ (BOOL)isSAEEnabled;
+ (id)sharedManager;
- (BOOL)saeEnabled;
- (void)fetchGenerativeModelsAvailability;
- (void)setSaeEnabled:(BOOL)a3;
@end

@implementation AFSystemAssistantExperienceStatusManager

- (void)setSaeEnabled:(BOOL)a3
{
  self->_saeEnabled = a3;
}

- (BOOL)saeEnabled
{
  return self->_saeEnabled;
}

- (void)fetchGenerativeModelsAvailability
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[AFFeatureFlags isSystemAssistantExperienceEnabled];
  uint64_t v4 = v3 & AFDeviceSupportsSAE();
  [(AFSystemAssistantExperienceStatusManager *)self setSaeEnabled:v4];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[AFSystemAssistantExperienceStatusManager fetchGenerativeModelsAvailability]";
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEFAULT, "%s #SAEStatus:%d", (uint8_t *)&v6, 0x12u);
  }
}

+ (BOOL)isSAEEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[AFSystemAssistantExperienceStatusManager sharedManager];
  int v3 = [v2 saeEnabled];

  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[AFSystemAssistantExperienceStatusManager isSAEEnabled]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEFAULT, "%s #SAEStatus from cache:%d", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_32529 != -1) {
    dispatch_once(&sharedManager_onceToken_32529, &__block_literal_global_32530);
  }
  v2 = (void *)sharedManager_result_32531;
  return v2;
}

void __57__AFSystemAssistantExperienceStatusManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_result_32531;
  sharedManager_result_32531 = v0;

  [(id)sharedManager_result_32531 fetchGenerativeModelsAvailability];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  int v3 = (const void *)sharedManager_result_32531;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)HandleGenerativeModelsAvailabilityDidChange, @"com.apple.gms.availability.notification", 0, (CFNotificationSuspensionBehavior)0);
}

@end