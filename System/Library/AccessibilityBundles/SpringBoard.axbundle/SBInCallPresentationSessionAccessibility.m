@interface SBInCallPresentationSessionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setNonModalPresentationActive:(BOOL)a3;
@end

@implementation SBInCallPresentationSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBInCallPresentationSession";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_setNonModalPresentationActive:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBInCallPresentationSessionAccessibility;
  [(SBInCallPresentationSessionAccessibility *)&v3 _setNonModalPresentationActive:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __75__SBInCallPresentationSessionAccessibility__setNonModalPresentationActive___block_invoke()
{
  id v0 = [MEMORY[0x263F22968] server];
  [v0 didPotentiallyDismissNonExclusiveSystemUI];
}

@end