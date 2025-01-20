@interface SwiftUIVerticalTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation SwiftUIVerticalTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.VerticalTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGPoint)accessibilityActivationPoint
{
  v9.receiver = self;
  v9.super_class = (Class)SwiftUIVerticalTextViewAccessibility;
  [(SwiftUIVerticalTextViewAccessibility *)&v9 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;
  if ([(SwiftUIVerticalTextViewAccessibility *)self safeIntegerForKey:@"marginTop"]) {
    double v7 = v6;
  }
  else {
    double v7 = v6 + 5.0;
  }
  double v8 = v4;
  result.y = v7;
  result.x = v8;
  return result;
}

@end