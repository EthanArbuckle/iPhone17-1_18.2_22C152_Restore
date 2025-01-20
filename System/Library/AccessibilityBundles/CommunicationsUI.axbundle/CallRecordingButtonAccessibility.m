@interface CallRecordingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CallRecordingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CommunicationsUI.CallRecordingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"call.recording.button");
}

@end