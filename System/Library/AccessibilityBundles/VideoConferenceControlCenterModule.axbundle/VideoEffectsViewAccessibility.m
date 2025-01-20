@interface VideoEffectsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation VideoEffectsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideoConferenceControlCenterModule.VideoEffectsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"video.control.center.container.label");
}

@end