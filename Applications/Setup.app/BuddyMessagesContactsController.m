@interface BuddyMessagesContactsController
- (BOOL)controllerNeedsToRun;
- (BuddyMessagesContactsController)init;
- (void)continueTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMessagesContactsController

- (BuddyMessagesContactsController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 scale];
  v11[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.MobileSMS", 2);

  id v3 = location;
  v4 = +[NSBundle mainBundle];
  v5 = [(NSBundle *)v4 localizedStringForKey:@"MESSAGES_CONTACTS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v6 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"MESSAGES_CONTACTS_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyMessagesContactsController;
  id location = [(BuddyMessagesContactsController *)&v10 initWithTitle:v5 detailText:v7 icon:v11[0]];
  objc_storeStrong(&location, location);

  v8 = (BuddyMessagesContactsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMessagesContactsController;
  [(BuddyDataUsageController *)&v4 viewDidLoad];
  id v2 = [(BuddyMessagesContactsController *)v6 buttonTray];
  uint64_t v7 = BYPrivacyMessagesIdentifier;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];
  [v2 setPrivacyLinkForBundles:v3];
}

- (void)continueTapped:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BYPreferencesController buddyPreferences];
  [v3 setObject:&__kCFBooleanTrue forKey:@"MessagesContactsPresented"];

  v4.receiver = v6;
  v4.super_class = (Class)BuddyMessagesContactsController;
  [(BuddyDataUsageController *)&v4 continueTapped:v6];
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  uint64_t v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMessagesContactsController;
  if ([(BuddyDataUsageController *)&v5 controllerNeedsToRun])
  {
    id v2 = [(BuddyDataUsageController *)v7 existingSettings];
    id v3 = [(BuddyExistingSettings *)v2 backupMetadata];
    char v8 = ([v3 messagesContactsPresented] ^ 1) & 1;
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

@end