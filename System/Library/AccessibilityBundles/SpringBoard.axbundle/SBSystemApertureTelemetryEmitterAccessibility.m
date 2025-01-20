@interface SBSystemApertureTelemetryEmitterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)_emitPowerLogIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4;
@end

@implementation SBSystemApertureTelemetryEmitterAccessibility

+ (void)_emitPowerLogIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F8B3E0], 0, 0, 1u);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SBSystemApertureTelemetryEmitterAccessibility;
  objc_msgSendSuper2(&v9, sel__emitPowerLogIfNecessaryWithUpdatedContext_previousContext_, v6, v7);
}

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemApertureTelemetryEmitter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

@end