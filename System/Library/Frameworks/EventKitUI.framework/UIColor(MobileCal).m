@interface UIColor(MobileCal)
+ (uint64_t)tableViewBackgroundColorOpaque;
- (BOOL)isGreenOrYellow;
- (double)blueComponent;
- (double)brightnessComponent;
- (double)differenceFromColor:()MobileCal;
- (double)greenComponent;
- (double)hueComponent;
- (double)redComponent;
- (double)saturationComponent;
- (id)ek_blendWithColor:()MobileCal;
- (id)overlayWithColor:()MobileCal;
- (uint64_t)soverWithColor:()MobileCal;
@end

@implementation UIColor(MobileCal)

+ (uint64_t)tableViewBackgroundColorOpaque
{
  return [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (double)hueComponent
{
  if (![a1 cgColor]) {
    return 0.0;
  }
  double v17 = 0.0;
  double v18 = 0.0;
  uint64_t v15 = 0;
  double v16 = 0.0;
  [a1 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
  if (v18 < v17 || v18 < v16)
  {
    if (v17 < v18 || v17 < v16)
    {
      if (v17 >= v18) {
        double v4 = v18;
      }
      else {
        double v4 = v17;
      }
      double v5 = v16;
    }
    else
    {
      if (v18 >= v16) {
        double v4 = v16;
      }
      else {
        double v4 = v18;
      }
      double v5 = v17;
    }
  }
  else
  {
    if (v17 >= v16) {
      double v4 = v16;
    }
    else {
      double v4 = v17;
    }
    double v5 = v18;
  }
  double result = 0.0;
  if (v5 > 0.0 && v5 != v4)
  {
    double v8 = (v5 - v18) / (v5 - v4);
    double v9 = 5.0 - v8;
    double v10 = (v5 - v17) / (v5 - v4);
    if (v4 == v18) {
      double v9 = v10 + 3.0;
    }
    double v11 = (v5 - v16) / (v5 - v4);
    double v12 = 3.0 - v11;
    double v13 = v8 + 1.0;
    if (v4 == v16) {
      double v12 = v13;
    }
    if (v5 != v17) {
      double v12 = v9;
    }
    double v14 = v11 + 5.0;
    if (v4 != v17) {
      double v14 = 1.0 - v10;
    }
    if (v5 != v18) {
      double v14 = v12;
    }
    return v14 / 6.0;
  }
  return result;
}

- (double)saturationComponent
{
  double v12 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v9 = 0;
  [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  if (v12 >= v11) {
    double v1 = v12;
  }
  else {
    double v1 = v11;
  }
  if (v1 < v10) {
    double v1 = v10;
  }
  double v2 = v12 / v1;
  double v3 = v11 / v1;
  double v4 = v10 / v1;
  if (v2 <= v3) {
    double v5 = v2;
  }
  else {
    double v5 = v3;
  }
  if (v2 < v3) {
    double v2 = v3;
  }
  if (v5 <= v4) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v2 >= v4) {
    double v4 = v2;
  }
  double result = 0.0;
  if (v6 != v4)
  {
    double v8 = v4 - v6;
    if ((v6 + v4) * 0.5 >= 0.5) {
      return v8 / (2.0 - v4 - v6);
    }
    else {
      return v8 / (v6 + v4);
    }
  }
  return result;
}

- (double)brightnessComponent
{
  double v5 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  uint64_t v2 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  double result = v5;
  if (v5 < v4) {
    double result = v4;
  }
  if (result < v3) {
    return v3;
  }
  return result;
}

- (double)redComponent
{
  double v5 = 0.0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return v5;
}

- (double)greenComponent
{
  uint64_t v5 = 0;
  uint64_t v3 = 0;
  double v4 = 0.0;
  uint64_t v2 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return v4;
}

- (double)blueComponent
{
  uint64_t v5 = 0;
  double v3 = 0.0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return v3;
}

- (double)differenceFromColor:()MobileCal
{
  double v12 = 0.0;
  double v13 = 0.0;
  uint64_t v10 = 0;
  double v11 = 0.0;
  id v4 = a3;
  [a1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = 0;
  double v7 = 0.0;
  [v4 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];

  return vabdd_f64(v13, v9) + vabdd_f64(v12, v8) + vabdd_f64(v11, v7);
}

- (BOOL)isGreenOrYellow
{
  [a1 hueComponent];
  if (v1 >= 0.13 && v1 <= 0.18) {
    return 1;
  }
  if (v1 <= 0.35) {
    return v1 >= 0.25;
  }
  return 0;
}

- (uint64_t)soverWithColor:()MobileCal
{
  return CUIKBlendColorsSourceOver();
}

- (id)ek_blendWithColor:()MobileCal
{
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  id v4 = a3;
  [a1 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  [v4 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  double v5 = (1.0 - v8) * v12;
  if (v8 + v5 <= 0.0)
  {
    id v6 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", (v8 * v11 + v15 * v5) / (v8 + v5), (v8 * v10 + v14 * v5) / (v8 + v5), (v8 * v9 + v13 * v5) / (v8 + v5));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)overlayWithColor:()MobileCal
{
  double v16 = 0.0;
  double v17 = 0.0;
  uint64_t v14 = 0;
  double v15 = 0.0;
  id v4 = a3;
  [a1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  double v12 = 0.0;
  double v13 = 0.0;
  uint64_t v10 = 0;
  double v11 = 0.0;
  [v4 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];

  if (v17 >= 0.5) {
    double v5 = (1.0 - v17) * (1.0 - v13) / -0.498039215 + 1.0;
  }
  else {
    double v5 = v17 * v13 / 0.498039215;
  }
  double v17 = v5;
  if (v16 >= 0.5) {
    double v6 = (1.0 - v16) * (1.0 - v12) / -0.498039215 + 1.0;
  }
  else {
    double v6 = v16 * v12 / 0.498039215;
  }
  double v16 = v6;
  if (v15 >= 0.5) {
    double v7 = (1.0 - v15) * (1.0 - v11) / -0.498039215 + 1.0;
  }
  else {
    double v7 = v15 * v11 / 0.498039215;
  }
  double v15 = v7;
  double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");

  return v8;
}

@end