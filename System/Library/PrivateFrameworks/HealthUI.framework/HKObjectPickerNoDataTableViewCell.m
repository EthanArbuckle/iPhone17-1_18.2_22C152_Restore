@interface HKObjectPickerNoDataTableViewCell
- (BOOL)showLearnMoreButton;
- (HKObjectPickerNoDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)explanationText;
- (UIButton)learnMoreButton;
- (UILabel)label;
- (UIStackView)stackView;
- (void)_setupSubviews;
- (void)prepareForReuse;
- (void)setExplanationText:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setShowLearnMoreButton:(BOOL)a3;
- (void)setStackView:(id)a3;
@end

@implementation HKObjectPickerNoDataTableViewCell

- (HKObjectPickerNoDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HKObjectPickerNoDataTableViewCell;
  v4 = [(HKObjectPickerNoDataTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKObjectPickerNoDataTableViewCell *)v4 _setupSubviews];
    v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(HKObjectPickerNoDataTableViewCell *)v5 setBackgroundColor:v6];

    [(HKObjectPickerNoDataTableViewCell *)v5 setShowLearnMoreButton:1];
  }
  return v5;
}

- (void)_setupSubviews
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(HKObjectPickerNoDataTableViewCell *)self setBackgroundColor:v3];

  [(HKObjectPickerNoDataTableViewCell *)self _setContinuousCornerRadius:10.0];
  [(HKObjectPickerNoDataTableViewCell *)self setSelectionStyle:0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  label = self->_label;
  self->_label = v9;

  [(UILabel *)self->_label setAdjustsFontForContentSizeCategory:1];
  uint64_t v11 = *MEMORY[0x1E4FB2950];
  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)self->_label setFont:v12];

  [(UILabel *)self->_label setNumberOfLines:0];
  v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_label setTextColor:v13];

  [(UILabel *)self->_label setTextAlignment:0];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v5, v6, v7, v8);
  learnMoreButton = self->_learnMoreButton;
  self->_learnMoreButton = v14;

  v16 = self->_learnMoreButton;
  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v18 = [v17 localizedStringForKey:@"LEARN_MORE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(UIButton *)v16 setTitle:v18 forState:0];

  v19 = self->_learnMoreButton;
  v20 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(UIButton *)v19 setTitleColor:v20 forState:0];

  v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
  v22 = [(UIButton *)self->_learnMoreButton titleLabel];
  [v22 setFont:v21];

  [(UIButton *)self->_learnMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v23 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v24 = self->_learnMoreButton;
  v33[0] = self->_label;
  v33[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v26 = (UIStackView *)[v23 initWithArrangedSubviews:v25];
  stackView = self->_stackView;
  self->_stackView = v26;

  [(UIStackView *)self->_stackView setAlignment:1];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setSpacing:4.0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(HKObjectPickerNoDataTableViewCell *)self contentView];
  [v28 addSubview:self->_stackView];

  v29 = self->_stackView;
  v30 = [(HKObjectPickerNoDataTableViewCell *)self contentView];
  [(UIStackView *)v29 hk_alignVerticalConstraintsWithView:v30 margin:16.0];

  v31 = self->_stackView;
  v32 = [(HKObjectPickerNoDataTableViewCell *)self contentView];
  [(UIStackView *)v31 hk_alignHorizontalConstraintsWithView:v32 margin:16.0];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HKObjectPickerNoDataTableViewCell;
  [(HKObjectPickerNoDataTableViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_label setText:0];
}

- (NSString)explanationText
{
  return [(UILabel *)self->_label text];
}

- (void)setExplanationText:(id)a3
{
}

- (void)setShowLearnMoreButton:(BOOL)a3
{
  if (self->_showLearnMoreButton != a3)
  {
    if (a3) {
      [(UIStackView *)self->_stackView addArrangedSubview:self->_learnMoreButton];
    }
    else {
      [(UIButton *)self->_learnMoreButton removeFromSuperview];
    }
    self->_showLearnMoreButton = a3;
  }
}

- (BOOL)showLearnMoreButton
{
  return self->_showLearnMoreButton;
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end