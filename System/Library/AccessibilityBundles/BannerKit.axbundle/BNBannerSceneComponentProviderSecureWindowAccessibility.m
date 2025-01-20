@interface BNBannerSceneComponentProviderSecureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation BNBannerSceneComponentProviderSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_BNBannerSceneComponentProviderSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)BNBannerSceneComponentProviderSecureWindowAccessibility;
  [(BNBannerSceneComponentProviderSecureWindowAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end