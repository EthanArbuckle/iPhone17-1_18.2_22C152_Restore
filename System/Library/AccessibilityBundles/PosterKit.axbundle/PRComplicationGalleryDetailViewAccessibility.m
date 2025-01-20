@interface PRComplicationGalleryDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PRComplicationGalleryDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRComplicationGalleryDetailView";
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
  v5.receiver = self;
  v5.super_class = (Class)PRComplicationGalleryDetailViewAccessibility;
  [(PRComplicationGalleryDetailViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  v4 = [(PRComplicationGalleryDetailViewAccessibility *)self safeValueForKey:@"titleView"];
  UIAccessibilityPostNotification(v3, v4);
}

@end