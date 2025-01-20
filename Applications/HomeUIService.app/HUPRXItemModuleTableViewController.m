@interface HUPRXItemModuleTableViewController
- (void)itemManagerDidFinishUpdate:(id)a3;
@end

@implementation HUPRXItemModuleTableViewController

- (void)itemManagerDidFinishUpdate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUPRXItemModuleTableViewController;
  [(HUPRXItemModuleTableViewController *)&v9 itemManagerDidFinishUpdate:v4];
  objc_opt_class();
  v5 = [(HUPRXItemModuleTableViewController *)self parentViewController];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 itemManagerDidFinishUpdate:v4];
  }
  else
  {
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100067DBC(v8);
    }
  }
}

@end