@interface LPCaptionButtonCollapsedPresentationProperties
- (LPImage)icon;
- (UIColor)backgroundColor;
- (double)layoutRatioThreshold;
- (void)setBackgroundColor:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLayoutRatioThreshold:(double)a3;
@end

@implementation LPCaptionButtonCollapsedPresentationProperties

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (double)layoutRatioThreshold
{
  return self->_layoutRatioThreshold;
}

- (void)setLayoutRatioThreshold:(double)a3
{
  self->_layoutRatioThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end