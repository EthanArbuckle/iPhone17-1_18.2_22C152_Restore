@interface _MKCompassViewStyleParameter
- (NSString)imageNamePart;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setImageNamePart:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _MKCompassViewStyleParameter

- (NSString)imageNamePart
{
  return self->_imageNamePart;
}

- (void)setImageNamePart:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_imageNamePart, 0);
}

@end