@interface UIColor(BaseBoardUI)
- (id)BSColor;
@end

@implementation UIColor(BaseBoardUI)

- (id)BSColor
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  if ([a1 getRed:&v8 green:&v7 blue:&v6 alpha:&v5])
  {
    v1 = [MEMORY[0x1E4F4F6E0] colorWithRed:v8 green:v7 blue:v6 alpha:v5];
  }
  else
  {
    v2 = BSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A2B0C000, v2, OS_LOG_TYPE_ERROR, "UIColor is not in a RGBA-compatible color-space.", v4, 2u);
    }

    v1 = 0;
  }

  return v1;
}

@end