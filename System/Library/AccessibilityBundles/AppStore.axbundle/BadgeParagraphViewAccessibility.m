@interface BadgeParagraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BadgeParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.BadgeParagraphView";
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
  return (id)[(BadgeParagraphViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityParagraphLabel"];
}

@end