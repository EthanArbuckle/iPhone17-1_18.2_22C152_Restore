@interface BKUIFingerprintEnrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_finishEnrollmentPhaseTwo;
- (void)_startTutorial:(BOOL)a3;
- (void)transitionToEnrollView:(BOOL)a3;
@end

@implementation BKUIFingerprintEnrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIFingerprintEnrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerprintEnrollViewController", @"_startTutorial:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerprintEnrollViewController", @"transitionToEnrollView:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerprintEnrollViewController", @"_finishEnrollmentPhaseTwo", "v", 0);
  [v3 validateClass:@"BKUIFingerprintEnrollViewController" hasInstanceVariable:@"_mesaFirstEnrollView" withType:"BKUICurvesView"];
  [v3 validateClass:@"BKUIFingerprintEnrollViewController" hasInstanceVariable:@"_enrollmentPhaseTwo" withType:"BOOL"];
}

- (void)_startTutorial:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  [(BKUIFingerprintEnrollViewControllerAccessibility *)&v6 _startTutorial:a3];
  uint64_t v4 = [(BKUIFingerprintEnrollViewControllerAccessibility *)self safeBoolForKey:@"_enrollmentPhaseTwo"] ^ 1;
  v5 = [(BKUIFingerprintEnrollViewControllerAccessibility *)self safeValueForKey:@"_mesaFirstEnrollView"];
  [v5 setIsAccessibilityElement:v4];
}

- (void)_finishEnrollmentPhaseTwo
{
  v2.receiver = self;
  v2.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  [(BKUIFingerprintEnrollViewControllerAccessibility *)&v2 _finishEnrollmentPhaseTwo];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)transitionToEnrollView:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerprintEnrollViewControllerAccessibility;
  [(BKUIFingerprintEnrollViewControllerAccessibility *)&v3 transitionToEnrollView:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end