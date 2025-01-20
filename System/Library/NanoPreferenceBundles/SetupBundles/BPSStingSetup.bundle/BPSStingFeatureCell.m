@interface BPSStingFeatureCell
+ (BOOL)isLargeText;
+ (id)reuseIdentifier;
- (BOOL)_largerThanMaxCategory;
- (BPSStingFeatureCell)initWithFrame:(CGRect)a3;
- (CGSize)_findOptimalTitleLineSize;
- (CGSize)getPreferredCellSize;
- (UIImageView)activityImageView;
- (UILabel)scratchLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)preferredCellHeight;
- (double)preferredCellWidth;
- (id)_subtitleLabelFont;
- (id)_titleLabelFont;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)setActivityImageView:(id)a3;
- (void)setImage:(id)a3 title:(id)a4 subtitle:(id)a5;
- (void)setPreferredCellHeight:(double)a3;
- (void)setPreferredCellWidth:(double)a3;
- (void)setScratchLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BPSStingFeatureCell

+ (id)reuseIdentifier
{
  return @"BPSStingFeatureCell";
}

+ (BOOL)isLargeText
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];

  BOOL v4 = UIContentSizeCategoryIsAccessibilityCategory(v3)
    || UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryLarge, v3) == NSOrderedAscending;

  return v4;
}

- (BPSStingFeatureCell)initWithFrame:(CGRect)a3
{
  v76.receiver = self;
  v76.super_class = (Class)BPSStingFeatureCell;
  v3 = -[BPSStingFeatureCell initWithFrame:](&v76, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = +[UIColor secondarySystemFillColor];
    id v5 = [v4 cgColor];
    v6 = [(BPSStingFeatureCell *)v3 layer];
    [v6 setBackgroundColor:v5];

    v7 = [(BPSStingFeatureCell *)v3 layer];
    [v7 setCornerRadius:18.0];

    v8 = [(BPSStingFeatureCell *)v3 layer];
    [v8 setCornerCurve:kCACornerCurveContinuous];

    [(BPSStingFeatureCell *)v3 setClipsToBounds:1];
    v9 = [(BPSStingFeatureCell *)v3 contentView];
    v10 = [v9 layer];
    [v10 setBorderWidth:4.0];

    id v11 = +[UIColor systemBlackColor];
    id v12 = [v11 CGColor];
    v13 = [(BPSStingFeatureCell *)v3 contentView];
    v14 = [v13 layer];
    [v14 setBorderColor:v12];

    v15 = [(BPSStingFeatureCell *)v3 contentView];
    v16 = [v15 layer];
    [v16 setCornerRadius:18.0];

    v17 = [(BPSStingFeatureCell *)v3 contentView];
    v18 = [v17 layer];
    [v18 setCornerCurve:kCACornerCurveContinuous];

    id v19 = +[UIColor systemBlackColor];
    id v20 = [v19 CGColor];
    v21 = [(BPSStingFeatureCell *)v3 layer];
    [v21 setBorderColor:v20];

    v22 = [(BPSStingFeatureCell *)v3 layer];
    [v22 setBorderWidth:2.0];

    uint64_t v23 = objc_opt_new();
    activityImageView = v3->_activityImageView;
    v3->_activityImageView = (UIImageView *)v23;

    [(UIImageView *)v3->_activityImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_activityImageView setClipsToBounds:1];
    [(UIImageView *)v3->_activityImageView setContentMode:1];
    v75 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle2 scale:2];
    [(UIImageView *)v3->_activityImageView setPreferredSymbolConfiguration:v75];
    [(BPSStingFeatureCell *)v3 addSubview:v3->_activityImageView];
    uint64_t v25 = objc_opt_new();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v25;

    v27 = v3->_titleLabel;
    v28 = [(BPSStingFeatureCell *)v3 _titleLabelFont];
    [(UILabel *)v27 setFont:v28];

    v29 = +[UIColor systemWhiteColor];
    [(UILabel *)v3->_titleLabel setColor:v29];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = +[NSLocale currentLocale];
    v31 = [v30 localeIdentifier];
    v32 = [(BPSStingFeatureCell *)v3 traitOverrides];
    [v32 setTypesettingLanguage:v31];

    [(UILabel *)v3->_titleLabel _setWantsContentAwareTypesettingLanguage:1];
    [(BPSStingFeatureCell *)v3 addSubview:v3->_titleLabel];
    uint64_t v33 = objc_opt_new();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v33;

    v35 = v3->_subtitleLabel;
    v36 = [(BPSStingFeatureCell *)v3 _subtitleLabelFont];
    [(UILabel *)v35 setFont:v36];

    v37 = v3->_subtitleLabel;
    v38 = +[UIColor systemGrayColor];
    [(UILabel *)v37 setTextColor:v38];

    [(UILabel *)v3->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:2];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BPSStingFeatureCell *)v3 addSubview:v3->_subtitleLabel];
    v73 = [(UIImageView *)v3->_activityImageView leadingAnchor];
    v74 = [(BPSStingFeatureCell *)v3 contentView];
    v72 = [v74 leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72 constant:14.0];
    v77[0] = v71;
    v69 = [(UIImageView *)v3->_activityImageView topAnchor];
    v70 = [(BPSStingFeatureCell *)v3 contentView];
    v68 = [v70 topAnchor];
    v67 = [v69 constraintEqualToAnchor:v68 constant:14.0];
    v77[1] = v67;
    v65 = [(UILabel *)v3->_subtitleLabel bottomAnchor];
    v66 = [(BPSStingFeatureCell *)v3 contentView];
    v64 = [v66 bottomAnchor];
    v63 = [v65 constraintEqualToAnchor:v64 constant:-14.0];
    v77[2] = v63;
    v62 = [(UILabel *)v3->_subtitleLabel leadingAnchor];
    v61 = [(BPSStingFeatureCell *)v3 leadingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:14.0];
    v77[3] = v60;
    v59 = [(UILabel *)v3->_subtitleLabel trailingAnchor];
    v58 = [(BPSStingFeatureCell *)v3 trailingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:-14.0];
    v77[4] = v57;
    v56 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v55 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v77[5] = v54;
    v39 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v40 = [(BPSStingFeatureCell *)v3 contentView];
    v41 = [v40 leadingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:14.0];
    v77[6] = v42;
    v43 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v44 = [(BPSStingFeatureCell *)v3 contentView];
    v45 = [v44 trailingAnchor];
    v46 = [v43 constraintEqualToAnchor:v45 constant:-14.0];
    v77[7] = v46;
    v47 = +[NSArray arrayWithObjects:v77 count:8];
    +[NSLayoutConstraint activateConstraints:v47];

    uint64_t v48 = objc_opt_new();
    scratchLabel = v3->_scratchLabel;
    v3->_scratchLabel = (UILabel *)v48;

    v50 = v3->_scratchLabel;
    v51 = [(BPSStingFeatureCell *)v3 _titleLabelFont];
    [(UILabel *)v50 setFont:v51];

    v52 = +[UIColor systemWhiteColor];
    [(UILabel *)v3->_scratchLabel setColor:v52];

    [(UILabel *)v3->_scratchLabel setNumberOfLines:0];
    [(UILabel *)v3->_scratchLabel setLineBreakMode:0];
    [(UILabel *)v3->_scratchLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_scratchLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v3;
}

- (id)_titleLabelFont
{
  if ([(BPSStingFeatureCell *)self _largerThanMaxCategory])
  {
    v2 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge];
    v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v2];
  }
  else
  {
    v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  }
  BOOL v4 = [v3 fontDescriptor];
  id v5 = [v4 fontDescriptorWithSymbolicTraits:32770];

  v6 = +[UIFont fontWithDescriptor:v5 size:0.0];

  return v6;
}

- (id)_subtitleLabelFont
{
  v3 = bps_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = +[UIApplication sharedApplication];
    id v5 = [v4 preferredContentSizeCategory];
    *(_DWORD *)buf = 136315394;
    v21 = "-[BPSStingFeatureCell _subtitleLabelFont]";
    __int16 v22 = 2112;
    UIContentSizeCategory v23 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: preferredContentSizeCategory is %@", buf, 0x16u);
  }
  if ([(BPSStingFeatureCell *)self _largerThanMaxCategory])
  {
    v6 = bps_setup_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[BPSStingFeatureCell _subtitleLabelFont]";
      __int16 v22 = 2112;
      UIContentSizeCategory v23 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
      __int16 v24 = 2112;
      UIContentSizeCategory v25 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: preferredContentSizeCategory is larger than %@ forcing %@", buf, 0x20u);
    }

    v7 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge];
    v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2 compatibleWithTraitCollection:v7];
  }
  else
  {
    v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
  }
  v9 = [v8 fontDescriptor];
  UIFontDescriptorTraitKey v18 = UIFontWeightTrait;
  v10 = +[NSNumber numberWithDouble:UIFontWeightMedium];
  id v19 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v13 = [v9 fontDescriptorByAddingAttributes:v12];

  v14 = +[UIFont fontWithDescriptor:v13 size:0.0];

  return v14;
}

- (BOOL)_largerThanMaxCategory
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryAccessibilityExtraExtraLarge, v3) == NSOrderedAscending;
  return (char)v2;
}

- (void)setImage:(id)a3 title:(id)a4 subtitle:(id)a5
{
  activityImageView = self->_activityImageView;
  id v9 = a5;
  id v10 = a4;
  [(UIImageView *)activityImageView setImage:a3];
  [(UILabel *)self->_titleLabel setText:v10];

  [(UILabel *)self->_subtitleLabel setText:v9];

  [(BPSStingFeatureCell *)self layoutSubviews];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BPSStingFeatureCell;
  -[BPSStingFeatureCell setSelected:](&v8, "setSelected:");
  if (v3) {
    +[UIColor systemOrangeColor];
  }
  else {
  id v5 = +[UIColor systemBlackColor];
  }
  id v6 = [v5 CGColor];
  v7 = [(BPSStingFeatureCell *)self layer];
  [v7 setBorderColor:v6];
}

- (CGSize)getPreferredCellSize
{
  [(BPSStingFeatureCell *)self _findOptimalTitleLineSize];
  double v4 = v3;
  double v6 = v5 + 28.0;
  subtitleLabel = self->_subtitleLabel;
  -[UILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](subtitleLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v9 = v8 + 28.0;
  if (v8 + 28.0 >= v6) {
    double v10 = v8 + 28.0;
  }
  else {
    double v10 = v6;
  }
  if (self->_preferredCellWidth >= v10) {
    double preferredCellWidth = self->_preferredCellWidth;
  }
  else {
    double preferredCellWidth = v10;
  }
  unsigned int v12 = +[BPSStingFeatureCell isLargeText];
  double preferredCellHeight = 0.0;
  if (v12)
  {
    if (preferredCellWidth < v9) {
      double preferredCellWidth = v9;
    }
    activityImageView = self->_activityImageView;
    -[UIImageView sizeThatFits:](activityImageView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    -[UIImageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](activityImageView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v16 = v15;
    v17 = self->_subtitleLabel;
    -[UILabel sizeThatFits:](v17, "sizeThatFits:", preferredCellWidth, 1.79769313e308);
    -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v17, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v19 = v4 + v16 + v18 + 8.0 + 20.0;
    double preferredCellHeight = self->_preferredCellHeight;
    if (preferredCellHeight < v19) {
      double preferredCellHeight = v19;
    }
  }
  double v20 = fmax(preferredCellWidth, 127.0);
  double v21 = fmax(preferredCellHeight, 106.0);
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)_findOptimalTitleLineSize
{
  [(UILabel *)self->_scratchLabel setText:@"1\n2"];
  scratchLabel = self->_scratchLabel;
  double v4 = 127.0;
  -[UILabel sizeThatFits:](scratchLabel, "sizeThatFits:", 127.0, 1.79769313e308);
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](scratchLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v6 = v5;
  titleLabel = self->_titleLabel;
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", 127.0, 1.79769313e308);
  -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](titleLabel, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v9 = v8;
  double v11 = v10;
  if (v10 > v6)
  {
    unsigned int v12 = self->_titleLabel;
    -[UILabel sizeThatFits:](v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
    double v14 = v13;
    if (v13 >= 127.0)
    {
      double v4 = 127.0;
      do
      {
        double v15 = floor((v14 + v4) * 0.5);
        double v16 = self->_titleLabel;
        -[UILabel sizeThatFits:](v16, "sizeThatFits:", v15, 1.79769313e308);
        -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
        double v9 = v17;
        double v11 = v18;
        if (v18 <= v6)
        {
          double v20 = self->_titleLabel;
          double v19 = v15 + -1.0;
          -[UILabel sizeThatFits:](v20, "sizeThatFits:", v19, 1.79769313e308);
          -[UILabel systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
          if (v21 > v6) {
            break;
          }
        }
        else
        {
          double v4 = v15 + 1.0;
          double v19 = v14;
        }
        double v14 = v19;
      }
      while (v4 <= v19);
    }
    if (v4 <= v14)
    {
      __int16 v22 = bps_setup_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        UIContentSizeCategory v23 = [(UILabel *)self->_titleLabel text];
        int v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Failed to find a width that meets criteria.  Layout of sting tile could be weird. Word: %@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  double v24 = v9;
  double v25 = v11;
  result.height = v25;
  result.width = v24;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BPSStingFeatureCell;
  double v4 = [(BPSStingFeatureCell *)&v8 preferredLayoutAttributesFittingAttributes:a3];
  [(BPSStingFeatureCell *)self getPreferredCellSize];
  objc_msgSend(v4, "setSize:");
  double v5 = bps_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 size];
    double v6 = NSStringFromCGSize(v14);
    *(_DWORD *)buf = 136315394;
    double v10 = "-[BPSStingFeatureCell preferredLayoutAttributesFittingAttributes:]";
    __int16 v11 = 2112;
    unsigned int v12 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: attributes size is %@", buf, 0x16u);
  }

  return v4;
}

- (double)preferredCellWidth
{
  return self->_preferredCellWidth;
}

- (void)setPreferredCellWidth:(double)a3
{
  self->_double preferredCellWidth = a3;
}

- (double)preferredCellHeight
{
  return self->_preferredCellHeight;
}

- (void)setPreferredCellHeight:(double)a3
{
  self->_double preferredCellHeight = a3;
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
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

- (UILabel)scratchLabel
{
  return self->_scratchLabel;
}

- (void)setScratchLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scratchLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_activityImageView, 0);
}

@end