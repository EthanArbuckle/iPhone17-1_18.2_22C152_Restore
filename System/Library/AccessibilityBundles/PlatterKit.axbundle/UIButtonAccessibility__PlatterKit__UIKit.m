@interface UIButtonAccessibility__PlatterKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation UIButtonAccessibility__PlatterKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  v28.receiver = self;
  v28.super_class = (Class)UIButtonAccessibility__PlatterKit__UIKit;
  [(UIButtonAccessibility__PlatterKit__UIKit *)&v28 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = self;
  v12 = [(UIButtonAccessibility__PlatterKit__UIKit *)v11 accessibilityIdentification];
  int v13 = [v12 isEqualToString:@"HeaderAppIcon"];

  if (v13)
  {
    v14 = [(UIButtonAccessibility__PlatterKit__UIKit *)v11 superview];
    v15 = v14;
    if (v14)
    {
      [(UIView *)v14 bounds];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      [(UIButtonAccessibility__PlatterKit__UIKit *)v11 frame];
      v33.origin.CGFloat x = v17;
      v33.origin.CGFloat y = v19;
      v33.size.CGFloat width = v21;
      v33.size.CGFloat height = v23;
      CGRect v30 = CGRectIntersection(v29, v33);
      CGRect v31 = UIAccessibilityConvertFrameToScreenCoordinates(v30, v15);
      CGFloat x = v31.origin.x;
      CGFloat y = v31.origin.y;
      CGFloat width = v31.size.width;
      CGFloat height = v31.size.height;
    }
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

@end