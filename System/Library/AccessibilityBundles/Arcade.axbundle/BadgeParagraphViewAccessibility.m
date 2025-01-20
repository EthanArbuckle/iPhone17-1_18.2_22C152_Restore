@interface BadgeParagraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BadgeParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.BadgeParagraphView";
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
  return (id)[(BadgeParagraphViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityParagraphLabel"];
}

@end