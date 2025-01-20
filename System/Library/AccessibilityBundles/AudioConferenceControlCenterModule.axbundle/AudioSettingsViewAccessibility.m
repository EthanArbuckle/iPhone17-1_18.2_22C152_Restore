@interface AudioSettingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation AudioSettingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AudioConferenceControlCenterModule.AudioSettingsView";
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
  return accessibilityLocalizedString(@"audio.control.center.container.label");
}

@end