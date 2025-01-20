@interface EKUIAvailabilityFreeSpanViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation EKUIAvailabilityFreeSpanViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIAvailabilityFreeSpanView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(EKUIAvailabilityFreeSpanViewAccessibility *)self safeValueForKey:@"startDate"];
  v3 = AXDateStringForFormat();

  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"free.span.select.hint");
}

- (CGPoint)accessibilityActivationPoint
{
  [(EKUIAvailabilityFreeSpanViewAccessibility *)self accessibilityFrame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MinX = CGRectGetMinX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v11);
  double v8 = MinX;
  result.CGFloat y = MinY;
  result.CGFloat x = v8;
  return result;
}

@end