@interface ParticipantMonogramViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axHandleRingMemberAction;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation ParticipantMonogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantMonogramView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantMonogramView", @"titleLabelContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantMonogramView", @"subtitleLabelContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantMonogramView", @"ringButton", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(ParticipantMonogramViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"subtitleLabelContainer, titleLabelContainer"];
}

- (id)accessibilityCustomActions
{
  id v3 = objc_opt_new();
  v4 = [(ParticipantMonogramViewAccessibility *)self safeUIViewForKey:@"ringButton"];
  if ([v4 _accessibilityViewIsVisible])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"ring.again");
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__axHandleRingMemberAction];
    [v3 addObject:v7];
  }

  return v3;
}

- (BOOL)_axHandleRingMemberAction
{
  v2 = [(ParticipantMonogramViewAccessibility *)self safeValueForKeyPath:@"ringButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

@end