@interface AKAuthorizationPaneViewController
- (AKAuthorizationEditableDataSources)editableDataSources;
- (AKAuthorizationPaneContext)footerPaneContext;
- (AKAuthorizationPaneContext)headerPaneContext;
- (AKAuthorizationPaneDelegate)paneDelegate;
- (AKAuthorizationPaneViewController)init;
- (AKAuthorizationPaneViewController)initWithCoder:(id)a3;
- (AKAuthorizationPaneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKAuthorizationPaneViewController)initWithStyle:(int64_t)a3;
- (BOOL)_isContentUnderNavigationBar;
- (BOOL)_isContentUnderTray;
- (BOOL)_shouldEmbedContentTray;
- (BOOL)isWristDetectionEnabled;
- (BOOL)shouldEmbedContentTrayIfNeeded;
- (NSLayoutConstraint)footerWidthConstraint;
- (NSLayoutConstraint)headerWidthConstraint;
- (NSMutableArray)mutableConstraints;
- (UIStackView)paneFooterStackView;
- (UIStackView)paneHeaderStackView;
- (UITableView)tableView;
- (UIVisualEffectView)blurryTray;
- (double)_contentTrayOffsetAdjustedForScrollInset:(BOOL)a3;
- (double)_deviceSafeAreaBottomInset;
- (double)_navigationBarHeaderHeight;
- (double)contentScrollOffset;
- (double)intrinsicContentHeight;
- (double)maximumContentHeight;
- (double)maximumContentWidth;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_indexPathForLastRow;
- (id)_newContainerView;
- (id)_newStackView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_safeIndexWithCount:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_adjustForPositionOfScrollView:(id)a3;
- (void)_configureContentTrayIfNeeded;
- (void)_setCompressedHeightForView:(id)a3;
- (void)_setupContexts;
- (void)_updateBlurForTray;
- (void)setBlurryTray:(id)a3;
- (void)setEditableDataSources:(id)a3;
- (void)setFooterPaneContext:(id)a3;
- (void)setHeaderPaneContext:(id)a3;
- (void)setMutableConstraints:(id)a3;
- (void)setPaneDelegate:(id)a3;
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

@implementation AKAuthorizationPaneViewController

- (AKAuthorizationPaneViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationPaneViewController;
  v2 = [(AKAuthorizationPaneViewController *)&v4 initWithNibName:0 bundle:0];
  [(AKAuthorizationPaneViewController *)v2 setModalInPresentation:1];
  return v2;
}

- (void)viewDidLoad
{
  v71[4] = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v69 viewDidLoad];
  v3 = [(AKAuthorizationPaneViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v72);

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", +[AKAuthorizationAppearance tableViewStyle](AKAuthorizationAppearance, "tableViewStyle"), 0.0, 0.0, Width, 0.0);
  [(AKAuthorizationPaneViewController *)self setTableView:v5];

  +[AKAuthorizationPaneMetrics tableSectionFooterHeight];
  double v7 = v6;
  v8 = [(AKAuthorizationPaneViewController *)self tableView];
  [v8 setSectionFooterHeight:v7];

  v9 = [(AKAuthorizationPaneViewController *)self tableView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [MEMORY[0x1E4F428B8] clearColor];
  v11 = [(AKAuthorizationPaneViewController *)self tableView];
  [v11 setBackgroundColor:v10];

  v12 = [(AKAuthorizationPaneViewController *)self tableView];
  [v12 setAlwaysBounceVertical:0];

  v13 = [(AKAuthorizationPaneViewController *)self tableView];
  [v13 setShowsVerticalScrollIndicator:0];

  v14 = [(AKAuthorizationPaneViewController *)self _newStackView];
  paneHeaderStackView = self->_paneHeaderStackView;
  self->_paneHeaderStackView = v14;

  id v16 = [(AKAuthorizationPaneViewController *)self _newContainerView];
  v17 = [(AKAuthorizationPaneViewController *)self tableView];
  [v17 setTableHeaderView:v16];

  v18 = [(AKAuthorizationPaneViewController *)self tableView];
  v19 = [v18 tableHeaderView];
  [v19 addSubview:self->_paneHeaderStackView];

  v20 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
  blurryTray = self->_blurryTray;
  self->_blurryTray = v20;

  [(UIVisualEffectView *)self->_blurryTray setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [(AKAuthorizationPaneViewController *)self _newStackView];
  paneFooterStackView = self->_paneFooterStackView;
  self->_paneFooterStackView = v22;

  v24 = [(UIVisualEffectView *)self->_blurryTray contentView];
  [v24 addSubview:self->_paneFooterStackView];

  [(UIStackView *)self->_paneFooterStackView setSpacing:1.17549435e-38];
  v25 = [(AKAuthorizationPaneViewController *)self view];
  v26 = [(AKAuthorizationPaneViewController *)self tableView];
  [v25 addSubview:v26];

  v27 = [(AKAuthorizationPaneViewController *)self view];
  [v27 setAccessibilityIdentifier:*MEMORY[0x1E4F4ED00]];

  [(AKAuthorizationPaneViewController *)self _setupContexts];
  v68 = [MEMORY[0x1E4F1CA48] array];
  v67 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v65 = [v67 topAnchor];
  v66 = [(AKAuthorizationPaneViewController *)self tableView];
  v64 = [v66 tableHeaderView];
  v63 = [v64 topAnchor];
  v62 = [v65 constraintEqualToAnchor:v63];
  v71[0] = v62;
  v61 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v59 = [v61 bottomAnchor];
  v60 = [(AKAuthorizationPaneViewController *)self tableView];
  v58 = [v60 tableHeaderView];
  v57 = [v58 bottomAnchor];
  v56 = [v59 constraintEqualToAnchor:v57];
  v71[1] = v56;
  v55 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v53 = [v55 leadingAnchor];
  v54 = [(AKAuthorizationPaneViewController *)self tableView];
  v52 = [v54 tableHeaderView];
  v28 = [v52 leadingAnchor];
  v29 = [v53 constraintEqualToAnchor:v28];
  v71[2] = v29;
  v30 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v31 = [v30 trailingAnchor];
  v32 = [(AKAuthorizationPaneViewController *)self tableView];
  v33 = [v32 tableHeaderView];
  v34 = [v33 trailingAnchor];
  v35 = [v31 constraintEqualToAnchor:v34];
  v71[3] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
  [v68 addObjectsFromArray:v36];

  v37 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [(AKAuthorizationPaneViewController *)self tableView];
  v39 = [(AKAuthorizationPaneViewController *)self view];
  v40 = objc_msgSend(v37, "ak_constraintsForView:equalToView:", v38, v39);
  [v68 addObjectsFromArray:v40];

  v41 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  v42 = [v41 widthAnchor];
  v43 = [v42 constraintEqualToConstant:0.0];
  headerWidthConstraint = self->_headerWidthConstraint;
  self->_headerWidthConstraint = v43;

  v45 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
  v46 = [v45 widthAnchor];
  v47 = [v46 constraintEqualToConstant:0.0];
  footerWidthConstraint = self->_footerWidthConstraint;
  self->_footerWidthConstraint = v47;

  v49 = [(AKAuthorizationPaneViewController *)self headerWidthConstraint];
  v70[0] = v49;
  v50 = [(AKAuthorizationPaneViewController *)self footerWidthConstraint];
  v70[1] = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  [v68 addObjectsFromArray:v51];

  [MEMORY[0x1E4F28DC8] activateConstraints:v68];
  [(AKAuthorizationPaneViewController *)self sizeToFitPaneContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v16 viewWillAppear:a3];
  objc_super v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    double v6 = [(AKAuthorizationPaneViewController *)self navigationController];
    double v7 = [v6 view];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    v12 = [(AKAuthorizationPaneViewController *)self navigationController];
    v13 = [v12 navigationBar];
    [v13 size];
    double v15 = v11 - v14;

    -[AKAuthorizationPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v15);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(AKAuthorizationPaneViewController *)self view];
  [v4 setNeedsLayout];

  uint64_t v5 = [(AKAuthorizationPaneViewController *)self view];
  [v5 layoutIfNeeded];

  double v6 = [(AKAuthorizationPaneViewController *)self tableView];
  [(AKAuthorizationPaneViewController *)self _adjustForPositionOfScrollView:v6];
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v5 viewSafeAreaInsetsDidChange];
  v3 = [(AKAuthorizationPaneViewController *)self blurryTray];
  [v3 setNeedsUpdateConstraints];

  objc_super v4 = [(AKAuthorizationPaneViewController *)self blurryTray];
  [v4 layoutIfNeeded];
}

- (void)_setupContexts
{
  v3 = [AKAuthorizationPaneContext alloc];
  objc_super v4 = [(AKAuthorizationPaneViewController *)self paneHeaderStackView];
  objc_super v5 = [(AKAuthorizationPaneContext *)v3 initWithPaneViewController:self stackView:v4];
  [(AKAuthorizationPaneViewController *)self setHeaderPaneContext:v5];

  double v6 = [AKAuthorizationPaneContext alloc];
  objc_super v7 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
  double v8 = [(AKAuthorizationPaneContext *)v6 initWithPaneViewController:self stackView:v7];
  [(AKAuthorizationPaneViewController *)self setFooterPaneContext:v8];

  id v9 = [MEMORY[0x1E4F1CA48] array];
  [(AKAuthorizationPaneViewController *)self setMutableConstraints:v9];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v8 viewWillLayoutSubviews];
  v3 = [(AKAuthorizationPaneViewController *)self view];
  [v3 frame];
  double v5 = v4;

  double v6 = [(AKAuthorizationPaneViewController *)self headerWidthConstraint];
  [v6 setConstant:v5];

  objc_super v7 = [(AKAuthorizationPaneViewController *)self footerWidthConstraint];
  [v7 setConstant:v5];
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)AKAuthorizationPaneViewController;
  [(AKAuthorizationPaneViewController *)&v28 viewDidLayoutSubviews];
  v3 = [(AKAuthorizationPaneViewController *)self tableView];
  double v4 = [v3 tableHeaderView];

  if (v4) {
    [(AKAuthorizationPaneViewController *)self _setCompressedHeightForView:v4];
  }
  double v5 = [(AKAuthorizationPaneViewController *)self tableView];
  double v6 = [v5 tableFooterView];

  if (v6) {
    [(AKAuthorizationPaneViewController *)self _setCompressedHeightForView:v6];
  }
  [(AKAuthorizationPaneViewController *)self _contentTrayOffsetAdjustedForScrollInset:1];
  double v8 = v7;
  id v9 = [(AKAuthorizationPaneViewController *)self tableView];
  objc_msgSend(v9, "_setContentScrollInset:", 0.0, 0.0, v8, 0.0);

  double v10 = [(AKAuthorizationPaneViewController *)self tableView];
  double v11 = [v10 tableHeaderView];
  [v11 setNeedsLayout];

  v12 = [(AKAuthorizationPaneViewController *)self tableView];
  v13 = [v12 tableHeaderView];
  [v13 layoutIfNeeded];

  double v14 = [(AKAuthorizationPaneViewController *)self tableView];
  double v15 = [(AKAuthorizationPaneViewController *)self tableView];
  objc_super v16 = [v15 tableHeaderView];
  [v14 setTableHeaderView:v16];

  v17 = [(AKAuthorizationPaneViewController *)self tableView];
  v18 = [v17 tableFooterView];
  [v18 setNeedsLayout];

  v19 = [(AKAuthorizationPaneViewController *)self tableView];
  v20 = [v19 tableFooterView];
  [v20 layoutIfNeeded];

  v21 = [(AKAuthorizationPaneViewController *)self tableView];
  v22 = [(AKAuthorizationPaneViewController *)self tableView];
  v23 = [v22 tableFooterView];
  [v21 setTableFooterView:v23];

  v24 = [(AKAuthorizationPaneViewController *)self tableView];
  [v24 setNeedsLayout];

  v25 = [(AKAuthorizationPaneViewController *)self tableView];
  [v25 layoutIfNeeded];

  v26 = [(AKAuthorizationPaneViewController *)self blurryTray];
  [v26 setNeedsLayout];

  v27 = [(AKAuthorizationPaneViewController *)self blurryTray];
  [v27 layoutIfNeeded];

  [(AKAuthorizationPaneViewController *)self _configureContentTrayIfNeeded];
  [(AKAuthorizationPaneViewController *)self sizeToFitPaneContent];
  [(AKAuthorizationPaneViewController *)self _updateBlurForTray];
}

- (void)_setCompressedHeightForView:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  double v4 = v3;
  [v6 frame];
  if (v5 != v4) {
    objc_msgSend(v6, "setFrame:");
  }
}

- (void)_configureContentTrayIfNeeded
{
  v93[5] = *MEMORY[0x1E4F143B8];
  double v3 = [(AKAuthorizationPaneViewController *)self tableView];
  double v4 = [v3 tableFooterView];
  int v5 = v4 == 0;

  int v6 = [(AKAuthorizationPaneViewController *)self _shouldEmbedContentTray];
  if (v5 == v6
    || ([(AKAuthorizationPaneViewController *)self blurryTray],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [v7 superview],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    id v9 = [(AKAuthorizationPaneViewController *)self blurryTray];
    double v10 = [v9 superview];

    if (v10)
    {
      double v11 = [(AKAuthorizationPaneViewController *)self blurryTray];
      [v11 removeFromSuperview];
    }
    int v88 = v6;
    v12 = [(AKAuthorizationPaneViewController *)self tableView];
    v13 = [v12 tableFooterView];

    if (v13)
    {
      double v14 = [(AKAuthorizationPaneViewController *)self tableView];
      [v14 setTableFooterView:0];
    }
    v90 = [MEMORY[0x1E4F1CA48] array];
    v86 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
    v80 = [v86 topAnchor];
    v84 = [(AKAuthorizationPaneViewController *)self blurryTray];
    v82 = [v84 contentView];
    v78 = [v82 topAnchor];
    v76 = [v80 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v78 multiplier:1.0];
    v93[0] = v76;
    v74 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
    v68 = [v74 bottomAnchor];
    CGRect v72 = [(AKAuthorizationPaneViewController *)self blurryTray];
    v70 = [v72 contentView];
    v66 = [v70 bottomAnchor];
    v64 = [v68 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v66 multiplier:-1.0];
    v93[1] = v64;
    v62 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
    v59 = [v62 centerYAnchor];
    v60 = [(AKAuthorizationPaneViewController *)self blurryTray];
    v58 = [v60 contentView];
    v57 = [v58 centerYAnchor];
    v56 = [v59 constraintEqualToAnchor:v57];
    v93[2] = v56;
    v55 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
    v53 = [v55 leadingAnchor];
    v54 = [(AKAuthorizationPaneViewController *)self blurryTray];
    v52 = [v54 contentView];
    double v15 = [v52 leadingAnchor];
    objc_super v16 = [v53 constraintEqualToAnchor:v15];
    v93[3] = v16;
    v17 = [(AKAuthorizationPaneViewController *)self paneFooterStackView];
    v18 = [v17 trailingAnchor];
    v19 = [(AKAuthorizationPaneViewController *)self blurryTray];
    v20 = [v19 contentView];
    v21 = [v20 trailingAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    v93[4] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:5];
    [v90 addObjectsFromArray:v23];

    if (v88)
    {
      v24 = [(AKAuthorizationPaneViewController *)self tableView];
      id v25 = [(AKAuthorizationPaneViewController *)self _newContainerView];
      [v24 setTableFooterView:v25];

      v26 = [(AKAuthorizationPaneViewController *)self tableView];
      v27 = [v26 tableFooterView];
      objc_super v28 = [(AKAuthorizationPaneViewController *)self blurryTray];
      [v27 addSubview:v28];

      v81 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v79 = [v81 topAnchor];
      v77 = [(AKAuthorizationPaneViewController *)self tableView];
      v73 = [v77 tableFooterView];
      uint64_t v75 = [v73 topAnchor];
      uint64_t v71 = [v79 constraintEqualToAnchor:v75];
      v92[0] = v71;
      objc_super v69 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v29 = [v69 bottomAnchor];
      v87 = [(AKAuthorizationPaneViewController *)self tableView];
      v67 = [v87 tableFooterView];
      [v67 bottomAnchor];
      v85 = v89 = v29;
      v83 = objc_msgSend(v29, "constraintEqualToAnchor:");
      v92[1] = v83;
      v30 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v31 = [v30 leadingAnchor];
      v65 = [(AKAuthorizationPaneViewController *)self tableView];
      v63 = [v65 tableFooterView];
      v61 = [v63 leadingAnchor];
      v32 = [v31 constraintEqualToAnchor:v61];
      v92[2] = v32;
      v33 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v34 = [v33 trailingAnchor];
      v35 = [(AKAuthorizationPaneViewController *)self tableView];
      v36 = [v35 tableFooterView];
      v37 = [v36 trailingAnchor];
      v38 = [v34 constraintEqualToAnchor:v37];
      v92[3] = v38;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
      [v90 addObjectsFromArray:v39];

      v40 = v69;
      v41 = v73;

      v42 = (void *)v71;
      v43 = v77;

      v44 = v67;
      v45 = (void *)v75;

      v46 = v79;
      v47 = v81;
    }
    else
    {
      v48 = [(AKAuthorizationPaneViewController *)self view];
      v49 = [(AKAuthorizationPaneViewController *)self blurryTray];
      [v48 addSubview:v49];

      v47 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v46 = [v47 heightAnchor];
      +[AKAuthorizationPaneMetrics blurryTrayHeight];
      v43 = objc_msgSend(v46, "constraintGreaterThanOrEqualToConstant:");
      v91[0] = v43;
      v41 = [(AKAuthorizationPaneViewController *)self blurryTray];
      v45 = [v41 bottomAnchor];
      v42 = [(AKAuthorizationPaneViewController *)self view];
      v40 = [v42 bottomAnchor];
      v89 = [v45 constraintEqualToAnchor:v40];
      v91[1] = v89;
      v87 = [(AKAuthorizationPaneViewController *)self blurryTray];
      uint64_t v50 = [v87 centerXAnchor];
      v51 = self;
      v44 = (void *)v50;
      v85 = [(AKAuthorizationPaneViewController *)v51 view];
      v83 = [v85 centerXAnchor];
      v30 = objc_msgSend(v44, "constraintEqualToAnchor:");
      v91[2] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];
      [v90 addObjectsFromArray:v31];
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v90];
  }
}

- (void)_updateBlurForTray
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__AKAuthorizationPaneViewController__updateBlurForTray__block_invoke;
  v2[3] = &unk_1E648EF28;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.2];
}

void __55__AKAuthorizationPaneViewController__updateBlurForTray__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isContentUnderTray])
  {
    objc_msgSend(MEMORY[0x1E4F427D8], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = [*(id *)(a1 + 32) blurryTray];
    [v2 setEffect:v3];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) blurryTray];
    [v3 setEffect:0];
  }
}

- (double)_contentTrayOffsetAdjustedForScrollInset:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if (![(AKAuthorizationPaneViewController *)self _shouldEmbedContentTray])
  {
    int v6 = [(AKAuthorizationPaneViewController *)self _indexPathForLastRow];
    uint64_t v7 = [v6 row];
    double v8 = [(AKAuthorizationPaneViewController *)self tableView];
    id v9 = v8;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v10 = [v8 tableHeaderView];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
    }
    else
    {
      [v8 rectForRowAtIndexPath:v6];
      double v12 = v19;
      double v14 = v20;
      double v16 = v21;
      double v18 = v22;
    }

    v23 = [(AKAuthorizationPaneViewController *)self tableView];
    v24 = [(AKAuthorizationPaneViewController *)self view];
    objc_msgSend(v23, "convertRect:toView:", v24, v12, v14, v16, v18);
    CGFloat v26 = v25;
    double v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    if (v3)
    {
      v33 = [(AKAuthorizationPaneViewController *)self tableView];
      [v33 contentOffset];
      double v35 = v34;
      [(AKAuthorizationPaneViewController *)self _navigationBarHeaderHeight];
      double v28 = v28 + v35 + v36;

      [(AKAuthorizationPaneViewController *)self contentScrollOffset];
      double Height = v37;
    }
    else
    {
      v39 = [(AKAuthorizationPaneViewController *)self blurryTray];
      [v39 frame];
      double Height = CGRectGetHeight(v45);
    }
    v46.origin.x = v26;
    v46.origin.y = v28;
    v46.size.width = v30;
    v46.size.height = v32;
    double MaxY = CGRectGetMaxY(v46);
    v41 = [(AKAuthorizationPaneViewController *)self view];
    [v41 frame];
    double v42 = MaxY - (CGRectGetMaxY(v47) - Height);

    double v43 = fmin(Height, fmax(v42, 0.0));
    if (v3 && v42 > 0.0) {
      double v5 = Height;
    }
    else {
      double v5 = v43;
    }
  }
  return v5;
}

- (BOOL)_isContentUnderTray
{
  [(AKAuthorizationPaneViewController *)self _contentTrayOffsetAdjustedForScrollInset:0];
  double v3 = v2;
  +[AKAuthorizationPaneMetrics contentOffsetThresholdToShowBlurTray];
  return v3 > v4;
}

- (BOOL)_isContentUnderNavigationBar
{
  double v3 = [(AKAuthorizationPaneViewController *)self tableView];
  [v3 contentOffset];
  double v5 = v4;
  int v6 = [(AKAuthorizationPaneViewController *)self navigationController];
  uint64_t v7 = [v6 navigationBar];
  [v7 frame];
  BOOL v8 = v5 > -CGRectGetHeight(v10);

  return v8;
}

- (double)contentScrollOffset
{
  double v2 = [(AKAuthorizationPaneViewController *)self blurryTray];
  [v2 frame];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (BOOL)shouldEmbedContentTrayIfNeeded
{
  return 0;
}

- (BOOL)_shouldEmbedContentTray
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self shouldEmbedContentTrayIfNeeded];
  if (v3)
  {
    [(AKAuthorizationPaneViewController *)self intrinsicContentHeight];
    double v5 = v4;
    [(AKAuthorizationPaneViewController *)self maximumContentHeight];
    LOBYTE(v3) = v5 >= v6;
  }
  return v3;
}

- (double)intrinsicContentHeight
{
  BOOL v3 = [(AKAuthorizationPaneViewController *)self tableView];
  double v4 = [v3 tableHeaderView];
  double v5 = *MEMORY[0x1E4F43B90];
  double v6 = *(double *)(MEMORY[0x1E4F43B90] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], v6);
  double v8 = v7;

  id v9 = [v3 tableFooterView];
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", v5, v6);
  double v11 = v10;

  double v12 = 0.0;
  double Height = 0.0;
  if (v11 == 0.0)
  {
    double v14 = [(AKAuthorizationPaneViewController *)self blurryTray];
    [v14 frame];
    double Height = CGRectGetHeight(v21);
  }
  +[AKAuthorizationPaneMetrics paneAdditionSafeAreaInsets];
  double v16 = v15;
  if ([v3 numberOfSections] >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      if (![v3 numberOfRowsInSection:v17]) {
        break;
      }
      [v3 rectForSection:v17];
      double v12 = v12 + CGRectGetHeight(v22);
      ++v17;
    }
    while (v17 < [v3 numberOfSections]);
  }
  double v18 = 12.0;
  if (v12 != 0.0) {
    double v18 = v12;
  }
  double v19 = v16 + Height + v11 + v8 + v18;

  return v19;
}

- (double)maximumContentHeight
{
  BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;

  +[AKAuthorizationPaneMetrics maximumContentHeightFactor];
  double v7 = v5 * v6;
  double v8 = [MEMORY[0x1E4F4F020] sharedManager];
  char v9 = [v8 isLisbonAvailable];

  if ((v9 & 1) == 0)
  {
    [(AKAuthorizationPaneViewController *)self _navigationBarHeaderHeight];
    return v7 - v10;
  }
  return v7;
}

- (double)maximumContentWidth
{
  double v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)sizeToFitPaneContent
{
  if ([(AKAuthorizationPaneViewController *)self isViewLoaded])
  {
    double v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1)
    {
      double v5 = [(AKAuthorizationPaneViewController *)self view];
      [v5 bounds];
      double Width = CGRectGetWidth(v15);

      [(AKAuthorizationPaneViewController *)self intrinsicContentHeight];
      double v8 = v7;
      [(AKAuthorizationPaneViewController *)self maximumContentHeight];
      if (v8 > v9)
      {
        [(AKAuthorizationPaneViewController *)self maximumContentHeight];
        double v8 = v10;
      }
      if (Width == 0.0
        || ([(AKAuthorizationPaneViewController *)self maximumContentWidth], Width > v11))
      {
        [(AKAuthorizationPaneViewController *)self maximumContentWidth];
        double Width = v12;
      }
      -[AKAuthorizationPaneViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v8);
      id v13 = [(AKAuthorizationPaneViewController *)self view];
      [v13 layoutIfNeeded];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationPaneViewController;
  id v4 = a3;
  [(AKAuthorizationPaneViewController *)&v8 traitCollectionDidChange:v4];
  double v5 = [(AKAuthorizationPaneViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(AKAuthorizationPaneViewController *)self sizeToFitPaneContent];
  }
}

- (double)_deviceSafeAreaBottomInset
{
  double v2 = [MEMORY[0x1E4F42738] sharedApplication];
  double v3 = [v2 windows];
  id v4 = [v3 firstObject];

  [v4 _sceneSafeAreaInsetsIncludingStatusBar:0];
  double v6 = v5;

  return v6;
}

- (double)_navigationBarHeaderHeight
{
  double v2 = [(AKAuthorizationPaneViewController *)self navigationController];
  double v3 = [v2 navigationBar];
  [v3 frame];
  double Height = CGRectGetHeight(v6);

  return Height;
}

- (void)_adjustForPositionOfScrollView:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  [a3 contentOffset];
  double v5 = v4;
  CGRect v6 = [(AKAuthorizationPaneViewController *)self navigationController];
  double v7 = [v6 navigationBar];
  [v7 frame];
  CGFloat v8 = -CGRectGetHeight(v14);

  if (v5 <= v8)
  {
    double v9 = [(AKAuthorizationPaneViewController *)self navigationController];
    double v10 = [v9 navigationBar];
    [v10 setBackgroundEffects:0];
  }
  else
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F427D8], "effectWithStyle:", +[AKAuthorizationAppearance paneBlurEffectStyle](AKAuthorizationAppearance, "paneBlurEffectStyle"));
    v13[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    double v11 = [(AKAuthorizationPaneViewController *)self navigationController];
    double v12 = [v11 navigationBar];
    [v12 setBackgroundEffects:v10];
  }
  [(AKAuthorizationPaneViewController *)self _updateBlurForTray];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4) {
    +[AKAuthorizationPaneMetrics interScopeFieldSpacing];
  }
  else {
    +[AKAuthorizationPaneMetrics infoLabelToTableSpacing];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)_newContainerView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  double v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)_newStackView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setAlignment:3];
  [v2 setAxis:1];
  [v2 setDistribution:0];
  return v2;
}

- (id)_indexPathForLastRow
{
  double v3 = [(AKAuthorizationPaneViewController *)self tableView];
  int64_t v4 = -[AKAuthorizationPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", [v3 numberOfSections]);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    CGFloat v8 = [(AKAuthorizationPaneViewController *)self tableView];
    int64_t v9 = -[AKAuthorizationPaneViewController _safeIndexWithCount:](self, "_safeIndexWithCount:", [v8 numberOfRowsInSection:v4]);

    double v5 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v6 = v9;
    uint64_t v7 = v4;
  }
  double v10 = [v5 indexPathForRow:v6 inSection:v7];

  return v10;
}

- (int64_t)_safeIndexWithCount:(int64_t)a3
{
  if (a3 >= 1) {
    return a3 - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (AKAuthorizationPaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (AKAuthorizationPaneViewController)initWithCoder:(id)a3
{
  return 0;
}

- (AKAuthorizationPaneViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (AKAuthorizationPaneDelegate)paneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paneDelegate);

  return (AKAuthorizationPaneDelegate *)WeakRetained;
}

- (void)setPaneDelegate:(id)a3
{
}

- (AKAuthorizationEditableDataSources)editableDataSources
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editableDataSources);

  return (AKAuthorizationEditableDataSources *)WeakRetained;
}

- (void)setEditableDataSources:(id)a3
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

- (AKAuthorizationPaneContext)headerPaneContext
{
  return self->_headerPaneContext;
}

- (void)setHeaderPaneContext:(id)a3
{
}

- (AKAuthorizationPaneContext)footerPaneContext
{
  return self->_footerPaneContext;
}

- (void)setFooterPaneContext:(id)a3
{
}

- (NSMutableArray)mutableConstraints
{
  return self->_mutableConstraints;
}

- (void)setMutableConstraints:(id)a3
{
}

- (BOOL)isWristDetectionEnabled
{
  return self->_isWristDetectionEnabled;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSLayoutConstraint)headerWidthConstraint
{
  return self->_headerWidthConstraint;
}

- (NSLayoutConstraint)footerWidthConstraint
{
  return self->_footerWidthConstraint;
}

- (UIVisualEffectView)blurryTray
{
  return self->_blurryTray;
}

- (void)setBlurryTray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurryTray, 0);
  objc_storeStrong((id *)&self->_footerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_headerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mutableConstraints, 0);
  objc_storeStrong((id *)&self->_footerPaneContext, 0);
  objc_storeStrong((id *)&self->_headerPaneContext, 0);
  objc_storeStrong((id *)&self->_paneFooterStackView, 0);
  objc_storeStrong((id *)&self->_paneHeaderStackView, 0);
  objc_destroyWeak((id *)&self->_editableDataSources);

  objc_destroyWeak((id *)&self->_paneDelegate);
}

@end