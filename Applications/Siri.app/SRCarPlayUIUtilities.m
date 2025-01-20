@interface SRCarPlayUIUtilities
+ (BOOL)deviceSupportsAI;
+ (BOOL)flexibleFollowupEnabled;
+ (BOOL)isJarvis;
+ (double)flexibleFollowupAdditonalDelay;
@end

@implementation SRCarPlayUIUtilities

+ (BOOL)deviceSupportsAI
{
  return +[AFSystemAssistantExperienceStatusManager isSAEEnabled];
}

+ (BOOL)flexibleFollowupEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

+ (double)flexibleFollowupAdditonalDelay
{
  int v2 = +[AFPreferences sharedPreferences];
  [v2 autoDismissalIdleTimeout];
  double v4 = v3;

  return v4;
}

+ (BOOL)isJarvis
{
  int v2 = +[AVSystemController sharedAVSystemController];
  double v3 = [v2 attributeForKey:AVSystemController_CarPlayAuxStreamSupportAttribute];
  double v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end