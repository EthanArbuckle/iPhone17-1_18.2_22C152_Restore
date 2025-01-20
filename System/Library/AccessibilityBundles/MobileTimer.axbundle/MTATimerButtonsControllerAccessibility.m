@interface MTATimerButtonsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MTATimerButtonsControllerAccessibility)initWithTarget:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateCancelButtonState;
- (void)setState:(unint64_t)a3;
@end

@implementation MTATimerButtonsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerButtonsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerButtonsController", @"initWithTarget:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerButtonsController", @"setState:", "v", "Q", 0);
  [v3 validateClass:@"MTATimerButtonsController" hasInstanceVariable:@"_cancelButton" withType:"MTACircleButton"];
  [v3 validateClass:@"MTATimerButtonsController" hasInstanceVariable:@"_state" withType:"Q"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTATimerButtonsControllerAccessibility;
  [(MTATimerButtonsControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTATimerButtonsControllerAccessibility *)self _updateCancelButtonState];
}

- (MTATimerButtonsControllerAccessibility)initWithTarget:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerButtonsControllerAccessibility;
  objc_super v3 = [(MTATimerButtonsControllerAccessibility *)&v6 initWithTarget:a3];
  v4 = v3;
  if (v3) {
    [(MTATimerButtonsControllerAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)setState:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTATimerButtonsControllerAccessibility;
  [(MTATimerButtonsControllerAccessibility *)&v4 setState:a3];
  [(MTATimerButtonsControllerAccessibility *)self _updateCancelButtonState];
}

- (void)_updateCancelButtonState
{
  objc_super v3 = [(MTATimerButtonsControllerAccessibility *)self safeValueForKey:@"_cancelButton"];
  objc_super v4 = __UIAccessibilitySafeClass();

  if (v4)
  {
    v5 = [(MTATimerButtonsControllerAccessibility *)self safeValueForKey:@"_state"];
    uint64_t v6 = [v5 integerValue];

    uint64_t v7 = *MEMORY[0x263F1CF20];
    if (v6 != 1) {
      uint64_t v7 = 0;
    }
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v7];
  }
}

@end