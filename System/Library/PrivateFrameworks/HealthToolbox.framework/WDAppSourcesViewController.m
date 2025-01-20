@interface WDAppSourcesViewController
+ (id)tableViewSectionClasses;
- (WDAppSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4;
@end

@implementation WDAppSourcesViewController

+ (id)tableViewSectionClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (WDAppSourcesViewController)initWithProfile:(id)a3 usingInsetStyling:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WDAppSourcesViewController;
  v4 = [(WDSourcesViewController *)&v8 initWithProfile:a3 usingInsetStyling:a4];
  v5 = WDBundle();
  v6 = [v5 localizedStringForKey:@"APPS_LIST_HEADER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [(WDAppSourcesViewController *)v4 setTitle:v6];

  return v4;
}

@end