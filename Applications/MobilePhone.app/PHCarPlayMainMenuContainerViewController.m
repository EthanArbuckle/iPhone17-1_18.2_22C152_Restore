@interface PHCarPlayMainMenuContainerViewController
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (NSArray)rootViewControllerDictionaries;
- (PHCarPlayMainMenuContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITabBarController)rootViewController;
- (UIView)centralAreaContainerView;
- (UIViewController)selectedViewController;
- (id)navigationItem;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_initializeRootViewControllerDictionaries;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)setCentralAreaContainerView:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setRootViewControllerDictionaries:(id)a3;
- (void)setSelectedViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PHCarPlayMainMenuContainerViewController

- (PHCarPlayMainMenuContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayMainMenuContainerViewController;
  v4 = [(PHCarPlayMainMenuContainerViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(PHCarPlayMainMenuContainerViewController *)v4 _initializeRootViewControllerDictionaries];
  }
  return v5;
}

- (void)loadView
{
  id v50 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 400.0, 240.0];
  -[PHCarPlayMainMenuContainerViewController setView:](self, "setView:");
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 400.0, 240.0];
  [v3 setAutoresizingMask:18];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setOpaque:0];
  v5 = [(PHCarPlayMainMenuContainerViewController *)self view];
  [v5 addSubview:v3];

  v48 = v3;
  [(PHCarPlayMainMenuContainerViewController *)self setCentralAreaContainerView:v3];
  id v6 = objc_alloc_init((Class)UITabBarController);
  objc_super v7 = [v6 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(PHCarPlayMainMenuContainerViewController *)self centralAreaContainerView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v6 view];
  [v17 setFrame:v10, v12, v14, v16];

  [(PHCarPlayMainMenuContainerViewController *)self addChildViewController:v6];
  [(PHCarPlayMainMenuContainerViewController *)self setRootViewController:v6];
  [(PHCarPlayMainMenuContainerViewController *)self setSelectedViewController:v6];
  v18 = [(PHCarPlayMainMenuContainerViewController *)self selectedViewController];
  [v18 didMoveToParentViewController:self];

  v19 = [(PHCarPlayMainMenuContainerViewController *)self centralAreaContainerView];
  v20 = [(PHCarPlayMainMenuContainerViewController *)self selectedViewController];
  v21 = [v20 view];
  [v19 addSubview:v21];

  v57[0] = @"rootView";
  v47 = v6;
  v22 = [v6 view];
  v57[1] = @"centerContainer";
  v58[0] = v22;
  v23 = [(PHCarPlayMainMenuContainerViewController *)self centralAreaContainerView];
  v58[1] = v23;
  uint64_t v24 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];

  v25 = [(PHCarPlayMainMenuContainerViewController *)self view];
  v26 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[rootView]|" options:0 metrics:0 views:v24];
  [v25 addConstraints:v26];

  v27 = [(PHCarPlayMainMenuContainerViewController *)self view];
  v46 = (void *)v24;
  v28 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rootView]|" options:0 metrics:0 views:v24];
  [v27 addConstraints:v28];

  v29 = +[NSMutableArray array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v49 = self;
  id obj = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
  id v30 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v53;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v35 = [v34 objectForKeyedSubscript:@"kPHCarPlayMenuItemControllerName"];
        id v36 = objc_alloc_init(NSClassFromString(v35));

        v37 = [v34 objectForKeyedSubscript:@"kPHCarPlayMenuItemTitle"];
        v38 = [v36 navigationItem];
        [v38 setTitle:v37];

        id v39 = objc_alloc((Class)UITabBarItem);
        v40 = [v34 objectForKeyedSubscript:@"kPHCarPlayMenuIconImageName"];
        v41 = +[UIImage systemImageNamed:v40];
        id v42 = [v39 initWithTitle:0 image:v41 tag:0];

        v43 = [v34 objectForKeyedSubscript:@"kPHCarPlayMenuItemTitle"];
        [v42 setTitle:v43];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v44 = [v36 badgeString];
          [v42 setBadgeValue:v44];
        }
        [v36 setTabBarItem:v42];
        [v34 setValue:v36 forKey:@"kPHCarPlayMenuItemControllerInstance"];
        [v29 addObject:v36];
      }
      id v31 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v31);
  }

  id v45 = v47;
  [v45 setViewControllers:v29 animated:0];
  [v45 setDelegate:v49];
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  id v6 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
  unsigned __int8 v7 = [v6 isVisualVoicemailAvailable];

  if (v7) {
    return 1;
  }
  double v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarPlay Voicemail Tab Selected, but visual voicemail is not available. Calling voicemail instead.", v10, 2u);
  }

  return [UIApp dialVoicemail] ^ 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = [a3 dequeueReusableCellWithIdentifier:@"PHCarPlayMainMenuContainerViewController"];
  if (!v7) {
    unsigned __int8 v7 = [[PHCarPlayHardwareMenuTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"PHCarPlayMainMenuContainerViewController"];
  }
  v8 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
  id v9 = [v6 row];

  double v10 = [v8 objectAtIndex:v9];

  double v11 = [v10 objectForKeyedSubscript:@"kPHCarPlayMenuItemTitle"];
  double v12 = [(PHCarPlayHardwareMenuTableViewCell *)v7 mainLabel];
  [v12 setText:v11];

  double v13 = [v10 objectForKeyedSubscript:@"kPHCarPlayMenuIconImageName"];
  double v14 = +[UIImage phCarPlayImageNamed:v13];
  double v15 = [(PHCarPlayHardwareMenuTableViewCell *)v7 iconImageView];
  [v15 setImage:v14];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
  v8 = [v7 objectAtIndex:[v13 row]];

  id v9 = [v8 valueForKey:@"kPHCarPlayMenuItemControllerInstance"];
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [0 topViewController];
    }
    else
    {
      double v10 = [v8 objectForKeyedSubscript:@"kPHCarPlayMenuItemTitle"];
      double v11 = [0 navigationItem];
      [v11 setTitle:v10];

      id v9 = 0;
    }
  }
  [v6 deselectRowAtIndexPath:v13 animated:0];
  [v6 highlightRowAtIndexPath:v13 animated:0 scrollPosition:0];

  double v12 = [(PHCarPlayMainMenuContainerViewController *)self navigationController];
  [v12 pushViewController:v9 animated:1];
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scheme];
  id v6 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      id v9 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
      double v10 = [v9 objectAtIndexedSubscript:v8];
      double v11 = [v10 objectForKeyedSubscript:@"kPHCarPlayMenuItemDeepLinkScheme"];

      if ([v5 isEqualToString:v11]) {
        break;
      }

      ++v8;
      double v12 = [(PHCarPlayMainMenuContainerViewController *)self rootViewControllerDictionaries];
      id v13 = [v12 count];

      if ((unint64_t)v13 <= v8) {
        goto LABEL_9;
      }
    }
    double v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v58 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Switching to CarPlay tab: %i.", buf, 8u);
    }

    double v15 = [(PHCarPlayMainMenuContainerViewController *)self rootViewController];
    [v15 setSelectedIndex:v8];
  }
LABEL_9:
  if ([v5 isEqualToString:@"mobilephone-contacts"])
  {
    double v16 = [(PHCarPlayMainMenuContainerViewController *)self rootViewController];
    v17 = [v16 selectedViewController];

    v18 = [v4 host];
    v19 = [v18 lowercaseString];

    if (!v19 || ![v19 isEqualToString:@"show"]) {
      goto LABEL_29;
    }
    v48 = v17;
    v20 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:0];
    v21 = [v20 queryItems];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v49 objects:v56 count:16];
    uint64_t v24 = v22;
    if (v23)
    {
      id v25 = v23;
      id v46 = v4;
      v47 = v19;
      uint64_t v24 = 0;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v29 = [v28 name];
          unsigned int v30 = [v29 isEqualToString:@"id"];

          if (v30)
          {
            uint64_t v31 = [v28 value];

            uint64_t v24 = (void *)v31;
          }
        }
        id v25 = [v22 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v25);

      id v4 = v46;
      v19 = v47;
      if (!v24) {
        goto LABEL_28;
      }
      uint64_t v32 = +[PHApplicationServices sharedInstance];
      v33 = [v32 contactStore];

      v34 = +[CNContactViewController descriptorForRequiredKeys];
      long long v55 = v34;
      v35 = +[NSArray arrayWithObjects:&v55 count:1];
      id v36 = [v33 contactForIdentifier:v24 keysToFetch:v35];

      if (v36)
      {
        v37 = PHDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Loading Contact Into Tab", buf, 2u);
        }

        v38 = [v48 delegate];
        [v38 contactListViewController:v48 didSelectContact:v36];

        v19 = v47;
      }
    }
LABEL_28:

    v17 = v48;
LABEL_29:
  }
  if ([v5 isEqualToString:@"vmshow"])
  {
    id v39 = [v4 voicemailMessageUUID];
    if (([UIApp hasEnhancedVoicemail] & 1) != 0 || v39)
    {
      if (v39 || [UIApp hasEnhancedVoicemail])
      {
        v40 = [v4 voicemailMessageUUID];
        if (v40)
        {
          v41 = [[MPMessageID alloc] initWithUuid:v40];
          if (v41) {
            goto LABEL_42;
          }
        }
        id v42 = PHDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          -[PHVoicemailNavigationController handleURL:]((uint64_t)v4, v42);
        }

        uint64_t v43 = (uint64_t)[v4 voicemailRecordID];
        if (v43 >= 1)
        {
          v41 = [[MPMessageID alloc] initWithValue:v43];
          if (v41)
          {
LABEL_42:
            v44 = +[NSNotificationCenter defaultCenter];
            CFStringRef v53 = @"kPHCarPlayVoicemailViewControllerVoicemailIDKey";
            long long v54 = v41;
            id v45 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            [v44 postNotificationName:@"PHCarPlayVoicemailViewControllerPlayVoicemailEventNotification" object:0 userInfo:v45];
          }
        }
      }
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_25);
    }
  }
}

void __54__PHCarPlayMainMenuContainerViewController_handleURL___block_invoke(id a1)
{
}

- (void)_initializeRootViewControllerDictionaries
{
  v36[0] = @"kPHCarPlayMenuItemTitle";
  uint64_t v26 = +[NSBundle bundleForClass:objc_opt_class()];
  id v25 = [v26 localizedStringForKey:@"FAVORITES" value:&stru_100285990 table:@"PHCarPlay"];
  v37[0] = v25;
  v37[1] = @"star.fill";
  v36[1] = @"kPHCarPlayMenuIconImageName";
  v36[2] = @"kPHCarPlayMenuItemControllerName";
  v36[3] = @"kPHCarPlayMenuItemDeepLinkScheme";
  v37[2] = @"PHCarPlayFavoritesViewController";
  v37[3] = @"mobilephone-favorites";
  uint64_t v24 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
  id v23 = +[NSMutableDictionary dictionaryWithDictionary:v24];
  v38[0] = v23;
  v34[0] = @"kPHCarPlayMenuItemTitle";
  id v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v22 localizedStringForKey:@"RECENTS" value:&stru_100285990 table:@"PHCarPlay"];
  v35[0] = v21;
  v35[1] = @"clock.fill";
  v34[1] = @"kPHCarPlayMenuIconImageName";
  v34[2] = @"kPHCarPlayMenuItemControllerName";
  v34[3] = @"kPHCarPlayMenuItemDeepLinkScheme";
  v35[2] = @"PHCarPlayRecentsViewController";
  v35[3] = @"mobilephone-recents";
  v20 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
  id v3 = +[NSMutableDictionary dictionaryWithDictionary:v20];
  v38[1] = v3;
  v32[0] = @"kPHCarPlayMenuItemTitle";
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CONTACTS" value:&stru_100285990 table:@"PHCarPlay"];
  v33[0] = v5;
  v33[1] = @"person.crop.circle.fill";
  v32[1] = @"kPHCarPlayMenuIconImageName";
  v32[2] = @"kPHCarPlayMenuItemControllerName";
  v32[3] = @"kPHCarPlayMenuItemDeepLinkScheme";
  v33[2] = @"CNStarkContactsListViewController";
  v33[3] = @"mobilephone-contacts";
  id v6 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  v38[2] = v7;
  v30[0] = @"kPHCarPlayMenuItemTitle";
  v27 = self;
  unint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"KEYPAD" value:&stru_100285990 table:@"PHCarPlay"];
  v31[0] = v9;
  v31[1] = @"circle.grid.3x3.fill";
  v30[1] = @"kPHCarPlayMenuIconImageName";
  v30[2] = @"kPHCarPlayMenuItemControllerName";
  v30[3] = @"kPHCarPlayMenuItemDeepLinkScheme";
  v31[2] = @"PHCarPlayDialerViewController";
  v31[3] = @"mobilephone-keypad";
  double v10 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  double v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];
  v38[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v38 count:4];

  if (PHShouldHideVoicemailUI())
  {
    id v13 = v27;
  }
  else
  {
    v28[0] = @"kPHCarPlayMenuItemTitle";
    id v13 = v27;
    double v14 = +[NSBundle bundleForClass:objc_opt_class()];
    double v15 = [v14 localizedStringForKey:@"VOICEMAIL" value:&stru_100285990 table:@"PHCarPlay"];
    v29[0] = v15;
    v29[1] = @"recordingtape";
    v28[1] = @"kPHCarPlayMenuIconImageName";
    v28[2] = @"kPHCarPlayMenuItemControllerName";
    v28[3] = @"kPHCarPlayMenuItemDeepLinkScheme";
    v29[2] = @"PHCarPlayVoicemailViewController";
    v29[3] = @"vmshow";
    double v16 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];
    uint64_t v18 = [v12 arrayByAddingObject:v17];

    double v12 = (void *)v18;
  }
  v19 = +[NSMutableArray arrayWithArray:v12];
  [(PHCarPlayMainMenuContainerViewController *)v13 setRootViewControllerDictionaries:v19];
}

- (id)navigationItem
{
  id v3 = [(PHCarPlayMainMenuContainerViewController *)self selectedViewController];
  id v4 = [v3 selectedViewController];
  id v5 = [v4 navigationItem];

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PHCarPlayMainMenuContainerViewController;
    id v5 = [(PHCarPlayMainMenuContainerViewController *)&v7 navigationItem];
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  id v3 = [(PHCarPlayMainMenuContainerViewController *)self selectedViewController];

  if (v3)
  {
    id v4 = [(PHCarPlayMainMenuContainerViewController *)self selectedViewController];
    unint64_t v8 = v4;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHCarPlayMainMenuContainerViewController;
    id v5 = [(PHCarPlayMainMenuContainerViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (NSArray)rootViewControllerDictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRootViewControllerDictionaries:(id)a3
{
}

- (UIView)centralAreaContainerView
{
  return (UIView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCentralAreaContainerView:(id)a3
{
}

- (UIViewController)selectedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelectedViewController:(id)a3
{
}

- (UITabBarController)rootViewController
{
  return (UITabBarController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_selectedViewController, 0);
  objc_storeStrong((id *)&self->_centralAreaContainerView, 0);

  objc_storeStrong((id *)&self->_rootViewControllerDictionaries, 0);
}

@end