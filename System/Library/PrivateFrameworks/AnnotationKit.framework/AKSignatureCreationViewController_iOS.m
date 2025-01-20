@interface AKSignatureCreationViewController_iOS
- (AKController)controller;
- (AKInkSignatureView)signatureView;
- (AKSignatureBaselineView)baselineView;
- (AKSignatureCreationControllerDelegate)delegate;
- (AKSignatureCreationViewController_iOS)initWithController:(id)a3;
- (AKSmoothPathView)pathView;
- (BOOL)_canShowWhileLocked;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)prefersStatusBarHidden;
- (NSString)customDescription;
- (NSUndoManager)_undoManager;
- (UIButton)clearButton;
- (UIButton)downArrowButton;
- (UILabel)label;
- (UILabel)titleLabel;
- (UINavigationBar)navBar;
- (UIResponder)responderToRestore;
- (id)undoManager;
- (int64_t)descriptionTag;
- (int64_t)positionForBar:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_cancel:(id)a3;
- (void)_clear:(id)a3;
- (void)_done:(id)a3;
- (void)_notifyDidDismiss;
- (void)_removeSignatureDescription;
- (void)_showSignatureDescriptionSelectionAlert;
- (void)_updateSignatureDescriptionWithStringValue:(id)a3;
- (void)_validateButtons;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)setBaselineView:(id)a3;
- (void)setClearButton:(id)a3;
- (void)setController:(id)a3;
- (void)setCustomDescription:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionTag:(int64_t)a3;
- (void)setDownArrowButton:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setPathView:(id)a3;
- (void)setResponderToRestore:(id)a3;
- (void)setSignatureView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)set_undoManager:(id)a3;
- (void)showEditCustomDescriptionAlert;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AKSignatureCreationViewController_iOS

- (AKSignatureCreationViewController_iOS)initWithController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKSignatureCreationViewController_iOS;
  v5 = [(AKSignatureCreationViewController_iOS *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(AKSignatureCreationViewController_iOS *)v5 setController:v4];
    v7 = +[AKController akBundle];
    v8 = [v7 localizedStringForKey:@"New Signature" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
    [(AKSignatureCreationViewController_iOS *)v6 setTitle:v8];

    -[AKSignatureCreationViewController_iOS setPreferredContentSize:](v6, "setPreferredContentSize:", 540.0, 388.0);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AKSignatureCreationViewController_iOS;
  [(AKSignatureCreationViewController_iOS *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKSignatureCreationViewController_iOS *)self setView:v4];
}

- (void)viewDidLoad
{
  v147[2] = *MEMORY[0x263EF8340];
  v141.receiver = self;
  v141.super_class = (Class)AKSignatureCreationViewController_iOS;
  [(AKSignatureCreationViewController_iOS *)&v141 viewDidLoad];
  id v3 = [(AKSignatureCreationViewController_iOS *)self traitCollection];
  if ([v3 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  }
  v5 = [(AKSignatureCreationViewController_iOS *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = objc_alloc(MEMORY[0x263F1C7E0]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_super v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  [(AKSignatureCreationViewController_iOS *)self setNavBar:v11];

  v12 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v13 setDelegate:self];

  v14 = [(AKSignatureCreationViewController_iOS *)self view];
  v15 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v14 addSubview:v15];

  v16 = _NSDictionaryOfVariableBindings(&cfstr_Navbar.isa, self->_navBar, 0);
  v17 = [(AKSignatureCreationViewController_iOS *)self view];
  v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_navBar]|" options:0 metrics:0 views:v16];
  [v17 addConstraints:v18];

  v19 = [(UINavigationBar *)self->_navBar topAnchor];
  v20 = [(AKSignatureCreationViewController_iOS *)self view];
  v21 = [v20 safeAreaLayoutGuide];
  v22 = [v21 topAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];

  v139 = v23;
  [v23 setActive:1];
  id v24 = objc_alloc_init(MEMORY[0x263F1C800]);
  v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  [(AKSignatureCreationViewController_iOS *)self setTitleLabel:v25];

  v26 = [(AKSignatureCreationViewController_iOS *)self title];
  v27 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  [v27 setText:v26];

  v28 = [(AKSignatureCreationViewController_iOS *)self navBar];
  v29 = [v28 standardAppearance];
  v30 = [v29 titleTextAttributes];
  v31 = [v30 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
  v32 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  [v32 setFont:v31];

  v33 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  [v33 setTextAlignment:1];

  v34 = objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", v7, v8, v9, v10);
  [(AKSignatureCreationViewController_iOS *)self setDownArrowButton:v34];

  v35 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  [v35 addTarget:self action:sel__showSignatureDescriptionSelectionAlert forControlEvents:1];

  v36 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  v37 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.down"];
  [v36 setImage:v37 forState:0];

  v38 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  objc_msgSend(v38, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);

  v39 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", v7, v8, v9, v10);
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v39 setAlignment:3];
  [v39 setAxis:0];
  v40 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  [v39 addArrangedSubview:v40];

  v41 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  [v39 addArrangedSubview:v41];

  v42 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  v147[0] = v42;
  v43 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  v147[1] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:2];
  [v39 setAccessibilityElements:v44];

  [v24 setTitleView:v39];
  v138 = v39;
  v45 = [v39 trailingAnchor];
  v46 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  v47 = [v46 trailingAnchor];
  v48 = [v45 constraintEqualToAnchor:v47 constant:0.0];
  [v48 setActive:1];

  v49 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  LODWORD(v50) = 1144750080;
  [v49 setContentCompressionResistancePriority:0 forAxis:v50];

  v51 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  LODWORD(v52) = 1132068864;
  [v51 setContentCompressionResistancePriority:0 forAxis:v52];

  v53 = [(AKSignatureCreationViewController_iOS *)self navBar];
  id v146 = v24;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v146 count:1];
  [v53 setItems:v54];

  uint64_t v55 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  uint64_t v56 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  v140 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v140 setWidth:16.0];
  v57 = [(AKSignatureCreationViewController_iOS *)self presentationController];
  uint64_t v58 = [v57 presentationStyle];

  v136 = (void *)v55;
  v137 = (void *)v56;
  if (v58 == 7)
  {
    uint64_t v145 = v56;
    v59 = &v145;
  }
  else
  {
    v144[0] = v55;
    v144[1] = v140;
    v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:2];
    [v24 setLeftBarButtonItems:v60];

    uint64_t v143 = v56;
    v59 = &v143;
  }
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  [v24 setRightBarButtonItems:v61];

  v62 = [(AKSignatureCreationViewController_iOS *)self view];
  v63 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v62 addSubview:v63];

  v64 = [AKSignatureBaselineView alloc];
  v65 = [(AKSignatureCreationViewController_iOS *)self view];
  [v65 bounds];
  v66 = -[AKSignatureBaselineView initWithFrame:](v64, "initWithFrame:");
  [(AKSignatureCreationViewController_iOS *)self setBaselineView:v66];

  v67 = [(AKSignatureCreationViewController_iOS *)self baselineView];
  [v67 setTranslatesAutoresizingMaskIntoConstraints:0];

  v68 = [(AKSignatureCreationViewController_iOS *)self view];
  v69 = [(AKSignatureCreationViewController_iOS *)self baselineView];
  v70 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v68 insertSubview:v69 aboveSubview:v70];

  v71 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  [(AKSignatureCreationViewController_iOS *)self setLabel:v71];

  v72 = [(AKSignatureCreationViewController_iOS *)self label];
  [v72 setTranslatesAutoresizingMaskIntoConstraints:0];

  v73 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
  v74 = [(AKSignatureCreationViewController_iOS *)self label];
  [v74 setFont:v73];

  v75 = [(AKSignatureCreationViewController_iOS *)self label];
  [v75 setTextAlignment:1];

  v76 = [MEMORY[0x263F1C550] colorWithWhite:0.6 alpha:0.8];
  v77 = [(AKSignatureCreationViewController_iOS *)self label];
  [v77 setTextColor:v76];

  v78 = [MEMORY[0x263F1C550] clearColor];
  v79 = [(AKSignatureCreationViewController_iOS *)self label];
  [v79 setBackgroundColor:v78];

  v80 = +[AKController akBundle];
  v135 = v24;
  v81 = [v80 localizedStringForKey:@"Sign your name using your finger." value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  v82 = [(AKSignatureCreationViewController_iOS *)self label];
  [v82 setText:v81];

  v83 = [(AKSignatureCreationViewController_iOS *)self view];
  v84 = [(AKSignatureCreationViewController_iOS *)self label];
  v85 = [(AKSignatureCreationViewController_iOS *)self baselineView];
  [v83 insertSubview:v84 aboveSubview:v85];

  v86 = objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", v7, v8, v9, v10);
  [(AKSignatureCreationViewController_iOS *)self setClearButton:v86];

  v87 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  [v87 setTranslatesAutoresizingMaskIntoConstraints:0];

  v88 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v89 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.counterclockwise"];
  [v88 setImage:v89 forState:0];

  v90 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v91 = +[AKController akBundle];
  v92 = [v91 localizedStringForKey:@"Clear" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  [v90 setTitle:v92 forState:0];

  v93 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v94 = [MEMORY[0x263F1C550] tintColor];
  [v93 setTitleColor:v94 forState:0];

  v95 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  uint64_t v96 = [v95 effectiveUserInterfaceLayoutDirection];

  v97 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v98 = v97;
  if (v96 == 1) {
    double v99 = -8.0;
  }
  else {
    double v99 = 8.0;
  }
  if (v96 == 1) {
    double v100 = 8.0;
  }
  else {
    double v100 = -8.0;
  }
  objc_msgSend(v97, "setTitleEdgeInsets:", 0.0, v99, 0.0, v100);

  v101 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  objc_msgSend(v101, "setContentEdgeInsets:", 11.0, 2.0, 11.0, 10.0);

  v102 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  [v102 addTarget:self action:sel__clear_ forControlEvents:64];

  v103 = [(AKSignatureCreationViewController_iOS *)self view];
  v104 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v105 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v103 insertSubview:v104 aboveSubview:v105];

  v106 = [AKInkSignatureView alloc];
  v107 = [(AKSignatureCreationViewController_iOS *)self view];
  [v107 bounds];
  v108 = -[AKInkSignatureView initWithFrame:](v106, "initWithFrame:");
  [(AKSignatureCreationViewController_iOS *)self setSignatureView:v108];

  v109 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  [v109 setTranslatesAutoresizingMaskIntoConstraints:0];

  v110 = [MEMORY[0x263F1C550] whiteColor];
  v111 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  [v111 setBackgroundColor:v110];

  v112 = [(AKSignatureCreationViewController_iOS *)self view];
  v113 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  v114 = [(AKSignatureCreationViewController_iOS *)self navBar];
  [v112 insertSubview:v113 belowSubview:v114];

  uint64_t v115 = _NSDictionaryOfVariableBindings(&cfstr_BaselineviewNa.isa, self->_baselineView, self->_navBar, self->_label, self->_signatureView, self->_clearButton, 0);

  v116 = [MEMORY[0x263EFF980] array];
  v117 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_baselineView(20)]-[_label]-8-[_clearButton]" options:0 metrics:0 views:v115];
  [v116 addObjectsFromArray:v117];

  v118 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_label]|" options:0 metrics:0 views:v115];
  [v116 addObjectsFromArray:v118];

  v119 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_signatureView]|" options:0 metrics:0 views:v115];
  [v116 addObjectsFromArray:v119];

  v134 = (void *)v115;
  v120 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_baselineView]|" options:0 metrics:0 views:v115];
  [v116 addObjectsFromArray:v120];

  v121 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_navBar][_signatureView]|" options:0 metrics:0 views:v115];
  [v116 addObjectsFromArray:v121];

  v133 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v131 = [v133 bottomAnchor];
  v132 = [(AKSignatureCreationViewController_iOS *)self view];
  v122 = [v132 safeAreaLayoutGuide];
  v123 = [v122 bottomAnchor];
  v124 = [v131 constraintEqualToAnchor:v123 constant:-8.0];
  v142[0] = v124;
  v125 = [(AKSignatureCreationViewController_iOS *)self clearButton];
  v126 = [v125 centerXAnchor];
  v127 = [(AKSignatureCreationViewController_iOS *)self view];
  v128 = [v127 centerXAnchor];
  v129 = [v126 constraintEqualToAnchor:v128];
  v142[1] = v129;
  v130 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:2];
  [v116 addObjectsFromArray:v130];

  [MEMORY[0x263F08938] activateConstraints:v116];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id v3 = [(AKSignatureCreationViewController_iOS *)self view];
  id v4 = [v3 window];
  v5 = [v4 firstResponder];

  v9.receiver = self;
  v9.super_class = (Class)AKSignatureCreationViewController_iOS;
  BOOL v6 = [(AKSignatureCreationViewController_iOS *)&v9 becomeFirstResponder];
  if (v6 && v5 != self) {
    [(AKSignatureCreationViewController_iOS *)self setResponderToRestore:v5];
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKSignatureCreationViewController_iOS;
  [(AKSignatureCreationViewController_iOS *)&v4 viewDidAppear:a3];
  if (([(AKSignatureCreationViewController_iOS *)self isFirstResponder] & 1) == 0) {
    [(AKSignatureCreationViewController_iOS *)self becomeFirstResponder];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AKSignatureCreationViewController_iOS *)self resignFirstResponder];
  v5 = [(AKSignatureCreationViewController_iOS *)self responderToRestore];
  BOOL v6 = v5;
  if (v5) {
    [v5 becomeFirstResponder];
  }
  [(AKSignatureCreationViewController_iOS *)self setResponderToRestore:0];
  v7.receiver = self;
  v7.super_class = (Class)AKSignatureCreationViewController_iOS;
  [(AKSignatureCreationViewController_iOS *)&v7 viewDidDisappear:v3];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)AKSignatureCreationViewController_iOS;
  [(AKSignatureCreationViewController_iOS *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKSignatureCreationViewController_iOS;
  -[AKSignatureCreationViewController_iOS viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(AKSignatureCreationViewController_iOS *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (width != v10 || height != v12)
  {
    v14[4] = self;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_2376501B8;
    v15[3] = &unk_264CDB388;
    v15[4] = self;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_237650200;
    v14[3] = &unk_264CDB388;
    [v7 animateAlongsideTransition:v15 completion:v14];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AKSignatureCreationViewController_iOS;
  id v4 = a3;
  [(AKSignatureCreationViewController_iOS *)&v11 traitCollectionDidChange:v4];
  v5 = [(AKSignatureCreationViewController_iOS *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    double v8 = [(AKSignatureCreationViewController_iOS *)self traitCollection];
    if ([v8 userInterfaceStyle] == 2) {
      [MEMORY[0x263F1C550] blackColor];
    }
    else {
    double v9 = [MEMORY[0x263F1C550] whiteColor];
    }
    double v10 = [(AKSignatureCreationViewController_iOS *)self view];
    [v10 setBackgroundColor:v9];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKSignatureCreationViewController_iOS;
  id v7 = a4;
  [(AKSignatureCreationViewController_iOS *)&v16 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
  double v8 = [(AKSignatureCreationViewController_iOS *)self traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];
  LOBYTE(v9) = v9 != [v6 horizontalSizeClass];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2376504C0;
  v13[3] = &unk_264CDB3B0;
  char v15 = v9;
  v13[4] = self;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_237650540;
  v11[3] = &unk_264CDB3D8;
  char v12 = v9;
  v11[4] = self;
  id v10 = v6;
  [v7 animateAlongsideTransition:v13 completion:v11];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_validateButtons
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(AKSignatureCreationViewController_iOS *)self navBar];
  id v4 = [v3 topItem];
  v5 = [v4 rightBarButtonItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((char *)[v10 action] == sel__clear_)
        {
          objc_super v11 = [(AKSignatureCreationViewController_iOS *)self signatureView];
          objc_msgSend(v10, "setEnabled:", objc_msgSend(v11, "hasStrokes"));
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_cancel:(id)a3
{
  id v4 = [(AKSignatureCreationViewController_iOS *)self controller];
  v5 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 controllerWillDismissSignatureCaptureView:v4];
  }
  uint64_t v6 = [(AKSignatureCreationViewController_iOS *)self presentingViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23765081C;
  v8[3] = &unk_264CDAE40;
  v8[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v8];

  uint64_t v7 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  [v7 clear];
}

- (void)_clear:(id)a3
{
  id v3 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  [v3 clear];
}

- (void)_done:(id)a3
{
  id v4 = [(AKSignatureCreationViewController_iOS *)self controller];
  v5 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  id v20 = 0;
  uint64_t v6 = (const CGPath *)[v5 copyPotracedPathAndReturnDrawing:&v20];
  id v7 = v20;

  uint64_t v8 = 0;
  if (!CGPathIsEmpty(v6))
  {
    uint64_t v9 = [AKSignature alloc];
    id v10 = [MEMORY[0x263EFF910] date];
    int64_t v11 = [(AKSignatureCreationViewController_iOS *)self descriptionTag];
    long long v12 = [(AKSignatureCreationViewController_iOS *)self customDescription];
    uint64_t v8 = [(AKSignature *)v9 initWithDrawing:v7 path:v6 baselineOffset:v10 creationDate:v11 descriptionTag:v12 customDescription:0.0];
  }
  CGPathRelease(v6);
  long long v13 = [(AKSignatureCreationViewController_iOS *)self signatureView];
  [v13 clear];

  if (v8)
  {
    long long v14 = [v4 signatureModelController];
    [v14 insertObject:v8 inSignaturesAtIndex:0];

    long long v15 = [v4 signatureModelController];
    [v15 setSelectedSignature:v8];

    objc_super v16 = [(AKSignatureCreationViewController_iOS *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v16 signatureCreationControllerDidCreateSignature:self];
    }
  }
  uint64_t v17 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v17 controllerWillDismissSignatureCaptureView:v4];
  }
  v18 = [(AKSignatureCreationViewController_iOS *)self presentingViewController];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_237650AA0;
  v19[3] = &unk_264CDAE40;
  v19[4] = self;
  [v18 dismissViewControllerAnimated:1 completion:v19];

  NSLog(&cfstr_AddedSignature.isa, v8);
}

- (void)_notifyDidDismiss
{
  id v3 = [(AKSignatureCreationViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 signatureCreationControllerDidDismiss:self];
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v5 = [(AKSignatureCreationViewController_iOS *)self firstResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v5 textFields];
    id v4 = [v3 firstObject];
    [v4 becomeFirstResponder];
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_showSignatureDescriptionSelectionAlert
{
  id v3 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  id v5 = [v3 popoverPresentationController];
  [v5 setSourceView:v4];

  uint64_t v6 = [(AKSignatureCreationViewController_iOS *)self downArrowButton];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [v3 popoverPresentationController];
  objc_msgSend(v15, "setSourceRect:", v8, v10, v12, v14);

  objc_super v16 = [v3 popoverPresentationController];
  uint64_t v17 = 1;
  [v16 setPermittedArrowDirections:1];

  objc_initWeak(location, self);
  objc_initWeak(&from, v3);
  do
  {
    v18 = +[AKSignatureDescription stringValueForSignatureDescriptionTag:v17];
    v19 = (void *)MEMORY[0x263F1C3F0];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = sub_23765107C;
    v40[3] = &unk_264CDB400;
    objc_copyWeak(&v42, location);
    id v20 = v18;
    id v41 = v20;
    v21 = [v19 actionWithTitle:v20 style:0 handler:v40];
    objc_msgSend(v21, "_setChecked:", v17 == -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag"));
    [v3 addAction:v21];

    objc_destroyWeak(&v42);
    ++v17;
  }
  while (v17 != 6);
  v22 = (void *)MEMORY[0x263F1C3F0];
  v23 = +[AKController akBundle];
  id v24 = [v23 localizedStringForKey:@"Custom Label" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_2376510CC;
  v37[3] = &unk_264CDB428;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, location);
  v25 = [v22 actionWithTitle:v24 style:0 handler:v37];

  objc_msgSend(v25, "_setChecked:", -[AKSignatureCreationViewController_iOS descriptionTag](self, "descriptionTag") == -1);
  [v3 addAction:v25];
  v26 = (void *)MEMORY[0x263F1C3F0];
  v27 = +[AKController akBundle];
  v28 = [v27 localizedStringForKey:@"No Label" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2376511D8;
  v34[3] = &unk_264CDB428;
  objc_copyWeak(&v35, &from);
  objc_copyWeak(&v36, location);
  v29 = [v26 actionWithTitle:v28 style:2 handler:v34];
  [v3 addAction:v29];

  v30 = (void *)MEMORY[0x263F1C3F0];
  v31 = +[AKController akBundle];
  v32 = [v31 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  v33 = [v30 actionWithTitle:v32 style:1 handler:0];
  [v3 addAction:v33];

  [(AKSignatureCreationViewController_iOS *)self presentViewController:v3 animated:1 completion:0];
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (void)showEditCustomDescriptionAlert
{
  id v3 = (void *)MEMORY[0x263F1C3F8];
  id v4 = +[AKController akBundle];
  id v5 = [v4 localizedStringForKey:@"Custom Label" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  uint64_t v6 = [v3 alertControllerWithTitle:v5 message:0 preferredStyle:1];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_237651634;
  v23[3] = &unk_264CDB450;
  objc_copyWeak(&v24, &location);
  [v6 addTextFieldWithConfigurationHandler:v23];
  double v7 = (void *)MEMORY[0x263F1C3F0];
  double v8 = +[AKController akBundle];
  double v9 = [v8 localizedStringForKey:@"Cancel" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_237651710;
  v21[3] = &unk_264CDB478;
  objc_copyWeak(&v22, &from);
  double v10 = [v7 actionWithTitle:v9 style:1 handler:v21];
  [v6 addAction:v10];

  double v11 = (void *)MEMORY[0x263F1C3F0];
  double v12 = +[AKController akBundle];
  double v13 = [v12 localizedStringForKey:@"Done" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_237651758;
  v18 = &unk_264CDB428;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  double v14 = [v11 actionWithTitle:v13 style:0 handler:&v15];
  objc_msgSend(v6, "addAction:", v14, v15, v16, v17, v18);

  [(AKSignatureCreationViewController_iOS *)self presentViewController:v6 animated:1 completion:0];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_removeSignatureDescription
{
  [(AKSignatureCreationViewController_iOS *)self setDescriptionTag:0];
  [(AKSignatureCreationViewController_iOS *)self setCustomDescription:0];
  id v5 = +[AKController akBundle];
  id v3 = [v5 localizedStringForKey:@"New Signature" value:&stru_26EA57918 table:@"AKSignatureCreationViewController_iOS"];
  id v4 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
  [v4 setText:v3];
}

- (void)_updateSignatureDescriptionWithStringValue:(id)a3
{
  id v10 = a3;
  id v4 = +[AKSignatureDescription stringValueForSignatureDescriptionTag:[(AKSignatureCreationViewController_iOS *)self descriptionTag]];
  id v5 = [(AKSignatureCreationViewController_iOS *)self undoManager];
  [v5 registerUndoWithTarget:self selector:sel__updateSignatureDescriptionWithStringValue_ object:v4];

  int64_t v6 = +[AKSignatureDescription signatureDescriptionTagFromStringValue:v10];
  if (v6)
  {
    int64_t v7 = v6;
    [(AKSignatureCreationViewController_iOS *)self setDescriptionTag:v6];
    if (v7 == -1) {
      id v8 = v10;
    }
    else {
      id v8 = 0;
    }
    [(AKSignatureCreationViewController_iOS *)self setCustomDescription:v8];
    double v9 = [(AKSignatureCreationViewController_iOS *)self titleLabel];
    [v9 setText:v10];
  }
  else
  {
    [(AKSignatureCreationViewController_iOS *)self _removeSignatureDescription];
  }
}

- (id)undoManager
{
  id v3 = [(AKSignatureCreationViewController_iOS *)self _undoManager];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08C50]);
    [(AKSignatureCreationViewController_iOS *)self set_undoManager:v4];
  }

  return [(AKSignatureCreationViewController_iOS *)self _undoManager];
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (a3 == 1)
  {
    id v5 = [(AKSignatureCreationViewController_iOS *)self undoManager];
    [v5 undo];
  }
}

- (AKSignatureCreationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKSignatureCreationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)downArrowButton
{
  return self->_downArrowButton;
}

- (void)setDownArrowButton:(id)a3
{
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
}

- (AKSmoothPathView)pathView
{
  return self->_pathView;
}

- (void)setPathView:(id)a3
{
}

- (AKInkSignatureView)signatureView
{
  return self->_signatureView;
}

- (void)setSignatureView:(id)a3
{
}

- (AKSignatureBaselineView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UIResponder)responderToRestore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responderToRestore);

  return (UIResponder *)WeakRetained;
}

- (void)setResponderToRestore:(id)a3
{
}

- (int64_t)descriptionTag
{
  return self->_descriptionTag;
}

- (void)setDescriptionTag:(int64_t)a3
{
  self->_descriptionTag = a3;
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
}

- (NSUndoManager)_undoManager
{
  return self->__undoManager;
}

- (void)set_undoManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__undoManager, 0);
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_destroyWeak((id *)&self->_responderToRestore);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_baselineView, 0);
  objc_storeStrong((id *)&self->_signatureView, 0);
  objc_storeStrong((id *)&self->_pathView, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_downArrowButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_navBar, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end