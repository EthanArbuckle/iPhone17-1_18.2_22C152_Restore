@interface CSSpeechModelTrainingXPCManager
- (void)registerXPCActivities;
@end

@implementation CSSpeechModelTrainingXPCManager

- (void)registerXPCActivities
{
  sub_10001165C("com.apple.siri.xpc_activity.speech-phonetic-match-building", XPC_ACTIVITY_CHECK_IN, &stru_10024E468, &stru_10024E488);
  sub_10001165C("com.apple.siri.xpc_activity.speech-uaap-lm", XPC_ACTIVITY_CHECK_IN, &stru_10024E4A8, &stru_10024E4C8);
  sub_10001165C("com.apple.siri.xpc_activity.speech-user-edit", XPC_ACTIVITY_CHECK_IN, &stru_10024E4E8, &stru_10024E508);
}

@end