@interface CHASActivitySetupViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityUpdateCurrentPresentedView;
- (void)_displayExerciseGoalViewAnimated:(BOOL)a3;
- (void)_displayStandGoalViewAnimated:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CHASActivitySetupViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHASActivitySetupViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHASActivitySetupViewController" hasInstanceVariable:@"_currentlyPresentedView" withType:"CHASActivitySetupGoalView"];
  [v3 validateClass:@"CHASActivitySetupViewController" hasInstanceVariable:@"_moveGoalView" withType:"CHASActivitySetupGoalView"];
  [v3 validateClass:@"CHASActivitySetupViewController" hasInstanceVariable:@"_exerciseGoalView" withType:"CHASActivitySetupGoalView"];
  [v3 validateClass:@"CHASActivitySetupViewController" hasInstanceVariable:@"_standGoalView" withType:"CHASActivitySetupGoalView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHASActivitySetupViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHASActivitySetupViewController", @"_displayExerciseGoalViewAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHASActivitySetupViewController", @"_displayStandGoalViewAnimated:", "v", "B", 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHASActivitySetupViewControllerAccessibility;
  [(CHASActivitySetupViewControllerAccessibility *)&v3 viewDidLoad];
  [(CHASActivitySetupViewControllerAccessibility *)self _accessibilityUpdateCurrentPresentedView];
}

- (void)_displayStandGoalViewAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHASActivitySetupViewControllerAccessibility;
  [(CHASActivitySetupViewControllerAccessibility *)&v4 _displayStandGoalViewAnimated:a3];
  [(CHASActivitySetupViewControllerAccessibility *)self _accessibilityUpdateCurrentPresentedView];
}

- (void)_displayExerciseGoalViewAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHASActivitySetupViewControllerAccessibility;
  [(CHASActivitySetupViewControllerAccessibility *)&v4 _displayExerciseGoalViewAnimated:a3];
  [(CHASActivitySetupViewControllerAccessibility *)self _accessibilityUpdateCurrentPresentedView];
}

- (void)_accessibilityUpdateCurrentPresentedView
{
  id v6 = [(CHASActivitySetupViewControllerAccessibility *)self safeValueForKey:@"_moveGoalView"];
  [v6 setAccessibilityElementsHidden:1];
  objc_super v3 = [(CHASActivitySetupViewControllerAccessibility *)self safeValueForKey:@"_exerciseGoalView"];
  [v3 setAccessibilityElementsHidden:1];
  objc_super v4 = [(CHASActivitySetupViewControllerAccessibility *)self safeValueForKey:@"_standGoalView"];
  [v4 setAccessibilityElementsHidden:1];
  v5 = [(CHASActivitySetupViewControllerAccessibility *)self safeValueForKey:@"_currentlyPresentedView"];
  [v5 setAccessibilityElementsHidden:0];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v5);
}

@end