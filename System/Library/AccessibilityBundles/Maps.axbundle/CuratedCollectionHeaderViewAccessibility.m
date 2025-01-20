@interface CuratedCollectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotatePublisherLogoImageView;
- (void)_updateHeaderContent;
@end

@implementation CuratedCollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CuratedCollectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CuratedCollectionHeaderView" hasInstanceVariable:@"_titleSingleLineLabel" withType:"UILabel"];
  [v3 validateClass:@"CuratedCollectionHeaderView" hasInstanceVariable:@"_titleMultiLineLabel" withType:"UILabel"];
  [v3 validateClass:@"CuratedCollectionHeaderView" hasInstanceVariable:@"_publisherLogoImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CuratedCollectionHeaderView", @"curatedCollection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CuratedCollectionHeaderView", @"_updateHeaderContent", "v", 0);
}

- (void)_axAnnotatePublisherLogoImageView
{
  id v5 = [(CuratedCollectionHeaderViewAccessibility *)self safeValueForKey:@"_publisherLogoImageView"];
  id v3 = [(CuratedCollectionHeaderViewAccessibility *)self safeValueForKey:@"curatedCollection"];
  v4 = AXPublisherDescriptionForCollection(v3);

  objc_msgSend(v5, "setIsAccessibilityElement:", objc_msgSend(v4, "length") != 0);
  [v5 setAccessibilityLabel:v4];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionHeaderViewAccessibility;
  [(CuratedCollectionHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48];
  v4 = [(CuratedCollectionHeaderViewAccessibility *)self safeValueForKey:@"_titleSingleLineLabel"];
  [v4 setAccessibilityTraits:v3];

  id v5 = [(CuratedCollectionHeaderViewAccessibility *)self safeValueForKey:@"_titleMultiLineLabel"];
  [v5 setAccessibilityTraits:v3];

  [(CuratedCollectionHeaderViewAccessibility *)self _axAnnotatePublisherLogoImageView];
}

- (void)_updateHeaderContent
{
  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionHeaderViewAccessibility;
  [(CuratedCollectionHeaderViewAccessibility *)&v3 _updateHeaderContent];
  [(CuratedCollectionHeaderViewAccessibility *)self _axAnnotatePublisherLogoImageView];
}

@end