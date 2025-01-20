@interface HSPCUseSiriMultipleAccessoryViewController
- (BOOL)_deviceIsOnAMultiUserLanguage;
- (BOOL)_isVoiceRecognitionEnabled;
- (BOOL)_shouldEnableShareSiriAnalytics;
- (HSPCUseSiriMultipleAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)siriEndpointAccessories;
- (NSMutableSet)selectedAccessories;
- (PRXAction)useSiriAction;
- (UITableView)tableView;
- (id)_applyOnboardingSelections:(BOOL)a3;
- (id)_disableSiri;
- (id)commitConfiguration;
- (id)dismissButtonBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleFooterLabelTouchForOpenURL:(id)a3;
- (void)_launchSiriPrivacySheet;
- (void)_updateUseSiriButtonEnabledState;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSelectedAccessories:(id)a3;
- (void)setSiriEndpointAccessories:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUseSiriAction:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCUseSiriMultipleAccessoryViewController

- (HSPCUseSiriMultipleAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v10 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v9];
  v59.receiver = self;
  v59.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  v11 = [(HSPCUseSiriMultipleAccessoryViewController *)&v59 initWithContentView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    id v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    [v9 setDelegate:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    [WeakRetained setDataSource:v12];

    id v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v15 setAllowsMultipleSelection:1];

    v16 = +[UIColor systemBackgroundColor];
    id v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v17 setBackgroundColor:v16];

    id v18 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v18 setRowHeight:44.0];

    +[HSPCRow leadingSeparatorMargin];
    double v20 = v19;
    id v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v21 setSeparatorInset:0.0, v20, 0.0, 0.0];

    id v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v22 _setTopPadding:0.0];

    id v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v23 _setBottomPadding:0.0];

    id v24 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v24 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

    v25 = HULocalizedString();
    [(HSPCUseSiriMultipleAccessoryViewController *)v12 setTitle:v25];

    v26 = HULocalizedString();
    [(HSPCUseSiriMultipleAccessoryViewController *)v12 setSubtitle:v26];

    v27 = HULocalizedString();
    uint64_t v28 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 addProminentButtonWithLocalizedTitle:v27 target:v12 futureSelector:"commitConfiguration"];
    useSiriAction = v12->_useSiriAction;
    v12->_useSiriAction = (PRXAction *)v28;

    v30 = HULocalizedString();
    id v31 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 addOptionalButtonWithLocalizedTitle:v30 target:v12 futureSelector:"_disableSiri"];

    v32 = [v7 topAccessoryTuple];
    v33 = +[NSMutableArray arrayWithObject:v32];

    v34 = [v7 bridgedAccessories];
    [v33 addObjectsFromArray:v34];

    v35 = (NSArray *)[v33 copy];
    siriEndpointAccessories = v12->_siriEndpointAccessories;
    v12->_siriEndpointAccessories = v35;

    uint64_t v37 = +[NSMutableSet setWithArray:v12->_siriEndpointAccessories];
    selectedAccessories = v12->_selectedAccessories;
    v12->_selectedAccessories = (NSMutableSet *)v37;

    v39 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
    [v39 setIsPlaybackInfluencesForYouEnabled:1];

    v40 = +[AFPreferences sharedPreferences];
    id v41 = [v40 siriDataSharingOptInStatus];

    BOOL v42 = v41 == (id)1;
    v43 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
    [v43 setIsShareSiriAnalyticsEnabled:v42];

    id v44 = +[HFManagedConfigurationUtilities isExplicitContentAllowed];
    v45 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
    [v45 setIsExplicitContentAllowed:v44];

    v46 = HFLogForCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v57 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
      id v58 = v10;
      unsigned int v47 = [v57 isPlaybackInfluencesForYouEnabled];
      v48 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
      v49 = v33;
      id v50 = v9;
      id v51 = v8;
      id v52 = v7;
      unsigned int v53 = [v48 isShareSiriAnalyticsEnabled];
      v54 = [(HSPCUseSiriMultipleAccessoryViewController *)v12 config];
      unsigned int v55 = [v54 isExplicitContentAllowed];
      *(_DWORD *)buf = 67109632;
      unsigned int v61 = v47;
      id v10 = v58;
      __int16 v62 = 1024;
      unsigned int v63 = v53;
      id v7 = v52;
      id v8 = v51;
      id v9 = v50;
      v33 = v49;
      __int16 v64 = 1024;
      unsigned int v65 = v55;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "isPlaybackInfluencesForYouEnabled = %{BOOL}d | isShareSiriAnalyticsEnabled = %{BOOL}d | isExplicitContentAllowed = %{BOOL}d", buf, 0x14u);
    }
  }

  return v12;
}

- (id)commitConfiguration
{
  return [(HSPCUseSiriMultipleAccessoryViewController *)self _applyOnboardingSelections:0];
}

- (void)viewDidLoad
{
  v54.receiver = self;
  v54.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  [(HSPCUseSiriMultipleAccessoryViewController *)&v54 viewDidLoad];
  v3 = +[PRXLabel labelWithStyle:3];
  uint64_t v4 = HULocalizedString();
  id v5 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v59 = NSForegroundColorAttributeName;
  v6 = +[UIColor hf_keyColor];
  v60 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  id v8 = [v5 initWithString:v4 attributes:v7];

  id v9 = objc_alloc((Class)NSMutableAttributedString);
  id v10 = HULocalizedString();
  id v11 = [v9 initWithString:v10];

  unsigned int v47 = v8;
  [v11 appendAttributedString:v8];
  v46 = v11;
  id v12 = [v11 copy];
  [v3 setAttributedText:v12];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setUserInteractionEnabled:1];
  id v13 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  CFStringRef v57 = @"URL_KEY";
  v14 = +[HFURLComponents siriPrivacyURL];
  id v58 = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v48 = (void *)v4;
  id v16 = [v13 initWithTarget:self action:"_handleFooterLabelTouchForOpenURL:" hitBoxString:v4 userInfo:v15];

  id v44 = v16;
  [v3 addGestureRecognizer:v16];
  id v17 = [(HSPCUseSiriMultipleAccessoryViewController *)self view];
  v49 = v3;
  [v17 addSubview:v3];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v45 = self;
  id v18 = [(HSPCUseSiriMultipleAccessoryViewController *)self contentView];
  double v19 = [v18 actionButtons];

  id v20 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v20)
  {
    id v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v51;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v26 = [v25 currentTitle];
        v27 = HULocalizedString();
        unsigned int v28 = [v26 isEqualToString:v27];

        if (v28)
        {
          id v29 = v25;

          id v22 = v29;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }

  BOOL v42 = [v49 centerXAnchor];
  v43 = [(HSPCUseSiriMultipleAccessoryViewController *)v45 contentView];
  id v41 = [v43 mainContentGuide];
  v40 = [v41 centerXAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v55[0] = v39;
  v38 = [v49 bottomAnchor];
  v30 = [v22 topAnchor];
  id v31 = [v38 constraintEqualToAnchor:v30 constant:-10.0];
  v55[1] = v31;
  v32 = [v49 widthAnchor];
  v33 = [(HSPCUseSiriMultipleAccessoryViewController *)v45 contentView];
  v34 = [v33 mainContentGuide];
  v35 = [v34 widthAnchor];
  v36 = [v32 constraintLessThanOrEqualToAnchor:v35];
  v55[2] = v36;
  uint64_t v37 = +[NSArray arrayWithObjects:v55 count:3];
  +[NSLayoutConstraint activateConstraints:v37];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  [(HSPCUseSiriMultipleAccessoryViewController *)&v16 viewWillAppear:a3];
  uint64_t v4 = [(HSPCUseSiriMultipleAccessoryViewController *)self tableView];
  [v4 reloadData];

  id v5 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  uint64_t v6 = (uint64_t)[v5 count];

  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = +[NSIndexPath indexPathForRow:v7 inSection:0];
      id v9 = [(HSPCUseSiriMultipleAccessoryViewController *)self tableView];
      [v9 selectRowAtIndexPath:v8 animated:1 scrollPosition:0];

      ++v7;
      id v10 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
      id v11 = [v10 count];
    }
    while (v7 < (uint64_t)v11);
  }
  id v12 = [(HSPCUseSiriMultipleAccessoryViewController *)self tableView];
  [v12 layoutIfNeeded];

  id v13 = [(HSPCUseSiriMultipleAccessoryViewController *)self contentView];
  [v13 setNeedsUpdateConstraints];

  v14 = [(HSPCUseSiriMultipleAccessoryViewController *)self view];
  [v14 bounds];
  [(HSPCUseSiriMultipleAccessoryViewController *)self updatePreferredContentSizeForCardWidth:v15];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 cellForRowAtIndexPath:v6];
  [v7 setAccessoryType:3];
  id v8 = [(HSPCUseSiriMultipleAccessoryViewController *)self selectedAccessories];
  id v9 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  id v10 = [v9 objectAtIndexedSubscript:[v6 row]];
  [v8 addObject:v10];

  [(HSPCUseSiriMultipleAccessoryViewController *)self _updateUseSiriButtonEnabledState];

  return v6;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 cellForRowAtIndexPath:v6];
  [v7 setAccessoryType:0];
  id v8 = [(HSPCUseSiriMultipleAccessoryViewController *)self selectedAccessories];
  id v9 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  id v10 = [v9 objectAtIndexedSubscript:[v6 row]];
  [v8 removeObject:v10];

  [(HSPCUseSiriMultipleAccessoryViewController *)self _updateUseSiriButtonEnabledState];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  id v8 = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  id v9 = [v6 row];

  id v10 = [v8 objectAtIndexedSubscript:v9];
  [v7 updateUIWithTuple:v10];

  [v7 setAccessoryType:3];

  return v7;
}

- (id)dismissButtonBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000185C8;
  v4[3] = &unk_1000A90B0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (id)_disableSiri
{
  return [(HSPCUseSiriMultipleAccessoryViewController *)self _applyOnboardingSelections:1];
}

- (id)_applyOnboardingSelections:(BOOL)a3
{
  BOOL v35 = a3;
  uint64_t v37 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(HSPCUseSiriMultipleAccessoryViewController *)self siriEndpointAccessories];
  id v38 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v45;
    *(void *)&long long v4 = 138412546;
    long long v33 = v4;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v7 = [v6 accessory];
        v39 = [v7 hf_siriEndpointProfile];
        id v8 = [(HSPCUseSiriMultipleAccessoryViewController *)self selectedAccessories];
        unsigned int v9 = [v8 containsObject:v6];

        id v10 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
        v40 = v7;
        id v11 = [v7 hf_isDumbSpeaker];
        id v12 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
        id v13 = [v12 isPlaybackInfluencesForYouEnabled];
        v14 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
        double v15 = v14;
        if (!v9 || v35)
        {
          id v18 = [v10 initWithSiriEnabled:1 allowHeySiri:0 airPlayEnabled:v11 playbackInfluencesForYouEnabled:v13 shareSiriAnalyticsEnabled:0 explicitContentAllowed:[v14 isExplicitContentAllowed]];
        }
        else
        {
          id v16 = [v14 isShareSiriAnalyticsEnabled];
          id v17 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
          id v18 = [v10 initWithSiriEnabled:1 allowHeySiri:1 airPlayEnabled:v11 playbackInfluencesForYouEnabled:v13 shareSiriAnalyticsEnabled:v16 explicitContentAllowed:[v17 isExplicitContentAllowed]];
        }
        double v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v6 accessory];
          *(_DWORD *)buf = v33;
          id v49 = v18;
          __int16 v50 = 2112;
          long long v51 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections %@ for accessory %@", buf, 0x16u);
        }
        id v21 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
        [v21 setOnboardingSelections:v18];

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100018AA0;
        v41[3] = &unk_1000A9600;
        id v42 = v39;
        id v43 = v18;
        id v22 = v18;
        id v23 = v39;
        id v24 = +[NAScheduler globalAsyncScheduler];
        v25 = +[NAFuture futureWithBlock:v41 scheduler:v24];
        v26 = +[NAScheduler mainThreadScheduler];
        v27 = [v25 reschedule:v26];

        [v37 addObject:v27];
      }
      id v38 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v38);
  }

  if ([(HSPCUseSiriMultipleAccessoryViewController *)self _shouldEnableShareSiriAnalytics])
  {
    +[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForMultipleAccessories:self];
  }
  else
  {
    +[NAFuture futureWithNoResult];
  unsigned int v28 = };
  [v37 addObject:v28];
  id v29 = &off_1000B0040;
  if (![(HSPCUseSiriMultipleAccessoryViewController *)self _isVoiceRecognitionEnabled]
    && [(HSPCUseSiriMultipleAccessoryViewController *)self _deviceIsOnAMultiUserLanguage]&& !v35)
  {
    id v29 = &off_1000B0058;
  }
  v30 = +[NAFuture futureWithResult:v29];
  [v37 addObject:v30];

  id v31 = +[NAFuture chainFutures:v37];

  return v31;
}

- (void)_handleFooterLabelTouchForOpenURL:(id)a3
{
  long long v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"URL_KEY"];

  if (v5)
  {
    id v6 = +[HFURLComponents siriPrivacyURL];
    unsigned int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Launching Siri privacy sheet", v10, 2u);
      }

      [(HSPCUseSiriMultipleAccessoryViewController *)self _launchSiriPrivacySheet];
    }
  }
  else
  {
    unsigned int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006603C(v9);
    }

    NSLog(@"Footer link pressed w/ url intention but no url found");
  }
}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3 = [(HSPCUseSiriMultipleAccessoryViewController *)self navigationController];
  long long v4 = (void *)v3;
  if (v3) {
    id v5 = (HSPCUseSiriMultipleAccessoryViewController *)v3;
  }
  else {
    id v5 = self;
  }
  id v6 = v5;

  id v7 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:OBPrivacySiriIdentifier];
  [v7 setPresentingViewController:v6];

  [v7 present];
}

- (BOOL)_isVoiceRecognitionEnabled
{
  id v4 = objc_alloc((Class)HFUserItem);
  id v5 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
  id v6 = [v5 home];
  id v7 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
  id v8 = [v7 home];
  unsigned int v9 = [v8 currentUser];
  id v10 = [v4 initWithHome:v6 user:v9 nameStyle:0];

  unsigned int v11 = [v10 isIdentifyVoiceEnabled];
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(a2);
    int v15 = 138412802;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
  }
  return v11;
}

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  uint64_t v3 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (v3)
  {
    unsigned __int8 v4 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v3 shouldFallbackToBestSupportedLanguage:1];
  }
  else
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100065F18(a2, v5);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_updateUseSiriButtonEnabledState
{
  id v5 = [(HSPCUseSiriMultipleAccessoryViewController *)self selectedAccessories];
  BOOL v3 = [v5 count] != 0;
  unsigned __int8 v4 = [(HSPCUseSiriMultipleAccessoryViewController *)self useSiriAction];
  [v4 setEnabled:v3];
}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  BOOL v3 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
  if ([v3 isShareSiriAnalyticsEnabled])
  {
    unsigned __int8 v4 = [(HSPCUseSiriMultipleAccessoryViewController *)self config];
    id v5 = [v4 onboardingSelections];
    unsigned __int8 v6 = [v5 allowHeySiri];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (PRXAction)useSiriAction
{
  return self->_useSiriAction;
}

- (void)setUseSiriAction:(id)a3
{
}

- (NSArray)siriEndpointAccessories
{
  return self->_siriEndpointAccessories;
}

- (void)setSiriEndpointAccessories:(id)a3
{
}

- (NSMutableSet)selectedAccessories
{
  return self->_selectedAccessories;
}

- (void)setSelectedAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAccessories, 0);
  objc_storeStrong((id *)&self->_siriEndpointAccessories, 0);
  objc_storeStrong((id *)&self->_useSiriAction, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end