@interface CADisplay
- (BOOL)css_isCurrentlyLandscape;
- (BOOL)css_isLandscapeOrientation:(unint64_t)a3;
- (CGSize)css_sizeInCurrentOrientation;
- (int64_t)css_degreesFromRotationString:(id)a3;
- (unint64_t)css_interfaceOrientation;
- (unint64_t)css_interfaceOrientationForRotation:(double)a3;
@end

@implementation CADisplay

- (unint64_t)css_interfaceOrientation
{
  v3 = [(CADisplay *)self nativeOrientation];
  int64_t v4 = [(CADisplay *)self css_degreesFromRotationString:v3];

  v5 = [(CADisplay *)self currentOrientation];
  int64_t v6 = [(CADisplay *)self css_degreesFromRotationString:v5];

  return [(CADisplay *)self css_interfaceOrientationForRotation:(double)((v6 + v4) % 360)];
}

- (CGSize)css_sizeInCurrentOrientation
{
  [(CADisplay *)self bounds];
  double Width = CGRectGetWidth(v11);
  [(CADisplay *)self bounds];
  double Height = CGRectGetHeight(v12);
  double v5 = fmin(Width, Height);
  double v6 = fmax(Width, Height);
  unsigned int v7 = [(CADisplay *)self css_isCurrentlyLandscape];
  if (v7) {
    double v8 = v6;
  }
  else {
    double v8 = v5;
  }
  if (v7) {
    double v9 = v5;
  }
  else {
    double v9 = v6;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)css_isCurrentlyLandscape
{
  unint64_t v3 = [(CADisplay *)self css_interfaceOrientation];

  return [(CADisplay *)self css_isLandscapeOrientation:v3];
}

- (int64_t)css_degreesFromRotationString:(id)a3
{
  unint64_t v3 = objc_msgSend(a3, "crk_stringByRemovingPrefix:", @"rot");
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (unint64_t)css_interfaceOrientationForRotation:(double)a3
{
  if (a3 == 0.0) {
    return 1;
  }
  if (a3 == 90.0) {
    return 3;
  }
  if (a3 == 180.0) {
    return 2;
  }
  return 4 * (a3 == 270.0);
}

- (BOOL)css_isLandscapeOrientation:(unint64_t)a3
{
  return a3 - 3 < 2;
}

@end