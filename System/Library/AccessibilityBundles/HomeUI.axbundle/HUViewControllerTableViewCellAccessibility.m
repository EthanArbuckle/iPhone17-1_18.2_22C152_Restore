@interface HUViewControllerTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityScrollToVisible;
@end

@implementation HUViewControllerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUViewControllerTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollToVisible
{
  return 0;
}

@end