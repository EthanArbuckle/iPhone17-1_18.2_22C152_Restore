@interface DMCPINEntryViewController
- (BOOL)inProgress;
- (DMCPINEntryViewController)initWithStyle:(unint64_t)a3;
- (DevicePINControllerDelegate)delegate;
- (NSString)descriptionText;
- (UIBarButtonItem)rightBarButtonItem;
- (UILabel)titleLabel;
- (id)_titleFont;
- (id)stringsBundle;
- (unint64_t)style;
- (void)_updateStyle;
- (void)leftBarButtonTapped:(id)a3;
- (void)loadView;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setRightBarButtonItem:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewControllerHasBeenDismissed;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DMCPINEntryViewController

- (DMCPINEntryViewController)initWithStyle:(unint64_t)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)DMCPINEntryViewController;
  v4 = [(DevicePINController *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v6 = (unsigned int *)((char *)v4 + (int)*MEMORY[0x263F5FD30]);
    unsigned int *v6 = 3;
    v4->_style = a3;
    v7 = [MEMORY[0x263F5FBC0] appearance];
    v8 = [MEMORY[0x263F1C550] labelColor];
    [v7 setTextColor:v8];

    v9 = objc_alloc_init(DMCDevicePINPane);
    [(DMCDevicePINPane *)v9 setAutoresizingMask:18];
    [(PSEditingPane *)v9 setDelegate:v5];
    v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v11 = [NSNumber numberWithInt:*v6];
    [v10 setProperty:v11 forKey:@"mode"];

    [(DevicePINController *)v5 setSpecifier:v10];
    [(DevicePINController *)v5 setPane:v9];
    objc_initWeak(&location, v5);
    v19[0] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__DMCPINEntryViewController_initWithStyle___block_invoke;
    v15[3] = &unk_2645E8EB0;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[(DMCPINEntryViewController *)v5 registerForTraitChanges:v12 withHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __43__DMCPINEntryViewController_initWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _titleFont];
  v2 = [WeakRetained titleLabel];
  [v2 setFont:v1];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)DMCPINEntryViewController;
  [(DevicePINController *)&v7 loadView];
  if ([(DMCPINEntryViewController *)self style] == 1)
  {
    v3 = objc_opt_new();
    v4 = [(DMCPINEntryViewController *)self _titleFont];
    [v3 setFont:v4];

    v5 = DMCLocalizedStringByDevice();
    [v3 setText:v5];

    [v3 setTextAlignment:1];
    [v3 setNumberOfLines:2];
    [v3 setAdjustsFontSizeToFitWidth:1];
    [v3 setMinimumScaleFactor:0.5];
    v6 = [(DMCPINEntryViewController *)self view];
    [v6 addSubview:v3];

    [(DMCPINEntryViewController *)self setTitleLabel:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCPINEntryViewController;
  [(DevicePINController *)&v4 viewWillAppear:a3];
  [(DMCPINEntryViewController *)self _updateStyle];
}

- (void)viewControllerHasBeenDismissed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    [v4 didCancelEnteringPIN];
  }
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didCancelEnteringPIN];
  }
}

- (void)_updateStyle
{
  unint64_t v3 = [(DMCPINEntryViewController *)self style];
  id v4 = [(PSDetailController *)self pane];
  [v4 setStyle:v3];

  unint64_t v5 = [(DMCPINEntryViewController *)self style];
  if (v5)
  {
    if (v5 != 1) {
      return;
    }
    v6 = [(PSDetailController *)self pane];
    objc_super v7 = [(DMCPINEntryViewController *)self descriptionText];
    [v6 setTitle:v7];

    v27.width = 1.0;
    v27.height = 1.0;
    UIGraphicsBeginImageContext(v27);
    v8 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v8 set];

    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = 1.0;
    v28.size.height = 1.0;
    UIRectFill(v28);
    UIGraphicsGetImageFromCurrentImageContext();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v9 = [(DMCPINEntryViewController *)self navigationItem];
    [v9 setHidesBackButton:1];

    v10 = [(DMCPINEntryViewController *)self navigationController];
    v11 = [v10 navigationBar];
    [v11 setBackgroundImage:v25 forBarMetrics:0];

    v12 = [(DMCPINEntryViewController *)self navigationController];
    id v13 = [v12 navigationBar];
    v14 = objc_opt_new();
    [v13 setShadowImage:v14];

    v15 = [(DMCPINEntryViewController *)self navigationController];
    id v16 = [v15 navigationBar];
    [v16 setTranslucent:1];

    v17 = [(DMCPINEntryViewController *)self navigationItem];
    [v17 setTitle:0];

    objc_super v18 = [MEMORY[0x263F1C550] systemBackgroundColor];
    v19 = [(DMCPINEntryViewController *)self view];
    [v19 setBackgroundColor:v18];

    if ([(DevicePINController *)self simplePIN])
    {
      v20 = [(DMCPINEntryViewController *)self navigationItem];
      [v20 setRightBarButtonItem:0];
    }
    v21 = [[DMCEnrollmentUIBarButtonItem alloc] initWithType:1 target:self action:sel_leftBarButtonTapped_];
    v22 = [(DMCPINEntryViewController *)self navigationItem];
    [v22 setLeftBarButtonItem:v21];
  }
  else
  {
    v23 = [(DMCPINEntryViewController *)self navigationItem];
    v24 = DMCLocalizedStringByDevice();
    [v23 setTitle:v24];

    id v25 = [(PSDetailController *)self pane];
    DMCLocalizedStringByDevice();
    v21 = (DMCEnrollmentUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    [v25 setTitle:v21];
  }
}

- (void)viewWillLayoutSubviews
{
  v99.receiver = self;
  v99.super_class = (Class)DMCPINEntryViewController;
  [(DevicePINController *)&v99 viewWillLayoutSubviews];
  if ([(DMCPINEntryViewController *)self style] == 1)
  {
    double v3 = kDMCTopMarginForViewController(self);
    id v4 = [(DMCPINEntryViewController *)self navigationController];
    unint64_t v5 = [v4 navigationBar];
    [v5 bounds];
    double v96 = v3 + CGRectGetHeight(v100) + 80.0;

    v6 = [(DMCPINEntryViewController *)self view];
    [v6 bounds];
    CGFloat v7 = CGRectGetWidth(v101) + -30.0;
    v8 = [(DMCPINEntryViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = v7 + v9 * -2.0;

    v11 = [(DMCPINEntryViewController *)self titleLabel];
    double v98 = v10;
    objc_msgSend(v11, "sizeThatFits:", v10, 1.79769313e308);
    double v97 = v12;

    id v13 = [(DMCPINEntryViewController *)self view];
    [v13 safeAreaInsets];
    double v89 = v14;

    v15 = [(PSDetailController *)self pane];
    id v16 = [v15 descriptionLabel];

    v17 = [(PSDetailController *)self pane];
    objc_super v18 = [v17 passcodeField];

    v19 = [(PSDetailController *)self pane];
    [v19 size];
    double v94 = v21;
    double v95 = v20;

    v22 = [(PSDetailController *)self pane];
    [v22 frame];
    CGFloat v92 = v24;
    CGFloat v93 = v23;
    CGFloat v90 = v26;
    CGFloat v91 = v25;

    CGSize v27 = [v16 superview];
    [v16 frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v36 = [(DMCPINEntryViewController *)self view];
    objc_msgSend(v27, "convertRect:toView:", v36, v29, v31, v33, v35);
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v45 = [v18 superview];
    [v18 frame];
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    v54 = [(DMCPINEntryViewController *)self view];
    objc_msgSend(v45, "convertRect:toView:", v54, v47, v49, v51, v53);
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat v62 = v61;

    CGFloat v85 = v40;
    CGFloat v87 = v38;
    v102.origin.x = v38;
    v102.origin.y = v40;
    CGFloat v81 = v44;
    CGFloat v83 = v42;
    v102.size.width = v42;
    v102.size.height = v44;
    double MinY = CGRectGetMinY(v102);
    v64 = [(DMCPINEntryViewController *)self titleLabel];
    [v64 frame];
    double v65 = MinY - CGRectGetMaxY(v103);

    double v66 = v65 + -13.0;
    v104.origin.x = v56;
    v104.origin.y = v58;
    v104.size.width = v60;
    v104.size.height = v62;
    CGFloat v67 = CGRectGetMaxY(v104) - v66;
    v68 = [(DMCPINEntryViewController *)self view];
    [v68 bounds];
    CGFloat v69 = CGRectGetHeight(v105) + -216.0;

    double v70 = 0.0;
    if (v67 > v69)
    {
      v106.origin.x = v56;
      v106.origin.y = v58;
      v106.size.width = v60;
      v106.size.height = v62;
      CGFloat v71 = CGRectGetMaxY(v106) - v66;
      v72 = [(DMCPINEntryViewController *)self view];
      [v72 bounds];
      double v70 = v71 - CGRectGetHeight(v107) + 216.0 + 10.0;
    }
    if (![(DevicePINController *)self simplePIN])
    {
      v108.origin.y = v86;
      v108.origin.x = v88;
      v108.size.height = v82;
      v108.size.width = v84;
      CGFloat v73 = CGRectGetMaxY(v108) + 75.0 - v66;
      v74 = [(DMCPINEntryViewController *)self view];
      [v74 bounds];
      double v75 = v73 - CGRectGetHeight(v109) + 216.0 + 10.0;

      if (v70 < v75) {
        double v70 = v75;
      }
    }
    v110.origin.y = v92;
    v110.origin.x = v93;
    v110.size.height = v90;
    v110.size.width = v91;
    CGFloat v76 = CGRectGetMinY(v110) - v66 - v70;
    v77 = [(PSDetailController *)self pane];
    objc_msgSend(v77, "setFrame:", 0.0, v76, v95, v94);

    v78 = [(DMCPINEntryViewController *)self titleLabel];
    objc_msgSend(v78, "setFrame:", v89 + 15.0, v96 + 15.0 - v70, v98, v97);

    v79 = [(DMCPINEntryViewController *)self view];
    v80 = [(DMCPINEntryViewController *)self titleLabel];
    [v79 bringSubviewToFront:v80];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  unint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 setProperty:v7 forKey:*MEMORY[0x263F60318]];

    v8 = [NSNumber numberWithInt:*(unsigned int *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD30])];
    [v6 setProperty:v8 forKey:@"mode"];

    [(DevicePINController *)self setSpecifier:v6];
    unint64_t v5 = obj;
  }
}

- (void)setInProgress:(BOOL)a3
{
  if (*(&self->_inProgress + 1) != a3)
  {
    BOOL v3 = a3;
    *(&self->_inProgress + 1) = a3;
    if ([(DMCPINEntryViewController *)self style] == 1)
    {
      unint64_t v5 = [(DMCPINEntryViewController *)self navigationItem];
      v6 = [v5 leftBarButtonItem];
      id v7 = v6;
      if (v3)
      {
        [v6 setEnabled:0];

        v8 = [(DMCPINEntryViewController *)self navigationItem];
        double v9 = [v8 rightBarButtonItem];
        [(DMCPINEntryViewController *)self setRightBarButtonItem:v9];

        double v10 = [[DMCEnrollmentUIBarButtonItem alloc] initWithType:3 target:0 action:0];
      }
      else
      {
        [v6 setEnabled:1];

        double v10 = [(DMCPINEntryViewController *)self rightBarButtonItem];
      }
      double v12 = v10;
      v11 = [(DMCPINEntryViewController *)self navigationItem];
      [v11 setRightBarButtonItem:v12];
    }
  }
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (void)leftBarButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didCancelEnteringPIN];
  }
}

- (id)_titleFont
{
  int v2 = MGGetSInt32Answer();
  uint64_t v3 = (void *)MEMORY[0x263F1D2B0];
  if (v2 == 5) {
    uint64_t v3 = (void *)MEMORY[0x263F1D2F8];
  }
  id v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*v3];
  id v5 = (void *)MEMORY[0x263F81708];
  v6 = [v4 fontDescriptorWithSymbolicTraits:2];
  id v7 = [v5 fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (DevicePINControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DevicePINControllerDelegate *)WeakRetained;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)inProgress
{
  return *(&self->_inProgress + 1);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIBarButtonItem)rightBarButtonItem
{
  return self->_rightBarButtonItem;
}

- (void)setRightBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end