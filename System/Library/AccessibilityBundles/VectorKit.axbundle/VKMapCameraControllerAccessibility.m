@interface VKMapCameraControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double;
@end

@implementation VKMapCameraControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKMapCameraController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapCameraController", @"zoomToLevel: withPoint:", "v", "d", "{Matrix<double, 3, 1>=[3d]}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapCameraController", @"tapZoom: levels: completionHandler:", "v", "{CGPoint=dd}", "d", "@?", 0);
}

- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double
{
  v4.receiver = self;
  v4.super_class = (Class)VKMapCameraControllerAccessibility;
  -[VKMapCameraControllerAccessibility zoomToLevel:withPoint:](&v4, sel_zoomToLevel_withPoint_, a3, a4.var0[0], a4.var0[1], a4.var0[2]);
  if (AXRequiresMapAccessibility()) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __60__VKMapCameraControllerAccessibility_zoomToLevel_withPoint___block_invoke()
{
}

@end