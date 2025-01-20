@interface SBUIPasscodeTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)deleteBackward;
- (void)insertText:(id)a3;
@end

@implementation SBUIPasscodeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUIPasscodeTextField" isKindOfClass:@"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"insertText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"deleteBackward", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(@"passcode.entry");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  return *MEMORY[0x263F813D8] | [(SBUIPasscodeTextFieldAccessibility *)&v3 accessibilityTraits];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  [(SBUIPasscodeTextFieldAccessibility *)self _accessibilityPostValueChangedNotificationWithInsertedText:v4];
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  [(SBUIPasscodeTextFieldAccessibility *)&v5 insertText:v4];
}

- (void)deleteBackward
{
  [(SBUIPasscodeTextFieldAccessibility *)self _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C40]];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextFieldAccessibility;
  [(SBUIPasscodeTextFieldAccessibility *)&v3 deleteBackward];
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 0;
}

@end