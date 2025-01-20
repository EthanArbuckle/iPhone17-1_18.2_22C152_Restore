@interface SPUIApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)shouldRecordExtendedLaunchTime;
- (id)_extendLaunchTest;
- (void)startedTest:(id)a3;
@end

@implementation SPUIApplication

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[SPUISearchViewControllerHolder sharedInstance];
  v9 = [v8 searchViewController];
  unsigned __int8 v10 = [v9 runTest:v6 options:v7];

  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SPUIApplication;
    BOOL v11 = [(SPUIApplication *)&v13 runTest:v6 options:v7];
  }

  return v11;
}

- (void)startedTest:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SPUIApplication;
  id v4 = a3;
  [(SPUIApplication *)&v10 startedTest:v4];
  unsigned int v5 = [v4 isEqualToString:@"launch"];

  if (v5)
  {
    id v6 = [(SPUIApplication *)self _extendLaunchTest];
    [(SPUIApplication *)self runTest:v6 options:0];

    id v7 = +[SPUISearchViewControllerHolder sharedInstance];
    v8 = [v7 searchViewController];
    [v8 searchViewWillPresentFromSource:1];

    dispatch_time_t v9 = dispatch_time(0, 50000000);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, &stru_10000C448);
  }
}

- (id)_extendLaunchTest
{
  return SPUIExtendedLaunchConstant;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

@end