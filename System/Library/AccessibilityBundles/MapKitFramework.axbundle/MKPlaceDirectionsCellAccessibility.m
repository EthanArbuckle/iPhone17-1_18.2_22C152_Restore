@interface MKPlaceDirectionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_axSpokenStringForDuration:(double)a3;
- (void)_axUpdateElements;
- (void)updateETAFor:(unint64_t)a3 button:(id)a4 label:(id)a5;
@end

@implementation MKPlaceDirectionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceDirectionsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceDirectionsCell", @"updateETAFor: button: label:", "v", "Q", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKRouteETA", @"travelTime", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKQuickRouteManager", @"routeETAForTransportType:", "@", "Q", 0);
  [v3 validateClass:@"MKPlaceDirectionsCell" hasInstanceVariable:@"_quickRouteManager" withType:"_MKQuickRouteManager"];
  [v3 validateClass:@"MKPlaceDirectionsCell" hasInstanceVariable:@"_directionsButton" withType:"UIButton"];
  [v3 validateClass:@"MKPlaceDirectionsCell" hasInstanceVariable:@"_walkButton" withType:"UIButton"];
  [v3 validateClass:@"MKPlaceDirectionsCell" hasInstanceVariable:@"_transitButton" withType:"UIButton"];
  [v3 validateClass:@"MKPlaceDirectionsCell" hasInstanceVariable:@"_driveButton" withType:"UIButton"];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (void)_axUpdateElements
{
  id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  id v3 = [(MKPlaceDirectionsCellAccessibility *)self safeValueForKey:@"_directionsButton"];
  v4 = [(MKPlaceDirectionsCellAccessibility *)self safeValueForKey:@"_driveButton"];
  v5 = [(MKPlaceDirectionsCellAccessibility *)self safeValueForKey:@"_walkButton"];
  v6 = [(MKPlaceDirectionsCellAccessibility *)self safeValueForKey:@"_transitButton"];
  [v7 axSafelyAddObject:v3];
  if (([v4 isHidden] & 1) == 0) {
    [v7 axSafelyAddObject:v4];
  }
  if (([v5 isHidden] & 1) == 0) {
    [v7 axSafelyAddObject:v5];
  }
  if (([v6 isHidden] & 1) == 0) {
    [v7 axSafelyAddObject:v6];
  }
  [(MKPlaceDirectionsCellAccessibility *)self setAccessibilityElements:v7];
}

- (id)_axSpokenStringForDuration:(double)a3
{
  MNGetHoursAndMinutesForTimeInterval();
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v3 setHour:0];
  [v3 setMinute:0];
  v4 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v3 unitsStyle:4];

  return v4;
}

- (void)updateETAFor:(unint64_t)a3 button:(id)a4 label:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MKPlaceDirectionsCellAccessibility;
  [(MKPlaceDirectionsCellAccessibility *)&v22 updateETAFor:a3 button:v8 label:v9];
  if (([v8 isHidden] & 1) == 0)
  {
    switch(a3)
    {
      case 4uLL:
        v10 = @"TRANSIT_TIME_FORMAT";
        break;
      case 2uLL:
        v10 = @"WALKING_TIME_FORMAT";
        break;
      case 1uLL:
        v10 = @"DRIVING_TIME_FORMAT";
        break;
      default:
        _AXAssert();
        v11 = &stru_26F6DE2F0;
        goto LABEL_10;
    }
    AXMapKitLocString(v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    uint64_t v18 = 0;
    v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    unint64_t v17 = a3;
    AXPerformSafeBlock();
    double v12 = v19[3];
    _Block_object_dispose(&v18, 8);
    v13 = NSString;
    v14 = [(MKPlaceDirectionsCellAccessibility *)self _axSpokenStringForDuration:v12];
    v15 = objc_msgSend(v13, "localizedStringWithFormat:", v11, v14, v16, 3221225472, __64__MKPlaceDirectionsCellAccessibility_updateETAFor_button_label___block_invoke, &unk_26512C4B8, self, &v18, v17);

    [v8 setAccessibilityLabel:v15];
  }
  [(MKPlaceDirectionsCellAccessibility *)self _axUpdateElements];
}

void __64__MKPlaceDirectionsCellAccessibility_updateETAFor_button_label___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"_quickRouteManager"];
  v2 = [v4 routeETAForTransportType:*(void *)(a1 + 48)];
  [v2 safeDoubleForKey:@"travelTime"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

@end