@interface VCPGeometryUtils
+ (CGPoint)pointFromNormalizedPoint:(CGPoint)a3 inBounds:(CGRect)a4;
+ (CGRect)normalizedRectForRect:(CGRect)a3 inBounds:(CGRect)a4;
+ (CGRect)normalizedRectForRect:(CGRect)a3 inBoundsOfSize:(CGSize)a4;
+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBounds:(CGRect)a4;
+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBoundsOfSize:(CGSize)a4;
@end

@implementation VCPGeometryUtils

+ (CGRect)normalizedRectForRect:(CGRect)a3 inBoundsOfSize:(CGSize)a4
{
  objc_msgSend(a1, "normalizedRectForRect:inBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)normalizedRectForRect:(CGRect)a3 inBounds:(CGRect)a4
{
  if (a4.size.width <= 0.0) {
    goto LABEL_5;
  }
  double height = a4.size.height;
  if (a4.size.height <= 0.0) {
    goto LABEL_5;
  }
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v18.origin.double x = v11;
  v18.origin.double y = v10;
  v18.size.double width = v9;
  v18.size.double height = v8;
  if (CGRectContainsRect(a4, v18))
  {
    double v12 = v9 / width;
    double v13 = v8 / height;
    double v14 = (v11 - x) / width;
    double v15 = (v10 - y) / height;
  }
  else
  {
LABEL_5:
    double v14 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBoundsOfSize:(CGSize)a4
{
  objc_msgSend(a1, "rectFromMappingNormalizedRect:toBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, a4.width, a4.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (CGRectIsNull(a4)
    || (v16.origin.x = x, v16.origin.y = y, v16.size.width = width, v16.size.double height = height, CGRectIsInfinite(v16))
    || width <= 0.0
    || height <= 0.0)
  {
    double v13 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    double v12 = v9 * width;
    double v13 = x + v11 * width;
    double v14 = v8 * height;
    double v15 = y + v10 * height;
  }
  result.size.double height = v14;
  result.size.double width = v12;
  result.origin.double y = v15;
  result.origin.double x = v13;
  return result;
}

+ (CGPoint)pointFromNormalizedPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

@end