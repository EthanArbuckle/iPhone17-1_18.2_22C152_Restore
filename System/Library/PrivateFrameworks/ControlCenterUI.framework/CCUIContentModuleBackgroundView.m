@interface CCUIContentModuleBackgroundView
- (CCUIContentModuleBackgroundView)initWithFrame:(CGRect)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation CCUIContentModuleBackgroundView

- (CCUIContentModuleBackgroundView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleBackgroundView;
  v3 = -[CCUIContentModuleBackgroundView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(CCUIContentModuleBackgroundView *)v3 setBackgroundColor:v4];

    [(CCUIContentModuleBackgroundView *)v3 setAlpha:0.0];
    v5 = [(CCUIContentModuleBackgroundView *)v3 layer];
    [v5 setHitTestsAsOpaque:1];
  }
  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleBackgroundView;
  -[CCUIContentModuleBackgroundView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  v5 = [(CCUIContentModuleBackgroundView *)self layer];
  [v5 setHitTestsAsOpaque:!v3];
}

@end