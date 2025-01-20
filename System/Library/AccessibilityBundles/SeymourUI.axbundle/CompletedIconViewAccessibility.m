@interface CompletedIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CompletedIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.CompletedIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"completed.icon");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end