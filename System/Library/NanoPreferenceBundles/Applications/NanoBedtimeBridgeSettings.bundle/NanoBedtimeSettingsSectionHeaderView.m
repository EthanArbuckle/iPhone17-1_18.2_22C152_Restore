@interface NanoBedtimeSettingsSectionHeaderView
- (NSString)descriptionText;
- (NSString)titleText;
- (NanoBedtimeSettingsSectionHeaderView)initWithSpecifier:(id)a3;
- (UIImage)iconImage;
- (double)iconBottomToTitleFirstBaselineMultiplier;
- (double)preferredHeightForWidth:(double)a3;
- (double)titleLastBaselineToDescriptionFirstBaseline;
- (double)topToIconTop;
@end

@implementation NanoBedtimeSettingsSectionHeaderView

- (NanoBedtimeSettingsSectionHeaderView)initWithSpecifier:(id)a3
{
  v60.receiver = self;
  v60.super_class = (Class)NanoBedtimeSettingsSectionHeaderView;
  v3 = [(NanoBedtimeSettingsSectionHeaderView *)&v60 init];
  v4 = v3;
  if (v3)
  {
    [(NanoBedtimeSettingsSectionHeaderView *)v3 setPreservesSuperviewLayoutMargins:1];
    id v5 = objc_alloc((Class)UIImageView);
    v6 = [(NanoBedtimeSettingsSectionHeaderView *)v4 iconImage];
    id v7 = [v5 initWithImage:v6];

    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setContentMode:1];
    v8 = v7;
    [(NanoBedtimeSettingsSectionHeaderView *)v4 addSubview:v7];
    id v9 = objc_alloc_init((Class)UILabel);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setAdjustsFontForContentSizeCategory:1];
    v10 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleLargeTitle symbolicTraits:32770];
    [v9 setFont:v10];

    v11 = [(NanoBedtimeSettingsSectionHeaderView *)v4 titleText];
    [v9 setText:v11];

    v12 = +[UIColor whiteColor];
    [v9 setTextColor:v12];

    [v9 setTextAlignment:1];
    [v9 setNumberOfLines:0];
    v13 = v9;
    [(NanoBedtimeSettingsSectionHeaderView *)v4 addSubview:v9];
    id v14 = objc_alloc_init((Class)UILabel);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setAdjustsFontForContentSizeCategory:1];
    v15 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
    [v14 setFont:v15];

    v16 = [(NanoBedtimeSettingsSectionHeaderView *)v4 descriptionText];
    [v14 setText:v16];

    v17 = +[UIColor whiteColor];
    [v14 setTextColor:v17];

    [v14 setTextAlignment:1];
    [v14 setNumberOfLines:0];
    [(NanoBedtimeSettingsSectionHeaderView *)v4 addSubview:v14];
    v58 = [v8 topAnchor];
    v59 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v57 = [v59 topAnchor];
    [(NanoBedtimeSettingsSectionHeaderView *)v4 topToIconTop];
    v56 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57);
    v61[0] = v56;
    v54 = [v8 centerXAnchor];
    v55 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v53 = [v55 centerXAnchor];
    v51 = [v54 constraintEqualToAnchor:v53];
    v61[1] = v51;
    v50 = [v8 widthAnchor];
    v49 = [v8 heightAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v61[2] = v48;
    v52 = v8;
    v47 = [v8 widthAnchor];
    v46 = [v47 constraintEqualToConstant:60.0];
    v61[3] = v46;
    v44 = [v13 firstBaselineAnchor];
    v43 = [v8 bottomAnchor];
    [(NanoBedtimeSettingsSectionHeaderView *)v4 iconBottomToTitleFirstBaselineMultiplier];
    v42 = objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v43);
    v61[4] = v42;
    v40 = [v13 leadingAnchor];
    v41 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v39 = [v41 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v61[5] = v38;
    v45 = v13;
    v36 = [v13 trailingAnchor];
    v37 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v35 = [v37 trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v61[6] = v34;
    v33 = [v14 firstBaselineAnchor];
    v32 = [v13 lastBaselineAnchor];
    [(NanoBedtimeSettingsSectionHeaderView *)v4 titleLastBaselineToDescriptionFirstBaseline];
    v31 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32);
    v61[7] = v31;
    v29 = [v14 leadingAnchor];
    v30 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v28 = [v30 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v61[8] = v27;
    v18 = [v14 trailingAnchor];
    v19 = [(NanoBedtimeSettingsSectionHeaderView *)v4 layoutMarginsGuide];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v61[9] = v21;
    v22 = [(NanoBedtimeSettingsSectionHeaderView *)v4 bottomAnchor];
    v23 = [v14 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v61[10] = v24;
    v25 = +[NSArray arrayWithObjects:v61 count:11];
    +[NSLayoutConstraint activateConstraints:v25];
  }
  return v4;
}

- (UIImage)iconImage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[UIImage imageNamed:@"sleepIcon" inBundle:v2];

  return (UIImage *)v3;
}

- (NSString)titleText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SLEEP_NAV_TITLE" value:&stru_C5E8 table:0];

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SLEEP_HEADER" value:&stru_C5E8 table:0];

  return (NSString *)v3;
}

- (double)topToIconTop
{
  v2 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleTitle1 symbolicTraits:0x8000];
  [v2 _scaledValueForValue:34.0];
  double v4 = v3;

  return v4;
}

- (double)iconBottomToTitleFirstBaselineMultiplier
{
  return 0.72;
}

- (double)titleLastBaselineToDescriptionFirstBaseline
{
  v2 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 _scaledValueForValue:26.0];
  double v4 = v3;

  return v4;
}

- (double)preferredHeightForWidth:(double)a3
{
  [(NanoBedtimeSettingsSectionHeaderView *)self directionalLayoutMargins];
  double v6 = a3 - v5;
  [(NanoBedtimeSettingsSectionHeaderView *)self directionalLayoutMargins];
  double v8 = v6 - v7;
  LODWORD(v9) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[NanoBedtimeSettingsSectionHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 0.0, v9, v7);
  return v10;
}

@end