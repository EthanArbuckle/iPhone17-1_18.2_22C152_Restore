@interface BuddyRestoreFinishedController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BuddyRestoreFinishedController)init;
- (void)_continuePressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyRestoreFinishedController

- (BuddyRestoreFinishedController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"RESTORE_COMPLETED_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"RESTORE_COMPLETED_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyRestoreFinishedController;
  id location = [(BuddyRestoreFinishedController *)&v9 initWithTitle:v4 detailText:v6 icon:0];
  v7 = (BuddyRestoreFinishedController *)location;

  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  objc_super v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyRestoreFinishedController;
  [(BuddyRestoreFinishedController *)&v7 viewDidLoad];
  id v2 = [(BuddyRestoreFinishedController *)v9 headerView];
  LODWORD(v3) = 0;
  [v2 setTitleHyphenationFactor:v3];

  v4 = v9;
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v4 addBoldButton:v6 action:"_continuePressed:"];
}

- (void)_continuePressed:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupRestoreCompleted;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

@end