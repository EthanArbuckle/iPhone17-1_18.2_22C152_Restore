@interface TripleClickController
- (BOOL)_optionIsDisabled:(int)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (TripleClickController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)_optionFromSpecifierKey:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_removeOptionWithKey:(id)a3 fromSpecifiers:(id)a4;
- (void)_removeTripleClickOption:(int)a3 fromSpecifiers:(id)a4 options:(id)a5;
- (void)_removeTripleClickOption:(int)a3 ifNecessaryFromSpecifiers:(id)a4 options:(id)a5;
- (void)_removeUnsupportedOptionsFromSpecifiers:(id)a3;
- (void)_reorderSpecifiers;
- (void)_saveTripleClickOptions;
- (void)_updateTripleClickOptions;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TripleClickController

- (TripleClickController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TripleClickController;
  v8 = [(TripleClickController *)&v19 initWithNibName:v6 bundle:v7];
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:v8 selector:"_handleScannerToggled:" name:kAXSAssistiveTouchScannerEnabledNotification object:0];

  objc_initWeak(&location, v8);
  v10 = +[AXSettings sharedInstance];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = __48__TripleClickController_initWithNibName_bundle___block_invoke;
  v16 = &unk_208798;
  objc_copyWeak(&v17, &location);
  id v11 = objc_loadWeakRetained(&location);
  [v10 registerUpdateBlock:&v13 forRetrieveSelector:"touchAccommodationsEnabled" withListener:v11];

  objc_destroyWeak(&v17);
  [(TripleClickController *)v8 _updateTripleClickOptions];
  objc_destroyWeak(&location);

  return v8;
}

void __48__TripleClickController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (void)_updateTripleClickOptions
{
  self->_tripleClickOptions = (NSArray *)_AXSTripleClickCopyOptions();

  _objc_release_x1();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TripleClickController;
  [(TripleClickController *)&v5 viewDidLoad];
  v3 = [(TripleClickController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  v4 = [(TripleClickController *)self table];
  [v4 setEditing:1 animated:0];
}

- (int)_optionFromSpecifierKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"voiceover"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"whiteonblack"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"classicinvert"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"reducetransparency"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"reducemotion"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"backgroundsounds"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"leftright"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"increasecontrast"])
  {
    int v4 = 21;
  }
  else
  {
    if ([v3 isEqualToString:@"grayscale"]) {
      goto LABEL_18;
    }
    if ([v3 isEqualToString:@"whitepoint"])
    {
      int v4 = 14;
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"colorFilter"])
    {
LABEL_18:
      int v4 = 10;
    }
    else if ([v3 isEqualToString:@"ask"])
    {
      int v4 = 3;
    }
    else if ([v3 isEqualToString:@"zoom"])
    {
      int v4 = 4;
    }
    else if ([v3 isEqualToString:@"hovertext"])
    {
      int v4 = 27;
    }
    else if ([v3 isEqualToString:@"hovertexttyping"])
    {
      int v4 = 40;
    }
    else if ([v3 isEqualToString:@"assistivetouch"])
    {
      int v4 = 6;
    }
    else if ([v3 isEqualToString:@"switchover"])
    {
      int v4 = 9;
    }
    else if ([v3 isEqualToString:@"guidedaccess"])
    {
      int v4 = 7;
    }
    else if ([v3 isEqualToString:@"loccaptionpanel"])
    {
      int v4 = 13;
    }
    else if ([v3 isEqualToString:@"lookingglass"])
    {
      int v4 = 16;
    }
    else if ([v3 isEqualToString:@"hearingaids"])
    {
      int v4 = 8;
    }
    else if ([v3 isEqualToString:@"touchaccommodations"])
    {
      int v4 = 11;
    }
    else if ([v3 isEqualToString:@"magnifier"])
    {
      int v4 = 12;
    }
    else if ([v3 isEqualToString:@"detectionmode"])
    {
      int v4 = 22;
    }
    else if ([v3 isEqualToString:@"voicecontrol"])
    {
      int v4 = 17;
    }
    else
    {
      if ([v3 isEqualToString:@"darkmode"]) {
        goto LABEL_52;
      }
      if ([v3 isEqualToString:@"fullkeyboardaccess"])
      {
        int v4 = 18;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"twiceremotescreen"])
      {
        int v4 = 28;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"livetranscription"])
      {
        int v4 = 29;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"clarityui"])
      {
        int v4 = 30;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"eyetracking"])
      {
        int v4 = 42;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"nearbydevicecontrol"])
      {
        int v4 = 31;
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"pointercontrol"])
      {
LABEL_52:
        int v4 = 0;
      }
      else if ([v3 isEqualToString:@"livespeech"])
      {
        int v4 = 33;
      }
      else if ([v3 isEqualToString:@"speakscreen"])
      {
        int v4 = 34;
      }
      else if ([v3 isEqualToString:@"dimflashinglights"])
      {
        int v4 = 35;
      }
      else if ([v3 isEqualToString:@"motioncues"])
      {
        int v4 = 36;
      }
      else if ([v3 isEqualToString:@"hapticmusic"])
      {
        int v4 = 38;
      }
      else if ([v3 isEqualToString:@"conversationboost"])
      {
        int v4 = 39;
      }
      else
      {
        int v4 = 0;
      }
    }
  }
LABEL_21:

  return v4;
}

- (void)_reorderSpecifiers
{
  id v3 = +[AXSettings sharedInstance];
  int v4 = [v3 tripleClickOrderedOptions];

  objc_super v5 = +[AXSubsystemAXSettings sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v7 = +[AXSubsystemAXSettings identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      id v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = OBJC_IVAR___PSListController__specifiers;
  v13 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __43__TripleClickController__reorderSpecifiers__block_invoke;
  v17[3] = &unk_209428;
  id v18 = v4;
  objc_super v19 = self;
  id v14 = v4;
  uint64_t v15 = [v13 sortedArrayUsingComparator:v17];
  v16 = *(void **)&self->AXUISettingsBaseListController_opaque[v12];
  *(void *)&self->AXUISettingsBaseListController_opaque[v12] = v15;
}

uint64_t __43__TripleClickController__reorderSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 propertyForKey:@"tripleClickOption"];

  v8 = [v6 propertyForKey:@"tripleClickOption"];

  if (v7)
  {
    if (v8)
    {
      if (*(void *)(a1 + 32))
      {
        os_log_type_t v9 = *(void **)(a1 + 40);
        v10 = [v5 propertyForKey:@"tripleClickOption"];
        id v11 = [v9 _optionFromSpecifierKey:v10];

        uint64_t v12 = *(void **)(a1 + 40);
        v13 = [v6 propertyForKey:@"tripleClickOption"];
        id v14 = [v12 _optionFromSpecifierKey:v13];

        uint64_t v15 = *(void **)(a1 + 32);
        v16 = +[NSNumber numberWithUnsignedInt:v11];
        if ([v15 indexOfObject:v16] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {
          id v18 = *(void **)(a1 + 32);
          objc_super v19 = +[NSNumber numberWithUnsignedInt:v14];
          id v20 = [v18 indexOfObject:v19];

          if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = *(void **)(a1 + 32);
            v25 = +[NSNumber numberWithUnsignedInt:v11];
            v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 indexOfObject:v25]);
            v27 = *(void **)(a1 + 32);
            v28 = +[NSNumber numberWithUnsignedInt:v14];
            v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 indexOfObject:v28]);
            uint64_t v17 = (uint64_t)[v26 compare:v29];

            goto LABEL_12;
          }
        }
      }
      v21 = [v5 name];
      v22 = [v6 name];
      uint64_t v17 = (uint64_t)[v21 localizedCompare:v22];
    }
    else
    {
      uint64_t v17 = 1;
    }
  }
  else if (v8)
  {
    uint64_t v17 = -1;
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_12:

  return v17;
}

- (void)_removeUnsupportedOptionsFromSpecifiers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __65__TripleClickController__removeUnsupportedOptionsFromSpecifiers___block_invoke;
  v5[3] = &unk_209450;
  v5[4] = self;
  id v3 = a3;
  int v4 = [v3 indexesOfObjectsPassingTest:v5];
  [v3 removeObjectsAtIndexes:v4];
}

BOOL __65__TripleClickController__removeUnsupportedOptionsFromSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 propertyForKey:@"bypassFiltering"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [v3 propertyForKey:@"tripleClickOption"];
    LODWORD(v7) = [v7 _optionFromSpecifierKey:v8];

    BOOL v6 = v7 == 0;
  }

  return v6;
}

- (void)_removeTripleClickOption:(int)a3 fromSpecifiers:(id)a4 options:(id)a5
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  os_log_type_t v9 = __73__TripleClickController__removeTripleClickOption_fromSpecifiers_options___block_invoke;
  v10 = &unk_209478;
  id v11 = self;
  LODWORD(v12) = a3;
  id v5 = a4;
  BOOL v6 = [v5 indexesOfObjectsPassingTest:&v7];
  objc_msgSend(v5, "removeObjectsAtIndexes:", v6, v7, v8, v9, v10, v11, v12);
}

BOOL __73__TripleClickController__removeTripleClickOption_fromSpecifiers_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 propertyForKey:@"bypassFiltering"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v3 propertyForKey:@"tripleClickOption"];
    LODWORD(v7) = [v7 _optionFromSpecifierKey:v8];

    BOOL v6 = v7 == *(_DWORD *)(a1 + 40);
  }

  return v6;
}

- (void)_removeTripleClickOption:(int)a3 ifNecessaryFromSpecifiers:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v8 = a5;
  if (!_AXSTripleClickContainsOption()) {
    [(TripleClickController *)self _removeTripleClickOption:v6 fromSpecifiers:v9 options:v8];
  }
}

- (void)_removeOptionWithKey:(id)a3 fromSpecifiers:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __61__TripleClickController__removeOptionWithKey_fromSpecifiers___block_invoke;
  v8[3] = &unk_2094A0;
  id v9 = a3;
  id v5 = v9;
  id v6 = a4;
  id v7 = [v6 indexesOfObjectsPassingTest:v8];
  [v6 removeObjectsAtIndexes:v7];
}

id __61__TripleClickController__removeOptionWithKey_fromSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 properties];
  int v4 = [v3 objectForKey:PSKeyNameKey];
  id v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)specifiers
{
  id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v67 = OBJC_IVAR___PSListController__specifiers;
    uint64_t v4 = _AXSTripleClickCopyOptions();
    id v5 = [(TripleClickController *)self loadSpecifiersFromPlistName:@"TripleClickSettings" target:self];
    id v6 = [v5 mutableCopy];

    id v7 = settingsLocString(@"TRIPLE_CLICK_MAGNIFIER_LONG", @"TripleClickSettings");
    id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = PSCellClassKey;
    [v8 setProperty:v9 forKey:PSCellClassKey];
    [v8 setProperty:@"magnifier" forKey:@"tripleClickOption"];
    [v8 setProperty:@"TripleClickMagnifier" forKey:PSIDKey];
    uint64_t v70 = PSKeyNameKey;
    objc_msgSend(v8, "setProperty:forKey:", @"TRIPLE_CLICK_MAGNIFIER");
    v65 = v8;
    [v6 addObject:v8];
    id v11 = AXUIAssistiveTouchStringForName();
    uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:objc_opt_class() forKey:v10];
    [v12 setProperty:@"detectionmode" forKey:@"tripleClickOption"];
    v64 = v12;
    [v6 addObject:v12];
    if (AXDeviceSupportsWatchRemoteScreen())
    {
      v13 = AXUIAssistiveTouchStringForName();
      id v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v14 setProperty:objc_opt_class() forKey:v10];
      [v14 setProperty:@"twiceremotescreen" forKey:@"tripleClickOption"];
      [v6 addObject:v14];
    }
    if (AXHasCapability())
    {
      uint64_t v15 = settingsLocString(@"TRIPLE_CLICK_LIVE_TRANSCRIPTION_LONG", @"TripleClickSettings");
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v16 setProperty:objc_opt_class() forKey:v10];
      [v16 setProperty:@"livetranscription" forKey:@"tripleClickOption"];
      [v6 addObject:v16];
    }
    if (AXHasCapability())
    {
      uint64_t v17 = settingsLocString(@"TRIPLE_CLICK_ON_DEVICE_EYE_TRACKING_LONG", @"TripleClickSettings");
      id v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v18 setProperty:objc_opt_class() forKey:v10];
      [v18 setProperty:@"eyetracking" forKey:@"tripleClickOption"];
      [v6 addObject:v18];
    }
    if (AXDeviceSupportsLiveSpeech())
    {
      objc_super v19 = settingsLocString(@"TRIPLE_CLICK_LIVE_SPEECH_LONG", @"TripleClickSettings");
      id v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v20 setProperty:objc_opt_class() forKey:v10];
      [v20 setProperty:@"livespeech" forKey:@"tripleClickOption"];
      [v6 addObject:v20];
    }
    if (AXHasCapability() && _AXSClarityUIEnabled())
    {
      v21 = settingsLocString(@"TRIPLE_CLICK_CLARITY_UI_LONG", @"TripleClickSettings");
      v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v22 setProperty:objc_opt_class() forKey:v10];
      [v22 setProperty:@"clarityui" forKey:@"tripleClickOption"];
      [v6 addObject:v22];
    }
    uint64_t v23 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    if (paCurrentRouteSupportsTransparencyAccommodations()
      && paBluetoothDeviceSupportsSSL())
    {
      v24 = settingsLocString(@"TRIPLE_CLICK_CONVERSATION_BOOST_LONG", @"TripleClickSettings");
      v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v25 setProperty:objc_opt_class() forKey:v10];
      [v25 setProperty:@"conversationboost" forKey:@"tripleClickOption"];
      [v6 addObject:v25];
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v26 = (id)_AXSTripleClickCopyAllComputedOptions();
    id v27 = [v26 countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v76;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v76 != v29) {
            objc_enumerationMutation(v26);
          }
          -[TripleClickController _removeTripleClickOption:ifNecessaryFromSpecifiers:options:](self, "_removeTripleClickOption:ifNecessaryFromSpecifiers:options:", [*(id *)(*((void *)&v75 + 1) + 8 * i) intValue], v6, v4);
        }
        id v28 = [v26 countByEnumeratingWithState:&v75 objects:v80 count:16];
      }
      while (v28);
    }

    [(TripleClickController *)self _removeTripleClickOption:13 ifNecessaryFromSpecifiers:v6 options:v4];
    v31 = +[AXSettings sharedInstance];
    unsigned __int8 v32 = [v31 touchAccommodationsAreConfigured];

    if ((v32 & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:11 ifNecessaryFromSpecifiers:v6 options:v4];
    }
    if ((AXHACHearingAidCapabilities() & 0x10) == 0
      || (+[HUHearingAidSettings sharedInstance],
          v33 = objc_claimAutoreleasedReturnValue(),
          [v33 pairedHearingAids],
          v34 = objc_claimAutoreleasedReturnValue(),
          v34,
          v33,
          !v34))
    {
      [(TripleClickController *)self _removeTripleClickOption:8 fromSpecifiers:v6 options:v4];
    }
    v35 = +[AXSettings sharedInstance];
    v36 = (char *)[v35 voiceOverActivationWorkaround];

    if (v36 == (unsigned char *)&dword_0 + 3) {
      [(TripleClickController *)self _removeTripleClickOption:1 fromSpecifiers:v6 options:v4];
    }
    if ((AXIsLookingGlassAvailable() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:16 fromSpecifiers:v6 options:v4];
    }
    if ((AXDeviceSupportsHoverText() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:27 fromSpecifiers:v6 options:v4];
    }
    if ((AXDeviceSupportsHoverTextTyping() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:40 fromSpecifiers:v6 options:v4];
    }
    if ((AXRuntimeCheck_SupportsNearbyDeviceControl() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:31 fromSpecifiers:v6 options:v4];
    }
    if ((AXDeviceSupportsPhotosensitiveMitigation() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:35 fromSpecifiers:v6 options:v4];
    }
    v63 = (void *)v23;
    if ((AXDeviceSupportsMotionCues() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:36 fromSpecifiers:v6 options:v4];
    }
    v62 = v26;
    if ((AXDeviceSupportsHapticMusic() & 1) == 0) {
      [(TripleClickController *)self _removeTripleClickOption:38 fromSpecifiers:v6 options:v4];
    }
    v66 = (void *)v4;
    [(TripleClickController *)self _removeOptionWithKey:@"TRIPLE_CLICK_POINTER_CONTROL" fromSpecifiers:v6];
    v37 = +[AXBackBoardServer server];
    unsigned int v38 = [v37 supportsAccessibilityDisplayFilters];

    if (v38) {
      CFStringRef v39 = @"TRIPLE_CLICK_GRAYSCALE";
    }
    else {
      CFStringRef v39 = @"TRIPLE_CLICK_COLOR_FILTER";
    }
    [(TripleClickController *)self _removeOptionWithKey:v39 fromSpecifiers:v6];
    [(TripleClickController *)self _removeUnsupportedOptionsFromSpecifiers:v6];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v6;
    id v40 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
    uint64_t v41 = v70;
    if (v40)
    {
      id v42 = v40;
      uint64_t v43 = *(void *)v72;
      uint64_t v68 = PSFooterTextGroupKey;
      uint64_t v44 = PSTitleKey;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v72 != v43) {
            objc_enumerationMutation(obj);
          }
          v46 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
          v47 = [v46 propertyForKey:v41];
          unsigned int v48 = [v47 isEqualToString:@"Header"];

          if (v48)
          {
            v49 = AXLocStringKeyForHomeButtonAndExclusiveModel();
            v50 = settingsLocString(v49, @"TripleClickSettings");
            if (AXDeviceHasTopTouchIDButton())
            {
              uint64_t v51 = settingsLocStringTopTouchIDButton(@"TRIPLE_CLICK_INTRO_TEXT_IPAD_TOUCHID");

              v50 = (void *)v51;
            }
            [v46 setName:v50];
            [v46 setProperty:v50 forKey:v44];

            goto LABEL_63;
          }
          v52 = [v46 propertyForKey:v41];
          unsigned int v53 = [v52 isEqualToString:@"IntroExplanation"];

          if (v53)
          {
            char HasHomeButton = AXDeviceHasHomeButton();
            v55 = @"TRIPLE_CLICK_EXPLANATION_HOME";
            if ((HasHomeButton & 1) == 0)
            {
              if (AXDeviceHasSideButton()) {
                v55 = @"TRIPLE_CLICK_EXPLANATION_SIDE";
              }
              else {
                v55 = @"TRIPLE_CLICK_EXPLANATION_TOP";
              }
            }
            v56 = settingsLocString(v55, @"TripleClickSettings");
            [v46 setProperty:v56 forKey:v68];

            if (AXDeviceHasTopTouchIDButton())
            {
              v49 = settingsLocStringTopTouchIDButton(@"TRIPLE_CLICK_EXPLANATION_TOP_TOUCHID");
              [v46 setProperty:v49 forKey:v68];
LABEL_63:
            }
          }
          v57 = [v46 propertyForKey:@"tripleClickOption"];
          unsigned int v58 = [(TripleClickController *)self _optionFromSpecifierKey:v57];

          if (v58 && _AXSTripleClickContainsOption()) {
            [v46 setProperty:&__kCFBooleanTrue forKey:@"AXChecked"];
          }
          uint64_t v41 = v70;
        }
        id v42 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v42);
    }

    [(TripleClickController *)self setAllSpecifiersUnsearchable:obj];
    id v59 = [obj copy];
    v60 = *(void **)&self->AXUISettingsBaseListController_opaque[v67];
    *(void *)&self->AXUISettingsBaseListController_opaque[v67] = v59;

    [(TripleClickController *)self _reorderSpecifiers];
    id v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v67];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)TripleClickController;
  uint64_t v4 = [(TripleClickController *)&v20 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = +[UIImage systemImageNamed:@"checkmark"];
  id v6 = [v4 imageView];
  [v6 setImage:v5];

  id v7 = [v4 imageView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [v4 imageView];
  v13 = [v12 image];
  [v13 size];
  double v15 = v14;
  double v17 = v16;

  id v18 = [v4 imageView];
  objc_msgSend(v18, "setFrame:", v9, v11, v15, v17);

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v21 = a4;
  id v7 = [(TripleClickController *)self specifierForIndexPath:a5];
  double v8 = [v7 propertyForKey:@"tripleClickOption"];
  uint64_t v9 = [(TripleClickController *)self _optionFromSpecifierKey:v8];

  double v10 = [v21 imageView];
  double v11 = [v10 superview];

  if (!v11)
  {
    uint64_t v12 = [v21 contentView];
    v13 = [v21 imageView];
    [v12 addSubview:v13];
  }
  if ([(TripleClickController *)self _optionIsDisabled:v9])
  {
    double v14 = [v21 titleLabel];
    [v14 setEnabled:0];

    [v21 setSelectionStyle:0];
  }
  double v15 = [v7 propertyForKey:@"AXChecked"];
  unsigned int v16 = [v15 BOOLValue];

  double v17 = 0.0;
  if (v16)
  {
    id v18 = [v21 titleLabel];
    unsigned int v19 = [v18 isEnabled];

    if (v19) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.5;
    }
  }
  objc_super v20 = [v21 imageView];
  [v20 setAlpha:v17];

  [v21 setNeedsLayout];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = [v7 section];
  uint64_t v9 = v7;
  if ((uint64_t)v8 < (uint64_t)[v6 section])
  {
    uint64_t v9 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v6 section]);
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(TripleClickController *)self specifierForIndexPath:a4];
  [v4 propertyForKey:@"tripleClickOption"];

  return 1;
}

- (void)_saveTripleClickOptions
{
  v37 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  id v3 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CFStringRef v39 = self;
  id obj = [(TripleClickController *)self specifiers];
  id v4 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v41;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v9 = [v8 propertyForKey:@"tripleClickOption"];
        id v10 = (id)[(TripleClickController *)v39 _optionFromSpecifierKey:v9];
        double v11 = AXLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v8 propertyForKey:@"AXChecked"];
          *(_DWORD *)buf = 138412802;
          v45 = v9;
          __int16 v46 = 1024;
          LODWORD(v47[0]) = v10;
          WORD2(v47[0]) = 2112;
          *(void *)((char *)v47 + 6) = v12;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Saving TC option: value: %@, newOption:%d checked:%@", buf, 0x1Cu);
        }
        if (v10)
        {
          v13 = [v8 propertyForKey:@"AXChecked"];
          unsigned int v14 = [v13 BOOLValue];

          if (v14)
          {
            double v15 = +[NSNumber numberWithInt:v10];
            [(NSArray *)v37 addObject:v15];
          }
          if (v10 == 11)
          {
            unsigned int v16 = [v8 propertyForKey:@"AXChecked"];
            id v17 = [v16 BOOLValue];
            id v18 = +[AXSettings sharedInstance];
            [v18 setTouchAccommodationsTripleClickConfirmed:v17];
          }
          unsigned int v19 = +[NSNumber numberWithInt:v10];
          [v3 addObject:v19];
        }
        else
        {
          objc_super v20 = +[NSNumber numberWithInt:v10];
          [v3 addObject:v20];

          id v21 = [v8 propertyForKey:@"AXChecked"];
          unsigned int v22 = [v21 BOOLValue];

          if (!v22) {
            goto LABEL_18;
          }
          unsigned int v19 = AXLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = +[NSNumber numberWithUnsignedInt:0];
            v24 = [v8 name];
            *(_DWORD *)buf = 138412546;
            v45 = v23;
            __int16 v46 = 2112;
            v47[0] = v24;
            _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Triple Click Options in wrong state option: %@, name: %@", buf, 0x16u);
          }
        }

LABEL_18:
      }
      id v5 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v5);
  }

  v25 = +[AXSubsystemAXSettings sharedInstance];
  unsigned __int8 v26 = [v25 ignoreLogging];

  if ((v26 & 1) == 0)
  {
    id v27 = +[AXSubsystemAXSettings identifier];
    id v28 = AXLoggerForFacility();

    os_log_type_t v29 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = AXColorizeFormatLog();
      v35 = v3;
      v36 = v37;
      v31 = _AXStringForArgs();
      if (os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v31;
        _os_log_impl(&dword_0, v28, v29, "%{public}@", buf, 0xCu);
      }
    }
  }
  unsigned __int8 v32 = +[AXSettings sharedInstance];
  [v32 setTripleClickOrderedOptions:v3];

  tripleClickOptions = v39->_tripleClickOptions;
  v39->_tripleClickOptions = v37;
  v34 = v37;

  _AXSSetTripleClickOptions();
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v14 = [(TripleClickController *)self specifierForIndexPath:v8];
  uint64_t v9 = OBJC_IVAR___PSListController__specifiers;
  id v10 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
  id v11 = [(TripleClickController *)self indexForIndexPath:v8];

  [v10 removeObjectAtIndex:v11];
  id v12 = [(TripleClickController *)self indexForIndexPath:v7];

  [v10 insertObject:v14 atIndex:v12];
  v13 = *(void **)&self->AXUISettingsBaseListController_opaque[v9];
  *(void *)&self->AXUISettingsBaseListController_opaque[v9] = v10;

  [(TripleClickController *)self _saveTripleClickOptions];
}

- (void)viewWillAppear:(BOOL)a3
{
  [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] setDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)TripleClickController;
  [(TripleClickController *)&v4 viewWillAppear:1];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TripleClickController;
  [(TripleClickController *)&v4 dealloc];
}

- (BOOL)_optionIsDisabled:(int)a3
{
  return _AXSTripleClickIsComputedOption()
      || a3 == 13
      || a3 == 9 && _AXSAssistiveTouchScannerEnabled();
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellForRowAtIndexPath:v6];
  id v8 = [v7 specifier];
  uint64_t v9 = [v8 propertyForKey:@"tripleClickOption"];

  if ([(TripleClickController *)self _optionIsDisabled:[(TripleClickController *)self _optionFromSpecifierKey:v9]])
  {
    id v10 = 0;
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    id v10 = v6;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)TripleClickController;
  id v6 = a4;
  id v7 = a3;
  [(TripleClickController *)&v33 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 specifier];
    id v10 = [v9 propertyForKey:@"AXChecked"];
    unsigned int v11 = [v10 BOOLValue];
    char v12 = v11;
    uint64_t v13 = v11 ^ 1;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __59__TripleClickController_tableView_didSelectRowAtIndexPath___block_invoke;
    v29[3] = &unk_2094C8;
    id v14 = v9;
    char v32 = v13;
    id v30 = v14;
    v31 = self;
    double v15 = objc_retainBlock(v29);
    unsigned int v16 = v15;
    if (v12)
    {
      ((void (*)(void *))v15[2])(v15);
    }
    else
    {
      v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      unsigned __int8 v26 = __59__TripleClickController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      id v27 = &unk_208920;
      id v28 = v15;
      [(TripleClickController *)self accessibilityPerformTripleClickAddingBlockConfirmingSOSConflicts:&v24 cancellationBlock:0];
    }
    id v17 = objc_msgSend(v8, "specifier", v24, v25, v26, v27);
    id v18 = [v17 propertyForKey:@"coreAnalyticsEvent"];

    unsigned int v19 = [v8 specifier];
    objc_super v20 = [v19 propertyForKey:@"tripleClickOption"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = AXLogCommon();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v20;
          __int16 v38 = 1024;
          int v39 = v13;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Configure shortcut '%@', checked %{BOOL}d", buf, 0x12u);
        }

        v34[0] = @"option";
        v34[1] = @"enable";
        v35[0] = v20;
        unsigned int v22 = +[NSNumber numberWithBool:v13];
        v35[1] = v22;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
        AnalyticsSendEvent();
      }
    }
  }
}

id __59__TripleClickController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v2 setProperty:v3 forKey:@"AXChecked"];

  [*(id *)(a1 + 40) _saveTripleClickOptions];
  uint64_t v5 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(a1 + 40);

  return [v4 reloadSpecifier:v5];
}

uint64_t __59__TripleClickController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end