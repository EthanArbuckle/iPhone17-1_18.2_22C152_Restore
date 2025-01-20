@interface PKPaletteToolViewAnimation
+ (void)performSelectionAnimations:(void *)a3 completion:;
@end

@implementation PKPaletteToolViewAnimation

+ (void)performSelectionAnimations:(void *)a3 completion:
{
  id v4 = a3;
  id v5 = a2;
  self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v5 usingSpringWithDamping:v4 initialSpringVelocity:0.55 options:0.0 animations:0.65 completion:0.0];
}

@end