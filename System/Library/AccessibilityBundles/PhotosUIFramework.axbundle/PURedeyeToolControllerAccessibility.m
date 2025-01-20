@interface PURedeyeToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)centerToolbarView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_animateFailureAppearance;
- (void)_animateInstructionAppearance;
- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4;
- (void)didBecomeActiveTool;
@end

@implementation PURedeyeToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PURedeyeToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PURedeyeToolController", @"centerToolbarView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PURedeyeToolController", @"_animateInstructionAppearance", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PURedeyeToolController", @"_animateFailureAppearance", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PURedeyeToolController", @"didBecomeActiveTool", "v", 0);
  [v3 validateClass:@"PURedeyeToolController" hasInstanceVariable:@"_instructionLabel" withType:"CEKBadgeTextView"];
  [v3 validateClass:@"PURedeyeToolController" hasInstanceVariable:@"_failureLabel" withType:"CEKBadgeTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PURedeyeToolController", @"_showChangeIndicatorAtPoint:isFailure:", "v", "{CGPoint=dd}", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  [(PURedeyeToolControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PURedeyeToolControllerAccessibility *)self safeUIViewForKey:@"centerToolbarView"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_12];
}

uint64_t __81__PURedeyeToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (id)centerToolbarView
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  v2 = [(PURedeyeToolControllerAccessibility *)&v4 centerToolbarView];
  [v2 _setAccessibilityTraitsBlock:&__block_literal_global_332];

  return v2;
}

uint64_t __56__PURedeyeToolControllerAccessibility_centerToolbarView__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (void)_animateInstructionAppearance
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  [(PURedeyeToolControllerAccessibility *)&v4 _animateInstructionAppearance];
  id v3 = [(PURedeyeToolControllerAccessibility *)self _accessibilityStringForLabelKeyValues:@"_instructionLabel"];
  UIAccessibilitySpeak();
}

- (void)_animateFailureAppearance
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  [(PURedeyeToolControllerAccessibility *)&v4 _animateFailureAppearance];
  id v3 = [(PURedeyeToolControllerAccessibility *)self _accessibilityStringForLabelKeyValues:@"_failureLabel"];
  UIAccessibilitySpeak();
}

- (void)didBecomeActiveTool
{
  v4.receiver = self;
  v4.super_class = (Class)PURedeyeToolControllerAccessibility;
  [(PURedeyeToolControllerAccessibility *)&v4 didBecomeActiveTool];
  id v3 = [(PURedeyeToolControllerAccessibility *)self _accessibilityStringForLabelKeyValues:@"_instructionLabel"];
  UIAccessibilitySpeak();
}

- (void)_showChangeIndicatorAtPoint:(CGPoint)a3 isFailure:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PURedeyeToolControllerAccessibility;
  [(PURedeyeToolControllerAccessibility *)&v6 _showChangeIndicatorAtPoint:a3.x isFailure:a3.y];
  if (!a4)
  {
    v5 = accessibilityPULocalizedString(@"red.eye.corrected");
    UIAccessibilitySpeak();
  }
}

@end