@interface ARUIMetricColors
+ (CGGradient)newGradientForStartColor:(id)a3 endColor:(id)a4;
+ (id)clockColors;
+ (id)distanceColors;
+ (id)diveColors;
+ (id)elapsedTimeColors;
+ (id)energyColors;
+ (id)grayColors;
+ (id)heartRateColors;
+ (id)keyColors;
+ (id)noMetricColors;
+ (id)paceColors;
+ (id)pausedRingsColors;
+ (id)systemGrayTextColor;
- (NSString)workoutRingColorIdentifier;
- (UIColor)adjustmentButtonBackgroundColor;
- (UIColor)buttonDisabledTextColor;
- (UIColor)buttonTextColor;
- (UIColor)gradientContrastColor;
- (UIColor)gradientDarkColor;
- (UIColor)gradientLightColor;
- (UIColor)highContrastTextColor;
- (UIColor)lightenedNonGradientColor;
- (UIColor)nonGradientTextColor;
- (UIColor)platterBackgroundColor;
- (UIColor)platterInactiveBackgroundColor;
- (UIColor)textDisplayColor;
- (UIColor)valueDisplayColor;
- (void)setAdjustmentButtonBackgroundColor:(id)a3;
- (void)setButtonDisabledTextColor:(id)a3;
- (void)setButtonTextColor:(id)a3;
- (void)setGradientContrastColor:(id)a3;
- (void)setGradientDarkColor:(id)a3;
- (void)setGradientLightColor:(id)a3;
- (void)setHighContrastTextColor:(id)a3;
- (void)setLightenedNonGradientColor:(id)a3;
- (void)setNonGradientTextColor:(id)a3;
- (void)setPlatterBackgroundColor:(id)a3;
- (void)setPlatterInactiveBackgroundColor:(id)a3;
- (void)setTextDisplayColor:(id)a3;
- (void)setValueDisplayColor:(id)a3;
- (void)setWorkoutRingColorIdentifier:(id)a3;
@end

@implementation ARUIMetricColors

- (UIColor)gradientLightColor
{
  return self->_gradientLightColor;
}

- (UIColor)gradientDarkColor
{
  return self->_gradientDarkColor;
}

+ (id)paceColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.980392157 blue:0.815686275 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.274509804 green:0.380392157 blue:0.549019608 alpha:1.0];
  [v2 setGradientContrastColor:v4];

  v5 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.729411765 blue:0.882352941 alpha:1.0];
  [v2 setGradientDarkColor:v5];

  v6 = [MEMORY[0x263F825C8] colorWithRed:0.22745098 green:0.91372549 blue:0.901960784 alpha:1.0];
  [v2 setNonGradientTextColor:v6];

  v7 = [v2 nonGradientTextColor];
  v8 = [v7 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v8];

  v9 = [v2 nonGradientTextColor];
  v10 = [v9 colorWithAlphaComponent:0.300000012];
  [v2 setPlatterBackgroundColor:v10];

  v11 = [v2 nonGradientTextColor];
  v12 = [v11 colorWithAlphaComponent:0.219999999];
  [v2 setPlatterInactiveBackgroundColor:v12];

  v13 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v13];

  v14 = [MEMORY[0x263F825C8] colorWithRed:0.541176471 green:1.0 blue:0.984313725 alpha:1.0];
  [v2 setHighContrastTextColor:v14];

  v15 = [v2 nonGradientTextColor];
  v16 = [v2 highContrastTextColor];
  id v17 = v15;
  id v18 = v16;
  id v19 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __ARUIColorForCurrentContrastMode_block_invoke;
  v27 = &unk_264498F50;
  id v28 = v18;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  v22 = (void *)[v19 initWithDynamicProvider:&v24];

  objc_msgSend(v2, "setTextDisplayColor:", v22, v24, v25, v26, v27);

  return v2;
}

- (void)setPlatterInactiveBackgroundColor:(id)a3
{
}

- (void)setPlatterBackgroundColor:(id)a3
{
}

+ (id)distanceColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.815686275 blue:1.0 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.666666667 blue:1.0 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  v5 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.717647059 blue:1.0 alpha:1.0];
  [v2 setNonGradientTextColor:v5];

  v6 = [v2 nonGradientTextColor];
  v7 = [v6 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v7];

  v8 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setButtonTextColor:v8];

  v9 = [MEMORY[0x263F825C8] colorWithWhite:0.2 alpha:1.0];
  [v2 setButtonDisabledTextColor:v9];

  v10 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v10];

  [v2 setWorkoutRingColorIdentifier:@"distanceWorkout"];
  v11 = [MEMORY[0x263F825C8] colorWithRed:0.329411765 green:0.82745098 blue:1.0 alpha:1.0];
  [v2 setHighContrastTextColor:v11];

  v12 = [v2 nonGradientTextColor];
  v13 = [v2 highContrastTextColor];
  id v14 = v12;
  id v15 = v13;
  id v16 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __ARUIColorForCurrentContrastMode_block_invoke;
  uint64_t v24 = &unk_264498F50;
  id v25 = v15;
  id v26 = v14;
  id v17 = v15;
  id v18 = v14;
  id v19 = (void *)[v16 initWithDynamicProvider:&v21];

  objc_msgSend(v2, "setTextDisplayColor:", v19, v21, v22, v23, v24);

  return v2;
}

+ (id)energyColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.196078431 blue:0.529411765 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.882352941 green:0.0 blue:0.0784313725 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  v5 = [MEMORY[0x263F825C8] colorWithRed:0.274509804 green:0.0 blue:0.690196078 alpha:1.0];
  [v2 setGradientContrastColor:v5];

  v6 = [MEMORY[0x263F825C8] colorWithRed:0.980392157 green:0.0666666667 blue:0.309803922 alpha:1.0];
  [v2 setNonGradientTextColor:v6];

  v7 = [v2 nonGradientTextColor];
  v8 = [v7 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v8];

  v9 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setButtonTextColor:v9];

  v10 = [MEMORY[0x263F825C8] colorWithWhite:0.2 alpha:1.0];
  [v2 setButtonDisabledTextColor:v10];

  v11 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v11];

  [v2 setWorkoutRingColorIdentifier:@"calorieWorkout"];
  v12 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.392156863 blue:0.509803922 alpha:1.0];
  [v2 setHighContrastTextColor:v12];

  v13 = [v2 nonGradientTextColor];
  id v14 = [v2 highContrastTextColor];
  id v15 = v13;
  id v16 = v14;
  id v17 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __ARUIColorForCurrentContrastMode_block_invoke;
  id v25 = &unk_264498F50;
  id v26 = v16;
  id v27 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = (void *)[v17 initWithDynamicProvider:&v22];

  objc_msgSend(v2, "setTextDisplayColor:", v20, v22, v23, v24, v25);

  return v2;
}

+ (id)keyColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.717647059 green:1.0 blue:0.0 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.215686275 green:0.862745098 blue:0.0 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  v5 = [MEMORY[0x263F825C8] colorWithRed:0.0666666667 green:0.470588235 blue:0.392156863 alpha:1.0];
  [v2 setGradientContrastColor:v5];

  v6 = [MEMORY[0x263F825C8] colorWithRed:0.650980392 green:1.0 blue:0.0 alpha:1.0];
  [v2 setNonGradientTextColor:v6];

  v7 = [v2 nonGradientTextColor];
  v8 = [v7 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v8];

  v9 = [MEMORY[0x263F825C8] blackColor];
  [v2 setButtonTextColor:v9];

  v10 = [MEMORY[0x263F825C8] blackColor];
  [v2 setButtonDisabledTextColor:v10];

  v11 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v11];

  v12 = [MEMORY[0x263F825C8] colorWithRed:0.792156863 green:1.0 blue:0.403921569 alpha:1.0];
  [v2 setHighContrastTextColor:v12];

  v13 = [v2 nonGradientTextColor];
  id v14 = [v2 highContrastTextColor];
  id v15 = v13;
  id v16 = v14;
  id v17 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __ARUIColorForCurrentContrastMode_block_invoke;
  id v25 = &unk_264498F50;
  id v26 = v16;
  id v27 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = (void *)[v17 initWithDynamicProvider:&v22];

  objc_msgSend(v2, "setTextDisplayColor:", v20, v22, v23, v24, v25);

  return v2;
}

- (UIColor)nonGradientTextColor
{
  return self->_nonGradientTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDisplayColor, 0);
  objc_storeStrong((id *)&self->_highContrastTextColor, 0);
  objc_storeStrong((id *)&self->_workoutRingColorIdentifier, 0);
  objc_storeStrong((id *)&self->_platterInactiveBackgroundColor, 0);
  objc_storeStrong((id *)&self->_platterBackgroundColor, 0);
  objc_storeStrong((id *)&self->_valueDisplayColor, 0);
  objc_storeStrong((id *)&self->_buttonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_lightenedNonGradientColor, 0);
  objc_storeStrong((id *)&self->_nonGradientTextColor, 0);
  objc_storeStrong((id *)&self->_adjustmentButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_gradientContrastColor, 0);
  objc_storeStrong((id *)&self->_gradientDarkColor, 0);

  objc_storeStrong((id *)&self->_gradientLightColor, 0);
}

- (void)setValueDisplayColor:(id)a3
{
}

- (void)setTextDisplayColor:(id)a3
{
}

- (void)setNonGradientTextColor:(id)a3
{
}

- (void)setHighContrastTextColor:(id)a3
{
}

- (void)setGradientLightColor:(id)a3
{
}

- (void)setGradientDarkColor:(id)a3
{
}

- (void)setAdjustmentButtonBackgroundColor:(id)a3
{
}

- (UIColor)highContrastTextColor
{
  return self->_highContrastTextColor;
}

- (void)setButtonTextColor:(id)a3
{
}

- (void)setButtonDisabledTextColor:(id)a3
{
}

- (void)setGradientContrastColor:(id)a3
{
}

- (void)setWorkoutRingColorIdentifier:(id)a3
{
}

+ (id)systemGrayTextColor
{
  if (systemGrayTextColor_onceToken != -1) {
    dispatch_once(&systemGrayTextColor_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)systemGrayTextColor_systemGrayTextColor;

  return v2;
}

uint64_t __39__ARUIMetricColors_systemGrayTextColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F825C8] colorWithRed:0.682352941 green:0.705882353 blue:0.749019608 alpha:1.0];
  uint64_t v1 = systemGrayTextColor_systemGrayTextColor;
  systemGrayTextColor_systemGrayTextColor = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (CGGradient)newGradientForStartColor:(id)a3 endColor:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v13[0] = [v5 CGColor];
  id v7 = v6;
  uint64_t v8 = [v7 CGColor];

  v13[1] = v8;
  CFArrayRef v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CGGradientCreateWithColors(DeviceRGB, v9, 0);
  CGColorSpaceRelease(DeviceRGB);

  return v11;
}

+ (id)noMetricColors
{
  id v2 = [a1 keyColors];
  [v2 setWorkoutRingColorIdentifier:@"openWorkout"];

  return v2;
}

+ (id)elapsedTimeColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.917647059 blue:0.0 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.764705882 blue:0.0 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  id v5 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.901960784 blue:0.125490196 alpha:1.0];
  [v2 setNonGradientTextColor:v5];

  id v6 = [v2 nonGradientTextColor];
  id v7 = [v6 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v7];

  uint64_t v8 = [v2 adjustmentButtonBackgroundColor];
  CFArrayRef v9 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
  v10 = [v9 _colorBlendedWithColor:v8];

  [v2 setLightenedNonGradientColor:v10];
  v11 = [MEMORY[0x263F825C8] blackColor];
  [v2 setButtonTextColor:v11];

  v12 = [MEMORY[0x263F825C8] blackColor];
  [v2 setButtonDisabledTextColor:v12];

  v13 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v13];

  [v2 setWorkoutRingColorIdentifier:@"timedWorkout"];
  id v14 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.941176471 blue:0.478431373 alpha:1.0];
  [v2 setHighContrastTextColor:v14];

  id v15 = [v2 nonGradientTextColor];
  id v16 = [v2 highContrastTextColor];
  id v17 = v15;
  id v18 = v16;
  id v19 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __ARUIColorForCurrentContrastMode_block_invoke;
  id v27 = &unk_264498F50;
  id v28 = v18;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  uint64_t v22 = (void *)[v19 initWithDynamicProvider:&v24];

  objc_msgSend(v2, "setTextDisplayColor:", v22, v24, v25, v26, v27);

  return v2;
}

+ (id)heartRateColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.262745098 blue:0.196078431 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.901960784 green:0.129411765 blue:0.0901960784 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  id v5 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.219607843 blue:0.0980392157 alpha:1.0];
  [v2 setNonGradientTextColor:v5];

  id v6 = [MEMORY[0x263F825C8] colorWithRed:0.941176471 green:0.556862745 blue:0.482352941 alpha:1.0];
  [v2 setLightenedNonGradientColor:v6];

  id v7 = [v2 nonGradientTextColor];
  uint64_t v8 = [v7 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v8];

  CFArrayRef v9 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v9];

  v10 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.431372549 blue:0.298039216 alpha:1.0];
  [v2 setHighContrastTextColor:v10];

  v11 = [v2 nonGradientTextColor];
  v12 = [v2 highContrastTextColor];
  id v13 = v11;
  id v14 = v12;
  id v15 = objc_alloc(MEMORY[0x263F825C8]);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __ARUIColorForCurrentContrastMode_block_invoke;
  uint64_t v23 = &unk_264498F50;
  id v24 = v14;
  id v25 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = (void *)[v15 initWithDynamicProvider:&v20];

  objc_msgSend(v2, "setTextDisplayColor:", v18, v20, v21, v22, v23);

  return v2;
}

+ (id)clockColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setGradientDarkColor:v4];

  id v5 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setNonGradientTextColor:v5];

  id v6 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setAdjustmentButtonBackgroundColor:v6];

  id v7 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v7];

  return v2;
}

+ (id)diveColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.211764706 blue:0.28627451 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.129411765 blue:0.133333333 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  id v5 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.717647059 blue:1.0 alpha:1.0];
  [v2 setNonGradientTextColor:v5];

  id v6 = [v2 nonGradientTextColor];
  id v7 = [v6 colorWithAlphaComponent:0.300000012];
  [v2 setAdjustmentButtonBackgroundColor:v7];

  uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v8];

  return v2;
}

+ (id)grayColors
{
  return +[ARUIMetricColors pausedRingsColors];
}

+ (id)pausedRingsColors
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x263F825C8] colorWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:1.0];
  [v2 setGradientLightColor:v3];

  v4 = [MEMORY[0x263F825C8] colorWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:1.0];
  [v2 setGradientDarkColor:v4];

  id v5 = [MEMORY[0x263F825C8] colorWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:1.0];
  [v2 setNonGradientTextColor:v5];

  id v6 = [v2 nonGradientTextColor];
  id v7 = [v6 colorWithAlphaComponent:1.0];
  [v2 setAdjustmentButtonBackgroundColor:v7];

  uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
  [v2 setValueDisplayColor:v8];

  return v2;
}

- (UIColor)gradientContrastColor
{
  return self->_gradientContrastColor;
}

- (UIColor)adjustmentButtonBackgroundColor
{
  return self->_adjustmentButtonBackgroundColor;
}

- (UIColor)lightenedNonGradientColor
{
  return self->_lightenedNonGradientColor;
}

- (void)setLightenedNonGradientColor:(id)a3
{
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (UIColor)buttonDisabledTextColor
{
  return self->_buttonDisabledTextColor;
}

- (UIColor)valueDisplayColor
{
  return self->_valueDisplayColor;
}

- (UIColor)platterBackgroundColor
{
  return self->_platterBackgroundColor;
}

- (UIColor)platterInactiveBackgroundColor
{
  return self->_platterInactiveBackgroundColor;
}

- (NSString)workoutRingColorIdentifier
{
  return self->_workoutRingColorIdentifier;
}

- (UIColor)textDisplayColor
{
  return self->_textDisplayColor;
}

@end