@interface UIView
- (CGPoint)zw_boundsCenter;
- (CGPoint)zw_convertPointFromScreenCoordinates:(CGPoint)a3;
- (CGPoint)zw_convertPointToScreenCoordinates:(CGPoint)a3;
- (CGRect)zw_convertBoundsToScreenCoordinates;
- (CGRect)zw_convertRectFromScreenCoordinates:(CGRect)a3;
- (CGRect)zw_convertRectToScreenCoordinates:(CGRect)a3;
@end

@implementation UIView

- (CGPoint)zw_boundsCenter
{
  [(UIView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v7);
  [(UIView *)self bounds];
  double MidY = CGRectGetMidY(v8);
  double v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (CGRect)zw_convertRectToScreenCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v8 = [(UIView *)self window];
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "convertRect:fromView:", self, x, y, width, height);
    objc_msgSend(v9, "_convertRectToSceneReferenceSpace:");
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)zw_convertRectFromScreenCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v8 = [(UIView *)self window];
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
    objc_msgSend(v9, "convertRect:toView:", self);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)zw_convertPointToScreenCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIView *)self window];
  CGRect v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v7, "_convertPointToSceneReferenceSpace:");
    double x = v8;
    double y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)zw_convertPointFromScreenCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIView *)self window];
  CGRect v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_convertPointFromSceneReferenceSpace:", x, y);
    objc_msgSend(v7, "convertPoint:toView:", self);
    double x = v8;
    double y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGRect)zw_convertBoundsToScreenCoordinates
{
  [(UIView *)self bounds];

  -[UIView zw_convertRectToScreenCoordinates:](self, "zw_convertRectToScreenCoordinates:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

@end