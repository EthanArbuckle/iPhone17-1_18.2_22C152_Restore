@interface BuddyGetStartedSecondaryContentView
- (BOOL)shouldUseAccessibilityLayout;
- (BuddyGetStartedSecondaryContentView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UILabel)contentLabel;
- (UILabel)spinnerLabel;
- (id)_labelFont;
- (int64_t)_activityIndicatorViewStyle;
- (void)_updateContentLabelLayout;
- (void)setContentLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyGetStartedSecondaryContentView

- (BuddyGetStartedSecondaryContentView)initWithFrame:(CGRect)a3
{
  CGRect v57 = a3;
  SEL v55 = a2;
  id location = 0;
  v54.receiver = self;
  v54.super_class = (Class)BuddyGetStartedSecondaryContentView;
  id location = -[BuddyGetStartedSecondaryContentView initWithFrame:](&v54, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[NSBundle mainBundle];
    id v4 = (id)SFLocalizableWAPIStringKeyForKey();
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v4];
    id v53 = [(NSBundle *)v3 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];

    id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v7 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v6;

    [*((id *)location + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 1) setText:v53];
    id v8 = [location _labelFont];
    [*((id *)location + 1) setFont:v8];

    v9 = +[UIColor labelColor];
    [*((id *)location + 1) setTextColor:v9];

    v10 = +[UIColor clearColor];
    [*((id *)location + 1) setBackgroundColor:v10];

    [*((id *)location + 1) setNumberOfLines:0];
    id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v12 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v11;

    [*((id *)location + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[NSBundle mainBundle];
    v14 = [(NSBundle *)v13 localizedStringForKey:@"PROXIMITY_SETUP_LOOKING_FOR_DEVICES" value:&stru_1002B4E18 table:@"Localizable"];
    [*((id *)location + 2) setText:v14];

    id v15 = [location _labelFont];
    [*((id *)location + 2) setFont:v15];

    v16 = +[UIColor labelColor];
    [*((id *)location + 2) setTextColor:v16];

    [*((id *)location + 2) setNumberOfLines:0];
    [*((id *)location + 2) setTextAlignment:1];
    id v17 = objc_alloc((Class)UIActivityIndicatorView);
    id v18 = [v17 initWithActivityIndicatorStyle:[location _activityIndicatorViewStyle]];
    v19 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v18;

    [*((id *)location + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [location addSubview:*((void *)location + 3)];
    [location addSubview:*((void *)location + 2)];
    [location addSubview:*((void *)location + 1)];
    [*((id *)location + 3) startAnimating];
    id v52 = [*((id *)location + 2) topAnchor];
    id v51 = [location topAnchor];
    id v50 = [v52 constraintEqualToAnchor:15.0];
    v58[0] = v50;
    id v49 = [*((id *)location + 2) centerXAnchor];
    id v48 = [location centerXAnchor];
    id v47 = [v49 constraintEqualToAnchor:];
    v58[1] = v47;
    id v46 = [*((id *)location + 3) leadingAnchor];
    id v45 = [location leadingAnchor];
    id v44 = [v46 constraintGreaterThanOrEqualToAnchor:];
    v58[2] = v44;
    id v43 = [*((id *)location + 3) centerYAnchor];
    id v42 = [*((id *)location + 2) centerYAnchor];
    id v41 = [v43 constraintEqualToAnchor:];
    v58[3] = v41;
    id v40 = [*((id *)location + 3) trailingAnchor];
    id v39 = [*((id *)location + 2) leadingAnchor];
    id v38 = [v40 constraintEqualToAnchor:-10.0];
    v58[4] = v38;
    id v37 = [*((id *)location + 2) trailingAnchor];
    id v36 = [location trailingAnchor];
    [v37 constraintLessThanOrEqualToAnchor:];
    v58[5] = v35;
    id v34 = [*((id *)location + 1) topAnchor];
    id v33 = [*((id *)location + 2) bottomAnchor];
    id v32 = [v34 constraintEqualToAnchor:20.0];
    v58[6] = v32;
    id v20 = [*((id *)location + 1) leadingAnchor];
    id v21 = [location leadingAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    v58[7] = v22;
    id v23 = [*((id *)location + 1) trailingAnchor];
    id v24 = [location trailingAnchor];
    id v25 = [v23 constraintEqualToAnchor:v24];
    v58[8] = v25;
    id v26 = [*((id *)location + 1) bottomAnchor];
    id v27 = [location bottomAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];
    v58[9] = v28;
    v29 = +[NSArray arrayWithObjects:v58 count:10];
    +[NSLayoutConstraint activateConstraints:v29];

    [location _updateContentLabelLayout];
    objc_storeStrong(&v53, 0);
  }
  v30 = (BuddyGetStartedSecondaryContentView *)location;
  objc_storeStrong(&location, 0);
  return v30;
}

- (BOOL)shouldUseAccessibilityLayout
{
  lhs[2] = (UIContentSizeCategory)&self->super.super.super.isa;
  lhs[1] = (UIContentSizeCategory)a2;
  v2 = +[UIApplication sharedApplication];
  lhs[0] = [(UIApplication *)v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(lhs[0], UIContentSizeCategoryExtraExtraExtraLarge) > NSOrderedSame;
  objc_storeStrong((id *)lhs, 0);
  return v2 & 1;
}

- (int64_t)_activityIndicatorViewStyle
{
  if ([(BuddyGetStartedSecondaryContentView *)self shouldUseAccessibilityLayout]) {
    return 101;
  }
  else {
    return 100;
  }
}

- (void)_updateContentLabelLayout
{
  if ([(BuddyGetStartedSecondaryContentView *)self shouldUseAccessibilityLayout])
  {
    v2 = [(BuddyGetStartedSecondaryContentView *)self contentLabel];
    [(UILabel *)v2 setTextAlignment:4];
  }
  else
  {
    v2 = [(BuddyGetStartedSecondaryContentView *)self contentLabel];
    [(UILabel *)v2 setTextAlignment:1];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)BuddyGetStartedSecondaryContentView;
  [(BuddyGetStartedSecondaryContentView *)&v9 traitCollectionDidChange:location[0]];
  id v3 = [(BuddyGetStartedSecondaryContentView *)v11 _activityIndicatorViewStyle];
  id v4 = [(BuddyGetStartedSecondaryContentView *)v11 spinner];
  [(UIActivityIndicatorView *)v4 setActivityIndicatorViewStyle:v3];

  id v5 = [(BuddyGetStartedSecondaryContentView *)v11 _labelFont];
  id v6 = [(BuddyGetStartedSecondaryContentView *)v11 spinnerLabel];
  [(UILabel *)v6 setFont:v5];

  id v7 = [(BuddyGetStartedSecondaryContentView *)v11 _labelFont];
  id v8 = [(BuddyGetStartedSecondaryContentView *)v11 contentLabel];
  [(UILabel *)v8 setFont:v7];

  [(BuddyGetStartedSecondaryContentView *)v11 _updateContentLabelLayout];
  objc_storeStrong(location, 0);
}

- (id)_labelFont
{
  id v2 = [(BuddyGetStartedSecondaryContentView *)self traitCollection];
  id v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v2];
  id v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
}

- (UILabel)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end