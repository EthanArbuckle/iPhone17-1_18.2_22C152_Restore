@interface UIViewController
+ (int)tabViewType;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (void)_finishSwitchTest;
- (void)willStartTest:(id)a3;
@end

@implementation UIViewController

+ (int)tabViewType
{
  return 0;
}

- (void)willStartTest:(id)a3
{
  id v4 = a3;
  if (([v4 hasPrefix:@"ColdSwitch"] & 1) != 0
    || [v4 hasPrefix:@"WarmSwitch"])
  {
    [UIApp startedTest:v4];
    [(UIViewController *)self performSelector:"_finishSwitchTest" withObject:0 afterDelay:0.0];
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v5 = a3;
  if (([v5 hasPrefix:@"ColdSwitch"] & 1) != 0
    || [v5 hasPrefix:@"WarmSwitch"])
  {
    objc_storeStrong((id *)&__CurrentTestName_0, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = 4;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v6 = 5;
            }
            else {
              uint64_t v6 = 0;
            }
          }
        }
      }
    }
    v8 = [UIApp rootViewController];
    v9 = [v8 baseViewController];
    if (objc_opt_respondsToSelector()) {
      [v9 switchToTab:v6];
    }

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_finishSwitchTest
{
  [UIApp finishedTest:__CurrentTestName_0 extraResults:0];
  v2 = (void *)__CurrentTestName_0;
  __CurrentTestName_0 = 0;
}

@end