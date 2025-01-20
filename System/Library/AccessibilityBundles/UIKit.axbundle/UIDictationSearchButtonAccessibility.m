@interface UIDictationSearchButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation UIDictationSearchButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDictationSearchButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityHint
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityIdentifier
{
  return @"Dictate";
}

@end