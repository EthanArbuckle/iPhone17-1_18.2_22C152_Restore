@interface CNImageDerivedColorBackgroundUtilities
+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3;
+ (BOOL)backgroundColorsPreferWhiteForegroundText:(id)a3;
+ (id)averageColorForBackgroundColors:(id)a3;
@end

@implementation CNImageDerivedColorBackgroundUtilities

+ (id)averageColorForBackgroundColors:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v18 = 0.0;
        double v19 = 0.0;
        double v16 = 0.0;
        double v17 = 0.0;
        [v12 getRed:&v19 green:&v18 blue:&v17 alpha:&v16];
        double v10 = v10 + v19;
        double v9 = v9 + v18;
        double v8 = v8 + v17;
        double v7 = v7 + v16;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
  }
  unint64_t v13 = [v3 count];
  v14 = [MEMORY[0x1E4FB1618] colorWithRed:v10 / (double)v13 green:v9 / (double)v13 blue:v8 / (double)v13 alpha:v7 / (double)v13];

  return v14;
}

+ (BOOL)backgroundColorPrefersWhiteForegroundText:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = CNUILogContactCard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    double v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [v3 _colorDifferenceFromColor:v9];
    int v11 = 134218240;
    uint64_t v12 = v10;
    __int16 v13 = 2048;
    uint64_t v14 = 0x3FDCCCCCCCCCCCCDLL;
    _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "colorDifference %.2f > %.2f", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 _colorDifferenceFromColor:v5];
  BOOL v7 = v6 > 0.45;

  return v7;
}

+ (BOOL)backgroundColorsPreferWhiteForegroundText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() averageColorForBackgroundColors:v3];

  char v5 = [(id)objc_opt_class() backgroundColorPrefersWhiteForegroundText:v4];
  return v5;
}

@end