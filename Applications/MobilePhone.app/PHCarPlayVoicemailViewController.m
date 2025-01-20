@interface PHCarPlayVoicemailViewController
- (BOOL)isRestrictedMessage:(id)a3;
- (CNContactStore)contactStore;
- (NSMutableArray)messagePlaybackQueue;
- (PHCarPlayVoicemailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)badgeString;
- (id)restrictedSubtitleForMessage:(id)a3;
- (id)subtitleForNoContentBanner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForNoContentBanner;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addMessageIDToPlaybackQueue:(id)a3;
- (void)dealloc;
- (void)playMessageFromPlaybackQueue;
- (void)playMessageWithID:(id)a3;
- (void)programmaticallySelectRowAtIndexPath:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)showRestrictedAlertForMessage:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)voicemailManagerChangedNotification:(id)a3;
- (void)voicemailViewControllerPlayVoicemailEventNotification:(id)a3;
@end

@implementation PHCarPlayVoicemailViewController

- (PHCarPlayVoicemailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PHCarPlayVoicemailViewController;
  v4 = [(PHCarPlayGenericViewController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"voicemailViewControllerPlayVoicemailEventNotification:" name:@"PHCarPlayVoicemailViewControllerPlayVoicemailEventNotification" object:0];
  }
  v6 = +[PHApplicationServices sharedInstance];
  uint64_t v7 = [v6 contactStore];
  v8 = *(void **)(v4 + 49);
  *(void *)(v4 + 49) = v7;

  uint64_t v9 = +[NSMutableArray array];
  v10 = *(void **)(v4 + 57);
  *(void *)(v4 + 57) = v9;

  if (+[PHDevice isGeminiCapable])
  {
    v11 = +[PHApplicationServices sharedInstance];
    v12 = [v11 callProviderManager];

    [v12 addDelegate:v4 queue:0];
  }
  return (PHCarPlayVoicemailViewController *)v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayVoicemailViewController;
  [(PHCarPlayGenericTableViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayVoicemailViewController;
  [(PHCarPlayGenericViewController *)&v6 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"voicemailManagerChangedNotification:" name:@"PHCarPlayVoicemailManagerChangedNotification" object:0];

  objc_super v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v4 setSeparatorInset:0.0, 12.0, 0.0, 0.0];

  v5 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PHCarPlayVoicemailCell"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayVoicemailViewController;
  [(PHCarPlayGenericViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  v5 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  objc_super v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:1];
}

- (void)voicemailManagerChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [v4 name];
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = [(PHCarPlayGenericViewController *)self viewIsInAppearedState];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling %@ with self.viewIsInAppearedState: %d", (uint8_t *)&v10, 0x12u);
  }
  if ([(PHCarPlayGenericViewController *)self viewIsInAppearedState])
  {
    objc_super v7 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v7 reloadData];

    [(PHCarPlayVoicemailViewController *)self playMessageFromPlaybackQueue];
  }
  else
  {
    [(PHCarPlayGenericTableViewController *)self setTableViewReloadIsRequiredOnViewWillAppear:1];
  }
  v8 = [(PHCarPlayVoicemailViewController *)self tabBarItem];
  uint64_t v9 = [(PHCarPlayVoicemailViewController *)self badgeString];
  [v8 setBadgeValue:v9];
}

- (void)voicemailViewControllerPlayVoicemailEventNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 valueForKey:@"kPHCarPlayVoicemailViewControllerVoicemailIDKey"];

  if (v8)
  {
    v5 = [(PHCarPlayVoicemailViewController *)self tabBarController];
    [v5 setSelectedViewController:self];

    objc_super v6 = [v8 stringValue];
    unsigned __int8 v7 = [v6 isEqualToString:@"-1"];

    if ((v7 & 1) == 0) {
      [(PHCarPlayVoicemailViewController *)self playMessageWithID:v8];
    }
  }
}

- (void)playMessageWithID:(id)a3
{
  id v4 = a3;
  v5 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __54__PHCarPlayVoicemailViewController_playMessageWithID___block_invoke;
  v7[3] = &unk_10027E1D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 voicemailWithID:v6 completion:v7];
}

void __54__PHCarPlayVoicemailViewController_playMessageWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__PHCarPlayVoicemailViewController_playMessageWithID___block_invoke_2;
  block[3] = &unk_10027D470;
  objc_copyWeak(&v11, &location);
  id v8 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__PHCarPlayVoicemailViewController_playMessageWithID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      if (objc_msgSend(WeakRetained, "isRestrictedMessage:"))
      {
        id v4 = PHDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          int v20 = 138412290;
          uint64_t v21 = v5;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen Time: Voicemail playback from notification is restricted for message: %@", (uint8_t *)&v20, 0xCu);
        }

        [v3 showRestrictedAlertForMessage:*(void *)(a1 + 32)];
      }
      else
      {
        unsigned __int8 v8 = [*(id *)(a1 + 32) isDataAvailable];
        id v9 = PHDefaultLog();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v10)
          {
            uint64_t v11 = *(void *)(a1 + 32);
            int v20 = 138412290;
            uint64_t v21 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHCarPlayVoicemailController will play %@", (uint8_t *)&v20, 0xCu);
          }

          __int16 v12 = objc_alloc_init(PHCarPlayVoicemailPlayerViewController);
          [(PHCarPlayVoicemailPlayerViewController *)v12 setRepresentedVoicemail:*(void *)(a1 + 32)];
          unsigned int v13 = [v3 navigationController];
          [v13 pushViewController:v12 animated:0];
        }
        else
        {
          if (v10)
          {
            uint64_t v14 = *(void *)(a1 + 32);
            int v20 = 138412290;
            uint64_t v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHCarPlayVoicemailController wont play %@ because it has no data", (uint8_t *)&v20, 0xCu);
          }

          v15 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
          v16 = [v15 voicemails];
          id v17 = [v16 count];

          if (v17)
          {
            v18 = [v3 mainTableView];
            v19 = +[NSIndexPath indexPathForRow:0 inSection:0];
            [v18 scrollToRowAtIndexPath:v19 atScrollPosition:1 animated:0];
          }
        }
      }
    }
    else
    {
      id v6 = PHDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v20 = 138412290;
        uint64_t v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayVoicemailController wont play message with id %@ because it could not be found. Adding to playback queue", (uint8_t *)&v20, 0xCu);
      }

      [*(id *)(a1 + 48) addMessageIDToPlaybackQueue:*(void *)(a1 + 40)];
    }
  }
}

- (void)playMessageFromPlaybackQueue
{
  id v3 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
  id v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found a messageID: %@ from the playback queue: %@ that needs to be played", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
    [v7 removeObject:v4];

    [(PHCarPlayVoicemailViewController *)self playMessageWithID:v4];
  }
}

- (void)addMessageIDToPlaybackQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Message already exists in queue: %@ not adding it", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v9 = [(PHCarPlayVoicemailViewController *)self messagePlaybackQueue];
    [v9 addObject:v4];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  unsigned __int8 v6 = [v5 voicemails];
  id v7 = [v6 count];

  [(PHCarPlayGenericTableViewController *)self setNoContentBannerShown:v7 == 0];
  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PHCarPlayVoicemailCell" forIndexPath:v6];
  [v7 setAccessoryType:1];
  int v8 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  id v9 = [v8 voicemails];
  id v10 = [v6 row];

  uint64_t v11 = [v9 objectAtIndex:v10];

  [v7 setRepresentedVoicemail:v11 isRestrictedMessage:[self isRestrictedMessage:v11]];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout, a4);
  [v4 _scaledValueForValue:44.0];
  double v6 = v5;

  return v6;
}

- (BOOL)isRestrictedMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 senderDestinationID];
  if ([v4 length])
  {
    id v5 = [v3 senderDestinationID];
  }
  else
  {
    id v5 = TUCallFilterUnknownCallerAddress;
  }
  double v6 = v5;

  id v7 = +[TUHandle handleWithDestinationID:v6];
  int v8 = +[TUCallCenter sharedInstance];
  id v9 = [v8 callFilterController];
  unsigned __int8 v10 = [v9 containsRestrictedHandle:v7 forBundleIdentifier:TUBundleIdentifierMobilePhoneApplication];

  return v10;
}

- (void)showRestrictedAlertForMessage:(id)a3
{
  id v4 = a3;
  id v5 = TUBundle();
  double v6 = [v5 localizedStringForKey:@"RESTRICTED_CONTENT" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v7 = [(PHCarPlayVoicemailViewController *)self restrictedSubtitleForMessage:v4];

  id v11 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  int v8 = TUBundle();
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"TelephonyUtilities"];
  unsigned __int8 v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];
  [v11 addAction:v10];

  [(PHCarPlayVoicemailViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (id)restrictedSubtitleForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCarPlayVoicemailViewController *)self contactStore];
  double v6 = [v4 displayNameUsingContactStore:v5];

  if (![v6 length])
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"UNKNOWN" value:&stru_100285990 table:@"PHCarPlay"];

    double v6 = (void *)v8;
  }
  id v9 = TUBundle();
  unsigned __int8 v10 = [v9 localizedStringForKey:@"DOWNTIME_CALLER_ALTERNATE_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6);

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)programmaticallySelectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "programmaticallySelectRowAtIndexPath:%@", (uint8_t *)&v16, 0xCu);
  }

  double v6 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  id v7 = [v6 voicemails];
  uint64_t v8 = [v7 objectAtIndex:[v4 row]];

  unsigned int v9 = [(PHCarPlayVoicemailViewController *)self isRestrictedMessage:v8];
  if (v9)
  {
    unsigned __int8 v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Screen Time: Voicemail playback is restricted for message: %@", (uint8_t *)&v16, 0xCu);
    }

    id v11 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v11 deselectRowAtIndexPath:v4 animated:0];

    [(PHCarPlayVoicemailViewController *)self showRestrictedAlertForMessage:v8];
  }
  else
  {
    if ([v8 isDataAvailable])
    {
      __int16 v12 = objc_alloc_init(PHCarPlayVoicemailPlayerViewController);
      [(PHCarPlayVoicemailPlayerViewController *)v12 setRepresentedVoicemail:v8];
      unsigned int v13 = [(PHCarPlayVoicemailViewController *)self navigationController];
      [v13 pushViewController:v12 animated:1];
    }
    else
    {
      PHDefaultLog();
      __int16 v12 = (PHCarPlayVoicemailPlayerViewController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super.super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, &v12->super.super.super.super, OS_LOG_TYPE_DEFAULT, "Did not select voicemail as it was still pending %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  if (((v9 | !+[PHCarPlayUtilities activeInterfaceMechanismIsHardware]) & 1) == 0)
  {
    uint64_t v14 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v14 deselectRowAtIndexPath:v4 animated:0];

    v15 = [(PHCarPlayGenericTableViewController *)self mainTableView];
    [v15 highlightRowAtIndexPath:v4 animated:0 scrollPosition:0];
  }
}

- (id)titleForNoContentBanner
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"NO VOICEMAIL" value:&stru_100285990 table:@"PHCarPlay"];

  return v3;
}

- (id)subtitleForNoContentBanner
{
  return 0;
}

- (id)badgeString
{
  v2 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  id v3 = [v2 badgeString];

  return v3;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v3 = [(PHCarPlayGenericTableViewController *)self mainTableView];
  [v3 reloadData];
}

- (CNContactStore)contactStore
{
  return *(CNContactStore **)((char *)&self->super._carPlayExternalDevice + 1);
}

- (NSMutableArray)messagePlaybackQueue
{
  return *(NSMutableArray **)((char *)&self->_contactStore + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_contactStore + 1), 0);

  objc_storeStrong((id *)((char *)&self->super._carPlayExternalDevice + 1), 0);
}

@end