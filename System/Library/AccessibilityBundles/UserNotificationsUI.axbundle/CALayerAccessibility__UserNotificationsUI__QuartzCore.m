@interface CALayerAccessibility__UserNotificationsUI__QuartzCore
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)hitTestsAsOpaque;
@end

@implementation CALayerAccessibility__UserNotificationsUI__QuartzCore

- (BOOL)hitTestsAsOpaque
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [(CALayerAccessibility__UserNotificationsUI__QuartzCore *)self accessibilityIdentifier];
    char v4 = [v3 isEqualToString:@"NCBlockTouchesViewCALayer"];

    if (v4) {
      return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CALayerAccessibility__UserNotificationsUI__QuartzCore;
  return [(CALayerAccessibility__UserNotificationsUI__QuartzCore *)&v6 hitTestsAsOpaque];
}

+ (id)safeCategoryTargetClassName
{
  return @"CALayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

@end