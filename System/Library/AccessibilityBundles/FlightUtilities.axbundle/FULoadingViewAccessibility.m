@interface FULoadingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation FULoadingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FULoadingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  int v3 = [v2 _accessibilityViewIsVisible] ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

@end