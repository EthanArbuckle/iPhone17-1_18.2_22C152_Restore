@interface AlphanumericPINTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
@end

@implementation AlphanumericPINTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AlphanumericPINTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AlphanumericPINTextField" isKindOfClass:@"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PINView", @"notifyDelegatePINChanged", "v", 0);
}

- (void)_accessibilityInsertText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AlphanumericPINTextFieldAccessibility;
  [(AlphanumericPINTextFieldAccessibility *)&v3 _accessibilityInsertText:a3];
  AXPerformSafeBlock();
}

void __66__AlphanumericPINTextFieldAccessibility__accessibilityInsertText___block_invoke()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 delegate];
  [v1 notifyDelegatePINChanged];
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AlphanumericPINTextFieldAccessibility;
  [(AlphanumericPINTextFieldAccessibility *)&v4 _accessibilityReplaceCharactersAtCursor:a3 withString:a4];
  AXPerformSafeBlock();
}

void __92__AlphanumericPINTextFieldAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 delegate];
  [v1 notifyDelegatePINChanged];
}

@end