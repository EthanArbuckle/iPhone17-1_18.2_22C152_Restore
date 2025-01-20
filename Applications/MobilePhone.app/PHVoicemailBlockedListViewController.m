@interface PHVoicemailBlockedListViewController
+ (id)voicemailPredicate;
- (BOOL)hasContentToDisplay;
- (NSString)folderName;
- (NSString)messageCountText;
- (id)cellDetailDestructiveActionText;
- (id)navigationBarText;
- (void)deleteAllTapped:(id)a3;
- (void)performTableViewDestructiveActionAtIndexPath:(id)a3;
- (void)viewDidLoad;
- (void)willShowVoicemails:(id)a3;
@end

@implementation PHVoicemailBlockedListViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PHVoicemailBlockedListViewController;
  [(MPVoicemailTableViewController *)&v11 viewDidLoad];
  v3 = [(PHVoicemailBlockedListViewController *)self navigationBarText];
  v4 = [(PHVoicemailBlockedListViewController *)self navigationItem];
  [v4 setTitle:v3];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v7 = [v6 localizedStringForKey:@"DELETE_ALL" value:&stru_100285990 table:@"Voicemail"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"deleteAllTapped:"];

  v9 = [(PHVoicemailBlockedListViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = [(PHVoicemailBlockedListViewController *)self navigationItem];
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
  BOOL v3 = [v2 localizedStringForKey:@"BLOCKED" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (NSString)messageCountText
{
  v2 = [(MPVoicemailTableViewController *)self voicemails];
  uint64_t v3 = (uint64_t)[v2 count];

  if (v3 < 1)
  {
    v6 = &stru_100285990;
  }
  else
  {
    v4 = +[PhoneApplication sharedNumberFormatter];
    id v5 = +[NSNumber numberWithInteger:v3];
    v6 = [v4 stringFromNumber:v5];
  }

  return (NSString *)v6;
}

- (NSString)folderName
{
  v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  uint64_t v3 = [v2 localizedStringForKey:@"BLOCKED_MESSAGES" value:&stru_100285990 table:@"Voicemail"];

  return (NSString *)v3;
}

+ (id)voicemailPredicate
{
  return &__block_literal_global_5;
}

BOOL __58__PHVoicemailBlockedListViewController_voicemailPredicate__block_invoke(id a1, MPMessage *a2)
{
  v2 = a2;
  BOOL v3 = [(MPMessage *)v2 folder] == (id)4 || [(MPMessage *)v2 folder] == (id)3;

  return v3;
}

- (void)performTableViewDestructiveActionAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __85__PHVoicemailBlockedListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke;
  v6[3] = &unk_10027CCC8;
  v6[4] = self;
  [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v5 completionBlock:v6];
}

void __85__PHVoicemailBlockedListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 trashMessages:v3];
}

- (id)cellDetailDestructiveActionText
{
  v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v3 = [v2 localizedStringForKey:@"DELETE" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (void)willShowVoicemails:(id)a3
{
  BOOL v4 = [a3 count] != 0;
  id v6 = [(PHVoicemailBlockedListViewController *)self navigationItem];
  id v5 = [v6 rightBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)deleteAllTapped:(id)a3
{
  BOOL v4 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v5 = [v4 localizedStringForKey:@"DELETE_ALL_ALERT_TITLE" value:&stru_100285990 table:@"Voicemail"];
  id v6 = +[UIAlertController alertControllerWithTitle:0 message:v5 preferredStyle:0];

  id v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v8 = [v7 localizedStringForKey:@"DELETE_ALL" value:&stru_100285990 table:@"Voicemail"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __56__PHVoicemailBlockedListViewController_deleteAllTapped___block_invoke;
  v13[3] = &unk_10027CC60;
  v13[4] = self;
  v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v13];

  [v6 addAction:v9];
  v10 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  objc_super v11 = [v10 localizedStringForKey:@"CLEAR_ALL_CANCEL_BUTTON_TITLE" value:&stru_100285990 table:@"Voicemail"];
  v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];

  [v6 addAction:v12];
  [(PHVoicemailBlockedListViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __56__PHVoicemailBlockedListViewController_deleteAllTapped___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 voicemails];
  BOOL v4 = [v2 indexPathsForMessages:v3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __56__PHVoicemailBlockedListViewController_deleteAllTapped___block_invoke_2;
  v5[3] = &unk_10027CCC8;
  v5[4] = *(void *)(a1 + 32);
  [v2 performDeleteAtIndexPaths:v4 completionBlock:v5];
}

void __56__PHVoicemailBlockedListViewController_deleteAllTapped___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 trashMessages:v3];
}

@end