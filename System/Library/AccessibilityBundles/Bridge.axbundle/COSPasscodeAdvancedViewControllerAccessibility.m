@interface COSPasscodeAdvancedViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityLabelForWatchView;
@end

@implementation COSPasscodeAdvancedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSPasscodeAdvancedViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(@"watch.picture.passcode.long");
}

@end