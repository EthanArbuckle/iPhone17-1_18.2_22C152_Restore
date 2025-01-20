@interface BuddyExpressSetupFeatureCardCell
- (BuddyExpressSetupFeatureCardCell)initWithTitle:(id)a3 subtitle:(id)a4 state:(id)a5 accessoryView:(id)a6;
- (UILabel)stateLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelContainer;
- (UIStackView)stateStackView;
- (UIView)accessoryView;
- (id)_bodyFont;
- (id)_stateFont;
- (id)_titleFont;
- (int64_t)_stateStackViewAxis;
- (void)setAccessoryView:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setStateLabel:(id)a3;
- (void)setStateStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BuddyExpressSetupFeatureCardCell

- (BuddyExpressSetupFeatureCardCell)initWithTitle:(id)a3 subtitle:(id)a4 state:(id)a5 accessoryView:(id)a6
{
  id v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v69 = 0;
  objc_storeStrong(&v69, a4);
  id v68 = 0;
  objc_storeStrong(&v68, a5);
  id obj = 0;
  objc_storeStrong(&obj, a6);
  id v9 = v71;
  id v71 = 0;
  v66.receiver = v9;
  v66.super_class = (Class)BuddyExpressSetupFeatureCardCell;
  id v71 = -[BuddyExpressSetupFeatureCardCell initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v71, v71);
  if (v71)
  {
    objc_storeStrong((id *)v71 + 1, obj);
    [*((id *)v71 + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v11 = (void *)*((void *)v71 + 3);
    *((void *)v71 + 3) = v10;

    [*((id *)v71 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = [v71 _titleFont];
    [*((id *)v71 + 3) setFont:v12];

    [*((id *)v71 + 3) setText:location[0]];
    [*((id *)v71 + 3) setNumberOfLines:0];
    if (v68)
    {
      id v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      v14 = (void *)*((void *)v71 + 4);
      *((void *)v71 + 4) = v13;

      [*((id *)v71 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
      v15 = +[UIColor secondaryLabelColor];
      [*((id *)v71 + 4) setTextColor:v15];

      id v16 = [v71 _stateFont];
      [*((id *)v71 + 4) setFont:v16];

      [*((id *)v71 + 4) setText:v68];
      LODWORD(v17) = 1148846080;
      [*((id *)v71 + 4) setContentHuggingPriority:0 forAxis:v17];
      LODWORD(v18) = 1148846080;
      [*((id *)v71 + 4) setContentHuggingPriority:1 forAxis:v18];
      LODWORD(v19) = 1148846080;
      [*((id *)v71 + 3) setContentHuggingPriority:1 forAxis:v19];
    }
    id v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v21 = (void *)*((void *)v71 + 5);
    *((void *)v71 + 5) = v20;

    [*((id *)v71 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIColor secondaryLabelColor];
    [*((id *)v71 + 5) setTextColor:v22];

    id v23 = [v71 _bodyFont];
    [*((id *)v71 + 5) setFont:v23];

    [*((id *)v71 + 5) setText:v69];
    [*((id *)v71 + 5) setNumberOfLines:0];
    id v24 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v25 = (void *)*((void *)v71 + 2);
    *((void *)v71 + 2) = v24;

    [*((id *)v71 + 2) setAxis:1];
    [*((id *)v71 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*((void *)v71 + 4))
    {
      id v26 = objc_alloc((Class)UIStackView);
      v74[0] = *((void *)v71 + 3);
      v74[1] = *((void *)v71 + 4);
      v27 = +[NSArray arrayWithObjects:v74 count:2];
      id v28 = [v26 initWithArrangedSubviews:v27];
      v29 = (void *)*((void *)v71 + 6);
      *((void *)v71 + 6) = v28;

      [*((id *)v71 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*((id *)v71 + 6) setDistribution:0];
      id v30 = [v71 _stateStackViewAxis];
      [*((id *)v71 + 6) setAxis:v30];
      [*((id *)v71 + 2) addArrangedSubview:*((void *)v71 + 6)];
    }
    else
    {
      [*((id *)v71 + 2) addArrangedSubview:*((void *)v71 + 3)];
    }
    [*((id *)v71 + 2) addArrangedSubview:*((void *)v71 + 5)];
    [v71 addSubview:*((void *)v71 + 2)];
    if (*((void *)v71 + 1))
    {
      [v71 addSubview:*((void *)v71 + 1)];
      id v63 = v71;
      id v65 = [*((id *)v71 + 1) widthAnchor];
      id v64 = [v65 constraintEqualToConstant:29.0];
      v73[0] = v64;
      id v62 = [*((id *)v71 + 1) heightAnchor];
      id v59 = [v62 constraintEqualToConstant:29.0];
      v73[1] = v59;
      id v31 = [*((id *)v71 + 1) leadingAnchor];
      id v32 = [v71 leadingAnchor];
      id v33 = [v31 constraintEqualToAnchor:v32 constant:6.0];
      v73[2] = v33;
      id v34 = [*((id *)v71 + 1) topAnchor];
      id v35 = [v71 topAnchor];
      id v36 = [v34 constraintEqualToAnchor:v35];
      v73[3] = v36;
      id v37 = [*((id *)v71 + 2) leadingAnchor];
      id v38 = [*((id *)v71 + 1) trailingAnchor];
      id v39 = [v37 constraintEqualToAnchor:v38 constant:19.0];
      v73[4] = v39;
      v40 = +[NSArray arrayWithObjects:v73 count:5];
      [v63 addConstraints:v40];
    }
    else
    {
      id v41 = v71;
      id v42 = [*((id *)v71 + 2) leadingAnchor];
      id v43 = [v71 leadingAnchor];
      id v44 = [v42 constraintEqualToAnchor:v43 constant:54.0];
      [v41 addConstraint:v44];
    }
    id v61 = [*((id *)v71 + 2) trailingAnchor:v71];
    id v60 = [v71 trailingAnchor];
    id v58 = [v61 constraintEqualToAnchor:];
    v72[0] = v58;
    id v45 = [*((id *)v71 + 2) centerYAnchor];
    id v46 = [v71 centerYAnchor];
    id v47 = [v45 constraintEqualToAnchor:v46];
    v72[1] = v47;
    id v48 = [*((id *)v71 + 2) topAnchor];
    id v49 = [v71 topAnchor];
    id v50 = [v48 constraintEqualToAnchor:v49];
    v72[2] = v50;
    id v51 = [*((id *)v71 + 2) bottomAnchor];
    id v52 = [v71 bottomAnchor];
    id v53 = [v51 constraintEqualToAnchor:v52];
    v72[3] = v53;
    v54 = +[NSArray arrayWithObjects:v72 count:4];
    [v57 addConstraints:v54];
  }
  v55 = (BuddyExpressSetupFeatureCardCell *)v71;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v71, 0);
  return v55;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)BuddyExpressSetupFeatureCardCell;
  [(BuddyExpressSetupFeatureCardCell *)&v10 traitCollectionDidChange:location[0]];
  id v3 = [(BuddyExpressSetupFeatureCardCell *)v12 _titleFont];
  v4 = [(BuddyExpressSetupFeatureCardCell *)v12 titleLabel];
  [(UILabel *)v4 setFont:v3];

  id v5 = [(BuddyExpressSetupFeatureCardCell *)v12 _bodyFont];
  v6 = [(BuddyExpressSetupFeatureCardCell *)v12 stateLabel];
  [(UILabel *)v6 setFont:v5];

  id v7 = [(BuddyExpressSetupFeatureCardCell *)v12 _bodyFont];
  v8 = [(BuddyExpressSetupFeatureCardCell *)v12 subtitleLabel];
  [(UILabel *)v8 setFont:v7];

  id v9 = [(BuddyExpressSetupFeatureCardCell *)v12 _stateStackViewAxis];
  [(UIStackView *)v12->_stateStackView setAxis:v9];
  objc_storeStrong(location, 0);
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

- (id)_stateFont
{
  id location[2] = self;
  location[1] = (id)a2;
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
  location[0] = [(UIFontDescriptor *)v2 fontDescriptorWithSymbolicTraits:2];

  id v3 = +[UIFont fontWithDescriptor:location[0] size:0.0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_bodyFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  id v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (int64_t)_stateStackViewAxis
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [(UIApplication *)v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
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

- (UILabel)stateLabel
{
  return self->_stateLabel;
}

- (void)setStateLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIStackView)stateStackView
{
  return self->_stateStackView;
}

- (void)setStateStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end