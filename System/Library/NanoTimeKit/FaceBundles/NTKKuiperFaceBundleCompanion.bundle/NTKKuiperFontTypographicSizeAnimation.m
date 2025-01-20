@interface NTKKuiperFontTypographicSizeAnimation
- (CGSize)typographicSizeForFraction:(double)a3;
@end

@implementation NTKKuiperFontTypographicSizeAnimation

- (CGSize)typographicSizeForFraction:(double)a3
{
  if (qword_171F0 != -1) {
    dispatch_once(&qword_171F0, &stru_10678);
  }
  double v4 = NTKKuiperMaximumTypographicSize();
  double v5 = v4;
  double v7 = v6;
  float v8 = a3;
  *(float *)&double v4 = v8;
  [(id)qword_171E0 _solveForInput:v4];
  double v10 = v9;
  double v11 = v5 * v10;
  *(float *)&double v10 = v8;
  [(id)qword_171E8 _solveForInput:v10];
  double v13 = v7 * (1.0 - v12);
  double v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

@end