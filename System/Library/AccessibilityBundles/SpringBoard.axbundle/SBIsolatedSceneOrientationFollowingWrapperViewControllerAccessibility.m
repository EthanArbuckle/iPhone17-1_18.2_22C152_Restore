@interface SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIsolatedSceneOrientationFollowingWrapperViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(SBIsolatedSceneOrientationFollowingWrapperViewControllerAccessibility *)self safeValueForKey:@"_contentViewController"];
  v4 = [v3 safeUIViewForKey:@"view"];
  v5 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

@end