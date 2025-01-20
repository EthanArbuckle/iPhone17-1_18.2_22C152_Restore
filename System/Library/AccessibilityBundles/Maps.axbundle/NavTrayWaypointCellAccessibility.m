@interface NavTrayWaypointCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NavTrayWaypointCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavTrayWaypointCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NavTrayWaypointCell" hasInstanceVariable:@"_leadingImageView" withType:"UIImageView"];
  [v3 validateClass:@"NavTrayWaypointCell" hasInstanceVariable:@"_titleLabel" withType:"MapsFadingLabel"];
  [v3 validateClass:@"NavTrayWaypointCell" hasInstanceVariable:@"_subtitleLabel" withType:"MapsFadingLabel"];
  [v3 validateClass:@"NavTrayWaypointCell" hasInstanceVariable:@"_deleteView" withType:"UIView"];
  [v3 validateClass:@"NavTrayWaypointCell" hasInstanceVariable:@"_phoneCallView" withType:"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_leadingImageView"];
  v4 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v7 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_deleteView"];
  v4 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_phoneCallView"];
  v5 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v3);

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_phoneCallView"];
  char v11 = 0;
  objc_opt_class();
  v4 = [(NavTrayWaypointCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 text];
  v7 = NSString;
  v8 = AXMapsLocString(@"CALL_LOCATION");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

  [v3 setAccessibilityLabel:v9];
  v10.receiver = self;
  v10.super_class = (Class)NavTrayWaypointCellAccessibility;
  [(NavTrayWaypointCellAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
}

@end