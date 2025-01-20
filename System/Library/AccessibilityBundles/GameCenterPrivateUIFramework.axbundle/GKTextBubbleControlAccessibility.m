@interface GKTextBubbleControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKTextBubbleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKTextBubbleControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(GKTextBubbleControlAccessibility *)self safeValueForKey:@"text"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end