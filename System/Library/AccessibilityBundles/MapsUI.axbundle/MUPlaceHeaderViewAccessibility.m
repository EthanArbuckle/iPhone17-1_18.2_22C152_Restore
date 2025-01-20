@interface MUPlaceHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPlaceHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_secondaryTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_verifiedLabel" withType:"UILabel"];
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_containmentLabel" withType:"MULinkView"];
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_heroImageView" withType:"MUImageView"];
  [v3 validateClass:@"MUPlaceHeaderView" hasInstanceVariable:@"_transitInfoLabelView" withType:"MKTransitInfoLabelView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(MUPlaceHeaderViewAccessibility *)&v3 accessibilityTraits];
}

- (id)automationElements
{
  objc_super v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_secondaryTitleLabel"];
  v6 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_verifiedLabel"];
  v7 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_containmentLabel"];
  v8 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_heroImageView"];
  v9 = [(MUPlaceHeaderViewAccessibility *)self safeValueForKey:@"_transitInfoLabelView"];
  v10 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 6, v4, v5, v6, v7, v8, v9);

  return v10;
}

@end