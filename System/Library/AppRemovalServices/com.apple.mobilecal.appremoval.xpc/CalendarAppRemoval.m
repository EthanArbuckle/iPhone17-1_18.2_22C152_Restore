@interface CalendarAppRemoval
- (void)removeAppWithReply:(id)a3;
@end

@implementation CalendarAppRemoval

- (void)removeAppWithReply:(id)a3
{
  v3 = (void (**)(id, void))a3;
  NSLog(@"CALENDAR APP REMOVAL: removing prefs");
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilecal"];
  [v4 removeObjectForKey:@"LastViewType"];
  [v4 removeObjectForKey:@"LastViewedDate"];
  [v4 removeObjectForKey:@"LastSuspendTime"];
  [v4 removeObjectForKey:@"searchString"];
  [v4 removeObjectForKey:@"ShowListView"];
  [v4 removeObjectForKey:@"ShowMonthDividedListView"];
  [v4 synchronize];
  v3[2](v3, 0);
}

@end