@interface _TVGridViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_visibleBounds;
@end

@implementation _TVGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVGridView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVGridView" isKindOfClass:@"UIScrollView"];
  [v3 validateClass:@"_TVGridView" isKindOfClass:@"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"_visibleBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (CGRect)_visibleBounds
{
  v27.receiver = self;
  v27.super_class = (Class)_TVGridViewAccessibility;
  [(_TVGridViewAccessibility *)&v27 _visibleBounds];
  CGFloat x = v3;
  CGFloat y = v5;
  double width = v7;
  double height = v9;
  if (UIAccessibilityIsVoiceOverRunning()
    && [(_TVGridViewAccessibility *)self isAccessibilityOpaqueElementProvider])
  {
    objc_opt_class();
    v11 = __UIAccessibilityCastAsClass();
    v12 = v11;
    if (v11)
    {
      [v11 contentSize];
      if (v13 > 0.0)
      {
        double v15 = v14;
        if (v14 > 0.0)
        {
          double v16 = v13;
          [v12 contentInset];
          double v26 = v17;
          double v19 = v18;
          double v21 = v20;
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.double width = width;
          v28.size.double height = height;
          CGRect v32 = CGRectInset(v28, -width, -height);
          v29.origin.CGFloat x = -v19;
          v29.origin.CGFloat y = -v26;
          v29.size.double width = v16 - v21;
          v29.size.double height = v15 - v19;
          CGRect v30 = CGRectIntersection(v29, v32);
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          double width = v30.size.width;
          double height = v30.size.height;
        }
      }
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

@end