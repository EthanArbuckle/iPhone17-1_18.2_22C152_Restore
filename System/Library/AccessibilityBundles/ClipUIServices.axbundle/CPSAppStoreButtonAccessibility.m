@interface CPSAppStoreButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CPSAppStoreButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSAppStoreButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"appstore.view.button");
}

@end