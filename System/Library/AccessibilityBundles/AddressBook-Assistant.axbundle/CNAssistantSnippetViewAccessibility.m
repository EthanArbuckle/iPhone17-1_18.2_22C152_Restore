@interface CNAssistantSnippetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CNAssistantSnippetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAssistantSnippetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end