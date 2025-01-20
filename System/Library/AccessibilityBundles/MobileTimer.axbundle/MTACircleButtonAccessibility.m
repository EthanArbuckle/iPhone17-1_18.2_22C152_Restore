@interface MTACircleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityPath;
@end

@implementation MTACircleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTACircleButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  [(MTACircleButtonAccessibility *)self accessibilityFrame];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v6 = CGRectGetWidth(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v15);
  if (v6 >= v7) {
    double v7 = v6;
  }
  double v8 = v7 * 0.5;
  v9 = (void *)MEMORY[0x263F1C478];
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v17);

  return (id)objc_msgSend(v9, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v8, 0.0, 6.28318531);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MTACircleButtonAccessibility *)self safeValueForKey:@"alpha"];
  [v2 floatValue];
  BOOL v4 = v3 == 1.0;

  return v4;
}

@end