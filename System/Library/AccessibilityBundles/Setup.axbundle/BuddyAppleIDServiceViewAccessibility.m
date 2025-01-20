@interface BuddyAppleIDServiceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BuddyAppleIDServiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyAppleIDServiceView";
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
  v2 = [(BuddyAppleIDServiceViewAccessibility *)self safeUIViewForKey:@"label"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end