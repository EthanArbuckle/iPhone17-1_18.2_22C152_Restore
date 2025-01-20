@interface CKAudioMessageRecordingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKAudioMessageRecordingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAudioMessageRecordingView";
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
  v6.receiver = self;
  v6.super_class = (Class)CKAudioMessageRecordingViewAccessibility;
  [(CKAudioMessageRecordingViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKAudioMessageRecordingViewAccessibility *)self safeSwiftValueForKey:@"sendButton"];
  [v3 setAccessibilityIdentifier:@"sendButton"];
  v4 = accessibilityLocalizedString(@"send.button.text");
  [v3 setAccessibilityLabel:v4];

  v5 = accessibilityLocalizedString(@"send.message.button.hint.imessage");
  [v3 _accessibilitySetElementHelp:v5];
}

@end