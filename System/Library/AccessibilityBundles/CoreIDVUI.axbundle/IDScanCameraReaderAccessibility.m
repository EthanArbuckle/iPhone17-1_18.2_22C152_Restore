@interface IDScanCameraReaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (void)timerAction;
@end

@implementation IDScanCameraReaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVUI.IDScanCameraReader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)timerAction
{
  v3.receiver = self;
  v3.super_class = (Class)IDScanCameraReaderAccessibility;
  [(IDScanCameraReaderAccessibility *)&v3 timerAction];
  v2 = accessibilityLocalizedString(@"fallback.image.capture.occurred");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"id.scanner.hint");
}

@end