@interface UIColor(MKExtras)
+ (id)_maps_colorFromHexString:()MKExtras;
+ (uint64_t)_getColorComponent:()MKExtras fromSubString:;
+ (uint64_t)_maps_getRed:()MKExtras green:blue:fromHue:saturation:value:;
- (id)_maps_hexString;
@end

@implementation UIColor(MKExtras)

+ (id)_maps_colorFromHexString:()MKExtras
{
  id v4 = a3;
  v5 = v4;
  if ([v4 hasPrefix:@"#"])
  {
    v5 = [v4 substringFromIndex:1];
  }
  if ([v5 length] == 6 || objc_msgSend(v5, "length") == 8)
  {
    double v19 = 0.0;
    double v20 = 0.0;
    double v18 = 0.0;
    v6 = objc_msgSend(v5, "substringWithRange:", 0, 2, 0);
    int v7 = [a1 _getColorComponent:&v20 fromSubString:v6];

    v8 = 0;
    if (!v7) {
      goto LABEL_14;
    }
    v9 = objc_msgSend(v5, "substringWithRange:", 2, 2);
    int v10 = [a1 _getColorComponent:&v19 fromSubString:v9];

    if (v10)
    {
      v11 = objc_msgSend(v5, "substringWithRange:", 4, 2);
      int v12 = [a1 _getColorComponent:&v18 fromSubString:v11];

      if (v12)
      {
        if ([v5 length] != 8)
        {
          uint64_t v17 = 0x3FF0000000000000;
          double v13 = 1.0;
LABEL_12:
          v8 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", v20, v19, v18, v13, v17);
          goto LABEL_14;
        }
        v14 = objc_msgSend(v5, "substringWithRange:", 6, 2);
        int v15 = [a1 _getColorComponent:&v17 fromSubString:v14];

        if (v15)
        {
          double v13 = *(double *)&v17;
          goto LABEL_12;
        }
      }
    }
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (uint64_t)_getColorComponent:()MKExtras fromSubString:
{
  unsigned int v8 = 0;
  v5 = [MEMORY[0x1E4F28FE8] scannerWithString:a4];
  uint64_t v6 = [v5 scanHexInt:&v8];

  if (a3 && v6) {
    *a3 = (float)((float)v8 / 255.0);
  }
  return v6;
}

+ (uint64_t)_maps_getRed:()MKExtras green:blue:fromHue:saturation:value:
{
  double v12 = a2 * a3;
  double v13 = a1 * 360.0 / 60.0;
  float v14 = v13;
  float v15 = fmodf(v14, 2.0) + -1.0;
  if (v15 < 0.0) {
    float v15 = -v15;
  }
  double v16 = v12 * (1.0 - v15);
  if (v13 < 1.0)
  {
    double v17 = v12;
    double v18 = v16;
LABEL_7:
    double v16 = 0.0;
    goto LABEL_8;
  }
  if (v13 < 2.0)
  {
    double v17 = v16;
    double v18 = v12;
    goto LABEL_7;
  }
  double v17 = 0.0;
  if (v13 < 3.0)
  {
    double v18 = v12;
    goto LABEL_8;
  }
  if (v13 < 4.0)
  {
    double v18 = v16;
LABEL_21:
    double v16 = v12;
    goto LABEL_8;
  }
  double v18 = 0.0;
  if (v13 < 5.0)
  {
    double v17 = v16;
    goto LABEL_21;
  }
  double v17 = v12;
  if (v13 >= 6.0) {
    return 0;
  }
LABEL_8:
  double v19 = a3 - v12;
  if (a6) {
    *a6 = v19 + v17;
  }
  if (a7) {
    *a7 = v19 + v18;
  }
  if (a8) {
    *a8 = v19 + v16;
  }
  return 1;
}

- (id)_maps_hexString
{
  double v19 = 0.0;
  double v20 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  if ([a1 getRed:&v20 green:&v19 blue:&v18 alpha:&v17]) {
    goto LABEL_6;
  }
  double v16 = 0.0;
  if ([a1 getWhite:&v16 alpha:&v17])
  {
    double v18 = v16;
    double v19 = v16;
    double v20 = v16;
LABEL_6:
    float v5 = v20;
    uint64_t v6 = vcvtas_u32_f32(v5 * 255.0);
    float v7 = v19;
    LODWORD(v2) = vcvtas_u32_f32(v7 * 255.0);
    float v8 = v18;
    LODWORD(v3) = vcvtas_u32_f32(v8 * 255.0);
    float v9 = v17;
    LODWORD(v4) = vcvtas_u32_f32(v9 * 255.0);
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"#%.2x%.2x%.2x%.2x", v6, v2, v3, v4);
    v11 = [v10 uppercaseString];

    goto LABEL_7;
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v13 = 0.0;
  if ([a1 getHue:&v15 saturation:&v14 brightness:&v13 alpha:&v17]
    && (objc_msgSend(MEMORY[0x1E4F428B8], "_maps_getRed:green:blue:fromHue:saturation:value:", &v20, &v19, &v18, v15, v14, v13) & 1) != 0)
  {
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

@end