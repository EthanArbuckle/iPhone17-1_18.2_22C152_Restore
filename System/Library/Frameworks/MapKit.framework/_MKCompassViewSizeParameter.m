@interface _MKCompassViewSizeParameter
- (NSString)imageNamePart;
- (UIFont)font;
- (double)diameter;
- (void)setDiameter:(double)a3;
- (void)setFont:(id)a3;
- (void)setImageNamePart:(id)a3;
@end

@implementation _MKCompassViewSizeParameter

- (double)diameter
{
  return self->_diameter;
}

- (void)setImageNamePart:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (NSString)imageNamePart
{
  return self->_imageNamePart;
}

- (UIFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_imageNamePart, 0);
}

@end