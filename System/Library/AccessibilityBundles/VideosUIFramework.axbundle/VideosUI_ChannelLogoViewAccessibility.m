@interface VideosUI_ChannelLogoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VideosUI_ChannelLogoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.ChannelLogoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)VideosUI_ChannelLogoViewAccessibility;
  [(VideosUI_ChannelLogoViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

@end