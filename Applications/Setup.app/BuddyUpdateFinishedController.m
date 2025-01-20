@interface BuddyUpdateFinishedController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BuddyUpdateFinishedController)init;
- (void)_continuePressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyUpdateFinishedController

- (BuddyUpdateFinishedController)init
{
  id v20 = self;
  v19[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SOFTWARE_UPDATE_COMPLETE_DETAIL"];
  v4 = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[UIDevice currentDevice];
  v6 = [(UIDevice *)v5 systemVersion];
  v19[0] = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v6);

  v7 = +[UIColor systemBlueColor];
  v8 = [(UIColor *)v7 colorWithAlphaComponent:0.4];
  v21[0] = v8;
  v9 = +[UIColor systemBlueColor];
  v21[1] = v9;
  v10 = +[NSArray arrayWithObjects:v21 count:2];
  id v18 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v10];

  id location = +[UIImage systemImageNamed:@"gear.badge.checkmark" withConfiguration:v18];
  id v11 = v20;
  v12 = +[NSBundle mainBundle];
  v13 = [(NSBundle *)v12 localizedStringForKey:@"SOFTWARE_UPDATE_COMPLETE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  id v20 = 0;
  v16.receiver = v11;
  v16.super_class = (Class)BuddyUpdateFinishedController;
  id v20 = [(BuddyUpdateFinishedController *)&v16 initWithTitle:v13 detailText:v19[0] icon:location];
  v14 = (BuddyUpdateFinishedController *)v20;

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  return v14;
}

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyUpdateFinishedController;
  [(BuddyUpdateFinishedController *)&v5 viewDidLoad];
  v2 = v7;
  id v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"_continuePressed:"];
}

- (void)_continuePressed:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupUpdateCompleted;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

@end