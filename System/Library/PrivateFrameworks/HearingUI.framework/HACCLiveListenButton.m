@interface HACCLiveListenButton
- (BOOL)isListening;
- (BOOL)isLiveListenAvailable;
- (CCUILabeledRoundButtonViewController)buttonVC;
- (HACCLiveListenButton)initWithFrame:(CGRect)a3;
- (HACCLiveListenLevelGroup)levelGroup;
- (NSString)accessibilityValueString;
- (NSString)axHintStr;
- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion;
- (id)accessibilityCustomActions;
- (id)contentValue;
- (unint64_t)accessibilityTraits;
- (void)_updateAXValueString;
- (void)_updateButtonView;
- (void)liveListenAudioLevelDidChange:(double)a3;
- (void)setAccessibilityValueString:(id)a3;
- (void)setAxHintStr:(id)a3;
- (void)setButtonVC:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setIsLiveListenAvailable:(BOOL)a3;
- (void)setLevelGroup:(id)a3;
- (void)setStatusBarAssertion:(id)a3;
- (void)subscribeListeners;
- (void)unsubscribeListeners;
- (void)updateStatusBarOverride;
- (void)updateUI;
- (void)updateValue;
@end

@implementation HACCLiveListenButton

- (HACCLiveListenButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HACCLiveListenButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = hearingLocString();
    [(HUICCCapsuleButton *)v3 setTitleText:v4];
    uint64_t v5 = HUICCButtonVCWithSystemImageName(@"mic.fill");
    buttonVC = v3->_buttonVC;
    v3->_buttonVC = (CCUILabeledRoundButtonViewController *)v5;

    [(CCUILabeledRoundButtonViewController *)v3->_buttonVC setTitle:v4];
    v7 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [v7 addTarget:v3 action:sel_buttonTapped forControlEvents:64];

    v8 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [(HUICCCapsuleButton *)v3 setIconView:v8];

    v9 = [HACCLiveListenLevelGroup alloc];
    uint64_t v10 = -[HACCLiveListenLevelGroup initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    levelGroup = v3->_levelGroup;
    v3->_levelGroup = (HACCLiveListenLevelGroup *)v10;

    [(HACCLiveListenLevelGroup *)v3->_levelGroup setHidden:1];
    [(HUICCCapsuleButton *)v3 setAccessoryView:v3->_levelGroup];
  }
  return v3;
}

- (void)subscribeListeners
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Registering Live Listen listener"];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCLiveListenButton subscribeListeners]", 141, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v6 UTF8String];
    _os_log_impl(&dword_226B65000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8 = [MEMORY[0x263F47528] sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HACCLiveListenButton_subscribeListeners__block_invoke;
  v9[3] = &unk_2647CD650;
  objc_copyWeak(&v10, (id *)buf);
  [v8 registerListener:self forLiveListenLevelsHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __42__HACCLiveListenButton_subscribeListeners__block_invoke(uint64_t a1, char a2, double a3)
{
  objc_copyWeak(v5, (id *)(a1 + 32));
  char v6 = a2;
  v5[1] = *(id *)&a3;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v5);
}

void __42__HACCLiveListenButton_subscribeListeners__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained isListening];
  int v5 = *(unsigned __int8 *)(a1 + 48);

  if (v5 != v4)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 setIsListening:*(unsigned __int8 *)(a1 + 48)];

    id v7 = objc_loadWeakRetained(v2);
    [v7 updateStatusBarOverride];

    id v8 = objc_loadWeakRetained(v2);
    [v8 _updateAXValueString];
  }
  id v9 = objc_loadWeakRetained(v2);
  [v9 liveListenAudioLevelDidChange:*(double *)(a1 + 40)];

  id v10 = objc_loadWeakRetained(v2);
  [v10 updateValue];
}

- (void)unsubscribeListeners
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Unregistering Live Listen listener"];
  int v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCLiveListenButton unsubscribeListeners]", 179, v3];
  int v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_226B65000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v8 = [MEMORY[0x263F47528] sharedInstance];
  [v8 unregisterLiveListenLevelListener:self];
}

- (void)updateStatusBarOverride
{
  BOOL v3 = [(HACCLiveListenButton *)self isListening];
  [(SBSStatusBarStyleOverridesAssertion *)self->_statusBarAssertion invalidate];
  if (v3)
  {
    int v4 = (SBSStatusBarStyleOverridesAssertion *)[objc_alloc(MEMORY[0x263F79468]) initWithStatusBarStyleOverrides:1024 forPID:getpid() exclusive:0 showsWhenForeground:0];
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = v4;

    id v6 = self->_statusBarAssertion;
    id v7 = hearingLocString();
    [(SBSStatusBarStyleOverridesAssertion *)v6 setStatusString:v7];

    id v8 = self->_statusBarAssertion;
    [(SBSStatusBarStyleOverridesAssertion *)v8 acquireWithHandler:&__block_literal_global_1 invalidationHandler:&__block_literal_global_311];
  }
  else
  {
    id v9 = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;
  }
}

- (HACCLiveListenLevelGroup)levelGroup
{
  levelGroup = self->_levelGroup;
  if (!levelGroup)
  {
    int v4 = [HACCLiveListenLevelGroup alloc];
    int v5 = -[HACCLiveListenLevelGroup initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_levelGroup;
    self->_levelGroup = v5;

    levelGroup = self->_levelGroup;
  }
  return levelGroup;
}

- (void)liveListenAudioLevelDidChange:(double)a3
{
  id v4 = [(HACCLiveListenButton *)self levelGroup];
  [v4 updateLevel:a3];
}

- (id)contentValue
{
  v2 = NSNumber;
  BOOL v3 = [(HACCLiveListenButton *)self isListening];
  return (id)[v2 numberWithBool:v3];
}

- (void)updateValue
{
  v2.receiver = self;
  v2.super_class = (Class)HACCLiveListenButton;
  [(HUICCCapsuleButton *)&v2 updateValue];
  liveListenStreamSelectedAsync();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke()
{
  return hearingAidStreamAvailableAsync();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke_2()
{
  return AXPerformBlockOnMainThread();
}

uint64_t __35__HACCLiveListenButton_updateValue__block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isLiveListenAvailable];
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    BOOL v3 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v4 = [v3 currentCalls];
    objc_msgSend(*(id *)(a1 + 32), "setIsLiveListenAvailable:", objc_msgSend(v4, "count") == 0);
  }
  else
  {
    [*(id *)(a1 + 32) setIsLiveListenAvailable:0];
  }
  if (v2 != [*(id *)(a1 + 32) isLiveListenAvailable]) {
    [*(id *)(a1 + 32) _updateAXValueString];
  }
  int v5 = *(void **)(a1 + 32);
  return [v5 updateUI];
}

- (void)updateUI
{
  BOOL v3 = [(HACCLiveListenButton *)self isListening];
  levelGroup = self->_levelGroup;
  if (v3)
  {
    [(HACCLiveListenLevelGroup *)levelGroup setHidden:0];
    [(HACCLiveListenButton *)self setAxHintStr:0];
    int v5 = hearingLocString();
    [(HUICCCapsuleButton *)self setSubtitleText:v5];

    id v6 = self;
    uint64_t v7 = 0;
  }
  else
  {
    [(HACCLiveListenLevelGroup *)levelGroup setHidden:1];
    id v8 = hearingLocString();
    [(HACCLiveListenButton *)self setAxHintStr:v8];

    if ([(HACCLiveListenButton *)self enabled])
    {
      [(HACCLiveListenButton *)self setAxHintStr:0];
    }
    else
    {
      id v9 = [MEMORY[0x263F47568] sharedUtilities];
      int v10 = [v9 wirelessSplitterEnabled];

      if (v10)
      {
        uint64_t v11 = hearingLocString();
        [(HACCLiveListenButton *)self setAxHintStr:v11];
      }
    }
    [(HUICCCapsuleButton *)self setSubtitleText:0];
    uint64_t v7 = [(HACCLiveListenButton *)self enabled] ^ 1;
    id v6 = self;
  }
  [(HUICCCapsuleButton *)v6 setDimmingState:v7];
  [(HACCLiveListenButton *)self _updateButtonView];
}

- (void)_updateButtonView
{
  v16[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HACCLiveListenButton *)self isListening];
  if (v3)
  {
    id v4 = [MEMORY[0x263F825C8] redColor];
    v16[0] = v4;
    int v5 = (void **)v16;
  }
  else
  {
    id v4 = [MEMORY[0x263F825C8] whiteColor];
    v15 = v4;
    int v5 = &v15;
  }
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  uint64_t v7 = [MEMORY[0x263F82818] configurationWithPaletteColors:v6];
  id v8 = hearingLocString();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HACCLiveListenButton__updateButtonView__block_invoke;
  block[3] = &unk_2647CD3B0;
  block[4] = self;
  id v12 = v7;
  BOOL v14 = v3;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__HACCLiveListenButton__updateButtonView__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) buttonVC];
  BOOL v3 = [*(id *)(a1 + 32) buttonVC];
  id v4 = [v3 glyphImage];
  int v5 = [v4 imageByApplyingSymbolConfiguration:*(void *)(a1 + 40)];
  [v2 setGlyphImage:v5];

  id v6 = [*(id *)(a1 + 32) buttonVC];
  [v6 setEnabled:*(unsigned __int8 *)(a1 + 56)];

  uint64_t v7 = [*(id *)(a1 + 32) iconView];
  v9[0] = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 setAccessibilityUserInputLabels:v8];
}

- (void)_updateAXValueString
{
  [(HACCLiveListenButton *)self setAccessibilityValueString:0];
  if ([(HACCLiveListenButton *)self isListening] || [(HACCLiveListenButton *)self enabled])
  {
    hearingLocString();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(HACCLiveListenButton *)self setAccessibilityValueString:v3];
  }
}

- (unint64_t)accessibilityTraits
{
  if ([(HACCLiveListenButton *)self isListening]
    || [(HACCLiveListenButton *)self isEnabled])
  {
    id v3 = (unint64_t *)MEMORY[0x263F83260];
  }
  else
  {
    id v3 = (unint64_t *)MEMORY[0x263F83290];
  }
  return *v3;
}

- (id)accessibilityCustomActions
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v19.receiver = self;
  v19.super_class = (Class)HACCLiveListenButton;
  id v4 = [(HUICCCapsuleButton *)&v19 accessibilityCustomActions];
  int v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(HUICCCapsuleButton *)self iconView];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    int v8 = [(HACCLiveListenButton *)self isEnabled];

    if (v8)
    {
      [(HACCLiveListenButton *)self isListening];
      id v9 = hearingLocString();
      objc_initWeak(&location, self);
      id v10 = objc_alloc(MEMORY[0x263F823A0]);
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __50__HACCLiveListenButton_accessibilityCustomActions__block_invoke;
      v16 = &unk_2647CD388;
      objc_copyWeak(&v17, &location);
      uint64_t v11 = (void *)[v10 initWithName:v9 actionHandler:&v13];
      objc_msgSend(v5, "addObject:", v11, v13, v14, v15, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return v5;
}

uint64_t __50__HACCLiveListenButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained buttonTapped];

  return 1;
}

- (NSString)accessibilityValueString
{
  return self->_accessibilityValueString;
}

- (void)setAccessibilityValueString:(id)a3
{
}

- (void)setLevelGroup:(id)a3
{
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isLiveListenAvailable
{
  return self->_isLiveListenAvailable;
}

- (void)setIsLiveListenAvailable:(BOOL)a3
{
  self->_isLiveListenAvailable = a3;
}

- (CCUILabeledRoundButtonViewController)buttonVC
{
  return self->_buttonVC;
}

- (void)setButtonVC:(id)a3
{
}

- (NSString)axHintStr
{
  return self->_axHintStr;
}

- (void)setAxHintStr:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_axHintStr, 0);
  objc_storeStrong((id *)&self->_buttonVC, 0);
  objc_storeStrong((id *)&self->_levelGroup, 0);
  objc_storeStrong((id *)&self->_accessibilityValueString, 0);
}

@end