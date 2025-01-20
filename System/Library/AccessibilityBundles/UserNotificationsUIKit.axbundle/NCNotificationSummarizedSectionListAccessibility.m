@interface NCNotificationSummarizedSectionListAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_collapseSection;
@end

@implementation NCNotificationSummarizedSectionListAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationSummarizedSectionList";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_collapseSection
{
  v2.receiver = self;
  v2.super_class = (Class)NCNotificationSummarizedSectionListAccessibility;
  [(NCNotificationSummarizedSectionListAccessibility *)&v2 _collapseSection];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end