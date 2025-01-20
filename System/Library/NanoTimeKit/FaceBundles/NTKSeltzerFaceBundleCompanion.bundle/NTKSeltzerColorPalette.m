@interface NTKSeltzerColorPalette
- (id)_secondHand;
- (id)_secondTickActive;
- (id)_secondTickInactive;
@end

@implementation NTKSeltzerColorPalette

- (id)_secondHand
{
  return [(NTKSeltzerColorPalette *)self primaryColor];
}

- (id)_secondTickActive
{
  return [(NTKSeltzerColorPalette *)self secondHand];
}

- (id)_secondTickInactive
{
  v2 = [(NTKSeltzerColorPalette *)self secondTickActive];
  v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

@end