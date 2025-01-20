@interface HUICCFooterView
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (HACCContentModuleDelegate)delegate;
- (HUICCFooterView)initWithModule:(unint64_t)a3;
- (NSArray)requiredVisualStyleCategories;
- (UIAction)footerAction;
- (UILabel)footerLabel;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIView)highlightedBackgroundView;
- (id)accessibilityLabel;
- (id)contentValue;
- (unint64_t)accessibilityTraits;
- (unint64_t)module;
- (void)_openSettingsWithURL:(id)a3;
- (void)footerTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setFooterAction:(id)a3;
- (void)setFooterLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundView:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)setupFooterActionIfNecessary;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation HUICCFooterView

- (HUICCFooterView)initWithModule:(unint64_t)a3
{
  v53[10] = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)HUICCFooterView;
  v4 = -[HUICCFooterView initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(HUICCFooterView *)v4 setModule:a3];
    uint64_t v6 = [MEMORY[0x263F33CA0] _tertiaryView];
    highlightedBackgroundView = v5->_highlightedBackgroundView;
    v5->_highlightedBackgroundView = (UIView *)v6;

    [(UIView *)v5->_highlightedBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_highlightedBackgroundView setAlpha:0.0];
    [(HUICCFooterView *)v5 addSubview:v5->_highlightedBackgroundView];
    uint64_t v8 = HUICCMenuTextLabel();
    footerLabel = v5->_footerLabel;
    v5->_footerLabel = (UILabel *)v8;

    v10 = v5->_footerLabel;
    v11 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v10 setTextColor:v11];

    [(UILabel *)v5->_footerLabel setNumberOfLines:0];
    [(UILabel *)v5->_footerLabel setTextAlignment:1];
    [(UILabel *)v5->_footerLabel setLineBreakMode:4];
    [(UILabel *)v5->_footerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUICCFooterView *)v5 addSubview:v5->_footerLabel];
    v41 = (void *)MEMORY[0x263F08938];
    v51 = [(UILabel *)v5->_footerLabel leadingAnchor];
    v50 = [(HUICCFooterView *)v5 leadingAnchor];
    CCUILayoutGutter();
    v49 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50);
    v53[0] = v49;
    v48 = [(UILabel *)v5->_footerLabel trailingAnchor];
    v47 = [(HUICCFooterView *)v5 trailingAnchor];
    CCUILayoutGutter();
    v46 = [v48 constraintEqualToAnchor:v47 constant:-v12];
    v53[1] = v46;
    v45 = [(UILabel *)v5->_footerLabel topAnchor];
    v44 = [(HUICCFooterView *)v5 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v53[2] = v43;
    v42 = [(UILabel *)v5->_footerLabel bottomAnchor];
    v40 = [(HUICCFooterView *)v5 bottomAnchor];
    CCUILayoutGutter();
    v39 = [v42 constraintEqualToAnchor:v40 constant:v13 * -0.25];
    v53[3] = v39;
    v38 = [(UILabel *)v5->_footerLabel heightAnchor];
    v37 = [v38 constraintGreaterThanOrEqualToConstant:52.0];
    v53[4] = v37;
    v36 = [(UILabel *)v5->_footerLabel centerYAnchor];
    v35 = [(HUICCFooterView *)v5 centerYAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v53[5] = v34;
    v33 = [(UIView *)v5->_highlightedBackgroundView leadingAnchor];
    v32 = [(HUICCFooterView *)v5 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v53[6] = v31;
    v30 = [(UIView *)v5->_highlightedBackgroundView trailingAnchor];
    v14 = [(HUICCFooterView *)v5 trailingAnchor];
    v15 = [v30 constraintEqualToAnchor:v14];
    v53[7] = v15;
    v16 = [(UIView *)v5->_highlightedBackgroundView topAnchor];
    v17 = [(HUICCFooterView *)v5 topAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v53[8] = v18;
    v19 = [(UIView *)v5->_highlightedBackgroundView bottomAnchor];
    v20 = [(HUICCFooterView *)v5 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v53[9] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:10];
    [v41 activateConstraints:v22];

    [(HUICCFooterView *)v5 setupFooterActionIfNecessary];
    v23 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v5 action:sel_footerTapped_];
    [(HUICCFooterView *)v5 addGestureRecognizer:v23];
    id v24 = objc_alloc(MEMORY[0x263F82BC0]);
    v25 = [MEMORY[0x263F830C8] lightConfiguration];
    uint64_t v26 = [v24 initWithConfiguration:v25 view:v5];
    feedbackGenerator = v5->_feedbackGenerator;
    v5->_feedbackGenerator = (UISelectionFeedbackGenerator *)v26;

    v28 = HUICCBackgroundVisualStylingProviderForCategory(1);
    [(HUICCFooterView *)v5 setVisualStylingProvider:v28 forCategory:1];
  }
  return v5;
}

- (void)setupFooterActionIfNecessary
{
  unint64_t v3 = [(HUICCFooterView *)self module];
  if (v3 == 22)
  {
    v4 = @"prefs:root=ACCESSIBILITY&path=HEARING_AID_TITLE";
  }
  else
  {
    if (v3 != 28)
    {
      id v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    v4 = @"prefs:root=ACCESSIBILITY&path=AUDIO_VISUAL_TITLE/AXCSEnableSpecID#CSFeatureToggleSpecID";
  }
  id v5 = [NSURL URLWithString:v4];
  uint64_t v6 = hearingLocString();
  if (v6 && v5)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x263F823D0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__HUICCFooterView_setupFooterActionIfNecessary__block_invoke;
    v9[3] = &unk_2647CD710;
    objc_copyWeak(&v11, &location);
    id v5 = v5;
    id v10 = v5;
    uint64_t v8 = [v7 actionWithTitle:v6 image:0 identifier:v6 handler:v9];
    [(HUICCFooterView *)self setFooterAction:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
LABEL_9:
}

void __47__HUICCFooterView_setupFooterActionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _openSettingsWithURL:*(void *)(a1 + 32)];
}

- (void)_openSettingsWithURL:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HUICCFooterView__openSettingsWithURL___block_invoke;
  v7[3] = &unk_2647CD360;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__HUICCFooterView__openSettingsWithURL___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v2 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  uint64_t v30 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v35 = __getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke;
    v36 = &unk_2647CD738;
    v37 = &v27;
    unint64_t v3 = (void *)FrontBoardServicesLibrary();
    id v4 = dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    *(void *)(v37[1] + 24) = v4;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(v37[1] + 24);
    v2 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v2) {
    goto LABEL_18;
  }
  id v5 = *v2;
  v31[0] = v5;
  uint64_t v6 = MEMORY[0x263EFFA88];
  v33[0] = MEMORY[0x263EFFA88];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v7 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  uint64_t v30 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v35 = __getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke;
    v36 = &unk_2647CD738;
    v37 = &v27;
    id v8 = (void *)FrontBoardServicesLibrary();
    v9 = dlsym(v8, "FBSOpenApplicationOptionKeyUnlockDevice");
    *(void *)(v37[1] + 24) = v9;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(v37[1] + 24);
    v7 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v7) {
    goto LABEL_18;
  }
  id v10 = *v7;
  v31[1] = v10;
  v33[1] = v6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v11 = (id *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
  uint64_t v30 = getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v35 = __getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_block_invoke;
    v36 = &unk_2647CD738;
    v37 = &v27;
    double v12 = (void *)FrontBoardServicesLibrary();
    double v13 = dlsym(v12, "FBSOpenApplicationOptionKeyLaunchOrigin");
    *(void *)(v37[1] + 24) = v13;
    getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = *(void *)(v37[1] + 24);
    id v11 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v11)
  {
LABEL_18:
    __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_1();
    __break(1u);
  }
  id v32 = *v11;
  v33[2] = @"HUICCFooterView";
  v14 = NSDictionary;
  id v15 = v32;
  v16 = [v14 dictionaryWithObjects:v33 forKeys:v31 count:3];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v17 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v30 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v35 = __getLSApplicationWorkspaceClass_block_invoke;
    v36 = &unk_2647CD738;
    v37 = &v27;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&buf);
    v17 = (void *)v28[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v27, 8);
  v19 = [v18 defaultWorkspace];
  uint64_t v20 = *(void *)(a1 + 32);
  id v26 = 0;
  int v21 = [v19 openSensitiveURL:v20 withOptions:v16 error:&v26];
  id v22 = v26;

  v23 = AXLogCommon();
  id v24 = v23;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [*(id *)(a1 + 40) footerLabel];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_226B65000, v24, OS_LOG_TYPE_DEFAULT, "[HearingCC] Open URL for %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(a1, v24);
  }
}

- (void)setFooterAction:(id)a3
{
  p_footerAction = &self->_footerAction;
  objc_storeStrong((id *)&self->_footerAction, a3);
  id v6 = a3;
  id v8 = [(HUICCFooterView *)self footerLabel];
  v7 = [(UIAction *)*p_footerAction title];

  [v8 setText:v7];
}

- (void)footerTapped:(id)a3
{
  id v4 = [(HUICCFooterView *)self footerAction];

  if (v4)
  {
    id v5 = [(HUICCFooterView *)self footerAction];
    [v5 performWithSender:self target:0];
  }
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)isHighlighted
{
  v2 = [(HUICCFooterView *)self highlightedBackgroundView];
  [v2 alpha];
  BOOL v4 = v3 == 1.0;

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  int v3 = a3;
  uint64_t v5 = [(HUICCFooterView *)self footerAction];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = [(HUICCFooterView *)self isHighlighted];

    if (v7 != v3)
    {
      double v8 = 0.0;
      if (v3)
      {
        v9 = [(HUICCFooterView *)self feedbackGenerator];
        [v9 selectionChanged];

        double v8 = 1.0;
      }
      id v10 = [(HUICCFooterView *)self highlightedBackgroundView];
      [v10 setAlpha:v8];
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (id)accessibilityLabel
{
  v2 = [(HUICCFooterView *)self footerLabel];
  int v3 = [v2 accessibilityLabel];

  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26DAB9B50;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(HUICCFooterView *)self requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__HUICCFooterView_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_2647CD360;
    id v11 = v6;
    double v12 = self;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __56__HUICCFooterView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) footerLabel];
  [v1 automaticallyUpdateView:v2 withStyle:0];
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (UIAction)footerAction
{
  return self->_footerAction;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_footerAction, 0);
  objc_destroyWeak((id *)&self->delegate);
}

uint64_t __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(v0);
}

void __40__HUICCFooterView__openSettingsWithURL___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [*(id *)(a1 + 40) footerLabel];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_226B65000, a2, OS_LOG_TYPE_ERROR, "[HearingCC] Failed to open URL for %@", (uint8_t *)&v4, 0xCu);
}

@end