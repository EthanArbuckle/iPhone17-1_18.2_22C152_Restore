@interface HUICCBackgroundSoundsButton
- (BOOL)enabled;
- (BOOL)isListening;
- (BOOL)shouldIncludeIconViewInFooterViews;
- (CCUILabeledRoundButtonViewController)buttonVC;
- (HUICCBackgroundSoundsButton)initWithFrame:(CGRect)a3;
- (NSString)axHintStr;
- (id)accessibilityCustomActions;
- (id)contentValue;
- (void)_updateButtonView;
- (void)buttonTapped;
- (void)setAxHintStr:(id)a3;
- (void)setButtonVC:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)subscribeListeners;
- (void)unsubscribeListeners;
- (void)updateValue;
@end

@implementation HUICCBackgroundSoundsButton

- (HUICCBackgroundSoundsButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUICCBackgroundSoundsButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = HUICCButtonVCWithSystemImageName(@"music.quarternote.3");
    buttonVC = v3->_buttonVC;
    v3->_buttonVC = (CCUILabeledRoundButtonViewController *)v4;

    v6 = hearingLocString();
    [(CCUILabeledRoundButtonViewController *)v3->_buttonVC setTitle:v6];

    v7 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [v7 addTarget:v3 action:sel_buttonTapped forControlEvents:64];

    v8 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [(HUICCCapsuleButton *)v3 setIconView:v8];
  }
  return v3;
}

- (void)updateValue
{
  v6.receiver = self;
  v6.super_class = (Class)HUICCBackgroundSoundsButton;
  [(HUICCCapsuleButton *)&v6 updateValue];
  v3 = [MEMORY[0x263F47568] sharedUtilities];
  uint64_t v4 = [v3 routingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HUICCBackgroundSoundsButton_updateValue__block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __42__HUICCBackgroundSoundsButton_updateValue__block_invoke()
{
  v0 = hearingLocString();
  v1 = [MEMORY[0x263F47568] sharedUtilities];
  uint64_t v2 = [v1 backgroundSoundsRouteDecision];

  v3 = [MEMORY[0x263F47548] sharedInstance];
  int v4 = [v3 comfortSoundsEnabled];

  if (v4)
  {
    v5 = [MEMORY[0x263F47548] sharedInstance];
    objc_super v6 = [v5 selectedComfortSound];
    v7 = [v6 localizedName];

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (v2 != 3 && v2 != 2)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v8 = hearingLocString();
  v7 = 0;
LABEL_8:
  v12 = v0;
  v13 = v7;
  v14 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = v0;
  AXPerformBlockOnMainThread();
}

uint64_t __42__HUICCBackgroundSoundsButton_updateValue__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitleText:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSubtitleText:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _updateButtonView];
  uint64_t v2 = *(void *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  return [v3 setAxHintStr:v2];
}

- (void)buttonTapped
{
  v3.receiver = self;
  v3.super_class = (Class)HUICCBackgroundSoundsButton;
  [(HUICCCapsuleButton *)&v3 buttonTapped];
  [(HUICCBackgroundSoundsButton *)self updateValue];
}

- (void)_updateButtonView
{
  v18[2] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F47548] sharedInstance];
  char v4 = [v3 comfortSoundsEnabled];

  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] systemBlueColor];
    v18[0] = v5;
    objc_super v6 = [MEMORY[0x263F825C8] blackColor];
    v18[1] = v6;
    v7 = v18;
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] whiteColor];
    v17[0] = v5;
    objc_super v6 = [MEMORY[0x263F825C8] whiteColor];
    v17[1] = v6;
    v7 = v17;
  }
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  id v9 = [MEMORY[0x263F82818] configurationWithPaletteColors:v8];
  id v10 = hearingLocString();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HUICCBackgroundSoundsButton__updateButtonView__block_invoke;
  block[3] = &unk_2647CD3B0;
  block[4] = self;
  id v14 = v9;
  char v16 = v4;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__HUICCBackgroundSoundsButton__updateButtonView__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) buttonVC];
  objc_super v3 = [*(id *)(a1 + 32) buttonVC];
  char v4 = [v3 glyphImage];
  v5 = [v4 imageByApplyingSymbolConfiguration:*(void *)(a1 + 40)];
  [v2 setGlyphImage:v5];

  objc_super v6 = [*(id *)(a1 + 32) buttonVC];
  [v6 setEnabled:*(unsigned __int8 *)(a1 + 56)];

  v7 = [*(id *)(a1 + 32) iconView];
  v9[0] = *(void *)(a1 + 48);
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 setAccessibilityUserInputLabels:v8];
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)subscribeListeners
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  objc_super v3 = [NSString stringWithFormat:@"BS button: Registering Live Listen listener"];
  char v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUICCBackgroundSoundsButton subscribeListeners]", 129, v3];
  v5 = (void *)*MEMORY[0x263F47290];
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
  void v9[2] = __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke;
  v9[3] = &unk_2647CD650;
  objc_copyWeak(&v10, (id *)buf);
  [v8 registerListener:self forLiveListenLevelsHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained isListening];

  if (v5 != a2)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 setIsListening:a2];

    objc_copyWeak(&v7, v3);
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v7);
  }
}

void __49__HUICCBackgroundSoundsButton_subscribeListeners__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (void)unsubscribeListeners
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  objc_super v3 = [NSString stringWithFormat:@"BS button: Unregistering Live Listen listener"];
  char v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUICCBackgroundSoundsButton unsubscribeListeners]", 145, v3];
  int v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_226B65000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8 = [MEMORY[0x263F47528] sharedInstance];
  [v8 unregisterLiveListenLevelListener:self];

  [(HUICCBackgroundSoundsButton *)self setIsListening:0];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = (void *)MEMORY[0x263EFF980];
  v18.receiver = self;
  v18.super_class = (Class)HUICCBackgroundSoundsButton;
  char v4 = [(HUICCCapsuleButton *)&v18 accessibilityCustomActions];
  int v5 = [v3 arrayWithArray:v4];

  id v6 = [(HUICCCapsuleButton *)self iconView];

  if (v6)
  {
    id v7 = [MEMORY[0x263F47548] sharedInstance];
    [v7 comfortSoundsEnabled];

    v8 = hearingLocString();
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x263F823A0]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __57__HUICCBackgroundSoundsButton_accessibilityCustomActions__block_invoke;
    id v15 = &unk_2647CD388;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = (void *)[v9 initWithName:v8 actionHandler:&v12];
    objc_msgSend(v5, "addObject:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

uint64_t __57__HUICCBackgroundSoundsButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained buttonTapped];

  return 1;
}

- (BOOL)shouldIncludeIconViewInFooterViews
{
  uint64_t v2 = [(HUICCCapsuleButton *)self iconView];
  BOOL v3 = v2 != 0;

  return v3;
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

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHintStr, 0);
  objc_storeStrong((id *)&self->_buttonVC, 0);
}

@end