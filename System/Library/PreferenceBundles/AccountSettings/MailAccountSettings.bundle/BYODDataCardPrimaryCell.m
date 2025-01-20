@interface BYODDataCardPrimaryCell
- (BOOL)hideChevron;
- (BYODDataCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (UIImageView)chevronImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelContainer;
- (UIView)iconView;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)setChevronImageView:(id)a3;
- (void)setHideChevron:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BYODDataCardPrimaryCell

- (BYODDataCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v66 = a3;
  id v65 = a4;
  id v67 = a5;
  v68.receiver = self;
  v68.super_class = (Class)BYODDataCardPrimaryCell;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[BYODDataCardPrimaryCell initWithFrame:](&v68, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v67];
    iconView = v11->_iconView;
    v11->_iconView = v12;

    [(UIView *)v11->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_iconView setContentMode:1];
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = v14;

    [(UILabel *)v11->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(BYODDataCardPrimaryCell *)v11 _titleFont];
    [(UILabel *)v11->_titleLabel setFont:v16];

    [(UILabel *)v11->_titleLabel setText:v66];
    [(UILabel *)v11->_titleLabel setNumberOfLines:0];
    v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v11->_subtitleLabel;
    v11->_subtitleLabel = v17;

    [(UILabel *)v11->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[UIColor secondaryLabelColor];
    [(UILabel *)v11->_subtitleLabel setTextColor:v19];

    v20 = [(BYODDataCardPrimaryCell *)v11 _subtitleFont];
    [(UILabel *)v11->_subtitleLabel setFont:v20];

    [(UILabel *)v11->_subtitleLabel setText:v65];
    [(UILabel *)v11->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v11->_subtitleLabel setNumberOfLines:10];
    v21 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    labelContainer = v11->_labelContainer;
    v11->_labelContainer = v21;

    [(UIStackView *)v11->_labelContainer setAxis:1];
    [(UIStackView *)v11->_labelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v11->_labelContainer addArrangedSubview:v11->_titleLabel];
    [(UIStackView *)v11->_labelContainer addArrangedSubview:v11->_subtitleLabel];
    id v23 = objc_alloc((Class)UIImageView);
    v24 = +[UIImage systemImageNamed:@"chevron.forward"];
    v25 = (UIImageView *)[v23 initWithImage:v24];
    chevronImageView = v11->_chevronImageView;
    v11->_chevronImageView = v25;

    v27 = +[UIColor secondaryLabelColor];
    v28 = [v27 colorWithAlphaComponent:0.3];
    [(UIImageView *)v11->_chevronImageView setTintColor:v28];

    [(UIImageView *)v11->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v11->_chevronImageView setContentMode:1];
    LODWORD(v29) = 1148846080;
    [(UIImageView *)v11->_chevronImageView setContentHuggingPriority:0 forAxis:v29];
    [(BYODDataCardPrimaryCell *)v11 addSubview:v11->_iconView];
    [(BYODDataCardPrimaryCell *)v11 addSubview:v11->_labelContainer];
    [(BYODDataCardPrimaryCell *)v11 addSubview:v11->_chevronImageView];
    v57 = [(UIView *)v11->_iconView widthAnchor];
    v56 = [v57 constraintEqualToConstant:40.0];
    v69[0] = v56;
    v55 = [(UIView *)v11->_iconView heightAnchor];
    v54 = [v55 constraintEqualToConstant:40.0];
    v69[1] = v54;
    v64 = [(UIView *)v11->_iconView leadingAnchor];
    v53 = [(BYODDataCardPrimaryCell *)v11 layoutMarginsGuide];
    v52 = [v53 leadingAnchor];
    v51 = objc_msgSend(v64, "constraintEqualToAnchor:");
    v69[2] = v51;
    v63 = [(UIView *)v11->_iconView centerYAnchor];
    v50 = [(BYODDataCardPrimaryCell *)v11 centerYAnchor];
    v49 = objc_msgSend(v63, "constraintEqualToAnchor:");
    v69[3] = v49;
    v62 = [(UIStackView *)v11->_labelContainer leadingAnchor];
    v48 = [(UIView *)v11->_iconView trailingAnchor];
    v47 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", 14.0);
    v69[4] = v47;
    v61 = [(UIStackView *)v11->_labelContainer trailingAnchor];
    v46 = [(UIImageView *)v11->_chevronImageView leadingAnchor];
    v45 = objc_msgSend(v61, "constraintEqualToAnchor:");
    v69[5] = v45;
    v60 = [(UIStackView *)v11->_labelContainer centerYAnchor];
    v44 = [(BYODDataCardPrimaryCell *)v11 centerYAnchor];
    v43 = objc_msgSend(v60, "constraintEqualToAnchor:");
    v69[6] = v43;
    v59 = [(UIStackView *)v11->_labelContainer topAnchor];
    v42 = [(BYODDataCardPrimaryCell *)v11 topAnchor];
    v41 = objc_msgSend(v59, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 2.0);
    v69[7] = v41;
    v58 = [(BYODDataCardPrimaryCell *)v11 bottomAnchor];
    v40 = [(UIStackView *)v11->_labelContainer bottomAnchor];
    v30 = objc_msgSend(v58, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", 2.0);
    v69[8] = v30;
    v31 = [(UIImageView *)v11->_chevronImageView centerYAnchor];
    v32 = [(BYODDataCardPrimaryCell *)v11 centerYAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v69[9] = v33;
    v34 = [(UIImageView *)v11->_chevronImageView trailingAnchor];
    v35 = [(BYODDataCardPrimaryCell *)v11 layoutMarginsGuide];
    v36 = [v35 trailingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v69[10] = v37;
    v38 = +[NSArray arrayWithObjects:v69 count:11];
    [(BYODDataCardPrimaryCell *)v11 addConstraints:v38];
  }
  return v11;
}

- (void)setHideChevron:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hideChevron = a3;
  id v4 = [(BYODDataCardPrimaryCell *)self chevronImageView];
  [v4 setHidden:v3];
}

- (id)_titleFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  BOOL v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  id v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)_subtitleFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  BOOL v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end