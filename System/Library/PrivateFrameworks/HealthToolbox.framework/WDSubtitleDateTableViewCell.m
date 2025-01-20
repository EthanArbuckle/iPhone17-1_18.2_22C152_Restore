@interface WDSubtitleDateTableViewCell
- (NSLayoutConstraint)baselineConstraint;
- (UILabel)dateTextLabel;
- (UILabel)mainTextLabel;
- (UILabel)subtitleTextLabel;
- (WDSubtitleDateTableViewCell)initWithReuseIdentifier:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)setBaselineConstraint:(id)a3;
- (void)setDateTextLabel:(id)a3;
- (void)setMainTextLabel:(id)a3;
- (void)setSubtitleTextLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDSubtitleDateTableViewCell

- (WDSubtitleDateTableViewCell)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WDSubtitleDateTableViewCell;
  v3 = [(WDSubtitleDateTableViewCell *)&v6 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(WDSubtitleDateTableViewCell *)v3 setupSubviews];
    [(WDSubtitleDateTableViewCell *)v4 setupConstraints];
    [(WDSubtitleDateTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)setupSubviews
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  subtitleTextLabel = self->_subtitleTextLabel;
  self->_subtitleTextLabel = v3;

  [(UILabel *)self->_subtitleTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleTextLabel setNumberOfLines:0];
  v5 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UILabel *)self->_subtitleTextLabel setTextColor:v5];

  objc_super v6 = [(WDSubtitleDateTableViewCell *)self contentView];
  [v6 addSubview:self->_subtitleTextLabel];

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  mainTextLabel = self->_mainTextLabel;
  self->_mainTextLabel = v7;

  [(UILabel *)self->_mainTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(WDSubtitleDateTableViewCell *)self textLabel];
  v10 = [v9 textColor];
  [(UILabel *)self->_mainTextLabel setTextColor:v10];

  v11 = [(WDSubtitleDateTableViewCell *)self contentView];
  [v11 addSubview:self->_mainTextLabel];

  v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  dateTextLabel = self->_dateTextLabel;
  self->_dateTextLabel = v12;

  [(UILabel *)self->_dateTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [(UILabel *)self->_dateTextLabel setTextColor:v14];

  id v15 = [(WDSubtitleDateTableViewCell *)self contentView];
  [v15 addSubview:self->_dateTextLabel];
}

- (void)setupConstraints
{
  v44[9] = *MEMORY[0x263EF8340];
  v3 = [(UILabel *)self->_mainTextLabel firstBaselineAnchor];
  v4 = [(UILabel *)self->_subtitleTextLabel lastBaselineAnchor];
  v5 = [(WDSubtitleDateTableViewCell *)self textLabel];
  objc_super v6 = [v5 font];
  [v6 _scaledValueForValue:22.0];
  v7 = objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  [(WDSubtitleDateTableViewCell *)self setBaselineConstraint:v7];

  v29 = (void *)MEMORY[0x263F08938];
  v42 = [(UILabel *)self->_mainTextLabel leadingAnchor];
  v43 = [(WDSubtitleDateTableViewCell *)self contentView];
  v41 = [v43 layoutMarginsGuide];
  v40 = [v41 leadingAnchor];
  v39 = [v42 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(WDSubtitleDateTableViewCell *)self contentView];
  v37 = [v38 bottomAnchor];
  v36 = [(UILabel *)self->_mainTextLabel bottomAnchor];
  v35 = [v37 constraintEqualToSystemSpacingBelowAnchor:v36 multiplier:1.0];
  v44[1] = v35;
  v33 = [(UILabel *)self->_subtitleTextLabel leadingAnchor];
  v34 = [(WDSubtitleDateTableViewCell *)self contentView];
  v32 = [v34 layoutMarginsGuide];
  v31 = [v32 leadingAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v44[2] = v30;
  v27 = [(UILabel *)self->_subtitleTextLabel topAnchor];
  v28 = [(WDSubtitleDateTableViewCell *)self contentView];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToSystemSpacingBelowAnchor:v26 multiplier:1.0];
  v44[3] = v25;
  v24 = [(WDSubtitleDateTableViewCell *)self baselineConstraint];
  v44[4] = v24;
  v23 = [(WDSubtitleDateTableViewCell *)self contentView];
  v22 = [v23 trailingAnchor];
  v21 = [(UILabel *)self->_dateTextLabel trailingAnchor];
  v20 = [v22 constraintEqualToSystemSpacingAfterAnchor:v21 multiplier:1.0];
  v44[5] = v20;
  v19 = [(UILabel *)self->_dateTextLabel leadingAnchor];
  v18 = [(UILabel *)self->_subtitleTextLabel trailingAnchor];
  v8 = [v19 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v18 multiplier:1.0];
  v44[6] = v8;
  v9 = [(UILabel *)self->_dateTextLabel leadingAnchor];
  v10 = [(UILabel *)self->_mainTextLabel trailingAnchor];
  v11 = [v9 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v10 multiplier:1.0];
  v44[7] = v11;
  v12 = [(WDSubtitleDateTableViewCell *)self contentView];
  v13 = [v12 centerYAnchor];
  v14 = [(UILabel *)self->_dateTextLabel centerYAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  v44[8] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:9];
  [v29 activateConstraints:v16];

  LODWORD(v17) = 1144766464;
  [(UILabel *)self->_dateTextLabel setContentCompressionResistancePriority:0 forAxis:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDSubtitleDateTableViewCell;
  [(WDSubtitleDateTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(WDSubtitleDateTableViewCell *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDSubtitleDateTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)_updateForCurrentSizeCategory
{
  v3 = [(WDSubtitleDateTableViewCell *)self detailTextLabel];
  id v4 = [v3 font];
  [(UILabel *)self->_subtitleTextLabel setFont:v4];

  v5 = [(WDSubtitleDateTableViewCell *)self textLabel];
  objc_super v6 = [v5 font];
  [(UILabel *)self->_mainTextLabel setFont:v6];

  v7 = [(WDSubtitleDateTableViewCell *)self textLabel];
  char v8 = [v7 font];
  [(UILabel *)self->_dateTextLabel setFont:v8];

  objc_super v9 = [(WDSubtitleDateTableViewCell *)self textLabel];
  v10 = [v9 font];
  [v10 _scaledValueForValue:22.0];
  -[NSLayoutConstraint setConstant:](self->_baselineConstraint, "setConstant:");

  [(WDSubtitleDateTableViewCell *)self setNeedsLayout];
}

- (UILabel)mainTextLabel
{
  return self->_mainTextLabel;
}

- (void)setMainTextLabel:(id)a3
{
}

- (UILabel)subtitleTextLabel
{
  return self->_subtitleTextLabel;
}

- (void)setSubtitleTextLabel:(id)a3
{
}

- (UILabel)dateTextLabel
{
  return self->_dateTextLabel;
}

- (void)setDateTextLabel:(id)a3
{
}

- (NSLayoutConstraint)baselineConstraint
{
  return self->_baselineConstraint;
}

- (void)setBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineConstraint, 0);
  objc_storeStrong((id *)&self->_dateTextLabel, 0);
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);

  objc_storeStrong((id *)&self->_mainTextLabel, 0);
}

@end