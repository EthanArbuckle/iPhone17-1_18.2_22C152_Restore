@interface BuddyUpdateFinishedAutoUpdateController
- (void)viewDidLoad;
@end

@implementation BuddyUpdateFinishedAutoUpdateController

- (void)viewDidLoad
{
  v18 = self;
  SEL v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)BuddyUpdateFinishedAutoUpdateController;
  [(BuddyAutoUpdateController *)&v16 viewDidLoad];
  id v2 = [(BuddyUpdateFinishedAutoUpdateController *)v18 headerView];
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"SOFTWARE_UPDATE_COMPLETE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  [v2 setTitle:v4];

  v5 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_COMPLETE_DETAIL"];
  v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Localizable"];
  v8 = +[UIDevice currentDevice];
  v9 = [(UIDevice *)v8 systemVersion];
  id location = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

  v10 = +[NSBundle mainBundle];
  v11 = [(NSBundle *)v10 localizedStringForKey:@"AUTO_UPDATE_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];
  id v12 = [location stringByAppendingFormat:@"\n\n%@", v11];
  id v13 = location;
  id location = v12;

  id v14 = [(BuddyUpdateFinishedAutoUpdateController *)v18 headerView];
  [v14 setDetailText:location];

  objc_storeStrong(&location, 0);
}

@end