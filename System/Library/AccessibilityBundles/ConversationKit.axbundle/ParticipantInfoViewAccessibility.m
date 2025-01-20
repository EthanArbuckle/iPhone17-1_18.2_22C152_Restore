@interface ParticipantInfoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation ParticipantInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(ParticipantInfoViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"nameLabel"];
}

@end