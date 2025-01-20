@interface ContinuityCaptureShieldUIContentView
- (BOOL)_shouldShowFaceTimeButton;
- (BOOL)_shouldShowFavoritesButton;
- (ContinuityCaptureShieldUICAPackageView)animationView;
- (ContinuityCaptureShieldUIContentView)initWithFrame:(CGRect)a3;
- (ContinuityCaptureShieldUIContentViewDelegate)delegate;
- (NSLayoutConstraint)descriptionLeadingAnchor;
- (NSLayoutConstraint)descriptionTrailingAnchor;
- (UIButton)disconnectButton;
- (UIButton)faceTimeButton;
- (UIButton)favoritesButton;
- (UIButton)pauseButton;
- (UIButton)skipButton;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)animationViewContainer;
- (double)_defaultButtonPadding;
- (double)_defaultButtonScreenWidth;
- (double)_defaultDescriptionPadding;
- (double)_defaultDescriptionScreenWidth;
- (double)_imageToTextPadding;
- (double)_textToButtonsPadding;
- (id)_defaultButtonTextFont;
- (id)_defaultImageSymbolConfiguration;
- (id)_defaultSecondaryTextColor;
- (id)_defaultSecondaryTextFont;
- (id)_defaultTextColor;
- (id)_defaultTextFont;
- (id)_disconnectButtonConfiguration;
- (id)_facetimeButtonConfiguration;
- (id)_favoritesButtonConfiguration;
- (id)_pauseButtonConfiguration;
- (id)_skipButtonConfiguration;
- (void)_setPullFaceTimeButtonLoading:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setInFaceTimeSession:(BOOL)a3;
- (void)setInPlacementStep:(BOOL)a3;
- (void)setIsDedicatedSession:(BOOL)a3;
- (void)setPauseButtonState:(unint64_t)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
@end

@implementation ContinuityCaptureShieldUIContentView

- (ContinuityCaptureShieldUIContentView)initWithFrame:(CGRect)a3
{
  v160.receiver = self;
  v160.super_class = (Class)ContinuityCaptureShieldUIContentView;
  v3 = -[ContinuityCaptureShieldUIContentView initWithFrame:](&v160, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v148 = objc_alloc_init((Class)UILayoutGuide);
    [(ContinuityCaptureShieldUIContentView *)v3 addLayoutGuide:v148];
    v4 = +[UIDevice currentDevice];
    BOOL v5 = [v4 userInterfaceIdiom] == (id)1;

    if (v5)
    {
      v146 = [v148 widthAnchor];
      v143 = [v146 constraintEqualToConstant:620.0];
      v167[0] = v143;
      v139 = [v148 centerXAnchor];
      v135 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v132 = [v135 centerXAnchor];
      v129 = [v139 constraintEqualToAnchor:v132];
      v167[1] = v129;
      v126 = [v148 topAnchor];
      v123 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v6 = [v123 topAnchor];
      v7 = [v126 constraintEqualToAnchor:v6];
      v167[2] = v7;
      v8 = [v148 bottomAnchor];
      v9 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v10 = [v9 bottomAnchor];
      v11 = [v8 constraintEqualToAnchor:v10 constant:-35.0];
      v167[3] = v11;
      v12 = +[NSArray arrayWithObjects:v167 count:4];
      +[NSLayoutConstraint activateConstraints:v12];
    }
    else
    {
      v146 = [v148 leftAnchor];
      v143 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v139 = [v143 leftAnchor];
      v135 = [v146 constraintEqualToAnchor:v139];
      v166[0] = v135;
      v132 = [v148 rightAnchor];
      v129 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v126 = [v129 rightAnchor];
      v123 = [v132 constraintEqualToAnchor:v126];
      v166[1] = v123;
      v6 = [v148 topAnchor];
      v7 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v8 = [v7 topAnchor];
      v9 = [v6 constraintEqualToAnchor:v8];
      v166[2] = v9;
      v10 = [v148 bottomAnchor];
      v11 = [(ContinuityCaptureShieldUIContentView *)v3 safeAreaLayoutGuide];
      v12 = [v11 bottomAnchor];
      v13 = [v10 constraintEqualToAnchor:v12 constant:-15.0];
      v166[3] = v13;
      v14 = +[NSArray arrayWithObjects:v166 count:4];
      +[NSLayoutConstraint activateConstraints:v14];
    }
    v15 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    accessibilityScrollView = v3->_accessibilityScrollView;
    v3->_accessibilityScrollView = v15;

    [(UIScrollView *)v3->_accessibilityScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v3->_accessibilityScrollView setBounces:0];
    [(UIScrollView *)v3->_accessibilityScrollView setClipsToBounds:0];
    [(ContinuityCaptureShieldUIContentView *)v3 addSubview:v3->_accessibilityScrollView];
    v147 = [(UIScrollView *)v3->_accessibilityScrollView topAnchor];
    v144 = [v148 topAnchor];
    v140 = [v147 constraintEqualToAnchor:v144];
    v165[0] = v140;
    v136 = [(UIScrollView *)v3->_accessibilityScrollView bottomAnchor];
    v133 = [v148 bottomAnchor];
    v17 = [v136 constraintEqualToAnchor:v133];
    v165[1] = v17;
    v18 = [(UIScrollView *)v3->_accessibilityScrollView leadingAnchor];
    v19 = [v148 leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v165[2] = v20;
    v21 = [(UIScrollView *)v3->_accessibilityScrollView trailingAnchor];
    v22 = [v148 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v165[3] = v23;
    v24 = +[NSArray arrayWithObjects:v165 count:4];
    +[NSLayoutConstraint activateConstraints:v24];

    v25 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v3->_containerView;
    v3->_containerView = v25;

    [(UIView *)v3->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_containerView setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
    [(UIScrollView *)v3->_accessibilityScrollView addSubview:v3->_containerView];
    v27 = [(UIView *)v3->_containerView heightAnchor];
    v28 = [(UIScrollView *)v3->_accessibilityScrollView heightAnchor];
    v145 = [v27 constraintEqualToAnchor:v28];

    LODWORD(v29) = 1132068864;
    [v145 setPriority:v29];
    v137 = [(UIView *)v3->_containerView topAnchor];
    v141 = [(UIScrollView *)v3->_accessibilityScrollView contentLayoutGuide];
    v134 = [v141 topAnchor];
    v130 = [v137 constraintEqualToAnchor:v134];
    v164[0] = v130;
    v124 = [(UIView *)v3->_containerView bottomAnchor];
    v127 = [(UIScrollView *)v3->_accessibilityScrollView contentLayoutGuide];
    v121 = [v127 bottomAnchor];
    v119 = [v124 constraintEqualToAnchor:v121];
    v164[1] = v119;
    v115 = [(UIView *)v3->_containerView leadingAnchor];
    v117 = [(UIScrollView *)v3->_accessibilityScrollView contentLayoutGuide];
    v113 = [v117 leadingAnchor];
    v111 = [v115 constraintEqualToAnchor:v113];
    v164[2] = v111;
    v109 = [(UIView *)v3->_containerView trailingAnchor];
    v30 = [(UIScrollView *)v3->_accessibilityScrollView contentLayoutGuide];
    v31 = [v30 trailingAnchor];
    v32 = [v109 constraintEqualToAnchor:v31];
    v164[3] = v32;
    v33 = [(UIView *)v3->_containerView widthAnchor];
    v34 = [(UIScrollView *)v3->_accessibilityScrollView frameLayoutGuide];
    v35 = [v34 widthAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    v164[4] = v36;
    v164[5] = v145;
    v37 = +[NSArray arrayWithObjects:v164 count:6];
    +[NSLayoutConstraint activateConstraints:v37];

    v38 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v38;

    [(UIImageView *)v3->_imageView setContentMode:1];
    v40 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultImageTintColor];
    [(UIImageView *)v3->_imageView setTintColor:v40];

    v41 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultImageSymbolConfiguration];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v41];

    [(UIImageView *)v3->_imageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v42 = (UIView *)objc_alloc_init((Class)UIView);
    animationViewContainer = v3->_animationViewContainer;
    v3->_animationViewContainer = v42;

    [(UIView *)v3->_animationViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_animationViewContainer setHidden:1];
    v44 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v44;

    v46 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultTextFont];
    [(UILabel *)v3->_titleLabel setFont:v46];

    v47 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultTextColor];
    [(UILabel *)v3->_titleLabel setTextColor:v47];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v48 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v48;

    v50 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultSecondaryTextFont];
    [(UILabel *)v3->_subtitleLabel setFont:v50];

    v51 = [(ContinuityCaptureShieldUIContentView *)v3 _defaultSecondaryTextColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v51];

    [(UILabel *)v3->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    id v52 = objc_alloc((Class)UIStackView);
    v163[0] = v3->_animationViewContainer;
    v163[1] = v3->_imageView;
    v163[2] = v3->_titleLabel;
    v163[3] = v3->_subtitleLabel;
    v53 = +[NSArray arrayWithObjects:v163 count:4];
    v54 = (UIStackView *)[v52 initWithArrangedSubviews:v53];
    descriptionStackView = v3->_descriptionStackView;
    v3->_descriptionStackView = v54;

    [(UIStackView *)v3->_descriptionStackView setAlignment:3];
    [(UIStackView *)v3->_descriptionStackView setAxis:1];
    v56 = v3->_descriptionStackView;
    [(ContinuityCaptureShieldUIContentView *)v3 _imageToTextPadding];
    -[UIStackView setCustomSpacing:afterView:](v56, "setCustomSpacing:afterView:", v3->_imageView);
    v57 = v3->_descriptionStackView;
    [(ContinuityCaptureShieldUIContentView *)v3 _defaultDescriptionPadding];
    -[UIStackView setCustomSpacing:afterView:](v57, "setCustomSpacing:afterView:", v3->_titleLabel);
    objc_initWeak(&location, v3);
    v157[0] = _NSConcreteStackBlock;
    v157[1] = 3221225472;
    v157[2] = sub_100004108;
    v157[3] = &unk_1000145B0;
    objc_copyWeak(&v158, &location);
    v142 = +[UIAction actionWithHandler:v157];
    v58 = [(ContinuityCaptureShieldUIContentView *)v3 _pauseButtonConfiguration];
    uint64_t v59 = +[UIButton buttonWithConfiguration:v58 primaryAction:v142];
    pauseButton = v3->_pauseButton;
    v3->_pauseButton = (UIButton *)v59;

    v61 = [(UIButton *)v3->_pauseButton titleLabel];
    [v61 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_pauseButton setAccessibilityIdentifier:@"ShieldUI.pauseButton"];
    v155[0] = _NSConcreteStackBlock;
    v155[1] = 3221225472;
    v155[2] = sub_1000041EC;
    v155[3] = &unk_1000145B0;
    objc_copyWeak(&v156, &location);
    v138 = +[UIAction actionWithHandler:v155];
    v62 = [(ContinuityCaptureShieldUIContentView *)v3 _facetimeButtonConfiguration];
    uint64_t v63 = +[UIButton buttonWithConfiguration:v62 primaryAction:v138];
    faceTimeButton = v3->_faceTimeButton;
    v3->_faceTimeButton = (UIButton *)v63;

    v3->_inFaceTimeSession = 0;
    [(UIButton *)v3->_faceTimeButton setHidden:1];
    v65 = [(UIButton *)v3->_faceTimeButton titleLabel];
    [v65 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_faceTimeButton setAccessibilityIdentifier:@"ShieldUI.faceTimeButton"];
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_10000448C;
    v153[3] = &unk_1000145B0;
    objc_copyWeak(&v154, &location);
    v131 = +[UIAction actionWithHandler:v153];
    v66 = [(ContinuityCaptureShieldUIContentView *)v3 _favoritesButtonConfiguration];
    uint64_t v67 = +[UIButton buttonWithConfiguration:v66 primaryAction:v131];
    favoritesButton = v3->_favoritesButton;
    v3->_favoritesButton = (UIButton *)v67;

    v3->_isDedicated = 0;
    [(UIButton *)v3->_favoritesButton setHidden:[(ContinuityCaptureShieldUIContentView *)v3 _shouldShowFavoritesButton] ^ 1];
    v69 = [(UIButton *)v3->_favoritesButton titleLabel];
    [v69 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_favoritesButton setAccessibilityIdentifier:@"ShieldUI.favoritesButton"];
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_1000045A0;
    v151[3] = &unk_1000145B0;
    objc_copyWeak(&v152, &location);
    v128 = +[UIAction actionWithHandler:v151];
    v70 = [(ContinuityCaptureShieldUIContentView *)v3 _disconnectButtonConfiguration];
    uint64_t v71 = +[UIButton buttonWithConfiguration:v70 primaryAction:v128];
    disconnectButton = v3->_disconnectButton;
    v3->_disconnectButton = (UIButton *)v71;

    v73 = [(UIButton *)v3->_disconnectButton titleLabel];
    [v73 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_disconnectButton setAccessibilityIdentifier:@"ShieldUI.disconnectButton"];
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_100004684;
    v149[3] = &unk_1000145B0;
    objc_copyWeak(&v150, &location);
    v125 = +[UIAction actionWithHandler:v149];
    v74 = [(ContinuityCaptureShieldUIContentView *)v3 _skipButtonConfiguration];
    uint64_t v75 = +[UIButton buttonWithConfiguration:v74 primaryAction:v125];
    skipButton = v3->_skipButton;
    v3->_skipButton = (UIButton *)v75;

    [(UIButton *)v3->_skipButton setHidden:1];
    v77 = [(UIButton *)v3->_skipButton titleLabel];
    [v77 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_skipButton setAccessibilityIdentifier:@"ShieldUI.skipButton"];
    id v78 = objc_alloc((Class)UIStackView);
    v162[0] = v3->_pauseButton;
    v162[1] = v3->_favoritesButton;
    v162[2] = v3->_faceTimeButton;
    v162[3] = v3->_skipButton;
    v162[4] = v3->_disconnectButton;
    v79 = +[NSArray arrayWithObjects:v162 count:5];
    v80 = (UIStackView *)[v78 initWithArrangedSubviews:v79];
    buttonsStackView = v3->_buttonsStackView;
    v3->_buttonsStackView = v80;

    [(UIStackView *)v3->_buttonsStackView setAlignment:0];
    [(UIStackView *)v3->_buttonsStackView setAxis:1];
    [(ContinuityCaptureShieldUIContentView *)v3 _defaultButtonPadding];
    -[UIStackView setSpacing:](v3->_buttonsStackView, "setSpacing:");
    [(UIStackView *)v3->_buttonsStackView setDistribution:0];
    [(UIStackView *)v3->_buttonsStackView setAccessibilityIdentifier:@"ShieldUI.buttonsStackView"];
    [(UIStackView *)v3->_descriptionStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_buttonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_containerView addSubview:v3->_descriptionStackView];
    [(UIView *)v3->_containerView addSubview:v3->_buttonsStackView];
    v82 = [(UIStackView *)v3->_descriptionStackView leadingAnchor];
    v83 = [(UIView *)v3->_containerView leadingAnchor];
    uint64_t v84 = [v82 constraintEqualToAnchor:v83 constant:53.0];
    descriptionLeadingAnchor = v3->_descriptionLeadingAnchor;
    v3->_descriptionLeadingAnchor = (NSLayoutConstraint *)v84;

    v86 = [(UIStackView *)v3->_descriptionStackView trailingAnchor];
    v87 = [(UIView *)v3->_containerView trailingAnchor];
    uint64_t v88 = [v86 constraintEqualToAnchor:v87 constant:-53.0];
    descriptionTrailingAnchor = v3->_descriptionTrailingAnchor;
    v3->_descriptionTrailingAnchor = (NSLayoutConstraint *)v88;

    v122 = [(UIStackView *)v3->_descriptionStackView centerYAnchor];
    v120 = [(UIView *)v3->_containerView centerYAnchor];
    v118 = [v122 constraintEqualToAnchor:v120];
    v161[0] = v118;
    v116 = [(UIStackView *)v3->_descriptionStackView centerXAnchor];
    v114 = [(UIView *)v3->_containerView centerXAnchor];
    v112 = [v116 constraintEqualToAnchor:v114];
    v161[1] = v112;
    v110 = [(UIStackView *)v3->_descriptionStackView bottomAnchor];
    v108 = [(UIStackView *)v3->_buttonsStackView topAnchor];
    [(ContinuityCaptureShieldUIContentView *)v3 _textToButtonsPadding];
    v107 = [v110 constraintLessThanOrEqualToAnchor:v108 constant:-v90];
    v161[2] = v107;
    v161[3] = v3->_descriptionLeadingAnchor;
    v161[4] = v3->_descriptionTrailingAnchor;
    v106 = [(UIStackView *)v3->_buttonsStackView bottomAnchor];
    v105 = [(UIView *)v3->_containerView bottomAnchor];
    [(ContinuityCaptureShieldUIContentView *)v3 _defaultButtonPadding];
    v104 = [v106 constraintEqualToAnchor:v105 constant:-v91];
    v161[5] = v104;
    v103 = [(UIStackView *)v3->_buttonsStackView centerXAnchor];
    v102 = [(UIView *)v3->_containerView centerXAnchor];
    v92 = [v103 constraintEqualToAnchor:v102];
    v161[6] = v92;
    v93 = [(UIStackView *)v3->_buttonsStackView widthAnchor];
    v94 = [(UIView *)v3->_containerView widthAnchor];
    [(ContinuityCaptureShieldUIContentView *)v3 _defaultButtonScreenWidth];
    v95 = [v93 constraintEqualToAnchor:v94 multiplier:];
    v161[7] = v95;
    v96 = [(UIView *)v3->_animationViewContainer widthAnchor];
    v97 = [v96 constraintEqualToConstant:240.0];
    v161[8] = v97;
    v98 = [(UIView *)v3->_animationViewContainer heightAnchor];
    v99 = [v98 constraintEqualToConstant:240.0];
    v161[9] = v99;
    v100 = +[NSArray arrayWithObjects:v161 count:10];
    +[NSLayoutConstraint activateConstraints:v100];

    objc_destroyWeak(&v150);
    objc_destroyWeak(&v152);

    objc_destroyWeak(&v154);
    objc_destroyWeak(&v156);

    objc_destroyWeak(&v158);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setImage:(id)a3
{
}

- (void)setInFaceTimeSession:(BOOL)a3
{
  if (self->_inFaceTimeSession != a3)
  {
    self->_inFaceTimeSession = a3;
    [(UIButton *)self->_faceTimeButton setHidden:[(ContinuityCaptureShieldUIContentView *)self _shouldShowFaceTimeButton] ^ 1];
    id v4 = [(ContinuityCaptureShieldUIContentView *)self _disconnectButtonConfiguration];
    [(UIButton *)self->_disconnectButton setConfiguration:v4];
  }
}

- (void)setInPlacementStep:(BOOL)a3
{
  if (self->_inPlacementStep != a3)
  {
    BOOL v3 = a3;
    self->_inPlacementStep = a3;
    -[UIButton setHidden:](self->_pauseButton, "setHidden:");
    [(UIButton *)self->_skipButton setHidden:!self->_inPlacementStep];
    [(UIImageView *)self->_imageView setHidden:self->_inPlacementStep];
    [(UIButton *)self->_favoritesButton setHidden:[(ContinuityCaptureShieldUIContentView *)self _shouldShowFavoritesButton] ^ 1];
    [(UIView *)self->_animationViewContainer setHidden:!self->_inPlacementStep];
    BOOL v5 = [(ContinuityCaptureShieldUIContentView *)self _disconnectButtonConfiguration];
    [(UIButton *)self->_disconnectButton setConfiguration:v5];

    if (v3)
    {
      v6 = [(ContinuityCaptureShieldUIContentView *)self _defaultTextColor];
      double v7 = 20.0;
      double v8 = -20.0;
    }
    else
    {
      v6 = [(ContinuityCaptureShieldUIContentView *)self _defaultSecondaryTextColor];
      double v7 = 53.0;
      double v8 = -53.0;
    }
    [(UILabel *)self->_subtitleLabel setTextColor:v6];

    [(NSLayoutConstraint *)self->_descriptionLeadingAnchor setConstant:v7];
    [(NSLayoutConstraint *)self->_descriptionTrailingAnchor setConstant:v8];
    [(ContinuityCaptureShieldUIContentView *)self setNeedsUpdateConstraints];
    if (v3)
    {
      if (!self->_animationView)
      {
        v9 = +[UIDevice currentDevice];
        id v10 = [v9 userInterfaceIdiom];

        v11 = @"iPhone_Rotate";
        if (v10 == (id)1) {
          v11 = @"iPad_Static";
        }
        v12 = v11;
        v13 = [ContinuityCaptureShieldUICAPackageView alloc];
        uint64_t v14 = kCAPackageTypeArchive;
        v15 = +[NSBundle mainBundle];
        v16 = [(ContinuityCaptureShieldUICAPackageView *)v13 initWithPackageName:v12 type:v14 inBundle:v15];

        animationView = self->_animationView;
        self->_animationView = v16;

        [(ContinuityCaptureShieldUICAPackageView *)self->_animationView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIView *)self->_animationViewContainer addSubview:self->_animationView];
        v31 = [(ContinuityCaptureShieldUICAPackageView *)self->_animationView leftAnchor];
        v30 = [(UIView *)self->_animationViewContainer leftAnchor];
        double v29 = [v31 constraintEqualToAnchor:v30];
        v35[0] = v29;
        v28 = [(ContinuityCaptureShieldUICAPackageView *)self->_animationView rightAnchor];
        v27 = [(UIView *)self->_animationViewContainer rightAnchor];
        v26 = [v28 constraintEqualToAnchor:v27];
        v35[1] = v26;
        v18 = [(ContinuityCaptureShieldUICAPackageView *)self->_animationView topAnchor];
        v19 = [(UIView *)self->_animationViewContainer topAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v35[2] = v20;
        v21 = [(ContinuityCaptureShieldUICAPackageView *)self->_animationView bottomAnchor];
        v22 = [(UIView *)self->_animationViewContainer bottomAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        v35[3] = v23;
        v24 = +[NSArray arrayWithObjects:v35 count:4];
        +[NSLayoutConstraint activateConstraints:v24];

        [(ContinuityCaptureShieldUIContentView *)self layoutIfNeeded];
        [(ContinuityCaptureShieldUICAPackageView *)self->_animationView setState:@"Static"];
      }
      objc_initWeak(&location, self);
      dispatch_time_t v25 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004CC0;
      block[3] = &unk_1000145D8;
      objc_copyWeak(&v33, &location);
      dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setIsDedicatedSession:(BOOL)a3
{
  if (self->_isDedicated != a3)
  {
    self->_isDedicated = a3;
    [(UIButton *)self->_favoritesButton setHidden:[(ContinuityCaptureShieldUIContentView *)self _shouldShowFavoritesButton] ^ 1];
    faceTimeButton = self->_faceTimeButton;
    uint64_t v5 = [(ContinuityCaptureShieldUIContentView *)self _shouldShowFaceTimeButton] ^ 1;
    [(UIButton *)faceTimeButton setHidden:v5];
  }
}

- (void)setPrimaryText:(id)a3
{
}

- (void)setSecondaryText:(id)a3
{
}

- (void)setPauseButtonState:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      [(UIButton *)self->_pauseButton setHidden:0];
      uint64_t v5 = [(UIButton *)self->_pauseButton configuration];
      id v6 = objc_alloc((Class)NSAttributedString);
      double v7 = +[NSBundle mainBundle];
      double v8 = [v7 localizedStringForKey:@"BUTTON_TITLE_RESUME" value:&stru_100014A80 table:0];
      NSAttributedStringKey v14 = NSFontAttributeName;
      v9 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
      v15 = v9;
      id v10 = &v15;
      v11 = &v14;
      goto LABEL_9;
    case 1uLL:
      [(UIButton *)self->_pauseButton setHidden:0];
      uint64_t v5 = [(UIButton *)self->_pauseButton configuration];
      id v6 = objc_alloc((Class)NSAttributedString);
      double v7 = +[NSBundle mainBundle];
      double v8 = [v7 localizedStringForKey:@"BUTTON_TITLE_PAUSE" value:&stru_100014A80 table:0];
      NSAttributedStringKey v16 = NSFontAttributeName;
      v9 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
      v17 = v9;
      id v10 = &v17;
      v11 = &v16;
LABEL_9:
      v12 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
      id v13 = [v6 initWithString:v8 attributes:v12];
      [v5 setAttributedTitle:v13];

      [(UIButton *)self->_pauseButton setConfiguration:v5];
      return;
    case 0uLL:
      pauseButton = self->_pauseButton;
      [(UIButton *)pauseButton setHidden:1];
      break;
  }
}

- (void)_setPullFaceTimeButtonLoading:(BOOL)a3
{
  self->_pullFaceTimeButtonLoading = a3;
  faceTimeButton = self->_faceTimeButton;
  uint64_t v5 = [(ContinuityCaptureShieldUIContentView *)self _facetimeButtonConfiguration];
  [(UIButton *)faceTimeButton setConfiguration:v5];

  id v6 = self->_faceTimeButton;
  uint64_t v7 = [(ContinuityCaptureShieldUIContentView *)self _shouldShowFaceTimeButton] ^ 1;

  [(UIButton *)v6 setHidden:v7];
}

- (BOOL)_shouldShowFaceTimeButton
{
  if (self->_isDedicated) {
    return 0;
  }
  if (self->_inFaceTimeSession) {
    return 1;
  }
  return self->_pullFaceTimeButtonLoading;
}

- (BOOL)_shouldShowFavoritesButton
{
  return self->_isDedicated && !self->_inPlacementStep;
}

- (id)_defaultTextFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle2 variant:1024];
}

- (id)_defaultTextColor
{
  return +[UIColor labelColor];
}

- (id)_defaultSecondaryTextFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody variant:0];
}

- (id)_defaultButtonTextFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody variant:1024];
}

- (id)_defaultSecondaryTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)_defaultButtonPadding
{
  return 5.0;
}

- (double)_defaultDescriptionPadding
{
  return 9.0;
}

- (double)_defaultButtonScreenWidth
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)1) {
    double v3 = 0.5;
  }
  else {
    double v3 = 0.666666667;
  }

  return v3;
}

- (double)_defaultDescriptionScreenWidth
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)1) {
    double v3 = 0.5;
  }
  else {
    double v3 = 0.8;
  }

  return v3;
}

- (double)_imageToTextPadding
{
  return 18.0;
}

- (double)_textToButtonsPadding
{
  return 20.0;
}

- (id)_defaultImageSymbolConfiguration
{
  double v3 = +[UIFontMetrics defaultMetrics];
  id v4 = [(ContinuityCaptureShieldUIContentView *)self traitCollection];
  [v3 scaledValueForValue:v4 compatibleWithTraitCollection:96.0];
  double v6 = v5;

  return +[UIImageSymbolConfiguration configurationWithPointSize:v6];
}

- (id)_pauseButtonConfiguration
{
  double v3 = +[UIButtonConfiguration filledButtonConfiguration];
  [v3 setButtonSize:3];
  [v3 setCornerStyle:3];
  id v4 = +[UIColor systemBlackColor];
  [v3 setBaseForegroundColor:v4];

  double v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"BUTTON_TITLE_PAUSE" value:&stru_100014A80 table:0];

  id v7 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v13 = NSFontAttributeName;
  double v8 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
  NSAttributedStringKey v14 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v10 = [v7 initWithString:v6 attributes:v9];
  [v3 setAttributedTitle:v10];

  v11 = +[UIColor systemWhiteColor];
  [v3 setBaseBackgroundColor:v11];

  return v3;
}

- (id)_facetimeButtonConfiguration
{
  double v3 = +[UIButtonConfiguration filledButtonConfiguration];
  [v3 setButtonSize:3];
  [v3 setCornerStyle:3];
  id v4 = +[UIColor systemWhiteColor];
  [v3 setBaseForegroundColor:v4];

  double v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  id v7 = +[UIColor systemGreenColor];
  [v3 setBaseBackgroundColor:v7];

  double v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"BUTTON_TITLE_SWITCH_%@" value:&stru_100014A80 table:0];
  CFStringRef v10 = @"iPhone";
  if (v6 == (id)1)
  {
    CFStringRef v10 = @"iPad";
    CFStringRef v11 = @"ipad.and.arrow.forward";
  }
  else
  {
    CFStringRef v11 = @"iphone.and.arrow.forward";
  }
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

  id v13 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v19 = NSFontAttributeName;
  NSAttributedStringKey v14 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
  v20 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v16 = [v13 initWithString:v12 attributes:v15];
  [v3 setAttributedTitle:v16];

  v17 = +[UIImage systemImageNamed:v11];
  [v3 setImage:v17];

  [v3 setImagePadding:6.0];
  [v3 setShowsActivityIndicator:self->_pullFaceTimeButtonLoading];

  return v3;
}

- (id)_favoritesButtonConfiguration
{
  double v3 = +[UIButtonConfiguration filledButtonConfiguration];
  [v3 setButtonSize:3];
  [v3 setCornerStyle:3];
  id v4 = +[UIColor systemBlackColor];
  [v3 setBaseForegroundColor:v4];

  double v5 = +[UIColor systemWhiteColor];
  [v3 setBaseBackgroundColor:v5];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"BUTTON_TITLE_FAVORITES" value:&stru_100014A80 table:0];

  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v14 = NSFontAttributeName;
  v9 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
  v15 = v9;
  CFStringRef v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v11 = [v8 initWithString:v7 attributes:v10];
  [v3 setAttributedTitle:v11];

  v12 = +[UIImage _systemImageNamed:@"star.circle.badge.person.crop"];
  [v3 setImage:v12];

  [v3 setImagePadding:6.0];

  return v3;
}

- (id)_disconnectButtonConfiguration
{
  if (self->_inPlacementStep) {
    +[UIButtonConfiguration borderlessButtonConfiguration];
  }
  else {
  double v3 = +[UIButtonConfiguration filledButtonConfiguration];
  }
  [v3 setButtonSize:3];
  [v3 setCornerStyle:3];
  if (self->_inPlacementStep)
  {
    id v4 = +[UIColor systemRedColor];
    [v3 setBaseForegroundColor:v4];

    double v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"BUTTON_TITLE_DISCONNECT" value:&stru_100014A80 table:0];

    id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:&__NSDictionary0__struct];
    [v3 setAttributedTitle:v7];

    [v3 setImage:0];
  }
  else
  {
    id v8 = +[UIColor systemWhiteColor];
    [v3 setBaseForegroundColor:v8];

    [v3 setImagePadding:6.0];
    v9 = +[UIColor systemRedColor];
    [v3 setBaseBackgroundColor:v9];

    LODWORD(v9) = self->_inFaceTimeSession;
    CFStringRef v10 = +[NSBundle mainBundle];
    id v11 = v10;
    if (v9) {
      CFStringRef v12 = @"BUTTON_TITLE_END_CALL_AND_DISCONNECT";
    }
    else {
      CFStringRef v12 = @"BUTTON_TITLE_DISCONNECT";
    }
    id v6 = [v10 localizedStringForKey:v12 value:&stru_100014A80 table:0];

    id v13 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v21 = NSFontAttributeName;
    NSAttributedStringKey v14 = [(ContinuityCaptureShieldUIContentView *)self _defaultButtonTextFont];
    v22 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v16 = [v13 initWithString:v6 attributes:v15];
    [v3 setAttributedTitle:v16];

    [v3 setTitleLineBreakMode:0];
    if (self->_inFaceTimeSession)
    {
      v17 = +[UIImage systemImageNamed:@"phone.down.fill"];
      [v3 setImage:v17];
    }
    else
    {
      v17 = +[UIImage systemImageNamed:@"xmark"];
      v18 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleSubheadline];
      NSAttributedStringKey v19 = [v17 imageByApplyingSymbolConfiguration:v18];
      [v3 setImage:v19];
    }
  }

  [v3 contentInsets];
  [v3 setContentInsets:];

  return v3;
}

- (id)_skipButtonConfiguration
{
  v2 = +[UIButtonConfiguration borderlessButtonConfiguration];
  [v2 setButtonSize:3];
  [v2 setCornerStyle:3];
  double v3 = +[UIColor systemBlueColor];
  [v2 setBaseForegroundColor:v3];

  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"BUTTON_TITLE_SKIP_THIS_STEP" value:&stru_100014A80 table:0];
  [v2 setTitle:v5];

  return v2;
}

- (ContinuityCaptureShieldUIContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ContinuityCaptureShieldUIContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (ContinuityCaptureShieldUICAPackageView)animationView
{
  return self->_animationView;
}

- (UIView)animationViewContainer
{
  return self->_animationViewContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSLayoutConstraint)descriptionLeadingAnchor
{
  return self->_descriptionLeadingAnchor;
}

- (NSLayoutConstraint)descriptionTrailingAnchor
{
  return self->_descriptionTrailingAnchor;
}

- (UIButton)pauseButton
{
  return self->_pauseButton;
}

- (UIButton)faceTimeButton
{
  return self->_faceTimeButton;
}

- (UIButton)disconnectButton
{
  return self->_disconnectButton;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (UIButton)favoritesButton
{
  return self->_favoritesButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_disconnectButton, 0);
  objc_storeStrong((id *)&self->_faceTimeButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_descriptionTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_descriptionLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_animationViewContainer, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_descriptionStackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_accessibilityScrollView, 0);
}

@end