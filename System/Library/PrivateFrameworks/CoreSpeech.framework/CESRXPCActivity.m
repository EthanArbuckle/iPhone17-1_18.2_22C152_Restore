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
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerDailyANECompilationActivity]";
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    sub_100032F38("com.apple.siri.xpc_activity.daily-speech-ane-compilation", XPC_ACTIVITY_CHECK_IN, &stru_10024ECE0, &stru_10024ED00);
  }
}

- (void)registerPostUpgradeANECompilationActivity
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier() >= 10)
  {
    v2 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 136315138;
      v4 = "-[CESRXPCActivity registerPostUpgradeANECompilationActivity]";
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade ANE Compilation XPC Activity", (uint8_t *)&v3, 0xCu);
    }
    sub_100032F38("com.apple.siri.xpc_activity.post-upgrade-speech-ane-compilation", XPC_ACTIVITY_CHECK_IN, &stru_10024EC80, &stru_10024ECA0);
  }
}

- (void)registerDailySubscriptionCleanupActivity
{
  v2 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerDailySubscriptionCleanupActivity]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the daily Subscription Cleanup XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  sub_100032F38("com.apple.siri.xpc_activity.daily-subscription-cleanup", XPC_ACTIVITY_CHECK_IN, &stru_10024EC40, &stru_10024EC60);
}

- (void)registerPostUpgradeSubscriptionActivity
{
  v2 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    v4 = "-[CESRXPCActivity registerPostUpgradeSubscriptionActivity]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s On-Device ASR: XPC: Registering the post-upgrade Subscription XPC Activity", (uint8_t *)&v3, 0xCu);
  }
  sub_100032F38("com.apple.siri.xpc_activity.post-upgrade-subscriptions", XPC_ACTIVITY_CHECK_IN, &stru_10024EC00, &stru_10024EC20);
}

- (void)registerXPCActivities
{
  [(CESRXPCActivity *)self registerPostUpgradeSubscriptionActivity];
  [(CESRXPCActivity *)self registerDailySubscriptionCleanupActivity];
  [(CESRXPCActivity *)self registerPostUpgradeANECompilationActivity];
  [(CESRXPCActivity *)self registerDailyANECompilationActivity];
}

@end