@interface PRXCardContentWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PRXCardContentWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXCardContentWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PRXCardContentWrapperViewAccessibility;
  [(PRXCardContentWrapperViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CF18];
  v4 = [(PRXCardContentWrapperViewAccessibility *)self safeUIViewForKey:@"scrollView"];
  [v4 setAccessibilityContainerType:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentWrapperViewAccessibility;
  [(PRXCardContentWrapperViewAccessibility *)&v3 layoutSubviews];
  [(PRXCardContentWrapperViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end