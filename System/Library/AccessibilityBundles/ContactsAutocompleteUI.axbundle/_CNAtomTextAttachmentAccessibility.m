@interface _CNAtomTextAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _CNAtomTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CNAtomTextAttachment";
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
  return (id)[(_CNAtomTextAttachmentAccessibility *)self _accessibilityStringForLabelKeyValues:@"atomView"];
}

@end