@interface PHVoicemailTrashListViewController
+ (id)voicemailPredicate;
- (BOOL)hasContentToDisplay;
- (NSString)folderName;
- (NSString)messageCountText;
- (id)cellDetailDestructiveActionText;
- (id)navigationBarText;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (void)clearAllTapped;
- (void)performTableViewDestructiveActionAtIndexPath:(id)a3;
- (void)performTableViewRestoreActionAtIndexPath:(id)a3;
- (void)viewDidLoad;
- (void)willShowVoicemails:(id)a3;
@end

@implementation PHVoicemailTrashListViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PHVoicemailTrashListViewController;
  [(MPVoicemailTableViewController *)&v11 viewDidLoad];
  v3 = [(PHVoicemailTrashListViewController *)self navigationBarText];
  v4 = [(PHVoicemailTrashListViewController *)self navigationItem];
  [v4 setTitle:v3];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v7 = [v6 localizedStringForKey:@"CLEAR_ALL" value:&stru_100285990 table:@"Voicemail"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"clearAllTapped"];

  v9 = [(PHVoicemailTrashListViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = [(PHVoicemailTrashListViewController *)self navigationItem];
  [v10 setLargeTitleDisplayMode:2];
}

- (BOOL)hasContentToDisplay
{
  v2 = [(MPVoicemailTableViewController *)self voicemails];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)navigationBarText
{
  v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  BOOL v3 = [v2 localizedStringForKey:@"DELETED" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (NSString)folderName
{
  v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  BOOL v3 = [v2 localizedStringForKey:@"DELETED_MESSAGES" value:&stru_100285990 table:@"Voicemail"];

  return (NSString *)v3;
}

+ (id)voicemailPredicate
{
  return &__block_literal_global_3;
}

BOOL __56__PHVoicemailTrashListViewController_voicemailPredicate__block_invoke(id a1, MPMessage *a2)
{
  return [(MPMessage *)a2 folder] == (id)2;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  v4 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app", a4];
  id v5 = [v4 localizedStringForKey:@"CLEAR" value:&stru_100285990 table:@"Voicemail"];

  return v5;
}

- (void)performTableViewDestructiveActionAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __83__PHVoicemailTrashListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke;
  v6[3] = &unk_10027CCC8;
  v6[4] = self;
  [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v5 completionBlock:v6];
}

void __83__PHVoicemailTrashListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 deleteMessages:v3];
}

- (void)performTableViewRestoreActionAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __79__PHVoicemailTrashListViewController_performTableViewRestoreActionAtIndexPath___block_invoke;
  v6[3] = &unk_10027CCC8;
  v6[4] = self;
  [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v5 completionBlock:v6];
}

void __79__PHVoicemailTrashListViewController_performTableViewRestoreActionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 moveMessagesToInbox:v3];
}

- (NSString)messageCountText
{
  [(MPVoicemailTableViewController *)self reloadDataIfNeeded];
  id v3 = [(MPVoicemailTableViewController *)self voicemails];
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 < 1)
  {
    id v7 = &stru_100285990;
  }
  else
  {
    id v5 = +[PhoneApplication sharedNumberFormatter];
    v6 = +[NSNumber numberWithInteger:v4];
    id v7 = [v5 stringFromNumber:v6];
  }

  return (NSString *)v7;
}

- (id)cellDetailDestructiveActionText
{
  v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v3 = [v2 localizedStringForKey:@"UNDELETE" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (void)willShowVoicemails:(id)a3
{
  BOOL v4 = [a3 count] != 0;
  id v6 = [(PHVoicemailTrashListViewController *)self navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)clearAllTapped
{
  id v3 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  BOOL v4 = [v3 localizedStringForKey:@"CLEAR_ALL_ALERT_TITLE" value:&stru_100285990 table:@"Voicemail"];
  id v5 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:0];

  id v6 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v7 = [v6 localizedStringForKey:@"CLEAR_ALL_OK_BUTTON_TITLE" value:&stru_100285990 table:@"Voicemail"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __52__PHVoicemailTrashListViewController_clearAllTapped__block_invoke;
  v12[3] = &unk_10027CC60;
  v12[4] = self;
  id v8 = +[UIAlertAction actionWithTitle:v7 style:2 handler:v12];
  [v5 addAction:v8];

  v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v10 = [v9 localizedStringForKey:@"CLEAR_ALL_CANCEL_BUTTON_TITLE" value:&stru_100285990 table:@"Voicemail"];
  objc_super v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v5 addAction:v11];

  [(PHVoicemailTrashListViewController *)self presentViewController:v5 animated:1 completion:0];
}

void __52__PHVoicemailTrashListViewController_clearAllTapped__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationItem];
  id v3 = [v2 rightBarButtonItem];
  [v3 setEnabled:0];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v4 voicemails];
  id v6 = [v4 indexPathsForMessages:v5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__PHVoicemailTrashListViewController_clearAllTapped__block_invoke_2;
  v7[3] = &unk_10027CCC8;
  v7[4] = *(void *)(a1 + 32);
  [v4 performDeleteAtIndexPaths:v6 completionBlock:v7];
}

void __52__PHVoicemailTrashListViewController_clearAllTapped__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 deleteMessages:v3];
}

@end