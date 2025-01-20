@interface UIColor(MKAdditions)
+ (id)_mapkit_colorNamed:()MKAdditions compatibleWithTraitCollection:;
+ (id)_mapkit_userLocationAccuracyRingFillColor;
+ (id)_mapkit_userLocationAccuracyRingStrokeColor;
+ (id)_mapkit_userLocationAccuracyRingStrokeColorSatellite;
+ (uint64_t)_mapkit_colorNamed:()MKAdditions;
- (double)_mapkit_getRed:()MKAdditions green:blue:alpha:;
- (id)_mapkit_blendedColorWithFraction:()MKAdditions ofColor:;
- (uint64_t)_mapkit_isWhite;
@end

@implementation UIColor(MKAdditions)

- (uint64_t)_mapkit_isWhite
{
  uint64_t v8 = 0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if ([a1 getWhite:&v9 alpha:0])
  {
    double v2 = v9;
    if (v9 >= 1.0) {
      return 1;
    }
  }
  unsigned int v4 = objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, 0, v2);
  if (v7 <= 0.0) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v6 >= 1.0) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (id)_mapkit_colorNamed:()MKAdditions compatibleWithTraitCollection:
{
  double v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 _mapkitBundle];
  v10 = [a1 colorNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
}

+ (uint64_t)_mapkit_colorNamed:()MKAdditions
{
  return objc_msgSend(a1, "_mapkit_colorNamed:compatibleWithTraitCollection:", a3, 0);
}

- (id)_mapkit_blendedColorWithFraction:()MKAdditions ofColor:
{
  id v6 = a4;
  id v7 = v6;
  if (a2 >= 1.0)
  {
    id v9 = v6;
    goto LABEL_8;
  }
  if (a2 <= 0.0)
  {
    id v9 = a1;
    goto LABEL_8;
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  id v8 = 0;
  if (!objc_msgSend(v6, "_mapkit_getRed:green:blue:alpha:", &v18, &v17, &v16, &v15)) {
    goto LABEL_9;
  }
  if (objc_msgSend(a1, "_mapkit_getRed:green:blue:alpha:", &v14, &v13, &v12, &v11))
  {
    id v9 = [MEMORY[0x1E4F428B8] colorWithRed:(1.0 - a2) * v14 + v18 * a2 green:(1.0 - a2) * v13 + v17 * a2 blue:(1.0 - a2) * v12 + v16 * a2 alpha:(1.0 - a2) * v11 + v15 * a2];
LABEL_8:
    id v8 = v9;
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (double)_mapkit_getRed:()MKAdditions green:blue:alpha:
{
  if ((objc_msgSend(a1, "getRed:green:blue:alpha:") & 1) == 0)
  {
    double v12 = 0.0;
    if ([a1 getWhite:&v12 alpha:a6])
    {
      if (a3)
      {
        double result = v12;
        *a3 = v12;
      }
      if (a4)
      {
        double result = v12;
        *a4 = v12;
      }
      if (a5)
      {
        double result = v12;
        *a5 = v12;
      }
    }
  }
  return result;
}

+ (id)_mapkit_userLocationAccuracyRingStrokeColor
{
  v0 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
  if (!_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor)
  {
    uint64_t v1 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.341176471 blue:0.815686275 alpha:0.5];
    double v2 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
    _mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor = v1;

    v0 = (void *)_mapkit_userLocationAccuracyRingStrokeColor__userLocationAccuracyRingStrokeColor;
  }

  return v0;
}

+ (id)_mapkit_userLocationAccuracyRingStrokeColorSatellite
{
  if (_MergedGlobals_129 != -1) {
    dispatch_once(&_MergedGlobals_129, &__block_literal_global_6);
  }
  v0 = (void *)qword_1EB315C70;

  return v0;
}

+ (id)_mapkit_userLocationAccuracyRingFillColor
{
  v0 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
  if (!_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor)
  {
    uint64_t v1 = [MEMORY[0x1E4F428B8] colorWithRed:0.101960784 green:0.454901961 blue:0.988235294 alpha:0.100000001];
    double v2 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
    _mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor = v1;

    v0 = (void *)_mapkit_userLocationAccuracyRingFillColor__userLocationAccuracyRingFillColor;
  }

  return v0;
}

@end