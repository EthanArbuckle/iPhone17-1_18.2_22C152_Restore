@interface ExpandableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ExpandableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ExpandableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(ExpandableTextViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTextLabel"];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end