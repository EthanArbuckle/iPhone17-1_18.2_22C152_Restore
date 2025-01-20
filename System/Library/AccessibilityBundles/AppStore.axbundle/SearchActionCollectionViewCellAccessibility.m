@interface SearchActionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchActionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.SearchActionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.SearchActionCollectionViewCell" hasSwiftField:@"actionContentView" withSwiftType:"SearchActionContentView"];
  [v3 validateClass:@"AppStore.SearchActionContentView" hasSwiftField:@"linkLabel" withSwiftType:"DynamicLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchActionCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchActionCollectionViewCellAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF48];
}

- (id)accessibilityLabel
{
  v2 = [(SearchActionCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"actionContentView"];
  objc_opt_class();
  objc_super v3 = [v2 safeSwiftValueForKey:@"linkLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

@end