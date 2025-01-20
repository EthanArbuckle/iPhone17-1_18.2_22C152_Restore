@interface AKSizing
+ (CGSize)size:(CGSize)a3 scaledForHeight:(double)a4;
+ (CGSize)size:(CGSize)a3 scaledForWidth:(double)a4;
@end

@implementation AKSizing

+ (CGSize)size:(CGSize)a3 scaledForWidth:(double)a4
{
  double v4 = a3.height - (a3.width - a4) * (a3.height / a3.width);
  result.height = v4;
  result.width = a4;
  return result;
}

+ (CGSize)size:(CGSize)a3 scaledForHeight:(double)a4
{
  double v4 = a3.width - (a3.height - a4) * (a3.width / a3.height);
  result.height = a4;
  result.width = v4;
  return result;
}

@end