@interface HKParagraphTableViewCell
+ (id)reuseIdentifier;
- (HKParagraphTableViewCell)initWithCoder:(id)a3;
- (HKParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)buttonText;
- (NSString)paragraphText;
- (NSString)titleText;
- (double)_buttonBaselineToBottom;
- (double)_subtitleLabelBaselineToButton;
- (double)_titleLabelBaselineToParagraphBaseline;
- (double)_titleLabelTopToBaseline;
- (id)_buttonFont;
- (id)_paragraphLabelFont;
- (id)_titleLabelFont;
- (int64_t)_buttonHorizontalAlignment;
- (void)_setupUI;
- (void)_updateForCurrentSizeCategory;
- (void)setButtonText:(id)a3;
- (void)setParagraphText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKParagraphTableViewCell

- (HKParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKParagraphTableViewCell;
  v4 = [(HKParagraphTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HKParagraphTableViewCell *)v4 _setupUI];
  }
  return v5;
}

- (HKParagraphTableViewCell)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (void)_setupUI
{
  [(HKParagraphTableViewCell *)self setSelectionStyle:0];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  uint64_t v5 = [(HKParagraphTableViewCell *)self _titleLabelFont];
  [(UILabel *)self->_titleLabel setFont:v5];

  v6 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = [(HKParagraphTableViewCell *)self contentView];
  [v7 addSubview:self->_titleLabel];

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  paragraphLabel = self->_paragraphLabel;
  self->_paragraphLabel = v8;

  v10 = [(HKParagraphTableViewCell *)self _paragraphLabelFont];
  [(UILabel *)self->_paragraphLabel setFont:v10];

  v11 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)self->_paragraphLabel setTextColor:v11];

  [(UILabel *)self->_paragraphLabel setNumberOfLines:0];
  [(UILabel *)self->_paragraphLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(HKParagraphTableViewCell *)self contentView];
  [v12 addSubview:self->_paragraphLabel];

  v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  button = self->_button;
  self->_button = v13;

  v15 = [(HKParagraphTableViewCell *)self _buttonFont];
  v16 = [(UIButton *)self->_button titleLabel];
  [v16 setFont:v15];

  v17 = self->_button;
  v18 = HKHealthKeyColor();
  [(UIButton *)v17 setTitleColor:v18 forState:0];

  [(UIButton *)self->_button setContentHorizontalAlignment:[(HKParagraphTableViewCell *)self _buttonHorizontalAlignment]];
  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [(HKParagraphTableViewCell *)self contentView];
  [v19 addSubview:self->_button];

  v20 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v21 = [(HKParagraphTableViewCell *)self contentView];
  v22 = [v21 topAnchor];
  [(HKParagraphTableViewCell *)self _titleLabelTopToBaseline];
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelBaselineConstraint = self->_titleLabelBaselineConstraint;
  self->_titleLabelBaselineConstraint = v23;

  [(NSLayoutConstraint *)self->_titleLabelBaselineConstraint setActive:1];
  v25 = [(UILabel *)self->_titleLabel leadingAnchor];
  v26 = [(HKParagraphTableViewCell *)self contentView];
  v27 = [v26 leadingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:20.0];
  [v28 setActive:1];

  v29 = [(UILabel *)self->_titleLabel trailingAnchor];
  v30 = [(HKParagraphTableViewCell *)self contentView];
  v31 = [v30 trailingAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-20.0];
  [v32 setActive:1];

  v33 = [(UILabel *)self->_paragraphLabel firstBaselineAnchor];
  v34 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  [(HKParagraphTableViewCell *)self _titleLabelBaselineToParagraphBaseline];
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paragraphLabelBaselineConstraint = self->_paragraphLabelBaselineConstraint;
  self->_paragraphLabelBaselineConstraint = v35;

  [(NSLayoutConstraint *)self->_paragraphLabelBaselineConstraint setActive:1];
  v37 = [(UILabel *)self->_paragraphLabel leadingAnchor];
  v38 = [(UILabel *)self->_titleLabel leadingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(UILabel *)self->_paragraphLabel trailingAnchor];
  v41 = [(UILabel *)self->_titleLabel trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [(UIButton *)self->_button firstBaselineAnchor];
  v44 = [(UILabel *)self->_paragraphLabel lastBaselineAnchor];
  [(HKParagraphTableViewCell *)self _subtitleLabelBaselineToButton];
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
  v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  buttonBaselineConstraint = self->_buttonBaselineConstraint;
  self->_buttonBaselineConstraint = v45;

  [(NSLayoutConstraint *)self->_buttonBaselineConstraint setActive:1];
  v47 = [(UIButton *)self->_button leadingAnchor];
  v48 = [(UILabel *)self->_paragraphLabel leadingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(UIButton *)self->_button trailingAnchor];
  v51 = [(UILabel *)self->_paragraphLabel trailingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(HKParagraphTableViewCell *)self contentView];
  v54 = [v53 bottomAnchor];
  v55 = [(UIButton *)self->_button lastBaselineAnchor];
  [(HKParagraphTableViewCell *)self _buttonBaselineToBottom];
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55);
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v56;

  v58 = self->_contentViewBottomConstraint;
  [(NSLayoutConstraint *)v58 setActive:1];
}

- (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2998], 32770);
}

- (double)_titleLabelTopToBaseline
{
  v2 = [(HKParagraphTableViewCell *)self _titleLabelFont];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

- (double)_titleLabelBaselineToParagraphBaseline
{
  v2 = [(HKParagraphTableViewCell *)self _paragraphLabelFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (id)_paragraphLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 0x8000);
}

- (double)_subtitleLabelBaselineToButton
{
  v2 = [(HKParagraphTableViewCell *)self _paragraphLabelFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (id)_buttonFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 0x8000);
}

- (double)_buttonBaselineToBottom
{
  v2 = [(HKParagraphTableViewCell *)self _buttonFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

- (int64_t)_buttonHorizontalAlignment
{
  if ([(UIView *)self hk_isLeftToRight]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_updateForCurrentSizeCategory
{
  double v3 = [(HKParagraphTableViewCell *)self _titleLabelFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  double v4 = [(HKParagraphTableViewCell *)self _paragraphLabelFont];
  [(UILabel *)self->_paragraphLabel setFont:v4];

  uint64_t v5 = [(HKParagraphTableViewCell *)self _buttonFont];
  v6 = [(UIButton *)self->_button titleLabel];
  [v6 setFont:v5];

  [(HKParagraphTableViewCell *)self _titleLabelTopToBaseline];
  -[NSLayoutConstraint setConstant:](self->_titleLabelBaselineConstraint, "setConstant:");
  [(HKParagraphTableViewCell *)self _titleLabelBaselineToParagraphBaseline];
  -[NSLayoutConstraint setConstant:](self->_paragraphLabelBaselineConstraint, "setConstant:");
  [(HKParagraphTableViewCell *)self _subtitleLabelBaselineToButton];
  -[NSLayoutConstraint setConstant:](self->_buttonBaselineConstraint, "setConstant:");
  [(HKParagraphTableViewCell *)self _buttonBaselineToBottom];
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  -[NSLayoutConstraint setConstant:](contentViewBottomConstraint, "setConstant:");
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  id v6 = [(HKParagraphTableViewCell *)self contentView];
  [v6 setNeedsLayout];
}

- (void)setParagraphText:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphText, a3);
  id v5 = a3;
  [(UILabel *)self->_paragraphLabel setText:v5];

  id v6 = [(HKParagraphTableViewCell *)self contentView];
  [v6 setNeedsLayout];
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
  id v5 = a3;
  [(UIButton *)self->_button setTitle:v5 forState:0];

  id v6 = [(HKParagraphTableViewCell *)self contentView];
  [v6 setNeedsLayout];
}

+ (id)reuseIdentifier
{
  return @"HKParagraphTableViewCellIdentifier";
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKParagraphTableViewCell;
  [(HKParagraphTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKParagraphTableViewCell *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKParagraphTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)paragraphText
{
  return self->_paragraphText;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_paragraphLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_paragraphLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end