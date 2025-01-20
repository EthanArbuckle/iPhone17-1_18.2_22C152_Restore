@interface HFCameraClipPlayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)seekToOffset:(double)a3 inItem:(id)a4;
@end

@implementation HFCameraClipPlayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HFCameraClipPlayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)seekToOffset:(double)a3 inItem:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HFCameraClipPlayerAccessibility;
  [(HFCameraClipPlayerAccessibility *)&v7 seekToOffset:a4 inItem:a3];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    v5 = [(HFCameraClipPlayerAccessibility *)self delegate];
    v6 = __UIAccessibilityCastAsClass();
    [v6 pause];
  }
}

@end