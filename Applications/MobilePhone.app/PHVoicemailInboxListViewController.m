@interface PHVoicemailInboxListViewController
+ (id)voicemailPredicate;
- (BOOL)_selectionContainsUnreadVoicemail;
- (BOOL)hasContentToDisplay;
- (BOOL)hasLegacyVoicemailInboxes;
- (BOOL)isSwipeToDelete;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (BOOL)shouldShowBlockedSubFolder;
- (BOOL)shouldShowGreetingButton;
- (BOOL)shouldShowTrashSubFolder;
- (BOOL)showLegacyVoicemailLabel;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CNKCNSharedProfileOnboardingController)onboardingController;
- (NSArray)blockedVoicemails;
- (NSArray)legacyVoicemails;
- (NSArray)trashVoicemails;
- (NSString)folderName;
- (PHVoicemailInboxListViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4;
- (PHVoicemailNavigationController)voicemailNavigationController;
- (UIBarButtonItem)deleteButton;
- (UIBarButtonItem)readButton;
- (id)cellDetailDestructiveActionText;
- (id)navigationBarText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)viewControllerAtIndexPath:(id)a3;
- (int)sectionTypeAt:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_delete:(id)a3;
- (void)_markAsRead:(id)a3;
- (void)_updateGreetingButtonAllowed;
- (void)didTapContinueWithViewController:(id)a3;
- (void)greetingButtonTapped;
- (void)performTableViewDestructiveActionAtIndexPath:(id)a3;
- (void)reloadLegacyVoicemails;
- (void)setBlockedVoicemails:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIsSwipeToDelete:(BOOL)a3;
- (void)setLegacyVoicemails:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setReadButton:(id)a3;
- (void)setShowLegacyVoicemailLabel:(BOOL)a3;
- (void)setTrashVoicemails:(id)a3;
- (void)startObservingPreferences;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tipKitStartObservation;
- (void)tipKitStopObservation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willShowVoicemails:(id)a3;
@end

@implementation PHVoicemailInboxListViewController

- (PHVoicemailInboxListViewController)initWithNavigationController:(id)a3 voicemailController:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHVoicemailInboxListViewController;
  v7 = [(MPVoicemailTableViewController *)&v12 initWithNavigationController:v6 voicemailController:a4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_voicemailNavigationController, v6);
    [(PHVoicemailInboxListViewController *)v8 _updateGreetingButtonAllowed];
    v9 = [(PHVoicemailInboxListViewController *)v8 editButtonItem];
    v10 = [(PHVoicemailInboxListViewController *)v8 navigationItem];
    [v10 setLeftBarButtonItem:v9];
  }
  return v8;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v24 viewDidLoad];
  v3 = [(PHVoicemailInboxListViewController *)self navigationBarText];
  v4 = [(PHVoicemailInboxListViewController *)self navigationItem];
  [v4 setTitle:v3];

  v5 = [(PHVoicemailInboxListViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = +[MPVoicemailMailboxTableViewCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  v8 = [(PHVoicemailInboxListViewController *)self tableView];
  [v8 setAllowsMultipleSelectionDuringEditing:1];

  v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v10 = [v9 localizedStringForKey:@"NO_VOICEMAIL" value:&stru_100285990 table:@"Voicemail"];
  [(PHTableViewController *)self setContentUnavailableViewTitle:v10];

  id v11 = objc_alloc((Class)UIBarButtonItem);
  objc_super v12 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v13 = [v12 localizedStringForKey:@"MARK_AS_READ" value:&stru_100285990 table:@"Voicemail"];
  id v14 = [v11 initWithTitle:v13 style:0 target:self action:"_markAsRead:"];
  [(PHVoicemailInboxListViewController *)self setReadButton:v14];

  id v15 = objc_alloc((Class)UIBarButtonItem);
  v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v17 = [v16 localizedStringForKey:@"DELETE" value:&stru_100285990 table:@"Voicemail"];
  id v18 = [v15 initWithTitle:v17 style:0 target:self action:"_delete:"];
  [(PHVoicemailInboxListViewController *)self setDeleteButton:v18];

  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v20 = [(PHVoicemailInboxListViewController *)self readButton];
  v25[0] = v20;
  v25[1] = v19;
  v21 = [(PHVoicemailInboxListViewController *)self deleteButton];
  v25[2] = v21;
  v22 = +[NSArray arrayWithObjects:v25 count:3];
  [(PHVoicemailInboxListViewController *)self setToolbarItems:v22];

  v23 = [(PHVoicemailInboxListViewController *)self navigationController];
  [v23 setToolbarHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v13 viewWillAppear:a3];
  id v4 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v5 = [v4 nameAndPhotoEnabledC3];

  if (v5)
  {
    uint64_t v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Going to present CNKCNSharedProfileOnboardingController on launch", v12, 2u);
    }

    v7 = [(PHVoicemailInboxListViewController *)self onboardingController];

    if (!v7)
    {
      v8 = objc_opt_new();
      [(PHVoicemailInboxListViewController *)self setOnboardingController:v8];
    }
    v9 = [(PHVoicemailInboxListViewController *)self onboardingController];
    v10 = +[TUCallCenter sharedInstance];
    id v11 = [v10 contactStore];
    [v9 presentOnboardingControllerOnLaunchIfNeededFrom:self withContactStore:v11];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v5 viewDidAppear:a3];
  [(PHVoicemailInboxListViewController *)self tipKitStartObservation];
  [(PHVoicemailInboxListViewController *)self reloadLegacyVoicemails];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"reloadLegacyVoicemails" name:@"com.apple.mobilephone.BadgeChanged" object:objc_opt_class()];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v5 viewDidDisappear:a3];
  [(PHVoicemailInboxListViewController *)self tipKitStopObservation];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"com.apple.mobilephone.BadgeChanged" object:objc_opt_class()];
}

- (void)reloadLegacyVoicemails
{
  v3 = PHPreferencesGetValue(@"FakeCallVoicemail");
  if ([v3 BOOLValue])
  {
    id v4 = +[MPLegacyVoicemail mock];
  }
  else
  {
    id v4 = 0;
  }

  objc_initWeak(&location, self);
  objc_super v5 = [(MPVoicemailTableViewController *)self voicemailController];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = __60__PHVoicemailInboxListViewController_reloadLegacyVoicemails__block_invoke;
  objc_super v13 = &unk_10027CCF0;
  objc_copyWeak(&v16, &location);
  id v6 = v4;
  id v14 = v6;
  id v15 = self;
  [v5 fetchLegacyVoicemailsCompletion:&v10];

  v7 = [(MPVoicemailTableViewController *)self voicemailController];
  v8 = [v7 accountManager];
  v9 = [v8 accounts];
  -[PHVoicemailInboxListViewController setShowLegacyVoicemailLabel:](self, "setShowLegacyVoicemailLabel:", (unint64_t)[v9 count] > 1);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__PHVoicemailInboxListViewController_reloadLegacyVoicemails__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = [WeakRetained hasLegacyVoicemailInboxes];
    [v4 setLegacyVoicemails:v15];
    if (*(void *)(a1 + 32))
    {
      id v6 = [v4 legacyVoicemails];
      v7 = [v6 arrayByAddingObject:*(void *)(a1 + 32)];
      [v4 setLegacyVoicemails:v7];
    }
    unsigned int v8 = [v4 hasLegacyVoicemailInboxes];
    if (v5)
    {
      if ((v8 & 1) == 0)
      {
        v9 = [v4 tableView];
        v10 = +[NSIndexSet indexSetWithIndex:0];
        [v9 deleteSections:v10 withRowAnimation:100];

        goto LABEL_11;
      }
    }
    else if (v8)
    {
      uint64_t v11 = [v4 tableView];
      objc_super v12 = +[NSIndexSet indexSetWithIndex:0];
      [v11 insertSections:v12 withRowAnimation:100];

      goto LABEL_12;
    }
    if ([*(id *)(a1 + 40) sectionTypeAt:0])
    {
      if (!v5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    objc_super v13 = [v4 tableView];
    id v14 = +[NSIndexSet indexSetWithIndex:0];
    [v13 reloadSections:v14 withRowAnimation:5];

    if (v5) {
LABEL_11:
    }
      [*(id *)(a1 + 40) updateTitleDisplayModeIfNeeded];
  }
LABEL_12:
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  v4.receiver = self;
  v4.super_class = (Class)PHVoicemailInboxListViewController;
  if ([(MPVoicemailTableViewController *)&v4 shouldNavigationControllerPresentLargeTitles])
  {
    return 1;
  }
  else
  {
    return [(PHVoicemailInboxListViewController *)self hasLegacyVoicemailInboxes];
  }
}

- (BOOL)hasLegacyVoicemailInboxes
{
  v2 = [(PHVoicemailInboxListViewController *)self legacyVoicemails];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int)sectionTypeAt:(int64_t)a3
{
  objc_super v4 = [(PHVoicemailInboxListViewController *)self tableView];
  id v5 = [v4 numberOfSections];
  if (a3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 == (id)2;
  }
  int v7 = !v6;

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(PHVoicemailInboxListViewController *)self hasLegacyVoicemailInboxes]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(PHVoicemailInboxListViewController *)self sectionTypeAt:a4];
  if (v7 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)PHVoicemailInboxListViewController;
    v9 = [(MPVoicemailTableViewController *)&v12 tableView:v6 numberOfRowsInSection:a4];
    v10 = &v9[[(PHVoicemailInboxListViewController *)self shouldShowTrashSubFolder]];
    a4 = (int64_t)&v10[[(PHVoicemailInboxListViewController *)self shouldShowBlockedSubFolder]];
    [(PHTableViewController *)self setContentUnavailable:[(PHVoicemailInboxListViewController *)self hasContentToDisplay] ^ 1 animated:0];
  }
  else if (!v7)
  {
    unsigned int v8 = [(PHVoicemailInboxListViewController *)self legacyVoicemails];
    a4 = (int64_t)[v8 count];
  }
  return a4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = -[PHVoicemailInboxListViewController sectionTypeAt:](self, "sectionTypeAt:", [v7 section]);
  if (v8 == 1)
  {
    id v13 = [v7 row];
    id v14 = [(MPVoicemailTableViewController *)self voicemails];
    id v15 = [v14 count];

    if (v13 >= v15)
    {
      v20 = [(PHVoicemailInboxListViewController *)self tableView];
      v21 = +[MPVoicemailMailboxTableViewCell reuseIdentifier];
      objc_super v12 = [v20 dequeueReusableCellWithIdentifier:v21 forIndexPath:v7];

      v22 = [(PHVoicemailInboxListViewController *)self viewControllerAtIndexPath:v7];
      v23 = [v22 folderName];
      objc_super v24 = [v12 titleLabel];
      [v24 setText:v23];

      v25 = [v22 messageCountText];
      v26 = [v12 countLabel];
      [v26 setText:v25];
    }
    else
    {
      v28.receiver = self;
      v28.super_class = (Class)PHVoicemailInboxListViewController;
      objc_super v12 = [(MPVoicemailTableViewController *)&v28 tableView:v6 cellForRowAtIndexPath:v7];
    }
  }
  else if (v8 {
         || ([(PHVoicemailInboxListViewController *)self legacyVoicemails],
  }
             v9 = objc_claimAutoreleasedReturnValue(),
             id v10 = [v9 count],
             id v11 = [v7 row],
             v9,
             v10 < v11))
  {
    objc_super v12 = 0;
  }
  else
  {
    objc_super v12 = [v6 dequeueReusableCellWithIdentifier:@"CallVoicemail" forIndexPath:v7];
    id v16 = [(PHVoicemailInboxListViewController *)self legacyVoicemails];
    v17 = [v16 objectAtIndexedSubscript:[v7 row]];

    BOOL v18 = [(PHVoicemailInboxListViewController *)self showLegacyVoicemailLabel];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __70__PHVoicemailInboxListViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v29[3] = &unk_10027C670;
    id v30 = v17;
    id v19 = v17;
    [(MPVoicemailTableViewController *)self configureLegacyVoicemailCell:v12 for:v19 showLabel:v18 onCallTapped:v29];
  }

  return v12;
}

void __70__PHVoicemailInboxListViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  v1 = (void *)UIApp;
  id v2 = [*(id *)(a1 + 32) accountID];
  [v1 dialVoicemailWithAccountID:v2];
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return [(PHVoicemailInboxListViewController *)self sectionTypeAt:a4] != 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1
    && -[PHVoicemailInboxListViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) >= 1)
  {
    objc_super v4 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    id v5 = [v4 localizedStringForKey:@"OTHERS" value:&stru_100285990 table:@"Voicemail"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)navigationBarText
{
  id v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  BOOL v3 = [v2 localizedStringForKey:@"VOICE_MAIL" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (NSString)folderName
{
  objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[PHVoicemailInboxListViewController folderName] should never get called");
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHVoicemailInboxListViewController.m" lineNumber:239 description:@"-[PHVoicemailInboxListViewController folderName] should never get called"];
  }

  return (NSString *)[(PHVoicemailInboxListViewController *)self navigationBarText];
}

+ (id)voicemailPredicate
{
  return &__block_literal_global_4;
}

BOOL __56__PHVoicemailInboxListViewController_voicemailPredicate__block_invoke(id a1, MPMessage *a2)
{
  return [(MPMessage *)a2 folder] == (id)1;
}

- (void)performTableViewDestructiveActionAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __83__PHVoicemailInboxListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke;
  v6[3] = &unk_10027CCC8;
  v6[4] = self;
  [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v5 completionBlock:v6];
}

void __83__PHVoicemailInboxListViewController_performTableViewDestructiveActionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 voicemailController];
  [v4 trashMessages:v3];
}

- (id)cellDetailDestructiveActionText
{
  id v2 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v3 = [v2 localizedStringForKey:@"DELETE" value:&stru_100285990 table:@"Voicemail"];

  return v3;
}

- (BOOL)hasContentToDisplay
{
  id v3 = [(PHVoicemailInboxListViewController *)self trashVoicemails];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(MPVoicemailTableViewController *)self voicemails];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(PHVoicemailInboxListViewController *)self blockedVoicemails];
      if ([v6 count]) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = [(PHVoicemailInboxListViewController *)self hasLegacyVoicemailInboxes];
      }
    }
  }

  return v4;
}

- (BOOL)shouldShowTrashSubFolder
{
  id v2 = [(PHVoicemailInboxListViewController *)self trashVoicemails];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldShowBlockedSubFolder
{
  id v2 = [(PHVoicemailInboxListViewController *)self blockedVoicemails];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PHVoicemailInboxListViewController sectionTypeAt:](self, "sectionTypeAt:", [v7 section]))
  {
    v10.receiver = self;
    v10.super_class = (Class)PHVoicemailInboxListViewController;
    BOOL v8 = [(MPVoicemailTableViewController *)&v10 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PHVoicemailInboxListViewController sectionTypeAt:](self, "sectionTypeAt:", [v7 section]) == 1)
  {
    v10.receiver = self;
    v10.super_class = (Class)PHVoicemailInboxListViewController;
    BOOL v8 = [(MPVoicemailTableViewController *)&v10 tableView:v6 canEditRowAtIndexPath:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[PHVoicemailInboxListViewController sectionTypeAt:](self, "sectionTypeAt:", [v7 section]))
  {
    id v15 = [(PHVoicemailInboxListViewController *)self legacyVoicemails];
    id v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    v17 = (void *)UIApp;
    BOOL v18 = [v16 accountID];
    [v17 dialVoicemailWithAccountID:v18];

    [v6 deselectRowAtIndexPath:v7 animated:1];
    goto LABEL_10;
  }
  v27.receiver = self;
  v27.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v27 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 setSeparatorStyle:0];
  [v6 setSeparatorStyle:1];
  id v8 = [v7 row];
  v9 = [(MPVoicemailTableViewController *)self voicemails];
  id v10 = [v9 count];

  if (v8 >= v10)
  {
    id v19 = [v7 row];
    v20 = [(MPVoicemailTableViewController *)self voicemails];
    id v21 = [v20 count];

    if (v19 < v21) {
      goto LABEL_11;
    }
    id v16 = [(PHVoicemailInboxListViewController *)self navigationController];
    v22 = [(PHVoicemailInboxListViewController *)self viewControllerAtIndexPath:v7];
    [v16 pushViewController:v22 animated:1];

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v11 = [(PHVoicemailInboxListViewController *)self readButton];
  if (v11)
  {
    objc_super v12 = (void *)v11;
    id v13 = [(PHVoicemailInboxListViewController *)self deleteButton];

    if (v13)
    {
      if ([(PHVoicemailInboxListViewController *)self isEditing]) {
        BOOL v14 = [(PHVoicemailInboxListViewController *)self _selectionContainsUnreadVoicemail];
      }
      else {
        BOOL v14 = 0;
      }
      v23 = [(PHVoicemailInboxListViewController *)self readButton];
      [v23 setEnabled:v14];

      unsigned int v24 = [(PHVoicemailInboxListViewController *)self isEditing];
      if (v24)
      {
        v23 = [v6 indexPathsForSelectedRows];
        BOOL v25 = [v23 count] != 0;
      }
      else
      {
        BOOL v25 = 0;
      }
      v26 = [(PHVoicemailInboxListViewController *)self deleteButton];
      [v26 setEnabled:v25];

      if (v24) {
    }
      }
  }
LABEL_11:
}

- (id)viewControllerAtIndexPath:(id)a3
{
  id v4 = [a3 row];
  id v5 = [(MPVoicemailTableViewController *)self voicemails];
  id v6 = [v5 count];

  if (v4 == v6)
  {
    unsigned __int8 v7 = [(PHVoicemailInboxListViewController *)self shouldShowTrashSubFolder];
    id v8 = [(PHVoicemailInboxListViewController *)self voicemailNavigationController];
    v9 = v8;
    if (v7)
    {
      uint64_t v10 = [v8 trashViewController];
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [(PHVoicemailInboxListViewController *)self voicemailNavigationController];
    v9 = v8;
  }
  uint64_t v10 = [v8 blockedViewController];
LABEL_6:
  uint64_t v11 = (void *)v10;

  return v11;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PHVoicemailInboxListViewController sectionTypeAt:](self, "sectionTypeAt:", [v7 section]))
  {
    v19.receiver = self;
    v19.super_class = (Class)PHVoicemailInboxListViewController;
    [(MPVoicemailTableViewController *)&v19 tableView:v6 didDeselectRowAtIndexPath:v7];
    id v8 = [v7 row];
    v9 = [(MPVoicemailTableViewController *)self voicemails];
    id v10 = [v9 count];

    if (v8 < v10)
    {
      uint64_t v11 = [(PHVoicemailInboxListViewController *)self readButton];
      if (v11)
      {
        objc_super v12 = (void *)v11;
        id v13 = [(PHVoicemailInboxListViewController *)self deleteButton];

        if (v13)
        {
          if ([(PHVoicemailInboxListViewController *)self isEditing]) {
            BOOL v14 = [(PHVoicemailInboxListViewController *)self _selectionContainsUnreadVoicemail];
          }
          else {
            BOOL v14 = 0;
          }
          id v15 = [(PHVoicemailInboxListViewController *)self readButton];
          [v15 setEnabled:v14];

          unsigned int v16 = [(PHVoicemailInboxListViewController *)self isEditing];
          if (v16)
          {
            id v15 = [v6 indexPathsForSelectedRows];
            BOOL v17 = [v15 count] != 0;
          }
          else
          {
            BOOL v17 = 0;
          }
          BOOL v18 = [(PHVoicemailInboxListViewController *)self deleteButton];
          [v18 setEnabled:v17];

          if (v16) {
        }
          }
      }
    }
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PHVoicemailInboxListViewController *)self setIsSwipeToDelete:1];
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewController;
  [(PHTableViewController *)&v8 tableView:v7 willBeginEditingRowAtIndexPath:v6];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PHVoicemailInboxListViewController *)self setIsSwipeToDelete:0];
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewController;
  [(PHTableViewController *)&v8 tableView:v7 didEndEditingRowAtIndexPath:v6];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHVoicemailInboxListViewController;
  [(MPVoicemailTableViewController *)&v15 setEditing:a3 animated:a4];
  id v6 = [(PHVoicemailInboxListViewController *)self tabBarController];
  if (v4 && ![(PHVoicemailInboxListViewController *)self isSwipeToDelete])
  {
    [v6 hideBarWithTransition:9];
    BOOL v8 = [(PHVoicemailInboxListViewController *)self _selectionContainsUnreadVoicemail];
    v9 = [(PHVoicemailInboxListViewController *)self readButton];
    [v9 setEnabled:v8];

    id v10 = [(PHVoicemailInboxListViewController *)self tableView];
    uint64_t v11 = [v10 indexPathsForSelectedRows];
    BOOL v12 = [v11 count] != 0;
    id v13 = [(PHVoicemailInboxListViewController *)self deleteButton];
    [v13 setEnabled:v12];

    BOOL v14 = [(PHVoicemailInboxListViewController *)self navigationController];
    [v14 setToolbarHidden:0];
  }
  else
  {
    id v7 = [(PHVoicemailInboxListViewController *)self navigationController];
    [v7 setToolbarHidden:1];

    [v6 showBarWithTransition:12];
  }
}

- (void)willShowVoicemails:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = [(PHVoicemailInboxListViewController *)self editButtonItem];
  }
  else
  {
    if ([(PHVoicemailInboxListViewController *)self isEditing]) {
      [(PHVoicemailInboxListViewController *)self setEditing:0 animated:1];
    }
    id v6 = 0;
  }
  id v7 = [(PHVoicemailInboxListViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  if (v5) {
  BOOL v8 = +[PHVoicemailTrashListViewController voicemailPredicate];
  }
  v9 = [(MPVoicemailTableViewController *)self voicemails:v4 passingTest:v8];
  [(PHVoicemailInboxListViewController *)self setTrashVoicemails:v9];

  id v10 = +[PHVoicemailBlockedListViewController voicemailPredicate];
  uint64_t v11 = [(MPVoicemailTableViewController *)self voicemails:v4 passingTest:v10];

  [(PHVoicemailInboxListViewController *)self setBlockedVoicemails:v11];
  BOOL v12 = PHDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(PHVoicemailInboxListViewController *)self trashVoicemails];
    id v14 = [v13 count];
    objc_super v15 = [(PHVoicemailInboxListViewController *)self blockedVoicemails];
    int v16 = 134218240;
    id v17 = v14;
    __int16 v18 = 2048;
    id v19 = [v15 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found trashVoicemails.count: %ld blockedVoicemails.count: %ld", (uint8_t *)&v16, 0x16u);
  }
}

- (void)greetingButtonTapped
{
  BOOL v3 = [VMGreetingChangeViewController alloc];
  id v4 = [(MPVoicemailTableViewController *)self voicemailController];
  id v5 = [v4 accountManager];
  id v6 = [(VMNavigationController *)v3 initWithManager:v5];

  [(PHVoicemailInboxListViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_updateGreetingButtonAllowed
{
  if ([(PHVoicemailInboxListViewController *)self shouldShowGreetingButton])
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    id v4 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    id v5 = [v4 localizedStringForKey:@"GREETING" value:&stru_100285990 table:@"Voicemail"];
    id v7 = [v3 initWithTitle:v5 style:0 target:self action:"greetingButtonTapped"];
  }
  else
  {
    id v7 = 0;
  }
  id v6 = [(PHVoicemailInboxListViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v7];
}

- (BOOL)_selectionContainsUnreadVoicemail
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(PHVoicemailInboxListViewController *)self tableView];
  id v4 = [v3 indexPathsForSelectedRows];

  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) row];
        id v10 = [(MPVoicemailTableViewController *)self voicemails];
        id v11 = [v10 count];

        if (v9 < v11)
        {
          BOOL v12 = [(MPVoicemailTableViewController *)self voicemails];
          id v13 = [v12 objectAtIndex:v9];

          if (v13 && ![v13 isRead])
          {

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (void)_markAsRead:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(PHVoicemailInboxListViewController *)self tableView];
  id v6 = [v5 indexPathsForSelectedRows];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[MPVoicemailTableViewController messageAtIndex:](self, "messageAtIndex:", [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) row]);
        if (v11) {
          [v4 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v4 count])
  {
    BOOL v12 = [(MPVoicemailTableViewController *)self voicemailController];
    id v13 = [v4 allObjects];
    [v12 markMessagesAsRead:v13];
  }
  [(PHVoicemailInboxListViewController *)self setEditing:0 animated:1];
}

- (void)_delete:(id)a3
{
  id v4 = [(PHVoicemailInboxListViewController *)self tableView];
  id v5 = [v4 indexPathsForSelectedRows];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __46__PHVoicemailInboxListViewController__delete___block_invoke;
  v6[3] = &unk_10027CCC8;
  v6[4] = self;
  [(MPVoicemailTableViewController *)self performDeleteAtIndexPaths:v5 completionBlock:v6];
}

id __46__PHVoicemailInboxListViewController__delete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 voicemailController];
  [v5 trashMessages:v4];

  id v6 = *(void **)(a1 + 32);

  return [v6 setEditing:0 animated:1];
}

- (BOOL)isSwipeToDelete
{
  return self->_isSwipeToDelete;
}

- (void)setIsSwipeToDelete:(BOOL)a3
{
  self->_isSwipeToDelete = a3;
}

- (UIBarButtonItem)readButton
{
  return self->_readButton;
}

- (void)setReadButton:(id)a3
{
}

- (UIBarButtonItem)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (NSArray)trashVoicemails
{
  return self->_trashVoicemails;
}

- (void)setTrashVoicemails:(id)a3
{
}

- (NSArray)blockedVoicemails
{
  return self->_blockedVoicemails;
}

- (void)setBlockedVoicemails:(id)a3
{
}

- (NSArray)legacyVoicemails
{
  return self->_legacyVoicemails;
}

- (void)setLegacyVoicemails:(id)a3
{
}

- (BOOL)showLegacyVoicemailLabel
{
  return self->_showLegacyVoicemailLabel;
}

- (void)setShowLegacyVoicemailLabel:(BOOL)a3
{
  self->_showLegacyVoicemailLabel = a3;
}

- (PHVoicemailNavigationController)voicemailNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voicemailNavigationController);

  return (PHVoicemailNavigationController *)WeakRetained;
}

- (CNKCNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_destroyWeak((id *)&self->_voicemailNavigationController);
  objc_storeStrong((id *)&self->_legacyVoicemails, 0);
  objc_storeStrong((id *)&self->_blockedVoicemails, 0);
  objc_storeStrong((id *)&self->_trashVoicemails, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);

  objc_storeStrong((id *)&self->_readButton, 0);
}

- (void)tipKitStartObservation
{
  id v2 = self;
  PHVoicemailInboxListViewController.tipKitStartObservation()();
}

- (void)tipKitStopObservation
{
  id v2 = self;
  PHVoicemailInboxListViewController.tipKitStopObservation()();
}

- (void)didTapContinueWithViewController:(id)a3
{
}

- (void)startObservingPreferences
{
  id v2 = self;
  PHVoicemailInboxListViewController.startObservingPreferences()();
}

- (BOOL)shouldShowGreetingButton
{
  id v2 = self;
  Swift::Bool v3 = PHVoicemailInboxListViewController.shouldShowGreetingButton()();

  return v3;
}

@end