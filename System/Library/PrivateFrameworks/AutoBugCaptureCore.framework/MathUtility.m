@interface MathUtility
+ (double)computeNewMeanFromValue:(double)a3 currentMean:(double)a4 currentCount:(unint64_t)a5;
+ (double)computeNewVarianceFromValue:(double)a3 currentMean:(double)a4 currentCount:(unint64_t)a5 currentVariance:(double)a6;
+ (unsigned)getMegabytesSignificantFiguresHistogramBinIndexForBytes:(unint64_t)a3;
@end

@implementation MathUtility

+ (double)computeNewMeanFromValue:(double)a3 currentMean:(double)a4 currentCount:(unint64_t)a5
{
  return (a3 - a4) / (double)(a5 + 1) + a4;
}

+ (double)computeNewVarianceFromValue:(double)a3 currentMean:(double)a4 currentCount:(unint64_t)a5 currentVariance:(double)a6
{
  if (!a5) {
    return 0.0;
  }
  +[MathUtility computeNewMeanFromValue:currentMean:currentCount:](MathUtility, "computeNewMeanFromValue:currentMean:currentCount:");
  return ((a3 - a4) * (a3 - v10) + a6 * (double)(a5 - 1)) / (double)a5;
}

+ (unsigned)getMegabytesSignificantFiguresHistogramBinIndexForBytes:(unint64_t)a3
{
  unint64_t v3 = a3 >> 20;
  if (a3 >= 0xA00000)
  {
    int v4 = 0;
    LODWORD(v6) = 10;
    do
    {
      unint64_t v6 = (10 * v6);
      v4 += 9;
    }
    while (v3 >= v6);
    unint64_t v5 = v6 / 0xAuLL;
  }
  else
  {
    int v4 = 0;
    unint64_t v5 = 1;
  }
  return v4 + v3 / v5;
}

@end