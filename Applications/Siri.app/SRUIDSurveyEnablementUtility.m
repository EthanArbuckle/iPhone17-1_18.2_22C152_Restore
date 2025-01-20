@interface SRUIDSurveyEnablementUtility
+ (BOOL)isSurveyEnabled;
+ (BOOL)meetsThresholdForPresenting;
+ (BOOL)minimumTimeBetweenLastReportHasElapsed;
+ (BOOL)shouldAllowSurveyByDefault;
+ (BOOL)shouldEnableCoreAnalyticEvent;
+ (id)_dateOfLastReport;
+ (id)enableCoreAnalyticEventKey;
+ (id)internalSurveyEnabledKey;
+ (id)lastSurveyReportKey;
+ (id)surveySampleRateKey;
+ (id)userDefaults;
+ (unsigned)_sampleRate;
+ (void)disableInternalUIDSurveyNotifications;
+ (void)recordDateOfSurveyInteraction;
@end

@implementation SRUIDSurveyEnablementUtility

+ (id)userDefaults
{
  if (qword_100171E08 != -1) {
    dispatch_once(&qword_100171E08, &stru_100143520);
  }
  v2 = (void *)qword_100171E00;

  return v2;
}

+ (BOOL)shouldAllowSurveyByDefault
{
  return 0;
}

+ (BOOL)shouldEnableCoreAnalyticEvent
{
  v3 = [a1 userDefaults];
  v4 = [a1 enableCoreAnalyticEventKey];
  v5 = [v3 objectForKey:v4];

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (BOOL)isSurveyEnabled
{
  v3 = [a1 userDefaults];
  v4 = [a1 internalSurveyEnabledKey];
  v5 = [v3 objectForKey:v4];

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v6 = [a1 shouldAllowSurveyByDefault];
  }
  BOOL v7 = v6;

  return v7;
}

+ (void)disableInternalUIDSurveyNotifications
{
  id v4 = [a1 userDefaults];
  v3 = [a1 internalSurveyEnabledKey];
  [v4 setObject:&__kCFBooleanFalse forKey:v3];
}

+ (void)recordDateOfSurveyInteraction
{
  id v5 = [a1 userDefaults];
  v3 = +[NSDate date];
  id v4 = [a1 lastSurveyReportKey];
  [v5 setObject:v3 forKey:v4];
}

+ (id)internalSurveyEnabledKey
{
  return @"allowInternalUIDSurvey";
}

+ (id)surveySampleRateKey
{
  return @"internalUIDSurveySampleRate";
}

+ (id)lastSurveyReportKey
{
  return @"lastSurveyReport";
}

+ (id)enableCoreAnalyticEventKey
{
  return @"enableCoreAnalyticsEvent";
}

+ (BOOL)meetsThresholdForPresenting
{
  if (arc4random_uniform((uint32_t)[a1 _sampleRate])) {
    return 0;
  }

  return _[a1 minimumTimeBetweenLastReportHasElapsed];
}

+ (BOOL)minimumTimeBetweenLastReportHasElapsed
{
  v2 = [a1 _dateOfLastReport];
  v3 = [v2 dateByAddingTimeInterval:2419200.0];
  if (v2)
  {
    id v4 = +[NSDate date];
    BOOL v5 = [v4 compare:v3] == (id)1;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

+ (id)_dateOfLastReport
{
  v3 = [a1 userDefaults];
  id v4 = [a1 lastSurveyReportKey];
  BOOL v5 = [v3 objectForKey:v4];

  return v5;
}

+ (unsigned)_sampleRate
{
  v3 = [a1 userDefaults];
  id v4 = [a1 surveySampleRateKey];
  BOOL v5 = [v3 objectForKey:v4];

  if (v5) {
    unsigned int v6 = [v5 intValue];
  }
  else {
    unsigned int v6 = 10;
  }

  return v6;
}

@end