@interface UIColor(MediaControls)
- (id)adjustedColorByScale:()MediaControls;
- (uint64_t)secondaryColorForInterfaceStyle:()MediaControls;
- (uint64_t)tertiaryColorForInterfaceStyle:()MediaControls;
@end

@implementation UIColor(MediaControls)

- (uint64_t)secondaryColorForInterfaceStyle:()MediaControls
{
  return [a1 adjustedColorByScale:dbl_1AE964260[a3 == 2]];
}

- (uint64_t)tertiaryColorForInterfaceStyle:()MediaControls
{
  return [a1 adjustedColorByScale:dbl_1AE964270[a3 == 2]];
}

- (id)adjustedColorByScale:()MediaControls
{
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if ([a1 getRed:&v9 green:&v8 blue:&v7 alpha:&v6])
  {
    id v4 = [MEMORY[0x1E4FB1618] colorWithRed:v9 + a2 green:v8 + a2 blue:v7 + a2 alpha:v6];
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

@end