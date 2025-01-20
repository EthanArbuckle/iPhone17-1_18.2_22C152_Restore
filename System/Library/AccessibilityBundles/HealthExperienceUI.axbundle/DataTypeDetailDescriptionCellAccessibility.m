@interface DataTypeDetailDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation DataTypeDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.DataTypeDetailDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)DataTypeDetailDescriptionCellAccessibility;
  [(DataTypeDetailDescriptionCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(DataTypeDetailDescriptionCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_5];
  [v3 setIsAccessibilityElement:1];
}

BOOL __88__DataTypeDetailDescriptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityTraits];
  return (*MEMORY[0x263F1CF10] & v2) != 0;
}

@end