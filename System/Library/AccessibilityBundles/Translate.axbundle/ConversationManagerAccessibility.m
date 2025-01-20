@interface ConversationManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4;
@end

@implementation ConversationManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.ConversationManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ConversationManagerAccessibility;
  id v5 = a4;
  id v6 = a3;
  [(ConversationManagerAccessibility *)&v8 _accessbilityEvaluateTurnData:v6 languageCode:v5];
  v7 = objc_msgSend(MEMORY[0x263F21660], "axAttributedStringWithString:", v6, v8.receiver, v8.super_class);

  [v7 setAttribute:v5 forKey:*MEMORY[0x263F1CE90]];
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end