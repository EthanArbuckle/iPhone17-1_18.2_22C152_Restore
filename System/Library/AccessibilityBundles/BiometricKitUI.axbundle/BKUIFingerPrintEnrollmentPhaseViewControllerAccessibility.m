@interface BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setHeaderTitle:(id)a3;
@end

@implementation BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIFingerPrintEnrollmentPhaseViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setHeaderTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility;
  id v3 = a3;
  [(BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility *)&v4 setHeaderTitle:v3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21988]);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v3);
}

@end