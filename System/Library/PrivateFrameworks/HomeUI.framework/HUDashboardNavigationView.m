@interface HUDashboardNavigationView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hasTitleAction;
- (HUDashboardNavigationView)initWithCoder:(id)a3;
- (HUDashboardNavigationView)initWithFrame:(CGRect)a3;
- (HUDashboardNavigationViewDelegate)delegate;
- (NSArray)allConstraints;
- (NSDictionary)largeTitleTextAttributes;
- (NSString)headerTitle;
- (NSString)title;
- (UIButton)homeAppButton;
- (UIButton)titleButton;
- (UILabel)headerTitleLabel;
- (UIView)separatorView;
- (UIVisualEffectView)headerTitleLabelEffectView;
- (UIVisualEffectView)titleButtonEffectView;
- (void)_didTapHomeAppButton:(id)a3;
- (void)_didTapLargeTitleButton:(id)a3;
- (void)_rotateChevronButtonToAngle:(double)a3;
- (void)_updateTitleButton;
- (void)layoutSubviews;
- (void)rotateChevronDown;
- (void)rotateChevronUp;
- (void)setAllConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasTitleAction:(BOOL)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderTitleLabel:(id)a3;
- (void)setHeaderTitleLabelEffectView:(id)a3;
- (void)setHomeAppButton:(id)a3;
- (void)setLargeTitleTextAttributes:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleButton:(id)a3;
- (void)setTitleButtonEffectView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUDashboardNavigationView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUDashboardNavigationView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDashboardNavigationView.m", 61, @"%s is unavailable; use %@ instead",
    "-[HUDashboardNavigationView initWithCoder:]",
    v6);

  return 0;
}

- (HUDashboardNavigationView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)HUDashboardNavigationView;
  v3 = -[HUDashboardNavigationView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUDashboardNavigationView *)v3 setTitle:&stru_1F18F92B8];
    [(HUDashboardNavigationView *)v4 setHeaderTitle:0];
    v4->_hasTitleAction = 1;
    v5 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v5];
    headerTitleLabelEffectView = v4->_headerTitleLabelEffectView;
    v4->_headerTitleLabelEffectView = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v4->_headerTitleLabelEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUDashboardNavigationView *)v4 addSubview:v4->_headerTitleLabelEffectView];
    id v8 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    headerTitleLabel = v4->_headerTitleLabel;
    v4->_headerTitleLabel = (UILabel *)v9;

    v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [(UILabel *)v4->_headerTitleLabel setFont:v11];

    v12 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v4->_headerTitleLabel setTextColor:v12];

    [(UILabel *)v4->_headerTitleLabel setLineBreakMode:4];
    [(UILabel *)v4->_headerTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(UIVisualEffectView *)v4->_headerTitleLabelEffectView contentView];
    [v13 addSubview:v4->_headerTitleLabel];

    v14 = [MEMORY[0x1E4F42FE8] controlCenterPrimaryVibrancyEffect];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v14];
    titleButtonEffectView = v4->_titleButtonEffectView;
    v4->_titleButtonEffectView = (UIVisualEffectView *)v15;

    [(UIVisualEffectView *)v4->_titleButtonEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUDashboardNavigationView *)v4 addSubview:v4->_titleButtonEffectView];
    uint64_t v17 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    titleButton = v4->_titleButton;
    v4->_titleButton = (UIButton *)v17;

    [(UIButton *)v4->_titleButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(UIButton *)v4->_titleButton titleLabel];
    [v19 setLineBreakMode:4];

    -[UIButton setContentEdgeInsets:](v4->_titleButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 4.0);
    v20 = [(UIVisualEffectView *)v4->_titleButtonEffectView contentView];
    [v20 addSubview:v4->_titleButton];

    v21 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIButton *)v4->_titleButton setTintColor:v21];

    if ([(HUDashboardNavigationView *)v4 effectiveUserInterfaceLayoutDirection] == 1) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 1;
    }
    [(UIButton *)v4->_titleButton setContentHorizontalAlignment:v22];
    if ([(HUDashboardNavigationView *)v4 effectiveUserInterfaceLayoutDirection] == 1) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 4;
    }
    [(UIButton *)v4->_titleButton setSemanticContentAttribute:v23];
    [(HUDashboardNavigationView *)v4 _updateTitleButton];
    uint64_t v24 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    homeAppButton = v4->_homeAppButton;
    v4->_homeAppButton = (UIButton *)v24;

    [(UIButton *)v4->_homeAppButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIButton *)v4->_homeAppButton setTintColor:v26];

    v27 = [(UIButton *)v4->_homeAppButton imageView];
    [v27 setContentMode:1];

    [(UIButton *)v4->_homeAppButton addTarget:v4 action:sel__didTapHomeAppButton_ forControlEvents:64];
    v28 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:48.0];
    v29 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
    v30 = [v29 imageWithConfiguration:v28];
    v31 = [v30 imageWithRenderingMode:2];

    [(UIButton *)v4->_homeAppButton setImage:v31 forState:0];
    [(HUDashboardNavigationView *)v4 addSubview:v4->_homeAppButton];
    uint64_t v32 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v32;

    [(UIView *)v4->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUDashboardNavigationView *)v4 addSubview:v4->_separatorView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUDashboardNavigationView;
  [(HUDashboardNavigationView *)&v18 layoutSubviews];
  v3 = [(HUDashboardNavigationView *)self titleButton];
  v4 = [v3 titleLabel];
  v5 = [v4 font];
  [v5 ascender];
  double v7 = v6 + -22.0;
  id v8 = [(HUDashboardNavigationView *)self titleButton];
  [v8 imageEdgeInsets];
  double v10 = v9;
  v11 = [(HUDashboardNavigationView *)self titleButton];
  [v11 imageEdgeInsets];
  double v13 = v12;
  v14 = [(HUDashboardNavigationView *)self titleButton];
  [v14 imageEdgeInsets];
  double v16 = v15;
  uint64_t v17 = [(HUDashboardNavigationView *)self titleButton];
  objc_msgSend(v17, "setImageEdgeInsets:", v7, v10, v13, v16);
}

- (void)rotateChevronUp
{
}

- (void)rotateChevronDown
{
}

- (void)_rotateChevronButtonToAngle:(double)a3
{
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, a3);
  v4 = [(HUDashboardNavigationView *)self titleButton];
  v5 = [v4 imageView];
  double v6 = v5;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransform t2 = v12;
  BOOL v7 = CGAffineTransformEqualToTransform(&t1, &t2);

  if (!v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    CGAffineTransform v9 = v12;
    v8[2] = __57__HUDashboardNavigationView__rotateChevronButtonToAngle___block_invoke;
    v8[3] = &unk_1E6385C78;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v8 usingSpringWithDamping:&__block_literal_global_54 initialSpringVelocity:1.0 options:0.0 animations:0.5 completion:0.0];
  }
}

void __57__HUDashboardNavigationView__rotateChevronButtonToAngle___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "titleButton", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  v2 = [v1 imageView];
  [v2 setTransform:&v3];
}

- (void)_didTapLargeTitleButton:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    double v10 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ User tapped large title button", (uint8_t *)&v9, 0xCu);
  }

  double v6 = [(HUDashboardNavigationView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HUDashboardNavigationView *)self delegate];
    [v8 dashboardNavigationView:self didTapLargeTitleButton:v4];
  }
}

- (void)_didTapHomeAppButton:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CGAffineTransform v12 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ User tapped Home app button", buf, 0xCu);
  }

  double v6 = [(HUDashboardNavigationView *)self delegate];
  [v6 dashboardNavigationView:self didTapHomeAppButton:v4];

  char v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  double v10 = [v7 stringWithFormat:@"%@-homeAppButton", v9];

  [MEMORY[0x1E4F68EE0] sendGeneralButtonTapEventWithButtonTitle:v10 sourceViewController:0];
}

- (NSString)title
{
  v2 = [(HUDashboardNavigationView *)self titleButton];
  long long v3 = [v2 currentAttributedTitle];
  id v4 = [v3 string];

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(HUDashboardNavigationView *)self title];
  id v19 = v4;
  id v6 = v5;
  if (v6 == v19)
  {
    char v7 = 1;
  }
  else if (v19)
  {
    char v7 = [v19 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  id v8 = v19;
  if (v19 && (v7 & 1) == 0)
  {
    int v9 = [(HUDashboardNavigationView *)self largeTitleTextAttributes];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F42BF0]);
      uint64_t v11 = [v10 largeTitleTextAttributes];
      [(HUDashboardNavigationView *)self setLargeTitleTextAttributes:v11];
    }
    CGAffineTransform v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v19];
    uint64_t v13 = [(HUDashboardNavigationView *)self largeTitleTextAttributes];
    v14 = objc_msgSend(v12, "hf_attributedStringWithDefaultAttributes:", v13);
    double v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = [(HUDashboardNavigationView *)self effectiveUserInterfaceLayoutDirection];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    if (v16 == 1) {
      [v15 insertAttributedString:v17 atIndex:0];
    }
    else {
      [v15 appendAttributedString:v17];
    }

    objc_super v18 = [(HUDashboardNavigationView *)self titleButton];
    [v18 setAttributedTitle:v15 forState:0];

    id v8 = v19;
  }
}

- (NSString)headerTitle
{
  v2 = [(HUDashboardNavigationView *)self headerTitleLabel];
  long long v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setHeaderTitle:(id)a3
{
  id v4 = a3;
  v5 = [(HUDashboardNavigationView *)self headerTitle];
  id v10 = v4;
  id v6 = v5;
  if (v6 == v10)
  {

    goto LABEL_8;
  }
  if (!v10)
  {

    goto LABEL_7;
  }
  char v7 = [v10 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = [(HUDashboardNavigationView *)self headerTitleLabel];
    [v8 setText:v10];

    int v9 = [(HUDashboardNavigationView *)self headerTitleLabel];
    [v9 sizeToFit];

    [(HUDashboardNavigationView *)self setNeedsUpdateConstraints];
  }
LABEL_8:
}

- (void)setHasTitleAction:(BOOL)a3
{
  if (self->_hasTitleAction != a3)
  {
    self->_hasTitleAction = a3;
    [(HUDashboardNavigationView *)self _updateTitleButton];
  }
}

- (void)updateConstraints
{
  v118[23] = *MEMORY[0x1E4F143B8];
  v117.receiver = self;
  v117.super_class = (Class)HUDashboardNavigationView;
  [(HUDashboardNavigationView *)&v117 updateConstraints];
  long long v3 = [(HUDashboardNavigationView *)self allConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    v5 = [(HUDashboardNavigationView *)self allConstraints];
    [v4 deactivateConstraints:v5];
  }
  v116 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v115 = [v116 topAnchor];
  v114 = [(HUDashboardNavigationView *)self topAnchor];
  v113 = [v115 constraintEqualToAnchor:v114];
  v118[0] = v113;
  v112 = [(HUDashboardNavigationView *)self headerTitleLabel];
  v110 = [v112 topAnchor];
  v111 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v109 = [v111 topAnchor];
  v108 = [v110 constraintEqualToAnchor:v109];
  v118[1] = v108;
  v107 = [(HUDashboardNavigationView *)self headerTitleLabel];
  v105 = [v107 bottomAnchor];
  v106 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v104 = [v106 bottomAnchor];
  v103 = [v105 constraintEqualToAnchor:v104];
  v118[2] = v103;
  v102 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v100 = [v102 bottomAnchor];
  v101 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v99 = [v101 topAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v118[3] = v98;
  v97 = [(HUDashboardNavigationView *)self titleButton];
  v95 = [v97 topAnchor];
  v96 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v94 = [v96 topAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v118[4] = v93;
  v92 = [(HUDashboardNavigationView *)self titleButton];
  v90 = [v92 bottomAnchor];
  v91 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v89 = [v91 bottomAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v118[5] = v88;
  v87 = [(HUDashboardNavigationView *)self homeAppButton];
  v85 = [v87 bottomAnchor];
  v86 = [(HUDashboardNavigationView *)self titleButton];
  v84 = [v86 bottomAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v118[6] = v83;
  v82 = [(HUDashboardNavigationView *)self separatorView];
  v80 = [v82 topAnchor];
  v81 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v79 = [v81 bottomAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:18.0];
  v118[7] = v78;
  v77 = [(HUDashboardNavigationView *)self separatorView];
  v75 = [v77 bottomAnchor];
  v76 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v74 = [v76 bottomAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v118[8] = v73;
  v72 = [(HUDashboardNavigationView *)self separatorView];
  v71 = [v72 heightAnchor];
  v70 = [v71 constraintEqualToConstant:0.75];
  v118[9] = v70;
  v69 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v67 = [v69 leadingAnchor];
  v68 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v66 = [v68 leadingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v118[10] = v65;
  v64 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v62 = [v64 trailingAnchor];
  v63 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v61 = [v63 trailingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v118[11] = v60;
  v59 = [(HUDashboardNavigationView *)self headerTitleLabel];
  v57 = [v59 leadingAnchor];
  v58 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v56 = [v58 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v118[12] = v55;
  v54 = [(HUDashboardNavigationView *)self headerTitleLabel];
  v51 = [v54 trailingAnchor];
  v52 = [(HUDashboardNavigationView *)self headerTitleLabelEffectView];
  v50 = [v52 trailingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v118[13] = v49;
  v48 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v46 = [v48 leadingAnchor];
  v47 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v45 = [v47 leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v118[14] = v44;
  v43 = [(HUDashboardNavigationView *)self titleButton];
  v41 = [v43 leadingAnchor];
  v42 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v118[15] = v39;
  v38 = [(HUDashboardNavigationView *)self titleButton];
  v36 = [v38 trailingAnchor];
  v37 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  objc_super v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v118[16] = v34;
  v33 = [(HUDashboardNavigationView *)self homeAppButton];
  v31 = [v33 leadingAnchor];
  uint64_t v32 = [(HUDashboardNavigationView *)self titleButtonEffectView];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30];
  v118[17] = v29;
  v28 = [(HUDashboardNavigationView *)self homeAppButton];
  v26 = [v28 trailingAnchor];
  v27 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v25 = [v27 trailingAnchor];
  uint64_t v24 = [v26 constraintEqualToAnchor:v25];
  v118[18] = v24;
  uint64_t v23 = [(HUDashboardNavigationView *)self separatorView];
  v21 = [v23 leadingAnchor];
  uint64_t v22 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  v20 = [v22 leadingAnchor];
  id v19 = [v21 constraintEqualToAnchor:v20];
  v118[19] = v19;
  objc_super v18 = [(HUDashboardNavigationView *)self separatorView];
  uint64_t v17 = [v18 trailingAnchor];
  id v6 = [(HUDashboardNavigationView *)self safeAreaLayoutGuide];
  char v7 = [v6 trailingAnchor];
  id v8 = [v17 constraintEqualToAnchor:v7];
  v118[20] = v8;
  int v9 = [(HUDashboardNavigationView *)self homeAppButton];
  id v10 = [v9 heightAnchor];
  uint64_t v11 = [v10 constraintEqualToConstant:48.0];
  v118[21] = v11;
  CGAffineTransform v12 = [(HUDashboardNavigationView *)self homeAppButton];
  uint64_t v13 = [v12 widthAnchor];
  v14 = [v13 constraintEqualToConstant:48.0];
  v118[22] = v14;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:23];

  [(HUDashboardNavigationView *)self setAllConstraints:v53];
  double v15 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v16 = [(HUDashboardNavigationView *)self allConstraints];
  [v15 activateConstraints:v16];
}

- (void)_updateTitleButton
{
  BOOL v3 = [(HUDashboardNavigationView *)self hasTitleAction];
  id v4 = [(HUDashboardNavigationView *)self titleButton];
  [v4 setUserInteractionEnabled:v3];

  if ([(HUDashboardNavigationView *)self hasTitleAction])
  {
    id v11 = [MEMORY[0x1E4F42A98] configurationWithWeight:6];
    v5 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.down"];
    id v6 = [v5 imageWithConfiguration:v11];
    char v7 = [v6 imageWithRenderingMode:2];

    id v8 = [(HUDashboardNavigationView *)self titleButton];
    [v8 setImage:v7 forState:0];

    int v9 = [(HUDashboardNavigationView *)self titleButton];
    [v9 addTarget:self action:sel__didTapLargeTitleButton_ forControlEvents:64];
  }
  else
  {
    id v10 = [(HUDashboardNavigationView *)self titleButton];
    [v10 setImage:0 forState:0];

    id v11 = [(HUDashboardNavigationView *)self titleButton];
    [v11 removeTarget:self action:sel__didTapLargeTitleButton_ forControlEvents:64];
  }
}

- (HUDashboardNavigationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUDashboardNavigationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIVisualEffectView)headerTitleLabelEffectView
{
  return self->_headerTitleLabelEffectView;
}

- (void)setHeaderTitleLabelEffectView:(id)a3
{
}

- (UIVisualEffectView)titleButtonEffectView
{
  return self->_titleButtonEffectView;
}

- (void)setTitleButtonEffectView:(id)a3
{
}

- (UIButton)homeAppButton
{
  return self->_homeAppButton;
}

- (void)setHomeAppButton:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (BOOL)hasTitleAction
{
  return self->_hasTitleAction;
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
}

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (NSDictionary)largeTitleTextAttributes
{
  return self->_largeTitleTextAttributes;
}

- (void)setLargeTitleTextAttributes:(id)a3
{
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_largeTitleTextAttributes, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_homeAppButton, 0);
  objc_storeStrong((id *)&self->_titleButtonEffectView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabelEffectView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end