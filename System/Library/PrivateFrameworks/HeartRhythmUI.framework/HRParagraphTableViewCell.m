@interface HRParagraphTableViewCell
+ (id)reuseIdentifier;
- (HRParagraphTableViewCell)initWithCoder:(id)a3;
- (HRParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)buttonBaselineConstraint;
- (NSLayoutConstraint)contentViewButtonBottomConstraint;
- (NSLayoutConstraint)contentViewParagraphBottomConstraint;
- (NSLayoutConstraint)paragraphLabelBaselineConstraint;
- (NSLayoutConstraint)titleLabelBaselineConstraint;
- (NSString)buttonText;
- (NSString)paragraphText;
- (NSString)titleText;
- (UIButton)button;
- (UILabel)paragraphLabel;
- (UILabel)titleLabel;
- (double)_lastViewToBottom;
- (double)_subtitleLabelBaselineToButton;
- (double)_titleLabelBaselineToParagraphBaseline;
- (double)_titleLabelTopToBaseline;
- (id)_buttonFont;
- (id)_buttonFontTextStyle;
- (id)_paragraphLabelFont;
- (id)_paragraphLabelFontTextStyle;
- (id)_titleLabelFont;
- (id)_titleLabelFontTextStyle;
- (int64_t)_buttonHorizontalAlignment;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)_updateBottomConstraint;
- (void)_updateForCurrentSizeCategory;
- (void)setButton:(id)a3;
- (void)setButtonBaselineConstraint:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setContentViewButtonBottomConstraint:(id)a3;
- (void)setContentViewParagraphBottomConstraint:(id)a3;
- (void)setParagraphLabel:(id)a3;
- (void)setParagraphLabelBaselineConstraint:(id)a3;
- (void)setParagraphText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelBaselineConstraint:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HRParagraphTableViewCell

- (HRParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HRParagraphTableViewCell;
  v4 = [(HRParagraphTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HRParagraphTableViewCell *)v4 _setUpUI];
    [(HRParagraphTableViewCell *)v5 _setUpConstraints];
  }
  return v5;
}

- (HRParagraphTableViewCell)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  v6 = [(HRParagraphTableViewCell *)self titleLabel];
  [v6 setText:v5];

  id v7 = [(HRParagraphTableViewCell *)self contentView];
  [v7 setNeedsLayout];
}

- (void)setParagraphText:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphText, a3);
  id v5 = a3;
  v6 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v6 setText:v5];

  id v7 = [(HRParagraphTableViewCell *)self contentView];
  [v7 setNeedsLayout];
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
  id v5 = a3;
  v6 = [(HRParagraphTableViewCell *)self button];
  [v6 setTitle:v5 forState:0];

  [(HRParagraphTableViewCell *)self _updateBottomConstraint];
  id v7 = [(HRParagraphTableViewCell *)self contentView];
  [v7 setNeedsLayout];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRParagraphTableViewCell;
  [(HRParagraphTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HRParagraphTableViewCell *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HRParagraphTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)_setUpUI
{
  [(HRParagraphTableViewCell *)self setSelectionStyle:0];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRParagraphTableViewCell *)self setTitleLabel:v3];

  id v4 = [(HRParagraphTableViewCell *)self _titleLabelFont];
  id v5 = [(HRParagraphTableViewCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [MEMORY[0x263F1C550] blackColor];
  id v7 = [(HRParagraphTableViewCell *)self titleLabel];
  [v7 setTextColor:v6];

  char v8 = [(HRParagraphTableViewCell *)self titleLabel];
  [v8 setNumberOfLines:0];

  objc_super v9 = [(HRParagraphTableViewCell *)self titleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HRParagraphTableViewCell *)self contentView];
  v11 = [(HRParagraphTableViewCell *)self titleLabel];
  [v10 addSubview:v11];

  id v12 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRParagraphTableViewCell *)self setParagraphLabel:v12];

  v13 = [(HRParagraphTableViewCell *)self _paragraphLabelFont];
  v14 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v14 setFont:v13];

  v15 = [MEMORY[0x263F1C550] blackColor];
  v16 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v16 setTextColor:v15];

  v17 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v17 setNumberOfLines:0];

  v18 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(HRParagraphTableViewCell *)self contentView];
  v20 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v19 addSubview:v20];

  id v21 = objc_alloc_init(MEMORY[0x263F1C488]);
  [(HRParagraphTableViewCell *)self setButton:v21];

  v22 = [(HRParagraphTableViewCell *)self _buttonFont];
  v23 = [(HRParagraphTableViewCell *)self button];
  v24 = [v23 titleLabel];
  [v24 setFont:v22];

  v25 = [(HRParagraphTableViewCell *)self button];
  v26 = HKHealthKeyColor();
  [v25 setTitleColor:v26 forState:0];

  v27 = [(HRParagraphTableViewCell *)self button];
  objc_msgSend(v27, "setContentHorizontalAlignment:", -[HRParagraphTableViewCell _buttonHorizontalAlignment](self, "_buttonHorizontalAlignment"));

  v28 = [(HRParagraphTableViewCell *)self button];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v30 = [(HRParagraphTableViewCell *)self contentView];
  v29 = [(HRParagraphTableViewCell *)self button];
  [v30 addSubview:v29];
}

- (void)_setUpConstraints
{
  id v3 = [(HRParagraphTableViewCell *)self titleLabel];
  id v4 = [v3 firstBaselineAnchor];
  id v5 = [(HRParagraphTableViewCell *)self contentView];
  v6 = [v5 topAnchor];
  [(HRParagraphTableViewCell *)self _titleLabelTopToBaseline];
  id v7 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  [(HRParagraphTableViewCell *)self setTitleLabelBaselineConstraint:v7];

  char v8 = [(HRParagraphTableViewCell *)self titleLabelBaselineConstraint];
  [v8 setActive:1];

  objc_super v9 = [(HRParagraphTableViewCell *)self titleLabel];
  v10 = [(HRParagraphTableViewCell *)self layoutMarginsGuide];
  objc_msgSend(v9, "hrui_alignHorizontalConstraintsWithGuide:insets:", v10, *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));

  v11 = [(HRParagraphTableViewCell *)self paragraphLabel];
  id v12 = [v11 firstBaselineAnchor];
  v13 = [(HRParagraphTableViewCell *)self titleLabel];
  v14 = [v13 lastBaselineAnchor];
  [(HRParagraphTableViewCell *)self _titleLabelBaselineToParagraphBaseline];
  v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  [(HRParagraphTableViewCell *)self setParagraphLabelBaselineConstraint:v15];

  v16 = [(HRParagraphTableViewCell *)self paragraphLabelBaselineConstraint];
  [v16 setActive:1];

  v17 = [(HRParagraphTableViewCell *)self paragraphLabel];
  v18 = [(HRParagraphTableViewCell *)self titleLabel];
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  v19 = [(HRParagraphTableViewCell *)self button];
  v20 = [v19 firstBaselineAnchor];
  id v21 = [(HRParagraphTableViewCell *)self paragraphLabel];
  v22 = [v21 lastBaselineAnchor];
  [(HRParagraphTableViewCell *)self _subtitleLabelBaselineToButton];
  v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  [(HRParagraphTableViewCell *)self setButtonBaselineConstraint:v23];

  v24 = [(HRParagraphTableViewCell *)self buttonBaselineConstraint];
  [v24 setActive:1];

  v25 = [(HRParagraphTableViewCell *)self button];
  v26 = [(HRParagraphTableViewCell *)self paragraphLabel];
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", v26, 0.0);

  v27 = [(HRParagraphTableViewCell *)self contentView];
  v28 = [v27 bottomAnchor];
  v29 = [(HRParagraphTableViewCell *)self paragraphLabel];
  id v30 = [v29 lastBaselineAnchor];
  [(HRParagraphTableViewCell *)self _lastViewToBottom];
  v31 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30);
  [(HRParagraphTableViewCell *)self setContentViewParagraphBottomConstraint:v31];

  v32 = [(HRParagraphTableViewCell *)self contentView];
  v33 = [v32 bottomAnchor];
  v34 = [(HRParagraphTableViewCell *)self button];
  v35 = [v34 lastBaselineAnchor];
  [(HRParagraphTableViewCell *)self _lastViewToBottom];
  v36 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
  [(HRParagraphTableViewCell *)self setContentViewButtonBottomConstraint:v36];

  [(HRParagraphTableViewCell *)self _updateBottomConstraint];
}

- (id)_titleLabelFontTextStyle
{
  return (id)*MEMORY[0x263F1D308];
}

- (id)_titleLabelFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HRParagraphTableViewCell *)self _titleLabelFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 32770);

  return v4;
}

- (double)_titleLabelTopToBaseline
{
  v2 = (void *)MEMORY[0x263F1C668];
  id v3 = [(HRParagraphTableViewCell *)self _titleLabelFontTextStyle];
  id v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:30.0];
  double v6 = v5;

  return v6;
}

- (id)_paragraphLabelFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_paragraphLabelFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HRParagraphTableViewCell *)self _paragraphLabelFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);

  return v4;
}

- (double)_titleLabelBaselineToParagraphBaseline
{
  v2 = (void *)MEMORY[0x263F1C668];
  id v3 = [(HRParagraphTableViewCell *)self _paragraphLabelFontTextStyle];
  id v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:24.0];
  double v6 = v5;

  return v6;
}

- (double)_subtitleLabelBaselineToButton
{
  v2 = (void *)MEMORY[0x263F1C668];
  id v3 = [(HRParagraphTableViewCell *)self _paragraphLabelFontTextStyle];
  id v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:24.0];
  double v6 = v5;

  return v6;
}

- (id)_buttonFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_buttonFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  id v3 = [(HRParagraphTableViewCell *)self _buttonFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);

  return v4;
}

- (double)_lastViewToBottom
{
  v2 = (void *)MEMORY[0x263F1C668];
  id v3 = [(HRParagraphTableViewCell *)self _buttonFontTextStyle];
  id v4 = [v2 metricsForTextStyle:v3];

  [v4 scaledValueForValue:20.0];
  double v6 = v5;

  return v6;
}

- (void)_updateBottomConstraint
{
  id v3 = [(HRParagraphTableViewCell *)self buttonText];

  id v4 = [(HRParagraphTableViewCell *)self contentViewParagraphBottomConstraint];
  double v5 = v4;
  if (v3)
  {
    [v4 setActive:0];

    double v6 = [(HRParagraphTableViewCell *)self contentViewButtonBottomConstraint];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  else
  {
    [v4 setActive:1];

    double v6 = [(HRParagraphTableViewCell *)self contentViewButtonBottomConstraint];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  [v6 setActive:v7];
}

- (int64_t)_buttonHorizontalAlignment
{
  if ([(HRParagraphTableViewCell *)self hk_isLeftToRight]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_updateForCurrentSizeCategory
{
  id v3 = [(HRParagraphTableViewCell *)self _titleLabelFont];
  id v4 = [(HRParagraphTableViewCell *)self titleLabel];
  [v4 setFont:v3];

  double v5 = [(HRParagraphTableViewCell *)self _paragraphLabelFont];
  double v6 = [(HRParagraphTableViewCell *)self paragraphLabel];
  [v6 setFont:v5];

  uint64_t v7 = [(HRParagraphTableViewCell *)self _buttonFont];
  id v8 = [(HRParagraphTableViewCell *)self button];
  objc_super v9 = [v8 titleLabel];
  [v9 setFont:v7];

  [(HRParagraphTableViewCell *)self _titleLabelTopToBaseline];
  double v11 = v10;
  id v12 = [(HRParagraphTableViewCell *)self titleLabelBaselineConstraint];
  [v12 setConstant:v11];

  [(HRParagraphTableViewCell *)self _titleLabelBaselineToParagraphBaseline];
  double v14 = v13;
  v15 = [(HRParagraphTableViewCell *)self paragraphLabelBaselineConstraint];
  [v15 setConstant:v14];

  [(HRParagraphTableViewCell *)self _subtitleLabelBaselineToButton];
  double v17 = v16;
  v18 = [(HRParagraphTableViewCell *)self buttonBaselineConstraint];
  [v18 setConstant:v17];

  [(HRParagraphTableViewCell *)self _lastViewToBottom];
  double v20 = v19;
  id v21 = [(HRParagraphTableViewCell *)self contentViewParagraphBottomConstraint];
  [v21 setConstant:v20];

  [(HRParagraphTableViewCell *)self _lastViewToBottom];
  double v23 = v22;
  v24 = [(HRParagraphTableViewCell *)self contentViewButtonBottomConstraint];
  [v24 setConstant:v23];

  [(HRParagraphTableViewCell *)self _updateBottomConstraint];
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)paragraphLabel
{
  return self->_paragraphLabel;
}

- (void)setParagraphLabel:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSLayoutConstraint)titleLabelBaselineConstraint
{
  return self->_titleLabelBaselineConstraint;
}

- (void)setTitleLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)paragraphLabelBaselineConstraint
{
  return self->_paragraphLabelBaselineConstraint;
}

- (void)setParagraphLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonBaselineConstraint
{
  return self->_buttonBaselineConstraint;
}

- (void)setButtonBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewParagraphBottomConstraint
{
  return self->_contentViewParagraphBottomConstraint;
}

- (void)setContentViewParagraphBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewButtonBottomConstraint
{
  return self->_contentViewButtonBottomConstraint;
}

- (void)setContentViewButtonBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewParagraphBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_paragraphLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_paragraphLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end