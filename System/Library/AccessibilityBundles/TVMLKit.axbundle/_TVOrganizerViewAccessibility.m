@interface _TVOrganizerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsInTVWhatsNewVC;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _TVOrganizerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVOrganizerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVOrganizerView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"_TVOrganizerView" hasProperty:@"components" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)_TVOrganizerViewAccessibility;
  [(_TVOrganizerViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v2 = [(_TVOrganizerViewAccessibility *)self _accessibleSubviews];
  id v3 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_9];

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = [(_TVOrganizerViewAccessibility *)self isAccessibilityUserDefinedElement];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [(_TVOrganizerViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:1 focusableItems:0 exclusions:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVOrganizerViewAccessibility;
    v5 = [(_TVOrganizerViewAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (BOOL)_axIsInTVWhatsNewVC
{
  objc_super v2 = [(_TVOrganizerViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_286_0 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVOrganizerViewAccessibility;
  [(_TVOrganizerViewAccessibility *)&v3 layoutSubviews];
  [(_TVOrganizerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end