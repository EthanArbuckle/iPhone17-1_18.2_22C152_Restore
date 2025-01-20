@interface SFStepperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setText:(id)a3 forButton:(int64_t)a4;
@end

@implementation SFStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFStepper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStepper", @"setText:forButton:", "v", "@", "q", 0);
  [v3 validateClass:@"SFStepper" hasInstanceVariable:@"trailingButton" withType:""];
  [v3 validateClass:@"SFStepper" hasInstanceVariable:@"leadingButton" withType:""];
}

- (id)accessibilityLabel
{
  return accessibilityMobileSafariLocalizedString(@"text.size");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
  objc_opt_class();
  id v3 = [(SFStepperAccessibility *)self safeValueForKey:@"trailingButton"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 sendActionsForControlEvents:64];
}

- (void)accessibilityDecrement
{
  objc_opt_class();
  id v3 = [(SFStepperAccessibility *)self safeValueForKey:@"leadingButton"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 sendActionsForControlEvents:64];
}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  if (a3) {
    -[SFStepperAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", a3, a4);
  }
}

@end