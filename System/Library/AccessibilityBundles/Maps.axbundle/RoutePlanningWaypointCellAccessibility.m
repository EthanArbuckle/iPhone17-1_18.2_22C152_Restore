@interface RoutePlanningWaypointCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilityTextElementText;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation RoutePlanningWaypointCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RoutePlanningWaypointCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RoutePlanningWaypointCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_reorderControlImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RoutePlanningWaypointCell", @"currentText", "@", 0);
  [v3 validateClass:@"RoutePlanningWaypointCell" hasInstanceVariable:@"_iconView" withType:"UIImageView"];
  [v3 validateClass:@"RoutePlanningWaypointCell" hasInstanceVariable:@"_titleTextField" withType:"RoutePlanningWaypointTextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityTextElementText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(RoutePlanningWaypointCellAccessibility *)self safeStringForKey:@"currentText"];
}

- (id)accessibilityHint
{
  return AXMapsLocString(@"route.cell.change.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(RoutePlanningWaypointCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_1];
  id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

uint64_t __80__RoutePlanningWaypointCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245653010](@"UITableViewCellReorderControl");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityTextElementText
{
  return (id)[(RoutePlanningWaypointCellAccessibility *)self safeStringForKey:@"currentText"];
}

- (id)automationElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(RoutePlanningWaypointCellAccessibility *)self safeValueForKey:@"_reorderControlImage"];
  v5 = [(RoutePlanningWaypointCellAccessibility *)self safeValueForKey:@"_iconView"];
  v6 = [(RoutePlanningWaypointCellAccessibility *)self safeValueForKey:@"_titleTextField"];
  v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);

  return v7;
}

@end