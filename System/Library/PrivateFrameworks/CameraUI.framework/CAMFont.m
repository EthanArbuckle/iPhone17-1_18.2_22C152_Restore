@interface CAMFont
+ (BOOL)isExtraLongCharacterSet:(id)a3;
+ (double)cameraModeDialFontSizeForContentSize:(id)a3;
+ (double)interpolatedAdditionalFontSizeForMainScreen;
+ (id)cameraFontForContentSize:(id)a3;
+ (id)cameraFontOfSize:(double)a3;
+ (id)cameraFontOfSize:(double)a3 weight:(double)a4;
+ (id)cameraKerningForFont:(id)a3;
+ (id)cameraModeDialApproximateFontForContentSize:(id)a3;
+ (id)cameraModeDialFontForContentSize:(id)a3;
+ (id)cameraModeDialFontForContentSize:(id)a3 weight:(double)a4;
+ (id)cameraMonospacedFontOfSize:(double)a3;
+ (id)cameraMonospacedFontOfSize:(double)a3 weight:(double)a4;
+ (id)cameraPadModeDialFontForContentSize:(id)a3;
+ (id)cameraTimerFontForContentSize:(id)a3 layoutStyle:(int64_t)a4;
@end

@implementation CAMFont

+ (id)cameraFontOfSize:(double)a3
{
  return (id)[a1 cameraFontOfSize:a3 weight:*MEMORY[0x263F81838]];
}

+ (id)cameraFontOfSize:(double)a3 weight:(double)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"size=%f weight=%f", *(void *)&a3, *(void *)&a4);
  if (cameraFontOfSize_weight__onceToken != -1) {
    dispatch_once(&cameraFontOfSize_weight__onceToken, &__block_literal_global_4);
  }
  v7 = [(id)cameraFontOfSize_weight__cachedCAMFonts objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [(id)cameraFontOfSize_weight__cachedCAMFonts objectForKeyedSubscript:v6];
  }
  else
  {
    v9 = +[CAMCaptureCapabilities capabilities];
    [v9 sfCameraFontSupported];

    v8 = CEKFontOfSizeWeightStyle();
    [(id)cameraFontOfSize_weight__cachedCAMFonts setObject:v8 forKeyedSubscript:v6];
  }

  return v8;
}

uint64_t __35__CAMFont_cameraFontOfSize_weight___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = cameraFontOfSize_weight__cachedCAMFonts;
  cameraFontOfSize_weight__cachedCAMFonts = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)cameraMonospacedFontOfSize:(double)a3
{
  return (id)[a1 cameraMonospacedFontOfSize:a3 weight:*MEMORY[0x263F81838]];
}

+ (id)cameraMonospacedFontOfSize:(double)a3 weight:(double)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  v5 = [a1 cameraFontOfSize:a3 weight:a4];
  v6 = [v5 fontDescriptor];
  uint64_t v17 = *MEMORY[0x263F81748];
  uint64_t v7 = *MEMORY[0x263F817B0];
  v14[0] = *MEMORY[0x263F817B8];
  v14[1] = v7;
  v15[0] = &unk_26BDDDB30;
  v15[1] = &unk_26BDDDB48;
  v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16 = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v18[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v11 = [v6 fontDescriptorByAddingAttributes:v10];

  v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:a3];

  return v12;
}

+ (double)interpolatedAdditionalFontSizeForMainScreen
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 _referenceBounds];
  double Width = CGRectGetWidth(v5);

  double result = 0.0;
  if (Width > 320.0) {
    return 1.0;
  }
  return result;
}

+ (id)cameraFontForContentSize:(id)a3
{
  id v4 = a3;
  [a1 interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = objc_msgSend(v7, "cam_initialLayoutStyle");

  if (v8 == 1) {
    double v6 = v6 + 1.0;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F83468]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F83458]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F83488]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F83470]])
  {
    double v9 = 12.0;
LABEL_8:
    double v10 = v6 + v9;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F83450]])
  {
    double v9 = 13.0;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F83440]])
  {
    double v9 = 15.0;
    goto LABEL_8;
  }
  char v13 = [v4 isEqualToString:*MEMORY[0x263F83430]];
  double v10 = 17.0;
  if ((v13 & 1) == 0)
  {
    char v14 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F83420], 17.0);
    double v10 = 20.0;
    if ((v14 & 1) == 0)
    {
      char v15 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F83418], 20.0);
      double v10 = 22.0;
      if ((v15 & 1) == 0)
      {
        char v16 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F83410], 22.0);
        double v10 = 24.0;
        if ((v16 & 1) == 0)
        {
          char v17 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F83408], 24.0);
          double v10 = 27.0;
          if ((v17 & 1) == 0)
          {
            int v18 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F83400], 27.0);
            double v10 = 17.0;
            if (v18) {
              double v10 = 29.0;
            }
          }
        }
      }
    }
  }
LABEL_9:
  v11 = [a1 cameraFontOfSize:v10];

  return v11;
}

+ (id)cameraTimerFontForContentSize:(id)a3 layoutStyle:(int64_t)a4
{
  id v6 = a3;
  [a1 interpolatedAdditionalFontSizeForMainScreen];
  double v8 = v7;
  if (([v6 isEqualToString:*MEMORY[0x263F83458]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x263F83488]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x263F83470]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x263F83468]])
  {
    double v9 = 20.0;
LABEL_6:
    double v10 = v8 + v9;
    goto LABEL_7;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F83450]])
  {
    double v9 = 21.0;
    goto LABEL_6;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F83440]])
  {
    double v9 = 22.0;
    goto LABEL_6;
  }
  double v10 = v8 + 23.0;
  if (([v6 isEqualToString:*MEMORY[0x263F83430]] & 1) == 0)
  {
    if ([v6 isEqualToString:*MEMORY[0x263F83420]])
    {
      double v9 = 26.0;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F83418]])
    {
      double v9 = 28.0;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F83410]])
    {
      double v9 = 30.0;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F83408]])
    {
      double v9 = 32.0;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F83400]]) {
      double v10 = v8 + 34.0;
    }
  }
LABEL_7:
  double v11 = v10 + 4.0;
  if (a4 != 1) {
    double v11 = v10;
  }
  v12 = [a1 cameraMonospacedFontOfSize:v11];

  return v12;
}

+ (double)cameraModeDialFontSizeForContentSize:(id)a3
{
  id v4 = a3;
  [a1 interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  double v7 = 13.0;
  if (([v4 isEqualToString:*MEMORY[0x263F83458]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83488]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83470]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83468]] & 1) == 0)
  {
    double v7 = 14.0;
    if (([v4 isEqualToString:*MEMORY[0x263F83450]] & 1) == 0)
    {
      if ([v4 isEqualToString:*MEMORY[0x263F83440]]) {
        double v7 = 16.0;
      }
      else {
        double v7 = 18.0;
      }
    }
  }

  return v6 + v7;
}

+ (id)cameraModeDialFontForContentSize:(id)a3
{
  return (id)[a1 cameraModeDialFontForContentSize:a3 weight:*MEMORY[0x263F81838]];
}

+ (id)cameraModeDialFontForContentSize:(id)a3 weight:(double)a4
{
  [a1 cameraModeDialFontSizeForContentSize:a3];
  return (id)objc_msgSend(a1, "cameraFontOfSize:weight:");
}

+ (id)cameraModeDialApproximateFontForContentSize:(id)a3
{
  id v4 = a3;
  [a1 interpolatedAdditionalFontSizeForMainScreen];
  double v6 = v5;
  if (([v4 isEqualToString:*MEMORY[0x263F83458]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F83488]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F83470]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F83468]]
    || [v4 isEqualToString:*MEMORY[0x263F83450]])
  {
    double v7 = v6 + 22.0;
  }
  else
  {
    int v10 = [v4 isEqualToString:*MEMORY[0x263F83440]];
    double v7 = v6 + 24.0;
    if (!v10) {
      double v7 = 26.0;
    }
  }
  double v8 = [a1 cameraFontOfSize:v7];

  return v8;
}

+ (id)cameraPadModeDialFontForContentSize:(id)a3
{
  id v4 = a3;
  double v5 = 17.0;
  if (([v4 isEqualToString:*MEMORY[0x263F83458]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83488]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83470]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x263F83468]] & 1) == 0)
  {
    double v5 = 18.0;
    if (([v4 isEqualToString:*MEMORY[0x263F83450]] & 1) == 0)
    {
      if ([v4 isEqualToString:*MEMORY[0x263F83440]]) {
        double v5 = 19.0;
      }
      else {
        double v5 = 20.0;
      }
    }
  }
  double v6 = [a1 cameraFontOfSize:v5];

  return v6;
}

+ (id)cameraKerningForFont:(id)a3
{
  v3 = NSNumber;
  [a3 pointSize];
  double v5 = v4 * 25.0 / 1000.0;
  return (id)[v3 numberWithDouble:v5];
}

+ (BOOL)isExtraLongCharacterSet:(id)a3
{
  uint64_t v3 = isExtraLongCharacterSet__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isExtraLongCharacterSet__onceToken, &__block_literal_global_14);
  }
  [v4 rangeOfCharacterFromSet:isExtraLongCharacterSet__teluguCharSet];
  uint64_t v6 = v5;

  return v6 != 0;
}

uint64_t __35__CAMFont_isExtraLongCharacterSet___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 3072, 128);
  uint64_t v1 = isExtraLongCharacterSet__teluguCharSet;
  isExtraLongCharacterSet__teluguCharSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end