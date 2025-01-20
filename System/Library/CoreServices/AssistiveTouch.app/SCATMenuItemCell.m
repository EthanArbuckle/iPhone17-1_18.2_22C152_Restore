@interface SCATMenuItemCell
+ (CGSize)cellSizeForTitle:(id)a3;
+ (CGSize)maxCellSize;
+ (id)measuringCell;
+ (id)titleToSizeCache;
- (BOOL)_useHighVisibilityImage;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)isFlashing;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)shouldIncludeTextLabels;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)shouldUseActivityIndicator;
- (NSLayoutConstraint)titleHiddenConstraint;
- (SCATMenuItemCell)initWithFrame:(CGRect)a3;
- (SCATMenuLabel)titleLabel;
- (SCATModernMenuItem)menuItem;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)defaultBackgroundImage;
- (UIImage)dimmedBackgroundImage;
- (UIImage)dimmedIconImage;
- (UIImage)highVisBackgroundAndIconImage;
- (UIImage)iconImage;
- (UIImage)pressedBackgroundImage;
- (UIImageView)backgroundBorderImageView;
- (UIImageView)iconImageView;
- (UIImageView)pressedBackgroundBorderImageView;
- (UIVisualEffect)iconEffect;
- (UIVisualEffectView)borderContainerView;
- (UIVisualEffectView)iconContainerView;
- (double)iconImageAngle;
- (id)accessibilityLabel;
- (id)description;
- (id)scatSpeakableDescription;
- (void)_setBorderDimmed:(BOOL)a3 focused:(BOOL)a4 hidden:(BOOL)a5;
- (void)_setIconDimmed:(BOOL)a3 asDimAsBorder:(BOOL)a4 focused:(BOOL)a5;
- (void)_setupConstraints;
- (void)didUpdateScatMenuItemStyle;
- (void)flash;
- (void)prepareForReuse;
- (void)resetCell;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBackgroundBorderImageView:(id)a3;
- (void)setBorderContainerView:(id)a3;
- (void)setDefaultBackgroundImage:(id)a3;
- (void)setDimmedBackgroundImage:(id)a3;
- (void)setDimmedIconImage:(id)a3;
- (void)setHighVisBackgroundAndIconImage:(id)a3;
- (void)setIconContainerView:(id)a3;
- (void)setIconEffect:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageAngle:(double)a3;
- (void)setIconImageView:(id)a3;
- (void)setIsFlashing:(BOOL)a3;
- (void)setMenuItem:(id)a3;
- (void)setPressedBackgroundBorderImageView:(id)a3;
- (void)setPressedBackgroundImage:(id)a3;
- (void)setShouldIncludeTextLabels:(BOOL)a3;
- (void)setShouldSuppressAudioOutput:(BOOL)a3;
- (void)setShouldUseActivityIndicator:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)update;
@end

@implementation SCATMenuItemCell

+ (id)titleToSizeCache
{
  if (qword_1001F0B88 != -1) {
    dispatch_once(&qword_1001F0B88, &stru_1001AE0A0);
  }
  v2 = (void *)qword_1001F0B80;
  if (!qword_1001F0B80)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)qword_1001F0B80;
    qword_1001F0B80 = (uint64_t)v3;

    v2 = (void *)qword_1001F0B80;
  }

  return v2;
}

+ (id)measuringCell
{
  if (qword_1001F0B98 != -1) {
    dispatch_once(&qword_1001F0B98, &stru_1001AE100);
  }
  v2 = (void *)qword_1001F0B90;

  return v2;
}

+ (CGSize)maxCellSize
{
  v2 = objc_opt_class();

  [v2 cellSizeForTitle:@"a\nb"];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)cellSizeForTitle:(id)a3
{
  double v3 = &stru_1001B1E10;
  if (a3) {
    double v3 = (__CFString *)a3;
  }
  double v4 = v3;
  v5 = [(id)objc_opt_class() titleToSizeCache];
  v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    v7 = [(id)objc_opt_class() measuringCell];
    v8 = [v7 titleLabel];
    [v8 setAdjustsFontSizeToFitWidth:0];

    v9 = [v7 titleLabel];
    [v9 setText:v4];

    objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v18[0] = v10;
    v18[1] = v11;
    v6 = +[NSValue valueWithBytes:v18 objCType:"{CGSize=dd}"];
    [v5 setObject:v6 forKeyedSubscript:v4];
  }
  [v6 CGSizeValue];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (SCATMenuItemCell)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)SCATMenuItemCell;
  double v3 = -[SCATMenuItemCell initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[UIBlurEffect effectWithStyle:9];
    uint64_t v5 = +[UIVibrancyEffect effectForBlurEffect:v4 style:0];
    iconEffect = v3->_iconEffect;
    v3->_iconEffect = (UIVisualEffect *)v5;

    v7 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v3->_iconEffect];
    iconContainerView = v3->_iconContainerView;
    v3->_iconContainerView = v7;

    [(UIVisualEffectView *)v3->_iconContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(SCATMenuItemCell *)v3 contentView];
    uint64_t v10 = [(SCATMenuItemCell *)v3 iconContainerView];
    [v9 addSubview:v10];

    uint64_t v11 = objc_alloc_init(SCATMenuLabel);
    [(SCATMenuLabel *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SCATMenuItemCell *)v3 setTitleLabel:v11];
    double v12 = +[UIColor whiteColor];
    double v13 = [(SCATMenuItemCell *)v3 titleLabel];
    [v13 setTextColor:v12];

    double v14 = [(SCATMenuItemCell *)v3 iconContainerView];
    double v15 = [v14 contentView];
    [v15 addSubview:v11];

    id v16 = objc_alloc((Class)UIVisualEffectView);
    double v17 = [(SCATMenuItemCell *)v3 iconEffect];
    v18 = (UIVisualEffectView *)[v16 initWithEffect:v17];
    borderContainerView = v3->_borderContainerView;
    v3->_borderContainerView = v18;

    [(UIVisualEffectView *)v3->_borderContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v20 = objc_alloc_init((Class)UIImageView);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SCATMenuItemCell *)v3 setBackgroundBorderImageView:v20];
    v21 = [(SCATMenuItemCell *)v3 contentView];
    [v21 addSubview:v3->_borderContainerView];

    v22 = [(UIVisualEffectView *)v3->_borderContainerView contentView];
    v23 = [(SCATMenuItemCell *)v3 backgroundBorderImageView];
    [v22 addSubview:v23];

    id v24 = objc_alloc_init((Class)UIImageView);
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setAlpha:0.0];
    [(SCATMenuItemCell *)v3 setPressedBackgroundBorderImageView:v24];
    v25 = [(UIVisualEffectView *)v3->_borderContainerView contentView];
    v26 = [(SCATMenuItemCell *)v3 pressedBackgroundBorderImageView];
    [v25 addSubview:v26];

    id v27 = objc_alloc_init((Class)UIImageView);
    [v27 setContentMode:1];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SCATMenuItemCell *)v3 setIconImageView:v27];
    v28 = [(SCATMenuItemCell *)v3 iconContainerView];
    v29 = [v28 contentView];
    [v29 addSubview:v27];

    id v30 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v30 setHidden:1];
    [(SCATMenuItemCell *)v3 setActivityIndicatorView:v30];
    v31 = [(SCATMenuItemCell *)v3 iconContainerView];
    v32 = [v31 contentView];
    [v32 addSubview:v30];

    [(SCATMenuItemCell *)v3 _setupConstraints];
    [(SCATMenuItemCell *)v3 didUpdateScatMenuItemStyle];
  }
  return v3;
}

- (void)_setupConstraints
{
  double v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v5;
  }
  if (v8 >= 375.0) {
    double v9 = 10.0;
  }
  else {
    double v9 = 5.0;
  }
  +[SCATModernMenuItem imageSize];
  double v11 = v10;
  double v13 = v12;
  v156 = [(SCATMenuItemCell *)self contentView];
  v154 = [v156 leadingAnchor];
  v155 = [(SCATMenuItemCell *)self iconContainerView];
  v153 = [v155 leadingAnchor];
  v152 = [v154 constraintEqualToAnchor:v153];
  v157[0] = v152;
  v151 = [(SCATMenuItemCell *)self contentView];
  v149 = [v151 trailingAnchor];
  v150 = [(SCATMenuItemCell *)self iconContainerView];
  v148 = [v150 trailingAnchor];
  v147 = [v149 constraintEqualToAnchor:v148];
  v157[1] = v147;
  v146 = [(SCATMenuItemCell *)self contentView];
  v144 = [v146 topAnchor];
  v145 = [(SCATMenuItemCell *)self iconContainerView];
  v143 = [v145 topAnchor];
  v142 = [v144 constraintEqualToAnchor:v143];
  v157[2] = v142;
  v141 = [(SCATMenuItemCell *)self contentView];
  v139 = [v141 bottomAnchor];
  v140 = [(SCATMenuItemCell *)self iconContainerView];
  v138 = [v140 bottomAnchor];
  v137 = [v139 constraintEqualToAnchor:v138];
  v157[3] = v137;
  v136 = [(SCATMenuItemCell *)self borderContainerView];
  v134 = [v136 centerXAnchor];
  v135 = [(SCATMenuItemCell *)self iconContainerView];
  v133 = [v135 centerXAnchor];
  v132 = [v134 constraintEqualToAnchor:v133];
  v157[4] = v132;
  v131 = [(SCATMenuItemCell *)self borderContainerView];
  v129 = [v131 topAnchor];
  v130 = [(SCATMenuItemCell *)self iconContainerView];
  v128 = [v130 topAnchor];
  v127 = [v129 constraintEqualToAnchor:v128];
  v157[5] = v127;
  v126 = [(SCATMenuItemCell *)self borderContainerView];
  v124 = [v126 bottomAnchor];
  v125 = [(SCATMenuItemCell *)self iconContainerView];
  v123 = [v125 bottomAnchor];
  v122 = [v124 constraintEqualToAnchor:v123];
  v157[6] = v122;
  v121 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v120 = [v121 heightAnchor];
  v119 = [v120 constraintEqualToConstant:v13];
  v157[7] = v119;
  v118 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v117 = [v118 widthAnchor];
  v116 = [v117 constraintEqualToConstant:v11];
  v157[8] = v116;
  v115 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v113 = [v115 topAnchor];
  v114 = [(SCATMenuItemCell *)self borderContainerView];
  v112 = [v114 contentView];
  v111 = [v112 topAnchor];
  v110 = [v113 constraintEqualToAnchor:v111];
  v157[9] = v110;
  v109 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
  v107 = [v109 centerXAnchor];
  v108 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v106 = [v108 centerXAnchor];
  v105 = [v107 constraintEqualToAnchor:v106];
  v157[10] = v105;
  v104 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
  v102 = [v104 centerYAnchor];
  v103 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v101 = [v103 centerYAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v157[11] = v100;
  v99 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
  v97 = [v99 heightAnchor];
  v98 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v96 = [v98 heightAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v157[12] = v95;
  v94 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
  v92 = [v94 widthAnchor];
  v93 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v91 = [v93 widthAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v157[13] = v90;
  v89 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v87 = [v89 trailingAnchor];
  v88 = [(SCATMenuItemCell *)self borderContainerView];
  v86 = [v88 contentView];
  v85 = [v86 trailingAnchor];
  v84 = [v87 constraintEqualToAnchor:v85];
  v157[14] = v84;
  v83 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  v81 = [v83 leadingAnchor];
  v82 = [(SCATMenuItemCell *)self borderContainerView];
  v80 = [v82 contentView];
  v79 = [v80 leadingAnchor];
  v78 = [v81 constraintEqualToAnchor:v79];
  v157[15] = v78;
  v77 = [(SCATMenuItemCell *)self iconImageView];
  v76 = [v77 heightAnchor];
  v75 = [v76 constraintEqualToConstant:v13];
  v157[16] = v75;
  v74 = [(SCATMenuItemCell *)self iconImageView];
  v73 = [v74 widthAnchor];
  v72 = [v73 constraintEqualToConstant:v11];
  v157[17] = v72;
  v71 = [(SCATMenuItemCell *)self iconImageView];
  v69 = [v71 leadingAnchor];
  v70 = [(SCATMenuItemCell *)self iconContainerView];
  v68 = [v70 contentView];
  v67 = [v68 leadingAnchor];
  v66 = [v69 constraintEqualToAnchor:v67 constant:v9];
  v157[18] = v66;
  v65 = [(SCATMenuItemCell *)self iconImageView];
  v63 = [v65 topAnchor];
  v64 = [(SCATMenuItemCell *)self iconContainerView];
  v62 = [v64 contentView];
  v61 = [v62 topAnchor];
  v60 = [v63 constraintEqualToAnchor:v61];
  v157[19] = v60;
  v59 = [(SCATMenuItemCell *)self iconImageView];
  v57 = [v59 trailingAnchor];
  v58 = [(SCATMenuItemCell *)self iconContainerView];
  v56 = [v58 contentView];
  v55 = [v56 trailingAnchor];
  v54 = [v57 constraintEqualToAnchor:v55 constant:-v9];
  v157[20] = v54;
  v53 = [(SCATMenuItemCell *)self titleLabel];
  v51 = [v53 firstBaselineAnchor];
  v52 = [(SCATMenuItemCell *)self iconImageView];
  v50 = [v52 bottomAnchor];
  v49 = [v51 constraintEqualToSystemSpacingBelowAnchor:v50 multiplier:0.8];
  v157[21] = v49;
  v48 = [(SCATMenuItemCell *)self titleLabel];
  v46 = [v48 trailingAnchor];
  v47 = [(SCATMenuItemCell *)self iconContainerView];
  v45 = [v47 contentView];
  v44 = [v45 trailingAnchor];
  v43 = [v46 constraintLessThanOrEqualToAnchor:v44];
  v157[22] = v43;
  v42 = [(SCATMenuItemCell *)self titleLabel];
  v40 = [v42 leadingAnchor];
  v41 = [(SCATMenuItemCell *)self iconContainerView];
  v39 = [v41 contentView];
  v38 = [v39 leadingAnchor];
  v37 = [v40 constraintGreaterThanOrEqualToAnchor:v38];
  v157[23] = v37;
  v36 = [(SCATMenuItemCell *)self titleLabel];
  objc_super v34 = [v36 centerXAnchor];
  v35 = [(SCATMenuItemCell *)self iconContainerView];
  v33 = [v35 contentView];
  v32 = [v33 centerXAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v157[24] = v31;
  id v30 = [(SCATMenuItemCell *)self titleLabel];
  v28 = [v30 bottomAnchor];
  v29 = [(SCATMenuItemCell *)self iconContainerView];
  id v27 = [v29 contentView];
  v26 = [v27 bottomAnchor];
  v25 = [v28 constraintEqualToAnchor:v26];
  v157[25] = v25;
  id v24 = [(SCATMenuItemCell *)self activityIndicatorView];
  double v14 = [v24 centerXAnchor];
  double v15 = [(SCATMenuItemCell *)self iconContainerView];
  id v16 = [v15 centerXAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];
  v157[26] = v17;
  v18 = [(SCATMenuItemCell *)self activityIndicatorView];
  v19 = [v18 centerYAnchor];
  id v20 = [(SCATMenuItemCell *)self iconContainerView];
  v21 = [v20 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v157[27] = v22;
  v23 = +[NSArray arrayWithObjects:v157 count:28];
  +[NSLayoutConstraint activateConstraints:v23];
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(SCATMenuItemCell *)self menuItem];
  double v6 = [v5 title];
  [(SCATMenuItemCell *)self frame];
  double v7 = NSStringFromCGRect(v11);
  double v8 = +[NSString stringWithFormat:@"%@<%p>. title:%@. frame:%@", v4, self, v6, v7];

  return v8;
}

- (void)setIconImage:(id)a3
{
  double v8 = (UIImage *)a3;
  if (self->_iconImage != v8)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    double v5 = +[SCATStyleProvider sharedStyleProvider];
    double v6 = [v5 menuKnockoutColor];
    double v7 = [(UIImage *)v8 imageWithTintColor:v6 renderingMode:1];
    [(SCATMenuItemCell *)self setDimmedIconImage:v7];

    [(SCATMenuItemCell *)self setHighVisBackgroundAndIconImage:0];
    [(SCATMenuItemCell *)self didUpdateScatMenuItemStyle];
  }
}

- (void)setShouldUseActivityIndicator:(BOOL)a3
{
  if (self->_shouldUseActivityIndicator != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseActivityIndicator = a3;
    double v5 = [(SCATMenuItemCell *)self activityIndicatorView];
    double v6 = v5;
    if (v3)
    {
      [v5 startAnimating];

      double v7 = [(SCATMenuItemCell *)self activityIndicatorView];
      double v8 = v7;
      uint64_t v9 = 0;
    }
    else
    {
      [v5 stopAnimating];

      double v7 = [(SCATMenuItemCell *)self activityIndicatorView];
      double v8 = v7;
      uint64_t v9 = 1;
    }
    [v7 setHidden:v9];

    [(SCATMenuItemCell *)self didUpdateScatMenuItemStyle];
  }
}

- (void)setIconImageAngle:(double)a3
{
  if (self->_iconImageAngle != a3)
  {
    self->_iconImageAngle = a3;
    CGAffineTransformMakeRotation(&v7, a3);
    double v4 = [(SCATMenuItemCell *)self iconImageView];
    CGAffineTransform v6 = v7;
    [v4 setTransform:&v6];

    double v5 = [(SCATMenuItemCell *)self highVisBackgroundAndIconImage];

    if (v5)
    {
      [(SCATMenuItemCell *)self setHighVisBackgroundAndIconImage:0];
      [(SCATMenuItemCell *)self didUpdateScatMenuItemStyle];
    }
  }
}

- (void)setPressedBackgroundImage:(id)a3
{
  CGAffineTransform v6 = (UIImage *)a3;
  if (self->_pressedBackgroundImage != v6)
  {
    objc_storeStrong((id *)&self->_pressedBackgroundImage, a3);
    double v5 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
    [v5 setImage:v6];
  }
}

- (void)setShouldIncludeTextLabels:(BOOL)a3
{
  self->_shouldIncludeTextLabels = a3;
  BOOL v3 = !a3;
  id v4 = [(SCATMenuItemCell *)self titleHiddenConstraint];
  [v4 setActive:v3];
}

- (NSLayoutConstraint)titleHiddenConstraint
{
  titleHiddenConstraint = self->_titleHiddenConstraint;
  if (!titleHiddenConstraint)
  {
    id v4 = [(SCATMenuItemCell *)self titleLabel];
    double v5 = [v4 heightAnchor];
    CGAffineTransform v6 = [v5 constraintEqualToConstant:0.0];
    CGAffineTransform v7 = self->_titleHiddenConstraint;
    self->_titleHiddenConstraint = v6;

    titleHiddenConstraint = self->_titleHiddenConstraint;
  }

  return titleHiddenConstraint;
}

- (BOOL)_useHighVisibilityImage
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  return v3;
}

- (void)_setBorderDimmed:(BOOL)a3 focused:(BOOL)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(SCATMenuItemCell *)self _useHighVisibilityImage] && v6)
  {
    uint64_t v9 = [(SCATMenuItemCell *)self highVisBackgroundAndIconImage];

    if (!v9)
    {
      +[SCATModernMenuItem imageSize];
      double v11 = v10;
      double v13 = v12;
      double y = CGRectZero.origin.y;
      double v15 = +[UIScreen mainScreen];
      [v15 scale];
      CGFloat v17 = v16;
      v38.width = v11;
      v38.height = v13;
      UIGraphicsBeginImageContextWithOptions(v38, 0, v17);

      v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGRectZero.origin.x, y, v11, v13, 15.0);
      v19 = +[UIColor whiteColor];
      [v19 set];

      [v18 fill];
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(CurrentContext, v11 * 0.5, v13 * 0.5);
      v21 = UIGraphicsGetCurrentContext();
      [(SCATMenuItemCell *)self iconImageAngle];
      CGContextRotateCTM(v21, v22);
      v23 = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(v23, -(v11 * 0.5), -(v13 * 0.5));
      id v24 = [(SCATMenuItemCell *)self iconImage];
      objc_msgSend(v24, "drawInRect:blendMode:alpha:", 23, 0.0, 0.0, v11, v13, 1.0);

      v25 = UIGraphicsGetImageFromCurrentImageContext();
      [(SCATMenuItemCell *)self setHighVisBackgroundAndIconImage:v25];

      UIGraphicsEndImageContext();
    }
    uint64_t v26 = [(SCATMenuItemCell *)self highVisBackgroundAndIconImage];
    goto LABEL_11;
  }
  if (v7)
  {
    id v27 = [(SCATMenuItemCell *)self dimmedBackgroundImage];
    v28 = [(SCATMenuItemCell *)self backgroundBorderImageView];
    [v28 setImage:v27];

    id v36 = +[SCATStyleProvider sharedStyleProvider];
    [v36 menuKnockoutBorderOpacity];
    double v30 = v29;
    v31 = [(SCATMenuItemCell *)self backgroundBorderImageView];
    [v31 setAlpha:v30];

    goto LABEL_13;
  }
  if (!v5)
  {
    uint64_t v26 = [(SCATMenuItemCell *)self defaultBackgroundImage];
LABEL_11:
    objc_super v34 = (void *)v26;
    v35 = [(SCATMenuItemCell *)self backgroundBorderImageView];
    [v35 setImage:v34];

    v32 = [(SCATMenuItemCell *)self backgroundBorderImageView];
    double v33 = 1.0;
    goto LABEL_12;
  }
  v32 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  double v33 = 0.0;
LABEL_12:
  id v36 = v32;
  [v32 setAlpha:v33];
LABEL_13:
}

- (void)_setIconDimmed:(BOOL)a3 asDimAsBorder:(BOOL)a4 focused:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(SCATMenuItemCell *)self _useHighVisibilityImage] && v5)
  {
    uint64_t v9 = [(SCATMenuItemCell *)self iconImageView];
    id v22 = v9;
LABEL_5:
    [v9 setHidden:1];
LABEL_6:
    double v11 = v22;
LABEL_7:

    return;
  }
  unsigned int v10 = [(SCATMenuItemCell *)self shouldUseActivityIndicator];
  uint64_t v9 = [(SCATMenuItemCell *)self iconImageView];
  id v22 = v9;
  if (v10) {
    goto LABEL_5;
  }
  [v9 setHidden:0];

  if (!v7)
  {
    v18 = [(SCATMenuItemCell *)self iconImage];
    v19 = [(SCATMenuItemCell *)self iconImageView];
    [v19 setImage:v18];

    id v20 = [(SCATMenuItemCell *)self iconImageView];
    [v20 _setDrawsAsBackdropOverlayWithBlendMode:0];

    id v22 = [(SCATMenuItemCell *)self iconImageView];
    [v22 setAlpha:1.0];
    goto LABEL_6;
  }
  double v12 = [(SCATMenuItemCell *)self dimmedIconImage];
  double v13 = [(SCATMenuItemCell *)self iconImageView];
  [v13 setImage:v12];

  double v14 = [(SCATMenuItemCell *)self iconImageView];
  double v15 = +[SCATStyleProvider sharedStyleProvider];
  objc_msgSend(v14, "_setDrawsAsBackdropOverlayWithBlendMode:", objc_msgSend(v15, "menuKnockoutBorderOverlayBlendMode"));

  if (v6)
  {
    id v22 = +[SCATStyleProvider sharedStyleProvider];
    [v22 menuKnockoutBorderOpacity];
    double v17 = v16;
  }
  else
  {
    double v17 = 1.0;
  }
  v21 = [(SCATMenuItemCell *)self iconImageView];
  [v21 setAlpha:v17];

  double v11 = v22;
  if (v6) {
    goto LABEL_7;
  }
}

- (void)didUpdateScatMenuItemStyle
{
  id v3 = [(SCATMenuItemCell *)self scatMenuItemStyle];
  switch((unint64_t)v3)
  {
    case 0uLL:
      id v4 = self;
      uint64_t v5 = 1;
      uint64_t v6 = 0;
      goto LABEL_8;
    case 1uLL:
      BOOL v7 = self;
      uint64_t v8 = 1;
      uint64_t v9 = 0;
      goto LABEL_6;
    case 2uLL:
      [(SCATMenuItemCell *)self _setBorderDimmed:0 focused:1 hidden:0];
      unsigned int v10 = self;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 1;
      goto LABEL_10;
    case 3uLL:
      BOOL v7 = self;
      uint64_t v8 = 0;
      uint64_t v9 = 1;
LABEL_6:
      [(SCATMenuItemCell *)v7 _setBorderDimmed:v8 focused:0 hidden:v9];
      unsigned int v10 = self;
      uint64_t v11 = 1;
      uint64_t v12 = 1;
      goto LABEL_9;
    case 4uLL:
      id v4 = self;
      uint64_t v5 = 0;
      uint64_t v6 = 1;
LABEL_8:
      [(SCATMenuItemCell *)v4 _setBorderDimmed:v5 focused:0 hidden:v6];
      unsigned int v10 = self;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
LABEL_9:
      uint64_t v13 = 0;
LABEL_10:
      [(SCATMenuItemCell *)v10 _setIconDimmed:v11 asDimAsBorder:v12 focused:v13];
      break;
    default:
      break;
  }
  double v14 = [(SCATMenuItemCell *)self titleLabel];
  [v14 setScatMenuItemStyle:v3];

  id v15 = [(SCATMenuItemCell *)self titleLabel];
  [v15 didUpdateScatMenuItemStyle];
}

- (void)prepareForReuse
{
  [(SCATMenuItemCell *)self setIconImageAngle:0.0];
  [(SCATMenuItemCell *)self setShouldUseActivityIndicator:0];
  [(SCATMenuItemCell *)self setIconImage:0];
  [(SCATMenuItemCell *)self setDimmedIconImage:0];
  [(SCATMenuItemCell *)self setHighVisBackgroundAndIconImage:0];
  id v3 = [(SCATMenuItemCell *)self iconImageView];
  [v3 setImage:0];

  [(SCATMenuItemCell *)self setDefaultBackgroundImage:0];
  [(SCATMenuItemCell *)self setPressedBackgroundImage:0];
  [(SCATMenuItemCell *)self setDimmedBackgroundImage:0];
  id v4 = [(SCATMenuItemCell *)self backgroundBorderImageView];
  [v4 setImage:0];

  uint64_t v5 = [(SCATMenuItemCell *)self pressedBackgroundBorderImageView];
  [v5 setImage:0];

  [(SCATMenuItemCell *)self setMenuItem:0];
  uint64_t v6 = [(SCATMenuItemCell *)self titleLabel];
  [v6 setAdjustsFontSizeToFitWidth:0];

  BOOL v7 = [(SCATMenuItemCell *)self titleLabel];
  [v7 setAdjustsFontSizeToFitWidth:1];

  v8.receiver = self;
  v8.super_class = (Class)SCATMenuItemCell;
  [(SCATMenuItemCell *)&v8 prepareForReuse];
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 != 2010) {
    return 0;
  }
  id v3 = self;
  id v4 = [(SCATMenuItemCell *)self menuItem];
  LOBYTE(v3) = [v4 handleActivateWithElement:v3];

  return (char)v3;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (id)scatSpeakableDescription
{
  v2 = [(SCATMenuItemCell *)self menuItem];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)shouldSuppressAudioOutput
{
  return self->_shouldSuppressAudioOutput;
}

- (id)accessibilityLabel
{
  v2 = [(SCATMenuItemCell *)self menuItem];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  v2 = [(SCATMenuItemCell *)self menuItem];
  unsigned __int8 v3 = [v2 allowsDwellScanningToAbortAfterTimeout];

  return v3;
}

- (void)resetCell
{
}

- (void)update
{
  if (![(SCATMenuItemCell *)self isFlashing])
  {
    unsigned __int8 v3 = [(SCATMenuItemCell *)self menuItem];
    -[SCATMenuItemCell setShouldUseActivityIndicator:](self, "setShouldUseActivityIndicator:", [v3 shouldUseActivityIndicator]);

    id v4 = [(SCATMenuItemCell *)self menuItem];
    uint64_t v5 = [v4 resolvedImage];
    [(SCATMenuItemCell *)self setIconImage:v5];

    uint64_t v6 = [(SCATMenuItemCell *)self titleLabel];
    BOOL v7 = [(SCATMenuItemCell *)self menuItem];
    objc_super v8 = [v7 title];
    [v6 setText:v8];

    uint64_t v9 = [(SCATMenuItemCell *)self menuItem];
    -[SCATMenuItemCell setScatMenuItemStyle:](self, "setScatMenuItemStyle:", [v9 style]);

    unsigned int v10 = [(SCATMenuItemCell *)self menuItem];
    [v10 iconImageAngle];
    -[SCATMenuItemCell setIconImageAngle:](self, "setIconImageAngle:");

    [(SCATMenuItemCell *)self setNeedsDisplay];
  }
}

- (void)flash
{
  [(SCATMenuItemCell *)self setIsFlashing:1];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BCE04;
  v5[3] = &unk_1001AAA68;
  objc_copyWeak(&v6, &location);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BCE60;
  v3[3] = &unk_1001AB930;
  objc_copyWeak(&v4, &location);
  +[UIView animateWithDuration:v5 animations:v3 completion:0.1];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)shouldUseActivityIndicator
{
  return self->_shouldUseActivityIndicator;
}

- (void)setShouldSuppressAudioOutput:(BOOL)a3
{
  self->_shouldSuppressAudioOutput = a3;
}

- (SCATModernMenuItem)menuItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuItem);

  return (SCATModernMenuItem *)WeakRetained;
}

- (void)setMenuItem:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (double)iconImageAngle
{
  return self->_iconImageAngle;
}

- (UIImageView)pressedBackgroundBorderImageView
{
  return self->_pressedBackgroundBorderImageView;
}

- (void)setPressedBackgroundBorderImageView:(id)a3
{
}

- (UIImage)defaultBackgroundImage
{
  return self->_defaultBackgroundImage;
}

- (void)setDefaultBackgroundImage:(id)a3
{
}

- (UIImage)pressedBackgroundImage
{
  return self->_pressedBackgroundImage;
}

- (UIImage)dimmedBackgroundImage
{
  return self->_dimmedBackgroundImage;
}

- (void)setDimmedBackgroundImage:(id)a3
{
}

- (SCATMenuLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (BOOL)shouldIncludeTextLabels
{
  return self->_shouldIncludeTextLabels;
}

- (UIImageView)backgroundBorderImageView
{
  return self->_backgroundBorderImageView;
}

- (void)setBackgroundBorderImageView:(id)a3
{
}

- (UIVisualEffectView)borderContainerView
{
  return self->_borderContainerView;
}

- (void)setBorderContainerView:(id)a3
{
}

- (UIImage)dimmedIconImage
{
  return self->_dimmedIconImage;
}

- (void)setDimmedIconImage:(id)a3
{
}

- (UIImage)highVisBackgroundAndIconImage
{
  return self->_highVisBackgroundAndIconImage;
}

- (void)setHighVisBackgroundAndIconImage:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIVisualEffect)iconEffect
{
  return self->_iconEffect;
}

- (void)setIconEffect:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIVisualEffectView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
}

- (BOOL)isFlashing
{
  return self->_isFlashing;
}

- (void)setIsFlashing:(BOOL)a3
{
  self->_isFlashing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_iconEffect, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_highVisBackgroundAndIconImage, 0);
  objc_storeStrong((id *)&self->_dimmedIconImage, 0);
  objc_storeStrong((id *)&self->_borderContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundBorderImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dimmedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_pressedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundImage, 0);
  objc_storeStrong((id *)&self->_pressedBackgroundBorderImageView, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_destroyWeak((id *)&self->_menuItem);

  objc_storeStrong((id *)&self->_titleHiddenConstraint, 0);
}

@end