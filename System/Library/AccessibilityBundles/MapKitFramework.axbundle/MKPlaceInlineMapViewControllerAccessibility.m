@interface MKPlaceInlineMapViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateMapContentView;
- (void)_updateMap;
@end

@implementation MKPlaceInlineMapViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceInlineMapViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKPlaceInlineMapViewController" hasInstanceVariable:@"_contentView" withType:"_MKPlaceInlineMapContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceInlineMapViewController", @"mapItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItem", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceInlineMapViewController", @"_updateMap", "v", 0);
}

- (void)_axUpdateMapContentView
{
  id v3 = [(MKPlaceInlineMapViewControllerAccessibility *)self safeValueForKey:@"_contentView"];
  v4 = [(MKPlaceInlineMapViewControllerAccessibility *)self safeValueForKey:@"mapItem"];
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"name"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = NSString;
  v8 = AXMapKitLocString(@"MAP_CONTAINING");
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  [v3 setAccessibilityLabel:v9];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewControllerAccessibility;
  [(MKPlaceInlineMapViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MKPlaceInlineMapViewControllerAccessibility *)self _axUpdateMapContentView];
}

- (void)_updateMap
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewControllerAccessibility;
  [(MKPlaceInlineMapViewControllerAccessibility *)&v3 _updateMap];
  [(MKPlaceInlineMapViewControllerAccessibility *)self _axUpdateMapContentView];
}

@end