@interface BuddyExpressSetupFeatureCardPrimaryCell
- (BOOL)isChevronHidden;
- (BOOL)isExpanded;
- (BuddyExpressSetupFeatureCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (UIImageView)chevronImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelContainer;
- (UIView)iconView;
- (UIView)separatorView;
- (id)_chevronImage;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)setChevronHidden:(BOOL)a3;
- (void)setChevronImageView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setNumberOfLinesForSubtitle:(int64_t)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyExpressSetupFeatureCardPrimaryCell

- (BuddyExpressSetupFeatureCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v82 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v80 = 0;
  objc_storeStrong(&v80, a4);
  id v79 = 0;
  objc_storeStrong(&v79, a5);
  id v7 = v82;
  id v82 = 0;
  v78.receiver = v7;
  v78.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCell;
  id v82 = -[BuddyExpressSetupFeatureCardPrimaryCell initWithFrame:](&v78, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v82, v82);
  if (v82)
  {
    id v8 = objc_alloc((Class)UIImageView);
    id v9 = [v8 initWithImage:v79];
    v10 = (void *)*((void *)v82 + 2);
    *((void *)v82 + 2) = v9;

    [*((id *)v82 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v82 + 2) setContentMode:1];
    id v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v12 = (void *)*((void *)v82 + 4);
    *((void *)v82 + 4) = v11;

    [*((id *)v82 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = [v82 _titleFont];
    [*((id *)v82 + 4) setFont:v13];

    [*((id *)v82 + 4) setText:location[0]];
    [*((id *)v82 + 4) setNumberOfLines:0];
    id v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v15 = (void *)*((void *)v82 + 5);
    *((void *)v82 + 5) = v14;

    [*((id *)v82 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIColor secondaryLabelColor];
    [*((id *)v82 + 5) setTextColor:v16];

    id v17 = [v82 _subtitleFont];
    [*((id *)v82 + 5) setFont:v17];

    [*((id *)v82 + 5) setText:v80];
    id v18 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v19 = (void *)*((void *)v82 + 3);
    *((void *)v82 + 3) = v18;

    [*((id *)v82 + 3) setAxis:1];
    [*((id *)v82 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v82 + 3) addArrangedSubview:*((void *)v82 + 4)];
    [*((id *)v82 + 3) addArrangedSubview:*((void *)v82 + 5)];
    id v20 = objc_alloc((Class)UIImageView);
    id v21 = [v82 _chevronImage];
    id v22 = [v20 initWithImage:v21];
    v23 = (void *)*((void *)v82 + 6);
    *((void *)v82 + 6) = v22;

    v24 = +[UIColor secondaryLabelColor];
    v25 = [(UIColor *)v24 colorWithAlphaComponent:0.3];
    [*((id *)v82 + 6) setTintColor:v25];

    [*((id *)v82 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v82 + 6) setContentMode:1];
    LODWORD(v26) = 1148846080;
    [*((id *)v82 + 6) setContentHuggingPriority:0 forAxis:v26];
    id v27 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v28 = (void *)*((void *)v82 + 7);
    *((void *)v82 + 7) = v27;

    [*((id *)v82 + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v82 + 7) setHidden:1];
    v29 = +[UIColor separatorColor];
    [*((id *)v82 + 7) setBackgroundColor:v29];

    [v82 addSubview:*((void *)v82 + 2)];
    [v82 addSubview:*((void *)v82 + 3)];
    [v82 addSubview:*((void *)v82 + 6)];
    [v82 addSubview:*((void *)v82 + 7)];
    id v68 = v82;
    id v77 = [*((id *)v82 + 2) widthAnchor];
    id v76 = [v77 constraintEqualToConstant:40.0];
    v83[0] = v76;
    id v75 = [*((id *)v82 + 2) heightAnchor];
    id v74 = [v75 constraintEqualToConstant:40.0];
    v83[1] = v74;
    id v72 = [*((id *)v82 + 2) leadingAnchor];
    id v73 = [v82 layoutMarginsGuide];
    id v71 = [v73 leadingAnchor];
    id v70 = [v72 constraintEqualToAnchor:];
    v83[2] = v70;
    id v69 = [*((id *)v82 + 2) centerYAnchor];
    id v67 = [v82 centerYAnchor];
    id v66 = [v69 constraintEqualToAnchor:];
    v83[3] = v66;
    id v65 = [*((id *)v82 + 3) leadingAnchor];
    id v64 = [*((id *)v82 + 2) trailingAnchor];
    id v63 = [v65 constraintEqualToAnchor:14.0];
    v83[4] = v63;
    id v62 = [*((id *)v82 + 3) trailingAnchor];
    id v61 = [*((id *)v82 + 6) leadingAnchor];
    id v60 = [v62 constraintEqualToAnchor:];
    v83[5] = v60;
    id v59 = [*((id *)v82 + 3) centerYAnchor];
    id v58 = [v82 centerYAnchor];
    id v57 = [v59 constraintEqualToAnchor:];
    v83[6] = v57;
    id v56 = [*((id *)v82 + 3) topAnchor];
    id v55 = [v82 topAnchor];
    id v54 = [v56 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:1.0];
    v83[7] = v54;
    id v53 = [v82 bottomAnchor];
    id v52 = [*((id *)v82 + 3) bottomAnchor];
    id v51 = [v53 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:1.0];
    v83[8] = v51;
    id v50 = [*((id *)v82 + 6) centerYAnchor];
    id v49 = [v82 centerYAnchor];
    [v50 constraintEqualToAnchor:];
    v83[9] = v48;
    id v46 = [*((id *)v82 + 6) trailingAnchor];
    id v47 = [v82 layoutMarginsGuide];
    id v45 = [v47 trailingAnchor];
    id v44 = [v46 constraintEqualToAnchor:];
    v83[10] = v44;
    id v43 = [*((id *)v82 + 7) heightAnchor];
    id v42 = [v43 constraintEqualToConstant:1.0];
    v83[11] = v42;
    id v30 = [*((id *)v82 + 7) leadingAnchor];
    id v31 = [*((id *)v82 + 3) leadingAnchor];
    id v32 = [v30 constraintEqualToAnchor:v31];
    v83[12] = v32;
    id v33 = [*((id *)v82 + 7) trailingAnchor];
    id v34 = [v82 trailingAnchor];
    id v35 = [v33 constraintEqualToAnchor:v34];
    v83[13] = v35;
    id v36 = [*((id *)v82 + 7) bottomAnchor];
    id v37 = [v82 bottomAnchor];
    id v38 = [v36 constraintEqualToAnchor:v37];
    v83[14] = v38;
    v39 = +[NSArray arrayWithObjects:v83 count:15];
    [v68 addConstraints:v39];
  }
  v40 = (BuddyExpressSetupFeatureCardPrimaryCell *)v82;
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v80, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v82, 0);
  return v40;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  id v3 = [(BuddyExpressSetupFeatureCardPrimaryCell *)self _chevronImage];
  v4 = [(BuddyExpressSetupFeatureCardPrimaryCell *)self chevronImageView];
  [(UIImageView *)v4 setImage:v3];

  v5 = [(BuddyExpressSetupFeatureCardPrimaryCell *)self separatorView];
  [(UIView *)v5 setHidden:!a3];
}

- (void)setChevronHidden:(BOOL)a3
{
  self->_chevronHidden = a3;
  v4 = [(BuddyExpressSetupFeatureCardPrimaryCell *)self chevronImageView];
  [(UIImageView *)v4 setHidden:a3];
}

- (void)setNumberOfLinesForSubtitle:(int64_t)a3
{
  v4 = [(BuddyExpressSetupFeatureCardPrimaryCell *)self subtitleLabel];
  [(UILabel *)v4 setNumberOfLines:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)BuddyExpressSetupFeatureCardPrimaryCell;
  [(BuddyExpressSetupFeatureCardPrimaryCell *)&v7 traitCollectionDidChange:location[0]];
  id v3 = [(BuddyExpressSetupFeatureCardPrimaryCell *)v9 _titleFont];
  v4 = [(BuddyExpressSetupFeatureCardPrimaryCell *)v9 titleLabel];
  [(UILabel *)v4 setFont:v3];

  id v5 = [(BuddyExpressSetupFeatureCardPrimaryCell *)v9 _subtitleFont];
  v6 = [(BuddyExpressSetupFeatureCardPrimaryCell *)v9 subtitleLabel];
  [(UILabel *)v6 setFont:v5];

  objc_storeStrong(location, 0);
}

- (id)_chevronImage
{
  if ([(BuddyExpressSetupFeatureCardPrimaryCell *)self isExpanded]) {
    id v3 = +[UIImage systemImageNamed:@"chevron.down"];
  }
  else {
    id v3 = +[UIImage systemImageNamed:@"chevron.forward"];
  }

  return v3;
}

- (id)_titleFont
{
  id location[2] = self;
  location[1] = (id)a2;
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  location[0] = [(UIFontDescriptor *)v2 fontDescriptorWithSymbolicTraits:2];

  id v3 = +[UIFont fontWithDescriptor:location[0] size:0.0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_subtitleFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (BOOL)isChevronHidden
{
  return self->_chevronHidden;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
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

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end