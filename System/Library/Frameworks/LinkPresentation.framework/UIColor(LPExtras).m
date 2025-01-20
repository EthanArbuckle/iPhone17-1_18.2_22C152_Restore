@interface UIColor(LPExtras)
+ (id)_lp_colorWithDynamicProvider:()LPExtras;
+ (id)_lp_colorWithDynamicProvider:()LPExtras name:;
+ (uint64_t)_lp_quinaryLabelColor;
+ (uint64_t)_lp_secondarySystemFillColor;
+ (uint64_t)_lp_systemFillColor;
- (id)_lp_CSSTextForcingUserInterfaceStyle:()LPExtras;
- (id)_lp_CSSTextHexFormatForcingUserInterfaceStyle:()LPExtras;
- (id)_lp_colorBlendedWithColor:()LPExtras;
- (id)_lp_colorBlendedWithColor:()LPExtras withFraction:;
- (id)_lp_colorForcingUserInterfaceStyle:()LPExtras;
- (uint64_t)_lp_CSSText;
@end

@implementation UIColor(LPExtras)

- (uint64_t)_lp_CSSText
{
  return objc_msgSend(a1, "_lp_CSSTextHexFormatForcingUserInterfaceStyle:", 0);
}

+ (id)_lp_colorWithDynamicProvider:()LPExtras name:
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:a3];
  if (objc_opt_respondsToSelector()) {
    [v6 _setDebugName:v5];
  }

  return v6;
}

+ (id)_lp_colorWithDynamicProvider:()LPExtras
{
  v3 = objc_msgSend(a1, "_lp_colorWithDynamicProvider:name:", a3, 0);

  return v3;
}

- (id)_lp_CSSTextForcingUserInterfaceStyle:()LPExtras
{
  double v16 = 0.0;
  double v17 = 0.0;
  uint64_t v14 = 0;
  double v15 = 0.0;
  v1 = objc_msgSend(a1, "_lp_colorForcingUserInterfaceStyle:");
  [v1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];

  float v2 = v17 * 255.0;
  uint64_t v3 = llroundf(v2);
  unint64_t v4 = v3 & ~(v3 >> 63);
  uint64_t v5 = 255;
  if (v4 >= 0xFF) {
    unint64_t v4 = 255;
  }
  float v6 = v16 * 255.0;
  uint64_t v7 = llroundf(v6);
  unint64_t v8 = v7 & ~(v7 >> 63);
  if (v8 >= 0xFF) {
    unint64_t v8 = 255;
  }
  float v9 = v15 * 255.0;
  uint64_t v10 = llroundf(v9);
  unint64_t v11 = v10 & ~(v10 >> 63);
  if (v11 < 0xFF) {
    uint64_t v5 = v11;
  }
  v12 = [NSString stringWithFormat:@"rgba(%d, %d, %d, %g)", v4, v8, v5, v14];

  return v12;
}

- (id)_lp_CSSTextHexFormatForcingUserInterfaceStyle:()LPExtras
{
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  v1 = objc_msgSend(a1, "_lp_colorForcingUserInterfaceStyle:");
  [v1 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];

  double v2 = -0.0;
  if (v15 != 1.0) {
    double v2 = 1.0 - v15;
  }
  float v3 = (v18 + v2) * 255.0;
  uint64_t v4 = llroundf(v3);
  unint64_t v5 = v4 & ~(v4 >> 63);
  uint64_t v6 = 255;
  if (v5 >= 0xFF) {
    unint64_t v5 = 255;
  }
  float v7 = (v17 + v2) * 255.0;
  uint64_t v8 = llroundf(v7);
  unint64_t v9 = v8 & ~(v8 >> 63);
  if (v9 >= 0xFF) {
    unint64_t v9 = 255;
  }
  float v10 = (v16 + v2) * 255.0;
  uint64_t v11 = llroundf(v10);
  unint64_t v12 = v11 & ~(v11 >> 63);
  if (v12 < 0xFF) {
    uint64_t v6 = v12;
  }
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", v5, v9, v6);

  return v13;
}

- (id)_lp_colorForcingUserInterfaceStyle:()LPExtras
{
  if (a3 == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  unint64_t v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v4];
  uint64_t v6 = [a1 resolvedColorWithTraitCollection:v5];

  return v6;
}

+ (uint64_t)_lp_quinaryLabelColor
{
  return [MEMORY[0x1E4FB1618] quaternaryLabelColor];
}

+ (uint64_t)_lp_systemFillColor
{
  return [MEMORY[0x1E4FB1618] systemFillColor];
}

+ (uint64_t)_lp_secondarySystemFillColor
{
  return [MEMORY[0x1E4FB1618] secondarySystemFillColor];
}

- (id)_lp_colorBlendedWithColor:()LPExtras
{
  v1 = objc_msgSend(a1, "_colorBlendedWithColor:");

  return v1;
}

- (id)_lp_colorBlendedWithColor:()LPExtras withFraction:
{
  id v6 = a4;
  float v7 = [a1 colorWithAlphaComponent:1.0 - a2];
  uint64_t v8 = objc_msgSend(v7, "_lp_colorBlendedWithColor:", v6);

  return v8;
}

@end