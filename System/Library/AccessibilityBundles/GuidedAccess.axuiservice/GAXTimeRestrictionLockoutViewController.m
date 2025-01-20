@interface GAXTimeRestrictionLockoutViewController
- (AXUIAlertStyleProvider)styleProvider;
- (GAXTimeRestrictionLockoutViewController)initWithUIServer:(id)a3;
- (GAXUIServer)uiServer;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UIView)contentView;
- (double)appTimeRestrictionDuration;
- (id)_subtitleFont;
- (id)_titleFont;
- (unint64_t)supportedInterfaceOrientations;
- (void)contentSizeCategoryPrefChanged:(id)a3;
- (void)loadView;
- (void)setAppTimeRestrictionDuration:(double)a3;
- (void)setContentView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUiServer:(id)a3;
@end

@implementation GAXTimeRestrictionLockoutViewController

- (GAXTimeRestrictionLockoutViewController)initWithUIServer:(id)a3
{
  id v4 = a3;
  if (AXDeviceIsPad()) {
    CFStringRef v5 = @"GAXTimeRestrictionLockoutView_ipad";
  }
  else {
    CFStringRef v5 = @"GAXTimeRestrictionLockoutView_iphone";
  }
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v11.receiver = self;
  v11.super_class = (Class)GAXTimeRestrictionLockoutViewController;
  v7 = [(GAXViewController *)&v11 initWithNibName:v5 bundle:v6];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)AXUIAlertStyleProvider);
    [(GAXTimeRestrictionLockoutViewController *)v7 setStyleProvider:v8];

    [(GAXTimeRestrictionLockoutViewController *)v7 setUiServer:v4];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v7 selector:"contentSizeCategoryPrefChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v7;
}

- (void)contentSizeCategoryPrefChanged:(id)a3
{
  id v4 = [(GAXTimeRestrictionLockoutViewController *)self _titleFont];
  CFStringRef v5 = [(GAXTimeRestrictionLockoutViewController *)self titleLabel];
  [v5 setFont:v4];

  v6 = [(GAXTimeRestrictionLockoutViewController *)self _subtitleFont];
  v7 = [(GAXTimeRestrictionLockoutViewController *)self subtitleLabel];
  [v7 setFont:v6];

  id v12 = +[UIApplication sharedApplication];
  id v8 = [v12 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v8)) {
    float v9 = 1.0;
  }
  else {
    float v9 = 0.0;
  }
  v10 = [(GAXTimeRestrictionLockoutViewController *)self subtitleLabel];
  *(float *)&double v11 = v9;
  [v10 _setHyphenationFactor:v11];
}

- (id)_titleFont
{
  if (AXDeviceIsPad()) {
    double v2 = 48.0;
  }
  else {
    double v2 = 36.0;
  }
  id v3 = [objc_alloc((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  [v3 scaledValueForValue:v2];
  double v5 = v4;

  return +[UIFont _thinSystemFontOfSize:v5];
}

- (id)_subtitleFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v7 setAutoresizingMask:18];
  id v8 = +[UIColor blackColor];
  float v9 = [v8 colorWithAlphaComponent:0.8];
  [v7 setBackgroundColor:v9];

  [(GAXViewController *)self setView:v7];
  v80 = objc_opt_new();
  [v80 setIndicatorStyle:2];
  [(GAXTimeRestrictionLockoutViewController *)self setScrollView:v80];
  v10 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v11 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  [v7 addSubview:v11];

  id v12 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  [v13 addSubview:v12];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXTimeRestrictionLockoutViewController *)self setContentView:v12];
  v14 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v15 = [v14 topAnchor];
  v16 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v20 = [v19 bottomAnchor];
  v21 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v25 = [v24 leadingAnchor];
  v26 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v27 = [v26 leadingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v30 = [v29 trailingAnchor];
  v31 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v32 = [v31 trailingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  v34 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v35 = [v34 widthAnchor];
  v36 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v37 = [v36 widthAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  id v39 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v12 addSubview:v39];
  [(GAXTimeRestrictionLockoutViewController *)self setTitleLabel:v39];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = GAXLocString(@"GAX_TIME_RESTRICTION_LOCKOUT_VIEW_TITLE");
  [v39 setText:v40];

  v41 = [(GAXTimeRestrictionLockoutViewController *)self _titleFont];
  [v39 setFont:v41];

  v42 = +[UIColor whiteColor];
  [v39 setColor:v42];

  [v39 setTextAlignment:1];
  [v39 setNumberOfLines:0];
  id v43 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v12 addSubview:v43];
  [(GAXTimeRestrictionLockoutViewController *)self setSubtitleLabel:v43];
  v44 = +[UIApplication sharedApplication];
  v45 = [v44 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v45);
  double v47 = 0.0;
  if (IsAccessibilityCategory) {
    *(float *)&double v47 = 1.0;
  }
  [v43 _setHyphenationFactor:v47];

  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  v48 = GAXLocString(@"GAX_TIME_RESTRICTION_LOCKOUT_VIEW_SUBTITLE");
  [(GAXTimeRestrictionLockoutViewController *)self appTimeRestrictionDuration];
  v50 = GAXLocalizedStringForTimeDuration(v49);
  v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v50);
  [v43 setText:v51];

  v52 = [(GAXTimeRestrictionLockoutViewController *)self _subtitleFont];
  [v43 setFont:v52];

  v53 = +[UIColor whiteColor];
  [v43 setColor:v53];

  [v43 setTextAlignment:1];
  [v43 setNumberOfLines:0];
  v81[0] = @"titleXPadding";
  if (AXDeviceIsPad()) {
    v54 = &off_61730;
  }
  else {
    v54 = &off_61740;
  }
  v81[1] = @"titleBottomPadding";
  v82[0] = v54;
  int IsPad = AXDeviceIsPad();
  v56 = &off_61750;
  if (!IsPad) {
    v56 = &off_61760;
  }
  v82[1] = v56;
  v57 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
  v58 = _NSDictionaryOfVariableBindings(@"rootView, contentView, titleLabel, subtitleLabel, scrollView", v7, v12, v39, v43, v80, 0);
  v59 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:v57 views:v58];
  v79 = v7;
  [v7 addConstraints:v59];

  v60 = +[NSLayoutConstraint constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v80 attribute:10 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v60];

  LODWORD(v61) = 1148846080;
  [v39 setContentCompressionResistancePriority:1 forAxis:v61];
  LODWORD(v62) = 1148846080;
  [v43 setContentCompressionResistancePriority:1 forAxis:v62];
  v63 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-titleXPadding-[titleLabel]-titleXPadding-|", 0, v57, v58);
  [v12 addConstraints:v63];

  v64 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-titleXPadding-[subtitleLabel]-titleXPadding-|", 0, v57, v58);
  v78 = v12;
  [v12 addConstraints:v64];

  v65 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[titleLabel]-titleBottomPadding-[subtitleLabel]|", 96, v57, v58);
  [v12 addConstraints:v65];

  v66 = [(GAXTimeRestrictionLockoutViewController *)self contentView];
  v67 = [v66 heightAnchor];
  v68 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v69 = [v68 heightAnchor];
  v70 = [v67 constraintEqualToAnchor:v69];

  LODWORD(v71) = 1144750080;
  [v70 setPriority:v71];
  [v70 setActive:1];
  v72 = [(GAXTimeRestrictionLockoutViewController *)self scrollView];
  v73 = [v72 heightAnchor];
  v74 = [v79 heightAnchor];
  if (AXDeviceIsPad()) {
    v75 = &off_61750;
  }
  else {
    v75 = &off_61760;
  }
  [v75 doubleValue];
  v77 = [v73 constraintLessThanOrEqualToAnchor:v74 multiplier:1.0 constant:v76 * -2.0];

  [v77 setActive:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setAppTimeRestrictionDuration:(double)a3
{
  self->_appTimeRestrictionDuration = a3;
  GAXLocString(@"GAX_TIME_RESTRICTION_LOCKOUT_VIEW_SUBTITLE");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = GAXLocalizedStringForTimeDuration(a3);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5);
  id v7 = [(GAXTimeRestrictionLockoutViewController *)self subtitleLabel];
  [v7 setText:v6];
}

- (AXUIAlertStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (GAXUIServer)uiServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiServer);

  return (GAXUIServer *)WeakRetained;
}

- (void)setUiServer:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (double)appTimeRestrictionDuration
{
  return self->_appTimeRestrictionDuration;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_uiServer);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end