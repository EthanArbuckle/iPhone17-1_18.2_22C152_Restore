@interface ConversationControlsManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityDidAddPendingParticipant:(id)a3;
- (void)joinButtonTappedWithButton:(id)a3;
@end

@implementation ConversationControlsManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ConversationControlsManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationControlsManager", @"joinButtonTappedWithButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationControlsManager", @"accessibilityDidAddPendingParticipant:", "v", "@", 0);
}

- (void)accessibilityDidAddPendingParticipant:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ConversationControlsManagerAccessibility;
  id v3 = a3;
  [(ConversationControlsManagerAccessibility *)&v7 accessibilityDidAddPendingParticipant:v3];
  v4 = NSString;
  v5 = accessibilityLocalizedString(@"request.to.join.call");
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)joinButtonTappedWithButton:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationControlsManagerAccessibility;
  [(ConversationControlsManagerAccessibility *)&v4 joinButtonTappedWithButton:a3];
  id v3 = accessibilityLocalizedString(@"connecting");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end