@interface SiriUIAudioRoutePickerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SiriUIAudioRoutePickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIAudioRoutePickerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"assistant.audio.route.label");
}

@end