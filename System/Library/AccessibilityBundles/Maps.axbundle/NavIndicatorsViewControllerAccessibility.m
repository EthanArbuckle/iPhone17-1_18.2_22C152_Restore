@interface NavIndicatorsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_pressedViewOverview;
- (void)_pressedViewTbT;
@end

@implementation NavIndicatorsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavIndicatorsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavIndicatorsViewController", @"_pressedViewOverview", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavIndicatorsViewController", @"_pressedViewTbT", "v", 0);
}

- (void)_pressedViewOverview
{
  v3.receiver = self;
  v3.super_class = (Class)NavIndicatorsViewControllerAccessibility;
  [(NavIndicatorsViewControllerAccessibility *)&v3 _pressedViewOverview];
  v2 = AXMapsLocString(@"navigation.overview.announcement");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)_pressedViewTbT
{
  v3.receiver = self;
  v3.super_class = (Class)NavIndicatorsViewControllerAccessibility;
  [(NavIndicatorsViewControllerAccessibility *)&v3 _pressedViewTbT];
  v2 = AXMapsLocString(@"navigation.turnbyturn.announcement");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end