@interface AudioMessageRecordingAppendButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AudioMessageRecordingAppendButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.AudioMessageRecordingAppendButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AudioMessageRecordingAppendButtonAccessibility *)self safeSwiftValueForKey:@"duration"];
  [v2 doubleValue];
  v3 = AXDurationStringForDuration();

  v4 = accessibilityLocalizedString(@"continue.recording");
  v5 = __AXStringForVariables();

  return v5;
}

@end