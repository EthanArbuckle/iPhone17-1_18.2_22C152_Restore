@interface BSColor(BaseBoardUI)
- (uint64_t)UIColor;
@end

@implementation BSColor(BaseBoardUI)

- (uint64_t)UIColor
{
  v2 = (void *)MEMORY[0x1E4F428B8];
  [a1 red];
  double v4 = v3;
  [a1 green];
  double v6 = v5;
  [a1 blue];
  double v8 = v7;
  [a1 alpha];

  return [v2 colorWithRed:v4 green:v6 blue:v8 alpha:v9];
}

@end