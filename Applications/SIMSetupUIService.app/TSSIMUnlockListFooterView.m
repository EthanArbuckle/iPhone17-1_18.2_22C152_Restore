@interface TSSIMUnlockListFooterView
- (TSSIMUnlockListFooterView)initWithDelegate:(id)a3;
- (TSSIMUnlockListFooterViewDelegate)delegate;
- (int64_t)mode;
- (void)_continueButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation TSSIMUnlockListFooterView

- (TSSIMUnlockListFooterView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = -[TSSIMUnlockListFooterView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)TSSIMUnlockListFooterView;
  [(TSSIMUnlockListFooterView *)&v24 layoutSubviews];
  [(TSSIMUnlockListFooterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIButton *)self->_continueButton frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int64_t mode = self->_mode;
  if (mode == 2)
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    CGRectGetMaxY(v26);
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    CGRectGetHeight(v27);
    UIRectCenteredXInRect();
    double v12 = v20;
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
  }
  else if (mode == 1)
  {
    [(TSSIMUnlockListFooterView *)self bounds];
    double v16 = CGRectGetWidth(v25) + -48.0;
    double v12 = 24.0;
    double v14 = 0.0;
    double v18 = 50.0;
  }
  -[UIButton setFrame:](self->_continueButton, "setFrame:", v12, v14, v16, v18);
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_int64_t mode = a3;
    [(UIButton *)self->_continueButton removeFromSuperview];
    if (a3)
    {
      if (a3 == 2)
      {
        double v22 = +[UIButton buttonWithType:1];
        continueButton = self->_continueButton;
        self->_continueButton = v22;

        objc_super v24 = self->_continueButton;
        CGRect v25 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        [(UIButton *)v24 _setFont:v25];

        CGRect v26 = self->_continueButton;
        CGRect v27 = +[UIColor systemBlueColor];
        [(UIButton *)v26 setTitleColor:v27 forState:0];

        v28 = self->_continueButton;
        v29 = +[NSBundle mainBundle];
        v30 = [v29 localizedStringForKey:@"SKIP" value:&stru_100020AC8 table:@"Localizable"];
        [(UIButton *)v28 setTitle:v30 forState:0];

        [(UIButton *)self->_continueButton sizeToFit];
      }
      else if (a3 == 1)
      {
        double v5 = +[UIButton buttonWithType:0];
        CGFloat v6 = self->_continueButton;
        self->_continueButton = v5;

        double v7 = self->_continueButton;
        CGFloat v8 = +[UIColor systemBlueColor];
        [(UIButton *)v7 setBackgroundColor:v8];

        double v9 = self->_continueButton;
        CGFloat v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        [(UIButton *)v9 _setFont:v10];

        double v11 = self->_continueButton;
        double v12 = +[NSBundle mainBundle];
        double v13 = [v12 localizedStringForKey:@"CONTINUE" value:&stru_100020AC8 table:@"Localizable"];
        [(UIButton *)v11 setTitle:v13 forState:0];

        double v14 = self->_continueButton;
        double v15 = +[UIColor whiteColor];
        [(UIButton *)v14 setTitleColor:v15 forState:0];

        double v16 = self->_continueButton;
        double v17 = +[UIColor whiteColor];
        double v18 = [v17 colorWithAlphaComponent:0.25];
        [(UIButton *)v16 setTitleColor:v18 forState:1];

        v19 = [(UIButton *)self->_continueButton titleLabel];
        [v19 setAdjustsFontSizeToFitWidth:1];

        double v20 = [(UIButton *)self->_continueButton layer];
        [v20 setCornerRadius:8.0];
      }
    }
    else
    {
      double v21 = self->_continueButton;
      self->_continueButton = 0;
    }
    [(UIButton *)self->_continueButton addTarget:self action:"_continueButtonPressed:" forControlEvents:0x2000];
    [(TSSIMUnlockListFooterView *)self addSubview:self->_continueButton];
    [(TSSIMUnlockListFooterView *)self setNeedsLayout];
  }
}

- (void)_continueButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained unlockListFooterViewContinueButtonWasPressed:self];
}

- (int64_t)mode
{
  return self->_mode;
}

- (TSSIMUnlockListFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSSIMUnlockListFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end