@interface UIView(FMRoundedRect)
- (CGPath)newPathForRoundedRect:()FMRoundedRect radius:;
- (id)roundedRectBackgroundColor;
- (id)roundedRectBorderColor;
- (id)roundedRectBorderWidth;
- (void)setRoundedRectBackgroundColor:()FMRoundedRect;
- (void)setRoundedRectBorderColor:()FMRoundedRect;
- (void)setRoundedRectBorderWidth:()FMRoundedRect;
@end

@implementation UIView(FMRoundedRect)

- (void)setRoundedRectBackgroundColor:()FMRoundedRect
{
}

- (id)roundedRectBackgroundColor
{
  return objc_getAssociatedObject(a1, @"FMRoundedRectBackgroundColorKey");
}

- (void)setRoundedRectBorderColor:()FMRoundedRect
{
}

- (id)roundedRectBorderColor
{
  return objc_getAssociatedObject(a1, @"FMRoundedRectBorderColorKey");
}

- (void)setRoundedRectBorderWidth:()FMRoundedRect
{
}

- (id)roundedRectBorderWidth
{
  return objc_getAssociatedObject(a1, @"FMRoundedRectBorderWidthKey");
}

- (CGPath)newPathForRoundedRect:()FMRoundedRect radius:
{
  Mutable = CGPathCreateMutable();
  v18.origin.CGFloat x = a1;
  v18.origin.CGFloat y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  CGRect v19 = CGRectInset(v18, a5, a5);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat v12 = v19.origin.x + v19.size.width;
  CGFloat v13 = a1 + a3;
  CGFloat v14 = v19.origin.y + v19.size.height;
  CGFloat v15 = a2 + a4;
  CGPathMoveToPoint(Mutable, 0, v19.origin.x, a2);
  CGPathAddLineToPoint(Mutable, 0, v12, a2);
  CGPathAddArcToPoint(Mutable, 0, v13, a2, v13, y, a5);
  CGPathAddLineToPoint(Mutable, 0, v13, v14);
  CGPathAddArcToPoint(Mutable, 0, v13, v15, v12, v15, a5);
  CGPathAddLineToPoint(Mutable, 0, x, v15);
  CGPathAddArcToPoint(Mutable, 0, a1, v15, a1, v14, a5);
  CGPathAddLineToPoint(Mutable, 0, a1, y);
  CGPathAddArcToPoint(Mutable, 0, a1, a2, x, a2, a5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end