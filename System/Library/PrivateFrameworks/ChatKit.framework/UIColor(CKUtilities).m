@interface UIColor(CKUtilities)
- (id)colorByBlendingWithColor:()CKUtilities;
- (id)colorByBlendingWithColor:()CKUtilities withFraction:;
@end

@implementation UIColor(CKUtilities)

- (id)colorByBlendingWithColor:()CKUtilities
{
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  id v4 = a3;
  [a1 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [v4 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];

  v5 = [MEMORY[0x1E4F428B8] colorWithRed:(1.0 - v7) * (v14 * v11) + v10 * v7 green:(1.0 - v7) * (v11 * v13) + v9 * v7 blue:(1.0 - v7) * (v11 * v12) + v8 * v7 alpha:v7 + v11 * (1.0 - v7)];

  return v5;
}

- (id)colorByBlendingWithColor:()CKUtilities withFraction:
{
  double v16 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v13 = 0.0;
  id v6 = a4;
  [a1 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
  double v11 = 0.0;
  double v12 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  [v6 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];

  double v7 = [MEMORY[0x1E4F428B8] colorWithRed:v12 * a2 + (1.0 - a2) * v16 green:v11 * a2 + (1.0 - a2) * v15 blue:v10 * a2 + (1.0 - a2) * v14 alpha:v9 * a2 + (1.0 - a2) * v13];

  return v7;
}

@end