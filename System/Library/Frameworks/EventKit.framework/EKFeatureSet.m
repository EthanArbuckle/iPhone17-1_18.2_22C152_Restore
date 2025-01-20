@interface EKFeatureSet
+ (BOOL)areApplicationBadgesSupported;
+ (BOOL)areContextualRemindersSupported;
+ (BOOL)areQuickActionsSupported;
+ (BOOL)areVehicleTriggersEnabled;
+ (BOOL)automaticGeocodingEnabled;
+ (BOOL)eventsFoundInAppsEnabled;
+ (BOOL)isConservativeEntryEnabled;
+ (BOOL)isContinuitySupported;
+ (BOOL)isSuggestionsEnabled;
+ (BOOL)isTravelAdvisorySupported;
+ (BOOL)mustDisplaySplashScreenToUser;
+ (unint64_t)_currentSplashScreenVersion;
+ (void)userAcknowledgedSplashScreen;
@end

@implementation EKFeatureSet

+ (BOOL)mustDisplaySplashScreenToUser
{
  v3 = +[EKPreferences shared];
  char v4 = [v3 bypassSplashScreen];

  if (v4) {
    return 0;
  }
  v6 = +[EKPreferences shared];
  unint64_t v7 = [v6 lastConfirmedSplashScreenVersion];
  BOOL v5 = v7 < [a1 _currentSplashScreenVersion];

  return v5;
}

+ (unint64_t)_currentSplashScreenVersion
{
  return 5;
}

+ (BOOL)areApplicationBadgesSupported
{
  return 1;
}

+ (BOOL)isContinuitySupported
{
  return MGGetBoolAnswer();
}

+ (BOOL)isTravelAdvisorySupported
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)isConservativeEntryEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areVehicleTriggersEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areQuickActionsSupported
{
  return MGGetBoolAnswer();
}

+ (BOOL)isSuggestionsEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areContextualRemindersSupported
{
  return MGGetBoolAnswer() ^ 1;
}

+ (void)userAcknowledgedSplashScreen
{
  uint64_t v2 = [a1 _currentSplashScreenVersion];
  v3 = +[EKPreferences shared];
  [v3 setLastConfirmedSplashScreenVersion:v2];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"EKFeatureSetDidChangeNotification", 0, 0, 1u);
}

+ (BOOL)automaticGeocodingEnabled
{
  uint64_t v2 = objc_opt_new();
  BOOL v3 = (unint64_t)[v2 lastConfirmedSplashScreenVersion] > 2;

  return v3;
}

+ (BOOL)eventsFoundInAppsEnabled
{
  uint64_t v2 = objc_opt_new();
  BOOL v3 = (unint64_t)[v2 lastConfirmedSplashScreenVersion] > 3;

  return v3;
}

@end