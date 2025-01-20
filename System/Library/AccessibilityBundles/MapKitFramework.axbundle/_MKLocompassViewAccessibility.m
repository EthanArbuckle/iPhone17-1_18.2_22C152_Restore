@interface _MKLocompassViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateLabels;
- (void)_updateControlsVisibility;
- (void)setMapView:(id)a3;
@end

@implementation _MKLocompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKLocompassView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_MKLocompassView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKLocompassView", @"_updateControlsVisibility", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKLocompassView", @"setMapView:", "v", "@", 0);
  [v3 validateClass:@"_MKLocompassView" hasInstanceVariable:@"_compassView" withType:"MKCompassView_watchos"];
  [v3 validateClass:@"_MKLocompassView" hasInstanceVariable:@"_userTrackingButton" withType:"_MKUserTrackingButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)_MKLocompassViewAccessibility;
  [(_MKLocompassViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(_MKLocompassViewAccessibility *)self _axUpdateLabels];
}

- (void)_updateControlsVisibility
{
  v3.receiver = self;
  v3.super_class = (Class)_MKLocompassViewAccessibility;
  [(_MKLocompassViewAccessibility *)&v3 _updateControlsVisibility];
  [(_MKLocompassViewAccessibility *)self _axUpdateLabels];
}

- (void)setMapView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKLocompassViewAccessibility;
  [(_MKLocompassViewAccessibility *)&v4 setMapView:a3];
  [(_MKLocompassViewAccessibility *)self _axUpdateLabels];
}

- (void)_axUpdateLabels
{
  id v5 = [(_MKLocompassViewAccessibility *)self safeUIViewForKey:@"_userTrackingButton"];
  objc_super v3 = [v5 accessibilityLabel];
  [(_MKLocompassViewAccessibility *)self setAccessibilityLabel:v3];

  objc_super v4 = [v5 accessibilityValue];
  [(_MKLocompassViewAccessibility *)self setAccessibilityValue:v4];
}

@end