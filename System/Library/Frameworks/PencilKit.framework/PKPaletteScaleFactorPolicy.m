@interface PKPaletteScaleFactorPolicy
- (double)scaleFactorForWindowBounds:(CGRect)a3;
@end

@implementation PKPaletteScaleFactorPolicy

- (double)scaleFactorForWindowBounds:(CGRect)a3
{
  uint64_t v3 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3.size.width >= a3.size.height) {
    double width = a3.size.width;
  }
  else {
    double width = a3.size.height;
  }
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  v6 = &qword_1C482B1F0;
  while (width > *((double *)v6 - 2) || height > *((double *)v6 - 1))
  {
    ++v3;
    v6 += 3;
    if (v3 == 8)
    {
      uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      double v7 = 1.0;
      goto LABEL_13;
    }
  }
  double v7 = *(double *)v6;
LABEL_13:
  v8 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134218752;
    double v11 = width;
    __int16 v12 = 2048;
    double v13 = height;
    __int16 v14 = 2048;
    double v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_INFO, "Scale factor for windowBoundsWidth: %f, windowBoundsHeight: %f is scaleFactor: %f, policy: %ld", (uint8_t *)&v10, 0x2Au);
  }

  return v7;
}

@end