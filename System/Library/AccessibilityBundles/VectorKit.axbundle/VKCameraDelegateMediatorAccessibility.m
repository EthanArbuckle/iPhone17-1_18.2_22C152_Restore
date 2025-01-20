@interface VKCameraDelegateMediatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3;
- (void)mapLayerDidChangeVisibleRegion;
@end

@implementation VKCameraDelegateMediatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCameraDelegateMediator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VKCameraDelegateMediator" conformsToProtocol:@"VKMapViewCameraDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCameraDelegateMediator", @"mapLayerDidChangeVisibleRegion", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCameraDelegateMediator", @"mapLayerDidChangeRegionAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKCameraDelegateMediator", @"cameraDelegate", "@", 0);
}

- (void)mapLayerDidChangeVisibleRegion
{
  v5.receiver = self;
  v5.super_class = (Class)VKCameraDelegateMediatorAccessibility;
  [(VKCameraDelegateMediatorAccessibility *)&v5 mapLayerDidChangeVisibleRegion];
  id v3 = [(VKCameraDelegateMediatorAccessibility *)self safeValueForKey:@"cameraDelegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 safeValueForKey:@"_mapView"];
    [v4 _accessibilityMapViewDidChangeVisibleRegion];
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKCameraDelegateMediatorAccessibility;
  -[VKCameraDelegateMediatorAccessibility mapLayerDidChangeRegionAnimated:](&v7, sel_mapLayerDidChangeRegionAnimated_);
  objc_super v5 = [(VKCameraDelegateMediatorAccessibility *)self safeValueForKey:@"cameraDelegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 safeValueForKey:@"_mapView"];
    [v6 _accessibilityMapViewDidChangeRegionAnimated:v3];
  }
}

@end