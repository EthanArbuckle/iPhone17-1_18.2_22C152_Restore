@interface ButtonComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation ButtonComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreDynamicUIPlugin.ButtonComponent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ButtonComponentAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ButtonComponentAccessibility *)&v3 accessibilityTraits];
}

@end