@interface AXBuddySettingsNavigationController
- (AXBuddySettingsNavigationController)init;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AXBuddySettingsNavigationController

- (AXBuddySettingsNavigationController)init
{
  v3 = objc_opt_new();
  v16.receiver = self;
  v16.super_class = (Class)AXBuddySettingsNavigationController;
  v4 = [(AXBuddySettingsNavigationController *)&v16 initWithRootViewController:v3];

  if (v4)
  {
    [(AXBuddySettingsNavigationController *)v4 setDelegate:v4];
    v5 = sub_4BD4();
    [v5 applyThemeToNavigationController:v4];

    v6 = sub_4BD4();
    v7 = [v6 backgroundColor];
    v8 = [(AXBuddySettingsNavigationController *)v4 view];
    [v8 setBackgroundColor:v7];

    [(AXBuddySettingsNavigationController *)v4 setNavigationBarHidden:0];
    uint64_t v18 = objc_opt_class();
    v9 = +[NSArray arrayWithObjects:&v18 count:1];
    v10 = +[UITableViewCell appearanceWhenContainedInInstancesOfClasses:v9];

    v11 = +[UIColor secondarySystemBackgroundColor];
    [v10 setBackgroundColor:v11];

    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v12 = +[NSArray arrayWithObjects:v17 count:2];
    v13 = +[UILabel appearanceWhenContainedInInstancesOfClasses:v12];
    v14 = +[UIColor secondaryLabelColor];
    [v13 setTextColor:v14];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(AXBuddySettingsNavigationController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    sub_4BD4();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 applyThemeToNavigationController:self];
  }
}

@end