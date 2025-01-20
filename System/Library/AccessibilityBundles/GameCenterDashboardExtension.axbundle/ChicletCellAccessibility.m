@interface ChicletCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityPresentMetadata;
@end

@implementation ChicletCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterDashboardExtension.ChicletCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletCell", @"accessibilityMetadataContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterDashboardExtension.ChicletCell", @"accessibilityPresentMetadata", "v", 0);
  [v3 validateClass:@"GameCenterDashboardExtension.ChicletMetadata"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(ChicletCellAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = [(ChicletCellAccessibility *)self safeUIViewForKey:@"accessibilityMetadataContainer"];
  v5 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_0];
  v6 = [v3 accessibilityLabel];
  v9 = [v5 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

uint64_t __46__ChicletCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24564D820](@"GameCenterDashboardExtension.ChicletMetadata");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityPresentMetadata
{
  v2.receiver = self;
  v2.super_class = (Class)ChicletCellAccessibility;
  [(ChicletCellAccessibility *)&v2 accessibilityPresentMetadata];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ChicletCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ChicletCellAccessibility *)&v3 accessibilityTraits];
}

@end