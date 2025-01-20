@interface AKAuthorizationButton
- (NSString)buttonText;
- (UILabel)titleLabel;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)setButtonText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupButton;
@end

@implementation AKAuthorizationButton

- (void)setupButton
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKAuthorizationButton *)self setTitleLabel:v4];

  v5 = [(AKAuthorizationButton *)self titleLabel];
  v6 = +[AKAuthorizationAppearance continueButtonFont];
  [v5 setFont:v6];

  v7 = [(AKAuthorizationButton *)self titleLabel];
  [v7 setTextAlignment:1];

  v8 = [(AKAuthorizationButton *)self titleLabel];
  v9 = +[AKAuthorizationAppearance continueButtonTextColor];
  [v8 setTextColor:v9];

  v10 = [(AKAuthorizationButton *)self titleLabel];
  [v10 setAdjustsFontForContentSizeCategory:1];

  v11 = [(AKAuthorizationButton *)self titleLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(AKAuthorizationButton *)self titleLabel];
  [(AKAuthorizationButton *)self addSubview:v12];

  v13 = [(AKAuthorizationButton *)self layer];
  +[AKAuthorizationPaneMetrics continueButtonCornerRadius];
  objc_msgSend(v13, "setCornerRadius:");

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(AKAuthorizationButton *)self titleLabel];
  v26 = [v27 centerYAnchor];
  v25 = [(AKAuthorizationButton *)self centerYAnchor];
  v14 = [v26 constraintEqualToAnchor:v25];
  v28[0] = v14;
  v15 = [(AKAuthorizationButton *)self titleLabel];
  v16 = [v15 leadingAnchor];
  v17 = [(AKAuthorizationButton *)self leadingAnchor];
  +[AKAuthorizationPaneMetrics continueButtonTextHorizontalPadding];
  v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
  v28[1] = v18;
  v19 = [(AKAuthorizationButton *)self trailingAnchor];
  v20 = [(AKAuthorizationButton *)self titleLabel];
  v21 = [v20 trailingAnchor];
  +[AKAuthorizationPaneMetrics continueButtonTextHorizontalPadding];
  v22 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  v28[2] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v24 activateConstraints:v23];
}

- (NSString)buttonText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setButtonText:(id)a3
{
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  [(AKAuthorizationButton *)self removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  [(AKAuthorizationButton *)self addTarget:v6 action:a4 forControlEvents:64];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end