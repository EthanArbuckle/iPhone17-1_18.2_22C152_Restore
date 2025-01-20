@interface MKPuckAnnotationViewBaseColor
@end

@implementation MKPuckAnnotationViewBaseColor

id ___MKPuckAnnotationViewBaseColor_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 userInterfaceStyle] == 2)
  {
    if ([v3 accessibilityContrast] == 1)
    {
      double v4 = 0.682352941;
      double v5 = 0.698039216;
    }
    else
    {
      double v4 = 0.780392157;
      double v5 = 0.8;
    }
    v7 = [MEMORY[0x1E4F428B8] colorWithRed:v4 green:v4 blue:v5 alpha:1.0];
    v6 = v7;
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v8 = [v7 colorWithAlphaComponent:0.5];

      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = [MEMORY[0x1E4F428B8] whiteColor];
  }

  return v6;
}

@end