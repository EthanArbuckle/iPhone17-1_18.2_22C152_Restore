@interface PHCarPlayRecentsViewController
- (BOOL)shouldSuppressMultiwayRecentCalls;
- (CNAvatarViewControllerSettings)avatarViewControllerSettings;
- (NSMutableArray)joinableConversationUUIDs;
- (NSMutableArray)pendingUpdatedRecentCalls;
- (NSMutableArray)recentCalls;
- (PHCarPlayRecentsViewController)init;
- (PHRecentsController)recentsController;
- (TUContactsDataProvider)contactsDataProvider;
- (TUConversationManager)conversationManager;
- (TUFeatureFlags)featureFlags;
- (id)badgeString;
- (id)bundleIdentifierForRecentCall:(id)a3;
- (id)contactsForRecentCallForAvatar:(id)a3;
- (id)conversationWithUUID:(id)a3;
- (id)recentCallAtIndex:(int64_t)a3;
- (id)restrictedSubtitleForConversation:(id)a3;
- (id)restrictedSubtitleForRecentCall:(id)a3;
- (id)subtitleForNoContentBanner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForNoContentBanner;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)unreadCallCount;
- (void)_replaceRecentCalls:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)configureCell:(id)a3 forCall:(id)a4;
- (void)configureCell:(id)a3 forOngoingConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)handleTUCallCenterCallStatusChangedNotification:(id)a3;
- (void)insertJoinableConversationsIfNecessary:(id)a3;
- (void)joinConversationAtIndexPath:(id)a3;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)programmaticallySelectRowAtIndexPath:(id)a3;
- (void)recentsController:(id)a3 didChangeCalls:(id)a4;
- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)removeJoinableConversation:(id)a3;
- (void)setAvatarViewControllerSettings:(id)a3;
- (void)setContactsDataProvider:(id)a3;
- (void)setPendingUpdatedRecentCalls:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setRecentsController:(id)a3;
- (void)setUnreadCallCount:(unint64_t)a3;
- (void)showRestrictedAlertWithMessage:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateNoContentBanner;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHCarPlayRecentsViewController

- (PHCarPlayRecentsViewController)init
{
  v22.receiver = self;
  v22.super_class = (Class)PHCarPlayRecentsViewController;
  v2 = [(PHCarPlayGenericTableViewController *)&v22 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)TUFeatureFlags);
    v4 = *(void **)(v2 + 113);
    *(void *)(v2 + 113) = v3;

    v5 = *(void **)(v2 + 65);
    *(void *)(v2 + 65) = 0;

    uint64_t v6 = [UIApp recentsController];
    v7 = *(void **)(v2 + 49);
    *(void *)(v2 + 49) = v6;

    [*(id *)(v2 + 49) addDelegate:v2 queue:&_dispatch_main_q];
    *(void *)(v2 + 73) = 0;
    uint64_t v8 = +[NSMutableArray array];
    v9 = *(void **)(v2 + 89);
    *(void *)(v2 + 89) = v8;

    v10 = *(void **)(v2 + 97);
    *(void *)(v2 + 97) = 0;

    if ([*(id *)(v2 + 113) phoneRecentsAvatarsCarplayEnabled])
    {
      v11 = +[TUCallCenter sharedInstance];
      v12 = [v11 contactStore];
      uint64_t v13 = +[CNAvatarViewControllerSettings settingsWithContactStore:v12 threeDTouchEnabled:1];
      v14 = *(void **)(v2 + 105);
      *(void *)(v2 + 105) = v13;
    }
    id v15 = objc_alloc_init((Class)TUConversationManager);
    v16 = *(void **)(v2 + 81);
    *(void *)(v2 + 81) = v15;

    [*(id *)(v2 + 81) addDelegate:v2 queue:&_dispatch_main_q];
    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    v18 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __38__PHCarPlayRecentsViewController_init__block_invoke;
    block[3] = &unk_10027C670;
    v21 = v2;
    dispatch_async(v18, block);
  }
  return (PHCarPlayRecentsViewController *)v2;
}

void __38__PHCarPlayRecentsViewController_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recentsController];
  id v3 = [v2 recentCalls];
  id v4 = [v3 mutableCopy];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __38__PHCarPlayRecentsViewController_init__block_invoke_2;
  v6[3] = &unk_10027C940;
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void __38__PHCarPlayRecentsViewController_init__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) recentCalls];

  if (!v2)
  {
    id v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 40) count];
      int v5 = 134217984;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController init: recentCalls nil so fetched %lu calls", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) _replaceRecentCalls:*(void *)(a1 + 40)];
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayGenericTableViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayGenericViewController *)&v14 viewDidLoad];
  id v3 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  uint64_t v4 = objc_opt_class();
  int v5 = +[PHCarPlayGenericTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  id v6 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  uint64_t v7 = objc_opt_class();
  id v8 = +[PHCarPlayGenericTableViewCell reuseIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];

  v9 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v9 setSeparatorInset:0.0, 35.0, 0.0, 0.0];

  v10 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v10 setEstimatedRowHeight:44.0];

  v11 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v11 setRowHeight:UITableViewAutomaticDimension];

  v12 = [(PHCarPlayRecentsViewController *)self conversationManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __45__PHCarPlayRecentsViewController_viewDidLoad__block_invoke;
  v13[3] = &unk_10027C670;
  v13[4] = self;
  [v12 registerWithCompletionHandler:v13];
}

void __45__PHCarPlayRecentsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__PHCarPlayRecentsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_10027C670;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __45__PHCarPlayRecentsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [v1 conversationManager];
  v2 = [v4 activeConversations];
  id v3 = [v2 allObjects];
  [v1 insertJoinableConversationsIfNecessary:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayGenericTableViewController *)&v22 viewWillAppear:a3];
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController PHCarPlayRecentsViewController viewWillAppear", buf, 2u);
  }

  int v5 = [(PHCarPlayRecentsViewController *)self recentCalls];

  if (!v5)
  {
    id v6 = [(PHCarPlayRecentsViewController *)self recentsController];
    uint64_t v7 = [v6 recentCalls];
    id v8 = [v7 mutableCopy];

    v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController viewWillAppear: recentCalls nil so fetched %lu calls", buf, 0xCu);
    }

    [(PHCarPlayRecentsViewController *)self _replaceRecentCalls:v8];
    v11 = [(PHCarPlayRecentsViewController *)self pendingUpdatedRecentCalls];

    if (v11)
    {
      v12 = PHDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(PHCarPlayRecentsViewController *)self pendingUpdatedRecentCalls];
        id v14 = [v13 count];
        *(_DWORD *)buf = 134217984;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController viewWillAppear: ignoring %lu stale pendingUpdatedRecentCalls", buf, 0xCu);
      }
      [(PHCarPlayRecentsViewController *)self setPendingUpdatedRecentCalls:0];
    }
  }
  id v15 = [(PHCarPlayRecentsViewController *)self pendingUpdatedRecentCalls];

  if (v15)
  {
    v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(PHCarPlayRecentsViewController *)self pendingUpdatedRecentCalls];
      id v18 = [v17 count];
      *(_DWORD *)buf = 134217984;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController viewWillAppear: applying %lu pendingUpdatedRecentCalls", buf, 0xCu);
    }
    v19 = [(PHCarPlayRecentsViewController *)self recentsController];
    v20 = [(PHCarPlayRecentsViewController *)self pendingUpdatedRecentCalls];
    [(PHCarPlayRecentsViewController *)self recentsController:v19 didChangeCalls:v20];

    [(PHCarPlayRecentsViewController *)self setPendingUpdatedRecentCalls:0];
  }
  v21 = +[NSNotificationCenter defaultCenter];
  [v21 addObserver:self selector:"applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayRecentsViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(PHCarPlayRecentsViewController *)self recentsController];
  [v4 markRecentCallsAsRead];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayGenericViewController *)&v5 viewDidDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  objc_super v5 = [(PHCarPlayRecentsViewController *)self tabBarController];
  id v6 = [v5 selectedViewController];
  uint64_t v7 = [v6 childViewControllers];
  id v8 = [v7 firstObject];

  if (v8 == self)
  {
    v9 = [(PHCarPlayRecentsViewController *)self recentsController];
    [v9 markRecentCallsAsRead];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    objc_super v5 = [(PHCarPlayRecentsViewController *)self recentCalls];
  }
  else
  {
    if ([(PHCarPlayRecentsViewController *)self shouldSuppressMultiwayRecentCalls])
    {
      return 0;
    }
    objc_super v5 = [(PHCarPlayRecentsViewController *)self joinableConversationUUIDs];
  }
  uint64_t v7 = v5;
  id v8 = [v5 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    id v8 = +[PHCarPlayGenericTableViewCell reuseIdentifier];
    v9 = [v7 dequeueReusableCellWithIdentifier:v8];

    id v10 = [v6 row];
    v11 = [(PHCarPlayRecentsViewController *)self recentCallAtIndex:v10];
    if (v11) {
      [(PHCarPlayRecentsViewController *)self configureCell:v9 forCall:v11];
    }
    if ([*(id *)((char *)&self->_avatarViewControllerSettings + 1) phoneRecentsAvatarsCarplayEnabled])
    {
      v12 = [v9 avatarViewController];

      if (!v12)
      {
        id v13 = objc_alloc((Class)CNAvatarViewController);
        id v14 = [(PHCarPlayRecentsViewController *)self avatarViewControllerSettings];
        id v15 = [v13 initWithSettings:v14];

        [v15 setObjectViewControllerDelegate:self];
        [v9 setAvatarViewController:v15];
      }
      v16 = [(PHCarPlayRecentsViewController *)self contactsForRecentCallForAvatar:v11];
      v17 = [v9 avatarViewController];
      [v17 setContacts:v16];
    }
  }
  else
  {
    id v18 = +[PHCarPlayGenericTableViewCell reuseIdentifier];
    v9 = [v7 dequeueReusableCellWithIdentifier:v18];

    v19 = [(PHCarPlayRecentsViewController *)self joinableConversationUUIDs];
    id v20 = [v6 row];

    v21 = [v19 objectAtIndexedSubscript:v20];
    v11 = [(PHCarPlayRecentsViewController *)self conversationWithUUID:v21];

    [(PHCarPlayRecentsViewController *)self configureCell:v9 forOngoingConversation:v11];
  }

  return v9;
}

- (id)contactsForRecentCallForAvatar:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PHCarPlayRecentsViewController *)self recentsController];
  id v6 = [v5 contactByHandleForRecentCall:v4 keyDescriptors:&__NSArray0__struct];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v4 validRemoteParticipantHandles];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (!v13) {
          id v13 = objc_alloc_init((Class)CNMutableContact);
        }
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)configureCell:(id)a3 forCall:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [(PHCarPlayRecentsViewController *)self recentsController];
  id v8 = [v7 itemForRecentCall:v6];

  id v9 = [v8 date];
  id v10 = [v21 dateLabel];
  [v10 setDate:v9];

  uint64_t v11 = [v8 localizedTitle];
  v12 = [v21 nameLabel];
  [v12 setText:v11];

  unsigned int v13 = [v6 callStatus];
  if (v13 == kCHCallStatusMissed) {
    +[UIColor systemRedColor];
  }
  else {
  id v14 = +[UIColor dynamicLabelColor];
  }
  long long v15 = [v21 nameLabel];
  [v15 setTextColor:v14];

  long long v16 = [v8 localizedSubtitle];
  [v21 setPhoneNumberTypeLabelText:v16];

  unsigned int v17 = [v6 callStatus];
  if (v17 == kCHCallStatusConnectedOutgoing)
  {
    BOOL v18 = 1;
  }
  else
  {
    unsigned int v19 = [v6 callStatus];
    BOOL v18 = v19 == kCHCallStatusCancelled;
  }
  [v21 setShowsOutgoingCallIcon:v18];
  id v20 = [v8 localizedSenderIdentityTitle];
  [v21 setLocalizedSenderIdentityTitle:v20];
}

- (void)configureCell:(id)a3 forOngoingConversation:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v5 displayName];

  if (v6)
  {
    id v7 = [v5 displayName];
    id v8 = [v9 nameLabel];
    [v8 setText:v7];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  [(PHCarPlayRecentsViewController *)self programmaticallySelectRowAtIndexPath:v6];
}

- (void)programmaticallySelectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "programmaticallySelectRowAtIndexPath:%@", (uint8_t *)&v13, 0xCu);
  }

  if ([v4 section])
  {
    id v6 = -[PHCarPlayRecentsViewController recentCallAtIndex:](self, "recentCallAtIndex:", [v4 row]);
    id v7 = [(PHCarPlayRecentsViewController *)self recentsController];
    id v8 = [v7 dialRequestForRecentCall:v6];

    id v9 = +[TUCallCenter sharedInstance];
    id v10 = [v9 callFilterController];
    unsigned int v11 = [v10 shouldRestrictDialRequest:v8];

    if (v11)
    {
      v12 = [(PHCarPlayRecentsViewController *)self restrictedSubtitleForRecentCall:v6];
      [(PHCarPlayRecentsViewController *)self showRestrictedAlertWithMessage:v12];
    }
    else
    {
      v12 = [(PHCarPlayRecentsViewController *)self recentsController];
      [v12 performDialRequest:v8];
    }
  }
  else
  {
    [(PHCarPlayRecentsViewController *)self joinConversationAtIndexPath:v4];
  }
}

- (void)joinConversationAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCarPlayRecentsViewController *)self joinableConversationUUIDs];
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];
  id v12 = [(PHCarPlayRecentsViewController *)self conversationWithUUID:v7];

  id v8 = +[TUCallCenter sharedInstance];
  id v9 = [v8 callFilterController];
  LODWORD(v6) = [v9 shouldRestrictConversation:v12 performSynchronously:1];

  if (v6)
  {
    id v10 = [(PHCarPlayRecentsViewController *)self restrictedSubtitleForConversation:v12];
    [(PHCarPlayRecentsViewController *)self showRestrictedAlertWithMessage:v10];
  }
  else if ([v12 state])
  {
    id v10 = +[NSURL faceTimeShowInCallUIURL];
    TUOpenURL();
  }
  else
  {
    id v10 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversation:v12 originatingUIType:47];
    [v10 setWantsStagingArea:0];
    [v10 setVideoEnabled:0];
    unsigned int v11 = +[TUCallCenter sharedInstance];
    [v11 launchAppForJoinRequest:v10];
  }
}

- (id)bundleIdentifierForRecentCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 serviceProvider];
  unsigned int v5 = [v4 isEqualToString:kCHServiceProviderTelephony];

  if (v5)
  {
    id v6 = TUBundleIdentifierMobilePhoneApplication;
  }
  else
  {
    id v7 = [v3 serviceProvider];
    unsigned int v8 = [v7 isEqualToString:kCHServiceProviderFaceTime];

    if (v8) {
      TUPreferredFaceTimeBundleIdentifier();
    }
    else {
    id v6 = [v3 serviceProvider];
    }
  }
  id v9 = v6;

  return v9;
}

- (void)showRestrictedAlertWithMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = TUBundle();
  id v6 = [v5 localizedStringForKey:@"RESTRICTED_CONTENT" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v10 = +[UIAlertController alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  id v7 = TUBundle();
  unsigned int v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v10 addAction:v9];

  [(PHCarPlayRecentsViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)restrictedSubtitleForConversation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activeRemoteParticipants];
  unsigned int v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v53 = v3;
  id v6 = [v3 activeRemoteParticipants];
  id v7 = [v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v67;
    id v10 = (void *)TUCallFilterUnknownCallerAddress;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        int v13 = [v12 handle];
        id v14 = [v13 value];
        if ([v14 length])
        {
          long long v15 = [v12 handle];
          id v16 = [v15 value];
        }
        else
        {
          id v16 = v10;
        }

        [v5 addObject:v16];
      }
      id v8 = [v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    unsigned int v17 = [v53 remoteMembers];
    id v18 = [v17 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v63;
      id v21 = (void *)TUCallFilterUnknownCallerAddress;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v63 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
          id v24 = [v23 handle];
          v25 = [v24 value];
          if ([v25 length])
          {
            v26 = [v23 handle];
            id v27 = [v26 value];
          }
          else
          {
            id v27 = v21;
          }

          [v5 addObject:v27];
        }
        id v19 = [v17 countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v19);
    }
  }
  v28 = +[TUCallCenter sharedInstance];
  v29 = [v28 callFilterController];
  v30 = TUPreferredFaceTimeBundleIdentifier();
  v31 = [v29 policyForAddresses:v5 forBundleIdentifier:v30];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v57 = v31;
  id obj = [v31 allKeys];
  id v32 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (!v32)
  {
    v34 = 0;
    v49 = 0;
LABEL_47:

    goto LABEL_48;
  }
  id v33 = v32;
  v34 = 0;
  unint64_t v56 = 0;
  uint64_t v35 = *(void *)v59;
  do
  {
    for (k = 0; k != v33; k = (char *)k + 1)
    {
      v37 = v5;
      if (*(void *)v59 != v35) {
        objc_enumerationMutation(obj);
      }
      v38 = *(void **)(*((void *)&v58 + 1) + 8 * (void)k);
      id v39 = [v57 objectForKeyedSubscript:v38];
      v40 = +[NSNumber numberWithInt:0];
      if (![v39 isEqualToNumber:v40]) {
        goto LABEL_35;
      }
      id v41 = [v38 length];

      if (v41)
      {
        ++v56;
        if (!v34)
        {
          id v42 = objc_alloc((Class)TUContactsDataProviderFetchRequest);
          v43 = +[TUHandle handleWithDestinationID:v38];
          id v39 = [v42 initWithHandle:v43];

          v44 = [(PHCarPlayRecentsViewController *)self contactsDataProvider];
          v40 = [v44 executeFetchRequest:v39];

          v45 = [v40 localizedName];
          if ([v45 length])
          {
            id v46 = [v40 localizedName];
          }
          else
          {
            id v46 = v38;
          }
          v34 = v46;

LABEL_35:
        }
      }
      unsigned int v5 = v37;
    }
    id v33 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
  }
  while (v33);

  if (v56 == 2)
  {
    v47 = TUBundle();
    CFStringRef v48 = @"DOWNTIME_CALLER_ALTERNATE_TWO_%@";
LABEL_43:
    id obj = v47;
    v50 = [v47 localizedStringForKey:v48 value:&stru_100285990 table:@"TelephonyUtilities"];
    v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v34);
LABEL_46:

    goto LABEL_47;
  }
  if (v56 == 1)
  {
    v47 = TUBundle();
    CFStringRef v48 = @"DOWNTIME_CALLER_ALTERNATE_%@";
    goto LABEL_43;
  }
  if (v56 >= 3)
  {
    TUBundle();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = [obj localizedStringForKey:@"DOWNTIME_CALLER_ALTERNATE_MULTI_%@_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
    v51 = +[NSNumber numberWithUnsignedInteger:v56 - 1];
    v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v34, v51);

    goto LABEL_46;
  }
  v49 = 0;
LABEL_48:

  return v49;
}

- (id)restrictedSubtitleForRecentCall:(id)a3
{
  id v3 = [a3 callerNameForDisplay];
  if (![v3 length])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"UNKNOWN" value:&stru_100285990 table:@"PHCarPlay"];

    id v3 = (void *)v5;
  }
  id v6 = TUBundle();
  id v7 = [v6 localizedStringForKey:@"DOWNTIME_CALLER_ALTERNATE_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3);

  return v8;
}

- (void)updateNoContentBanner
{
  id v3 = [(PHCarPlayRecentsViewController *)self recentCalls];
  id v4 = (char *)[v3 count];

  if (![(PHCarPlayRecentsViewController *)self shouldSuppressMultiwayRecentCalls])
  {
    uint64_t v5 = [(PHCarPlayRecentsViewController *)self joinableConversationUUIDs];
    id v4 = &v4[(void)[v5 count]];
  }

  [(PHCarPlayGenericTableViewController *)self setNoContentBannerShown:v4 == 0];
}

- (id)titleForNoContentBanner
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"NO RECENTS" value:&stru_100285990 table:@"PHCarPlay"];

  return v3;
}

- (id)subtitleForNoContentBanner
{
  return 0;
}

- (id)badgeString
{
  unint64_t v2 = [(PHCarPlayRecentsViewController *)self unreadCallCount];

  return PhoneStringForBadgeValue(1, v2);
}

- (BOOL)shouldSuppressMultiwayRecentCalls
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.FaceTime"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"suppressMultiwayRecentCalls"];

  return v3;
}

- (id)conversationWithUUID:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(PHCarPlayRecentsViewController *)self conversationManager];
  id v6 = [v5 activeConversations];

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v13 = [v12 UUID];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v15 = v12;

          uint64_t v9 = v15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)insertJoinableConversationsIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(PHCarPlayRecentsViewController *)self shouldSuppressMultiwayRecentCalls])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __73__PHCarPlayRecentsViewController_insertJoinableConversationsIfNecessary___block_invoke;
    v6[3] = &unk_10027C8F0;
    id v7 = v4;
    id v8 = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __73__PHCarPlayRecentsViewController_insertJoinableConversationsIfNecessary___block_invoke_129;
    v5[3] = &unk_10027D268;
    v5[4] = self;
    [(PHCarPlayRecentsViewController *)self performBatchUpdates:v6 completion:v5];
  }
}

void __73__PHCarPlayRecentsViewController_insertJoinableConversationsIfNecessary___block_invoke(uint64_t a1, int a2)
{
  unsigned __int8 v3 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (![v9 state])
        {
          uint64_t v10 = [*(id *)(a1 + 40) joinableConversationUUIDs];
          unsigned int v11 = [v9 UUID];
          unsigned __int8 v12 = [v10 containsObject:v11];

          if ((v12 & 1) == 0)
          {
            int v13 = [*(id *)(a1 + 40) joinableConversationUUIDs];
            unsigned int v14 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v13 count], 0);

            [v3 addObject:v14];
            id v15 = [*(id *)(a1 + 40) joinableConversationUUIDs];
            id v16 = [v9 UUID];
            [v15 addObject:v16];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  if (a2 && [v3 count])
  {
    long long v17 = PHDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Inserting rows for joinable multiway conversations: %@", buf, 0xCu);
    }

    long long v18 = [*(id *)(a1 + 40) mainTableView];
    [v18 insertRowsAtIndexPaths:v3 withRowAnimation:100];
  }
}

id __73__PHCarPlayRecentsViewController_insertJoinableConversationsIfNecessary___block_invoke_129(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNoContentBanner];
}

- (void)removeJoinableConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCarPlayRecentsViewController *)self joinableConversationUUIDs];
  id v6 = [v4 UUID];
  id v7 = [v5 indexOfObject:v6];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __61__PHCarPlayRecentsViewController_removeJoinableConversation___block_invoke;
    v9[3] = &unk_10027DBD0;
    id v11 = v7;
    v9[4] = self;
    id v10 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __61__PHCarPlayRecentsViewController_removeJoinableConversation___block_invoke_131;
    v8[3] = &unk_10027D268;
    v8[4] = self;
    [(PHCarPlayRecentsViewController *)self performBatchUpdates:v9 completion:v8];
  }
}

void __61__PHCarPlayRecentsViewController_removeJoinableConversation___block_invoke(uint64_t a1, int a2)
{
  id v4 = +[NSIndexPath indexPathForRow:*(void *)(a1 + 48) inSection:0];
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing multiway row: %@", buf, 0xCu);
  }

  id v6 = [*(id *)(a1 + 32) joinableConversationUUIDs];
  id v7 = [*(id *)(a1 + 40) UUID];
  [v6 removeObject:v7];

  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) mainTableView];
    id v10 = v4;
    uint64_t v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [v8 deleteRowsAtIndexPaths:v9 withRowAnimation:100];
  }
}

id __61__PHCarPlayRecentsViewController_removeJoinableConversation___block_invoke_131(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNoContentBanner];
}

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  id v5 = [a4 mutableCopy:a3];
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController recentsController:didChangeCalls with %lu calls", (uint8_t *)&v7, 0xCu);
  }

  if ([(PHCarPlayGenericViewController *)self viewIsInAppearedState]) {
    [(PHCarPlayRecentsViewController *)self _replaceRecentCalls:v5];
  }
  else {
    [(PHCarPlayRecentsViewController *)self setPendingUpdatedRecentCalls:v5];
  }
}

- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    *(_DWORD *)buf = 138412802;
    id v11 = v7;
    __int16 v12 = 2048;
    unint64_t v13 = [(PHCarPlayRecentsViewController *)self unreadCallCount];
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController %@ is handling unread call count change from %lu to %lu", buf, 0x20u);
  }
  [(PHCarPlayRecentsViewController *)self setUnreadCallCount:a4];
  v9.receiver = self;
  v9.super_class = (Class)PHCarPlayRecentsViewController;
  [(PHCarPlayGenericTableViewController *)&v9 updateBadgeString];
}

- (void)_replaceRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCarPlayGenericTableViewController *)self mainTableView];

  id v6 = PHDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v13 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController recentsController:didChangeCalls performBatchUpdates for %lu calls", buf, 0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __54__PHCarPlayRecentsViewController__replaceRecentCalls___block_invoke;
    v10[3] = &unk_10027C8F0;
    v10[4] = self;
    id v11 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __54__PHCarPlayRecentsViewController__replaceRecentCalls___block_invoke_2;
    v8[3] = &unk_10027D268;
    id v9 = v11;
    [(PHCarPlayRecentsViewController *)self performBatchUpdates:v10 completion:v8];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v13 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController replaceRecentCalls ignored %lu calls since view is not yet loaded", buf, 0xCu);
    }
  }
}

void __54__PHCarPlayRecentsViewController__replaceRecentCalls___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setRecentCalls:*(void *)(a1 + 40)];
  id v4 = [objc_alloc((Class)NSIndexSet) initWithIndex:1];
  if (a2)
  {
    id v6 = v4;
    id v5 = [*(id *)(a1 + 32) mainTableView];
    [v5 reloadSections:v6 withRowAnimation:5];

    id v4 = v6;
  }
}

void __54__PHCarPlayRecentsViewController__replaceRecentCalls___block_invoke_2(uint64_t a1)
{
  id v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) count];
    int v4 = 134217984;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController recentsController:didChangeCalls performBatchUpdates completed for %lu calls", (uint8_t *)&v4, 0xCu);
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __82__PHCarPlayRecentsViewController_conversationManager_stateChangedForConversation___block_invoke;
  v6[3] = &unk_10027C940;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void __82__PHCarPlayRecentsViewController_conversationManager_stateChangedForConversation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 removeJoinableConversation:v3];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v4 insertJoinableConversationsIfNecessary:v6];
  }
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __80__PHCarPlayRecentsViewController_conversationManager_removedActiveConversation___block_invoke;
  v5[3] = &unk_10027C940;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id __80__PHCarPlayRecentsViewController_conversationManager_removedActiveConversation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeJoinableConversation:*(void *)(a1 + 40)];
}

- (void)setRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = (char *)[v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayRecentsViewController setRecentCalls to %lu calls", buf, 0xCu);
  }

  if (*(id *)((char *)&self->_contactsDataProvider + 1) != v4)
  {
    long long v23 = +[NSMutableArray array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    id v22 = v4;
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      id v10 = 0;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v13 mediaType] == (id)1)
          {
            if (v9)
            {
              __int16 v14 = [(PHCarPlayRecentsViewController *)self recentsController];
              id v15 = [v14 coalesceRecentCall:v9 withRecentCall:v13];
            }
            else
            {
              id v15 = v13;
            }
            id v16 = v15;
            if (!v15)
            {
              [v23 addObject:v9];
              id v16 = v13;
            }
            id v17 = v16;

            v10 += [v13 read] ^ 1;
            id v9 = v17;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);

      if (v9)
      {
        long long v18 = (TUContactsDataProvider *)v23;
        [v23 addObject:v9];
LABEL_22:
        long long v19 = *(TUContactsDataProvider **)((char *)&self->_contactsDataProvider + 1);
        *(TUContactsDataProvider **)((char *)&self->_contactsDataProvider + 1) = v18;
        long long v20 = v18;

        long long v21 = PHDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v31 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CarPlay Recents setting unread count to %lu", buf, 0xCu);
        }

        [(PHCarPlayRecentsViewController *)self setUnreadCallCount:v10];
        [(PHCarPlayRecentsViewController *)self updateNoContentBanner];
        v24.receiver = self;
        v24.super_class = (Class)PHCarPlayRecentsViewController;
        [(PHCarPlayGenericTableViewController *)&v24 updateBadgeString];

        id v4 = v22;
        goto LABEL_25;
      }
    }
    else
    {

      id v10 = 0;
      id v9 = 0;
    }
    long long v18 = (TUContactsDataProvider *)v23;
    goto LABEL_22;
  }
LABEL_25:
}

- (void)handleTUCallCenterCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [v4 object];
  if ([v9 disconnectedReason] == 17)
  {
    id v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Call status changed for call with dial failed: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = [(PHCarPlayRecentsViewController *)self conversationManager];
    __int16 v12 = [v11 activeConversations];
    id v13 = [v12 allObjects];
    [(PHCarPlayRecentsViewController *)self insertJoinableConversationsIfNecessary:v13];
  }
}

- (id)recentCallAtIndex:(int64_t)a3
{
  id v4 = [(PHCarPlayRecentsViewController *)self recentCalls];
  id v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (TUContactsDataProvider)contactsDataProvider
{
  uint64_t v3 = *(PHRecentsController **)((char *)&self->_recentsController + 1);
  if (!v3)
  {
    id v4 = objc_alloc((Class)TUContactsDataProvider);
    id v5 = +[PHApplicationServices sharedInstance];
    id v6 = [v5 contactStore];
    id v7 = (PHRecentsController *)[v4 initWithContactsDataSource:v6];
    id v8 = *(PHRecentsController **)((char *)&self->_recentsController + 1);
    *(PHRecentsController **)((char *)&self->_recentsController + 1) = v7;

    uint64_t v3 = *(PHRecentsController **)((char *)&self->_recentsController + 1);
  }

  return (TUContactsDataProvider *)v3;
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(PHCarPlayGenericTableViewController *)self mainTableViewDataSource];
  id v9 = [v8 filterType];

  if (v9)
  {
    v6[2](v6, 0);
    id v10 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v10 reloadData];

    v7[2](v7, 1);
  }
  else
  {
    uint64_t v11 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __65__PHCarPlayRecentsViewController_performBatchUpdates_completion___block_invoke;
    v12[3] = &unk_10027CD60;
    id v13 = v6;
    [v11 performBatchUpdates:v12 completion:v7];

    id v7 = v13;
  }
}

uint64_t __65__PHCarPlayRecentsViewController_performBatchUpdates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PHRecentsController)recentsController
{
  return *(PHRecentsController **)((char *)&self->super._carPlayExternalDevice + 1);
}

- (void)setRecentsController:(id)a3
{
}

- (void)setContactsDataProvider:(id)a3
{
}

- (NSMutableArray)recentCalls
{
  return *(NSMutableArray **)((char *)&self->_contactsDataProvider + 1);
}

- (unint64_t)unreadCallCount
{
  return *(unint64_t *)((char *)&self->_recentCalls + 1);
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  *(NSMutableArray **)((char *)&self->_recentCalls + 1) = (NSMutableArray *)a3;
}

- (TUConversationManager)conversationManager
{
  return *(TUConversationManager **)((char *)&self->_unreadCallCount + 1);
}

- (NSMutableArray)joinableConversationUUIDs
{
  return *(NSMutableArray **)((char *)&self->_conversationManager + 1);
}

- (NSMutableArray)pendingUpdatedRecentCalls
{
  return *(NSMutableArray **)((char *)&self->_joinableConversationUUIDs + 1);
}

- (void)setPendingUpdatedRecentCalls:(id)a3
{
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  return *(CNAvatarViewControllerSettings **)((char *)&self->_pendingUpdatedRecentCalls + 1);
}

- (void)setAvatarViewControllerSettings:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return *(CNAvatarViewControllerSettings **)((char *)&self->_avatarViewControllerSettings + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_avatarViewControllerSettings + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pendingUpdatedRecentCalls + 1), 0);
  objc_storeStrong((id *)((char *)&self->_joinableConversationUUIDs + 1), 0);
  objc_storeStrong((id *)((char *)&self->_conversationManager + 1), 0);
  objc_storeStrong((id *)((char *)&self->_unreadCallCount + 1), 0);
  objc_storeStrong((id *)((char *)&self->_contactsDataProvider + 1), 0);
  objc_storeStrong((id *)((char *)&self->_recentsController + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._carPlayExternalDevice + 1), 0);
}

@end