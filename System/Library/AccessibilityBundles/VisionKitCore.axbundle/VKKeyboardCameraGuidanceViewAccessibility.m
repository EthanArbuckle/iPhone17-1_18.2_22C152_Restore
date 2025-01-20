@interface VKKeyboardCameraGuidanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_reallyShowGuidance;
@end

@implementation VKKeyboardCameraGuidanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKKeyboardCameraGuidanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKKeyboardCameraGuidanceView", @"_reallyShowGuidance", "v", 0);
  [v3 validateClass:@"VKKeyboardCameraGuidanceView" hasInstanceVariable:@"_text" withType:"NSString"];
}

- (void)_reallyShowGuidance
{
  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraGuidanceViewAccessibility;
  [(VKKeyboardCameraGuidanceViewAccessibility *)&v4 _reallyShowGuidance];
  id v3 = [(VKKeyboardCameraGuidanceViewAccessibility *)self safeStringForKey:@"_text"];
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end