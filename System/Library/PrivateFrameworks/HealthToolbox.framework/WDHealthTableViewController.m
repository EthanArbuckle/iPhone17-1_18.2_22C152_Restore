@interface WDHealthTableViewController
- (WDHealthTableViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4;
- (WDHealthTableViewController)initWithStyle:(int64_t)a3 profile:(id)a4;
@end

@implementation WDHealthTableViewController

- (WDHealthTableViewController)initWithStyle:(int64_t)a3 profile:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WDHealthTableViewController;
  v7 = [(WDTableViewController *)&v10 initWithStyle:a3];
  v8 = v7;
  if (v7) {
    [(WDTableViewController *)v7 setProfile:v6];
  }

  return v8;
}

- (WDHealthTableViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDHealthTableViewController;
  v7 = [(HKTableViewController *)&v10 initWithUsingInsetStyling:v4];
  v8 = v7;
  if (v7) {
    [(WDTableViewController *)v7 setProfile:v6];
  }

  return v8;
}

@end