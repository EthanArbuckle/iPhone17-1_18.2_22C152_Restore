@interface NTKCharacterColorPalette
- (BOOL)isVintageColor;
- (NSNumber)desaturation;
@end

@implementation NTKCharacterColorPalette

- (BOOL)isVintageColor
{
  v2 = [(NTKCharacterColorPalette *)self configuration];
  v3 = [v2 colorOption];
  unsigned __int8 v4 = [v3 isEqual:@"vintage"];

  return v4;
}

- (NSNumber)desaturation
{
  if ([(NTKCharacterColorPalette *)self isVintageColor]) {
    return (NSNumber *)&off_1EB20;
  }
  else {
    return (NSNumber *)&off_1EB30;
  }
}

@end