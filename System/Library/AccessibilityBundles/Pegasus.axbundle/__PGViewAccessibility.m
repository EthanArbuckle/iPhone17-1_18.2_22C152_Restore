@interface __PGViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation __PGViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"__PGView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"pip.video.background.view.label");
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(__PGViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
}

@end