@interface EKUIAccountErrorsAnalyticsTracker
+ (void)_trackErrorShown:(unint64_t)a3;
+ (void)trackCalendarListDisplayedActionableError;
+ (void)trackCalendarListDisplayedOfflineError;
+ (void)trackCalendarListDisplayedOtherError;
+ (void)trackCalendarListDisplayedUnknownError;
+ (void)trackCalendarListInteractedWithError;
+ (void)trackRootUIDisplayedError;
+ (void)trackRootUIInteractedWithError;
@end

@implementation EKUIAccountErrorsAnalyticsTracker

+ (void)trackRootUIDisplayedError
{
}

+ (void)trackRootUIInteractedWithError
{
}

+ (void)trackCalendarListDisplayedActionableError
{
}

+ (void)trackCalendarListDisplayedUnknownError
{
}

+ (void)trackCalendarListDisplayedOfflineError
{
}

+ (void)trackCalendarListDisplayedOtherError
{
}

+ (void)_trackErrorShown:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"ErrorType";
  v3 = [NSNumber numberWithUnsignedInteger:a3];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  CalAnalyticsSendEvent();
}

+ (void)trackCalendarListInteractedWithError
{
}

@end