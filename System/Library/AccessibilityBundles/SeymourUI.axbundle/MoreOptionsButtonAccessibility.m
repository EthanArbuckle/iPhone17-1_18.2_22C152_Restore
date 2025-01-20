@interface MoreOptionsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MoreOptionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.MoreOptionsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"more.button");
}

@end