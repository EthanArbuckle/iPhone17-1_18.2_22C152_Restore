@interface CAMSmartStyleUtilities
+ (CGPoint)colorAndToneBiasForSlider2DValue:(CGPoint)a3 limitRangeForSystemStyles:(BOOL)a4;
+ (CGPoint)slider2DValueForStyle:(id)a3 limitRangeForSystemStyles:(BOOL)a4;
+ (double)colorOrToneBiasForSlider2DValue:(double)result limitRangeForSystemStyles:(BOOL)a4;
+ (double)slider2DValueForColorOrToneBias:(double)result limitRangeForSystemStyles:(BOOL)a4;
+ (id)_validatedSystemStyleForStyle:(id)a3;
+ (id)readAVCaptureSystemStyle;
+ (id)readAVCaptureSystemStyleBypassXPC:(BOOL)a3;
+ (void)writeAVCaptureSystemStyle:(id)a3;
@end

@implementation CAMSmartStyleUtilities

+ (id)readAVCaptureSystemStyle
{
  return (id)[a1 readAVCaptureSystemStyleBypassXPC:0];
}

+ (id)readAVCaptureSystemStyleBypassXPC:(BOOL)a3
{
  if (a3) {
    AVSmartStyleSettingsGetSystemStyleFast();
  }
  else {
  v4 = AVSmartStyleSettingsGetSystemStyle();
  }
  if (!v4)
  {
    v4 = [MEMORY[0x263EFA648] identityStyle];
  }
  v5 = [a1 _validatedSystemStyleForStyle:v4];

  return v5;
}

+ (void)writeAVCaptureSystemStyle:(id)a3
{
  id v3 = [a1 _validatedSystemStyleForStyle:a3];
  AVSmartStyleSettingsSetSystemStyle();
}

+ (id)_validatedSystemStyleForStyle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    [v5 toneBias];
    float v7 = fmaxf(fminf(v6, 0.5), -0.5);
    [v5 colorBias];
    float v9 = fmaxf(fminf(v8, 0.5), -0.5);
    [v5 toneBias];
    if (v7 == v10 && ([v5 colorBias], v9 == v11))
    {
      v14 = v5;
    }
    else
    {
      v12 = (void *)MEMORY[0x263EFA648];
      v13 = [v5 cast];
      [v5 intensity];
      v14 = objc_msgSend(v12, "styleWithCast:intensity:toneBias:colorBias:", v13);

      v15 = os_log_create("com.apple.camera", "SmartStyle");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        id v18 = v5;
        __int16 v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "System style exceeded allowed range limits. Clamping from %{public}@ to %{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (double)slider2DValueForColorOrToneBias:(double)result limitRangeForSystemStyles:(BOOL)a4
{
  if (a4) {
    return result + result;
  }
  return result;
}

+ (double)colorOrToneBiasForSlider2DValue:(double)result limitRangeForSystemStyles:(BOOL)a4
{
  if (a4) {
    return result * 0.5;
  }
  return result;
}

+ (CGPoint)slider2DValueForStyle:(id)a3 limitRangeForSystemStyles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 colorBias];
  objc_msgSend(a1, "slider2DValueForColorOrToneBias:limitRangeForSystemStyles:", v4);
  double v8 = v7;
  [v6 toneBias];
  double v10 = v9;

  [a1 slider2DValueForColorOrToneBias:v4 limitRangeForSystemStyles:v10];
  double v12 = v11;
  double v13 = v8;
  result.y = v12;
  result.x = v13;
  return result;
}

+ (CGPoint)colorAndToneBiasForSlider2DValue:(CGPoint)a3 limitRangeForSystemStyles:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  objc_msgSend(a1, "colorOrToneBiasForSlider2DValue:limitRangeForSystemStyles:", a3.x);
  double v8 = v7;
  [a1 colorOrToneBiasForSlider2DValue:v4 limitRangeForSystemStyles:y];
  double v10 = v9;
  double v11 = v8;
  result.double y = v10;
  result.x = v11;
  return result;
}

@end