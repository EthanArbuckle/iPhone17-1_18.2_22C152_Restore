@interface HUISliderConfig
- (BOOL)isLargeText;
- (BOOL)isSubmenuSlider;
- (BOOL)providesOwnSeparator;
- (UIAction)minImageAction;
- (UIImage)maxImage;
- (UIImage)minImage;
- (UILabel)minTextLabel;
- (UILabel)valueLabel;
- (int64_t)style;
- (void)setIsLargeText:(BOOL)a3;
- (void)setIsSubmenuSlider:(BOOL)a3;
- (void)setMaxImage:(id)a3;
- (void)setMinImage:(id)a3;
- (void)setMinImageAction:(id)a3;
- (void)setMinTextLabel:(id)a3;
- (void)setProvidesOwnSeparator:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation HUISliderConfig

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIImage)minImage
{
  return self->_minImage;
}

- (void)setMinImage:(id)a3
{
}

- (UIImage)maxImage
{
  return self->_maxImage;
}

- (void)setMaxImage:(id)a3
{
}

- (UIAction)minImageAction
{
  return self->_minImageAction;
}

- (void)setMinImageAction:(id)a3
{
}

- (UILabel)minTextLabel
{
  return self->_minTextLabel;
}

- (void)setMinTextLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (BOOL)providesOwnSeparator
{
  return self->_providesOwnSeparator;
}

- (void)setProvidesOwnSeparator:(BOOL)a3
{
  self->_providesOwnSeparator = a3;
}

- (BOOL)isSubmenuSlider
{
  return self->_isSubmenuSlider;
}

- (void)setIsSubmenuSlider:(BOOL)a3
{
  self->_isSubmenuSlider = a3;
}

- (BOOL)isLargeText
{
  return self->_isLargeText;
}

- (void)setIsLargeText:(BOOL)a3
{
  self->_isLargeText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_minTextLabel, 0);
  objc_storeStrong((id *)&self->_minImageAction, 0);
  objc_storeStrong((id *)&self->_maxImage, 0);
  objc_storeStrong((id *)&self->_minImage, 0);
}

@end