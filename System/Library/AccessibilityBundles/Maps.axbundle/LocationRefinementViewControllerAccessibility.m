@interface LocationRefinementViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateSnapToUserLocationButton;
- (void)_triggerCrossHairLocationDecode;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation LocationRefinementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LocationRefinementViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LocationRefinementViewController" hasInstanceVariable:@"_snapToUserLocationButton" withType:"UIButton"];
  [v3 validateClass:@"LocationRefinementViewController" hasInstanceVariable:@"_crosshairImageView" withType:"UIImageView"];
  [v3 validateClass:@"LocationRefinementViewController" hasInstanceVariable:@"_mapView" withType:"MKMapView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LocationRefinementViewController", @"mapView:regionDidChangeAnimated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LocationRefinementViewController", @"crosshairType", "Q", 0);
}

- (void)_axAnnotateSnapToUserLocationButton
{
  id v3 = [(LocationRefinementViewControllerAccessibility *)self safeValueForKey:@"_snapToUserLocationButton"];
  v2 = AXMapsLocString(@"SNAP_TO_USER_LOCATION_BUTTON");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)LocationRefinementViewControllerAccessibility;
  [(LocationRefinementViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  [(LocationRefinementViewControllerAccessibility *)self _axAnnotateSnapToUserLocationButton];
  unint64_t v3 = [(LocationRefinementViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"crosshairType"];
  if (v3 > 4)
  {
    v4 = 0;
  }
  else
  {
    v4 = AXMapsLocString(off_26512D7F0[v3]);
  }
  v5 = [(LocationRefinementViewControllerAccessibility *)self safeValueForKey:@"_crosshairImageView"];
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityLabel:v4];
  [(LocationRefinementViewControllerAccessibility *)self _triggerCrossHairLocationDecode];
}

- (void)_triggerCrossHairLocationDecode
{
  unint64_t v3 = [(LocationRefinementViewControllerAccessibility *)self safeValueForKey:@"_crosshairImageView"];
  char v16 = 0;
  v4 = [(LocationRefinementViewControllerAccessibility *)self safeValueForKey:@"_mapView"];
  v5 = __UIAccessibilitySafeClass();

  id v6 = objc_alloc(MEMORY[0x263F00A50]);
  [v5 centerCoordinate];
  double v8 = v7;
  [v5 centerCoordinate];
  v9 = objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  id v10 = objc_alloc_init(MEMORY[0x263F00A40]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__LocationRefinementViewControllerAccessibility__triggerCrossHairLocationDecode__block_invoke;
  v13[3] = &unk_26512D7D0;
  id v14 = v3;
  v15 = self;
  id v11 = v3;
  v12 = (void *)MEMORY[0x2456533E0](v13);
  [v10 reverseGeocodeLocation:v9 completionHandler:v12];
  [(LocationRefinementViewControllerAccessibility *)self _accessibilitySetRetainedValue:v10 forKey:@"CLGeocoder"];
}

void __80__LocationRefinementViewControllerAccessibility__triggerCrossHairLocationDecode__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 firstObject];
  id v7 = v5;
  if (a3 || !v5)
  {
    [*(id *)(a1 + 40) _accessibilityRemoveValueForKey:@"CLGeocoder"];
  }
  else
  {
    id v6 = AXShortAddressDescriptionForPlacemark(v5, 1);
    [*(id *)(a1 + 32) setAccessibilityValue:v6];
    [*(id *)(a1 + 40) _accessibilityRemoveValueForKey:@"CLGeocoder"];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)LocationRefinementViewControllerAccessibility;
  [(LocationRefinementViewControllerAccessibility *)&v5 mapView:a3 regionDidChangeAnimated:a4];
  [(LocationRefinementViewControllerAccessibility *)self _triggerCrossHairLocationDecode];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LocationRefinementViewControllerAccessibility;
  [(LocationRefinementViewControllerAccessibility *)&v3 viewDidLoad];
  [(LocationRefinementViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end