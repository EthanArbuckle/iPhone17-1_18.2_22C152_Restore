@interface NTKColtanColorPalette
- (BOOL)isRedGreenGold;
- (NSNumber)tickColoration;
- (UIColor)swatch;
- (id)swatchImageForSize:(CGSize)a3;
@end

@implementation NTKColtanColorPalette

- (UIColor)swatch
{
  return (UIColor *)[(NTKColtanColorPalette *)self swatchColor];
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKColtanColorPalette *)self isRedGreenGold])
  {
    v6 = [(NTKColtanColorPalette *)self unityRedColor];
    v7 = +[UIColor blackColor];
    v8 = [(NTKColtanColorPalette *)self unityGreenColor];
    v9 = -[NTKColtanColorPalette _unitySwatchImageForSize:redColor:blackColor:greenColor:](self, "_unitySwatchImageForSize:redColor:blackColor:greenColor:", v6, v7, v8, width, height);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSNumber)tickColoration
{
  if ([(NTKColtanColorPalette *)self isRedGreenGold]) {
    return (NSNumber *)&off_10B80;
  }
  else {
    return (NSNumber *)&off_10B90;
  }
}

- (BOOL)isRedGreenGold
{
  v2 = [(NTKColtanColorPalette *)self pigmentEditOption];
  v3 = [v2 fullname];
  unsigned __int8 v4 = [v3 isEqualToString:@"coltan.redgreengold"];

  return v4;
}

@end