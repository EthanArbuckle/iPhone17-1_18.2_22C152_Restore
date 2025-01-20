@interface AXLiveListenModuleViewController
- (AXLiveListenModuleViewController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)canDismissPresentedContent;
- (BOOL)isLiveListenEnabled;
- (NSDate)touchDownTime;
- (double)preferredExpandedContentHeight;
- (id)shortcutViewController;
- (void)_updateSelectedStatus;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)buttonTouchDown:(id)a3 forEvent:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)expandLiveListenModule;
- (void)pauseSoundRecognitionIfNecessary;
- (void)restartSoundRecognitionIfNecessary;
- (void)setContentModuleContext:(id)a3;
- (void)setIsLiveListenEnabled:(BOOL)a3;
- (void)setTouchDownTime:(id)a3;
- (void)shortcutDidChangeSize:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation AXLiveListenModuleViewController

- (AXLiveListenModuleViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXLiveListenModuleViewController;
  v2 = [(AXLiveListenModuleViewController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F474D8]) initWithDelegate:v2 andAvailableModules:&unk_26F84A9F8];
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v3;

    [(AXLiveListenModuleViewController *)v2 addChildViewController:v2->_shortcutController];
    [(HACCShortcutViewController *)v2->_shortcutController didMoveToParentViewController:v2];
    v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"mic.fill"];
    v6 = [MEMORY[0x263F1C6C8] configurationWithPointSize:30.0];
    v7 = [v5 imageByApplyingSymbolConfiguration:v6];
    [(CCUIButtonModuleViewController *)v2 setGlyphImage:v7];

    v8 = [MEMORY[0x263F1C550] systemRedColor];
    [(CCUIButtonModuleViewController *)v2 setSelectedGlyphColor:v8];
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateSelectedStatus
{
  [(AXLiveListenModuleViewController *)self isLiveListenEnabled];

  MEMORY[0x270F9A6D0](self, sel_setSelected_);
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)AXLiveListenModuleViewController;
  [(CCUIButtonModuleViewController *)&v18 viewDidLoad];
  uint64_t v3 = [(AXLiveListenModuleViewController *)self view];
  v4 = [(HACCShortcutViewController *)self->_shortcutController view];
  [v3 addSubview:v4];

  objc_initWeak(&location, self);
  v5 = [(CCUIButtonModuleViewController *)self buttonView];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_242778D08;
  v15[3] = &unk_26516BE28;
  objc_copyWeak(&v16, &location);
  [v5 _setAccessibilityTraitsBlock:v15];

  v6 = [(CCUIButtonModuleViewController *)self buttonView];
  v7 = hearingLocString();
  [v6 setAccessibilityLabel:v7];

  v8 = [(CCUIButtonModuleViewController *)self buttonView];
  [v8 setAccessibilityIdentifier:@"AX_LIVE_LISTEN"];

  v9 = [(CCUIButtonModuleViewController *)self buttonView];
  objc_super v10 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  [v9 setAccessibilityHint:v10];

  v11 = hearingLocString();
  [(CCUIButtonModuleViewController *)self setTitle:v11];

  v12 = [MEMORY[0x263F47528] sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_242778D68;
  v13[3] = &unk_26516BE78;
  objc_copyWeak(&v14, &location);
  [v12 registerListener:self forLiveListenLevelsHandler:v13];

  [(AXLiveListenModuleViewController *)self _updateSelectedStatus];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AXLiveListenModuleViewController;
  [(CCUIButtonModuleViewController *)&v7 viewWillLayoutSubviews];
  BOOL v3 = [(CCUIButtonModuleViewController *)self isExpanded];
  v4 = [(HACCShortcutViewController *)self->_shortcutController view];
  v5 = v4;
  double v6 = 0.0;
  if (v3) {
    double v6 = 1.0;
  }
  [v4 setAlpha:v6];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AXLiveListenModuleViewController;
  -[CCUIButtonModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_);
  if (v3) {
    [(AXLiveListenModuleViewController *)self pauseSoundRecognitionIfNecessary];
  }
  else {
    [(AXLiveListenModuleViewController *)self restartSoundRecognitionIfNecessary];
  }
}

- (BOOL)canDismissPresentedContent
{
  v2 = [(HACCShortcutViewController *)self->_shortcutController expandedController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)shortcutDidChangeSize:(id)a3
{
  v4 = [(AXLiveListenModuleViewController *)self view];
  [v4 bounds];
  [(AXLiveListenModuleViewController *)self preferredExpandedContentHeight];

  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    MEMORY[0x270F9A6D0](self, sel_setPreferredContentSize_);
  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  HAInitializeLogging();
  objc_super v7 = [NSString stringWithFormat:@"Dismissing Control Center"];
  v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXLiveListenModuleViewController dismissPresentedContentAnimated:completion:]", 152, v7];
  v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    uint64_t v14 = [v10 UTF8String];
    _os_log_impl(&dword_242777000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v12 = [(AXLiveListenModuleViewController *)self presentedViewController];
  [v12 dismissViewControllerAnimated:v4 completion:v6];
}

- (double)preferredExpandedContentHeight
{
  [(HACCShortcutViewController *)self->_shortcutController preferredExpandedContentHeight];
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)expandLiveListenModule
{
  id v2 = [(HACCShortcutViewController *)self->_shortcutController contentModuleContext];
  [v2 requestExpandModule];
}

- (void)pauseSoundRecognitionIfNecessary
{
  BOOL v3 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v4 = [v3 soundDetectionState];

  if (v4 == 2)
  {
    objc_super v5 = AXLogUltron();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_impl(&dword_242777000, v5, OS_LOG_TYPE_DEFAULT, "Pausing Sound Recognition for Live Listen UI", v7, 2u);
    }

    id v6 = [MEMORY[0x263F21DA0] sharedInstance];
    [v6 setSoundDetectionState:1];

    self->_pausedSoundRecognition = 1;
  }
}

- (void)restartSoundRecognitionIfNecessary
{
  if (self->_pausedSoundRecognition)
  {
    BOOL v3 = [MEMORY[0x263F21DA0] sharedInstance];
    uint64_t v4 = [v3 soundDetectionState];

    if (v4 == 1)
    {
      objc_super v5 = AXLogUltron();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v7 = 0;
        _os_log_impl(&dword_242777000, v5, OS_LOG_TYPE_DEFAULT, "Resuming Sound Recognition for Live Listen UI", v7, 2u);
      }

      id v6 = [MEMORY[0x263F21DA0] sharedInstance];
      [v6 setSoundDetectionState:2];

      self->_pausedSoundRecognition = 0;
    }
  }
}

- (void)buttonTouchDown:(id)a3 forEvent:(id)a4
{
  objc_msgSend(MEMORY[0x263EFF910], "now", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AXLiveListenModuleViewController *)self setTouchDownTime:v5];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v5 = [(AXLiveListenModuleViewController *)self touchDownTime];
  if (v5
    && (id v6 = (void *)v5,
        [(AXLiveListenModuleViewController *)self touchDownTime],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceNow],
        double v9 = fabs(v8),
        v7,
        v6,
        v9 <= 0.4))
  {
    [(AXLiveListenModuleViewController *)self setTouchDownTime:0];
    if (liveListenStreamSelected())
    {
      BOOL v10 = [(AXLiveListenModuleViewController *)self isLiveListenEnabled];
      v11 = [MEMORY[0x263F47528] sharedInstance];
      id v12 = v11;
      if (v10) {
        [v11 stopLiveListen];
      }
      else {
        [v11 startLiveListen];
      }
    }
    else
    {
      MEMORY[0x270F9A6D0](self, sel_expandLiveListenModule);
    }
  }
  else
  {
    [(AXLiveListenModuleViewController *)self setTouchDownTime:0];
  }
}

- (BOOL)isLiveListenEnabled
{
  return self->_isLiveListenEnabled;
}

- (void)setIsLiveListenEnabled:(BOOL)a3
{
  self->_isLiveListenEnabled = a3;
}

- (NSDate)touchDownTime
{
  return self->_touchDownTime;
}

- (void)setTouchDownTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDownTime, 0);

  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end