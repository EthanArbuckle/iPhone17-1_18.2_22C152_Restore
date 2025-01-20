@interface SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_createIconViewForSuggestion:(id)a3;
@end

@implementation SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherAppSuggestionBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_createIconViewForSuggestion:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility;
  [(SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility *)&v4 _createIconViewForSuggestion:a3];
  [(SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility *)self safeUIViewForKey:@"_iconView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end