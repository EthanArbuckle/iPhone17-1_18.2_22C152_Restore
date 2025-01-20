@interface INUIAddVoiceShortcutButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation INUIAddVoiceShortcutButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"INUIAddVoiceShortcutButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"INUIAddVoiceShortcutButton", @"addToSiriLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"INUIAddVoiceShortcutButton", @"phraseLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(INUIAddVoiceShortcutButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"addToSiriLabel, phraseLabel"];
}

@end