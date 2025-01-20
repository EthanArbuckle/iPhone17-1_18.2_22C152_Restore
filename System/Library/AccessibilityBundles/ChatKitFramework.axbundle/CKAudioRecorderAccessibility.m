@interface CKAudioRecorderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4;
@end

@implementation CKAudioRecorderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAudioRecorder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], &stru_26F654EE0);
  v7.receiver = self;
  v7.super_class = (Class)CKAudioRecorderAccessibility;
  [(CKAudioRecorderAccessibility *)&v7 startRecordingForRaiseGesture:v5 shouldPlaySound:v4];
}

@end