@interface ASCredentialRequestPaneViewController
- (ASCredentialRequestPaneContext)footerPaneContext;
- (ASCredentialRequestPaneContext)headerPaneContext;
- (ASCredentialRequestPaneViewControllerDelegate)delegate;
- (BOOL)_isContentUnderTray;
- (UIStackView)paneFooterStackView;
- (UIStackView)paneHeaderStackView;
- (UITableView)tableView;
- (double)_blurryTrayMinimumHeight;
- (double)_intrinsicContentHeight;
- (double)_maximumContentHeight;
- (double)_navigationBarHeaderHeight;
- (id)_indexPathForLastRow;
- (id)_newContainerView;
- (id)_newStackView;
- (id)initRequiringTableView:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_safeIndexWithCount:(int64_t)a3;
- (int64_t)numberOfTableRows;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adjustForPositionOfScrollView:(id)a3;
- (void)_setCompressedHeightForView:(id)a3;
- (void)_setUpContexts;
- (void)_updateBlurForTray;
- (void)setDelegate:(id)a3;
- (void)setTableView:(id)a3;
- (void)sizeToFitPaneContent;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ASCredentialRequestPaneViewController

- (id)initRequiringTableView:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestPaneViewController;
  v4 = [(ASCredentialRequestPaneViewController *)&v10 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_isTableViewRequired = a3;
    [(ASCredentialRequestPaneViewController *)v4 setModalInPresentation:1];
    v6 = objc_alloc_init(_ASNavigationTitleView);
    v7 = [(ASCredentialRequestPaneViewController *)v5 navigationItem];
    [v7 setTitleView:v6];

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v149[10] = *MEMORY[0x263EF8340];
  v143.receiver = self;
  v143.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v143 viewDidLoad];
  v3 = [(ASCredentialRequestPaneViewController *)self view];
  v4 = [(ASCredentialRequestPaneViewController *)self _newStackView];
  paneHeaderStackView = self->_paneHeaderStackView;
  self->_paneHeaderStackView = v4;

  v142 = v3;
  if (self->_isTableViewRequired)
  {
    v6 = [(ASCredentialRequestPaneViewController *)self view];
    [v6 bounds];
    double Width = CGRectGetWidth(v150);

    v8 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", +[ASViewServiceInterfaceUtilities tableViewStyle](ASViewServiceInterfaceUtilities, "tableViewStyle"), 0.0, 0.0, Width, 0.0);
    tableView = self->_tableView;
    self->_tableView = v8;

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v10 = [MEMORY[0x263F825C8] clearColor];
    [(UITableView *)self->_tableView setBackgroundColor:v10];

    [(UITableView *)self->_tableView setAlwaysBounceVertical:0];
    [(UITableView *)self->_tableView setShowsVerticalScrollIndicator:0];
    +[ASViewServiceInterfaceUtilities tableViewRowHeight];
    -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
    [(UITableView *)self->_tableView setSeparatorInsetReference:1];
    [(UITableView *)self->_tableView setDelegate:self];
    id v11 = [(ASCredentialRequestPaneViewController *)self _newContainerView];
    [(UITableView *)self->_tableView setTableHeaderView:v11];

    v12 = [(UITableView *)self->_tableView tableHeaderView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = [(UITableView *)self->_tableView tableHeaderView];
    [v13 addSubview:self->_paneHeaderStackView];

    [v3 addSubview:self->_tableView];
    v14 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:0];
    blurryTray = self->_blurryTray;
    self->_blurryTray = v14;

    [(UIVisualEffectView *)self->_blurryTray setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(ASCredentialRequestPaneViewController *)self _newStackView];
    paneFooterStackView = self->_paneFooterStackView;
    self->_paneFooterStackView = v16;

    v18 = [(UIVisualEffectView *)self->_blurryTray contentView];
    [v18 addSubview:self->_paneFooterStackView];

    [(UIStackView *)self->_paneFooterStackView setSpacing:1.17549435e-38];
    [v3 addSubview:self->_blurryTray];
    [(ASCredentialRequestPaneViewController *)self _setUpContexts];
    v105 = (void *)MEMORY[0x263F08938];
    v131 = [(UIStackView *)self->_paneHeaderStackView topAnchor];
    v139 = [(UITableView *)self->_tableView tableHeaderView];
    v126 = [v139 topAnchor];
    v121 = [v131 constraintEqualToAnchor:v126];
    v148[0] = v121;
    v111 = [(UIStackView *)self->_paneHeaderStackView bottomAnchor];
    v116 = [(UITableView *)self->_tableView tableHeaderView];
    v108 = [v116 bottomAnchor];
    v102 = [v111 constraintEqualToAnchor:v108];
    v148[1] = v102;
    v99 = [(UIStackView *)self->_paneHeaderStackView leadingAnchor];
    v19 = [(UITableView *)self->_tableView tableHeaderView];
    v20 = [v19 leadingAnchor];
    v21 = [v99 constraintEqualToAnchor:v20];
    v148[2] = v21;
    v22 = [(UIStackView *)self->_paneHeaderStackView trailingAnchor];
    v23 = [(UITableView *)self->_tableView tableHeaderView];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v148[3] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:4];
    [v105 activateConstraints:v26];

    v112 = (void *)MEMORY[0x263F08938];
    v140 = [(UITableView *)self->_tableView centerXAnchor];
    v132 = [v142 centerXAnchor];
    v127 = [v140 constraintEqualToAnchor:v132];
    v147[0] = v127;
    v122 = [(UITableView *)self->_tableView widthAnchor];
    v117 = [v142 widthAnchor];
    v27 = [v122 constraintEqualToAnchor:v117];
    v147[1] = v27;
    v28 = [(UITableView *)self->_tableView topAnchor];
    v29 = [v142 topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v147[2] = v30;
    v31 = [(UITableView *)self->_tableView bottomAnchor];
    v32 = [(UIVisualEffectView *)self->_blurryTray topAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v147[3] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:4];
    [v112 activateConstraints:v34];

    v35 = [(UIVisualEffectView *)self->_blurryTray heightAnchor];
    v36 = [v35 constraintEqualToConstant:0.0];

    [v36 priority];
    *(float *)&double v38 = v37 + -1.0;
    [v36 setPriority:v38];
    v113 = (void *)MEMORY[0x263F08938];
    v141 = v36;
    v146[0] = v36;
    v133 = [(UIVisualEffectView *)self->_blurryTray heightAnchor];
    [(ASCredentialRequestPaneViewController *)self _blurryTrayMinimumHeight];
    v128 = objc_msgSend(v133, "constraintGreaterThanOrEqualToConstant:");
    v146[1] = v128;
    v123 = [(UIVisualEffectView *)self->_blurryTray widthAnchor];
    v118 = [v142 widthAnchor];
    v39 = [v123 constraintEqualToAnchor:v118];
    v146[2] = v39;
    v40 = [(UIVisualEffectView *)self->_blurryTray bottomAnchor];
    v41 = [v142 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v146[3] = v42;
    v43 = [(UIVisualEffectView *)self->_blurryTray centerXAnchor];
    v44 = [v142 centerXAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v146[4] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:5];
    [v113 activateConstraints:v46];

    v100 = (void *)MEMORY[0x263F08938];
    v129 = [(UIStackView *)self->_paneFooterStackView topAnchor];
    v134 = [(UIVisualEffectView *)self->_blurryTray contentView];
    v124 = [v134 topAnchor];
    v119 = [v129 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v124 multiplier:1.0];
    v145[0] = v119;
    v109 = [(UIStackView *)self->_paneFooterStackView bottomAnchor];
    v114 = [(UIVisualEffectView *)self->_blurryTray contentView];
    v106 = [v114 bottomAnchor];
    v103 = [v109 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v106 multiplier:-1.0];
    v145[1] = v103;
    v95 = [(UIStackView *)self->_paneFooterStackView centerYAnchor];
    v97 = [(UIVisualEffectView *)self->_blurryTray contentView];
    v93 = [v97 centerYAnchor];
    v91 = [v95 constraintEqualToAnchor:v93];
    v145[2] = v91;
    v47 = [(UIStackView *)self->_paneFooterStackView leadingAnchor];
    v48 = [(UIVisualEffectView *)self->_blurryTray contentView];
    v49 = [v48 leadingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:20.0];
    v145[3] = v50;
    v51 = [(UIVisualEffectView *)self->_blurryTray contentView];
    v52 = [v51 trailingAnchor];
    v53 = [(UIStackView *)self->_paneFooterStackView trailingAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:20.0];
    v145[4] = v54;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:5];
    [v100 activateConstraints:v55];

    v56 = [(UIStackView *)self->_paneHeaderStackView widthAnchor];
    v57 = [v56 constraintEqualToConstant:0.0];
    headerWidthConstraint = self->_headerWidthConstraint;
    self->_headerWidthConstraint = v57;

    v59 = [(UIStackView *)self->_paneFooterStackView widthAnchor];
    v60 = [v59 constraintEqualToConstant:0.0];
    footerWidthConstraint = self->_footerWidthConstraint;
    self->_footerWidthConstraint = v60;

    v62 = (void *)MEMORY[0x263F08938];
    v63 = self->_footerWidthConstraint;
    v144[0] = self->_headerWidthConstraint;
    v144[1] = v63;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:2];
    [v62 activateConstraints:v64];

    [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  }
  else
  {
    id v65 = objc_alloc_init(MEMORY[0x263F82B88]);
    [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v65 setClipsToBounds:1];
    [v65 setContentInsetAdjustmentBehavior:2];
    [v65 addSubview:self->_paneHeaderStackView];
    [v3 addSubview:v65];
    v66 = [v65 bottomAnchor];
    v67 = [v3 bottomAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];

    LODWORD(v69) = 1144750080;
    v135 = v68;
    [v68 setPriority:v69];
    v94 = (void *)MEMORY[0x263F08938];
    v138 = [v65 topAnchor];
    v137 = [v3 topAnchor];
    [(ASCredentialRequestPaneViewController *)self _navigationBarHeaderHeight];
    v136 = objc_msgSend(v138, "constraintEqualToAnchor:constant:", v137);
    v149[0] = v136;
    v130 = [v65 leadingAnchor];
    v125 = [v3 leadingAnchor];
    v120 = [v130 constraintEqualToAnchor:v125];
    v149[1] = v120;
    v115 = [v65 trailingAnchor];
    v110 = [v3 trailingAnchor];
    v107 = [v115 constraintEqualToAnchor:v110];
    v149[2] = v107;
    v149[3] = v68;
    v101 = [(UIStackView *)self->_paneHeaderStackView leadingAnchor];
    v104 = [v65 contentLayoutGuide];
    v98 = [v104 leadingAnchor];
    v96 = [v101 constraintEqualToAnchor:v98];
    v149[4] = v96;
    v90 = [(UIStackView *)self->_paneHeaderStackView trailingAnchor];
    v92 = [v65 contentLayoutGuide];
    v89 = [v92 trailingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v149[5] = v88;
    v86 = [(UIStackView *)self->_paneHeaderStackView widthAnchor];
    v87 = [v65 frameLayoutGuide];
    v85 = [v87 widthAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v149[6] = v84;
    v82 = [(UIStackView *)self->_paneHeaderStackView centerYAnchor];
    v83 = [v65 contentLayoutGuide];
    v81 = [v83 centerYAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v149[7] = v80;
    v79 = [v65 contentLayoutGuide];
    v70 = [v79 heightAnchor];
    v71 = [(UIStackView *)self->_paneHeaderStackView heightAnchor];
    v72 = [v70 constraintGreaterThanOrEqualToAnchor:v71];
    v149[8] = v72;
    v73 = [v65 contentLayoutGuide];
    v74 = [v73 heightAnchor];
    v141 = v65;
    v75 = [v65 frameLayoutGuide];
    v76 = [v75 heightAnchor];
    v77 = [v74 constraintGreaterThanOrEqualToAnchor:v76];
    v149[9] = v77;
    v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:10];
    [v94 activateConstraints:v78];

    [(ASCredentialRequestPaneViewController *)self _setUpContexts];
    [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v4 viewWillAppear:a3];
  if (([(ASCredentialRequestPaneViewController *)self isBeingPresented] & 1) == 0)
  {
    -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(ASCredentialRequestPaneViewController *)self view];
  [v4 setNeedsLayout];

  v5 = [(ASCredentialRequestPaneViewController *)self view];
  [v5 layoutIfNeeded];

  [(ASCredentialRequestPaneViewController *)self _adjustForPositionOfScrollView:self->_tableView];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(UIVisualEffectView *)self->_blurryTray setNeedsUpdateConstraints];
  [(UIVisualEffectView *)self->_blurryTray layoutIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v6 viewWillLayoutSubviews];
  objc_super v3 = [(ASCredentialRequestPaneViewController *)self view];
  [v3 frame];
  double v5 = v4;

  [(NSLayoutConstraint *)self->_headerWidthConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_footerWidthConstraint setConstant:v5];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v4 viewDidLayoutSubviews];
  objc_super v3 = [(UITableView *)self->_tableView tableHeaderView];
  if (v3 || (objc_super v3 = self->_paneHeaderStackView) != 0) {
    [(ASCredentialRequestPaneViewController *)self _setCompressedHeightForView:v3];
  }
  [(UIStackView *)v3 setNeedsLayout];
  [(UIStackView *)v3 layoutIfNeeded];
  [(UITableView *)self->_tableView setNeedsLayout];
  [(UITableView *)self->_tableView layoutIfNeeded];
  [(UIVisualEffectView *)self->_blurryTray setNeedsLayout];
  [(UIVisualEffectView *)self->_blurryTray layoutIfNeeded];
  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  [(ASCredentialRequestPaneViewController *)self _updateBlurForTray];
}

- (void)_setCompressedHeightForView:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v4 = v3;
  [v6 frame];
  if (v5 != v4) {
    objc_msgSend(v6, "setFrame:");
  }
}

- (void)sizeToFitPaneContent
{
  [(ASCredentialRequestPaneViewController *)self preferredContentSize];
  if (v3 == 0.0)
  {
    double v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 bounds];
    -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v6);
  }
  [(ASCredentialRequestPaneViewController *)self _intrinsicContentHeight];
  double v8 = v7;
  [(ASCredentialRequestPaneViewController *)self _maximumContentHeight];
  double v10 = v9;
  double v11 = v8;
  if (v8 > v9)
  {
    [(ASCredentialRequestPaneViewController *)self _maximumContentHeight];
    double v11 = v12;
  }
  [(UITableView *)self->_tableView setScrollEnabled:v8 > v10];
  v13 = [(ASCredentialRequestPaneViewController *)self view];
  [v13 bounds];
  -[ASCredentialRequestPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v16), v11);

  id v14 = [(ASCredentialRequestPaneViewController *)self view];
  [v14 layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestPaneViewController;
  id v4 = a3;
  [(ASCredentialRequestPaneViewController *)&v8 traitCollectionDidChange:v4];
  double v5 = [(ASCredentialRequestPaneViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
  }
}

- (double)_blurryTrayMinimumHeight
{
  if (!self->_isTableViewRequired) {
    return 0.0;
  }
  int v2 = [MEMORY[0x263F29440] isPad];
  double result = 120.0;
  if (v2) {
    return 100.0;
  }
  return result;
}

- (id)_newStackView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82BF8]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setAlignment:3];
  [v2 setAxis:1];
  [v2 setDistribution:0];
  return v2;
}

- (id)_newContainerView
{
  id v2 = objc_alloc_init(MEMORY[0x263F82E00]);
  double v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (void)_setUpContexts
{
  double v3 = [ASCredentialRequestPaneContext alloc];
  id v4 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  double v5 = [(ASCredentialRequestPaneContext *)v3 initWithPaneViewController:self stackView:v4];
  headerPaneContext = self->_headerPaneContext;
  self->_headerPaneContext = v5;

  if (self->_isTableViewRequired)
  {
    double v7 = [ASCredentialRequestPaneContext alloc];
    id v10 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
    objc_super v8 = [(ASCredentialRequestPaneContext *)v7 initWithPaneViewController:self stackView:v10];
    footerPaneContext = self->_footerPaneContext;
    self->_footerPaneContext = v8;
  }
}

- (int64_t)numberOfTableRows
{
  return 0;
}

- (void)_adjustForPositionOfScrollView:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (!self->_isTableViewRequired) {
    goto LABEL_4;
  }
  [v4 contentOffset];
  double v7 = v6;
  objc_super v8 = [(ASCredentialRequestPaneViewController *)self navigationController];
  double v9 = [v8 navigationBar];
  [v9 frame];
  CGFloat v10 = -CGRectGetHeight(v16);

  if (v7 > v10)
  {
    double v11 = [MEMORY[0x263F824D8] effectWithStyle:4];
    v15[0] = v11;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v13 = [(ASCredentialRequestPaneViewController *)self navigationController];
    id v14 = [v13 navigationBar];
    [v14 setBackgroundEffects:v12];
  }
  else
  {
LABEL_4:
    double v11 = [(ASCredentialRequestPaneViewController *)self navigationController];
    double v12 = [v11 navigationBar];
    [v12 setBackgroundEffects:0];
  }

  [(ASCredentialRequestPaneViewController *)self _updateBlurForTray];
}

- (void)_updateBlurForTray
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__ASCredentialRequestPaneViewController__updateBlurForTray__block_invoke;
  v2[3] = &unk_264395388;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v2 animations:0.2];
}

void __59__ASCredentialRequestPaneViewController__updateBlurForTray__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _isContentUnderTray];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F824D8] effectWithStyle:4];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [*(id *)(*(void *)(a1 + 32) + 984) setEffect:v3];
  if (v2)
  {
  }
}

- (BOOL)_isContentUnderTray
{
  if (!self->_isTableViewRequired) {
    return 0;
  }
  uint64_t v3 = [(ASCredentialRequestPaneViewController *)self _indexPathForLastRow];
  if ([v3 row] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = 0;
  }
  else
  {
    [(UITableView *)self->_tableView rectForRowAtIndexPath:v3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    tableView = self->_tableView;
    id v14 = [(ASCredentialRequestPaneViewController *)self view];
    -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v14, v6, v8, v10, v12);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v25.origin.x = v16;
    v25.origin.y = v18;
    v25.size.width = v20;
    v25.size.height = v22;
    double MaxY = CGRectGetMaxY(v25);
    [(UIVisualEffectView *)self->_blurryTray frame];
    BOOL v4 = MaxY > CGRectGetMinY(v26);
  }

  return v4;
}

- (id)_indexPathForLastRow
{
  int64_t v3 = [(ASCredentialRequestPaneViewController *)self _safeIndexWithCount:[(UITableView *)self->_tableView numberOfSections]];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = (void *)MEMORY[0x263F088C8];
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = v3;
    int64_t v5 = [(ASCredentialRequestPaneViewController *)self _safeIndexWithCount:[(UITableView *)self->_tableView numberOfRowsInSection:v3]];
    BOOL v4 = (void *)MEMORY[0x263F088C8];
    uint64_t v6 = v7;
  }
  double v8 = [v4 indexPathForRow:v5 inSection:v6];

  return v8;
}

- (int64_t)_safeIndexWithCount:(int64_t)a3
{
  if (a3 <= 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 - 1;
  }
}

- (double)_navigationBarHeaderHeight
{
  +[ASViewServiceInterfaceUtilities navigationBarHeight];
  return result;
}

- (double)_maximumContentHeight
{
  int64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  [(ASCredentialRequestPaneViewController *)self _navigationBarHeaderHeight];
  return v5 * 0.86 - v6;
}

- (double)_intrinsicContentHeight
{
  int64_t v3 = [(ASCredentialRequestPaneViewController *)self tableView];
  -[UIStackView systemLayoutSizeFittingSize:](self->_paneHeaderStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v5 = v4;
  [(UIVisualEffectView *)self->_blurryTray frame];
  double Height = CGRectGetHeight(v12);
  if ([v3 numberOfSections] < 1)
  {
    double v8 = 0.0;
  }
  else
  {
    uint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      if (![v3 numberOfRowsInSection:v7]) {
        break;
      }
      [v3 rectForSection:v7];
      double v8 = v8 + CGRectGetHeight(v13);
      ++v7;
    }
    while (v7 < [v3 numberOfSections]);
  }
  double v9 = 12.0;
  if (v8 != 0.0) {
    double v9 = v8;
  }
  double v10 = Height + v5 + v9;

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (ASCredentialRequestPaneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCredentialRequestPaneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)paneHeaderStackView
{
  return self->_paneHeaderStackView;
}

- (UIStackView)paneFooterStackView
{
  return self->_paneFooterStackView;
}

- (ASCredentialRequestPaneContext)headerPaneContext
{
  return self->_headerPaneContext;
}

- (ASCredentialRequestPaneContext)footerPaneContext
{
  return self->_footerPaneContext;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerPaneContext, 0);
  objc_storeStrong((id *)&self->_headerPaneContext, 0);
  objc_storeStrong((id *)&self->_paneFooterStackView, 0);
  objc_storeStrong((id *)&self->_paneHeaderStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_headerWidthConstraint, 0);

  objc_storeStrong((id *)&self->_blurryTray, 0);
}

@end