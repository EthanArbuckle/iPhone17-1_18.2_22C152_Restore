@interface SRCompactTextRequestViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SRCompactTextRequestViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRCompactTextRequestViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SRCompactTextRequestViewControllerAccessibility;
  [(SRCompactTextRequestViewControllerAccessibility *)&v7 viewWillAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [(SRCompactTextRequestViewControllerAccessibility *)self safeValueForKey:@"_textRequestView"];
  v6 = [v5 safeValueForKey:@"_textField"];
  UIAccessibilityPostNotification(v4, v6);
}

@end