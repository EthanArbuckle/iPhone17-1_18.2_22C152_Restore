@interface UITraitCollection(MediaControls)
- (BOOL)mr_shouldDim;
@end

@implementation UITraitCollection(MediaControls)

- (BOOL)mr_shouldDim
{
  return (unint64_t)[a1 _backlightLuminance] < 2;
}

@end