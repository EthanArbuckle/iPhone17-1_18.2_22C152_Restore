@interface UIScreen(CKUtilities)
- (BOOL)__ck_isFullscreen;
@end

@implementation UIScreen(CKUtilities)

- (BOOL)__ck_isFullscreen
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 1) {
    return 1;
  }
  [a1 _mainSceneFrame];
  BOOL result = 1;
  if (v4 != 0.0)
  {
    double v7 = v5;
    if (v5 != 0.0)
    {
      double v8 = v4;
      [a1 _referenceBounds];
      BOOL v11 = v8 < v7;
      if (v9 < v10) {
        BOOL v11 = v8 > v7;
      }
      if (v11) {
        double v12 = v8;
      }
      else {
        double v12 = v7;
      }
      if (v11) {
        double v13 = v7;
      }
      else {
        double v13 = v8;
      }
      return v12 == v10 && v13 == v9;
    }
  }
  return result;
}

@end