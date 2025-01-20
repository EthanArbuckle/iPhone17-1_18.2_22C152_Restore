@interface HULayeredBackgroundEffect
+ (id)backgroundWithBlurEffect:(id)a3;
+ (id)backgroundWithFillColor:(id)a3;
- (UIBlurEffect)blurEffect;
- (UIColor)fillColor;
- (void)setBlurEffect:(id)a3;
- (void)setFillColor:(id)a3;
@end

@implementation HULayeredBackgroundEffect

+ (id)backgroundWithFillColor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HULayeredBackgroundEffect);
  [(HULayeredBackgroundEffect *)v4 setFillColor:v3];

  return v4;
}

+ (id)backgroundWithBlurEffect:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HULayeredBackgroundEffect);
  [(HULayeredBackgroundEffect *)v4 setBlurEffect:v3];

  return v4;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_blurEffect, 0);
}

@end