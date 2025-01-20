@interface AVTPaddlePathGenerator
+ (id)concentricCornerPathWithBaseRect:(CGRect)a3 radius:(double)a4 topToBottom:(BOOL)a5 rightToLeft:(BOOL)a6;
+ (id)paddlePathWithBaseRect:(CGRect)a3 contentRect:(CGRect)a4 radius:(double)a5 topToBottom:(BOOL)a6 rightToLeft:(BOOL)a7;
@end

@implementation AVTPaddlePathGenerator

+ (id)concentricCornerPathWithBaseRect:(CGRect)a3 radius:(double)a4 topToBottom:(BOOL)a5 rightToLeft:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  if (v7)
  {
    double v17 = MaxY;
    if (!v6)
    {
      double v19 = MaxY - a4;
      double v18 = MaxX + a4;
      double v23 = 3.14159265;
      double v20 = 1.57079633;
      double MinX = MaxX;
      double MinY = MaxY - a4;
      goto LABEL_9;
    }
    double v18 = MinX - a4;
    double v19 = MaxY - a4;
    double v20 = 0.0;
    double v23 = 1.57079633;
    double MinY = MaxY;
  }
  else
  {
    if (v6)
    {
      double v19 = MinY + a4;
      double v18 = MinX - a4;
      double v23 = 0.0;
      double v20 = 4.71238898;
      double v17 = MinY;
      double MinY = MinY + a4;
      double MaxX = MinX;
      goto LABEL_9;
    }
    double v18 = MaxX + a4;
    double v19 = MinY + a4;
    double v23 = 4.71238898;
    double v20 = 3.14159265;
    double MinX = MaxX;
    double v17 = MinY;
  }
  double MaxX = v18;
LABEL_9:
  v21 = [MEMORY[0x263F1C478] bezierPath];
  objc_msgSend(v21, "moveToPoint:", MaxX, MinY);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, v19, a4, v23, v20);
  objc_msgSend(v21, "addLineToPoint:", MinX, v17);
  [v21 closePath];
  return v21;
}

+ (id)paddlePathWithBaseRect:(CGRect)a3 contentRect:(CGRect)a4 radius:(double)a5 topToBottom:(BOOL)a6 rightToLeft:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double rect = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  if (a6)
  {
    double MinY = CGRectGetMinY(a4);
    uint64_t v16 = 3;
  }
  else
  {
    double MaxY = CGRectGetMaxY(a3);
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.CGFloat height = rect;
    double MinY = MaxY - CGRectGetMaxY(v28);
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.CGFloat height = rect;
    double v13 = CGRectGetMaxY(v29);
    uint64_t v16 = 12;
  }
  uint64_t v18 = 13;
  if (!v7) {
    uint64_t v18 = 14;
  }
  uint64_t v19 = 11;
  if (v7) {
    uint64_t v19 = 7;
  }
  if (v8) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v19;
  }
  v21 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v16, v14, v13, v12, MinY, a5, a5);
  [v21 closePath];
  v22 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v20, x, y, width, rect, a5, a5);
  [v22 closePath];
  double v23 = +[AVTPaddlePathGenerator concentricCornerPathWithBaseRect:radius:topToBottom:rightToLeft:](AVTPaddlePathGenerator, "concentricCornerPathWithBaseRect:radius:topToBottom:rightToLeft:", v8, v7, v14, v13, v12, MinY, a5);
  v24 = [MEMORY[0x263F1C478] bezierPath];
  [v24 appendPath:v21];
  [v24 appendPath:v22];
  [v24 appendPath:v23];

  return v24;
}

@end