@interface NowPlayingQueueHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NowPlayingQueueHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.NowPlayingQueueHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3 = [(NowPlayingQueueHeaderViewAccessibility *)self safeSwiftValueForKey:@"clearButton"];
    [v3 setIsAccessibilityElement:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)NowPlayingQueueHeaderViewAccessibility;
  [(NowPlayingQueueHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

@end