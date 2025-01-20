@interface HangEventTableViewCell
+ (id)_textColorForDurationLevel:(int64_t)a3;
- (CGSize)_disclosureIndicatorSize;
- (HangEventTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSLayoutConstraint)processingTrailingConstraint;
- (NSLayoutConstraint)spinnerConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (UIActivityIndicatorView)spinner;
- (UILabel)dateLabel;
- (UILabel)durationLabel;
- (UILabel)nameLabel;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDurationLabel:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNameLabel:(id)a3;
- (void)setProcessingTrailingConstraint:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateConstraints;
- (void)updateDurationFont;
@end

@implementation HangEventTableViewCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  [(HangEventTableViewCell *)self setAutomaticallyUpdatesBackgroundConfiguration:0];
  id v7 = [v4 copy];

  if ([(HangEventTableViewCell *)self editingStyle] == (char *)&dword_0 + 3)
  {
    [v7 setSelected:0];
    [v7 setHighlighted:0];
  }
  v5 = [(HangEventTableViewCell *)self defaultBackgroundConfiguration];
  v6 = [v5 updatedConfigurationForState:v7];
  [(HangEventTableViewCell *)self setBackgroundConfiguration:v6];
}

- (HangEventTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v108.receiver = self;
  v108.super_class = (Class)HangEventTableViewCell;
  v5 = [(HangEventTableViewCell *)&v108 initWithStyle:3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(HangEventTableViewCell *)v5 setMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
    uint64_t v113 = objc_opt_class();
    id v7 = +[NSArray arrayWithObjects:&v113 count:1];
    id v8 = [(HangEventTableViewCell *)v6 registerForTraitChanges:v7 withTarget:v6 action:"updateDurationFont"];

    id v9 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = (UILabel *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    nameLabel = v6->_nameLabel;
    v6->_nameLabel = v13;

    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v6->_nameLabel setFont:v15];

    [(UILabel *)v6->_nameLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1132068864;
    [(UILabel *)v6->_nameLabel setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(UILabel *)v6->_nameLabel setContentCompressionResistancePriority:1 forAxis:v17];
    LODWORD(v18) = 1144750080;
    [(UILabel *)v6->_nameLabel setContentHuggingPriority:0 forAxis:v18];
    LODWORD(v19) = 1144750080;
    [(UILabel *)v6->_nameLabel setContentHuggingPriority:1 forAxis:v19];
    v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dateLabel = v6->_dateLabel;
    v6->_dateLabel = v20;

    v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v6->_dateLabel setFont:v22];

    v23 = +[UIColor secondaryLabelColor];
    [(UILabel *)v6->_dateLabel setTextColor:v23];

    [(UILabel *)v6->_dateLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v24) = 1132068864;
    [(UILabel *)v6->_dateLabel setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1144750080;
    [(UILabel *)v6->_dateLabel setContentCompressionResistancePriority:1 forAxis:v25];
    LODWORD(v26) = 1144750080;
    [(UILabel *)v6->_dateLabel setContentHuggingPriority:0 forAxis:v26];
    LODWORD(v27) = 1144750080;
    [(UILabel *)v6->_dateLabel setContentHuggingPriority:1 forAxis:v27];
    v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    durationLabel = v6->_durationLabel;
    v6->_durationLabel = v28;

    [(UILabel *)v6->_durationLabel setAdjustsFontForContentSizeCategory:1];
    [(HangEventTableViewCell *)v6 updateDurationFont];
    [(UILabel *)v6->_durationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v30) = 1148846080;
    [(UILabel *)v6->_durationLabel setContentCompressionResistancePriority:0 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v6->_durationLabel setContentCompressionResistancePriority:1 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UILabel *)v6->_durationLabel setContentHuggingPriority:0 forAxis:v32];
    LODWORD(v33) = 1148846080;
    [(UILabel *)v6->_durationLabel setContentHuggingPriority:1 forAxis:v33];
    v34 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:8];
    spinner = v6->_spinner;
    v6->_spinner = v34;

    v36 = +[UIColor secondaryLabelColor];
    [(UIActivityIndicatorView *)v6->_spinner setColor:v36];

    [(UIActivityIndicatorView *)v6->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = [(HangEventTableViewCell *)v6 contentView];
    [v37 addSubview:v6->_spinner];

    id v38 = objc_alloc((Class)UIStackView);
    v112[0] = v6->_nameLabel;
    v112[1] = v6->_dateLabel;
    v39 = +[NSArray arrayWithObjects:v112 count:2];
    id v40 = [v38 initWithArrangedSubviews:v39];

    [v40 setAxis:1];
    [v40 setAlignment:1];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v40 setCustomSpacing:v6->_nameLabel afterView:3.0];
    id v41 = objc_alloc((Class)UIStackView);
    v111[0] = v40;
    v105 = v40;
    v111[1] = v6->_durationLabel;
    v42 = +[NSArray arrayWithObjects:v111 count:2];
    id v43 = [v41 initWithArrangedSubviews:v42];

    id v44 = v43;
    [v43 setAlignment:3];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
    v106 = v43;
    [v43 setCustomSpacing:v40 afterView:1.17549435e-38];
    v45 = [(HangEventTableViewCell *)v6 contentView];
    [v45 addSubview:v44];

    v46 = [(HangEventTableViewCell *)v6 contentView];
    [v46 addSubview:v6->_spinner];

    [(HangEventTableViewCell *)v6 _disclosureIndicatorSize];
    double v48 = v47;
    double v50 = v49;
    id v51 = objc_alloc_init((Class)UIView);
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v51 addSubview:v6->_spinner];
    v52 = [(HangEventTableViewCell *)v6 contentView];
    [v52 addSubview:v51];

    v101 = [v51 centerYAnchor];
    v103 = [(HangEventTableViewCell *)v6 contentView];
    v99 = [v103 centerYAnchor];
    v97 = [v101 constraintEqualToAnchor:v99];
    v110[0] = v97;
    v93 = [v51 trailingAnchor];
    v95 = [(HangEventTableViewCell *)v6 contentView];
    v92 = [v95 layoutMarginsGuide];
    v90 = [v92 trailingAnchor];
    v89 = [v93 constraintEqualToAnchor:v90];
    v110[1] = v89;
    v88 = [v51 widthAnchor];
    v87 = [v88 constraintEqualToConstant:v48];
    v110[2] = v87;
    v53 = [v51 heightAnchor];
    v54 = [v53 constraintEqualToConstant:v50];
    v110[3] = v54;
    v55 = [(UIActivityIndicatorView *)v6->_spinner centerYAnchor];
    v107 = v51;
    v56 = [v51 centerYAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v110[4] = v57;
    v58 = [(UIActivityIndicatorView *)v6->_spinner centerXAnchor];
    v59 = [v51 centerXAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v110[5] = v60;
    v61 = +[NSArray arrayWithObjects:v110 count:6];
    +[NSLayoutConstraint activateConstraints:v61];

    v62 = [v106 trailingAnchor];
    v63 = [(HangEventTableViewCell *)v6 contentView];
    v64 = [v63 trailingAnchor];
    uint64_t v65 = [v62 constraintEqualToAnchor:v64];
    trailingConstraint = v6->_trailingConstraint;
    v6->_trailingConstraint = (NSLayoutConstraint *)v65;

    v67 = [v106 trailingAnchor];
    v68 = [(HangEventTableViewCell *)v6 contentView];
    v69 = [v68 layoutMarginsGuide];
    v70 = [v69 trailingAnchor];
    uint64_t v71 = [v67 constraintEqualToAnchor:v70];
    processingTrailingConstraint = v6->_processingTrailingConstraint;
    v6->_processingTrailingConstraint = (NSLayoutConstraint *)v71;

    v73 = [v107 leadingAnchor];
    v74 = [v106 trailingAnchor];
    uint64_t v75 = [v73 constraintEqualToSystemSpacingAfterAnchor:v74 multiplier:1.0];
    spinnerConstraint = v6->_spinnerConstraint;
    v6->_spinnerConstraint = (NSLayoutConstraint *)v75;

    v102 = [v106 leadingAnchor];
    v104 = [(HangEventTableViewCell *)v6 contentView];
    v100 = [v104 layoutMarginsGuide];
    v98 = [v100 leadingAnchor];
    v96 = [v102 constraintEqualToAnchor:v98];
    v109[0] = v96;
    v109[1] = v6->_trailingConstraint;
    v91 = [v106 topAnchor];
    v94 = [(HangEventTableViewCell *)v6 contentView];
    v77 = [v94 layoutMarginsGuide];
    v78 = [v77 topAnchor];
    v79 = [v91 constraintEqualToAnchor:v78 constant:1.0];
    v109[2] = v79;
    v80 = [v106 bottomAnchor];
    v81 = [(HangEventTableViewCell *)v6 contentView];
    v82 = [v81 layoutMarginsGuide];
    v83 = [v82 bottomAnchor];
    v84 = [v80 constraintEqualToAnchor:v83 constant:-2.0];
    v109[3] = v84;
    v85 = +[NSArray arrayWithObjects:v109 count:4];
    +[NSLayoutConstraint activateConstraints:v85];
  }
  return v6;
}

- (void)updateDurationFont
{
  v3 = [(HangEventTableViewCell *)self traitCollection];
  id v11 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v3];

  [v11 pointSize];
  double v5 = v4;
  v6 = [v11 fontAttributes];
  id v7 = [v6 objectForKeyedSubscript:UIFontDescriptorTraitsAttribute];
  id v8 = [v7 objectForKeyedSubscript:UIFontWeightTrait];
  [v8 floatValue];
  v10 = +[UIFont monospacedDigitSystemFontOfSize:v5 weight:v9];
  [(UILabel *)self->_durationLabel setFont:v10];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)HangEventTableViewCell;
  [(HangEventTableViewCell *)&v4 updateConstraints];
  BOOL v3 = [(UIActivityIndicatorView *)self->_spinner isAnimating];
  [(NSLayoutConstraint *)self->_trailingConstraint setActive:!([(HangEventTableViewCell *)self isEditing] | v3)];
  [(NSLayoutConstraint *)self->_processingTrailingConstraint setActive:[(HangEventTableViewCell *)self isEditing] & !v3];
  [(NSLayoutConstraint *)self->_spinnerConstraint setActive:v3];
}

- (CGSize)_disclosureIndicatorSize
{
  v2 = [(HangEventTableViewCell *)self traitCollection];
  BOOL v3 = v2;
  if (!qword_412A0) {
    goto LABEL_5;
  }
  objc_super v4 = [v2 preferredContentSizeCategory];
  double v5 = [(id)qword_412A8 preferredContentSizeCategory];
  if (v4 != v5)
  {

LABEL_5:
    id v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:1];
    uint64_t v9 = +[UIImage systemImageNamed:@"chevron.forward" withConfiguration:v8];
    v10 = (void *)qword_412A0;
    qword_412A0 = v9;

    objc_storeStrong((id *)&qword_412A8, v3);
    goto LABEL_6;
  }
  id v6 = [v3 legibilityWeight];
  id v7 = [(id)qword_412A8 legibilityWeight];

  if (v6 != v7) {
    goto LABEL_5;
  }
LABEL_6:
  [(id)qword_412A0 size];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HangEventTableViewCell;
  id v4 = a3;
  [(HangEventTableViewCell *)&v18 refreshCellContentsWithSpecifier:v4];
  double v5 = [(HangEventTableViewCell *)self textLabel];
  id v6 = [v5 text];
  [(UILabel *)self->_nameLabel setText:v6];

  id v7 = [(HangEventTableViewCell *)self detailTextLabel];
  id v8 = [v7 text];
  [(UILabel *)self->_dateLabel setText:v8];

  uint64_t v9 = [(HangEventTableViewCell *)self textLabel];
  [v9 setHidden:1];

  v10 = [(HangEventTableViewCell *)self detailTextLabel];
  [v10 setHidden:1];

  double v11 = [v4 objectForKeyedSubscript:@"HangsDataControllerFormattedDuration"];
  [(UILabel *)self->_durationLabel setText:v11];

  double v12 = [v4 objectForKeyedSubscript:@"HangsDataControllerDurationLevel"];
  double v13 = +[HangEventTableViewCell _textColorForDurationLevel:](HangEventTableViewCell, "_textColorForDurationLevel:", [v12 integerValue]);
  [(UILabel *)self->_durationLabel setTextColor:v13];

  double v14 = [v4 objectForKeyedSubscript:@"HangsDataControllerIsProcessing"];

  LODWORD(v4) = [v14 BOOLValue];
  spinner = self->_spinner;
  if (v4) {
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
  id v16 = [(HangEventTableViewCell *)self isSelected];
  [(HangEventTableViewCell *)self setSelected:0 animated:0];
  double v17 = [(HangEventTableViewCell *)self configurationState];
  [(HangEventTableViewCell *)self updateConfigurationUsingState:v17];

  [(HangEventTableViewCell *)self setSelected:v16 animated:0];
  [(HangEventTableViewCell *)self setNeedsUpdateConstraints];
}

+ (id)_textColorForDurationLevel:(int64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = +[UIColor systemRedColor];
  }
  else
  {
    if (a3 == 1) {
      +[UIColor systemOrangeColor];
    }
    else {
    BOOL v3 = +[UIColor labelColor];
    }
  }

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(HangEventTableViewCell *)self setNeedsUpdateConstraints];
  v7.receiver = self;
  v7.super_class = (Class)HangEventTableViewCell;
  [(HangEventTableViewCell *)&v7 setEditing:v5 animated:v4];
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)processingTrailingConstraint
{
  return self->_processingTrailingConstraint;
}

- (void)setProcessingTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)spinnerConstraint
{
  return self->_spinnerConstraint;
}

- (void)setSpinnerConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerConstraint, 0);
  objc_storeStrong((id *)&self->_processingTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end