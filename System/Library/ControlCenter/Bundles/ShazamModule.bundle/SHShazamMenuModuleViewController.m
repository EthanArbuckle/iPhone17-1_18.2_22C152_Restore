@interface SHShazamMenuModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isDeviceUnlocked;
- (BOOL)isShazamAppInstalled;
- (BOOL)prefersContextMenuDisplayStyle;
- (BOOL)selectedOnExpansion;
- (NSUserDefaults)musicRecognitionPreferences;
- (SHShazamMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SHToggleManager)toggleManager;
- (id)historyMenuItem;
- (id)recognizeMusicMenuItem;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)configureMenuItems;
- (void)dealloc;
- (void)dismissModule;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentHistoryWithAuthentication;
- (void)refreshState;
- (void)refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4;
- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3;
- (void)requestAuthenticationIfShazamIsInstalledAndProtected:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setMusicRecognitionPreferences:(id)a3;
- (void)setSelectedOnExpansion:(BOOL)a3;
- (void)setToggleManager:(id)a3;
- (void)toggleManager:(id)a3 didToggleToState:(int64_t)a4;
- (void)updateStatusMessage;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SHShazamMenuModuleViewController

- (void)dealloc
{
  [(NSUserDefaults *)self->_musicRecognitionPreferences removeObserver:self forKeyPath:@"isControlToggleOn" context:0];
  v3.receiver = self;
  v3.super_class = (Class)SHShazamMenuModuleViewController;
  [(SHShazamMenuModuleViewController *)&v3 dealloc];
}

- (SHShazamMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SHShazamMenuModuleViewController;
  v4 = [(CCUIMenuModuleViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(SHToggleManager);
    toggleManager = v4->_toggleManager;
    v4->_toggleManager = v5;

    [(SHToggleManager *)v4->_toggleManager setDelegate:v4];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"group.com.apple.musicrecognition"];
    musicRecognitionPreferences = v4->_musicRecognitionPreferences;
    v4->_musicRecognitionPreferences = (NSUserDefaults *)v7;

    [(NSUserDefaults *)v4->_musicRecognitionPreferences addObserver:v4 forKeyPath:@"isControlToggleOn" options:1 context:0];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SHShazamMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(SHShazamMenuModuleViewController *)self refreshState];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SHShazamMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v8 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F6C4B8] localizedStringForKey:@"SHAZAM_MODULE_RECOGNIZE_MUSIC"];
  [(CCUIMenuModuleViewController *)self setTitle:v3];

  [(CCUIButtonModuleViewController *)self setValueText:0];
  objc_super v4 = [MEMORY[0x263F6C4B8] localizedStringForKey:@"SHAZAM_MODULE_LISTENING"];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v4];

  v5 = (void *)MEMORY[0x263F33C68];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v5 descriptionForPackageNamed:@"Shazam" inBundle:v6];
  [(CCUIMenuModuleViewController *)self setGlyphPackageDescription:v7];

  [(CCUIMenuModuleViewController *)self setUseTrailingCheckmarkLayout:0];
  [(CCUIMenuModuleViewController *)self setIndentation:1];
  [(CCUIMenuModuleViewController *)self removeFooterButton];
  [(SHShazamMenuModuleViewController *)self configureMenuItems];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 1;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v4 = [(SHShazamMenuModuleViewController *)self toggleManager];
  [v4 toggleRecognitionState];
}

- (void)setContentModuleContext:(id)a3
{
  id v4 = (CCUIContentModuleContext *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SHShazamMenuModuleViewController;
  [(CCUIMenuModuleViewController *)&v6 setContentModuleContext:v4];
  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = v4;
}

- (void)toggleManager:(id)a3 didToggleToState:(int64_t)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2406A12A8;
  block[3] = &unk_2650CEBA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)refreshState
{
  id v3 = [(SHShazamMenuModuleViewController *)self toggleManager];
  -[SHShazamMenuModuleViewController refreshStateWithSelected:expanded:](self, "refreshStateWithSelected:expanded:", [v3 isToggleOn], -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"));
}

- (void)refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2406A13EC;
  v4[3] = &unk_2650CEBD0;
  BOOL v5 = a4;
  v4[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v4];
}

- (void)updateStatusMessage
{
  id v3 = [(SHShazamMenuModuleViewController *)self toggleManager];
  int v4 = [v3 isToggleOn];

  if (v4) {
    BOOL v5 = @"SHAZAM_MODULE_STATUS_MESSAGE_ON";
  }
  else {
    BOOL v5 = @"SHAZAM_MODULE_STATUS_MESSAGE_OFF";
  }
  if (v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = [MEMORY[0x263F6C4B8] localizedStringForKey:v5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2406A1558;
  block[3] = &unk_2650CEBF8;
  block[4] = self;
  id v10 = v7;
  uint64_t v11 = v6;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)dismissModule
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2406A1670;
  v2[3] = &unk_2650CEC20;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  if ([(SHShazamMenuModuleViewController *)self isDeviceUnlocked])
  {
    v4[2](v4, 1);
  }
  else
  {
    contentModuleContext = self->_contentModuleContext;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2406A1784;
    v6[3] = &unk_2650CEC48;
    uint64_t v7 = v4;
    [(CCUIContentModuleContext *)contentModuleContext requestAuthenticationWithCompletionHandler:v6];
  }
}

- (BOOL)isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (void)requestAuthenticationIfShazamIsInstalledAndProtected:(id)a3
{
  id v4 = a3;
  if ([(SHShazamMenuModuleViewController *)self isShazamAppInstalled])
  {
    BOOL v5 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:@"com.shazam.Shazam"];
    if ([v5 isLocked] & 1) != 0 || (objc_msgSend(v5, "isHidden"))
    {
      uint64_t v6 = shcore_log_object();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24069F000, v6, OS_LOG_TYPE_DEFAULT, "Shazam is protected, requesting authentication", buf, 2u);
      }

      uint64_t v7 = [MEMORY[0x263F251F8] sharedGuard];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2406A1928;
      v8[3] = &unk_2650CEC70;
      id v9 = v4;
      [v7 authenticateForSubject:v5 completion:v8];
    }
    else
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (BOOL)isShazamAppInstalled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = 0;
  int v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.shazam.Shazam" allowPlaceholder:0 error:&v7];
  id v3 = v7;
  if (!v2)
  {
    id v4 = shcore_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = [0 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_24069F000, v4, OS_LOG_TYPE_ERROR, "No application record for %@ found with error: %@", buf, 0x16u);
    }
  }

  return v2 != 0;
}

- (void)configureMenuItems
{
  v6[2] = *MEMORY[0x263EF8340];
  id v3 = [(SHShazamMenuModuleViewController *)self recognizeMusicMenuItem];
  id v4 = [(SHShazamMenuModuleViewController *)self historyMenuItem];
  v6[0] = v3;
  v6[1] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  [(CCUIMenuModuleViewController *)self setMenuItems:v5];
}

- (id)recognizeMusicMenuItem
{
  objc_initWeak(&location, self);
  id v3 = [(SHShazamMenuModuleViewController *)self toggleManager];
  if ([v3 isToggleOn]) {
    id v4 = @"SHAZAM_MODULE_STOP_RECOGNITION";
  }
  else {
    id v4 = @"SHAZAM_MODULE_RECOGNIZE_MUSIC";
  }
  BOOL v5 = [MEMORY[0x263F6C4B8] localizedStringForKey:v4];

  uint64_t v6 = [(SHShazamMenuModuleViewController *)self toggleManager];
  int v7 = [v6 isToggleOn];
  id v8 = @"shazam.logo.fill";
  if (v7) {
    id v8 = @"xmark";
  }
  id v9 = v8;

  id v10 = objc_alloc(MEMORY[0x263F33CC0]);
  id v11 = [MEMORY[0x263F1C6B0] _systemImageNamed:v9];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2406A1D78;
  v14[3] = &unk_2650CEC98;
  objc_copyWeak(&v15, &location);
  uint64_t v12 = (void *)[v10 initWithTitle:v5 identifier:@"com.apple.shazamkit.controlcenter.ShazamModule.recognize-music" image:v11 handler:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);

  return v12;
}

- (id)historyMenuItem
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x263F33CC0]);
  id v3 = [MEMORY[0x263F6C4B8] localizedStringForKey:@"SHAZAM_MODULE_HISTORY"];
  id v4 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"music.square.stack.fill"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2406A1F08;
  v7[3] = &unk_2650CEC98;
  objc_copyWeak(&v8, &location);
  BOOL v5 = (void *)[v2 initWithTitle:v3 identifier:@"com.apple.shazamkit.controlcenter.ShazamModule.history" image:v4 handler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

- (void)presentHistoryWithAuthentication
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_2406A2004;
  v3[3] = &unk_2650CED08;
  objc_copyWeak(&v4, &location);
  [(SHShazamMenuModuleViewController *)self requestAuthenticationIfLockedWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a5;
  if ([a3 isEqualToString:@"isControlToggleOn"])
  {
    id v8 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    int v9 = [v8 BOOLValue];

    id v10 = [(SHShazamMenuModuleViewController *)self toggleManager];
    [v10 toggleToState:v9 ^ 1u];
  }
}

- (NSUserDefaults)musicRecognitionPreferences
{
  return self->_musicRecognitionPreferences;
}

- (void)setMusicRecognitionPreferences:(id)a3
{
}

- (SHToggleManager)toggleManager
{
  return self->_toggleManager;
}

- (void)setToggleManager:(id)a3
{
}

- (BOOL)selectedOnExpansion
{
  return self->_selectedOnExpansion;
}

- (void)setSelectedOnExpansion:(BOOL)a3
{
  self->_selectedOnExpansion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleManager, 0);
  objc_storeStrong((id *)&self->_musicRecognitionPreferences, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end