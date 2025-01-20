@interface PHVoicemailMessageDetailViewController
+ (id)voicemailPredicate;
- (BOOL)hasContentToDisplay;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (MPMessage)message;
- (NSString)folderName;
- (PHVoicemailMessageDetailViewController)initWithMessage:(id)a3 navigationController:(id)a4 voicemailController:(id)a5;
- (PHVoicemailMessageDetailViewControllerDelegate)delegate;
- (id)backgroundViewForTableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)handleUIApplicationDidEnterBackgroundNotification:(id)a3;
- (void)performTableViewDestructiveActionAtIndexPath:(id)a3;
- (void)reloadDataIfNeeded;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PHVoicemailMessageDetailViewController

- (PHVoicemailMessageDetailViewController)initWithMessage:(id)a3 navigationController:(id)a4 voicemailController:(id)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHVoicemailMessageDetailViewController;
  v10 = [(MPVoicemailTableViewController *)&v16 initWithNavigationController:a4 voicemailController:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_message, a3);
    id v17 = v9;
    v12 = +[NSArray arrayWithObjects:&v17 count:1];
    [(MPVoicemailTableViewController *)v11 setAllVoicemails:v12];
    id v13 = [v12 mutableCopy];
    [(MPVoicemailTableViewController *)v11 setVoicemails:v13];

    v14 = v11;
  }

  return v11;
}

- (void)reloadDataIfNeeded
{
}

- (id)backgroundViewForTableView
{
  return 0;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailMessageDetailViewController;
  [(MPVoicemailTableViewController *)&v5 viewDidLoad];
  v3 = [(PHVoicemailMessageDetailViewController *)self tableView];
  [v3 setAllowsSelection:0];

  v4 = [(PHVoicemailMessageDetailViewController *)self tableView];
  [v4 setSeparatorStyle:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = [(MPMessage *)self->_message identifier];
  id v6 = [(MPVoicemailTableViewController *)self indexPathForMessageID:v4];

  if (v6)
  {
    objc_super v5 = [(PHVoicemailMessageDetailViewController *)self tableView];
    [(MPVoicemailTableViewController *)self tableView:v5 expandRowAtIndexPath:v6 animated:0];
  }
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  return 0;
}

- (void)handleUIApplicationDidEnterBackgroundNotification:(id)a3
{
  v4 = [(MPMessage *)self->_message identifier];
  id v7 = [(MPVoicemailTableViewController *)self indexPathForMessageID:v4];

  objc_super v5 = [(PHVoicemailMessageDetailViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v7];

  [(MPVoicemailTableViewController *)self voicemailMessageTableViewCell:v6 didRequestPlayState:2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PHVoicemailMessageTableViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = [(MPVoicemailTableViewController *)self voicemailMessageViewModelForVoicemail:self->_message isExpanded:1];
  [v9 configureWithVoicemailMessageViewModel:v10 expanded:1 shouldGrayForeground:0];
  v11 = [(PHVoicemailMessageDetailViewController *)self tableView];
  v12 = [v11 safeAreaLayoutGuide];
  [v12 layoutFrame];
  [v9 setMaximumAllowedHeight:v13];

  [v9 setDelegate:self];

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v7;
    id v6 = [v5 toolbar];
    [v6 updateRTTButton];

    [v5 hideUnreadIndicator];
  }
}

- (NSString)folderName
{
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s should never be called", "-[PHVoicemailMessageDetailViewController folderName]");
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHVoicemailMessageDetailViewController.m" lineNumber:101 description:@"%s should never be called" -[PHVoicemailMessageDetailViewController folderName]];
  }
  id v6 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v7 = [v6 localizedStringForKey:@"VOICE_MAIL" value:&stru_100285990 table:@"Voicemail"];

  return (NSString *)v7;
}

- (BOOL)hasContentToDisplay
{
  v2 = [(MPVoicemailTableViewController *)self voicemails];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)voicemailPredicate
{
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s should never be called", "+[PHVoicemailMessageDetailViewController voicemailPredicate]");
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"PHVoicemailMessageDetailViewController.m" lineNumber:110 description:@"%s should never be called" +[PHVoicemailMessageDetailViewController voicemailPredicate]];
  }
  return &__block_literal_global_27;
}

BOOL __60__PHVoicemailMessageDetailViewController_voicemailPredicate__block_invoke(id a1, MPMessage *a2)
{
  return 1;
}

- (void)performTableViewDestructiveActionAtIndexPath:(id)a3
{
  v4 = [(PHVoicemailMessageDetailViewController *)self message];
  id v5 = [v4 folder];
  id v6 = [(MPVoicemailTableViewController *)self voicemailController];
  if (v5 == (id)2)
  {
    v11 = v4;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 moveMessagesToInbox:v7];
  }
  else
  {
    v10 = v4;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
    [v6 trashMessages:v7];
  }

  v8 = [(PHVoicemailMessageDetailViewController *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __87__PHVoicemailMessageDetailViewController_performTableViewDestructiveActionAtIndexPath___block_invoke;
  v9[3] = &unk_10027C670;
  v9[4] = self;
  [v8 voicemailMessageDetailViewController:self destructiveActionPerformedForMessage:v4 completionBlock:v9];
}

void __87__PHVoicemailMessageDetailViewController_performTableViewDestructiveActionAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = [v2 popViewControllerAnimated:1];
}

- (PHVoicemailMessageDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHVoicemailMessageDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end