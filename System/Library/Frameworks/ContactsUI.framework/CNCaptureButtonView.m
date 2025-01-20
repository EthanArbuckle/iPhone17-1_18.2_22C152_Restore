@interface CNCaptureButtonView
- (CNCaptureButtonView)initWithFrame:(CGRect)a3;
- (UIButton)button;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
@end

@implementation CNCaptureButtonView

- (void).cxx_destruct
{
}

- (void)setButton:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNCaptureButtonView;
  [(CNCaptureButtonView *)&v13 layoutSubviews];
  v3 = [(CNCaptureButtonView *)self button];
  [v3 frame];
  [(CNCaptureButtonView *)self bounds];
  UIRectCenteredIntegralRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CNCaptureButtonView *)self button];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CNCaptureButtonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNCaptureButtonView;
  v3 = -[CNCaptureButtonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [(Class)getCUShutterButtonClass[0]() shutterButton];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button sizeToFit];
    [(CNCaptureButtonView *)v3 addSubview:v3->_button];
  }
  return v3;
}

@end