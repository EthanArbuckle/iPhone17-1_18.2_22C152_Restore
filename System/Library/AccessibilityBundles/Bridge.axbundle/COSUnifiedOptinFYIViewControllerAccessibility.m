@interface COSUnifiedOptinFYIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityLabelForWatchView;
@end

@implementation COSUnifiedOptinFYIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSUnifiedOptinFYIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(@"watch.picture.field.of.icons");
}

@end