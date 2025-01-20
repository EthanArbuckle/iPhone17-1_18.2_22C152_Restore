@interface AVTCaptureButtonView
- (AVTCaptureButtonView)initWithFrame:(CGRect)a3;
- (UIButton)button;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
@end

@implementation AVTCaptureButtonView

- (AVTCaptureButtonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTCaptureButtonView;
  v3 = -[AVTCaptureButtonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C488] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button sizeToFit];
    [(AVTCaptureButtonView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)AVTCaptureButtonView;
  [(AVTCaptureButtonView *)&v13 layoutSubviews];
  v3 = [(AVTCaptureButtonView *)self button];
  [v3 frame];
  [(AVTCaptureButtonView *)self bounds];
  UIRectCenteredIntegralRect();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(AVTCaptureButtonView *)self button];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end