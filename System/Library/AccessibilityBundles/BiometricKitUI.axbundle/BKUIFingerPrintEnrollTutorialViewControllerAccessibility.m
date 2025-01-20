@interface BKUIFingerPrintEnrollTutorialViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setEnrollViewState:(unint64_t)a3;
@end

@implementation BKUIFingerPrintEnrollTutorialViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIFingerPrintEnrollTutorialViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerPrintEnrollTutorialViewController", @"setEnrollViewState:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerPrintEnrollTutorialViewController", @"enrollTutorialImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIFingerPrintEnrollTutorialViewController", @"continueButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerPrintEnrollTutorialViewControllerAccessibility;
  [(BKUIFingerPrintEnrollTutorialViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BKUIFingerPrintEnrollTutorialViewControllerAccessibility *)self safeValueForKey:@"enrollTutorialImageView"];
  [v3 setIsAccessibilityElement:1];

  v4 = [(BKUIFingerPrintEnrollTutorialViewControllerAccessibility *)self safeValueForKey:@"enrollTutorialImageView"];
  if (AXDeviceIsPad()) {
    v5 = @"enroll.tutor.image.label.ipad";
  }
  else {
    v5 = @"enroll.tutor.image.label.left.hand";
  }
  v6 = accessibilityLocalizedString(v5);
  [v4 setAccessibilityLabel:v6];
}

- (void)setEnrollViewState:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKUIFingerPrintEnrollTutorialViewControllerAccessibility;
  -[BKUIFingerPrintEnrollTutorialViewControllerAccessibility setEnrollViewState:](&v8, sel_setEnrollViewState_);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  if (a3 == 1)
  {
    v5 = [(BKUIFingerPrintEnrollTutorialViewControllerAccessibility *)self safeValueForKey:@"enrollTutorialImageView"];
    if (AXDeviceIsPad()) {
      v6 = @"enroll.tutor.image.label.ipad";
    }
    else {
      v6 = @"enroll.tutor.image.label.right.hand";
    }
    objc_super v7 = accessibilityLocalizedString(v6);
    [v5 setAccessibilityLabel:v7];
  }
}

@end