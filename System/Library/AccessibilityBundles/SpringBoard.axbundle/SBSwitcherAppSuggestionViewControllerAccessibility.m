@interface SBSwitcherAppSuggestionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3;
@end

@implementation SBSwitcherAppSuggestionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherAppSuggestionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherAppSuggestionViewController", @"_animateOutAndRemoveCurrentBottomBannerWithCompletion:", "v", "@?", 0);
  [v3 validateClass:@"SBSwitcherAppSuggestionViewController" hasInstanceVariable:@"_bannerView" withType:"SBSwitcherAppSuggestionBannerView"];
}

- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SBSwitcherAppSuggestionViewControllerAccessibility *)self safeUIViewForKey:@"_bannerView"];
  int v6 = [v5 _accessibilityViewIsVisible];

  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherAppSuggestionViewControllerAccessibility;
  [(SBSwitcherAppSuggestionViewControllerAccessibility *)&v8 _animateOutAndRemoveCurrentBottomBannerWithCompletion:v4];

  v7 = [(SBSwitcherAppSuggestionViewControllerAccessibility *)self safeUIViewForKey:@"_bannerView"];
  LODWORD(v4) = [v7 _accessibilityViewIsVisible];

  if (v6 != v4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end