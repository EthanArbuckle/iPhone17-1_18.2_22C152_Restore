@interface APBaseShieldView
- (APApplication)shieldedApplication;
- (APBaseShieldView)initWithApplication:(id)a3;
- (APBaseShieldView)initWithConfig:(id)a3;
- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3;
- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 hidden:(BOOL)a4;
- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 useHiddenStyle:(BOOL)a4 needEmergencyCallButton:(BOOL)a5;
- (APBaseShieldViewDelegate)delegate;
- (BOOL)isEqualTo:(id)a3;
- (id)accessibilityElements;
- (void)dealloc;
- (void)emergencyCallHostViewControllerDidDismiss:(id)a3;
- (void)emergencyTapped:(id)a3;
- (void)layoutSubviews;
- (void)resetShield;
- (void)setDelegate:(id)a3;
- (void)setShieldStyle:(unint64_t)a3;
- (void)unlockTapped:(id)a3;
@end

@implementation APBaseShieldView

- (APBaseShieldView)initWithApplication:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F01878]);
  v6 = [v4 bundleIdentifier];
  id v16 = 0;
  v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v16];
  id v8 = v16;

  if (v7)
  {
    uint64_t v9 = [v7 localizedName];
  }
  else
  {
    v10 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[APBaseShieldView initWithApplication:](v4);
    }

    uint64_t v9 = [v4 bundleIdentifier];
  }
  v11 = (void *)v9;
  shieldedApplication = self->_shieldedApplication;
  self->_shieldedApplication = (APApplication *)v4;
  id v13 = v4;

  v14 = -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](self, "initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:", v11, [v13 isHidden], applicationRequiresEmergencyCallButton(v13));
  return v14;
}

- (APBaseShieldView)initWithConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 localizedName];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v9 = [v4 application];
    v10 = [v9 bundleIdentifier];
    id v25 = 0;
    v11 = (void *)[v8 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v25];
    id v7 = v25;

    if (v11)
    {
      v6 = [v11 localizedName];
    }
    else
    {
      v12 = APUIDefaultFrameworkLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[APBaseShieldView initWithConfig:](v4);
      }

      id v13 = [v4 application];
      v6 = [v13 bundleIdentifier];
    }
  }
  v14 = [v4 application];
  uint64_t v15 = [v14 isHidden];

  id v16 = [v4 application];
  uint64_t v17 = applicationRequiresEmergencyCallButton(v16);

  v18 = [v4 application];
  shieldedApplication = self->_shieldedApplication;
  self->_shieldedApplication = v18;

  v20 = [(APBaseShieldView *)self initWithLocalizedApplicationName:v6 useHiddenStyle:v15 needEmergencyCallButton:v17];
  if (v20)
  {
    uint64_t v21 = [v4 outlet];
    outlet = v20->_outlet;
    v20->_outlet = (APSystemAppOutlet *)v21;

    [(APSystemAppOutlet *)v20->_outlet addShield:v20];
    v23 = [v4 delegate];
    objc_storeWeak((id *)&v20->_delegate, v23);
  }
  return v20;
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3
{
  return [(APBaseShieldView *)self initWithLocalizedApplicationName:a3 useHiddenStyle:0 needEmergencyCallButton:0];
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 hidden:(BOOL)a4
{
  return [(APBaseShieldView *)self initWithLocalizedApplicationName:a3 useHiddenStyle:a4 needEmergencyCallButton:0];
}

- (APBaseShieldView)initWithLocalizedApplicationName:(id)a3 useHiddenStyle:(BOOL)a4 needEmergencyCallButton:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v170[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [(APBaseShieldView *)self init];
  v10 = v9;
  if (v9)
  {
    BOOL v157 = v5;
    v9->_shieldStyle = 0;
    id v11 = objc_alloc(MEMORY[0x263F82E50]);
    v12 = [MEMORY[0x263F824D8] effectWithStyle:4];
    uint64_t v13 = [v11 initWithEffect:v12];
    visualEffectView = v10->_visualEffectView;
    v10->_visualEffectView = (UIVisualEffectView *)v13;

    [(UIVisualEffectView *)v10->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(APBaseShieldView *)v10 addSubview:v10->_visualEffectView];
    BOOL v167 = v6;
    [(UIVisualEffectView *)v10->_visualEffectView setHidden:v6];
    uint64_t v15 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v10->_label;
    v10->_label = v15;

    uint64_t v17 = v10->_label;
    v18 = [MEMORY[0x263F82770] defaultMetrics];
    v19 = [MEMORY[0x263F82760] systemFontOfSize:18.0 weight:*MEMORY[0x263F83640]];
    v20 = [v18 scaledFontForFont:v19];
    [(UILabel *)v17 setFont:v20];

    unint64_t v21 = APGetPreferredAuthenticationMechanism() - 1;
    if (v21 >= 3)
    {
      v23 = APUIDefaultFrameworkLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      v22 = 0;
    }
    else
    {
      v22 = off_26522DB00[v21];
    }
    id v166 = v8;
    if (v167)
    {
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v32 = [v31 localizedStringForKey:@"APP" value:&stru_26FC11A68 table:@"Localizable"];
    }
    else
    {
      id v32 = v8;
    }
    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:v22 value:&stru_26FC11A68 table:@"Localizable"];

    v35 = objc_msgSend(NSString, "stringWithFormat:", v34, v32);

    uint64_t v36 = [v35 rangeOfString:@"\n"];
    uint64_t v37 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_2];
    uint64_t v38 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_38];
    v39 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v35];
    v40 = v39;
    v164 = v35;
    v165 = v32;
    v162 = (void *)v38;
    v163 = (void *)v37;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v41 = APUIDefaultFrameworkLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[APBaseShieldView initWithLocalizedApplicationName:useHiddenStyle:needEmergencyCallButton:](v41, v42, v43, v44, v45, v46, v47, v48);
      }

      uint64_t v49 = *MEMORY[0x263F82278];
      uint64_t v50 = [v35 length];
      v51 = v40;
      uint64_t v52 = v49;
      uint64_t v53 = v37;
      uint64_t v54 = 0;
    }
    else
    {
      uint64_t v55 = v37;
      uint64_t v56 = *MEMORY[0x263F82278];
      objc_msgSend(v39, "addAttribute:value:range:", *MEMORY[0x263F82278], v55, 0, v36);
      uint64_t v50 = [v35 length] - v36;
      v51 = v40;
      uint64_t v52 = v56;
      uint64_t v53 = v38;
      uint64_t v54 = v36;
    }
    objc_msgSend(v51, "addAttribute:value:range:", v52, v53, v54, v50);
    v161 = v40;
    [(UILabel *)v10->_label setAttributedText:v40];
    [(UILabel *)v10->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_label setNumberOfLines:0];
    [(UILabel *)v10->_label setAccessibilityIdentifier:@"appProtectionShieldIdentifier"];
    [(UILabel *)v10->_label setTextAlignment:1];
    v57 = v10->_label;
    uint64_t v58 = *MEMORY[0x263F83618];
    v59 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83618]];
    [(UILabel *)v57 setFont:v59];

    [(APBaseShieldView *)v10 addSubview:v10->_label];
    [(APBaseShieldView *)v10 setAccessibilityIdentifier:@"appProtectionShieldIdentifier"];
    uint64_t v60 = [objc_alloc(MEMORY[0x263F823B8]) initWithAccessibilityContainer:v10];
    labelsElement = v10->_labelsElement;
    v10->_labelsElement = (UIAccessibilityElement *)v60;

    v62 = v10->_labelsElement;
    v63 = NSString;
    v64 = [(UILabel *)v10->_label accessibilityLabel];
    v65 = [v63 stringWithFormat:@"%@", v64];
    [(UIAccessibilityElement *)v62 setAccessibilityLabel:v65];

    uint64_t v169 = *MEMORY[0x263F82270];
    v66 = [MEMORY[0x263F82770] defaultMetrics];
    v67 = [MEMORY[0x263F82760] preferredFontForTextStyle:v58];
    v68 = [v66 scaledFontForFont:v67];
    v170[0] = v68;
    uint64_t v69 = [NSDictionary dictionaryWithObjects:v170 forKeys:&v169 count:1];

    v70 = NSString;
    v71 = APGetPreferredAuthenticationMechanismLocKey();
    v72 = [v70 stringWithFormat:@"TRY_%@_AGAIN", v71];
    uint64_t v73 = APUILocStr(v72);

    id v74 = objc_alloc(MEMORY[0x263F086A0]);
    v75 = NSString;
    v76 = APGetPreferredAuthenticationMechanismLocalizedDescription();
    v159 = (void *)v73;
    v77 = objc_msgSend(v75, "stringWithFormat:", v73, v76);
    v160 = (void *)v69;
    v78 = (void *)[v74 initWithString:v77 attributes:v69];

    v79 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    [v79 setButtonSize:3];
    v80 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_55];
    [v79 setBaseForegroundColor:v80];

    v81 = [MEMORY[0x263F825C8] clearColor];
    [v79 setBaseBackgroundColor:v81];

    [v79 setAttributedTitle:v78];
    id v82 = objc_alloc(MEMORY[0x263F82E50]);
    v83 = [MEMORY[0x263F824D8] effectWithStyle:4];
    uint64_t v84 = [v82 initWithEffect:v83];

    v85 = [MEMORY[0x263F82498] clearConfiguration];
    v155 = (void *)v84;
    [v85 setCustomView:v84];
    v154 = v85;
    [v79 setBackground:v85];
    v86 = [v79 background];
    [v86 setCornerRadius:28.0];

    uint64_t v87 = [MEMORY[0x263F824E8] buttonWithType:0];
    unlockButton = v10->_unlockButton;
    v10->_unlockButton = (UIButton *)v87;

    v156 = v79;
    [(UIButton *)v10->_unlockButton setConfiguration:v79];
    [(UIButton *)v10->_unlockButton addTarget:v10 action:sel_unlockTapped_ forControlEvents:0x2000];
    [(UIButton *)v10->_unlockButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v10->_unlockButton setHidden:1];
    [(APBaseShieldView *)v10 addSubview:v10->_unlockButton];
    if (v10->_shieldStyle == 1)
    {
      [(UILabel *)v10->_label setHidden:1];
      [(UIButton *)v10->_unlockButton setHidden:0];
    }
    uint64_t v89 = [MEMORY[0x263F824E8] buttonWithType:1];
    emergencyCallButton = v10->_emergencyCallButton;
    v10->_emergencyCallButton = (UIButton *)v89;

    [(UIButton *)v10->_emergencyCallButton addTarget:v10 action:sel_emergencyTapped_ forControlEvents:0x2000];
    v91 = v10->_emergencyCallButton;
    v92 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v93 = [v92 localizedStringForKey:@"EMERGENCY_CALL" value:&stru_26FC11A68 table:@"Localizable"];
    [(UIButton *)v91 setTitle:v93 forState:0];

    v94 = v10->_emergencyCallButton;
    v95 = [MEMORY[0x263F825C8] labelColor];
    [(UIButton *)v94 setTitleColor:v95 forState:0];

    [(UIButton *)v10->_emergencyCallButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v10->_emergencyCallButton setHidden:!v157];
    [(APBaseShieldView *)v10 addSubview:v10->_emergencyCallButton];
    id v96 = objc_alloc_init(MEMORY[0x263F82908]);
    [(APBaseShieldView *)v10 addLayoutGuide:v96];
    v152 = [v96 topAnchor];
    v151 = [(APBaseShieldView *)v10 topAnchor];
    v150 = [v152 constraintEqualToAnchor:v151];
    v168[0] = v150;
    v149 = [v96 heightAnchor];
    v148 = [(APBaseShieldView *)v10 heightAnchor];
    v147 = [v149 constraintEqualToAnchor:v148 multiplier:0.45];
    v168[1] = v147;
    v146 = [(UILabel *)v10->_label topAnchor];
    v153 = v96;
    v145 = [v96 bottomAnchor];
    v144 = [v146 constraintEqualToAnchor:v145];
    v168[2] = v144;
    v143 = [(UILabel *)v10->_label centerXAnchor];
    v142 = [(APBaseShieldView *)v10 centerXAnchor];
    v141 = [v143 constraintEqualToAnchor:v142];
    v168[3] = v141;
    v140 = [(UILabel *)v10->_label widthAnchor];
    v139 = [(APBaseShieldView *)v10 widthAnchor];
    v138 = [v140 constraintLessThanOrEqualToAnchor:v139];
    v168[4] = v138;
    v137 = [(UIVisualEffectView *)v10->_visualEffectView topAnchor];
    v136 = [(APBaseShieldView *)v10 topAnchor];
    v135 = [v137 constraintEqualToAnchor:v136];
    v168[5] = v135;
    v134 = [(UIVisualEffectView *)v10->_visualEffectView bottomAnchor];
    v133 = [(APBaseShieldView *)v10 bottomAnchor];
    v132 = [v134 constraintEqualToAnchor:v133];
    v168[6] = v132;
    v131 = [(UIVisualEffectView *)v10->_visualEffectView leadingAnchor];
    v130 = [(APBaseShieldView *)v10 leadingAnchor];
    v129 = [v131 constraintEqualToAnchor:v130];
    v168[7] = v129;
    v128 = [(UIVisualEffectView *)v10->_visualEffectView trailingAnchor];
    v127 = [(APBaseShieldView *)v10 trailingAnchor];
    v126 = [v128 constraintEqualToAnchor:v127];
    v168[8] = v126;
    v125 = [(UIButton *)v10->_unlockButton centerXAnchor];
    v124 = [(APBaseShieldView *)v10 centerXAnchor];
    v123 = [v125 constraintEqualToAnchor:v124];
    v168[9] = v123;
    v122 = [(UIButton *)v10->_unlockButton centerYAnchor];
    v121 = [(APBaseShieldView *)v10 centerYAnchor];
    v120 = [v122 constraintEqualToAnchor:v121];
    v168[10] = v120;
    v119 = [(UIButton *)v10->_unlockButton widthAnchor];
    v118 = [(APBaseShieldView *)v10 widthAnchor];
    v158 = v78;
    [v78 size];
    v117 = [v119 constraintEqualToAnchor:v118 multiplier:0.0 constant:v97 + 70.0];
    LODWORD(v98) = 1144750080;
    [v117 setPriority:v98];
    v168[11] = v117;
    v115 = [(UIButton *)v10->_unlockButton widthAnchor];
    v116 = [(APBaseShieldView *)v10 safeAreaLayoutGuide];
    v114 = [v116 widthAnchor];
    v113 = [v115 constraintLessThanOrEqualToAnchor:v114];
    v168[12] = v113;
    v111 = [(UIButton *)v10->_unlockButton heightAnchor];
    v112 = [(APBaseShieldView *)v10 safeAreaLayoutGuide];
    v110 = [v112 heightAnchor];
    v99 = [v111 constraintLessThanOrEqualToAnchor:v110];
    v168[13] = v99;
    v100 = [(UIButton *)v10->_emergencyCallButton bottomAnchor];
    v101 = [(APBaseShieldView *)v10 safeAreaLayoutGuide];
    v102 = [v101 bottomAnchor];
    v103 = [v100 constraintEqualToAnchor:v102 constant:-30.0];
    v168[14] = v103;
    v104 = [(UIButton *)v10->_emergencyCallButton centerXAnchor];
    v105 = [(APBaseShieldView *)v10 centerXAnchor];
    v106 = [v104 constraintEqualToAnchor:v105];
    v168[15] = v106;
    v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:16];

    [MEMORY[0x263F08938] activateConstraints:v107];
    if (v167)
    {
      v108 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_69];
      [(APBaseShieldView *)v10 setBackgroundColor:v108];
    }
    id v8 = v166;
  }

  return v10;
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] darkGrayColor];
  }

  return v2;
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] grayColor];
  }

  return v2;
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_53(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] darkGrayColor];
  }

  return v2;
}

id __92__APBaseShieldView_initWithLocalizedApplicationName_useHiddenStyle_needEmergencyCallButton___block_invoke_2_67(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] whiteColor];
  }

  return v2;
}

- (id)accessibilityElements
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_shieldStyle)
  {
    unlockButton = self->_unlockButton;
    p_unlockButton = &unlockButton;
  }
  else
  {
    v8[0] = self->_labelsElement;
    p_unlockButton = (UIButton **)v8;
  }
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:p_unlockButton count:1];
  if (([(UIButton *)self->_emergencyCallButton isHidden] & 1) == 0)
  {
    uint64_t v5 = [v4 arrayByAddingObject:self->_emergencyCallButton];

    id v4 = (void *)v5;
  }

  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)APBaseShieldView;
  [(APBaseShieldView *)&v4 layoutSubviews];
  label = self->_label;
  [(UILabel *)label bounds];
  -[UILabel convertRect:toView:](label, "convertRect:toView:", self);
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](self->_labelsElement, "setAccessibilityFrameInContainerSpace:");
}

- (void)unlockTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shieldViewUnlockButtonPressed:self];
}

- (void)emergencyCallHostViewControllerDidDismiss:(id)a3
{
  objc_super v4 = (APEmergencyCallHostViewController *)a3;
  if (self->_emergencyVC == v4)
  {
    self->_emergencyVC = 0;
    uint64_t v5 = v4;

    objc_super v4 = v5;
  }
}

- (void)emergencyTapped:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F251F8], "sharedGuard", a3);
  [v4 abortOngoingAuthWithCompletion:&__block_literal_global_75];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__APBaseShieldView_emergencyTapped___block_invoke_77;
  v5[3] = &unk_26522DA90;
  v5[4] = self;
  +[SBUIEmergencyCallHostViewController requestEmergencyCallControllerWithCompletion:v5];
}

void __36__APBaseShieldView_emergencyTapped___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    uint64_t v5 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __36__APBaseShieldView_emergencyTapped___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = (uint64_t *)(a1 + 32);
  if (*(void *)(v5 + 456))
  {
    BOOL v6 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __36__APBaseShieldView_emergencyTapped___block_invoke_77_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = v3;
  [v14 setDelegate:*v4];
  uint64_t v15 = [MEMORY[0x263F82E10] _viewControllerForFullScreenPresentationFromView:*v4];
  id v16 = v15;
  if (v15)
  {
    [v15 presentViewController:v14 animated:1 completion:0];
    uint64_t v17 = *v4;
    id v18 = v14;
    v19 = *(NSObject **)(v17 + 456);
    *(void *)(v17 + 456) = v18;
  }
  else
  {
    v19 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __36__APBaseShieldView_emergencyTapped___block_invoke_77_cold_1(v4, v19);
    }
  }
}

- (void)setShieldStyle:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(APApplication *)self->_shieldedApplication bundleIdentifier];
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "APBaseShieldView setShieldStyle:%lu for %@", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v7 = self;
    uint64_t v8 = (void *)MEMORY[0x263F82E00];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __performTransition_block_invoke;
    id v14 = &unk_26522DAE0;
    uint64_t v15 = v7;
    unint64_t v16 = a3;
    uint64_t v9 = v7;
    [v8 transitionWithView:v9 duration:5242880 options:buf animations:0 completion:0.2];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__APBaseShieldView_setShieldStyle___block_invoke;
    block[3] = &unk_26522DAB8;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v11);
  }
  self->_shieldStyle = a3;
  objc_destroyWeak(&location);
}

void __35__APBaseShieldView_setShieldStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __performTransition_block_invoke;
  v6[3] = &unk_26522DAE0;
  id v7 = WeakRetained;
  uint64_t v8 = v3;
  id v5 = WeakRetained;
  [v4 transitionWithView:v5 duration:5242880 options:v6 animations:0 completion:0.2];
}

- (void)resetShield
{
}

- (void)dealloc
{
  [(APSystemAppOutlet *)self->_outlet removeShield:self];
  v3.receiver = self;
  v3.super_class = (Class)APBaseShieldView;
  [(APBaseShieldView *)&v3 dealloc];
}

- (BOOL)isEqualTo:(id)a3
{
  return self == a3;
}

- (APApplication)shieldedApplication
{
  return self->_shieldedApplication;
}

- (APBaseShieldViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APBaseShieldViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shieldedApplication, 0);
  objc_storeStrong((id *)&self->_outlet, 0);
  objc_storeStrong((id *)&self->_emergencyVC, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_unlockButton, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_labelsElement, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

- (void)initWithApplication:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_247E02000, v2, v3, "making shield view, could not find record for %@: %@", v4, v5, v6, v7, v8);
}

- (void)initWithConfig:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 application];
  uint64_t v2 = [v1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_247E02000, v3, v4, "making shield view without localized name, could not find record for %@: %@", v5, v6, v7, v8, v9);
}

- (void)initWithLocalizedApplicationName:(uint64_t)a3 useHiddenStyle:(uint64_t)a4 needEmergencyCallButton:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLocalizedApplicationName:(uint64_t)a3 useHiddenStyle:(uint64_t)a4 needEmergencyCallButton:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247E02000, a2, OS_LOG_TYPE_ERROR, "Could not cancel ongoing auth. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_77_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_247E02000, a2, OS_LOG_TYPE_ERROR, "No appropriate presentation VC found for %@", (uint8_t *)&v3, 0xCu);
}

void __36__APBaseShieldView_emergencyTapped___block_invoke_77_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end