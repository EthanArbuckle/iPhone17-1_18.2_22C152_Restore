@interface MRUActivityNowPlayingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateNowPlayingInfo;
@end

@implementation MRUActivityNowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUActivityNowPlayingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUActivityNowPlayingViewController", @"updateNowPlayingInfo", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowScene", @"systemApertureElementContext", "@", 0);
  [v3 validateProtocol:@"SBUISystemApertureElementContext" hasRequiredInstanceMethod:@"setElementNeedsUpdate"];
  [v3 validateClass:@"MRUActivityNowPlayingViewController" isKindOfClass:@"UIViewController"];
}

- (void)updateNowPlayingInfo
{
  v4.receiver = self;
  v4.super_class = (Class)MRUActivityNowPlayingViewControllerAccessibility;
  [(MRUActivityNowPlayingViewControllerAccessibility *)&v4 updateNowPlayingInfo];
  id v3 = [(MRUActivityNowPlayingViewControllerAccessibility *)self safeValueForKey:@"systemApertureElementContext"];
  [v3 setElementNeedsUpdate];
}

@end