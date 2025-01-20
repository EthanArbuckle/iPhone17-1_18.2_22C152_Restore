@interface VoiceOverAudioController
- (AXTestingRouteDescription)testingRoute;
- (BOOL)_channelCanBeToggled:(id)a3;
- (NSArray)testingPorts;
- (id)_currentRouteForOutput;
- (id)_interestingOutputDevices;
- (id)_selectedAudioDuckingMode:(id)a3;
- (id)audioDuckingEnabled:(id)a3;
- (id)devicesUpdatedBlock;
- (id)routeToHDMI:(id)a3;
- (id)routeToSpeakerForPhoneCalls:(id)a3;
- (id)speakOnCalls:(id)a3;
- (id)specifiers;
- (void)_handleOutputDeviceList;
- (void)audioRouteDidChange:(id)a3;
- (void)dealloc;
- (void)setAudioDuckingEnabled:(id)a3 specifier:(id)a4;
- (void)setDevicesUpdatedBlock:(id)a3;
- (void)setRouteToHDMI:(id)a3 specifier:(id)a4;
- (void)setRouteToSpeakerForPhoneCalls:(id)a3 specifier:(id)a4;
- (void)setSpeakOnCalls:(id)a3 specifier:(id)a4;
- (void)setTestingPorts:(id)a3;
- (void)setTestingRoute:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoiceOverAudioController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverAudioController;
  [(VoiceOverAudioController *)&v12 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[AVAudioSession sharedInstance];
  [v3 addObserver:self selector:"audioRouteDidChange:" name:AVAudioSessionRouteChangeNotification object:v4];

  objc_initWeak(&location, self);
  v5 = +[AXSettings sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __39__VoiceOverAudioController_viewDidLoad__block_invoke;
  v9[3] = &unk_208798;
  objc_copyWeak(&v10, &location);
  [v5 registerUpdateBlock:v9 forRetrieveSelector:"voiceOverSoundEffectsEnabled" withListener:self];

  objc_destroyWeak(&v10);
  v6 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__VoiceOverAudioController_viewDidLoad__block_invoke_3;
  v7[3] = &unk_208798;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __39__VoiceOverAudioController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__VoiceOverAudioController_viewDidLoad__block_invoke_2;
  block[3] = &unk_208798;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void __39__VoiceOverAudioController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained audioRouteDidChange:0];
}

void __39__VoiceOverAudioController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__VoiceOverAudioController_viewDidLoad__block_invoke_4;
  block[3] = &unk_208798;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void __39__VoiceOverAudioController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"DUCKING"];
  [v2 reloadSpecifier:v1 animated:1];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outputDeviceSpecifiers = self->_outputDeviceSpecifiers;
    self->_outputDeviceSpecifiers = v5;

    v7 = +[NSMutableArray array];
    if (+[AXMHapticComponent isSupported]) {
      id v8 = @"SOUNDS_AND_HAPTICS_TITLE";
    }
    else {
      id v8 = @"SOUNDS_ONLY_TITLE";
    }
    v9 = settingsLocString(v8, @"VoiceOverSettings");
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    uint64_t v11 = PSSpecifierIsSearchableKey;
    [v10 setProperty:&__kCFBooleanTrue forKey:PSSpecifierIsSearchableKey];
    uint64_t v12 = PSIDKey;
    [v10 setProperty:@"VOSounds" forKey:PSIDKey];
    [v7 addObject:v10];
    int v13 = AXRuntimeCheck_SupportsVoiceoverIndepedentVolume();
    v14 = settingsLocString(@"AUDIO_DUCKING", @"VoiceOverSettings");
    if (v13)
    {
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"_selectedAudioDuckingMode:" detail:objc_opt_class() cell:2 edit:0];

      [v15 setProperty:&__kCFBooleanTrue forKey:v11];
      CFStringRef v16 = @"DUCKING";
    }
    else
    {
      v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"setAudioDuckingEnabled:specifier:" get:"audioDuckingEnabled:" detail:0 cell:6 edit:0];

      CFStringRef v16 = @"AUDIO_DUCKING";
    }
    [v15 setProperty:v16 forKey:v12];
    [v7 addObject:v15];
    v17 = CAGradientLayer_ptr;
    if (MGGetBoolAnswer())
    {
      v18 = +[PSSpecifier emptyGroupSpecifier];
      if (AXDeviceIsPod()) {
        v19 = @"ROUTE_TO_SPEAKER_FOOTER_IPOD";
      }
      else {
        v19 = @"ROUTE_TO_SPEAKER_FOOTER_IPHONE";
      }
      v20 = settingsLocString(v19, @"VoiceOverSettings");
      uint64_t v21 = PSFooterTextGroupKey;
      [v18 setProperty:v20 forKey:PSFooterTextGroupKey];

      [v7 addObject:v18];
      v22 = settingsLocString(@"ROUTE_TO_SPEAKER", @"VoiceOverSettings");
      v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"setRouteToSpeakerForPhoneCalls:specifier:" get:"routeToSpeakerForPhoneCalls:" detail:0 cell:6 edit:0];

      v17 = CAGradientLayer_ptr;
      [v23 setProperty:@"ROUTE_TO_SPEAKER" forKey:v12];
      [v7 addObject:v23];

      v15 = v23;
    }
    else
    {
      uint64_t v21 = PSFooterTextGroupKey;
    }
    v24 = [v17[120] emptyGroupSpecifier];
    v25 = settingsLocString(@"ROUTE_TO_HDMI_DETAILS", @"VoiceOverSettings");
    [v24 setProperty:v25 forKey:v21];

    [v7 addObject:v24];
    v26 = v17[120];
    v27 = settingsLocString(@"ROUTE_TO_HDMI", @"VoiceOverSettings");
    v28 = [v26 preferenceSpecifierNamed:v27 target:self set:"setRouteToHDMI:specifier:" get:"routeToHDMI:" detail:0 cell:6 edit:0];

    [v28 setProperty:@"ROUTE_TO_HDMI" forKey:v12];
    [v7 addObject:v28];
    v29 = [v17[120] emptyGroupSpecifier];

    [v29 setProperty:@"DEVICES" forKey:v12];
    [v7 addObject:v29];
    id v30 = [v7 copy];
    v31 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v30;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)_selectedAudioDuckingMode:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = AXSettingsNameForAudioDuckingMode((unint64_t)[v3 voiceOverMediaDuckingMode]);

  return v4;
}

- (id)speakOnCalls:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverSpeaksOverTelephoneCalls]);

  return v4;
}

- (void)setSpeakOnCalls:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverSpeaksOverTelephoneCalls:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverAudioController;
  [(VoiceOverAudioController *)&v4 viewWillAppear:a3];
  [(VoiceOverAudioController *)self _handleOutputDeviceList];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VoiceOverAudioController;
  [(VoiceOverAudioController *)&v4 dealloc];
}

- (void)audioRouteDidChange:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
  unsigned int v6 = [v5 intValue];

  if (v6 == 3)
  {
    v7 = AXLogAudioRouting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "not processng audio route change for category change: %@", buf, 0xCu);
    }
  }
  else
  {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

id __48__VoiceOverAudioController_audioRouteDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleOutputDeviceList];
}

- (void)_handleOutputDeviceList
{
  id v2 = self;
  [(VoiceOverAudioController *)self beginUpdates];
  id v3 = [(VoiceOverAudioController *)v2 _interestingOutputDevices];
  if ([v3 count])
  {
    objc_super v4 = settingsLocString(@"SPEECH_CHANNELS", @"VoiceOverSettings");
    id v5 = [v3 firstObject];
    [v5 portName];
    unsigned int v6 = v58 = (id *)v2;
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

    id v8 = [v58 specifierForID:@"DEVICES"];
    v46 = (void *)v7;
    [v8 setName:v7];

    id v9 = [v58 specifierForID:@"DEVICES"];
    [v58 reloadSpecifier:v9 animated:1];

    if ([v58[23] count]) {
      [v58 removeContiguousSpecifiers:v58[23] animated:1];
    }
    id v10 = +[AXAudioHardwareManager sharedManager];
    uint64_t v11 = [v58 _currentRouteForOutput];
    v53 = [v10 savedChannelsForOutput:v11 forSource:1];

    uint64_t v12 = +[AXAudioHardwareManager sharedManager];
    int v13 = [v58 _currentRouteForOutput];
    v52 = [v12 savedChannelsForOutput:v13 forSource:2];

    [v58[23] removeAllObjects];
    v14 = +[NSMutableArray array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v3;
    id v49 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v66;
      v15 = CAGradientLayer_ptr;
      v51 = v14;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v66 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v16;
          v17 = *(void **)(*((void *)&v65 + 1) + 8 * v16);
          v18 = +[AXAudioHardwareManager channelsForPort:v17];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v57 = v18;
          id v55 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v55)
          {
            int v56 = 0;
            uint64_t v54 = *(void *)v62;
            do
            {
              for (i = 0; i != v55; i = (char *)i + 1)
              {
                v20 = v17;
                if (*(void *)v62 != v54) {
                  objc_enumerationMutation(v57);
                }
                uint64_t v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                unint64_t v22 = (unint64_t)[v53 containsObject:v21];
                v23 = v58;
                if (!v53)
                {
                  if ([v57 count]) {
                    unint64_t v22 = (v56 + i) < 2;
                  }
                  else {
                    unint64_t v22 = v22;
                  }
                }
                [v21 channelLabel];
                uint64_t v24 = [v21 channelName];
                v60 = AXAudioHDMIChannelLabelDescription();
                if ([v60 length])
                {
                  v25 = (void *)v24;
                  v26 = [v20 portType];
                  unsigned int v27 = [v26 isEqualToString:AVAudioSessionPortHDMI];

                  v28 = CAGradientLayer_ptr;
                  if (v27)
                  {
                    uint64_t v24 = [v25 stringByAppendingFormat:@" (%@)", v60];

                    v23 = v58;
                  }
                  else
                  {
                    v23 = v58;
                    uint64_t v24 = (uint64_t)v25;
                  }
                }
                else
                {
                  v28 = CAGradientLayer_ptr;
                }
                v59 = (void *)v24;
                v29 = [v15[120] preferenceSpecifierNamed:v24 target:v23 set:0 get:0 detail:0 cell:3 edit:0];
                id v30 = [v28[74] numberWithBool:v22];
                [v29 setProperty:v30 forKey:@"IsSelected"];

                [v29 setProperty:v21 forKey:@"Channel"];
                v17 = v20;
                [v29 setProperty:v20 forKey:@"Port"];
                [v29 setProperty:@"Speech" forKey:@"Type"];
                [v23[23] addObject:v29];
                unint64_t v31 = (unint64_t)[v52 containsObject:v21];
                if (!v52)
                {
                  if ([v57 count]) {
                    unint64_t v31 = (v56 + i) < 2;
                  }
                  else {
                    unint64_t v31 = v31;
                  }
                }
                v32 = [v15[120] preferenceSpecifierNamed:v59 target:v23 set:0 get:0 detail:0 cell:3 edit:0];
                v33 = +[NSNumber numberWithBool:v31];
                [v32 setProperty:v33 forKey:@"IsSelected"];

                [v32 setProperty:v21 forKey:@"Channel"];
                [v32 setProperty:v20 forKey:@"Port"];
                [v32 setProperty:@"Sound" forKey:@"Type"];
                v14 = v51;
                [v51 addObject:v32];

                v15 = CAGradientLayer_ptr;
              }
              id v55 = [v57 countByEnumeratingWithState:&v61 objects:v69 count:16];
              v56 += (int)i;
            }
            while (v55);
          }

          uint64_t v16 = v50 + 1;
        }
        while ((id)(v50 + 1) != v49);
        id v49 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v49);
    }

    v34 = +[AXSettings sharedInstance];
    if ([v34 voiceOverSoundEffectsEnabled])
    {
      id v35 = [v14 count];

      id v2 = (VoiceOverAudioController *)v58;
      if (!v35)
      {
LABEL_38:
        outputDeviceSpecifiers = v2->_outputDeviceSpecifiers;
        v43 = [(VoiceOverAudioController *)v2 specifierForID:@"DEVICES"];
        [(VoiceOverAudioController *)v2 insertContiguousSpecifiers:outputDeviceSpecifiers afterSpecifier:v43 animated:1];

        goto LABEL_39;
      }
      v36 = settingsLocString(@"SOUND_CHANNELS", @"VoiceOverSettings");
      v37 = [obj firstObject];
      v38 = [v37 portName];
      v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v38);
      v34 = +[PSSpecifier groupSpecifierWithName:v39];

      id v2 = (VoiceOverAudioController *)v58;
      [v34 setProperty:@"SOUND_GROUP" forKey:PSIDKey];
      [v58[23] addObject:v34];
      [v58[23] addObjectsFromArray:v14];
    }
    else
    {
      id v2 = (VoiceOverAudioController *)v58;
    }

    goto LABEL_38;
  }
  v40 = [(VoiceOverAudioController *)v2 specifierForID:@"DEVICES"];
  [v40 setName:0];

  v41 = [(VoiceOverAudioController *)v2 specifierForID:@"DEVICES"];
  [(VoiceOverAudioController *)v2 reloadSpecifier:v41 animated:1];

  if ([(NSMutableArray *)v2->_outputDeviceSpecifiers count]) {
    [(VoiceOverAudioController *)v2 removeContiguousSpecifiers:v2->_outputDeviceSpecifiers animated:1];
  }
LABEL_39:
  [(VoiceOverAudioController *)v2 endUpdates];
  v44 = [(VoiceOverAudioController *)v2 devicesUpdatedBlock];

  if (v44)
  {
    v45 = [(VoiceOverAudioController *)v2 devicesUpdatedBlock];
    v45[2]();
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  uint64_t v7 = [(VoiceOverAudioController *)self specifierForIndexPath:a5];
  id v8 = [v7 propertyForKey:@"IsSelected"];

  if (v8)
  {
    id v9 = [v7 propertyForKey:@"IsSelected"];
    objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "BOOLValue"));
  }
}

- (BOOL)_channelCanBeToggled:(id)a3
{
  id v4 = a3;
  id v5 = [(VoiceOverAudioController *)self cellForSpecifier:v4];
  unsigned int v25 = [v5 isChecked];
  if ((v25 & 1) != 0
    || ([v4 propertyForKey:@"Type"],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqualToString:@"Speech"],
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v24 = v5;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(VoiceOverAudioController *)self specifiers];
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          v15 = [v14 propertyForKey:@"Type"];
          uint64_t v16 = [v4 propertyForKey:@"Type"];
          unsigned int v17 = [v15 isEqualToString:v16];

          if (v14 != v4 && v17 != 0)
          {
            v19 = [v14 propertyForKey:@"IsSelected"];
            unsigned int v20 = [v19 BOOLValue];

            v11 += v20;
            if (v25 & v20)
            {
              char v8 = 1;
              goto LABEL_20;
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    char v8 = 0;
LABEL_20:

    if ((v25 & 1) == 0)
    {
      uint64_t v21 = [v4 propertyForKey:@"Type"];
      unsigned int v22 = [v21 isEqualToString:@"Sound"];

      if (v22) {
        char v8 = v11 < 2;
      }
    }
    id v5 = v24;
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v43.receiver = self;
  v43.super_class = (Class)VoiceOverAudioController;
  [(VoiceOverAudioController *)&v43 tableView:a3 didSelectRowAtIndexPath:v6];
  unsigned __int8 v7 = [(VoiceOverAudioController *)self specifierForIndexPath:v6];
  char v8 = [(VoiceOverAudioController *)self cellForSpecifier:v7];
  id v9 = [v7 propertyForKey:@"Port"];

  if (v9 && [(VoiceOverAudioController *)self _channelCanBeToggled:v7])
  {
    id v36 = v6;
    v34 = v8;
    objc_msgSend(v8, "setChecked:", objc_msgSend(v8, "isChecked") ^ 1);
    id v10 = [v7 propertyForKey:@"IsSelected"];
    uint64_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 BOOLValue] ^ 1);
    id v35 = v7;
    [v7 setProperty:v11 forKey:@"IsSelected"];

    v38 = +[NSMutableArray array];
    v37 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v12 = [(VoiceOverAudioController *)self specifiers];
    id v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v13) {
      goto LABEL_17;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v18 = [v17 propertyForKey:@"Port"];
        if (v18)
        {
          v19 = (void *)v18;
          unsigned int v20 = [v17 propertyForKey:@"IsSelected"];
          unsigned int v21 = [v20 BOOLValue];

          if (v21)
          {
            unsigned int v22 = [v17 propertyForKey:@"Type"];
            unsigned int v23 = [v22 isEqualToString:@"Speech"];

            if (v23)
            {
              uint64_t v24 = [v17 propertyForKey:@"Channel"];
              unsigned int v25 = v38;
            }
            else
            {
              v26 = [v17 propertyForKey:@"Type"];
              unsigned int v27 = [v26 isEqualToString:@"Sound"];

              if (!v27) {
                continue;
              }
              uint64_t v24 = [v17 propertyForKey:@"Channel"];
              unsigned int v25 = v37;
            }
            [v25 addObject:v24];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (!v14)
      {
LABEL_17:

        long long v28 = +[AXAudioHardwareManager sharedManager];
        long long v29 = +[AVAudioSession sharedInstance];
        long long v30 = [v29 currentRoute];
        [v28 setSavedChannels:v38 forOutput:v30 forSource:1];

        unint64_t v31 = +[AXAudioHardwareManager sharedManager];
        v32 = +[AVAudioSession sharedInstance];
        v33 = [v32 currentRoute];
        [v31 setSavedChannels:v37 forOutput:v33 forSource:2];

        unsigned __int8 v7 = v35;
        id v6 = v36;
        char v8 = v34;
        break;
      }
    }
  }
}

- (id)_currentRouteForOutput
{
  id v3 = [(VoiceOverAudioController *)self testingRoute];

  if (v3)
  {
    id v4 = [(VoiceOverAudioController *)self testingRoute];
  }
  else
  {
    id v5 = +[AVAudioSession sharedInstance];
    id v4 = [v5 currentRoute];
  }

  return v4;
}

- (id)_interestingOutputDevices
{
  id v3 = [(VoiceOverAudioController *)self testingPorts];

  if (v3)
  {
    id v34 = [(VoiceOverAudioController *)self testingPorts];
  }
  else
  {
    +[AXAudioHardwareManager enableMultiroute];
    id v4 = +[AVAudioSession sharedInstance];
    id v5 = [v4 currentRoute];
    unint64_t v31 = v4;
    if (_interestingOutputDevices_onceToken != -1) {
      dispatch_once(&_interestingOutputDevices_onceToken, &__block_literal_global_67);
    }
    id v34 = +[NSMutableArray array];
    long long v30 = v5;
    id v6 = [v5 outputs];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      id v10 = &swift_allocBox_ptr;
      uint64_t v11 = off_266000;
      uint64_t v32 = *(void *)v36;
      do
      {
        uint64_t v12 = 0;
        id v33 = v8;
        do
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
          id v14 = [v10[467] sharedInstance];
          unsigned __int8 v15 = [v14 ignoreLogging];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v10[467] identifier];
            unsigned int v17 = AXLoggerForFacility();

            os_log_type_t v18 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v17, v18))
            {
              v19 = v6;
              unsigned int v20 = AXColorizeFormatLog();
              unsigned int v21 = v11;
              unsigned int v22 = v11[305];
              unsigned int v23 = [v13 portType];
              long long v28 = v13;
              uint64_t v29 = [v22 containsObject:v23];
              uint64_t v24 = _AXStringForArgs();

              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)buf = 138543362;
                long long v40 = v24;
                _os_log_impl(&dword_0, v17, v18, "%{public}@", buf, 0xCu);
              }

              id v6 = v19;
              id v10 = &swift_allocBox_ptr;
              uint64_t v11 = v21;
              uint64_t v9 = v32;
              id v8 = v33;
            }
          }
          unsigned int v25 = v11[305];
          v26 = objc_msgSend(v13, "portType", v28, v29);
          LODWORD(v25) = [v25 containsObject:v26];

          if (v25) {
            [v34 addObject:v13];
          }
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v8);
    }
    +[AXAudioHardwareManager disableMultiroute];
  }

  return v34;
}

void __53__VoiceOverAudioController__interestingOutputDevices__block_invoke(id a1)
{
  uint64_t v1 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AVAudioSessionPortHDMI, AVAudioSessionPortBluetoothHFP, AVAudioSessionPortUSBAudio, AVAudioSessionPortCarAudio, AVAudioSessionPortHeadphones, AVAudioSessionPortBluetoothA2DP, AVAudioSessionPortBluetoothLE, 0);
  uint64_t v2 = _interestingOutputDevices_InterestingPortTypes;
  _interestingOutputDevices_InterestingPortTypes = v1;

  _objc_release_x1(v1, v2);
}

- (void)setAudioDuckingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverAudioDuckingEnabled:v4];
}

- (void)setRouteToSpeakerForPhoneCalls:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity(v4);
}

- (id)routeToSpeakerForPhoneCalls:(id)a3
{
  uint64_t ShouldRouteToSpeakerWithProximity = _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity();

  return +[NSNumber numberWithUnsignedChar:ShouldRouteToSpeakerWithProximity];
}

- (id)audioDuckingEnabled:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverAudioDuckingEnabled]);

  return v4;
}

- (void)setRouteToHDMI:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverAudioFollowsHDMIAudio:v4];
}

- (id)routeToHDMI:(id)a3
{
  id v3 = +[AXSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 voiceOverAudioFollowsHDMIAudio]);

  return v4;
}

- (NSArray)testingPorts
{
  return self->_testingPorts;
}

- (void)setTestingPorts:(id)a3
{
}

- (AXTestingRouteDescription)testingRoute
{
  return self->_testingRoute;
}

- (void)setTestingRoute:(id)a3
{
}

- (id)devicesUpdatedBlock
{
  return self->_devicesUpdatedBlock;
}

- (void)setDevicesUpdatedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_devicesUpdatedBlock, 0);
  objc_storeStrong((id *)&self->_testingRoute, 0);
  objc_storeStrong((id *)&self->_testingPorts, 0);

  objc_storeStrong((id *)&self->_outputDeviceSpecifiers, 0);
}

@end