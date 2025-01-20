@interface AXCCSoundDetectionModuleViewController
- (AXCCSoundDetectionModuleViewControllerDelegate)soundDetectionDelegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isHeySiriRunning;
- (BOOL)_needsHeySiriConfirmationAlert;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUIToggleModule)module;
- (double)_calculateAmountOfVisibleItems;
- (id)_confirmationAlertController;
- (id)contentModuleContext;
- (void)_axSettingsDidChange;
- (void)_configureMenuItems;
- (void)_confirmedEnableSoundDetection:(BOOL)a3;
- (void)_confirmedToggleSoundDetectionStatusForCustomType:(id)a3;
- (void)_confirmedToggleSoundDetectionStatusForType:(id)a3;
- (void)_showConfirmationAlertForCustomType:(id)a3;
- (void)_showConfirmationAlertForType:(id)a3;
- (void)_toggleSoundDetectionStatusForCustomType:(id)a3;
- (void)_toggleSoundDetectionStatusForType:(id)a3;
- (void)_updateSoundDetectionState;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)buttonTouchDown:(id)a3 forEvent:(id)a4;
- (void)setContentModuleContext:(id)a3;
- (void)setModule:(id)a3;
- (void)setSoundDetectionDelegate:(id)a3;
- (void)viewDidLoad;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation AXCCSoundDetectionModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)AXCCSoundDetectionModuleViewController;
  [(CCUIMenuModuleViewController *)&v13 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [MEMORY[0x263F1C6B0] imageNamed:@"SoundDetectionIcon" inBundle:v3];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v4];
  [(AXCCSoundDetectionModuleViewController *)self _calculateAmountOfVisibleItems];
  -[CCUIMenuModuleViewController setVisibleMenuItems:](self, "setVisibleMenuItems:");
  [(CCUIMenuModuleViewController *)self setUseTrailingCheckmarkLayout:1];
  v5 = sub_2405FE5FC(@"sound.recognition.title");
  [(CCUIMenuModuleViewController *)self setTitle:v5];

  [(CCUIMenuModuleViewController *)self setIndentation:1];
  objc_initWeak(&location, self);
  v6 = sub_2405FE5FC(@"settings.button");
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2405FEA48;
  v10[3] = &unk_2650C6FD0;
  objc_copyWeak(&v11, &location);
  [(CCUIMenuModuleViewController *)self setFooterButtonTitle:v6 handler:v10];

  v7 = [MEMORY[0x263F21DA0] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2405FEA8C;
  v8[3] = &unk_2650C6FF8;
  objc_copyWeak(&v9, &location);
  [v7 registerUpdateBlock:v8 forRetrieveSelector:sel_soundDetectionState withListener:self];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)buttonTouchDown:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F21DA0] sharedInstance];
  if ([v8 soundDetectionState])
  {
    v11.receiver = self;
    v11.super_class = (Class)AXCCSoundDetectionModuleViewController;
    [(CCUIButtonModuleViewController *)&v11 buttonTouchDown:v6 forEvent:v7];
  }
  else
  {
    id v9 = AXLogUltron();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2405FD000, v9, OS_LOG_TYPE_INFO, "SR CC Button Tapped - Sound Detection State is OFF. Directing the user to settings.", buf, 2u);
    }

    v10 = [(AXCCSoundDetectionModuleViewController *)self soundDetectionDelegate];
    [v10 openSoundDetectionSettings];
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl(&dword_2405FD000, v5, OS_LOG_TYPE_INFO, "SR CC Button Tapped.", (uint8_t *)v23, 2u);
  }

  id v6 = [MEMORY[0x263F21DA0] sharedInstance];
  if (![v6 soundDetectionState])
  {
    v8 = AXLogUltron();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v10 = [(AXCCSoundDetectionModuleViewController *)self soundDetectionDelegate];
      [v10 openSoundDetectionSettings];
      goto LABEL_10;
    }
    LOWORD(v23[0]) = 0;
    id v9 = "SR CC Button Tapped - Sound Detection State is OFF. Directing the user to settings.";
LABEL_8:
    _os_log_impl(&dword_2405FD000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)v23, 2u);
    goto LABEL_9;
  }
  id v7 = [v6 supportedSoundDetectionTypes];
  if ([v7 count])
  {

    goto LABEL_12;
  }
  objc_super v11 = [v6 enabledKShotDetectorIdentifiers];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v8 = AXLogUltron();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    LOWORD(v23[0]) = 0;
    id v9 = "SR CC Button Tapped - no detectors supported. Directing the user to settings";
    goto LABEL_8;
  }
LABEL_12:
  objc_super v13 = [v6 enabledSoundDetectionTypes];
  if (![v13 count])
  {
    v14 = [v6 enabledKShotDetectorIdentifiers];
    uint64_t v15 = [v14 count];

    if (v15) {
      goto LABEL_15;
    }
    v21 = AXLogUltron();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_2405FD000, v21, OS_LOG_TYPE_INFO, "SR CC Button Tapped - no detectors on. Expanding module", (uint8_t *)v23, 2u);
    }

    v10 = [(AXCCSoundDetectionModuleViewController *)self module];
    v22 = [v10 contentModuleContext];
    [v22 requestExpandModule];

LABEL_10:
    goto LABEL_24;
  }

LABEL_15:
  uint64_t v16 = [v6 soundDetectionState];
  v17 = AXLogUltron();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    BOOL v18 = [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning];
    BOOL v19 = [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert];
    v23[0] = 67109632;
    v23[1] = v16 != 2;
    __int16 v24 = 1024;
    BOOL v25 = v18;
    __int16 v26 = 1024;
    BOOL v27 = v19;
    _os_log_impl(&dword_2405FD000, v17, OS_LOG_TYPE_INFO, "SR CC Button Tapped with detectors already on. shouldEnable: %d, isHSRunning: %d, needsHSAlert: %d", (uint8_t *)v23, 0x14u);
  }

  if (v16 != 2
    && [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert]
    && [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning])
  {
    v20 = AXLogUltron();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_2405FD000, v20, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)v23, 2u);
    }

    [(AXCCSoundDetectionModuleViewController *)self _showConfirmationAlertForType:0];
  }
  else
  {
    [(AXCCSoundDetectionModuleViewController *)self _confirmedEnableSoundDetection:v16 != 2];
  }
LABEL_24:
}

- (void)_confirmedEnableSoundDetection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263F21DA0] sharedInstance];
  id v6 = v5;
  if (v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v5 setSoundDetectionState:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);
  [WeakRetained setSelected:v3];

  [(CCUIButtonModuleViewController *)self setSelected:v3];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  v2 = [MEMORY[0x263F21DA0] sharedInstance];
  BOOL v3 = [v2 supportedSoundDetectionTypes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_axSettingsDidChange
{
  if (![(CCUIButtonModuleViewController *)self isExpanded])
  {
    id v3 = [MEMORY[0x263F21DA0] sharedInstance];
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", [v3 soundDetectionState] == 2);
  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AXCCSoundDetectionModuleViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v6, sel_willTransitionToExpandedContentMode_);
  [(AXCCSoundDetectionModuleViewController *)self _configureMenuItems];
  if (v3)
  {
    [(CCUIButtonModuleViewController *)self setSelected:0];
  }
  else
  {
    v5 = [(AXCCSoundDetectionModuleViewController *)self module];
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", [v5 isSelected]);
  }
}

- (double)_calculateAmountOfVisibleItems
{
  v2 = [MEMORY[0x263F21DA0] sharedInstance];
  BOOL v3 = [v2 supportedSoundDetectionTypes];
  unint64_t v4 = [v3 count];

  double result = 5.5;
  if (v4 <= 5) {
    return (double)v4;
  }
  return result;
}

- (void)_toggleSoundDetectionStatusForType:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F21DA0] sharedInstance];
  objc_super v6 = [v5 enabledSoundDetectionTypes];
  if ([v6 count])
  {
    int v7 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F21DA0] sharedInstance];
    id v9 = [v8 enabledSoundDetectionTypes];
    int v7 = [v9 containsObject:v4] ^ 1;
  }
  v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138413058;
    id v13 = v4;
    __int16 v14 = 1024;
    int v15 = v7;
    __int16 v16 = 1024;
    BOOL v17 = [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning];
    __int16 v18 = 1024;
    BOOL v19 = [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert];
    _os_log_impl(&dword_2405FD000, v10, OS_LOG_TYPE_INFO, "Toggle Detector: %@. isTransitioningToRunning = %d. isHSRunning = %d, needsHSAlert = %d", (uint8_t *)&v12, 0x1Eu);
  }

  if (v7
    && [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert]
    && [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning])
  {
    objc_super v11 = AXLogUltron();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2405FD000, v11, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)&v12, 2u);
    }

    [(AXCCSoundDetectionModuleViewController *)self _showConfirmationAlertForType:v4];
  }
  else
  {
    [(AXCCSoundDetectionModuleViewController *)self _confirmedToggleSoundDetectionStatusForType:v4];
  }
}

- (void)_toggleSoundDetectionStatusForCustomType:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F21DA0] sharedInstance];
  objc_super v6 = [v5 enabledKShotDetectorIdentifiers];
  if ([v6 count])
  {
    int v7 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F21DA0] sharedInstance];
    id v9 = [v8 enabledKShotDetectorIdentifiers];
    v10 = [v4 identifier];
    int v7 = [v9 containsObject:v10] ^ 1;
  }
  objc_super v11 = AXLogUltron();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = [v4 name];
    int v14 = 138413058;
    int v15 = v12;
    __int16 v16 = 1024;
    int v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning];
    __int16 v20 = 1024;
    BOOL v21 = [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert];
    _os_log_impl(&dword_2405FD000, v11, OS_LOG_TYPE_INFO, "Toggle Custom Detector: %@. isTransitioningToRunning = %d. isHSRunning = %d, needsHSAlert = %d", (uint8_t *)&v14, 0x1Eu);
  }
  if (v7
    && [(AXCCSoundDetectionModuleViewController *)self _needsHeySiriConfirmationAlert]
    && [(AXCCSoundDetectionModuleViewController *)self _isHeySiriRunning])
  {
    id v13 = AXLogUltron();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_2405FD000, v13, OS_LOG_TYPE_INFO, "Requesting show confirmation alert.", (uint8_t *)&v14, 2u);
    }

    [(AXCCSoundDetectionModuleViewController *)self _showConfirmationAlertForCustomType:v4];
  }
  else
  {
    [(AXCCSoundDetectionModuleViewController *)self _confirmedToggleSoundDetectionStatusForCustomType:v4];
  }
}

- (void)_confirmedToggleSoundDetectionStatusForType:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x263F21DA0] sharedInstance];
  v5 = [v4 enabledSoundDetectionTypes];
  int v6 = [v5 containsObject:v9];

  int v7 = [MEMORY[0x263F21DA0] sharedInstance];
  v8 = v7;
  if (v6) {
    [v7 removeSoundDetectionType:v9];
  }
  else {
    [v7 addSoundDetectionType:v9];
  }

  [(AXCCSoundDetectionModuleViewController *)self _configureMenuItems];
  [(AXCCSoundDetectionModuleViewController *)self _updateSoundDetectionState];
}

- (void)_confirmedToggleSoundDetectionStatusForCustomType:(id)a3
{
  id v4 = (void *)MEMORY[0x263F21DA0];
  id v5 = a3;
  int v6 = [v4 sharedInstance];
  int v7 = [v6 enabledKShotDetectorIdentifiers];
  v8 = [v5 identifier];
  int v9 = [v7 containsObject:v8];

  v10 = [MEMORY[0x263F21DA0] sharedInstance];
  [v10 setKShotDetectorIsEnabled:v5 isEnabled:v9 ^ 1u];

  [(AXCCSoundDetectionModuleViewController *)self _configureMenuItems];

  [(AXCCSoundDetectionModuleViewController *)self _updateSoundDetectionState];
}

- (void)_updateSoundDetectionState
{
  v2 = [MEMORY[0x263F21DA0] sharedInstance];
  BOOL v3 = [v2 enabledSoundDetectionTypes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 2;
  }
  else
  {
    int v6 = [MEMORY[0x263F21DA0] sharedInstance];
    int v7 = [v6 enabledKShotDetectorIdentifiers];
    if ([v7 count]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  id v8 = [MEMORY[0x263F21DA0] sharedInstance];
  [v8 setSoundDetectionState:v5];
}

- (BOOL)_needsHeySiriConfirmationAlert
{
  return AXDeviceSupportsConcurrentHPLPMics() ^ 1;
}

- (BOOL)_isHeySiriRunning
{
  v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_2405FD000, v2, OS_LOG_TYPE_INFO, "Checking is HS Running?", v6, 2u);
  }

  BOOL v3 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v4 = [v3 voiceTriggerEnabled];

  return v4;
}

- (id)_confirmationAlertController
{
  v2 = (void *)MEMORY[0x263F1C3F8];
  BOOL v3 = sub_2405FE5FC(@"confirmation.alert.title");
  char v4 = sub_2405FE5FC(@"confirmation.alert.body");
  uint64_t v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  int v6 = (void *)MEMORY[0x263F1C3F0];
  int v7 = sub_2405FE5FC(@"confirmation.alert.cancel");
  id v8 = [v6 actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];

  return v5;
}

- (void)_showConfirmationAlertForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXCCSoundDetectionModuleViewController *)self _confirmationAlertController];
  int v6 = (void *)MEMORY[0x263F1C3F0];
  int v7 = sub_2405FE5FC(@"confirmation.alert.ok");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2405FFA8C;
  v12[3] = &unk_2650C7020;
  id v13 = v4;
  int v14 = self;
  id v8 = v4;
  int v9 = [v6 actionWithTitle:v7 style:0 handler:v12];

  [v5 addAction:v9];
  v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl(&dword_2405FD000, v10, OS_LOG_TYPE_INFO, "Presenting confirmation alert.", v11, 2u);
  }

  [(AXCCSoundDetectionModuleViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_showConfirmationAlertForCustomType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXCCSoundDetectionModuleViewController *)self _confirmationAlertController];
  int v6 = (void *)MEMORY[0x263F1C3F0];
  int v7 = sub_2405FE5FC(@"confirmation.alert.ok");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2405FFBF4;
  v12[3] = &unk_2650C7020;
  id v13 = v4;
  int v14 = self;
  id v8 = v4;
  int v9 = [v6 actionWithTitle:v7 style:0 handler:v12];

  [v5 addAction:v9];
  v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl(&dword_2405FD000, v10, OS_LOG_TYPE_INFO, "Presenting confirmation alert.", v11, 2u);
  }

  [(AXCCSoundDetectionModuleViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_configureMenuItems
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v124 = objc_alloc_init(MEMORY[0x263EFF980]);
  v2 = [MEMORY[0x263F21DA0] sharedInstance];
  v120 = [v2 supportedSoundDetectionTypes];

  BOOL v3 = [MEMORY[0x263F21DA0] sharedInstance];
  id v4 = [v3 decodedKShotDetectors];
  v119 = [v4 allValues];

  v118 = [v119 axFilterObjectsUsingBlock:&unk_26F4BAFD0];
  uint64_t v5 = [v119 axFilterObjectsUsingBlock:&unk_26F4BAFF0];
  int v6 = (void *)MEMORY[0x263F21D58];
  if ([v120 containsObject:*MEMORY[0x263F21D58]])
  {
    int v7 = sub_2405FE5FC(@"fire.alarm");
    id v8 = objc_alloc(MEMORY[0x263F33CC0]);
    v165[0] = MEMORY[0x263EF8330];
    v165[1] = 3221225472;
    v165[2] = sub_2406013E8;
    v165[3] = &unk_2650C6FD0;
    objc_copyWeak(&v166, &location);
    int v9 = (void *)[v8 initWithTitle:v7 identifier:v7 handler:v165];
    v10 = [MEMORY[0x263F21DA0] sharedInstance];
    objc_super v11 = [v10 enabledSoundDetectionTypes];
    objc_msgSend(v9, "setSelected:", objc_msgSend(v11, "containsObject:", *v6));

    [v124 addObject:v9];
    objc_destroyWeak(&v166);
  }
  int v12 = (void *)MEMORY[0x263F21D88];
  if (objc_msgSend(v120, "containsObject:", *MEMORY[0x263F21D88], self))
  {
    id v13 = sub_2405FE5FC(@"siren");
    id v14 = objc_alloc(MEMORY[0x263F33CC0]);
    v163[0] = MEMORY[0x263EF8330];
    v163[1] = 3221225472;
    v163[2] = sub_240601428;
    v163[3] = &unk_2650C6FD0;
    objc_copyWeak(&v164, &location);
    int v15 = (void *)[v14 initWithTitle:v13 identifier:v13 handler:v163];
    __int16 v16 = [MEMORY[0x263F21DA0] sharedInstance];
    int v17 = [v16 enabledSoundDetectionTypes];
    objc_msgSend(v15, "setSelected:", objc_msgSend(v17, "containsObject:", *v12));

    [v124 addObject:v15];
    objc_destroyWeak(&v164);
  }
  __int16 v18 = (void *)MEMORY[0x263F21D90];
  if ([v120 containsObject:*MEMORY[0x263F21D90]])
  {
    BOOL v19 = sub_2405FE5FC(@"smoke.alarm");
    id v20 = objc_alloc(MEMORY[0x263F33CC0]);
    v161[0] = MEMORY[0x263EF8330];
    v161[1] = 3221225472;
    v161[2] = sub_240601468;
    v161[3] = &unk_2650C6FD0;
    objc_copyWeak(&v162, &location);
    BOOL v21 = (void *)[v20 initWithTitle:v19 identifier:v19 handler:v161];
    uint64_t v22 = [MEMORY[0x263F21DA0] sharedInstance];
    v23 = [v22 enabledSoundDetectionTypes];
    objc_msgSend(v21, "setSelected:", objc_msgSend(v23, "containsObject:", *v18));

    [v124 addObject:v21];
    objc_destroyWeak(&v162);
  }
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  obuint64_t j = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v157 objects:v169 count:16];
  if (v24)
  {
    id v122 = *(id *)v158;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(id *)v158 != v122) {
          objc_enumerationMutation(obj);
        }
        __int16 v26 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        BOOL v27 = [v26 name];
        id v28 = objc_alloc(MEMORY[0x263F33CC0]);
        v155[0] = MEMORY[0x263EF8330];
        v155[1] = 3221225472;
        v155[2] = sub_2406014A8;
        v155[3] = &unk_2650C7068;
        objc_copyWeak(&v156, &location);
        v155[4] = v26;
        v29 = (void *)[v28 initWithTitle:v27 identifier:v27 handler:v155];
        v30 = [MEMORY[0x263F21DA0] sharedInstance];
        v31 = [v30 enabledKShotDetectorIdentifiers];
        v32 = [v26 identifier];
        objc_msgSend(v29, "setSelected:", objc_msgSend(v31, "containsObject:", v32));

        [v124 addObject:v29];
        objc_destroyWeak(&v156);
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v157 objects:v169 count:16];
    }
    while (v24);
  }

  v33 = (void *)MEMORY[0x263F21D28];
  if ([v120 containsObject:*MEMORY[0x263F21D28]])
  {
    v34 = sub_2405FE5FC(@"cat");
    id v35 = objc_alloc(MEMORY[0x263F33CC0]);
    v153[0] = MEMORY[0x263EF8330];
    v153[1] = 3221225472;
    v153[2] = sub_2406014E4;
    v153[3] = &unk_2650C6FD0;
    objc_copyWeak(&v154, &location);
    v36 = (void *)[v35 initWithTitle:v34 identifier:v34 handler:v153];
    v37 = [MEMORY[0x263F21DA0] sharedInstance];
    v38 = [v37 enabledSoundDetectionTypes];
    objc_msgSend(v36, "setSelected:", objc_msgSend(v38, "containsObject:", *v33));

    [v124 addObject:v36];
    objc_destroyWeak(&v154);
  }
  v39 = (void *)MEMORY[0x263F21D40];
  if ([v120 containsObject:*MEMORY[0x263F21D40]])
  {
    v40 = sub_2405FE5FC(@"dog");
    id v41 = objc_alloc(MEMORY[0x263F33CC0]);
    v151[0] = MEMORY[0x263EF8330];
    v151[1] = 3221225472;
    v151[2] = sub_240601524;
    v151[3] = &unk_2650C6FD0;
    objc_copyWeak(&v152, &location);
    v42 = (void *)[v41 initWithTitle:v40 identifier:v40 handler:v151];
    v43 = [MEMORY[0x263F21DA0] sharedInstance];
    v44 = [v43 enabledSoundDetectionTypes];
    objc_msgSend(v42, "setSelected:", objc_msgSend(v44, "containsObject:", *v39));

    [v124 addObject:v42];
    objc_destroyWeak(&v152);
  }
  v45 = (void *)MEMORY[0x263F21D08];
  if (([v120 containsObject:*MEMORY[0x263F21D08]] & 1) != 0
    || ([v120 containsObject:*MEMORY[0x263F21D10]] & 1) != 0
    || [v120 containsObject:*MEMORY[0x263F21D18]])
  {
    v46 = sub_2405FE5FC(@"appliances");
    id v47 = objc_alloc(MEMORY[0x263F33CC0]);
    v149[0] = MEMORY[0x263EF8330];
    v149[1] = 3221225472;
    v149[2] = sub_240601564;
    v149[3] = &unk_2650C6FD0;
    objc_copyWeak(&v150, &location);
    v48 = (void *)[v47 initWithTitle:v46 identifier:v46 handler:v149];
    v49 = [MEMORY[0x263F21DA0] sharedInstance];
    v50 = [v49 enabledSoundDetectionTypes];

    if ([v50 containsObject:*v45]
      && [v50 containsObject:*MEMORY[0x263F21D10]])
    {
      uint64_t v51 = [v50 containsObject:*MEMORY[0x263F21D18]];
    }
    else
    {
      uint64_t v51 = 0;
    }
    [v48 setSelected:v51];
    [v124 addObject:v48];

    objc_destroyWeak(&v150);
  }
  v52 = (void *)MEMORY[0x263F21D20];
  if ([v120 containsObject:*MEMORY[0x263F21D20]])
  {
    v53 = sub_2405FE5FC(@"car.horn");
    id v54 = objc_alloc(MEMORY[0x263F33CC0]);
    v147[0] = MEMORY[0x263EF8330];
    v147[1] = 3221225472;
    v147[2] = sub_2406015E8;
    v147[3] = &unk_2650C6FD0;
    objc_copyWeak(&v148, &location);
    v55 = (void *)[v54 initWithTitle:v53 identifier:v53 handler:v147];
    v56 = [MEMORY[0x263F21DA0] sharedInstance];
    v57 = [v56 enabledSoundDetectionTypes];
    objc_msgSend(v55, "setSelected:", objc_msgSend(v57, "containsObject:", *v52));

    [v124 addObject:v55];
    objc_destroyWeak(&v148);
  }
  v58 = (void *)MEMORY[0x263F21D50];
  if ([v120 containsObject:*MEMORY[0x263F21D50]])
  {
    v59 = sub_2405FE5FC(@"door.bell");
    id v60 = objc_alloc(MEMORY[0x263F33CC0]);
    v145[0] = MEMORY[0x263EF8330];
    v145[1] = 3221225472;
    v145[2] = sub_240601628;
    v145[3] = &unk_2650C6FD0;
    objc_copyWeak(&v146, &location);
    v61 = (void *)[v60 initWithTitle:v59 identifier:v59 handler:v145];
    v62 = [MEMORY[0x263F21DA0] sharedInstance];
    v63 = [v62 enabledSoundDetectionTypes];
    objc_msgSend(v61, "setSelected:", objc_msgSend(v63, "containsObject:", *v58));

    [v124 addObject:v61];
    objc_destroyWeak(&v146);
  }
  v64 = (void *)MEMORY[0x263F21D48];
  if ([v120 containsObject:*MEMORY[0x263F21D48]])
  {
    v65 = sub_2405FE5FC(@"door.knock");
    id v66 = objc_alloc(MEMORY[0x263F33CC0]);
    v143[0] = MEMORY[0x263EF8330];
    v143[1] = 3221225472;
    v143[2] = sub_240601668;
    v143[3] = &unk_2650C6FD0;
    objc_copyWeak(&v144, &location);
    v67 = (void *)[v66 initWithTitle:v65 identifier:v65 handler:v143];
    v68 = [MEMORY[0x263F21DA0] sharedInstance];
    v69 = [v68 enabledSoundDetectionTypes];
    objc_msgSend(v67, "setSelected:", objc_msgSend(v69, "containsObject:", *v64));

    [v124 addObject:v67];
    objc_destroyWeak(&v144);
  }
  v70 = (void *)MEMORY[0x263F21D60];
  if ([v120 containsObject:*MEMORY[0x263F21D60]])
  {
    v71 = sub_2405FE5FC(@"glass.breaking");
    id v72 = objc_alloc(MEMORY[0x263F33CC0]);
    v141[0] = MEMORY[0x263EF8330];
    v141[1] = 3221225472;
    v141[2] = sub_2406016A8;
    v141[3] = &unk_2650C6FD0;
    objc_copyWeak(&v142, &location);
    v73 = (void *)[v72 initWithTitle:v71 identifier:v71 handler:v141];
    v74 = [MEMORY[0x263F21DA0] sharedInstance];
    v75 = [v74 enabledSoundDetectionTypes];
    objc_msgSend(v73, "setSelected:", objc_msgSend(v75, "containsObject:", *v70));

    [v124 addObject:v73];
    objc_destroyWeak(&v142);
  }
  v76 = (void *)MEMORY[0x263F21D70];
  if ([v120 containsObject:*MEMORY[0x263F21D70]])
  {
    v77 = sub_2405FE5FC(@"kettle");
    id v78 = objc_alloc(MEMORY[0x263F33CC0]);
    v139[0] = MEMORY[0x263EF8330];
    v139[1] = 3221225472;
    v139[2] = sub_2406016E8;
    v139[3] = &unk_2650C6FD0;
    objc_copyWeak(&v140, &location);
    v79 = (void *)[v78 initWithTitle:v77 identifier:v77 handler:v139];
    v80 = [MEMORY[0x263F21DA0] sharedInstance];
    v81 = [v80 enabledSoundDetectionTypes];
    objc_msgSend(v79, "setSelected:", objc_msgSend(v81, "containsObject:", *v76));

    [v124 addObject:v79];
    objc_destroyWeak(&v140);
  }
  v82 = (void *)MEMORY[0x263F21D98];
  if ([v120 containsObject:*MEMORY[0x263F21D98]])
  {
    v83 = sub_2405FE5FC(@"water.running");
    id v84 = objc_alloc(MEMORY[0x263F33CC0]);
    v137[0] = MEMORY[0x263EF8330];
    v137[1] = 3221225472;
    v137[2] = sub_240601728;
    v137[3] = &unk_2650C6FD0;
    objc_copyWeak(&v138, &location);
    v85 = (void *)[v84 initWithTitle:v83 identifier:v83 handler:v137];
    v86 = [MEMORY[0x263F21DA0] sharedInstance];
    v87 = [v86 enabledSoundDetectionTypes];
    objc_msgSend(v85, "setSelected:", objc_msgSend(v87, "containsObject:", *v82));

    [v124 addObject:v85];
    objc_destroyWeak(&v138);
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v123 = v118;
  uint64_t v88 = [v123 countByEnumeratingWithState:&v133 objects:v168 count:16];
  if (v88)
  {
    uint64_t v89 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v88; ++j)
      {
        if (*(void *)v134 != v89) {
          objc_enumerationMutation(v123);
        }
        v91 = *(void **)(*((void *)&v133 + 1) + 8 * j);
        v92 = [v91 name];
        id v93 = objc_alloc(MEMORY[0x263F33CC0]);
        v131[0] = MEMORY[0x263EF8330];
        v131[1] = 3221225472;
        v131[2] = sub_240601768;
        v131[3] = &unk_2650C7068;
        objc_copyWeak(&v132, &location);
        v131[4] = v91;
        v94 = (void *)[v93 initWithTitle:v92 identifier:v92 handler:v131];
        v95 = [MEMORY[0x263F21DA0] sharedInstance];
        v96 = [v95 enabledKShotDetectorIdentifiers];
        v97 = [v91 identifier];
        objc_msgSend(v94, "setSelected:", objc_msgSend(v96, "containsObject:", v97));

        [v124 addObject:v94];
        objc_destroyWeak(&v132);
      }
      uint64_t v88 = [v123 countByEnumeratingWithState:&v133 objects:v168 count:16];
    }
    while (v88);
  }

  v98 = (void *)MEMORY[0x263F21D38];
  if ([v120 containsObject:*MEMORY[0x263F21D38]])
  {
    v99 = sub_2405FE5FC(@"baby.crying");
    id v100 = objc_alloc(MEMORY[0x263F33CC0]);
    v129[0] = MEMORY[0x263EF8330];
    v129[1] = 3221225472;
    v129[2] = sub_2406017A4;
    v129[3] = &unk_2650C6FD0;
    objc_copyWeak(&v130, &location);
    v101 = (void *)[v100 initWithTitle:v99 identifier:v99 handler:v129];
    v102 = [MEMORY[0x263F21DA0] sharedInstance];
    v103 = [v102 enabledSoundDetectionTypes];
    objc_msgSend(v101, "setSelected:", objc_msgSend(v103, "containsObject:", *v98));

    [v124 addObject:v101];
    objc_destroyWeak(&v130);
  }
  v104 = (void *)MEMORY[0x263F21D80];
  if ([v120 containsObject:*MEMORY[0x263F21D80]])
  {
    v105 = sub_2405FE5FC(@"shouting");
    id v106 = objc_alloc(MEMORY[0x263F33CC0]);
    v127[0] = MEMORY[0x263EF8330];
    v127[1] = 3221225472;
    v127[2] = sub_2406017E4;
    v127[3] = &unk_2650C6FD0;
    objc_copyWeak(&v128, &location);
    v107 = (void *)[v106 initWithTitle:v105 identifier:v105 handler:v127];
    v108 = [MEMORY[0x263F21DA0] sharedInstance];
    v109 = [v108 enabledSoundDetectionTypes];
    objc_msgSend(v107, "setSelected:", objc_msgSend(v109, "containsObject:", *v104));

    [v124 addObject:v107];
    objc_destroyWeak(&v128);
  }
  v110 = (void *)MEMORY[0x263F21D30];
  if ([v120 containsObject:*MEMORY[0x263F21D30]])
  {
    v111 = sub_2405FE5FC(@"cough");
    id v112 = objc_alloc(MEMORY[0x263F33CC0]);
    v125[0] = MEMORY[0x263EF8330];
    v125[1] = 3221225472;
    v125[2] = sub_240601824;
    v125[3] = &unk_2650C6FD0;
    objc_copyWeak(&v126, &location);
    v113 = (void *)[v112 initWithTitle:v111 identifier:v111 handler:v125];
    v114 = [MEMORY[0x263F21DA0] sharedInstance];
    v115 = [v114 enabledSoundDetectionTypes];
    objc_msgSend(v113, "setSelected:", objc_msgSend(v115, "containsObject:", *v110));

    [v124 addObject:v113];
    objc_destroyWeak(&v126);
  }
  [v117 setMenuItems:v124];

  objc_destroyWeak(&location);
}

- (id)contentModuleContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentModuleContext);

  return WeakRetained;
}

- (void)setContentModuleContext:(id)a3
{
}

- (CCUIToggleModule)module
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);

  return (CCUIToggleModule *)WeakRetained;
}

- (void)setModule:(id)a3
{
}

- (AXCCSoundDetectionModuleViewControllerDelegate)soundDetectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_soundDetectionDelegate);

  return (AXCCSoundDetectionModuleViewControllerDelegate *)WeakRetained;
}

- (void)setSoundDetectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_soundDetectionDelegate);
  objc_destroyWeak((id *)&self->_module);

  objc_destroyWeak((id *)&self->_contentModuleContext);
}

@end