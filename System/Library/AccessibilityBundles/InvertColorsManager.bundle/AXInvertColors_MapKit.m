@interface AXInvertColors_MapKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MapKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlacePhotosViewController", @"_createImageViews", "v", 0);
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_photoViews" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_setPreferredConfiguration:onInit:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"preferredConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MKMapConfiguration", @"_cartographicConfigurationForMapConfiguration:", "{?=qqqqqqB}", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"MKPlacePhotosViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MKMapViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end