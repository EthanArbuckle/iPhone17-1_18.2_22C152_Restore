@interface GAXSBLockScreenViewControllerBaseOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)exitEmergencyDialerAnimated:(BOOL)a3;
- (void)launchEmergencyDialer;
@end

@implementation GAXSBLockScreenViewControllerBaseOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBLockScreenViewControllerBase";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenViewControllerBase", @"exitEmergencyDialerAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenViewControllerBase", @"launchEmergencyDialer", "v", 0);
}

- (void)launchEmergencyDialer
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 wantsSingleAppModeOrAppSelfLockMode])
  {
    v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Device wants Single App mode / App self-lock mode. Not allowing emergency call", buf, 2u);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GAXSBLockScreenViewControllerBaseOverride;
    [(GAXSBLockScreenViewControllerBaseOverride *)&v5 launchEmergencyDialer];
    [v3 notifyBackboardIsMakingEmergencyCall:1];
  }
}

- (void)exitEmergencyDialerAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GAXSBLockScreenViewControllerBaseOverride;
  [(GAXSBLockScreenViewControllerBaseOverride *)&v3 exitEmergencyDialerAnimated:a3];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_294D0);
}

@end