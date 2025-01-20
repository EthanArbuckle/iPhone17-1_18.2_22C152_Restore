@interface PRComplicationGalleryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PRComplicationGalleryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRComplicationGalleryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PRComplicationGalleryViewControllerAccessibility;
  [(PRComplicationGalleryViewControllerAccessibility *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = [v4 navigationController];
  UIAccessibilityPostNotification(v3, v5);
}

@end