@interface GAXSBDeviceApplicationSceneViewControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxInternalShouldSuppressBottomGrabber;
- (BOOL)_gaxShouldSuppressBottomGrabber;
- (int64_t)_gaxDesiredHomeGrabberDisplayMode;
- (void)_gaxInternalSetShouldSuppressBottomGrabber:(BOOL)a3;
- (void)_gaxSetDesiredHomeGrabberDisplayMode:(int64_t)a3;
- (void)_gaxSetShouldSuppressBottomGrabber:(BOOL)a3;
- (void)setHomeGrabberDisplayMode:(int64_t)a3;
@end

@implementation GAXSBDeviceApplicationSceneViewControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBDeviceApplicationSceneViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_gaxInternalShouldSuppressBottomGrabber
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A42);
}

- (void)_gaxInternalSetShouldSuppressBottomGrabber:(BOOL)a3
{
}

- (int64_t)_gaxDesiredHomeGrabberDisplayMode
{
  return ___UIAccessibilityGetAssociatedInteger(self, &unk_37A43);
}

- (void)_gaxSetDesiredHomeGrabberDisplayMode:(int64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneViewController", @"homeGrabberDisplayMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDeviceApplicationSceneViewController", @"setHomeGrabberDisplayMode:", "v", "q", 0);
}

- (void)_gaxSetShouldSuppressBottomGrabber:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GAXSBDeviceApplicationSceneViewControllerOverride *)self _gaxInternalShouldSuppressBottomGrabber] != a3)
  {
    if (v3)
    {
      [(GAXSBDeviceApplicationSceneViewControllerOverride *)self _gaxSetDesiredHomeGrabberDisplayMode:[(GAXSBDeviceApplicationSceneViewControllerOverride *)self safeIntegerForKey:@"homeGrabberDisplayMode"]];
      AXPerformSafeBlock();
      [(GAXSBDeviceApplicationSceneViewControllerOverride *)self _gaxInternalSetShouldSuppressBottomGrabber:1];
    }
    else
    {
      [(GAXSBDeviceApplicationSceneViewControllerOverride *)self _gaxInternalSetShouldSuppressBottomGrabber:0];
      AXPerformSafeBlock();
    }
  }
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
  if ([(GAXSBDeviceApplicationSceneViewControllerOverride *)self _gaxShouldSuppressBottomGrabber])
  {
    v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_15E4C(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)GAXSBDeviceApplicationSceneViewControllerOverride;
  [(GAXSBDeviceApplicationSceneViewControllerOverride *)&v6 setHomeGrabberDisplayMode:a3];
}

- (BOOL)_gaxShouldSuppressBottomGrabber
{
  return self->__gaxShouldSuppressBottomGrabber;
}

@end