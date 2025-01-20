@interface SBTitledHomeScreenButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SBTitledHomeScreenButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTitledHomeScreenButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"page.management.focus.options.button");
}

@end