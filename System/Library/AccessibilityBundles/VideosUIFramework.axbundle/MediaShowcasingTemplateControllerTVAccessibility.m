@interface MediaShowcasingTemplateControllerTVAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation MediaShowcasingTemplateControllerTVAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.MediaShowcasingTemplateControllerTV";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MediaShowcasingTemplateControllerTVAccessibility;
  [(MediaShowcasingTemplateControllerTVAccessibility *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F1CDF8] object:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MediaShowcasingTemplateControllerTVAccessibility;
  [(MediaShowcasingTemplateControllerTVAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

@end