@interface MFSearchShadowView
+ (double)defaultHeight;
+ (id)_shadowImage;
- (MFSearchShadowView)initWithFrame:(CGRect)a3;
@end

@implementation MFSearchShadowView

- (MFSearchShadowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFSearchShadowView;
  v3 = -[MFSearchShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() _shadowImage];
    [(MFSearchShadowView *)v3 setImage:v4];

    [(MFSearchShadowView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

+ (id)_shadowImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v2 imageNamed:@"search_shadow" inBundle:v3];

  return v4;
}

+ (double)defaultHeight
{
  v2 = [a1 _shadowImage];
  [v2 size];
  double v4 = v3;

  return v4;
}

@end