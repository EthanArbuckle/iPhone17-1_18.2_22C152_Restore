@interface SBDisplayBrightnessControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4;
@end

@implementation SBDisplayBrightnessControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDisplayBrightnessController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBDisplayBrightnessControllerAccessibility;
  -[SBDisplayBrightnessControllerAccessibility _setBrightnessLevel:animated:](&v9, sel__setBrightnessLevel_animated_, a4);
  BKSDisplayBrightnessGetCurrent();
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"brightness.format");
  v7 = AXFormatFloatWithPercentage();
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  UIAccessibilityPostNotification(v4, v8);
}

@end