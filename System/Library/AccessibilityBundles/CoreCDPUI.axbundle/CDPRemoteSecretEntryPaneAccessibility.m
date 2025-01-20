@interface CDPRemoteSecretEntryPaneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityResponderElement;
@end

@implementation CDPRemoteSecretEntryPaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CDPRemoteSecretEntryPane";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityResponderElement
{
  uint64_t v3 = MEMORY[0x245649870](@"PSPasscodeField", a2);

  return (id)[(CDPRemoteSecretEntryPaneAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end