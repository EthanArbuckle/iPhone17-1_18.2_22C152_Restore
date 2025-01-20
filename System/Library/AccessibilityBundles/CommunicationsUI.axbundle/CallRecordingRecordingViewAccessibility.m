@interface CallRecordingRecordingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateLabels;
- (void)layoutSubviews;
@end

@implementation CallRecordingRecordingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CommunicationsUI.CallRecordingRecordingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CommunicationsUI.CallRecordingView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CommunicationsUI.CallRecordingView" hasSwiftField:@"$__lazy_storage_$_stopButton" withSwiftType:"UIButton"];
}

- (void)_axUpdateLabels
{
  id v3 = [(CallRecordingRecordingViewAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_stopButton"];
  v2 = accessibilityLocalizedString(@"stop.recording.button");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CallRecordingRecordingViewAccessibility;
  [(CallRecordingRecordingViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CallRecordingRecordingViewAccessibility *)self _axUpdateLabels];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CallRecordingRecordingViewAccessibility;
  [(CallRecordingRecordingViewAccessibility *)&v3 layoutSubviews];
  [(CallRecordingRecordingViewAccessibility *)self _axUpdateLabels];
}

@end