@interface HUAudioWaveformUtilities
+ (double)disabledWaveformWidth:(double)a3 forProgress:(float)a4;
+ (double)floatToScreenScale:(double)a3;
+ (float)progressForTime:(double)a3 duration:(double)a4;
+ (id)waveformImageforPowerLevels:(const double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5;
@end

@implementation HUAudioWaveformUtilities

+ (id)waveformImageforPowerLevels:(const double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5
{
  id v8 = a5;
  v18.width = (double)a4 * 4.0;
  v18.height = 45.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v8 set];
  if (a4)
  {
    unint64_t v10 = 0;
    do
    {
      [a1 floatToScreenScale:a3[v10] * 45.0];
      if (v11 <= 1.0) {
        double v12 = 22.0;
      }
      else {
        double v12 = (45.0 - v11) * 0.5;
      }
      [a1 floatToScreenScale:v12];
      v14 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", (double)v10 * 4.0, v13, 2.0, 45.0 - v13 * 2.0, 5.0);
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v8 CGColor]);
      [v14 fill];

      ++v10;
    }
    while (a4 != v10);
  }
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

+ (float)progressForTime:(double)a3 duration:(double)a4
{
  float v4 = 0.0;
  if (a3 != 0.0)
  {
    float v4 = 1.0;
    if (a3 != a4)
    {
      if (a4 >= 0.05) {
        a3 = a3 + 0.05;
      }
      float v4 = a3 / a4;
    }
  }
  double v5 = v4;
  if (v4 > 1.0) {
    double v5 = 1.0;
  }
  return fmax(v5, 0.0);
}

+ (double)disabledWaveformWidth:(double)a3 forProgress:(float)a4
{
  long double v5 = a3 * 0.25 * (1.0 - a4);
  double v6 = (double)(unint64_t)v5;
  long double v7 = fmod(v5, 1.0);
  double v8 = v7 + v7 + v6 * 4.0 + 2.0;

  [a1 floatToScreenScale:v8];
  return result;
}

+ (double)floatToScreenScale:(double)a3
{
  float v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  double v6 = v5;

  return ceil(v6 * a3) / v6;
}

@end