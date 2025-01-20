@interface EKFoundInAppsEventTracker
+ (void)trackPseudoEventDateChanged;
+ (void)trackPseudoEventDetailsOpened;
+ (void)trackPseudoEventInitialTimeToLeaveFired;
+ (void)trackPseudoEventsExpired:(int)a3;
@end

@implementation EKFoundInAppsEventTracker

+ (void)trackPseudoEventDateChanged
{
}

+ (void)trackPseudoEventDetailsOpened
{
}

+ (void)trackPseudoEventsExpired:(int)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    v5 = @"count";
    v3 = objc_msgSend(NSNumber, "numberWithInt:");
    v6[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

    CalAnalyticsSendEvent(@"CalendarEventFoundInApps.eventsExpired", v4);
  }
}

+ (void)trackPseudoEventInitialTimeToLeaveFired
{
}

@end