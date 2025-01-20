@interface BKUIPearlEnrollControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation BKUIPearlEnrollControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlEnrollController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"instructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollController", @"coachingController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlCoachingController", @"instructionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollController", @"enrollViewController", "@", 0);
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_instructionView" withType:"BKUIPearlInstructionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollController", @"setCoachingHidden:animated:", "v", "B", "B", 0);
}

- (void)setCoachingHidden:(BOOL)a3 animated:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollControllerAccessibility;
  [(BKUIPearlEnrollControllerAccessibility *)&v11 setCoachingHidden:a3 animated:a4];
  objc_opt_class();
  v6 = [(BKUIPearlEnrollControllerAccessibility *)self safeValueForKeyPath:@"enrollViewController.view"];
  v7 = __UIAccessibilityCastAsClass();

  if (a3)
  {
    [v7 setAccessibilityElementsHidden:0];
    objc_opt_class();
    v8 = @"enrollViewController.instructionView.instructionLabel";
  }
  else
  {
    [v7 setAccessibilityElementsHidden:1];
    objc_opt_class();
    v8 = @"coachingController.instructionView.instructionLabel";
  }
  v9 = [(BKUIPearlEnrollControllerAccessibility *)self safeValueForKeyPath:v8];
  v10 = __UIAccessibilityCastAsClass();

  if (v10) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v10);
  }
}

@end