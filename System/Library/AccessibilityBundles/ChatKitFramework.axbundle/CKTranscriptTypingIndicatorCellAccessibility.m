@interface CKTranscriptTypingIndicatorCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CKTranscriptTypingIndicatorCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptTypingIndicatorCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"contact.typing.message");
}

@end