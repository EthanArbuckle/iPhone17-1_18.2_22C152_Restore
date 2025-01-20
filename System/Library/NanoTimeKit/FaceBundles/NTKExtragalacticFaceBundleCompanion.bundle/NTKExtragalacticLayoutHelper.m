@interface NTKExtragalacticLayoutHelper
+ (CGPoint)digitCenterPositionForCorner:(unint64_t)a3 unifiedGlyphSize:(CGSize)a4 cornerFrame:(CGRect)a5;
+ (CGRect)frameForCorner:(unint64_t)a3 screenBounds:(CGRect)a4;
+ (id)allCorners;
+ (unint64_t)colForCorner:(unint64_t)a3;
+ (unint64_t)rowForCorner:(unint64_t)a3;
@end

@implementation NTKExtragalacticLayoutHelper

+ (id)allCorners
{
  return &unk_26FB0C260;
}

+ (CGRect)frameForCorner:(unint64_t)a3 screenBounds:(CGRect)a4
{
  CGFloat v5 = a4.size.width * 0.5;
  CGFloat v6 = a4.size.height * 0.5;
  double v7 = (double)+[NTKExtragalacticLayoutHelper colForCorner:](NTKExtragalacticLayoutHelper, "colForCorner:");
  unint64_t v8 = +[NTKExtragalacticLayoutHelper rowForCorner:a3];
  double v9 = v5 * v7;
  double v10 = v6 * (double)v8;
  double v11 = v5;
  double v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (CGPoint)digitCenterPositionForCorner:(unint64_t)a3 unifiedGlyphSize:(CGSize)a4 cornerFrame:(CGRect)a5
{
  double v5 = a5.origin.x + a5.size.width - a4.width;
  double v6 = a5.size.height - a4.height;
  if (a3) {
    double y = a5.origin.y;
  }
  else {
    double y = v6;
  }
  if (a3) {
    double x = a5.origin.x;
  }
  else {
    double x = v5;
  }
  if (a3 != 1)
  {
    double v6 = y;
    a5.origin.double x = x;
  }
  if (a3 == 2) {
    double v6 = a5.origin.y;
  }
  else {
    double v5 = a5.origin.x;
  }
  double v9 = a5.size.width * 0.5 + v5;
  double v10 = a5.size.height * 0.5 + v6;
  result.double y = v10;
  result.double x = v9;
  return result;
}

+ (unint64_t)rowForCorner:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (unint64_t)colForCorner:(unint64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

@end