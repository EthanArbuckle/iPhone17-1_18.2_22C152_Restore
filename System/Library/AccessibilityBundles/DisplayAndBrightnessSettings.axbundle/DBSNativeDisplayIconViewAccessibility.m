@interface DBSNativeDisplayIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation DBSNativeDisplayIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSNativeDisplayIconView";
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

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"arrangement.hint");
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)DBSNativeDisplayIconViewAccessibility;
  unint64_t v3 = [(DBSNativeDisplayIconViewAccessibility *)&v8 accessibilityTraits];
  v4 = [(DBSNativeDisplayIconViewAccessibility *)self safeValueForKey:@"nameField"];
  int v5 = [v4 _accessibilityViewIsVisible];

  v6 = (void *)MEMORY[0x263F1CF38];
  if (!v5) {
    v6 = (void *)MEMORY[0x263F1CEE8];
  }
  return *v6 | v3;
}

@end