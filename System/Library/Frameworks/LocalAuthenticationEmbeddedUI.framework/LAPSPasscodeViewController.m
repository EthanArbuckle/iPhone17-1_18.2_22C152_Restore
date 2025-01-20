@interface LAPSPasscodeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAccessibilityTextEnabled;
- (BOOL)_passcodeTypeAllowsVariableLength;
- (BOOL)_shouldShowPasscodeOptionsButton;
- (BOOL)_shouldShowPasscodeOptionsNavigationItem;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (LAPSPasscodeViewController)initWithConfiguration:(id)a3;
- (LAPSPasscodeViewControllerDelegate)delegate;
- (NSDirectionalEdgeInsets)_mainStackInsets;
- (double)_accessibilitySpacing;
- (double)_bodyStackHorizontalPadding;
- (double)_bottomPadding;
- (id)navigationItem;
- (int64_t)_passcodeOptionsPresentationStyle;
- (int64_t)_styleWithPasscodeType:(id)a3;
- (void)_cancel:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_layoutIfNeeded;
- (void)_next:(id)a3;
- (void)_setNextButtonEnabled:(BOOL)a3;
- (void)_setPasscodeType:(id)a3;
- (void)_setup;
- (void)_setupNavigationItem;
- (void)_showPasscodeOptions:(id)a3;
- (void)_submitPasscode:(id)a3;
- (void)clear;
- (void)focus;
- (void)passcodeField:(id)a3 didChangePasscodeLength:(unint64_t)a4;
- (void)passcodeField:(id)a3 didSubmitPasscode:(id)a4;
- (void)passcodeOptionsViewController:(id)a3 didSelectPasscodeType:(id)a4;
- (void)passcodeOptionsViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4;
- (void)passcodeOptionsViewControllerDidDisappear:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)shakeWithCompletion:(id)a3;
- (void)showSpinner;
- (void)unfocus;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation LAPSPasscodeViewController

- (LAPSPasscodeViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscodeViewController;
  v6 = [(LAPSPasscodeViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    p_config = (id *)&v6->_config;
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v9 = [*p_config passcodeType];
    passcodeType = v7->_passcodeType;
    v7->_passcodeType = (LAPSPasscodeType *)v9;

    v11 = [*p_config optionsConfiguration];
    v7->_isPasscodeRecoveryEnabled = [v11 isPasscodeRecoveryEnabled];
  }
  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeViewController;
  [(LAPSPasscodeViewController *)&v3 viewDidLoad];
  [(LAPSPasscodeViewController *)self _setup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LAPSPasscodeViewController;
  [(LAPSPasscodeViewController *)&v4 viewWillAppear:a3];
  if (![(LAPSPasscodeViewControllerConfiguration *)self->_config shouldAvoidBecomingFirstResponderOnStart])[(LACUIPasscodeField *)self->_passcodeFieldVC becomeFirstResponder]; {
}
  }

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LAPSPasscodeViewController;
  [(LAPSPasscodeViewController *)&v4 viewDidAppear:a3];
  if (![(LAPSPasscodeViewControllerConfiguration *)self->_config shouldAvoidBecomingFirstResponderOnStart])[(LACUIPasscodeField *)self->_passcodeFieldVC becomeFirstResponder]; {
}
  }

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeViewController;
  [(LAPSPasscodeViewController *)&v11 viewDidLayoutSubviews];
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrollView);
  [WeakRetained contentSize];
  double v6 = v5;
  id v7 = objc_loadWeakRetained((id *)p_scrollView);
  [v7 frame];
  double v9 = v8;

  if (v6 > v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_scrollView);
    [v10 _flashScrollIndicatorsPersistingPreviousFlashes];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return [(LACUIPasscodeField *)self->_passcodeFieldVC canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(LACUIPasscodeField *)self->_passcodeFieldVC becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(LACUIPasscodeField *)self->_passcodeFieldVC resignFirstResponder];
}

- (id)navigationItem
{
  objc_super v3 = [(LAPSPasscodeViewController *)self parentViewController];
  objc_super v4 = [v3 navigationItem];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAPSPasscodeViewController;
    id v6 = [(LAPSPasscodeViewController *)&v9 navigationItem];
  }
  id v7 = v6;

  return v7;
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LAPSPasscodeViewController;
  -[LAPSPasscodeViewController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsButton);
  [WeakRetained setHidden:a3 == 0];

  id v6 = [(LAPSPasscodeViewController *)self presentedViewController];

  if (v6)
  {
    id v7 = [(LAPSPasscodeViewController *)self presentedViewController];
    [v7 dismissViewControllerAnimated:0 completion:&__block_literal_global_0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)shakeWithCompletion:(id)a3
{
}

- (void)focus
{
  [(LACUIPasscodeField *)self->_passcodeFieldVC setAcceptInputs:1];
  passcodeFieldVC = self->_passcodeFieldVC;

  [(LACUIPasscodeField *)passcodeFieldVC becomeFirstResponder];
}

- (void)clear
{
}

- (void)unfocus
{
}

- (void)showSpinner
{
  id v5 = [(LAPSPasscodeViewController *)self navigationItem];
  id v2 = objc_alloc(MEMORY[0x263F824A8]);
  id v3 = objc_alloc_init(MEMORY[0x263F823E8]);
  [v3 startAnimating];
  objc_super v4 = (void *)[v2 initWithCustomView:v3];
  [v5 setRightBarButtonItem:v4];
}

- (void)setHeader:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && [v4 length])
  {
    int v5 = 0;
    id v6 = v8;
  }
  else
  {
    id v6 = [(LAPSPasscodeViewControllerConfiguration *)self->_config prompt];
    int v5 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_header);
  [WeakRetained setText:v6];

  if (v5) {
}
  }

- (void)setFooter:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && [v4 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_footer);
    [WeakRetained setText:v8];

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_footer);
  [v7 setHidden:v6];
}

- (void)setErrorMessage:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && [v4 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_errorCapsule);
    [WeakRetained setText:v8];

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_errorCapsuleContainer);
  [v7 setHidden:v6];

  [(LAPSPasscodeViewController *)self _layoutIfNeeded];
}

- (void)_setup
{
  v182[2] = *MEMORY[0x263EF8340];
  id v3 = [(LAPSPasscodeViewController *)self view];
  id v4 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  int v5 = [(LAPSPasscodeViewControllerConfiguration *)self->_config title];
  [(LAPSPasscodeViewController *)self setTitle:v5];

  [(LAPSPasscodeViewController *)self _setupNavigationItem];
  id v6 = objc_alloc_init(MEMORY[0x263F82B88]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setShowsHorizontalScrollIndicator:0];
  id v7 = [(LAPSPasscodeViewController *)self view];
  [v7 addSubview:v6];

  v169 = (void *)MEMORY[0x263F08938];
  id v8 = [v6 centerXAnchor];
  v172 = self;
  objc_super v9 = [(LAPSPasscodeViewController *)self view];
  id v10 = [v9 centerXAnchor];
  objc_super v11 = [v8 constraintEqualToAnchor:v10];
  v182[0] = v11;
  id obj = v6;
  v12 = [v6 widthAnchor];
  objc_super v13 = [(LAPSPasscodeViewController *)self view];
  v14 = [v13 widthAnchor];
  v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  double v17 = 0.85;
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v17 = 1.0;
  }
  v18 = [v12 constraintEqualToAnchor:v14 multiplier:v17];
  v182[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:2];
  [v169 activateConstraints:v19];

  id v20 = objc_alloc(MEMORY[0x263F52550]);
  v21 = [(LAPSPasscodeViewController *)v172 view];
  v22 = (void *)[v20 initWithView:v21];

  v23 = [v6 bottomAnchor];
  v170 = v22;
  v24 = [v22 topAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];

  v168 = v25;
  [v25 setActive:1];
  id v26 = objc_alloc_init(MEMORY[0x263F82908]);
  v27 = [(LAPSPasscodeViewController *)v172 view];
  [v27 addLayoutGuide:v26];

  v135 = (void *)MEMORY[0x263F08938];
  v161 = [v26 topAnchor];
  v165 = [(LAPSPasscodeViewController *)v172 view];
  v158 = [v165 topAnchor];
  v154 = [v161 constraintEqualToAnchor:v158];
  v181[0] = v154;
  v145 = [v26 heightAnchor];
  v150 = [(LAPSPasscodeViewController *)v172 view];
  v140 = [v150 heightAnchor];
  v130 = [v145 constraintEqualToAnchor:v140 multiplier:0.5];
  v181[1] = v130;
  v28 = [v26 leadingAnchor];
  v29 = [(LAPSPasscodeViewController *)v172 view];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v181[2] = v31;
  v32 = [v26 trailingAnchor];
  v33 = [(LAPSPasscodeViewController *)v172 view];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v181[3] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v181 count:4];
  [v135 activateConstraints:v36];

  LODWORD(v28) = [(LAPSPasscodeViewController *)v172 _isAccessibilityTextEnabled];
  v37 = [obj topAnchor];
  v164 = v26;
  if (v28)
  {
    v38 = [v26 topAnchor];
    double v39 = 20.0;
  }
  else
  {
    v38 = [v26 centerYAnchor];
    double v39 = -40.0;
  }
  v40 = [v37 constraintEqualToAnchor:v38 constant:v39];
  [v40 setActive:1];

  objc_storeWeak((id *)&v172->_scrollView, obj);
  id v41 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v41 setAxis:1];
  [v41 setAlignment:0];
  [v41 setDistribution:3];
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LAPSPasscodeViewController *)v172 _mainStackSpacing];
  objc_msgSend(v41, "setSpacing:");
  [obj addSubview:v41];
  v141 = (void *)MEMORY[0x263F08938];
  v166 = [v41 topAnchor];
  v162 = [obj topAnchor];
  v159 = [v166 constraintEqualToAnchor:v162];
  v180[0] = v159;
  v155 = [v41 bottomAnchor];
  v151 = [obj bottomAnchor];
  v146 = [v155 constraintEqualToAnchor:v151];
  v180[1] = v146;
  v136 = [v41 leadingAnchor];
  v131 = [obj leadingAnchor];
  v42 = [v136 constraintEqualToAnchor:v131];
  v180[2] = v42;
  v43 = [v41 trailingAnchor];
  v44 = [obj trailingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v180[3] = v45;
  v46 = [v41 widthAnchor];
  v47 = [obj widthAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  v180[4] = v48;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v180 count:5];
  [v141 activateConstraints:v49];

  [v41 setLayoutMarginsRelativeArrangement:1];
  [(LAPSPasscodeViewController *)v172 _mainStackInsets];
  objc_msgSend(v41, "setDirectionalLayoutMargins:");
  objc_storeWeak((id *)&v172->_stack, v41);
  id v50 = objc_alloc_init(MEMORY[0x263F828E0]);
  v51 = [(LAPSPasscodeViewControllerConfiguration *)v172->_config prompt];
  [v50 setText:v51];

  [v50 setNumberOfLines:0];
  uint64_t v114 = *MEMORY[0x263F83570];
  v52 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:");
  [v50 setFont:v52];

  [v50 setTextAlignment:1];
  [v41 addArrangedSubview:v50];
  LODWORD(v53) = 1144750080;
  [v50 setContentHuggingPriority:1 forAxis:v53];
  v160 = v50;
  objc_storeWeak((id *)&v172->_header, v50);
  id v54 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [(LAPSPasscodeViewController *)v172 _bodyStackSpacing];
  objc_msgSend(v54, "setSpacing:");
  [v54 setAxis:1];
  [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LAPSPasscodeViewController *)v172 _bodyStackHorizontalPadding];
  double v56 = v55;
  [(LAPSPasscodeViewController *)v172 _bodyStackHorizontalPadding];
  objc_msgSend(v54, "setDirectionalLayoutMargins:", 0.0, v56, 0.0, v57);
  [v54 setLayoutMarginsRelativeArrangement:1];
  v163 = v41;
  v58 = v41;
  v59 = v54;
  v167 = v54;
  [v58 addArrangedSubview:v54];
  uint64_t v60 = objc_msgSend(objc_alloc(MEMORY[0x263F52560]), "initWithStyle:", -[LAPSPasscodeViewController _styleWithPasscodeType:](v172, "_styleWithPasscodeType:", v172->_passcodeType));
  passcodeFieldVC = v172->_passcodeFieldVC;
  v172->_passcodeFieldVC = (LACUIPasscodeField *)v60;

  [(LACUIPasscodeField *)v172->_passcodeFieldVC setCanShowInLockScreen:[(LAPSPasscodeViewController *)v172 _canShowWhileLocked]];
  [(LAPSPasscodeViewController *)v172 addChildViewController:v172->_passcodeFieldVC];
  v62 = [(LACUIPasscodeField *)v172->_passcodeFieldVC view];
  [v59 addArrangedSubview:v62];

  [(LACUIPasscodeField *)v172->_passcodeFieldVC setDelegate:v172];
  [(LACUIPasscodeField *)v172->_passcodeFieldVC didMoveToParentViewController:v172];
  id v63 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v64 = objc_alloc_init(MEMORY[0x263F52530]);
  [v64 setNumberOfLines:0];
  v65 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v64 setFont:v65];

  [v64 setStyle:1];
  [v64 setTextAlignment:1];
  [v64 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v63 addSubview:v64];
  v127 = (void *)MEMORY[0x263F08938];
  v156 = [v64 topAnchor];
  v152 = [v63 topAnchor];
  v147 = [v156 constraintEqualToAnchor:v152];
  v179[0] = v147;
  v142 = [v64 bottomAnchor];
  v137 = [v63 bottomAnchor];
  v132 = [v142 constraintEqualToAnchor:v137];
  v179[1] = v132;
  v124 = [v64 leadingAnchor];
  v121 = [v63 leadingAnchor];
  v118 = [v124 constraintGreaterThanOrEqualToAnchor:v121];
  v179[2] = v118;
  v66 = [v64 trailingAnchor];
  v67 = [v63 trailingAnchor];
  v68 = [v66 constraintLessThanOrEqualToAnchor:v67];
  v179[3] = v68;
  v69 = [v64 centerXAnchor];
  v70 = [v63 centerXAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  v179[4] = v71;
  v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v179 count:5];
  [v127 activateConstraints:v72];

  v73 = v167;
  [v167 addArrangedSubview:v63];
  objc_storeWeak((id *)&v172->_errorCapsule, v64);
  objc_storeWeak((id *)&v172->_errorCapsuleContainer, v63);
  v74 = [(LAPSPasscodeViewControllerConfiguration *)v172->_config errorMessage];
  [(LAPSPasscodeViewController *)v172 setErrorMessage:v74];

  id v75 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v75 setNumberOfLines:0];
  v76 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v75 setFont:v76];

  v77 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v75 setTextColor:v77];

  [v75 setTextAlignment:1];
  [v167 addArrangedSubview:v75];
  LODWORD(v78) = 1144750080;
  [v75 setContentHuggingPriority:1 forAxis:v78];
  objc_storeWeak((id *)&v172->_footer, v75);
  v79 = [(LAPSPasscodeViewControllerConfiguration *)v172->_config footer];
  [(LAPSPasscodeViewController *)v172 setFooter:v79];

  if ([(LAPSPasscodeViewController *)v172 _shouldShowPasscodeOptionsButton]
    && ![(LAPSPasscodeViewController *)v172 _shouldShowPasscodeOptionsNavigationItem])
  {
    id v80 = objc_alloc_init(MEMORY[0x263F82E00]);
    v81 = [(LAPSPasscodeViewController *)v172 view];
    [v81 backgroundColor];
    v82 = id v157 = v63;
    [v80 setBackgroundColor:v82];

    [v80 setTranslatesAutoresizingMaskIntoConstraints:0];
    v83 = [(LAPSPasscodeViewController *)v172 view];
    v84 = v80;
    [v83 addSubview:v80];

    v85 = (void *)MEMORY[0x263F08938];
    v178 = v168;
    v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v178 count:1];
    [v85 deactivateConstraints:v86];

    v119 = (void *)MEMORY[0x263F08938];
    v143 = [v80 topAnchor];
    id WeakRetained = objc_loadWeakRetained((id *)&v172->_scrollView);
    v138 = [WeakRetained bottomAnchor];
    v133 = [v143 constraintEqualToAnchor:v138 constant:8.0];
    v177[0] = v133;
    v128 = [v80 bottomAnchor];
    v125 = [v170 topAnchor];
    v122 = [v128 constraintEqualToAnchor:v125];
    v177[1] = v122;
    location = [v80 leadingAnchor];
    v87 = [(LAPSPasscodeViewController *)v172 view];
    v88 = [v87 leadingAnchor];
    v89 = [location constraintEqualToAnchor:v88];
    v177[2] = v89;
    v90 = [v80 trailingAnchor];
    [(LAPSPasscodeViewController *)v172 view];
    v91 = id v153 = v64;
    v92 = [v91 trailingAnchor];
    v93 = [v90 constraintEqualToAnchor:v92];
    v177[3] = v93;
    v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v177 count:4];
    [v119 activateConstraints:v94];

    v95 = [MEMORY[0x263F824E8] buttonWithType:1];
    v96 = [v95 titleLabel];
    [v96 setNumberOfLines:0];

    v97 = [v95 titleLabel];
    [v97 setTextAlignment:1];

    id v98 = objc_alloc(MEMORY[0x263F086A0]);
    v99 = [(LAPSPasscodeViewControllerConfiguration *)v172->_config optionsConfiguration];
    v100 = [v99 title];
    uint64_t v175 = *MEMORY[0x263F814F0];
    v101 = [MEMORY[0x263F81708] preferredFontForTextStyle:v114];
    v176 = v101;
    v102 = [NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
    v103 = (void *)[v98 initWithString:v100 attributes:v102];
    [v95 setAttributedTitle:v103 forState:0];

    [v95 addTarget:v172 action:sel__showPasscodeOptions_ forControlEvents:64];
    [v84 addSubview:v95];
    [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
    v123 = (void *)MEMORY[0x263F08938];
    v149 = [v95 heightAnchor];
    v171 = [v95 titleLabel];
    v144 = [v171 heightAnchor];
    v139 = [v149 constraintEqualToAnchor:v144];
    v174[0] = v139;
    v134 = [v95 topAnchor];
    v129 = [v84 topAnchor];
    v126 = [v134 constraintEqualToAnchor:v129];
    v174[1] = v126;
    v120 = [v95 leadingAnchor];
    locationa = [v84 leadingAnchor];
    v115 = [v120 constraintGreaterThanOrEqualToAnchor:locationa constant:10.0];
    v174[2] = v115;
    v113 = [v95 trailingAnchor];
    v112 = [v84 trailingAnchor];
    v111 = [v113 constraintLessThanOrEqualToAnchor:v112 constant:-10.0];
    v174[3] = v111;
    v104 = [v95 centerXAnchor];
    v105 = [v84 centerXAnchor];
    v106 = [v104 constraintEqualToAnchor:v105];
    v174[4] = v106;
    v107 = [v95 bottomAnchor];
    v108 = [v84 bottomAnchor];
    v109 = [v107 constraintEqualToAnchor:v108 constant:-8.0];
    v174[5] = v109;
    v110 = [MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:6];
    [v123 activateConstraints:v110];

    v73 = v167;
    id v64 = v153;

    objc_storeWeak((id *)&v172->_optionsButton, v95);
    id v63 = v157;
  }
}

- (void)_setupNavigationItem
{
  id v3 = [(LAPSPasscodeViewController *)self navigationItem];
  id v4 = [(LAPSPasscodeViewControllerConfiguration *)self->_config title];
  [v3 setTitle:v4];

  int v5 = [(LAPSPasscodeViewController *)self navigationItem];
  [v5 setHidesBackButton:1 animated:0];

  if (![(LAPSPasscodeViewController *)self _shouldShowNextButton]
    && ![(LAPSPasscodeViewController *)self _shouldShowPasscodeOptionsNavigationItem])
  {
    uint64_t v16 = [(LAPSPasscodeViewController *)self navigationItem];
    [v16 setLeftBarButtonItem:0];

    v14 = [(LAPSPasscodeViewController *)self navigationItem];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3;
    v18[3] = &unk_26506E930;
    v18[4] = self;
    double v17 = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3((uint64_t)v18);
    [v14 setRightBarButtonItem:v17];

    goto LABEL_8;
  }
  id v6 = [(LAPSPasscodeViewController *)self navigationItem];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke;
  v20[3] = &unk_26506E930;
  v20[4] = self;
  id v7 = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke((uint64_t)v20);
  [v6 setLeftBarButtonItem:v7];

  if ([(LAPSPasscodeViewController *)self _shouldShowNextButton])
  {
    id v8 = [(LAPSPasscodeViewController *)self navigationItem];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2;
    v19[3] = &unk_26506E930;
    v19[4] = self;
    objc_super v9 = __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2((uint64_t)v19);
    [v8 setRightBarButtonItem:v9];

    id v10 = [(LAPSPasscodeViewController *)self navigationItem];
    objc_super v11 = [v10 rightBarButtonItem];
    [v11 setEnabled:self->_isNextButtonEnabled];
  }
  if ([(LAPSPasscodeViewController *)self _shouldShowPasscodeOptionsNavigationItem])
  {
    id v12 = objc_alloc(MEMORY[0x263F824A8]);
    objc_super v13 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis"];
    v14 = (void *)[v12 initWithImage:v13 style:0 target:self action:sel__showPasscodeOptions_];

    v15 = [(LAPSPasscodeViewController *)self navigationItem];
    [v15 setRightBarButtonItem:v14];

    objc_storeWeak((id *)&self->_optionsItem, v14);
LABEL_8:
  }
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__cancel_];

  return v1;
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F824A8]);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 976) nextButton];
  id v4 = (void *)[v2 initWithTitle:v3 style:0 target:*(void *)(a1 + 32) action:sel__next_];

  return v4;
}

id __50__LAPSPasscodeViewController__setupNavigationItem__block_invoke_3(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__cancel_];

  return v1;
}

- (void)_setNextButtonEnabled:(BOOL)a3
{
  self->_isNextButtonEnabled = a3;
  [(LAPSPasscodeViewController *)self _setupNavigationItem];
}

- (void)_setPasscodeType:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeType, a3);

  [(LAPSPasscodeViewController *)self _setupNavigationItem];
}

- (void)_submitPasscode:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(LAPSPasscodeViewController *)self _styleWithPasscodeType:self->_passcodeType];
  if (v4 != [(LACUIPasscodeField *)self->_passcodeFieldVC style]) {
    -[LAPSPasscodeViewController _submitPasscode:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [[LAPSPasscode alloc] initWithLocalizedPasscode:v7 type:self->_passcodeType];
  [WeakRetained passcodeViewController:self verifyPasscode:v6];
}

- (void)_cancel:(id)a3
{
  id v4 = +[LAPSErrorBuilder userCanceledError];
  [(LAPSPasscodeViewController *)self _finishWithError:v4];
}

- (void)_next:(id)a3
{
}

- (void)_showPasscodeOptions:(id)a3
{
  id v4 = objc_alloc_init(LAPSPasscodeOptionsPresentationController);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke;
  v7[3] = &unk_26506E958;
  v7[4] = self;
  int v5 = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke((uint64_t)v7);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_3;
  v6[3] = &unk_26506E980;
  v6[4] = self;
  [(LAPSPasscodeOptionsPresentationController *)v4 presentPasscodeOptions:v5 completion:v6];
}

LAPSPasscodeOptionsPresentationRequest *__51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke(uint64_t a1)
{
  id v2 = [[LAPSPasscodeOptionsPresentationRequest alloc] initWithSourceViewController:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
  [(LAPSPasscodeOptionsPresentationRequest *)v2 setSourceView:WeakRetained];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1064));
  [(LAPSPasscodeOptionsPresentationRequest *)v2 setSourceItem:v4];

  -[LAPSPasscodeOptionsPresentationRequest setPresentationStyle:](v2, "setPresentationStyle:", [*(id *)(a1 + 32) _passcodeOptionsPresentationStyle]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2;
  v7[3] = &unk_26506E830;
  v7[4] = *(void *)(a1 + 32);
  int v5 = __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2((uint64_t)v7);
  [(LAPSPasscodeOptionsPresentationRequest *)v2 setConfig:v5];

  [(LAPSPasscodeOptionsPresentationRequest *)v2 setAnimated:1];
  [(LAPSPasscodeOptionsPresentationRequest *)v2 setDelegate:*(void *)(a1 + 32)];

  return v2;
}

LAPSPasscodeOptionsViewControllerConfiguration *__51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(LAPSPasscodeOptionsViewControllerConfiguration);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  id v4 = [v3 title];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setTitle:v4];

  int v5 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  id v6 = [v5 cancelTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setCancelTitle:v6];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  id v8 = [v7 passcodeRecoveryEnabledTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryEnabledTitle:v8];

  objc_super v9 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  id v10 = [v9 passcodeRecoveryDisabledTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryDisabledTitle:v10];

  objc_super v11 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  id v12 = [v11 allowedPasscodeTypes];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setAllowedPasscodeTypes:v12];

  objc_super v13 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoverySupported:](v2, "setIsPasscodeRecoverySupported:", [v13 isPasscodeRecoverySupported]);

  v14 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryRestricted:](v2, "setIsPasscodeRecoveryRestricted:", [v14 isPasscodeRecoveryRestricted]);

  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setIsPasscodeRecoveryEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 992)];
  v15 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  -[LAPSPasscodeOptionsViewControllerConfiguration setIsPasscodeRecoveryOptionVisible:](v2, "setIsPasscodeRecoveryOptionVisible:", [v15 isPasscodeRecoveryOptionVisible]);

  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setSelectedPasscodeType:*(void *)(*(void *)(a1 + 32) + 984)];
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 976) optionsConfiguration];
  double v17 = [v16 passcodeRecoveryTitle];
  [(LAPSPasscodeOptionsViewControllerConfiguration *)v2 setPasscodeRecoveryTitle:v17];

  return v2;
}

void __51__LAPSPasscodeViewController__showPasscodeOptions___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) setAcceptInputs:0];
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 1000);
    [v4 resignFirstResponder];
  }
}

- (void)_finishWithError:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 passcodeViewController:self didCancelWithError:v7];
  }
}

- (int64_t)_styleWithPasscodeType:(id)a3
{
  int64_t result = [a3 identifier];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (BOOL)_shouldShowPasscodeOptionsNavigationItem
{
  return 0;
}

- (BOOL)_shouldShowPasscodeOptionsButton
{
  id v2 = [(LAPSPasscodeViewControllerConfiguration *)self->_config optionsConfiguration];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_passcodeTypeAllowsVariableLength
{
  return [(LAPSPasscodeType *)self->_passcodeType length] == -1;
}

- (int64_t)_passcodeOptionsPresentationStyle
{
  return 0;
}

- (double)_bodyStackHorizontalPadding
{
  return 27.0;
}

- (BOOL)_isAccessibilityTextEnabled
{
  id v2 = [(LAPSPasscodeViewController *)self view];
  BOOL v3 = [v2 traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return IsAccessibilityCategory;
}

- (double)_bottomPadding
{
  return 20.0;
}

- (NSDirectionalEdgeInsets)_mainStackInsets
{
  [(LAPSPasscodeViewController *)self _accessibilitySpacing];
  double v3 = v2;
  double v4 = v2;
  double v5 = v2;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)_accessibilitySpacing
{
  return 20.0;
}

- (void)_layoutIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained layoutIfNeeded];

  id v4 = [(LAPSPasscodeViewController *)self view];
  [v4 layoutIfNeeded];
}

- (void)passcodeField:(id)a3 didSubmitPasscode:(id)a4
{
  id v7 = (LACUIPasscodeField *)a3;
  id v6 = a4;
  if (self->_passcodeFieldVC != v7) {
    -[LAPSPasscodeViewController passcodeField:didSubmitPasscode:]();
  }
  if (-[LAPSPasscodeType allowsLength:](self->_passcodeType, "allowsLength:", [v6 length])) {
    [(LAPSPasscodeViewController *)self _submitPasscode:v6];
  }
}

- (void)passcodeField:(id)a3 didChangePasscodeLength:(unint64_t)a4
{
  id v6 = (LACUIPasscodeField *)a3;
  if (self->_passcodeFieldVC != v6) {
    -[LAPSPasscodeViewController passcodeField:didChangePasscodeLength:]();
  }
  id v7 = v6;
  [(LAPSPasscodeViewController *)self _setNextButtonEnabled:[(LAPSPasscodeType *)self->_passcodeType allowsLength:a4]];
}

- (void)passcodeOptionsViewController:(id)a3 didSelectPasscodeType:(id)a4
{
  id v8 = a4;
  [(LAPSPasscodeViewController *)self _setPasscodeType:v8];
  [(LACUIPasscodeField *)self->_passcodeFieldVC setStyle:[(LAPSPasscodeViewController *)self _styleWithPasscodeType:v8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 passcodeViewController:self didSelectPasscodeType:v8];
  }
}

- (void)passcodeOptionsViewController:(id)a3 didSetPasscodeRecoveryEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isPasscodeRecoveryEnabled = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 passcodeViewController:self didSetPasscodeRecoveryEnabled:v4];
  }
}

- (void)passcodeOptionsViewControllerDidDisappear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  [WeakRetained _scrollToTopIfPossible:1];

  [(LACUIPasscodeField *)self->_passcodeFieldVC setAcceptInputs:1];
  passcodeFieldVC = self->_passcodeFieldVC;

  [(LACUIPasscodeField *)passcodeFieldVC becomeFirstResponder];
}

- (LAPSPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_bottomAreaLayoutGuide);
  objc_destroyWeak((id *)&self->_optionsItem);
  objc_destroyWeak((id *)&self->_optionsButton);
  objc_destroyWeak((id *)&self->_errorCapsuleContainer);
  objc_destroyWeak((id *)&self->_errorCapsule);
  objc_destroyWeak((id *)&self->_footer);
  objc_destroyWeak((id *)&self->_header);
  objc_destroyWeak((id *)&self->_stack);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_passcodeFieldVC, 0);
  objc_storeStrong((id *)&self->_passcodeType, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)_submitPasscode:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController _submitPasscode:]", "LAPSPasscodeViewController.m", 434, "[self _styleWithPasscodeType:_passcodeType] == [_passcodeFieldVC style]");
}

- (void)passcodeField:didSubmitPasscode:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController passcodeField:didSubmitPasscode:]", "LAPSPasscodeViewController.m", 580, "passcodeField == _passcodeFieldVC");
}

- (void)passcodeField:didChangePasscodeLength:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeViewController passcodeField:didChangePasscodeLength:]", "LAPSPasscodeViewController.m", 589, "passcodeField == _passcodeFieldVC");
}

@end