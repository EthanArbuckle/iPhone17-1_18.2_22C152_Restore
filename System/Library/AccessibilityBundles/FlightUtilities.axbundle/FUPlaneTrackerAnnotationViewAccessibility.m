@interface FUPlaneTrackerAnnotationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGeocodingGroup;
- (id)_accessibilityGetGeocodingGroup;
- (id)_accessibilityNearbyLocationDescription;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetGeocodingGroup:(id)a3;
- (void)_accessibilitySetNearbyLocationDescription:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation FUPlaneTrackerAnnotationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FUPlaneTrackerAnnotationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUPlaneTrackerAnnotationView", @"currentProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUPlaneTrackerAnnotationView", @"currentLocation", "{CLLocationCoordinate2D=dd}", 0);
  [v3 validateClass:@"FUPlaneTrackerAnnotationView" hasInstanceVariable:@"_showsPlane" withType:"B"];
  [v3 validateClass:@"FUPlaneTrackerAnnotationView" isKindOfClass:@"MKAnnotationView"];
  [v3 validateClass:@"FUPlaneTrackerAnnotationView" conformsToProtocol:@"MKAnnotation"];
}

- (id)_accessibilityNearbyLocationDescription
{
}

- (void)_accessibilitySetNearbyLocationDescription:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"flight.location");
}

- (BOOL)isAccessibilityElement
{
  return [(FUPlaneTrackerAnnotationViewAccessibility *)self safeBoolForKey:@"_showsPlane"];
}

- (id)accessibilityHint
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(FUPlaneTrackerAnnotationViewAccessibility *)&v3 accessibilityTraits];
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  -[FUPlaneTrackerAnnotationViewAccessibility setCoordinate:](&v4, sel_setCoordinate_, a3.latitude, a3.longitude);
  [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityGetGeocodingGroup
{
}

- (void)_accessibilitySetGeocodingGroup:(id)a3
{
}

- (id)_accessibilityGeocodingGroup
{
  objc_super v3 = [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilityGetGeocodingGroup];

  if (!v3)
  {
    dispatch_group_t v4 = dispatch_group_create();
    [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilitySetGeocodingGroup:v4];
  }

  return [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilityGetGeocodingGroup];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)FUPlaneTrackerAnnotationViewAccessibility;
  [(FUPlaneTrackerAnnotationViewAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3010000000;
  v9[4] = 0;
  v9[5] = 0;
  v9[3] = &unk_24213EC43;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[6] = MEMORY[0x263EF8330];
  block[7] = 3221225472;
  block[8] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  block[9] = &unk_265121650;
  block[10] = self;
  block[11] = v9;
  block[12] = &v5;
  AXPerformSafeBlock();
  if (*((unsigned char *)v6 + 24))
  {
    objc_super v3 = [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilityGeocodingGroup];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    block[3] = &unk_2651216A0;
    block[4] = self;
    block[5] = v9;
    dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = __UIAccessibilityCastAsProtocol();
  [v2 coordinate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _accessibilityGeocodingGroup];
  dispatch_group_enter(v2);

  id v3 = objc_alloc_init(MEMORY[0x263F00A40]);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) longitude:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_265121678;
  v5[4] = *(void *)(a1 + 32);
  [v3 reverseGeocodeLocation:v4 completionHandler:v5];
}

void __87__FUPlaneTrackerAnnotationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v19 = @"could not reverse-geocode flight location: %@";
    uint64_t v20 = a3;
    LOBYTE(v18) = 1;
    _AXLogWithFacility();
    goto LABEL_17;
  }
  uint64_t v4 = [a2 firstObject];
  uint64_t v5 = [v4 locality];
  v6 = [v4 administrativeArea];
  uint64_t v7 = [v4 country];
  char v8 = [v4 inlandWater];
  uint64_t v9 = [v4 ocean];
  objc_super v10 = (void *)v9;
  if (v5 && v6 && v7)
  {
    v11 = NSString;
    accessibilityLocalizedString(@"flight.location.city.state.country");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v5, v6, v7);
    v14 = LABEL_10:;
    goto LABEL_15;
  }
  if (v5 && v7)
  {
    v13 = NSString;
    accessibilityLocalizedString(@"flight.location.city.country");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v12, v5, v7, v20);
    goto LABEL_10;
  }
  v15 = v7;
  if (!v7)
  {
    v15 = v8;
    if (!v8)
    {
      v15 = (void *)v9;
      if (!v9)
      {
        v14 = 0;
        goto LABEL_16;
      }
    }
  }
  id v12 = v15;
  v16 = NSString;
  v17 = accessibilityLocalizedString(@"flight.location.other");
  v14 = objc_msgSend(v16, "stringWithFormat:", v17, v12);

LABEL_15:
LABEL_16:
  [*(id *)(a1 + 32) _accessibilitySetNearbyLocationDescription:v14];

LABEL_17:
  v21 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityGeocodingGroup", v18, v19, v20);
  dispatch_group_leave(v21);
}

- (id)accessibilityValue
{
  [(FUPlaneTrackerAnnotationViewAccessibility *)self safeCGFloatForKey:@"currentProgress"];
  id v3 = [(FUPlaneTrackerAnnotationViewAccessibility *)self _accessibilityNearbyLocationDescription];
  uint64_t v4 = NSString;
  uint64_t v5 = accessibilityLocalizedString(@"flight.percent.complete");
  v6 = AXFormatFloatWithPercentage();
  uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  char v8 = __UIAXStringForVariables();

  return v8;
}

@end