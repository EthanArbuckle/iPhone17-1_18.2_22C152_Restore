@interface CBSPaneViewController
- (UIButton)primaryButton;
- (UIButton)secondaryButton;
- (id)primaryButtonText;
- (id)secondaryButtonText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupPrimaryButton;
- (void)_setupSecondaryButton;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CBSPaneViewController

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EA9B000, v3, OS_LOG_TYPE_DEFAULT, "Created an alternating colored square", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBSPaneViewController;
  [(CBSTableViewController *)&v4 viewDidLoad];
  [(CBSPaneViewController *)self _setupPrimaryButton];
  [(CBSPaneViewController *)self _setupSecondaryButton];
}

- (void)_setupPrimaryButton
{
  v3 = [(CBSPaneViewController *)self primaryButtonText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(CBSPaneViewController *)self setPrimaryButton:v5];

    v6 = (void *)MEMORY[0x263F81708];
    v7 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = 24.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v9 = 26.0;
    }
    v10 = [v6 _lightSystemFontOfSize:v9];
    v11 = [(CBSPaneViewController *)self primaryButton];
    v12 = [v11 titleLabel];
    [v12 setFont:v10];

    v13 = [(CBSPaneViewController *)self primaryButton];
    v14 = [v13 titleLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [(CBSPaneViewController *)self primaryButton];
    v16 = [v15 titleLabel];
    [v16 setTextAlignment:1];

    v17 = [(CBSPaneViewController *)self primaryButton];
    v18 = [(CBSPaneViewController *)self primaryButtonText];
    [v17 setTitle:v18 forState:0];

    v19 = [(CBSPaneViewController *)self primaryButton];
    [v19 setAutoresizingMask:5];

    v20 = [(CBSPaneViewController *)self primaryButton];
    [v20 sizeToFit];

    v21 = [(CBSPaneViewController *)self primaryButton];
    [v21 addTarget:self action:sel_primaryButtonTapped_ forControlEvents:64];

    id v23 = [(CBSTableViewController *)self tableView];
    v22 = [(CBSPaneViewController *)self primaryButton];
    [v23 addSubview:v22];
  }
}

- (void)_setupSecondaryButton
{
  v3 = [(CBSPaneViewController *)self secondaryButtonText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [MEMORY[0x263F1C488] buttonWithType:1];
    [(CBSPaneViewController *)self setSecondaryButton:v5];

    v6 = (void *)MEMORY[0x263F81708];
    v7 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = 17.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v9 = 20.0;
    }
    v10 = [v6 systemFontOfSize:v9];
    v11 = [(CBSPaneViewController *)self secondaryButton];
    v12 = [v11 titleLabel];
    [v12 setFont:v10];

    v13 = [(CBSPaneViewController *)self secondaryButton];
    v14 = [v13 titleLabel];
    [v14 setAdjustsFontSizeToFitWidth:1];

    v15 = [(CBSPaneViewController *)self secondaryButton];
    v16 = [v15 titleLabel];
    [v16 setTextAlignment:1];

    v17 = [(CBSPaneViewController *)self secondaryButton];
    v18 = [(CBSPaneViewController *)self secondaryButtonText];
    [v17 setTitle:v18 forState:0];

    v19 = [(CBSPaneViewController *)self secondaryButton];
    [v19 setAutoresizingMask:5];

    v20 = [(CBSPaneViewController *)self secondaryButton];
    [v20 sizeToFit];

    v21 = [(CBSPaneViewController *)self secondaryButton];
    [v21 addTarget:self action:sel_secondaryButtonTapped_ forControlEvents:64];

    id v23 = [(CBSTableViewController *)self tableView];
    v22 = [(CBSPaneViewController *)self secondaryButton];
    [v23 addSubview:v22];
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = CheckerBoardLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EA9B000, v3, OS_LOG_TYPE_DEFAULT, "View has just laid out its subview", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  v62.receiver = self;
  v62.super_class = (Class)CBSPaneViewController;
  [(CBSPaneViewController *)&v62 viewDidLayoutSubviews];
  v6 = [(CBSTableViewController *)self tableView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  v11 = [MEMORY[0x263F68058] sharedStyle];
  v12 = [(CBSTableViewController *)self tableView];
  [v11 edgeInsetsForTable:v12];
  double v14 = v13;
  double v16 = v15;

  v17 = [MEMORY[0x263F68058] sharedStyle];
  v18 = [(CBSPaneViewController *)self view];
  [v17 horizontalMarginForView:v18];
  double v20 = -(v14 - v19 * 2.0) - v16;

  double v21 = v8 - fmax(v20, 0.0);
  v22 = [(CBSPaneViewController *)self primaryButton];

  if (v22)
  {
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v23 = 184.0;
    }
    else {
      double v23 = 112.0;
    }
    v24 = [(CBSPaneViewController *)self primaryButton];
    v25 = [v24 titleLabel];
    objc_msgSend(v25, "sizeThatFits:", v21, 1.79769313e308);
    double v27 = v26;
    double v29 = v28;

    if (v21 < v27) {
      double v27 = v21;
    }
    UIRoundToViewScale();
    double v31 = v30;
    v32 = [(CBSPaneViewController *)self primaryButton];
    v33 = [v32 titleLabel];
    [v33 _firstLineBaselineOffsetFromBoundsTop];
    double v35 = v10 - v34;
    v36 = [(CBSTableViewController *)self tableView];
    [v36 contentInset];
    double v38 = v35 - v37 - v23;

    v39 = [(CBSTableViewController *)self headerView];
    [v39 frame];
    double v40 = CGRectGetMaxY(v64) + 14.0;

    if (v38 < v40) {
      double v38 = v40;
    }
    v41 = [(CBSPaneViewController *)self primaryButton];
    objc_msgSend(v41, "setFrame:", v31, v38, v27, v29);
  }
  else
  {
    double v31 = *MEMORY[0x263F001A8];
    double v38 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  v42 = [(CBSPaneViewController *)self secondaryButton];

  if (v42)
  {
    v43 = [(CBSPaneViewController *)self secondaryButton];
    v44 = [v43 titleLabel];
    objc_msgSend(v44, "sizeThatFits:", v21, 1.79769313e308);
    CGFloat v45 = v29;
    double v46 = v10;
    double v48 = v47;
    double v61 = v49;

    if (v21 < v48) {
      double v48 = v21;
    }
    UIRoundToViewScale();
    double v51 = v50;
    v52 = [(CBSPaneViewController *)self secondaryButton];
    v53 = [v52 titleLabel];
    [v53 _firstLineBaselineOffsetFromBoundsTop];
    double v55 = v46 - v54;
    v56 = [(CBSTableViewController *)self tableView];
    [v56 contentInset];
    double v58 = v55 - v57 + -24.0;

    v65.origin.x = v31;
    v65.origin.y = v38;
    v65.size.width = v27;
    v65.size.height = v45;
    double v59 = CGRectGetMaxY(v65) + 4.0;
    if (v58 < v59) {
      double v58 = v59;
    }
    v60 = [(CBSPaneViewController *)self secondaryButton];
    objc_msgSend(v60, "setFrame:", v51, v58, v48, v61);
  }
}

- (id)primaryButtonText
{
  return 0;
}

- (id)secondaryButtonText
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)[a3 dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:a4];
}

- (UIButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (UIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end