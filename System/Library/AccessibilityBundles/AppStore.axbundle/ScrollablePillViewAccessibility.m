@interface ScrollablePillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilitySortPriority;
- (unint64_t)accessibilityTraits;
@end

@implementation ScrollablePillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.ScrollablePillView";
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

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ScrollablePillViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ScrollablePillViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(ScrollablePillViewAccessibility *)self safeSwiftValueForKey:@"linkLabel"];
  objc_super v3 = __UIAXStringForVariables();

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end