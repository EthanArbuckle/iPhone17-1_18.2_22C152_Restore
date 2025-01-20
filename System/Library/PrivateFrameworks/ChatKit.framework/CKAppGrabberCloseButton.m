@interface CKAppGrabberCloseButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CKAppGrabberCloseButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CKAppGrabberCloseButton *)self bounds];
  double v7 = v6 + -16.0;
  double v9 = v8 + -16.0;
  double v11 = v10 + 32.0;
  double v13 = v12 + 32.0;
  CGFloat v14 = x;
  CGFloat v15 = y;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v14);
}

@end