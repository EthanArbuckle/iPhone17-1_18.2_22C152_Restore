@interface FCUIActivityPickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dismissHeader;
@end

@implementation FCUIActivityPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCUIActivityPickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityPickerViewController", @"_dismissHeader", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityPickerViewController", @"_activityListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FCUIActivityListView", @"activityViews", "@", 0);
}

- (void)_dismissHeader
{
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityPickerViewControllerAccessibility;
  [(FCUIActivityPickerViewControllerAccessibility *)&v7 _dismissHeader];
  id v3 = [(FCUIActivityPickerViewControllerAccessibility *)self safeValueForKey:@"_activityListView"];
  v4 = [v3 safeArrayForKey:@"activityViews"];
  UIAccessibilityNotifications v5 = *MEMORY[0x263F1CE18];
  v6 = [v4 firstObject];
  UIAccessibilityPostNotification(v5, v6);
}

@end