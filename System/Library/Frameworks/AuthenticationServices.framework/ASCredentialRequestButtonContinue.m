@interface ASCredentialRequestButtonContinue
- (ASCredentialRequestButtonContinue)initWithCoder:(id)a3;
- (ASCredentialRequestButtonContinue)initWithFrame:(CGRect)a3;
- (id)_backgroundColorForCurrentControlState;
- (void)_commonInit;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ASCredentialRequestButtonContinue

- (ASCredentialRequestButtonContinue)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCredentialRequestButtonContinue;
  v3 = -[ASCredentialRequestButtonContinue initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ASCredentialRequestButtonContinue *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (ASCredentialRequestButtonContinue)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCredentialRequestButtonContinue;
  v3 = [(ASCredentialRequestButtonContinue *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(ASCredentialRequestButtonContinue *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  v24[3] = *MEMORY[0x263EF8340];
  v3 = +[ASViewServiceInterfaceUtilities continueButtonBackgroundColor];
  [(ASCredentialRequestButtonContinue *)self setBackgroundColor:v3];

  +[ASViewServiceInterfaceUtilities continueButtonCornerRadius];
  -[ASCredentialRequestButtonContinue _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  id v4 = objc_alloc(MEMORY[0x263F828E0]);
  v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setTextAlignment:1];
  [v5 setAdjustsFontForContentSizeCategory:1];
  [v5 setAdjustsFontSizeToFitWidth:1];
  v6 = +[ASViewServiceInterfaceUtilities continueButtonTitleFont];
  [v5 setFont:v6];

  objc_super v7 = +[ASViewServiceInterfaceUtilities continueButtonTitleColor];
  [v5 setTextColor:v7];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
  [(ASCredentialRequestButton *)self setTitleLabel:v5];
  v8 = [(ASCredentialRequestButton *)self titleLabel];
  [(ASCredentialRequestButtonContinue *)self addSubview:v8];

  v18 = (void *)MEMORY[0x263F08938];
  v23 = [(ASCredentialRequestButton *)self titleLabel];
  v22 = [v23 centerYAnchor];
  v21 = [(ASCredentialRequestButtonContinue *)self centerYAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  v19 = [(ASCredentialRequestButton *)self titleLabel];
  v9 = [v19 leadingAnchor];
  v10 = [(ASCredentialRequestButtonContinue *)self leadingAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonTitleMargin];
  v11 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
  v24[1] = v11;
  v12 = [(ASCredentialRequestButtonContinue *)self trailingAnchor];
  v13 = [(ASCredentialRequestButton *)self titleLabel];
  v14 = [v13 trailingAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonTitleMargin];
  v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  v24[2] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  [v18 activateConstraints:v16];

  v17 = [MEMORY[0x263F827D8] automaticStyle];
  [(ASCredentialRequestButtonContinue *)self setHoverStyle:v17];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestButtonContinue;
  [(ASCredentialRequestButtonContinue *)&v5 setHighlighted:a3];
  id v4 = [(ASCredentialRequestButtonContinue *)self _backgroundColorForCurrentControlState];
  [(ASCredentialRequestButtonContinue *)self setBackgroundColor:v4];
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestButtonContinue;
  [(ASCredentialRequestButtonContinue *)&v5 setEnabled:a3];
  id v4 = [(ASCredentialRequestButtonContinue *)self _backgroundColorForCurrentControlState];
  [(ASCredentialRequestButtonContinue *)self setBackgroundColor:v4];
}

- (id)_backgroundColorForCurrentControlState
{
  if ([(ASCredentialRequestButtonContinue *)self isEnabled])
  {
    if ([(ASCredentialRequestButtonContinue *)self isHighlighted]) {
      +[ASViewServiceInterfaceUtilities continueButtonHighlightedBackgroundColor];
    }
    else {
    v3 = +[ASViewServiceInterfaceUtilities continueButtonBackgroundColor];
    }
  }
  else
  {
    v3 = +[ASViewServiceInterfaceUtilities continueButtonDisabledBackgroundColor];
  }

  return v3;
}

@end