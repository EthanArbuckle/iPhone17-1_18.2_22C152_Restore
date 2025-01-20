@interface SBUIPasscodeLockNumberPadAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSoftwareKeyboardMimic;
- (void)_configureAdditionalButtons;
@end

@implementation SBUIPasscodeLockNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockNumberPad";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockNumberPad", @"_configureAdditionalButtons", "v", 0);
  [v3 validateClass:@"SBUIPasscodeLockNumberPad" hasInstanceVariable:@"_cancelButton" withType:"SBUIButton"];
  [v3 validateClass:@"SBUIPasscodeLockNumberPad" hasInstanceVariable:@"_backspaceButton" withType:"SBUIButton"];
  [v3 validateClass:@"SBUIPasscodeLockNumberPad" hasInstanceVariable:@"_emergencyCallButton" withType:"SBUIButton"];
}

- (BOOL)_accessibilityIsSoftwareKeyboardMimic
{
  return 1;
}

- (void)_configureAdditionalButtons
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockNumberPadAccessibility;
  [(SBUIPasscodeLockNumberPadAccessibility *)&v7 _configureAdditionalButtons];
  id v3 = [(SBUIPasscodeLockNumberPadAccessibility *)self safeValueForKey:@"_cancelButton"];
  uint64_t v4 = *MEMORY[0x263F1CEE8];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  v5 = [(SBUIPasscodeLockNumberPadAccessibility *)self safeValueForKey:@"_backspaceButton"];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CF08] | v4];

  v6 = [(SBUIPasscodeLockNumberPadAccessibility *)self safeValueForKey:@"_emergencyCallButton"];
  [v6 setAccessibilityTraits:v4];
}

@end