@interface APBaseExtensionShieldView
- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4;
- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4 unlockButtonHidden:(BOOL)a5;
- (APBaseExtensionShieldViewDelegate)delegate;
- (BOOL)accessibilityViewIsModal;
- (void)setDelegate:(id)a3;
- (void)unlockTapped:(id)a3;
@end

@implementation APBaseExtensionShieldView

- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4
{
  return [(APBaseExtensionShieldView *)self initWithLocalizedApplicationName:a3 iconImage:a4 unlockButtonHidden:0];
}

- (APBaseExtensionShieldView)initWithLocalizedApplicationName:(id)a3 iconImage:(id)a4 unlockButtonHidden:(BOOL)a5
{
  BOOL v5 = a5;
  v76[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(APBaseExtensionShieldView *)self init];
  if (v10)
  {
    uint64_t v11 = APGetPreferredAuthenticationMechanism();
    v12 = @"com.apple.appprotection.badge.touchid";
    if (v11 == 3) {
      v12 = @"com.apple.appprotection.badge.passcode";
    }
    if (v11 == 1) {
      v13 = @"com.apple.appprotection.badge.faceid";
    }
    else {
      v13 = v12;
    }
    id v72 = v8;
    v14 = [APSymbolBadgedAppIconView alloc];
    +[APSymbolBadgedAppIconView metricsForExtensionShield];
    uint64_t v15 = [(APSymbolBadgedAppIconView *)v14 initWithApplicationIconImage:v9 symbolType:v13 metrics:v73];
    iconView = v10->_iconView;
    v10->_iconView = (APSymbolBadgedAppIconView *)v15;

    [(APSymbolBadgedAppIconView *)v10->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(APBaseExtensionShieldView *)v10 addSubview:v10->_iconView];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v10->_label;
    v10->_label = v17;

    v19 = v10->_label;
    v20 = [MEMORY[0x263F82770] defaultMetrics];
    v21 = [MEMORY[0x263F82760] systemFontOfSize:18.0 weight:*MEMORY[0x263F83630]];
    v22 = [v20 scaledFontForFont:v21];
    [(UILabel *)v19 setFont:v22];

    v23 = NSString;
    v24 = APGetPreferredAuthenticationMechanismLocKey();
    v25 = [v23 stringWithFormat:@"BASE_EXTENSION_SHIELD_VIEW_LABEL_%@", v24];
    v71 = APUILocStr(v25);

    [(UILabel *)v10->_label setText:v71];
    [(UILabel *)v10->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(APBaseExtensionShieldView *)v10 addSubview:v10->_label];
    uint64_t v26 = [MEMORY[0x263F824E8] buttonWithType:1];
    unlockButton = v10->_unlockButton;
    v10->_unlockButton = (UIButton *)v26;

    [(UIButton *)v10->_unlockButton addTarget:v10 action:sel_unlockTapped_ forControlEvents:0x2000];
    [(UIButton *)v10->_unlockButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = v10->_unlockButton;
    v29 = NSString;
    v30 = APUILocStr(@"EXTENSION_SHIELD_RETRY_BUTTON_AX_HINT_FMT");
    v31 = objc_msgSend(v29, "stringWithFormat:", v30, v72);
    [(UIButton *)v28 setAccessibilityHint:v31];

    [(UIButton *)v10->_unlockButton setHidden:v5];
    uint64_t v75 = *MEMORY[0x263F82270];
    v32 = [MEMORY[0x263F82770] defaultMetrics];
    v33 = [MEMORY[0x263F82760] systemFontOfSize:16.0 weight:*MEMORY[0x263F83640]];
    v34 = [v32 scaledFontForFont:v33];
    v76[0] = v34;
    v70 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];

    v35 = NSString;
    v36 = APGetPreferredAuthenticationMechanismLocKey();
    v37 = [v35 stringWithFormat:@"BASE_EXTENSION_SHIELD_VIEW_UNLOCK_BUTTON_%@", v36];
    v69 = APUILocStr(v37);

    v38 = v10->_unlockButton;
    v39 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v69 attributes:v70];
    [(UIButton *)v38 setAttributedTitle:v39 forState:0];

    [(APBaseExtensionShieldView *)v10 addSubview:v10->_unlockButton];
    v68 = [(APSymbolBadgedAppIconView *)v10->_iconView centerXAnchor];
    v67 = [(APBaseExtensionShieldView *)v10 centerXAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v74[0] = v66;
    v65 = [(APSymbolBadgedAppIconView *)v10->_iconView centerYAnchor];
    v64 = [(APBaseExtensionShieldView *)v10 centerYAnchor];
    v63 = [v65 constraintEqualToAnchor:v64 constant:-56.0];
    v74[1] = v63;
    v62 = [(UILabel *)v10->_label centerXAnchor];
    v61 = [(APBaseExtensionShieldView *)v10 centerXAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v74[2] = v60;
    v59 = [(UILabel *)v10->_label centerYAnchor];
    v58 = [(APBaseExtensionShieldView *)v10 centerYAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:10.0];
    v74[3] = v57;
    v56 = [(UILabel *)v10->_label widthAnchor];
    v55 = [(APBaseExtensionShieldView *)v10 widthAnchor];
    v54 = [v56 constraintLessThanOrEqualToAnchor:v55];
    v74[4] = v54;
    v52 = [(UILabel *)v10->_label heightAnchor];
    v40 = [(APBaseExtensionShieldView *)v10 heightAnchor];
    v41 = [v52 constraintLessThanOrEqualToAnchor:v40];
    v74[5] = v41;
    v42 = [(UIButton *)v10->_unlockButton centerXAnchor];
    v43 = [(APBaseExtensionShieldView *)v10 centerXAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v74[6] = v44;
    v45 = [(UIButton *)v10->_unlockButton firstBaselineAnchor];
    v46 = [(UILabel *)v10->_label lastBaselineAnchor];
    v47 = [v45 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:2.0];
    v74[7] = v47;
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:8];

    [MEMORY[0x263F08938] activateConstraints:v53];
    v48 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_4];
    [(APBaseExtensionShieldView *)v10 setBackgroundColor:v48];

    v49 = v10->_label;
    v50 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_28];
    [(UILabel *)v49 setTextColor:v50];

    id v8 = v72;
  }

  return v10;
}

id __91__APBaseExtensionShieldView_initWithLocalizedApplicationName_iconImage_unlockButtonHidden___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] whiteColor];
  }

  return v2;
}

id __91__APBaseExtensionShieldView_initWithLocalizedApplicationName_iconImage_unlockButtonHidden___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] blackColor];
  }

  return v2;
}

- (void)unlockTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shieldViewUnlockButtonPressed:self];
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (APBaseExtensionShieldViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APBaseExtensionShieldViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unlockButton, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end