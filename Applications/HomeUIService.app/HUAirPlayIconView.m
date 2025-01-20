@interface HUAirPlayIconView
- (CGSize)intrinsicContentSize;
- (HUAirPlayIconView)initWithFrame:(CGRect)a3;
- (UIImageView)airplayImageView;
- (UIView)airplayImageBackgroundView;
- (void)defineBorderWithRadius:(double)a3 borderWidth:(double)a4 borderColor:(id)a5;
- (void)layoutSubviews;
- (void)setAirplayImageBackgroundView:(id)a3;
- (void)setAirplayImageView:(id)a3;
@end

@implementation HUAirPlayIconView

- (HUAirPlayIconView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HUAirPlayIconView;
  v3 = -[HUAirPlayIconView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    airplayImageBackgroundView = v3->_airplayImageBackgroundView;
    v3->_airplayImageBackgroundView = v4;

    v6 = +[UIColor systemBlueColor];
    [(UIView *)v3->_airplayImageBackgroundView setBackgroundColor:v6];

    v7 = +[UIImage hu_smallAirPlayAudioImage];
    v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    airplayImageView = v3->_airplayImageView;
    v3->_airplayImageView = v8;

    [(UIImageView *)v3->_airplayImageView setContentMode:2];
    [(HUAirPlayIconView *)v3 addSubview:v3->_airplayImageBackgroundView];
    [(HUAirPlayIconView *)v3 addSubview:v3->_airplayImageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUAirPlayIconView;
  [(HUAirPlayIconView *)&v18 layoutSubviews];
  [(HUAirPlayIconView *)self bounds];
  double MidX = CGRectGetMidX(v19);
  [(HUAirPlayIconView *)self bounds];
  double MidY = CGRectGetMidY(v20);
  [(HUAirPlayIconView *)self bounds];
  double v6 = v5;
  [(HUAirPlayIconView *)self bounds];
  double v8 = v7;
  v9 = [(HUAirPlayIconView *)self airplayImageBackgroundView];
  [v9 setBounds:0.0, 0.0, v6, v8];

  v10 = [(HUAirPlayIconView *)self airplayImageBackgroundView];
  [v10 setCenter:MidX, MidY];

  [(HUAirPlayIconView *)self bounds];
  double v12 = v11 * 0.55;
  [(HUAirPlayIconView *)self bounds];
  double v14 = v13 * 0.55;
  v15 = [(HUAirPlayIconView *)self airplayImageView];
  [v15 setBounds:0.0, 0.0, v12, v14];

  v16 = [(HUAirPlayIconView *)self airplayImageView];
  [v16 setCenter:MidX, MidY];

  v17 = +[UIColor systemWhiteColor];
  [(HUAirPlayIconView *)self defineBorderWithRadius:v17 borderWidth:17.0 borderColor:4.0];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 34.0;
  double v3 = 34.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)defineBorderWithRadius:(double)a3 borderWidth:(double)a4 borderColor:(id)a5
{
  [(HUAirPlayIconView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
  v17 = +[CAShapeLayer layer];
  [v17 setFrame:v9, v11, v13, v15];
  id v25 = v16;
  objc_msgSend(v17, "setPath:", objc_msgSend(v25, "CGPath"));
  objc_super v18 = [(HUAirPlayIconView *)self layer];
  [v18 setMask:v17];

  CGRect v19 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v9, v11, v13, v15, a3, a3);
  CGRect v20 = +[CAShapeLayer layer];
  [v20 setFrame:v9, v11, v13, v15];
  id v21 = v19;
  objc_msgSend(v20, "setPath:", objc_msgSend(v21, "CGPath"));
  id v22 = +[UIColor whiteColor];
  objc_msgSend(v20, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

  id v23 = +[UIColor clearColor];
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v23, "CGColor"));

  [v20 setLineWidth:a4];
  v24 = [(HUAirPlayIconView *)self layer];
  [v24 addSublayer:v20];
}

- (UIView)airplayImageBackgroundView
{
  return self->_airplayImageBackgroundView;
}

- (void)setAirplayImageBackgroundView:(id)a3
{
}

- (UIImageView)airplayImageView
{
  return self->_airplayImageView;
}

- (void)setAirplayImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airplayImageView, 0);

  objc_storeStrong((id *)&self->_airplayImageBackgroundView, 0);
}

@end