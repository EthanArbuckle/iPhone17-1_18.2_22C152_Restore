@interface CPSPermissionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsPullToDismiss;
- (BOOL)locationConfirmationPermissionEnabled;
- (BOOL)notificationPermissionEnabled;
- (CPSPermissionsViewController)init;
- (CPSPermissionsViewController)initWithAppName:(id)a3 backgroundImage:(id)a4;
- (CPSPermissionsViewController)initWithCoder:(id)a3;
- (CPSPermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CPSPermissionsViewControllerDelegate)delegate;
- (UIImage)backgroundImage;
- (void)doneTapped;
- (void)loadView;
- (void)setBackgroundImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3;
- (void)setNotificationPermissionEnabled:(BOOL)a3;
- (void)setUpOptionsContainer;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredContentSizeForCardWidth:(double)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CPSPermissionsViewController

- (void)loadView
{
  v3 = objc_alloc_init(CPSProxCardAutoSizingView);
  [(CPSPermissionsViewController *)self setView:v3];
}

- (CPSPermissionsViewController)initWithAppName:(id)a3 backgroundImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CPSPermissionsViewController;
  v9 = [(CPSPermissionsViewController *)&v33 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    p_appName = &v9->_appName;
    objc_storeStrong((id *)&v9->_appName, a3);
    objc_storeStrong((id *)&v10->_backgroundImage, a4);
    v12 = [CPSPermissionItemView alloc];
    v13 = _CPSLocalizedString();
    v14 = _CPSLocalizedString();
    v15 = NSString;
    _CPSLocalizedString();
    id v32 = v8;
    v17 = id v16 = v7;
    v18 = objc_msgSend(v15, "stringWithFormat:", v17, *p_appName);
    uint64_t v19 = [(CPSPermissionItemView *)v12 initWithTitle:v13 label:v14 description:v18];
    notificationItemView = v10->_notificationItemView;
    v10->_notificationItemView = (CPSPermissionItemView *)v19;

    v21 = [CPSPermissionItemView alloc];
    v22 = _CPSLocalizedString();
    v23 = _CPSLocalizedString();
    v24 = NSString;
    v25 = _CPSLocalizedString();
    v26 = objc_msgSend(v24, "stringWithFormat:", v25, *p_appName);
    v27 = v21;
    id v7 = v16;
    id v8 = v32;
    uint64_t v28 = [(CPSPermissionItemView *)v27 initWithTitle:v22 label:v23 description:v26];
    locationConfirmationItemView = v10->_locationConfirmationItemView;
    v10->_locationConfirmationItemView = (CPSPermissionItemView *)v28;

    v10->_backgroundImageNeedsUpdate = 1;
    v30 = v10;
  }

  return v10;
}

- (CPSPermissionsViewController)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSPermissionsViewController init:] is not available." userInfo:0];
  objc_exception_throw(v2);
}

- (CPSPermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSPermissionsViewController initWithNibName:bundle:] is not available." userInfo:0];
  objc_exception_throw(v7);
}

- (CPSPermissionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[CPSPermissionsViewController initWithCoder:] is not available." userInfo:0];
  objc_exception_throw(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPSPermissionsViewController;
  id v4 = a3;
  [(CPSPermissionsViewController *)&v10 traitCollectionDidChange:v4];
  id v5 = [(CPSPermissionsViewController *)self traitCollection];
  id v6 = objc_msgSend(v5, "cps_invocationCardPreferredContentSizeCategory");

  id v7 = objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");

  LOBYTE(v4) = [v6 isEqual:v7];
  if ((v4 & 1) == 0)
  {
    id v8 = [(CPSPermissionsViewController *)self view];
    v9 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v6];
    [v8 _setLocalOverrideTraitCollection:v9];

    [v8 frame];
    [(CPSPermissionsViewController *)self updatePreferredContentSizeForCardWidth:CGRectGetWidth(v11)];
  }
}

- (void)viewDidLoad
{
  v136[26] = *MEMORY[0x1E4F143B8];
  v135.receiver = self;
  v135.super_class = (Class)CPSPermissionsViewController;
  [(CPSPermissionsViewController *)&v135 viewDidLoad];
  id v3 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:self->_backgroundImage];
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v3;

  [(UIImageView *)self->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_backgroundImageView setContentCompressionResistancePriority:1 forAxis:0.0];
  [(UIImageView *)self->_backgroundImageView setContentHuggingPriority:1 forAxis:0.0];
  [(UIImageView *)self->_backgroundImageView setContentMode:2];
  id v5 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  [(UIImageView *)self->_backgroundImageView setBackgroundColor:v5];

  id v6 = [(CPSPermissionsViewController *)self view];
  [v6 addSubview:self->_backgroundImageView];

  id v7 = objc_alloc(MEMORY[0x1E4F43028]);
  id v8 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  v9 = (void *)[v7 initWithEffect:v8];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v10 = [(CPSPermissionsViewController *)self view];
  [v10 addSubview:v9];

  CGRect v11 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = _CPSLocalizedString();
  [v11 setTitle:v12 forState:0];

  uint64_t v13 = *MEMORY[0x1E4F438A0];
  v14 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
  v15 = [v11 titleLabel];
  [v15 setFont:v14];

  id v16 = [v11 titleLabel];
  [v16 setAdjustsFontForContentSizeCategory:1];

  v17 = v11;
  [v11 addTarget:self action:sel_doneTapped forControlEvents:0x2000];
  LODWORD(v18) = 1148846080;
  [v11 setContentCompressionResistancePriority:0 forAxis:v18];
  uint64_t v19 = [v9 contentView];
  [v19 addSubview:v11];

  v20 = [[CPSVibrantLabel alloc] initWithTextStyle:v13 textVariant:256 vibrancyEffectStyle:0];
  [(CPSVibrantLabel *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = _CPSLocalizedString();
  [(CPSVibrantLabel *)v20 setText:v21];

  [(CPSVibrantLabel *)v20 setAdjustsFontSizeToFitWidth:1];
  v22 = [v9 contentView];
  [v22 addSubview:v20];

  v23 = objc_msgSend(MEMORY[0x1E4F42FF0], "cps_vibrantSeparator");
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [v9 contentView];
  [v24 addSubview:v23];

  id v25 = objc_alloc_init(MEMORY[0x1E4F42DB0]);
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v25 setContentInsetAdjustmentBehavior:2];
  v26 = [v9 contentView];
  [v26 addSubview:v25];

  [(CPSPermissionsViewController *)self setUpOptionsContainer];
  [v25 addSubview:self->_optionsContainer];
  v91 = (void *)MEMORY[0x1E4F28DC8];
  v133 = [v9 topAnchor];
  v134 = [(CPSPermissionsViewController *)self view];
  v132 = [v134 topAnchor];
  v131 = [v133 constraintEqualToAnchor:v132];
  v136[0] = v131;
  v129 = [v9 leadingAnchor];
  v130 = [(CPSPermissionsViewController *)self view];
  v128 = [v130 leadingAnchor];
  v127 = [v129 constraintEqualToAnchor:v128];
  v136[1] = v127;
  v125 = [v9 trailingAnchor];
  v126 = [(CPSPermissionsViewController *)self view];
  v124 = [v126 trailingAnchor];
  v123 = [v125 constraintEqualToAnchor:v124];
  v136[2] = v123;
  v121 = [v9 bottomAnchor];
  v122 = [(CPSPermissionsViewController *)self view];
  v120 = [v122 bottomAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v136[3] = v119;
  v117 = [(UIImageView *)self->_backgroundImageView topAnchor];
  v118 = [v9 contentView];
  v116 = [v118 topAnchor];
  v115 = [v117 constraintEqualToAnchor:v116];
  v136[4] = v115;
  v113 = [(UIImageView *)self->_backgroundImageView leadingAnchor];
  v114 = [v9 contentView];
  v111 = [v114 leadingAnchor];
  v110 = [v113 constraintEqualToAnchor:v111];
  v136[5] = v110;
  v107 = [(UIImageView *)self->_backgroundImageView trailingAnchor];
  v108 = [v9 contentView];
  v106 = [v108 trailingAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v136[6] = v105;
  v103 = [(UIImageView *)self->_backgroundImageView bottomAnchor];
  v104 = [v9 contentView];
  v102 = [v104 bottomAnchor];
  v100 = [v103 constraintEqualToAnchor:v102];
  v136[7] = v100;
  v98 = [(CPSVibrantLabel *)v20 topAnchor];
  v99 = [v9 contentView];
  v97 = [v99 topAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:24.0];
  v136[8] = v96;
  v93 = [(CPSVibrantLabel *)v20 leadingAnchor];
  v94 = [v9 contentView];
  v92 = [v94 leadingAnchor];
  v90 = [v93 constraintEqualToAnchor:v92 constant:24.0];
  v136[9] = v90;
  v89 = [v17 centerYAnchor];
  v88 = [(CPSVibrantLabel *)v20 centerYAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v136[10] = v87;
  v112 = v17;
  v86 = [v17 leadingAnchor];
  v109 = v20;
  v85 = [(CPSVibrantLabel *)v20 trailingAnchor];
  v84 = [v86 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v85 multiplier:1.0];
  v136[11] = v84;
  v83 = [v9 contentView];
  v81 = [v83 trailingAnchor];
  v80 = [v17 trailingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80 constant:24.0];
  v136[12] = v79;
  v78 = [v23 topAnchor];
  v77 = [(CPSVibrantLabel *)v20 bottomAnchor];
  v76 = [v78 constraintEqualToAnchor:v77 constant:24.0];
  v136[13] = v76;
  v74 = [v23 leadingAnchor];
  v75 = [v9 contentView];
  v73 = [v75 leadingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v136[14] = v72;
  v101 = v23;
  v70 = [v23 trailingAnchor];
  v71 = [v9 contentView];
  v69 = [v71 trailingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v136[15] = v68;
  v67 = [v25 topAnchor];
  v66 = [v23 bottomAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v136[16] = v65;
  v27 = v25;
  v63 = [v25 leadingAnchor];
  v64 = [v9 contentView];
  v62 = [v64 leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v136[17] = v61;
  v59 = [v25 trailingAnchor];
  v95 = v9;
  v60 = [v9 contentView];
  v58 = [v60 trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v136[18] = v57;
  v56 = [v9 bottomAnchor];
  v55 = [v25 bottomAnchor];
  v54 = [v56 constraintGreaterThanOrEqualToAnchor:v55];
  v136[19] = v54;
  v53 = [(UIView *)self->_optionsContainer topAnchor];
  v52 = [v25 topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v136[20] = v51;
  v50 = [(UIView *)self->_optionsContainer leadingAnchor];
  v49 = [v25 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v136[21] = v48;
  v47 = [(UIView *)self->_optionsContainer trailingAnchor];
  v46 = [v25 trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v136[22] = v45;
  v44 = [(UIView *)self->_optionsContainer bottomAnchor];
  v43 = [v25 bottomAnchor];
  uint64_t v28 = [v44 constraintEqualToAnchor:v43];
  v136[23] = v28;
  v82 = v27;
  v29 = [v27 widthAnchor];
  v30 = [(UIView *)self->_optionsContainer widthAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v136[24] = v31;
  id v32 = [v27 heightAnchor];
  objc_super v33 = [(UIView *)self->_optionsContainer heightAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  LODWORD(v35) = 1132068864;
  v36 = objc_msgSend(v34, "cps_setPriority:", v35);
  v136[25] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:26];
  [v91 activateConstraints:v37];

  v38 = (void *)MEMORY[0x1E4F42F80];
  v39 = [(CPSPermissionsViewController *)self traitCollection];
  v40 = objc_msgSend(v39, "cps_invocationCardPreferredContentSizeCategory");
  v41 = [v38 traitCollectionWithPreferredContentSizeCategory:v40];
  v42 = [(CPSPermissionsViewController *)self view];
  [v42 _setLocalOverrideTraitCollection:v41];
}

- (void)setUpOptionsContainer
{
  v28[7] = *MEMORY[0x1E4F143B8];
  id v3 = (UIView *)objc_opt_new();
  optionsContainer = self->_optionsContainer;
  self->_optionsContainer = v3;

  [(UIView *)self->_optionsContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSPermissionItemView *)self->_notificationItemView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_optionsContainer addSubview:self->_notificationItemView];
  [(CPSPermissionItemView *)self->_locationConfirmationItemView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_optionsContainer addSubview:self->_locationConfirmationItemView];
  uint64_t v19 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(CPSPermissionItemView *)self->_locationConfirmationItemView topAnchor];
  v26 = [(UIView *)self->_optionsContainer topAnchor];
  id v25 = [v27 constraintEqualToAnchor:v26 constant:24.0];
  v28[0] = v25;
  v24 = [(CPSPermissionItemView *)self->_locationConfirmationItemView leadingAnchor];
  v23 = [(UIView *)self->_optionsContainer leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:24.0];
  v28[1] = v22;
  v21 = [(UIView *)self->_optionsContainer trailingAnchor];
  v20 = [(CPSPermissionItemView *)self->_locationConfirmationItemView trailingAnchor];
  double v18 = [v21 constraintEqualToAnchor:v20 constant:24.0];
  v28[2] = v18;
  v17 = [(CPSPermissionItemView *)self->_notificationItemView topAnchor];
  id v16 = [(CPSPermissionItemView *)self->_locationConfirmationItemView bottomAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:32.0];
  v28[3] = v15;
  id v5 = [(CPSPermissionItemView *)self->_notificationItemView leadingAnchor];
  id v6 = [(UIView *)self->_optionsContainer leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6 constant:24.0];
  v28[4] = v7;
  id v8 = [(UIView *)self->_optionsContainer trailingAnchor];
  v9 = [(CPSPermissionItemView *)self->_notificationItemView trailingAnchor];
  objc_super v10 = [v8 constraintEqualToAnchor:v9 constant:24.0];
  v28[5] = v10;
  CGRect v11 = [(UIView *)self->_optionsContainer bottomAnchor];
  v12 = [(CPSPermissionItemView *)self->_notificationItemView bottomAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:32.0];
  v28[6] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
  [v19 activateConstraints:v14];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CPSPermissionsViewController;
  [(CPSPermissionsViewController *)&v5 viewDidLayoutSubviews];
  if (self->_backgroundImageNeedsUpdate)
  {
    self->_backgroundImageNeedsUpdate = 0;
    double v3 = 0.0;
    if (self->_backgroundImage) {
      double v3 = 1.0;
    }
    [(UIImageView *)self->_backgroundImageView setAlpha:v3];
    [(CPSPermissionItemView *)self->_notificationItemView setHasBlurEffect:self->_backgroundImage != 0];
    [(CPSPermissionItemView *)self->_locationConfirmationItemView setHasBlurEffect:self->_backgroundImage != 0];
  }
  id v4 = [(CPSPermissionsViewController *)self view];
  [v4 frame];
  [(CPSPermissionsViewController *)self updatePreferredContentSizeForCardWidth:CGRectGetWidth(v6)];
}

- (void)setBackgroundImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    CGRect v6 = [(CPSPermissionsViewController *)self view];
    [v6 layoutIfNeeded];

    objc_storeStrong((id *)&self->_backgroundImage, a3);
    [(UIImageView *)self->_backgroundImageView setImage:self->_backgroundImage];
    self->_backgroundImageNeedsUpdate = 1;
    id v7 = [(CPSPermissionsViewController *)self view];
    [v7 setNeedsLayout];

    id v8 = (void *)MEMORY[0x1E4F42FF0];
    v9 = [(CPSPermissionsViewController *)self view];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CPSPermissionsViewController_setBackgroundImage___block_invoke;
    v10[3] = &unk_1E6AE8DF0;
    v10[4] = self;
    [v8 transitionWithView:v9 duration:5242880 options:v10 animations:0 completion:0.5];
  }
}

void __51__CPSPermissionsViewController_setBackgroundImage___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)doneTapped
{
  double v3 = [(CPSPermissionsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CPSPermissionsViewController *)self delegate];
    [v5 permissionsViewControllerDidFinish:self];
  }
}

- (BOOL)notificationPermissionEnabled
{
  return [(CPSPermissionItemView *)self->_notificationItemView isOn];
}

- (void)setNotificationPermissionEnabled:(BOOL)a3
{
}

- (BOOL)locationConfirmationPermissionEnabled
{
  return [(CPSPermissionItemView *)self->_locationConfirmationItemView isOn];
}

- (void)setLocationConfirmationPermissionEnabled:(BOOL)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  id v7 = [(CPSPermissionsViewController *)self view];
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v5, v6);
  -[CPSPermissionsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)allowsPullToDismiss
{
  return 1;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (CPSPermissionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSPermissionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_locationConfirmationItemView, 0);
  objc_storeStrong((id *)&self->_notificationItemView, 0);
  objc_storeStrong((id *)&self->_optionsContainer, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end