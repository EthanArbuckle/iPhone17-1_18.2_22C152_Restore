@interface ZoomUI_SBDashBoardLockScreenEnvironmentOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)finishUIUnlockFromSource:(int)a3;
@end

@implementation ZoomUI_SBDashBoardLockScreenEnvironmentOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBDashBoardLockScreenEnvironment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)finishUIUnlockFromSource:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_SBDashBoardLockScreenEnvironmentOverride;
  [(ZoomUI_SBDashBoardLockScreenEnvironmentOverride *)&v4 finishUIUnlockFromSource:*(void *)&a3];
  v3 = [getZoomServicesClass() sharedInstance];
  [v3 notifyZoomDeviceWasUnlocked];
}

@end