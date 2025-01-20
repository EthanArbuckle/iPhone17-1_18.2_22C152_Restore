@interface HUTimerCancelButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation HUTimerCancelButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTimerCancelButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityHomeUILocalizedString(@"cancel.timer");
}

@end