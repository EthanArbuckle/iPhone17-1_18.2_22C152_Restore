@interface GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12;
@end

@implementation GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBFullScreenSwitcherSceneLiveContentOverlay";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"SBFullScreenSwitcherSceneLiveContentOverlay" hasRequiredInstanceMethod:@"configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFullScreenSwitcherSceneLiveContentOverlay", @"deviceApplicationSceneViewController", "@", 0);
  [v3 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController" hasInstanceVariable:@"_deviceApplicationSceneViewController" withType:"SBDeviceApplicationSceneViewController"];
}

- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v22 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride;
  -[GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:](&v27, "configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:", v22, a5, a6, a7, a8, a9, x, y, width, height, a10, a11, a12);
  v23 = +[GAXSpringboard sharedInstanceIfExists];
  LODWORD(a8) = [v23 isActive];

  if (a8)
  {
    v24 = [(GAXSBFullScreenSwitcherSceneLiveContentOverlayOverride *)self safeValueForKey:@"deviceApplicationSceneViewController"];
    AXSafeClassFromString();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v25 = [v24 safeValueForKey:@"_deviceApplicationSceneViewController"];
      v26 = __UIAccessibilityCastAsSafeCategory();
    }
    else
    {
      objc_opt_class();
      v26 = __UIAccessibilityCastAsSafeCategory();
    }
    [v26 _gaxSetShouldSuppressBottomGrabber:1];
  }
}

@end