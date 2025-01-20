@interface LinkListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation LinkListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.LinkListCell";
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
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  v3 = [v2 contentConfiguration];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LinkListCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(LinkListCellAccessibility *)&v3 accessibilityTraits];
}

@end