@interface TimerCompressedControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLayoutSubviews;
@end

@implementation TimerCompressedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ClockAngel.TimerCompressedController";
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
  v4.receiver = self;
  v4.super_class = (Class)TimerCompressedControllerAccessibility;
  [(TimerCompressedControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(TimerCompressedControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setIsAccessibilityElementBlock:&__block_literal_global_0];
  [v3 setAccessibilityLabelBlock:&__block_literal_global_281];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_287];
  [v3 _setAccessibilityShouldUseHostContextIDTap:&__block_literal_global_289];
  [v3 _setAccessibilityShouldUseHostContextIDLongPress:&__block_literal_global_291];
}

BOOL __84__TimerCompressedControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1)
{
  return 1;
}

NSString *__cdecl __84__TimerCompressedControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id a1)
{
  return (NSString *)accessibilityLocalizedString(@"timer.button");
}

unint64_t __84__TimerCompressedControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(id a1)
{
  return UIAccessibilityTraitButton;
}

BOOL __84__TimerCompressedControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(id a1)
{
  return 1;
}

BOOL __84__TimerCompressedControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(id a1)
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TimerCompressedControllerAccessibility;
  [(TimerCompressedControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(TimerCompressedControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end