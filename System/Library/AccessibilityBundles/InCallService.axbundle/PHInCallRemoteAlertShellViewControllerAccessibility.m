@interface PHInCallRemoteAlertShellViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldUseWindowBounds;
@end

@implementation PHInCallRemoteAlertShellViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHInCallRemoteAlertShellViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldUseWindowBounds
{
  return 1;
}

@end