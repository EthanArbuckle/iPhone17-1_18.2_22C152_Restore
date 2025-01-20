@interface NikeSettingsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)dismissModalViewControllerAnimated:(BOOL)a3;
- (void)showPowerSongPicker:(id)a3;
@end

@implementation NikeSettingsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NikeSettingsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NikeSettingsControllerAccessibility;
  [(NikeSettingsControllerAccessibility *)&v3 dismissModalViewControllerAnimated:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)showPowerSongPicker:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NikeSettingsControllerAccessibility;
  [(NikeSettingsControllerAccessibility *)&v3 showPowerSongPicker:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end