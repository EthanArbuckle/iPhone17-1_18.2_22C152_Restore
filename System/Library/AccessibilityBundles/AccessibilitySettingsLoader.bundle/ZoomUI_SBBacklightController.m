@interface ZoomUI_SBBacklightController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_undimFromSource:(int64_t)a3;
@end

@implementation ZoomUI_SBBacklightController

+ (id)safeCategoryTargetClassName
{
  return @"SBBacklightController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_undimFromSource:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_SBBacklightController;
  [(ZoomUI_SBBacklightController *)&v4 _undimFromSource:a3];
  v3 = [getZoomServicesClass() sharedInstance];
  [v3 notifyZoomDeviceWillWake];
}

@end