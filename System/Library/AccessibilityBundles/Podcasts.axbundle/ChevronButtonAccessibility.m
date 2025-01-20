@interface ChevronButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ChevronButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ChevronButton";
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
  v3 = [(ChevronButtonAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  if (v3)
  {
    v4 = [(ChevronButtonAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
    v5 = [v4 accessibilityLabel];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ChevronButtonAccessibility;
    v5 = [(ChevronButtonAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ChevronButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ChevronButtonAccessibility *)&v3 accessibilityTraits];
}

@end