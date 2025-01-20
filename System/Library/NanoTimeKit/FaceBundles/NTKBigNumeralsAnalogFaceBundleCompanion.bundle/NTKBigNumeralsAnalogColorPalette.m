@interface NTKBigNumeralsAnalogColorPalette
+ (double)timeColorOpacityForEditOption:(id)a3;
+ (double)timeColorOpacityForFraction:(double)a3 fromEditOption:(id)a4 toEditOption:(id)a5;
+ (id)multicolorAxialGradientLayerForColor:(unint64_t)a3 device:(id)a4;
- (id)_secondHand;
@end

@implementation NTKBigNumeralsAnalogColorPalette

+ (double)timeColorOpacityForEditOption:(id)a3
{
  unsigned int v3 = [a3 isRainbowColor];
  double result = 1.0;
  if (v3) {
    return 0.0;
  }
  return result;
}

+ (double)timeColorOpacityForFraction:(double)a3 fromEditOption:(id)a4 toEditOption:(id)a5
{
  id v7 = a5;
  if (([a4 isRainbowColor] & 1) == 0)
  {
    if ([v7 isRainbowColor]) {
      a3 = 1.0 - a3;
    }
    else {
      a3 = 1.0;
    }
  }

  return a3;
}

+ (id)multicolorAxialGradientLayerForColor:(unint64_t)a3 device:(id)a4
{
  if (a3 == 3000)
  {
    v6 = +[NTKPrideColorUtils axialColorGradientLayer:forDevice:](NTKPrideColorUtils, "axialColorGradientLayer:forDevice:", 0, a4, v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_secondHand
{
  return +[UIColor systemOrangeColor];
}

@end