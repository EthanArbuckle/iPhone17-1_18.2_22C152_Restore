@interface HUUtilityOnboardingConnectionTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUUtilityOnboardingConnectionTableViewController)initWithData:(id)a3 withItemManager:(id)a4 tableViewStyle:(int64_t)a5;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
@end

@implementation HUUtilityOnboardingConnectionTableViewController

- (HUUtilityOnboardingConnectionTableViewController)initWithData:(id)a3 withItemManager:(id)a4 tableViewStyle:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingConnectionTableViewController;
  return [(HUItemTableViewController *)&v6 initWithItemManager:a4 tableViewStyle:a5];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUUtilityOnboardingConnectionTableViewController;
  id v9 = a4;
  [(HUItemTableViewController *)&v14 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = v8;
  v11 = objc_msgSend(v9, "latestResults", v14.receiver, v14.super_class);

  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v10 setValueText:v12];

  [v10 setHideIcon:1];
  [v10 setAccessibilityIdentifier:@"Home.OnboardingView.Utility.SubscriptionInfoCell"];
  v13 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
  [v10 setBackgroundColor:v13];
}

@end