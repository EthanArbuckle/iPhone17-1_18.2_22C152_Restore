@interface NTKShibaColorPalette
- (BOOL)_usesOverrideTickColors;
- (id)_activeTickColor;
- (id)_inactiveTickColor;
@end

@implementation NTKShibaColorPalette

- (BOOL)_usesOverrideTickColors
{
  if (![(NTKShibaColorPalette *)self isCompositePalette]) {
    return 0;
  }
  BOOL v3 = 1;
  v4 = [(NTKShibaColorPalette *)self paletteAtIndex:1];
  unsigned __int8 v5 = [v4 isBlackColor];

  if ((v5 & 1) == 0) {
    return 0;
  }
  return v3;
}

- (id)_activeTickColor
{
  if ([(NTKShibaColorPalette *)self _usesOverrideTickColors]) {
    [(NTKShibaColorPalette *)self primaryTextColor];
  }
  else {
  BOOL v3 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  }

  return v3;
}

- (id)_inactiveTickColor
{
  if ([(NTKShibaColorPalette *)self _usesOverrideTickColors])
  {
    BOOL v3 = [(NTKShibaColorPalette *)self activeTickColor];
    v4 = [v3 colorWithAlphaComponent:0.3];
  }
  else
  {
    v4 = +[UIColor colorWithWhite:0.4 alpha:1.0];
  }

  return v4;
}

@end