@interface AMUIDateTimeDataLayerViewController
- (AMUIDateProviding)dateProvider;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleDismiss;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (NSDictionary)activeConfigurationMetadata;
- (UIView)viewForOpacityAdjustment;
- (int64_t)chromeOrientationPolicy;
- (void)_noteWindowWillRotate:(id)a3;
- (void)_updateDateTimeConstraintsForChromeOrientation;
- (void)_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:(int64_t)a3;
- (void)_updateNominalSafeAreaGuide;
- (void)loadView;
- (void)setChromeOrientationPolicy:(int64_t)a3;
- (void)setDateProvider:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillMoveToWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AMUIDateTimeDataLayerViewController

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  self->_chromeOrientationPolicy = a3;
  id v3 = [(AMUIDateTimeDataLayerViewController *)self viewIfLoaded];
  [v3 setNeedsUpdateConstraints];
}

- (void)setDateProvider:(id)a3
{
  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  id v6 = a3;
  [(AMUIDateTimeViewController *)self->_dateTimeViewController setDateProvider:*p_dateProvider];
}

- (UIView)viewForOpacityAdjustment
{
  return [(AMUIDateTimeViewController *)self->_dateTimeViewController viewForOpacityAdjustment];
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v31 = 0;
  v8 = objc_msgSend(v6, "pr_loadTitleStyleConfigurationWithError:", &v31);
  id v9 = v31;
  if (!v8)
  {
    v10 = AMUILogDataLayer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_247837000, v10, OS_LOG_TYPE_INFO, "Failed to load poster title style configuration (will use default style) %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v11 = (void *)getPRMutablePosterTitleStyleConfigurationClass_softClass;
    uint64_t v35 = getPRMutablePosterTitleStyleConfigurationClass_softClass;
    if (!getPRMutablePosterTitleStyleConfigurationClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v37 = __getPRMutablePosterTitleStyleConfigurationClass_block_invoke;
      v38 = &unk_2652248F0;
      v39 = &v32;
      __getPRMutablePosterTitleStyleConfigurationClass_block_invoke((uint64_t)&buf);
      v11 = (void *)v33[3];
    }
    v12 = v11;
    _Block_object_dispose(&v32, 8);
    id v13 = objc_alloc_init(v12);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v14 = (void *)getPRPosterColorClass_softClass;
    uint64_t v35 = getPRPosterColorClass_softClass;
    if (!getPRPosterColorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v37 = __getPRPosterColorClass_block_invoke;
      v38 = &unk_2652248F0;
      v39 = &v32;
      __getPRPosterColorClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v33[3];
    }
    v15 = v14;
    _Block_object_dispose(&v32, 8);
    id v16 = [v15 alloc];
    v17 = [MEMORY[0x263F1C550] whiteColor];
    v18 = [v17 colorWithAlphaComponent:0.9];
    v19 = (void *)[v16 initWithColor:v18 preferredStyle:2];

    [v13 setTitleColor:v19];
    v8 = (void *)[v13 copy];
  }
  v20 = objc_msgSend(v6, "pr_posterProvider");
  if (v20)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v20 error:0];
    v22 = [v21 URL];

    if (v22)
    {
      v23 = [v8 vibrancyConfigurationWithExtensionBundleURL:v22];

      goto LABEL_18;
    }
  }
  else
  {
    v24 = AMUILogDataLayer();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[AMUIDateTimeDataLayerViewController updatePosterConfiguration:withAnimationSettings:]((uint64_t)v6, v24);
    }
  }
  v25 = AMUILogDataLayer();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    -[AMUIDateTimeDataLayerViewController updatePosterConfiguration:withAnimationSettings:]((uint64_t)v6, v25);
  }

  v23 = [v8 vibrancyConfiguration];
LABEL_18:
  v26 = (void *)MEMORY[0x263F29D20];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __87__AMUIDateTimeDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
  v29[3] = &unk_265224858;
  v29[4] = self;
  id v30 = v23;
  id v27 = v23;
  [v26 animateWithSettings:v7 actions:v29];

  return 1;
}

uint64_t __87__AMUIDateTimeDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) setVibrancyConfiguration:*(void *)(a1 + 40)];
}

- (NSDictionary)activeConfigurationMetadata
{
  return 0;
}

- (BOOL)handleDismiss
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc_init(AMUITouchPassthroughView);
  [(AMUIDateTimeDataLayerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)AMUIDateTimeDataLayerViewController;
  [(AMUIDateTimeDataLayerViewController *)&v49 viewDidLoad];
  id v3 = objc_alloc_init(AMUIDateTimeViewController);
  [(AMUIDateTimeViewController *)v3 setDateProvider:self->_dateProvider];
  v4 = [(AMUIDateTimeDataLayerViewController *)self view];
  v5 = [(AMUIDateTimeViewController *)v3 view];
  [v5 setUserInteractionEnabled:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  dateTimeViewController = self->_dateTimeViewController;
  self->_dateTimeViewController = v3;
  id v7 = v3;

  v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
  nominalSafeAreaLayoutGuide = self->_nominalSafeAreaLayoutGuide;
  self->_nominalSafeAreaLayoutGuide = v8;

  [v4 addLayoutGuide:self->_nominalSafeAreaLayoutGuide];
  v10 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide topAnchor];
  v11 = [v4 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
  nominalSafeAreaTopConstraint = self->_nominalSafeAreaTopConstraint;
  self->_nominalSafeAreaTopConstraint = v12;

  v14 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide bottomAnchor];
  v15 = [v4 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
  nominalSafeAreaBottomConstraint = self->_nominalSafeAreaBottomConstraint;
  self->_nominalSafeAreaBottomConstraint = v16;

  v18 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide leftAnchor];
  v19 = [v4 leftAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
  nominalSafeAreaLeftConstraint = self->_nominalSafeAreaLeftConstraint;
  self->_nominalSafeAreaLeftConstraint = v20;

  v22 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide rightAnchor];
  v23 = [v4 rightAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:0.0];
  nominalSafeAreaRightConstraint = self->_nominalSafeAreaRightConstraint;
  self->_nominalSafeAreaRightConstraint = v24;

  v26 = [v5 leadingAnchor];
  id v27 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  dateTimeLeadingEdgeConstraint = self->_dateTimeLeadingEdgeConstraint;
  self->_dateTimeLeadingEdgeConstraint = v28;

  id v30 = [v5 trailingAnchor];
  id v31 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide trailingAnchor];
  uint64_t v32 = [v30 constraintEqualToAnchor:v31];
  dateTimeTrailingEdgeConstraint = self->_dateTimeTrailingEdgeConstraint;
  self->_dateTimeTrailingEdgeConstraint = v32;

  uint64_t v34 = [v5 leftAnchor];
  uint64_t v35 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide leftAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  dateTimeLeftEdgeConstraint = self->_dateTimeLeftEdgeConstraint;
  self->_dateTimeLeftEdgeConstraint = v36;

  v38 = [v5 rightAnchor];
  v39 = [(UILayoutGuide *)self->_nominalSafeAreaLayoutGuide rightAnchor];
  uint64_t v40 = [v38 constraintEqualToAnchor:v39];
  dateTimeRightEdgeConstraint = self->_dateTimeRightEdgeConstraint;
  self->_dateTimeRightEdgeConstraint = v40;

  v42 = self->_dateTimeViewController;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __50__AMUIDateTimeDataLayerViewController_viewDidLoad__block_invoke;
  v45[3] = &unk_265224880;
  id v46 = v5;
  id v47 = v4;
  v48 = self;
  id v43 = v4;
  id v44 = v5;
  [(AMUIDateTimeDataLayerViewController *)self bs_addChildViewController:v42 animated:0 transitionBlock:v45];
}

void __50__AMUIDateTimeDataLayerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v12[5] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08938];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  id v6 = [v4 topAnchor];
  id v7 = [*(id *)(a1 + 40) topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:34.0];
  v12[0] = v8;
  id v9 = *(void **)(a1 + 48);
  v12[1] = v9[124];
  v12[2] = v9[125];
  v12[3] = v9[126];
  v12[4] = v9[127];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  [v3 activateConstraints:v10];

  v11 = [*(id *)(a1 + 48) view];
  [v11 setNeedsUpdateConstraints];

  v5[2](v5);
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIDateTimeDataLayerViewController;
  [(AMUIDateTimeDataLayerViewController *)&v3 updateViewConstraints];
  [(AMUIDateTimeDataLayerViewController *)self _updateNominalSafeAreaGuide];
  [(AMUIDateTimeDataLayerViewController *)self _updateDateTimeConstraintsForChromeOrientation];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIDateTimeDataLayerViewController;
  [(AMUIDateTimeDataLayerViewController *)&v5 viewWillMoveToWindow:a3];
  v4 = [(AMUIDateTimeDataLayerViewController *)self viewIfLoaded];
  [v4 setNeedsUpdateConstraints];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMUIDateTimeDataLayerViewController;
  [(AMUIDateTimeDataLayerViewController *)&v10 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *MEMORY[0x263F1D840];
  [v7 removeObserver:self name:*MEMORY[0x263F1D840] object:0];
  if (v6)
  {
    [v7 addObserver:self selector:sel__noteWindowWillRotate_ name:v8 object:v6];
    id v9 = [(AMUIDateTimeDataLayerViewController *)self viewIfLoaded];
    [v9 setNeedsUpdateConstraints];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __90__AMUIDateTimeDataLayerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_2652248A8;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:&__block_literal_global_0];
}

uint64_t __90__AMUIDateTimeDataLayerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNominalSafeAreaGuide];
}

- (void)_updateNominalSafeAreaGuide
{
  objc_super v3 = [(AMUIDateTimeDataLayerViewController *)self viewIfLoaded];
  id v11 = [v3 window];

  if (v11)
  {
    [v11 safeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x263F1D1C0];
    double v6 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v8 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  [(NSLayoutConstraint *)self->_nominalSafeAreaTopConstraint setConstant:v4];
  [(NSLayoutConstraint *)self->_nominalSafeAreaBottomConstraint setConstant:-v8];
  [(NSLayoutConstraint *)self->_nominalSafeAreaLeftConstraint setConstant:v6];
  [(NSLayoutConstraint *)self->_nominalSafeAreaRightConstraint setConstant:-v10];
}

- (void)_updateDateTimeConstraintsForChromeOrientation
{
  id v4 = [(AMUIDateTimeDataLayerViewController *)self viewIfLoaded];
  objc_super v3 = [v4 window];
  -[AMUIDateTimeDataLayerViewController _updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:](self, "_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:", [v3 _windowInterfaceOrientation]);
}

- (void)_updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:(int64_t)a3
{
  int64_t chromeOrientationPolicy = self->_chromeOrientationPolicy;
  BOOL v5 = a3 == 4;
  BOOL v6 = a3 != 4;
  if (a3 == 3) {
    BOOL v5 = 0;
  }
  BOOL v7 = a3 == 3;
  if (a3 == 3) {
    BOOL v6 = 0;
  }
  BOOL v8 = chromeOrientationPolicy == 2 && v5;
  BOOL v9 = chromeOrientationPolicy == 2 && v7;
  if (chromeOrientationPolicy == 2) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = chromeOrientationPolicy != 1;
  }
  BOOL v11 = chromeOrientationPolicy != 2 && chromeOrientationPolicy == 1;
  [(NSLayoutConstraint *)self->_dateTimeLeftEdgeConstraint setActive:v8];
  [(NSLayoutConstraint *)self->_dateTimeRightEdgeConstraint setActive:v9];
  [(NSLayoutConstraint *)self->_dateTimeLeadingEdgeConstraint setActive:v10];
  dateTimeTrailingEdgeConstraint = self->_dateTimeTrailingEdgeConstraint;

  [(NSLayoutConstraint *)dateTimeTrailingEdgeConstraint setActive:v11];
}

- (void)_noteWindowWillRotate:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D828]];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = (void *)MEMORY[0x263F1CB60];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__AMUIDateTimeDataLayerViewController__noteWindowWillRotate___block_invoke;
  v12[3] = &unk_265224858;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 performWithoutAnimation:v12];
}

uint64_t __61__AMUIDateTimeDataLayerViewController__noteWindowWillRotate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) integerValue];

  return [v1 _updateDateTimeConstraintsForChromeOrientationWithInterfaceOrientation:v2];
}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeRightEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeLeftEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_dateTimeLeadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaRightConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaLeftConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaTopConstraint, 0);
  objc_storeStrong((id *)&self->_nominalSafeAreaLayoutGuide, 0);

  objc_storeStrong((id *)&self->_dateTimeViewController, 0);
}

- (void)updatePosterConfiguration:(uint64_t)a1 withAnimationSettings:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_247837000, a2, OS_LOG_TYPE_FAULT, "Unable to find extension bundle URL for config %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updatePosterConfiguration:(uint64_t)a1 withAnimationSettings:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Missing poster provider from the poster configuration %@", (uint8_t *)&v2, 0xCu);
}

@end