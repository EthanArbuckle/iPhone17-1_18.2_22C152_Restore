@interface SectionHeaderView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSString)descriptionText;
- (NSString)titleText;
- (SectionHeaderView)initWithSpecifier:(id)a3;
- (UIImage)iconImage;
- (UILabel)descriptionLabel;
- (double)iconBottomToTitleFirstBaseline;
- (double)preferredHeightForWidth:(double)a3;
- (double)titleLastBaselineToDescriptionFirstBaseline;
- (double)topToIconTop;
@end

@implementation SectionHeaderView

- (SectionHeaderView)initWithSpecifier:(id)a3
{
  v65.receiver = self;
  v65.super_class = (Class)SectionHeaderView;
  v3 = [(SectionHeaderView *)&v65 init];
  v4 = v3;
  if (v3)
  {
    [(SectionHeaderView *)v3 setPreservesSuperviewLayoutMargins:1];
    id v5 = objc_alloc((Class)UIImageView);
    v6 = [(SectionHeaderView *)v4 iconImage];
    id v7 = [v5 initWithImage:v6];

    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setContentMode:1];
    [v7 frame];
    double v9 = v8 * 0.5;
    v10 = v7;
    v11 = [v7 layer];
    [v11 setCornerRadius:v9];

    [v10 setClipsToBounds:1];
    v12 = v10;
    [(SectionHeaderView *)v4 addSubview:v10];
    id v13 = objc_alloc_init((Class)UILabel);
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setAdjustsFontForContentSizeCategory:1];
    v64 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 addingSymbolicTraits:32770 options:0];
    v14 = +[UIFont fontWithDescriptor:v64 size:0.0];
    [v13 setFont:v14];

    v15 = [(SectionHeaderView *)v4 titleText];
    [v13 setText:v15];

    v16 = +[UIColor whiteColor];
    [v13 setTextColor:v16];

    [v13 setTextAlignment:1];
    [v13 setNumberOfLines:0];
    [(SectionHeaderView *)v4 addSubview:v13];
    v17 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v17 setAdjustsFontForContentSizeCategory:1];
    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v17 setFont:v18];

    v19 = [(SectionHeaderView *)v4 descriptionText];
    [(UILabel *)v17 setText:v19];

    v20 = +[UIColor whiteColor];
    [(UILabel *)v17 setTextColor:v20];

    [(UILabel *)v17 setTextAlignment:1];
    [(UILabel *)v17 setNumberOfLines:0];
    [(SectionHeaderView *)v4 addSubview:v17];
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v17;
    v22 = v17;

    v62 = [v12 topAnchor];
    v63 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v61 = [v63 topAnchor];
    [(SectionHeaderView *)v4 topToIconTop];
    v60 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61);
    v66[0] = v60;
    v58 = [v12 centerXAnchor];
    v59 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v56 = [v59 centerXAnchor];
    v55 = [v58 constraintEqualToAnchor:v56];
    v66[1] = v55;
    v54 = [v13 firstBaselineAnchor];
    v57 = v12;
    v53 = [v12 bottomAnchor];
    [(SectionHeaderView *)v4 iconBottomToTitleFirstBaseline];
    v52 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53);
    v66[2] = v52;
    v51 = [v13 firstBaselineAnchor];
    v50 = [v12 bottomAnchor];
    [(SectionHeaderView *)v4 iconBottomToTitleFirstBaseline];
    v48 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50);
    v66[3] = v48;
    v46 = [v13 leadingAnchor];
    v47 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v45 = [v47 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v66[4] = v44;
    v49 = v13;
    v42 = [v13 trailingAnchor];
    v43 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v41 = [v43 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v66[5] = v40;
    v39 = [(UILabel *)v22 firstBaselineAnchor];
    v38 = [v13 lastBaselineAnchor];
    [(SectionHeaderView *)v4 titleLastBaselineToDescriptionFirstBaseline];
    v37 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38);
    v66[6] = v37;
    v23 = v22;
    v35 = [(UILabel *)v22 centerXAnchor];
    v36 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v34 = [v36 centerXAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v66[7] = v33;
    v24 = [(UILabel *)v22 widthAnchor];
    v25 = [(SectionHeaderView *)v4 layoutMarginsGuide];
    v26 = [v25 widthAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 multiplier:0.8];
    v66[8] = v27;
    v28 = [(SectionHeaderView *)v4 bottomAnchor];
    v29 = [(UILabel *)v23 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v66[9] = v30;
    v31 = +[NSArray arrayWithObjects:v66 count:10];
    +[NSLayoutConstraint activateConstraints:v31];
  }
  return v4;
}

- (UIImage)iconImage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[UIImage imageNamed:@"ear_only" inBundle:v2];

  return (UIImage *)v3;
}

- (NSString)titleText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ENVIRONMENTAL_EXPOSURE_AREA_TITLE" value:&stru_8600 table:0];
  id v5 = [v2 localizedStringForKey:@"ENVIRONMENTAL_EXPOSURE_AREA_TITLE" value:v4 table:@"Noise"];

  return (NSString *)v5;
}

- (NSString)descriptionText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ENVIRONMENTAL_EXPOSURE_AREA_DESCRIPTION" value:&stru_8600 table:0];
  id v5 = [v2 localizedStringForKey:@"ENVIRONMENTAL_EXPOSURE_AREA_DESCRIPTION" value:v4 table:@"Noise"];

  return (NSString *)v5;
}

- (double)topToIconTop
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v2 _scaledValueForValue:34.0];
  double v4 = v3;

  return v4;
}

- (double)iconBottomToTitleFirstBaseline
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v2 _scaledValueForValue:34.0];
  double v4 = v3;

  return v4;
}

- (double)titleLastBaselineToDescriptionFirstBaseline
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 _scaledValueForValue:26.0];
  double v4 = v3;

  return v4;
}

- (double)preferredHeightForWidth:(double)a3
{
  id v5 = [(SectionHeaderView *)self descriptionLabel];
  [v5 directionalLayoutMargins];
  double v7 = a3 - v6;
  double v8 = [(SectionHeaderView *)self descriptionLabel];
  [v8 directionalLayoutMargins];
  double v10 = v7 - v9;

  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  -[SectionHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, 0.0, v11, v12);
  return v13;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return (unint64_t)(a6 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void).cxx_destruct
{
}

@end