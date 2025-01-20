@interface NTKInterpolatedColorPalette
- (BOOL)isSpecialColor;
@end

@implementation NTKInterpolatedColorPalette

- (BOOL)isSpecialColor
{
  [(NTKInterpolatedColorPalette *)self transitionFraction];
  if (v3 >= 0.5) {
    [(NTKInterpolatedColorPalette *)self toPalette];
  }
  else {
  v4 = [(NTKInterpolatedColorPalette *)self fromPalette];
  }
  unsigned __int8 v5 = [v4 isSpecialColor];

  return v5;
}

@end