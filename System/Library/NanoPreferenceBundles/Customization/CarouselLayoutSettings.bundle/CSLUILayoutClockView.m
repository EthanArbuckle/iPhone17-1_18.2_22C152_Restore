@interface CSLUILayoutClockView
- (CSLUILayoutClockView)init;
@end

@implementation CSLUILayoutClockView

- (CSLUILayoutClockView)init
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = +[UIImage imageNamed:@"Clock@2x" inBundle:v3 compatibleWithTraitCollection:0];

  [v4 size];
  double v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)CSLUILayoutClockView;
  v7 = -[CSLUILayoutClockView initWithFrame:](&v11, "initWithFrame:", 0.0, 0.0, v6, v6);
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v6, v6);
    v9 = +[CSLUILayoutIconView circleMaskImage:v4];
    [v8 setImage:v9];

    objc_storeWeak((id *)&v7->_imageView, v8);
    [(CSLUILayoutClockView *)v7 addSubview:v8];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end