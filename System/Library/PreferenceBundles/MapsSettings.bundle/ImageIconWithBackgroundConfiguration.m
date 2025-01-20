@interface ImageIconWithBackgroundConfiguration
- (CGSize)iconSize;
- (ImageIconWithBackgroundConfiguration)init;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (double)cornerRadius;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ImageIconWithBackgroundConfiguration

- (ImageIconWithBackgroundConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)ImageIconWithBackgroundConfiguration;
  v2 = [(ImageIconWithBackgroundConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_iconSize = CGSizeZero;
    uint64_t v4 = +[UIColor whiteColor];
    tintColor = v3->_tintColor;
    v3->_tintColor = (UIColor *)v4;

    v3->_cornerRadius = 0.0;
    uint64_t v6 = +[UIColor clearColor];
    backgroundColor = v3->_backgroundColor;
    v3->_backgroundColor = (UIColor *)v6;
  }
  return v3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end