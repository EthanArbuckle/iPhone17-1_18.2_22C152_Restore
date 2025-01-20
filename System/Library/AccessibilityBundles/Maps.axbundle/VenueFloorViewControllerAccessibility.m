@interface VenueFloorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation VenueFloorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VenueFloorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorViewController", @"closeButton", "@", 0);
  [v3 validateClass:@"VenueFloorViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VenueFloorViewController", @"floorCollectionView", "@", 0);
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)VenueFloorViewControllerAccessibility;
  [(VenueFloorViewControllerAccessibility *)&v3 loadView];
  [(VenueFloorViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)VenueFloorViewControllerAccessibility;
  [(VenueFloorViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(VenueFloorViewControllerAccessibility *)self safeValueForKey:@"closeButton"];
  [v3 setIsAccessibilityElement:1];
  v4 = AXMapsLocString(@"CLOSE_BUTTON");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v5 = [(VenueFloorViewControllerAccessibility *)self safeValueForKey:@"floorCollectionView"];
  [v5 setAccessibilityIdentifier:@"Level Switcher"];
}

@end