@interface PHBackgroundGradientBlurView
- (PHBackgroundGradientBlurView)initWithCoder:(id)a3;
- (PHBackgroundGradientBlurView)initWithFrame:(CGRect)a3;
- (PHBackgroundGradientBlurView)initWithImage:(id)a3;
- (UIImage)image;
- (void)setImage:(id)a3;
@end

@implementation PHBackgroundGradientBlurView

- (UIImage)image
{
  id v2 = sub_1001D0A34();

  return (UIImage *)v2;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001D0AA0(v4);
}

- (PHBackgroundGradientBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D0B4C();
}

- (PHBackgroundGradientBlurView)initWithImage:(id)a3
{
  return (PHBackgroundGradientBlurView *)sub_1001D0BE0(a3);
}

- (PHBackgroundGradientBlurView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PHBackgroundGradientBlurView_image);
}

@end