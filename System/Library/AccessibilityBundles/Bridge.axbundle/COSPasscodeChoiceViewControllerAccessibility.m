@interface COSPasscodeChoiceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityLabelForWatchView;
@end

@implementation COSPasscodeChoiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSPasscodeChoiceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityLabelForWatchView
{
  return accessibilityLocalizedString(@"watch.picture.passcode.four.digit");
}

@end