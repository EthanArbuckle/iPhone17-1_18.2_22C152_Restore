@interface AXHapticMusicController
- (BOOL)_showUserStudySpecifiers;
- (BOOL)isPlayingSample;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_nowPlayingValue:(id)a3;
- (id)_serviceName;
- (id)enhancedPercussionEnabled:(id)a3;
- (id)enhancedVocalsEnabled:(id)a3;
- (id)hapticMusicEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)_endNowPlayingSession;
- (void)_fetchUpdatePlayingInformation;
- (void)_generateAppSpecifiers;
- (void)_handleNowPlayingActivation;
- (void)_startSample;
- (void)_stopSample;
- (void)_toggleSample:(id)a3;
- (void)_updateNowPlayingGroup;
- (void)_updateNowPlayingGroupWithInfo:(id)a3;
- (void)_updateNowPlayingInfo:(double)a3;
- (void)_updatePlaySampleString:(id)a3 reload:(BOOL)a4;
- (void)dealloc;
- (void)doneButtonTapped:(id)a3;
- (void)setEnhancedPercussionEnabled:(id)a3 specifier:(id)a4;
- (void)setEnhancedVocalsEnabled:(id)a3 specifier:(id)a4;
- (void)setHapticMusicEnabled:(id)a3 specifier:(id)a4;
- (void)setIsPlayingSample:(BOOL)a3;
- (void)showHapticMusicLearnMore;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleSample:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation AXHapticMusicController

- (BOOL)_showUserStudySpecifiers
{
  int v2 = _AXSHapticMusicEnabled();
  if (v2)
  {
    LOBYTE(v2) = AXIsInternalInstall();
  }
  return v2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)AXHapticMusicController;
  [(AXHapticMusicController *)&v10 viewDidLoad];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_settingsChange, kAXSHapticMusicPreferenceDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
  objc_initWeak(&location, self);
  v4 = +[MAMusicHapticsManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __38__AXHapticMusicController_viewDidLoad__block_invoke;
  v7[3] = &unk_20B470;
  objc_copyWeak(&v8, &location);
  v5 = [v4 addStatusObserver:v7];
  statusObserverToken = self->_statusObserverToken;
  self->_statusObserverToken = v5;

  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__AXHapticMusicController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = AXLogHapticMusic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[NSNumber numberWithBool:a3];
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Haptic Status for sample: %@, Active: %@", (uint8_t *)&v9, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchUpdatePlayingInformation];
}

id __38__AXHapticMusicController_viewDidLoad__block_invoke_274(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateAppSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXHapticMusicController;
  [(AccessibilitySettingsBaseController *)&v4 viewWillAppear:a3];
  [(AXHapticMusicController *)self _updateNowPlayingGroup];
}

- (void)dealloc
{
  if (self->_notificationToken)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_notificationToken];
  }
  objc_super v4 = +[MAMusicHapticsManager sharedManager];
  [v4 removeStatusObserver:self->_statusObserverToken];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v6.receiver = self;
  v6.super_class = (Class)AXHapticMusicController;
  [(AccessibilitySettingsBaseController *)&v6 dealloc];
}

- (id)specifiers
{
  v3 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    id v5 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v6 = AXUILocalizedStringForKeyWithTable();
    uint64_t v7 = AXUILocalizedStringForKeyWithTable();
    v47 = (void *)v6;
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v5 setProperty:v10 forKey:PSFooterCellClassGroupKey];

    [v5 setProperty:v8 forKey:PSFooterHyperlinkViewTitleKey];
    v45 = v8;
    v46 = (void *)v7;
    v55.id location = (NSUInteger)[v8 rangeOfString:v7];
    __int16 v11 = NSStringFromRange(v55);
    [v5 setProperty:v11 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v12 = +[NSValue valueWithNonretainedObject:self];
    [v5 setProperty:v12 forKey:PSFooterHyperlinkViewTargetKey];

    v13 = NSStringFromSelector("showHapticMusicLearnMore");
    [v5 setProperty:v13 forKey:PSFooterHyperlinkViewActionKey];

    [v4 addObject:v5];
    v14 = AXUILocalizedStringForKeyWithTable();
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setHapticMusicEnabled:specifier:" get:"hapticMusicEnabled:" detail:0 cell:6 edit:0];

    uint64_t v16 = PSIDKey;
    [v15 setProperty:@"HapticMusic" forKey:PSIDKey];
    [v4 addObject:v15];
    if (_AXSHapticMusicEnabled())
    {
      v17 = +[PSSpecifier emptyGroupSpecifier];

      [v4 addObject:v17];
      v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [(AXHapticMusicController *)self _updatePlaySampleString:v15 reload:0];
      [v15 setButtonAction:"toggleSample:"];
      [v15 setProperty:@"ToggleSample" forKey:v16];
      [v4 addObject:v15];
    }
    if ([(NSMutableArray *)self->_appSpecifiers count])
    {
      v18 = AXUILocalizedStringForKeyWithTable();
      v19 = +[PSSpecifier groupSpecifierWithName:v18];

      v20 = AXUILocalizedStringForKeyWithTable();
      [v19 setProperty:v20 forKey:PSFooterTextGroupKey];

      [v4 addObject:v19];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v21 = self->_appSpecifiers;
      id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v50;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v50 != v24) {
              objc_enumerationMutation(v21);
            }
            [v4 addObject:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v23);
      }
    }
    if (![(AXHapticMusicController *)self _showUserStudySpecifiers]) {
      goto LABEL_21;
    }
    v26 = +[PSSpecifier groupSpecifierWithName:@"Algorithm Selection (INTERNAL)"];
    [v26 setProperty:@"Choose between algorithm styles." forKey:PSFooterTextGroupKey];
    [v4 addObject:v26];
    [v26 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v26 setProperty:@"AlgorithmSelection" forKey:v16];
    v27 = +[PSSpecifier preferenceSpecifierNamed:@"Default" target:0 set:0 get:0 detail:0 cell:3 edit:0];
    [v27 setProperty:@"Default" forKey:v16];
    [v4 addObject:v27];
    v28 = +[PSSpecifier preferenceSpecifierNamed:@"Balanced Mix" target:0 set:0 get:0 detail:0 cell:3 edit:0];
    [v28 setProperty:@"BalancedMix" forKey:v16];
    v44 = v28;
    [v4 addObject:v28];
    v29 = +[PSSpecifier preferenceSpecifierNamed:@"Dynamic Vocals" target:0 set:0 get:0 detail:0 cell:3 edit:0];
    [v29 setProperty:@"DynamicVocals" forKey:v16];
    [v4 addObject:v29];
    v30 = +[AXSettings sharedInstance];
    v31 = [v30 hapticMusicAlgorithmSelection];
    if ([v31 isEqualToString:SHHapticPatternAlgorithmDefault])
    {

      v32 = v27;
    }
    else
    {
      v33 = +[AXSettings sharedInstance];
      v34 = [v33 hapticMusicAlgorithmSelection];

      v32 = v27;
      if (v34)
      {
        v35 = +[AXSettings sharedInstance];
        v36 = [v35 hapticMusicAlgorithmSelection];
        unsigned __int8 v37 = [v36 isEqualToString:SHHapticPatternAlgorithmBalancedMixEnhancedDynamicRange];

        v32 = v44;
        if ((v37 & 1) == 0)
        {
          v38 = +[AXSettings sharedInstance];
          v39 = [v38 hapticMusicAlgorithmSelection];
          unsigned int v40 = [v39 isEqualToString:SHHapticPatternAlgorithmPriorityVocalsEnhancedDynamicRange];

          v32 = v29;
          if (!v40) {
            goto LABEL_20;
          }
        }
      }
    }
    [v26 setProperty:v32 forKey:PSRadioGroupCheckedSpecifierKey];
LABEL_20:

LABEL_21:
    [(AXHapticMusicController *)self setupLongTitleSpecifiers:v4];
    id v41 = [v4 copy];
    v42 = *(void **)&self->super.AXUISettingsListController_opaque[v48];
    *(void *)&self->super.AXUISettingsListController_opaque[v48] = v41;

    v3 = *(void **)&self->super.AXUISettingsListController_opaque[v48];
  }

  return v3;
}

- (void)_updateNowPlayingGroup
{
  if ([(AXHapticMusicController *)self _showUserStudySpecifiers])
  {
    if (!self->_client)
    {
      id v3 = objc_alloc((Class)AXUIClient);
      id v4 = [(AXHapticMusicController *)self _serviceName];
      id v5 = (AXUIClient *)[v3 initWithIdentifier:@"HapticMusicClient-Settings" serviceBundleName:v4];
      client = self->_client;
      self->_client = v5;
    }
    [(AXHapticMusicController *)self _fetchUpdatePlayingInformation];
  }
}

- (void)_fetchUpdatePlayingInformation
{
  if ([(AXHapticMusicController *)self _showUserStudySpecifiers])
  {
    id v3 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57__AXHapticMusicController__fetchUpdatePlayingInformation__block_invoke;
    block[3] = &unk_2087C0;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

void __57__AXHapticMusicController__fetchUpdatePlayingInformation__block_invoke(uint64_t a1)
{
  int v2 = AXLogHapticMusic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 264);
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Fetching now playing info: %@", buf, 0xCu);
  }

  id v4 = *(void **)(*(void *)(a1 + 32) + 264);
  id v10 = 0;
  id v5 = [v4 sendSynchronousMessage:&__NSDictionary0__struct withIdentifier:4 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = AXLogHapticMusic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__AXHapticMusicController__fetchUpdatePlayingInformation__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  id v8 = AXLogHapticMusic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Fetched now playing info: %@", buf, 0xCu);
  }

  id v9 = v5;
  AXPerformBlockOnMainThreadAfterDelay();
}

id __57__AXHapticMusicController__fetchUpdatePlayingInformation__block_invoke_347(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNowPlayingGroupWithInfo:*(void *)(a1 + 40)];
}

- (void)_updateNowPlayingGroupWithInfo:(id)a3
{
  id v26 = a3;
  id v4 = [(AXHapticMusicController *)self specifiers];
  id v5 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_48);

  [(AXHapticMusicController *)self setSpecifiers:v5];
  if ([v26 count])
  {
    id v6 = +[NSMutableArray array];
    uint64_t v24 = +[PSSpecifier groupSpecifierWithName:@"Track Information (INTERNAL)"];
    [v24 setProperty:@"NowPlayingGroup" forKey:PSIDKey];
    [v24 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v24];
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:@"Title" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];
    id v8 = [v26 objectForKeyedSubscript:@"title"];
    [v7 setProperty:v8 forKey:@"titleValue"];

    [v7 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v7];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:@"Artist" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    id v10 = [v26 objectForKeyedSubscript:@"artist"];
    [v9 setProperty:v10 forKey:@"titleValue"];

    [v9 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v9];
    __int16 v11 = +[PSSpecifier preferenceSpecifierNamed:@"Adam ID" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    [v26 objectForKeyedSubscript:@"adamID"];
    v12 = v25 = v5;
    v13 = +[NSString stringWithFormat:@"%@", v12];
    [v11 setProperty:v13 forKey:@"titleValue"];

    [v11 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v11];
    v14 = +[PSSpecifier preferenceSpecifierNamed:@"Haptics Version" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    v15 = [v26 objectForKeyedSubscript:@"version"];
    [v14 setProperty:v15 forKey:@"titleValue"];

    [v14 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v14];
    uint64_t v16 = +[PSSpecifier preferenceSpecifierNamed:@"Created On" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    v17 = [v26 objectForKeyedSubscript:@"createdDate"];
    [v16 setProperty:v17 forKey:@"titleValue"];

    [v16 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v16];
    v18 = +[PSSpecifier preferenceSpecifierNamed:@"Variant" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    v19 = [v26 objectForKeyedSubscript:@"variant"];
    [v18 setProperty:v19 forKey:@"titleValue"];

    [v18 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v18];
    v20 = +[PSSpecifier preferenceSpecifierNamed:@"Event Counts" target:self set:0 get:"_nowPlayingValue:" detail:0 cell:4 edit:0];

    v21 = [v26 objectForKeyedSubscript:@"transientEventCount"];
    id v22 = [v26 objectForKeyedSubscript:@"continuousEventCount"];
    id v23 = +[NSString stringWithFormat:@"%@ Transients / %@ Continuous", v21, v22];
    [v20 setProperty:v23 forKey:@"titleValue"];

    id v5 = v25;
    [v20 setProperty:@"NowPlayingGroup" forKey:@"Group"];
    [v6 addObject:v20];
    [(AXHapticMusicController *)self setupLongTitleSpecifiers:v6];
    [(AXHapticMusicController *)self insertContiguousSpecifiers:v6 afterSpecifierID:@"DynamicVocals"];
  }
}

BOOL __58__AXHapticMusicController__updateNowPlayingGroupWithInfo___block_invoke(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(PSSpecifier *)a2 propertyForKey:@"Group", a4];
  char v5 = [v4 isEqualToString:@"NowPlayingGroup"] ^ 1;

  return v5;
}

- (id)_nowPlayingValue:(id)a3
{
  return [a3 propertyForKey:@"titleValue"];
}

- (id)_serviceName
{
  return @"AXHapticMusicServer";
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AXHapticMusicController;
  id v6 = a4;
  [(AXHapticMusicController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v16.receiver, v16.super_class);

  id v8 = [(AXHapticMusicController *)self specifierAtIndex:[(AXHapticMusicController *)self indexOfGroup:v7]];
  uint64_t v9 = PSIDKey;
  id v10 = [v8 propertyForKey:PSIDKey];
  LODWORD(v6) = [v10 isEqualToString:@"AlgorithmSelection"];

  if (v6)
  {
    __int16 v11 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    v12 = [v11 propertyForKey:v9];

    if ([v12 isEqualToString:@"Default"])
    {
      v13 = +[AXSettings sharedInstance];
      v14 = v13;
      CFStringRef v15 = 0;
    }
    else if ([v12 isEqualToString:SHHapticPatternAlgorithmBalancedMixEnhancedDynamicRange])
    {
      v13 = +[AXSettings sharedInstance];
      v14 = v13;
      CFStringRef v15 = @"balanced_mix";
    }
    else
    {
      if (![v12 isEqualToString:SHHapticPatternAlgorithmPriorityVocalsEnhancedDynamicRange])
      {
LABEL_9:

        goto LABEL_10;
      }
      v13 = +[AXSettings sharedInstance];
      v14 = v13;
      CFStringRef v15 = @"priority_vocals";
    }
    [v13 setHapticMusicAlgorithmSelection:v15];

    goto LABEL_9;
  }
LABEL_10:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXHapticMusicController *)self specifierForIndexPath:v7];
  uint64_t v9 = [v8 propertyForKey:PSIDKey];
  unsigned int v10 = [v9 isEqualToString:@"AXHapticMusicPlaybackView"];

  if (v10)
  {
    double v11 = UITableViewAutomaticDimension;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXHapticMusicController;
    [(AXHapticMusicController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double v11 = v12;
  }

  return v11;
}

- (void)_updatePlaySampleString:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(AXHapticMusicController *)self isPlayingSample];
  id v6 = AXUILocalizedStringForKeyWithTable();
  [v7 setProperty:v6 forKey:PSTitleKey];
  [v7 setName:v6];
  if (v4) {
    [(AXHapticMusicController *)self reloadSpecifier:v7];
  }
}

- (void)toggleSample:(id)a3
{
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  char v5 = [v4 URLForResource:@"MusicHaptics_SampleTrack" withExtension:@"mp3"];
  [(AXHapticMusicController *)self _toggleSample:v5];

  id v6 = [(AXHapticMusicController *)self specifierForID:@"ToggleSample"];
  [(AXHapticMusicController *)self _updatePlaySampleString:v6 reload:1];
}

- (void)_endNowPlayingSession
{
  [(AVAudioSession *)self->_auxiliarySession setActive:0 error:0];
  MRMediaRemoteSetCanBeNowPlayingApplication();
  id v3 = +[UIApplication sharedApplication];
  [v3 endReceivingRemoteControlEvents];

  BOOL v4 = [(MPNowPlayingSession *)self->_nowPlayingSession nowPlayingInfoCenter];
  [v4 setNowPlayingInfo:0];

  char v5 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v6 = [v5 pauseCommand];
  [v6 removeTarget:self->_pauseToken];

  id v8 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v7 = [v8 playCommand];
  [v7 removeTarget:self->_playToken];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXHapticMusicController;
  [(AXHapticMusicController *)&v3 willResignActive];
  [(AXHapticMusicController *)self _stopSample];
  [(AXHapticMusicController *)self _endNowPlayingSession];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXHapticMusicController;
  [(AXHapticMusicController *)&v4 viewWillDisappear:a3];
  [(AXHapticMusicController *)self _stopSample];
  [(AXHapticMusicController *)self _endNowPlayingSession];
}

- (void)_stopSample
{
  [(AVPlayer *)self->_samplePlayer pause];
  [(AXHapticMusicController *)self setIsPlayingSample:0];
  [(AXHapticMusicController *)self _endNowPlayingSession];
  id v3 = [(AXHapticMusicController *)self specifierForID:@"ToggleSample"];
  [(AXHapticMusicController *)self _updatePlaySampleString:v3 reload:1];
}

- (void)_toggleSample:(id)a3
{
  id v4 = a3;
  if (!self->_samplePlayer)
  {
    char v5 = (AVPlayer *)[objc_alloc((Class)AVPlayer) initWithURL:v4];
    samplePlayer = self->_samplePlayer;
    self->_samplePlayer = v5;

    if (!self->_notificationToken)
    {
      objc_initWeak(&location, self);
      id v7 = +[NSNotificationCenter defaultCenter];
      id v8 = [(AVPlayer *)self->_samplePlayer currentItem];
      uint64_t v9 = +[NSOperationQueue mainQueue];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = __41__AXHapticMusicController__toggleSample___block_invoke;
      v34[3] = &unk_20B390;
      objc_copyWeak(&v35, &location);
      unsigned int v10 = [v7 addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:v8 queue:v9 usingBlock:v34];
      id notificationToken = self->_notificationToken;
      self->_id notificationToken = v10;

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    auxiliarySession = self->_auxiliarySession;
    if (!auxiliarySession)
    {
      v13 = +[AVAudioSession auxiliarySession];
      objc_super v14 = self->_auxiliarySession;
      self->_auxiliarySession = v13;

      CFStringRef v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:self selector:"_handleInterruption:" name:AVAudioSessionInterruptionNotification object:self->_auxiliarySession];

      auxiliarySession = self->_auxiliarySession;
    }
    [(AVPlayer *)self->_samplePlayer setAudioSession:auxiliarySession];
    [(AVAudioSession *)self->_auxiliarySession setCategory:AVAudioSessionCategoryPlayback error:0];
    objc_initWeak(&location, self);
    objc_super v16 = self->_samplePlayer;
    CMTimeMakeWithSeconds(&v33, 0.01, 1000000000);
    v17 = +[NSValue valueWithCMTime:&v33];
    v38 = v17;
    v18 = +[NSArray arrayWithObjects:&v38 count:1];
    id v19 = &_dispatch_main_q;
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = __41__AXHapticMusicController__toggleSample___block_invoke_2;
    v30 = &unk_208BB8;
    objc_copyWeak(&v32, &location);
    v31 = self;
    id v20 = [(AVPlayer *)v16 addBoundaryTimeObserverForTimes:v18 queue:&_dispatch_main_q usingBlock:&v27];

    id v21 = objc_alloc((Class)MPNowPlayingSession);
    unsigned __int8 v37 = self->_samplePlayer;
    id v22 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1, v27, v28, v29, v30);
    id v23 = (MPNowPlayingSession *)[v21 initWithPlayers:v22];
    nowPlayingSession = self->_nowPlayingSession;
    self->_nowPlayingSession = v23;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  unsigned int v25 = [(AXHapticMusicController *)self isPlayingSample];
  id v26 = self->_auxiliarySession;
  if (v25)
  {
    [(AVAudioSession *)v26 setActive:0 error:0];
    [(AXHapticMusicController *)self _stopSample];
  }
  else
  {
    [(AVAudioSession *)v26 setActive:1 error:0];
    [(AXHapticMusicController *)self _startSample];
  }
}

void __41__AXHapticMusicController__toggleSample___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sampleFinished];
}

void __41__AXHapticMusicController__toggleSample___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 208);
    if (v3) {
      [v3 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    [WeakRetained _updateNowPlayingInfo:CMTimeGetSeconds(&time) + 0.01];
  }
}

- (void)_generateAppSpecifiers
{
  id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  appSpecifiers = self->_appSpecifiers;
  id v26 = self;
  self->_appSpecifiers = v3;

  char v5 = AXInstalledApps();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = AX_PreferencesBundleName;
    uint64_t v25 = PSIDKey;
    uint64_t v24 = PSLazyIconAppID;
    uint64_t v23 = PSLazyIconLoading;
    uint64_t v22 = PSIconImageKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (AXApplicationSupportsHapticMusic())
        {
          double v12 = [v11 bundleIdentifier];
          unsigned __int8 v13 = [v12 isEqualToString:v9];

          if ((v13 & 1) == 0)
          {
            objc_super v14 = [v11 localizedName];
            CFStringRef v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            objc_super v16 = [v11 bundleIdentifier];
            [v15 setProperty:v16 forKey:v25];

            v17 = [v11 bundleIdentifier];
            [v15 setProperty:v17 forKey:@"BundleIdentifier"];

            v18 = [v11 bundleIdentifier];
            LODWORD(v14) = AXFlipsIconRightToLeftForAppID(v18);

            id v19 = [v11 bundleIdentifier];
            id v20 = v19;
            if (v14)
            {
              id v21 = AXImageIconForAppID(v19);
              [v15 setProperty:v21 forKey:v22];
            }
            else
            {
              [v15 setProperty:v19 forKey:v24];

              [v15 setProperty:&__kCFBooleanTrue forKey:v23];
            }
            [(NSMutableArray *)v26->_appSpecifiers addObject:v15];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }
  [(AXHapticMusicController *)v26 reloadSpecifiers];
}

- (void)_startSample
{
  id v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 hapticMusicActive];

  if ((v4 & 1) == 0)
  {
    char v5 = +[AXSettings sharedInstance];
    [v5 setHapticMusicActive:1];

    id v6 = AXLogHapticMusic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting active state to on since sample was requested", (uint8_t *)&buf, 2u);
    }
  }
  [(AXHapticMusicController *)self setIsPlayingSample:1];
  MRMediaRemoteSetCanBeNowPlayingApplication();
  id v7 = [(MPNowPlayingSession *)self->_nowPlayingSession nowPlayingInfoCenter];
  [v7 setNowPlayingInfo:0];

  uint64_t v8 = +[UIApplication sharedApplication];
  [v8 beginReceivingRemoteControlEvents];

  uint64_t v9 = AXLogHapticMusic();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Starting playback sample", (uint8_t *)&buf, 2u);
  }

  samplePlayer = self->_samplePlayer;
  CMTimeMakeWithSeconds(&v15, 0.0, 1000000000);
  [(AVPlayer *)samplePlayer seekToTime:&v15];
  [(AVPlayer *)self->_samplePlayer play];
  objc_initWeak(&buf, self);
  nowPlayingSession = self->_nowPlayingSession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __39__AXHapticMusicController__startSample__block_invoke;
  v12[3] = &unk_20B4B8;
  v12[4] = self;
  objc_copyWeak(&v13, &buf);
  [(MPNowPlayingSession *)nowPlayingSession becomeActiveIfPossibleWithCompletion:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&buf);
}

void __39__AXHapticMusicController__startSample__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = AXLogHapticMusic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = +[NSNumber numberWithBool:a2];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Tried to make now playing active: %@", (uint8_t *)&v7, 0xCu);
  }
  if (a2)
  {
    [*(id *)(a1 + 32) _updateNowPlayingInfo:0.0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handleNowPlayingActivation];
  }
}

- (void)_updateNowPlayingInfo:(double)a3
{
  char v5 = AXLogHapticMusic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithDouble:a3];
    *(_DWORD *)id buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Posting now playing info: %@", buf, 0xCu);
  }
  int v7 = [(MPNowPlayingSession *)self->_nowPlayingSession nowPlayingInfoCenter];
  v14[0] = MPNowPlayingInfoPropertyElapsedPlaybackTime;
  uint64_t v8 = +[NSNumber numberWithDouble:a3];
  v15[0] = v8;
  v15[1] = &off_22C420;
  v14[1] = MPNowPlayingInfoPropertyPlaybackRate;
  v14[2] = MPMediaItemPropertyPlaybackDuration;
  uint64_t v9 = [(AVPlayer *)self->_samplePlayer currentItem];
  unsigned int v10 = v9;
  if (v9) {
    [v9 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double v11 = +[NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  v15[2] = v11;
  v15[3] = @"Music Haptics Sample";
  v14[3] = MPMediaItemPropertyTitle;
  v14[4] = MPMediaItemPropertyArtist;
  v15[4] = @"Apple, Inc";
  v15[5] = &off_22A230;
  v14[5] = MPNowPlayingInfoPropertyMediaType;
  v14[6] = MPNowPlayingInfoPropertyExternalContentIdentifier;
  v14[7] = MPNowPlayingInfoPropertyInternationalStandardRecordingCode;
  v15[6] = kAXHapticMusicSampleTrackISRCCode;
  v15[7] = kAXHapticMusicSampleTrackISRCCode;
  double v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
  [v7 setNowPlayingInfo:v12];
}

- (void)_handleNowPlayingActivation
{
  objc_initWeak(&location, self);
  id v3 = +[MPRemoteCommandCenter sharedCommandCenter];
  unsigned __int8 v4 = [v3 previousTrackCommand];
  [v4 setEnabled:0];

  char v5 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v6 = [v5 nextTrackCommand];
  [v6 setEnabled:0];

  int v7 = +[MPRemoteCommandCenter sharedCommandCenter];
  uint64_t v8 = [v7 pauseCommand];
  [v8 setEnabled:1];

  uint64_t v9 = +[MPRemoteCommandCenter sharedCommandCenter];
  unsigned int v10 = [v9 pauseCommand];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __54__AXHapticMusicController__handleNowPlayingActivation__block_invoke;
  v22[3] = &unk_20B4E0;
  objc_copyWeak(&v23, &location);
  double v11 = [v10 addTargetWithHandler:v22];
  id pauseToken = self->_pauseToken;
  self->_id pauseToken = v11;

  id v13 = +[MPRemoteCommandCenter sharedCommandCenter];
  objc_super v14 = [v13 playCommand];
  [v14 setEnabled:1];

  CMTime v15 = +[MPRemoteCommandCenter sharedCommandCenter];
  objc_super v16 = [v15 playCommand];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __54__AXHapticMusicController__handleNowPlayingActivation__block_invoke_2;
  v20[3] = &unk_20B4E0;
  objc_copyWeak(&v21, &location);
  v17 = [v16 addTargetWithHandler:v20];
  id playToken = self->_playToken;
  self->_id playToken = v17;

  id v19 = +[MAMusicHapticsManager sharedManager];
  [v19 checkHapticTrackAvailabilityForMediaMatchingCode:kAXHapticMusicSampleTrackISRCCode completionHandler:&__block_literal_global_465];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

uint64_t __54__AXHapticMusicController__handleNowPlayingActivation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopSample];

  return 0;
}

uint64_t __54__AXHapticMusicController__handleNowPlayingActivation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startSample];

  return 0;
}

void __54__AXHapticMusicController__handleNowPlayingActivation__block_invoke_3(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = AXLogHapticMusic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = +[NSNumber numberWithBool:v2];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Haptic track is available for sample: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setEnhancedPercussionEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setHapticMusicEnhancedPercussion:v4];
}

- (id)enhancedPercussionEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hapticMusicEnhancedPercussion]);

  return v4;
}

- (void)setEnhancedVocalsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setHapticMusicEnhancedVocals:v4];
}

- (id)enhancedVocalsEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hapticMusicEnhancedVocals]);

  return v4;
}

- (void)showHapticMusicLearnMore
{
  MGGetBoolAnswer();
  id v3 = objc_alloc((Class)OBTextWelcomeController);
  id v4 = AXUILocalizedStringForKeyWithTable();
  id v5 = AXUILocalizedStringForKeyWithTable();
  id v6 = +[UIImage _systemImageNamed:@"apple.haptics.and.music.note"];
  int v7 = +[UIColor systemPinkColor];
  uint64_t v8 = [v6 imageWithTintColor:v7 renderingMode:1];
  id v22 = [v3 initWithTitle:v4 detailText:v5 icon:v8];

  uint64_t v9 = AXUILocalizedStringForKeyWithTable();
  [v22 addSectionWithHeader:v9 content:&stru_20F6B8];

  unsigned int v10 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v10 description:&stru_20F6B8];

  double v11 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v11 description:&stru_20F6B8];

  double v12 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v12 description:&stru_20F6B8];

  id v13 = AXUILocalizedStringForKeyWithTable();
  [v22 addSectionWithHeader:v13 content:&stru_20F6B8];

  objc_super v14 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v14 description:&stru_20F6B8];

  CMTime v15 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v15 description:&stru_20F6B8];

  objc_super v16 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v16 description:&stru_20F6B8];

  v17 = AXUILocalizedStringForKeyWithTable();
  [v22 addBulletedListItemWithTitle:v17 description:&stru_20F6B8];

  v18 = (OBNavigationController *)[objc_alloc((Class)OBNavigationController) initWithRootViewController:v22];
  learnMoreNavigationController = self->_learnMoreNavigationController;
  self->_learnMoreNavigationController = v18;

  id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonTapped:"];
  id v21 = [v22 navigationItem];
  [v21 setRightBarButtonItem:v20];

  [(AXHapticMusicController *)self presentViewController:self->_learnMoreNavigationController animated:1 completion:0];
}

- (void)doneButtonTapped:(id)a3
{
  learnMoreNavigationController = self->_learnMoreNavigationController;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __44__AXHapticMusicController_doneButtonTapped___block_invoke;
  v4[3] = &unk_2087C0;
  v4[4] = self;
  [(OBNavigationController *)learnMoreNavigationController dismissViewControllerAnimated:1 completion:v4];
}

void __44__AXHapticMusicController_doneButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 200);
  *(void *)(v1 + 200) = 0;
}

- (void)setHapticMusicEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = AXLogHapticMusic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting haptic music: %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 BOOLValue];
  _AXSSetHapticMusicEnabled();
  if ([v5 BOOLValue])
  {
    int v7 = +[AXSettings sharedInstance];
    [v7 setHapticMusicActive:1];
  }
  if (([v5 BOOLValue] & 1) == 0) {
    [(AXHapticMusicController *)self _stopSample];
  }
  uint64_t v8 = +[AXSettings sharedInstance];
  [v8 setHapticMusicToggledInPreferences:1];
}

- (id)hapticMusicEnabled:(id)a3
{
  uint64_t v3 = _AXSHapticMusicEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v5 = -[AXHapticMusicController specifierForIndexPath:](self, "specifierForIndexPath:", a4, a5.x, a5.y);
  id v6 = [v5 propertyForKey:@"Group"];
  unsigned int v7 = [v6 isEqualToString:@"NowPlayingGroup"];

  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __85__AXHapticMusicController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v10[3] = &unk_20B550;
    id v11 = v5;
    uint64_t v8 = +[UIContextMenuConfiguration configurationWithIdentifier:@"Hello" previewProvider:0 actionProvider:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __85__AXHapticMusicController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __85__AXHapticMusicController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v8[3] = &unk_20B528;
  id v9 = *(id *)(a1 + 32);
  id v5 = +[UIAction actionWithTitle:@"Copy" image:0 identifier:0 handler:v8];
  [v4 addObject:v5];

  [v4 addObjectsFromArray:v3];
  id v6 = +[UIMenu menuWithTitle:&stru_20F6B8 children:v4];

  return v6;
}

void __85__AXHapticMusicController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v3 = +[UIPasteboard generalPasteboard];
  BOOL v2 = [*(id *)(a1 + 32) propertyForKey:@"titleValue"];
  [v3 setString:v2];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AXHapticMusicController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:@"BundleIdentifier"];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AXHapticMusicController;
    BOOL v10 = [(AXHapticMusicController *)&v12 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v10;
}

- (BOOL)isPlayingSample
{
  return self->_isPlayingSample;
}

- (void)setIsPlayingSample:(BOOL)a3
{
  self->_isPlayingSample = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliarySession, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_statusObserverToken, 0);
  objc_storeStrong((id *)&self->_nowPlayingSession, 0);
  objc_storeStrong(&self->_playToken, 0);
  objc_storeStrong(&self->_pauseToken, 0);
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_samplePlayer, 0);

  objc_storeStrong((id *)&self->_learnMoreNavigationController, 0);
}

void __57__AXHapticMusicController__fetchUpdatePlayingInformation__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error fetching now playing info: %@", (uint8_t *)&v2, 0xCu);
}

@end