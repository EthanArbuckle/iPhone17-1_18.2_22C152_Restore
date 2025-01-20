@interface PHStatusBarGradientView
- (PHStatusBarGradientView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PHStatusBarGradientView

- (PHStatusBarGradientView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHStatusBarGradientView;
  v3 = -[PHStatusBarGradientView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PHStatusBarGradientView *)v3 setUserInteractionEnabled:0];
    v5 = +[UIColor clearColor];
    [(PHStatusBarGradientView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v7 = xmmword_100284618;
  long long v8 = unk_100284628;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v6 = CGGradientCreateWithColorComponents(DeviceGray, (const CGFloat *)&v7, 0, 2uLL);
  [(PHStatusBarGradientView *)self bounds];
  v9.x = 0.0;
  v9.y = 0.0;
  v10.x = 0.0;
  CGContextDrawLinearGradient(CurrentContext, v6, v9, v10, 0);
  CFRelease(DeviceGray);
  CFRelease(v6);
}

@end