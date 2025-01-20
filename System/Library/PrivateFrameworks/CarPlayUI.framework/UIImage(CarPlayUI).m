@interface UIImage(CarPlayUI)
- (BOOL)isSquared;
- (id)roundingCornersIfSquared;
@end

@implementation UIImage(CarPlayUI)

- (BOOL)isSquared
{
  [a1 size];
  double v3 = v2;
  [a1 size];
  double v5 = 1.0;
  if (v4 >= 1.0) {
    double v5 = v4;
  }
  double v6 = v3 / v5;
  return v6 <= 1.01999998 && v6 >= 0.980000019;
}

- (id)roundingCornersIfSquared
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([a1 isSquared])
  {
    id v2 = a1;
  }
  else
  {
    double v3 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [a1 size];
      uint64_t v5 = v4;
      [a1 size];
      int v8 = 134218240;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl(&dword_227AC2000, v3, OS_LOG_TYPE_DEFAULT, "Setting corner radius to artwork image with size: (%f, %f)", (uint8_t *)&v8, 0x16u);
    }

    id v2 = [a1 imageWithRoundedCornersOfRadius:14.0];
  }
  return v2;
}

@end