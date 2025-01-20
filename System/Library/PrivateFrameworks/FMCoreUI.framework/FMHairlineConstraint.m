@interface FMHairlineConstraint
- (double)pixelHeight;
- (void)setPixelHeight:(double)a3;
@end

@implementation FMHairlineConstraint

- (double)pixelHeight
{
  [(FMHairlineConstraint *)self constant];
  double v3 = v2;
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v3 * v5;

  return v6;
}

- (void)setPixelHeight:(double)a3
{
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  [(FMHairlineConstraint *)self setConstant:a3 / v5];
}

@end