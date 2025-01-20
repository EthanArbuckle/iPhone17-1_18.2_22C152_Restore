@interface BackgroundSoundsCCModuleViewController
- (BOOL)_canShowWhileLocked;
- (BackgroundSoundsCCModuleViewController)init;
- (double)preferredExpandedContentHeight;
- (id)shortcutViewController;
- (void)_updateSelectedState;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)setContentModuleContext:(id)a3;
- (void)shortcutDidChangeSize:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BackgroundSoundsCCModuleViewController

- (BackgroundSoundsCCModuleViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BackgroundSoundsCCModuleViewController;
  v2 = [(BackgroundSoundsCCModuleViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F474D8]) initWithDelegate:v2 andAvailableModules:&unk_26F84BBB0];
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v3;

    [(HACCShortcutViewController *)v2->_shortcutController setPrefersContentToAlwaysExpand:1];
    [(BackgroundSoundsCCModuleViewController *)v2 addChildViewController:v2->_shortcutController];
  }
  return v2;
}

- (void)_updateSelectedState
{
  id v3 = [MEMORY[0x263F47548] sharedInstance];
  -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", [v3 comfortSoundsEnabled]);
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)BackgroundSoundsCCModuleViewController;
  [(CCUIButtonModuleViewController *)&v19 viewDidLoad];
  id v3 = [(BackgroundSoundsCCModuleViewController *)self view];
  v4 = [(HACCShortcutViewController *)self->_shortcutController view];
  [v3 addSubview:v4];

  v5 = [(CCUIButtonModuleViewController *)self buttonView];
  objc_super v6 = hearingLocString();
  [v5 setAccessibilityLabel:v6];

  v7 = [(CCUIButtonModuleViewController *)self buttonView];
  [v7 setAccessibilityIdentifier:@"AX_HEARING_DEVICES"];

  v8 = [(CCUIButtonModuleViewController *)self buttonView];
  v9 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  [v8 setAccessibilityHint:v9];

  v10 = hearingLocString();
  [(CCUIButtonModuleViewController *)self setTitle:v10];

  v11 = (void *)MEMORY[0x263F1C6B0];
  v12 = [MEMORY[0x263F1C6C8] configurationWithPointSize:3 weight:30.0];
  v13 = [v11 _systemImageNamed:@"music.quarternote.3" withConfiguration:v12];
  [(CCUIButtonModuleViewController *)self setGlyphImage:v13];

  v14 = [MEMORY[0x263F1C550] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v14];

  [(BackgroundSoundsCCModuleViewController *)self _updateSelectedState];
  objc_initWeak(&location, self);
  v15 = [MEMORY[0x263F47548] sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_24277FD7C;
  v16[3] = &unk_26516C338;
  objc_copyWeak(&v17, &location);
  [v15 registerUpdateBlock:v16 forRetrieveSelector:sel_comfortSoundsEnabled withListener:self];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)BackgroundSoundsCCModuleViewController;
  [(CCUIButtonModuleViewController *)&v6 viewWillLayoutSubviews];
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    id v3 = [(CCUIButtonModuleViewController *)self buttonView];
    [v3 setAlpha:0.0];

    [(HACCShortcutViewController *)self->_shortcutController view];
  }
  else
  {
    v4 = [(HACCShortcutViewController *)self->_shortcutController view];
    [v4 setAlpha:0.0];

    [(CCUIButtonModuleViewController *)self buttonView];
  v5 = };
  [v5 setAlpha:1.0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (double)preferredExpandedContentHeight
{
  [(HACCShortcutViewController *)self->_shortcutController preferredExpandedContentHeight];
  return result;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)shortcutDidChangeSize:(id)a3
{
  v4 = [(BackgroundSoundsCCModuleViewController *)self view];
  [v4 bounds];
  [(BackgroundSoundsCCModuleViewController *)self preferredExpandedContentHeight];

  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    MEMORY[0x270F9A6D0](self, sel_setPreferredContentSize_);
  }
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x263F47548], "sharedInstance", a3, a4);
  uint64_t v6 = [v5 comfortSoundsEnabled] ^ 1;
  v7 = [MEMORY[0x263F47548] sharedInstance];
  [v7 setComfortSoundsEnabled:v6];

  [(BackgroundSoundsCCModuleViewController *)self _updateSelectedState];
}

- (void).cxx_destruct
{
}

@end