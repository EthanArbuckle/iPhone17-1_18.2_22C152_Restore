@interface WDHeartRhythmSectionHeaderView
- (NSLayoutConstraint)bottomToTitleLastBaselineConstraint;
- (NSString)titleText;
- (UILabel)titleLabel;
- (WDHeartRhythmSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (void)setBottomToTitleLastBaselineConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUpUI;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraintConstants;
@end

@implementation WDHeartRhythmSectionHeaderView

- (WDHeartRhythmSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WDHeartRhythmSectionHeaderView;
  v3 = [(WDHeartRhythmSectionHeaderView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    [(WDHeartRhythmSectionHeaderView *)v3 setUpUI];
  }
  return v3;
}

- (void)setUpUI
{
  v46[3] = *MEMORY[0x263EF8340];
  v3 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v4 setAdjustsFontForContentSizeCategory:1];

  uint64_t v5 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v5 setTextAlignment:4];

  v6 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v6 setNumberOfLines:0];

  v7 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D300] addingSymbolicTraits:32770 options:0];
  objc_super v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:0.0];
  v9 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v9 setFont:v8];

  v10 = [MEMORY[0x263F1C550] labelColor];
  v11 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v11 setTextColor:v10];

  v12 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  v13 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v12 addSubview:v13];

  v14 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  [v14 layoutMargins];
  double v16 = v15;
  double v18 = v17;

  v19 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  objc_msgSend(v19, "setLayoutMargins:", 0.0, v16, 0.0, v18);

  v20 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  v21 = [v20 topAnchor];
  v22 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:12.0];
  [v24 setActive:1];

  v25 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  v28 = [v27 lastBaselineAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  bottomToTitleLastBaselineConstraint = self->_bottomToTitleLastBaselineConstraint;
  self->_bottomToTitleLastBaselineConstraint = v29;

  [(WDHeartRhythmSectionHeaderView *)self updateConstraintConstants];
  v31 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  v32 = [v31 leadingAnchor];
  v33 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  v34 = [v33 layoutMarginsGuide];
  v35 = [v34 leadingAnchor];
  v36 = [v32 constraintEqualToAnchor:v35 constant:2.0];

  v37 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  v38 = [v37 trailingAnchor];
  v39 = [(WDHeartRhythmSectionHeaderView *)self contentView];
  v40 = [v39 layoutMarginsGuide];
  v41 = [v40 trailingAnchor];
  v42 = [v38 constraintEqualToAnchor:v41 constant:-2.0];

  v43 = self->_bottomToTitleLastBaselineConstraint;
  v44 = (void *)MEMORY[0x263F08938];
  v46[0] = v43;
  v46[1] = v36;
  v46[2] = v42;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
  [v44 activateConstraints:v45];
}

- (void)updateConstraintConstants
{
  id v3 = objc_alloc(MEMORY[0x263F1C668]);
  id v7 = (id)[v3 initForTextStyle:*MEMORY[0x263F1D300]];
  [v7 scaledValueForValue:12.0];
  double v5 = v4;
  v6 = [(WDHeartRhythmSectionHeaderView *)self bottomToTitleLastBaselineConstraint];
  [v6 setConstant:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_3;
  }
  double v4 = [(WDHeartRhythmSectionHeaderView *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  v6 = [v8 preferredContentSizeCategory];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
LABEL_3:
  }
    [(WDHeartRhythmSectionHeaderView *)self updateConstraintConstants];
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)titleText
{
  v2 = [(WDHeartRhythmSectionHeaderView *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)bottomToTitleLastBaselineConstraint
{
  return self->_bottomToTitleLastBaselineConstraint;
}

- (void)setBottomToTitleLastBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToTitleLastBaselineConstraint, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end