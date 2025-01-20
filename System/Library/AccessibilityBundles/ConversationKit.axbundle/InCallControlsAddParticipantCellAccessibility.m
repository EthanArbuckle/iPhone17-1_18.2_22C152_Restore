@interface InCallControlsAddParticipantCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation InCallControlsAddParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsAddParticipantCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)InCallControlsAddParticipantCellAccessibility;
  unint64_t v2 = [(InCallControlsAddParticipantCellAccessibility *)&v7 accessibilityTraits];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  unint64_t v4 = *MEMORY[0x263F1CEE8] | v2;
  LODWORD(v2) = [v3 isUserInteractionEnabled];

  uint64_t v5 = *MEMORY[0x263F1CF20];
  if (v2) {
    uint64_t v5 = 0;
  }
  return v4 | v5;
}

@end