@interface FUFlightViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (id)_accessibilityGetScrollView;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FUFlightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FUFlightView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightView", @"mapView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightView", @"errorView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightView", @"loadingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUFlightStep", @"time", "@", 0);
  [v3 validateClass:@"FUFlightView" hasInstanceVariable:@"_planeTracker" withType:"FUPlaneTrackerAnnotationView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)FUFlightViewAccessibility;
  [(FUFlightViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(FUFlightViewAccessibility *)self safeValueForKey:@"_planeTracker"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 _accessibilityLoadAccessibilityInformation];
  v5 = [(FUFlightViewAccessibility *)self safeValueForKey:@"mapView"];
  v6 = accessibilityLocalizedString(@"flight.tracking.map");
  [v5 setAccessibilityLabel:v6];

  [v5 setAccessibilityContainerType:4];
}

- (id)_accessibilityGetScrollView
{
  objc_opt_class();
  id v3 = [(FUFlightViewAccessibility *)self safeValueForKey:@"labelAirlineName"];
  __UIAccessibilityCastAsClass();
  v4 = (FUFlightViewAccessibility *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    goto LABEL_10;
  }
  v5 = 0;
  do
  {
    if (v4 == self || v5) {
      break;
    }
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    uint64_t v6 = [(FUFlightViewAccessibility *)v4 superview];

    v4 = (FUFlightViewAccessibility *)v6;
  }
  while (v6);
  if (!v5)
  {
LABEL_10:
    _AXLogWithFacility();
    v5 = 0;
  }

  return v5;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4 = a3;
  v5 = [(FUFlightViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    objc_super v7 = [(FUFlightViewAccessibility *)self _accessibilityGetScrollView];
    v8 = [v4 _accessibilityWindow];
    [v4 accessibilityFrame];
    objc_msgSend(v8, "convertRect:fromWindow:", 0);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    objc_msgSend(v7, "convertRect:fromView:", 0, v10, v12, v14, v16);
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
    BOOL v17 = v7 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)accessibilityElements
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(FUFlightViewAccessibility *)self safeValueForKey:@"errorView"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = [(FUFlightViewAccessibility *)self safeValueForKey:@"errorView"];
    v12[0] = v5;
    int v6 = (void **)v12;
LABEL_5:
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

    goto LABEL_7;
  }
  objc_super v7 = [(FUFlightViewAccessibility *)self safeValueForKey:@"loadingView"];
  int v8 = [v7 _accessibilityViewIsVisible];

  if (v8)
  {
    v5 = [(FUFlightViewAccessibility *)self safeValueForKey:@"loadingView"];
    double v11 = v5;
    int v6 = &v11;
    goto LABEL_5;
  }
  double v9 = 0;
LABEL_7:

  return v9;
}

@end