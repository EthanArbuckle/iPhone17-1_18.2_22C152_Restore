@interface UIFont(Camera)
+ (id)ck_cui_cameraFontForContentSize:()Camera;
+ (id)ck_cui_cameraModeDialApproximateFontForContentSize:()Camera;
+ (id)ck_cui_cameraModeDialFontForContentSize:()Camera;
+ (id)ck_cui_cameraPadModeDialFontForContentSize:()Camera;
+ (id)ck_cui_cameraTimerFontForContentSize:()Camera;
+ (uint64_t)ck_cui_cameraFontOfSize:()Camera;
+ (uint64_t)ck_cui_cameraKerningForFont:()Camera;
+ (void)_interpolatedAdditionalFontSizeForMainScreen;
@end

@implementation UIFont(Camera)

+ (uint64_t)ck_cui_cameraFontOfSize:()Camera
{
  return [MEMORY[0x1E4FB08E0] systemFontOfSize:*MEMORY[0x1E4FB0980] weight:a1 design:*MEMORY[0x1E4FB09D8]];
}

+ (void)_interpolatedAdditionalFontSizeForMainScreen
{
  v0 = [MEMORY[0x1E4F42D90] mainScreen];
  [v0 bounds];
  CGRectGetWidth(v1);
}

+ (id)ck_cui_cameraFontForContentSize:()Camera
{
  id v4 = a3;
  [a1 _interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  if (([v4 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4F437B0]])
  {
    double v7 = 12.0;
LABEL_6:
    double v8 = v6 + v7;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F437A0]])
  {
    double v7 = 13.0;
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F43798]])
  {
    double v7 = 15.0;
    goto LABEL_6;
  }
  [v4 isEqualToString:*MEMORY[0x1E4F43790]];
  double v8 = 17.0;
LABEL_7:
  v9 = objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);

  return v9;
}

+ (id)ck_cui_cameraTimerFontForContentSize:()Camera
{
  id v4 = a3;
  [a1 _interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  if (([v4 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4F437B0]])
  {
    double v7 = 20.0;
LABEL_6:
    double v8 = v6 + v7;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F437A0]])
  {
    double v7 = 21.0;
    goto LABEL_6;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F43798]])
  {
    double v7 = 22.0;
    goto LABEL_6;
  }
  double v8 = v6 + 23.0;
  [v4 isEqualToString:*MEMORY[0x1E4F43790]];
LABEL_7:
  v9 = objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);

  return v9;
}

+ (id)ck_cui_cameraModeDialFontForContentSize:()Camera
{
  id v4 = a3;
  [a1 _interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  double v7 = 13.0;
  if (([v4 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437B0]] & 1) == 0)
  {
    double v7 = 14.0;
    if (([v4 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) == 0)
    {
      double v7 = 16.0;
      if (([v4 isEqualToString:*MEMORY[0x1E4F43798]] & 1) == 0)
      {
        if ([v4 isEqualToString:*MEMORY[0x1E4F43790]]) {
          double v7 = 18.0;
        }
        else {
          double v7 = 13.0;
        }
      }
    }
  }
  double v8 = objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v6 + v7);

  return v8;
}

+ (id)ck_cui_cameraModeDialApproximateFontForContentSize:()Camera
{
  id v4 = a3;
  [a1 _interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  if (([v4 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4F437B0]]
    || [v4 isEqualToString:*MEMORY[0x1E4F437A0]])
  {
    double v7 = 22.0;
LABEL_7:
    double v8 = v6 + v7;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F43798]])
  {
    double v7 = 24.0;
    goto LABEL_7;
  }
  int v11 = [v4 isEqualToString:*MEMORY[0x1E4F43790]];
  double v8 = 16.0;
  if (v11) {
    double v8 = 26.0;
  }
LABEL_8:
  v9 = objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v8);

  return v9;
}

+ (id)ck_cui_cameraPadModeDialFontForContentSize:()Camera
{
  id v4 = a3;
  double v5 = 17.0;
  if (([v4 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F437B0]] & 1) == 0)
  {
    double v5 = 18.0;
    if (([v4 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) == 0)
    {
      double v5 = 19.0;
      if (([v4 isEqualToString:*MEMORY[0x1E4F43798]] & 1) == 0)
      {
        if ([v4 isEqualToString:*MEMORY[0x1E4F43790]]) {
          double v5 = 20.0;
        }
        else {
          double v5 = 16.0;
        }
      }
    }
  }
  double v6 = objc_msgSend(a1, "ck_cui_cameraFontOfSize:", v5);

  return v6;
}

+ (uint64_t)ck_cui_cameraKerningForFont:()Camera
{
  v3 = NSNumber;
  [a3 pointSize];
  double v5 = v4 * 25.0 / 1000.0;

  return [v3 numberWithDouble:v5];
}

@end