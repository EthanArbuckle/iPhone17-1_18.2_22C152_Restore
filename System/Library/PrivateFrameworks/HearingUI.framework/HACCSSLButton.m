@interface HACCSSLButton
- (BOOL)enabled;
- (CCUILabeledRoundButtonViewController)buttonVC;
- (HACCSSLButton)initWithFrame:(CGRect)a3;
- (id)accessibilityValue;
- (id)contentValue;
- (unint64_t)accessibilityTraits;
- (void)_updateButtonView;
- (void)setButtonVC:(id)a3;
- (void)updateValue;
@end

@implementation HACCSSLButton

- (HACCSSLButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HACCSSLButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = paLocString();
    [(HUICCCapsuleButton *)v3 setTitleText:v4];
    uint64_t v5 = HUICCButtonVCWithSystemImageName(@"person.wave.2.fill");
    buttonVC = v3->_buttonVC;
    v3->_buttonVC = (CCUILabeledRoundButtonViewController *)v5;

    [(CCUILabeledRoundButtonViewController *)v3->_buttonVC setTitle:v4];
    v7 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [v7 addTarget:v3 action:sel_buttonTapped forControlEvents:64];

    v8 = [(CCUILabeledRoundButtonViewController *)v3->_buttonVC button];
    [(HUICCCapsuleButton *)v3 setIconView:v8];

    objc_initWeak(&location, v3);
    v9 = [MEMORY[0x263F5D458] sharedInstance];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __31__HACCSSLButton_initWithFrame___block_invoke;
    v11[3] = &unk_2647CD168;
    objc_copyWeak(&v12, &location);
    [v9 registerUpdateBlock:v11 forRetrieveSelector:sel_sslEnabled withListener:v3];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __31__HACCSSLButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (void)updateValue
{
  v3.receiver = self;
  v3.super_class = (Class)HACCSSLButton;
  [(HUICCCapsuleButton *)&v3 updateValue];
  [(HUICCCapsuleButton *)self setDimmingState:[(HACCSSLButton *)self enabled] ^ 1];
  [(HACCSSLButton *)self _updateButtonView];
}

- (void)_updateButtonView
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(HACCSSLButton *)self contentValue];
  char v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] systemBlueColor];
    v17[0] = v5;
    v6 = (void **)v17;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F825C8] whiteColor];
    v16 = v5;
    v6 = &v16;
  }
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  v8 = [MEMORY[0x263F82818] configurationWithPaletteColors:v7];
  v9 = paLocString();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HACCSSLButton__updateButtonView__block_invoke;
  block[3] = &unk_2647CD3B0;
  block[4] = self;
  id v13 = v8;
  char v15 = v4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __34__HACCSSLButton__updateButtonView__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) buttonVC];
  objc_super v3 = [*(id *)(a1 + 32) buttonVC];
  char v4 = [v3 glyphImage];
  uint64_t v5 = [v4 imageByApplyingSymbolConfiguration:*(void *)(a1 + 40)];
  [v2 setGlyphImage:v5];

  v6 = [*(id *)(a1 + 32) buttonVC];
  [v6 setEnabled:*(unsigned __int8 *)(a1 + 56)];

  v7 = [*(id *)(a1 + 32) iconView];
  v9[0] = *(void *)(a1 + 48);
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 setAccessibilityUserInputLabels:v8];
}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  objc_super v3 = [v2 address];

  char v4 = [MEMORY[0x263F5D458] sharedInstance];
  uint64_t v5 = [v4 sslEnabledForAddress:v3];

  v6 = [NSNumber numberWithBool:v5];

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (id)accessibilityValue
{
  objc_super v3 = hearingLocString();
  char v4 = [(HACCSSLButton *)self contentValue];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = hearingLocString();

    objc_super v3 = (void *)v6;
  }
  return v3;
}

- (CCUILabeledRoundButtonViewController)buttonVC
{
  return self->_buttonVC;
}

- (void)setButtonVC:(id)a3
{
}

- (void).cxx_destruct
{
}

@end