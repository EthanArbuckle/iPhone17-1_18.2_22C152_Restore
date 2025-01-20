@interface MRUNowPlayingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)_accessibilityNowPlayingLayout;
- (int64_t)accessibilityContainerType;
@end

@implementation MRUNowPlayingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingView";
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
  return accessibilityLocalizedString(@"media.controls.container.label");
}

- (int64_t)accessibilityContainerType
{
  return 4
       * ([(MRUNowPlayingViewAccessibility *)self _accessibilityNowPlayingLayout] == 0);
}

- (int64_t)_accessibilityNowPlayingLayout
{
  return [(MRUNowPlayingViewAccessibility *)self safeIntegerForKey:@"layout"];
}

@end