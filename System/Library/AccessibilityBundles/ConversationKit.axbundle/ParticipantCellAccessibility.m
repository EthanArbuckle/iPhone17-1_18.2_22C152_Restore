@interface ParticipantCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantCell", @"participantView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantCell", @"accessibilityDisplayName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(ParticipantCellAccessibility *)self safeStringForKey:@"accessibilityDisplayName"];
}

- (id)accessibilityValue
{
  v2 = [(ParticipantCellAccessibility *)self safeValueForKey:@"participantView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(ParticipantCellAccessibility *)self safeValueForKey:@"participantView"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityCustomActions
{
  v2 = [(ParticipantCellAccessibility *)self safeValueForKey:@"participantView"];
  unint64_t v3 = [v2 accessibilityCustomActions];

  return v3;
}

@end