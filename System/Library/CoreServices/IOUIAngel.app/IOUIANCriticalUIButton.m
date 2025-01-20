@interface IOUIANCriticalUIButton
+ (id)button;
- (IOUIANCriticalUIButton)initWithFrame:(CGRect)a3;
- (IOUIANCriticalUIButtonDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation IOUIANCriticalUIButton

+ (id)button
{
  return +[IOUIANCriticalUIButton buttonWithType:1];
}

- (IOUIANCriticalUIButton)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)IOUIANCriticalUIButton;
  v3 = -[IOUIANCriticalUIButton initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [(IOUIANCriticalUIButton *)v3 setTitleColor:v4 forState:0];

    v5 = +[UIColor colorWithWhite:1.0 alpha:0.5];
    [(IOUIANCriticalUIButton *)v3 setTitleColor:v5 forState:1];

    [(IOUIANCriticalUIButton *)v3 setExclusiveTouch:1];
    v6 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v6 setNumberOfLines:1];

    v7 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v7 setBaselineAdjustment:1];

    v8 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v8 setLineBreakMode:0];

    v9 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v9 setTextAlignment:1];

    v10 = sub_100003DFC(UIFontTextStyleCallout, UIContentSizeCategoryExtraExtraLarge);
    v11 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v11 setFont:v10];

    v12 = [(IOUIANCriticalUIButton *)v3 titleLabel];
    [v12 setAdjustsFontSizeToFitWidth:0];

    [(IOUIANCriticalUIButton *)v3 _setContinuousCornerRadius:24.0];
    v13 = [(IOUIANCriticalUIButton *)v3 layer];
    [v13 setHitTestsAsOpaque:1];

    v14 = +[UIButtonConfiguration plainButtonConfiguration];
    v15 = [v14 background];
    v16 = +[UIBlurEffect effectWithStyle:1];
    [v15 setVisualEffect:v16];

    [v14 setBackground:v15];
    [v14 setCornerStyle:4];
    objc_msgSend(v14, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
    [(IOUIANCriticalUIButton *)v3 setConfiguration:v14];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100003D04;
    v20[3] = &unk_10000C4B8;
    v17 = v3;
    v21 = v17;
    v18 = +[UIAction actionWithHandler:v20];
    [(IOUIANCriticalUIButton *)v17 addAction:v18 forControlEvents:64];
  }
  return v3;
}

- (IOUIANCriticalUIButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IOUIANCriticalUIButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end