@interface HUCameraMicrophoneControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsTalking;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUCameraMicrophoneControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCameraMicrophoneControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_axIsTalking
{
  return [(HUCameraMicrophoneControlAccessibility *)self safeBoolForKey:@"isTalking"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HUCameraMicrophoneControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HUCameraMicrophoneControlAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  if ([(HUCameraMicrophoneControlAccessibility *)self _axIsTalking]) {
    v2 = @"camera.done.button";
  }
  else {
    v2 = @"camera.talk.button";
  }

  return accessibilityHomeUILocalizedString(v2);
}

- (id)accessibilityHint
{
  if ([(HUCameraMicrophoneControlAccessibility *)self _axIsTalking]) {
    v2 = @"camera.done.button.hint";
  }
  else {
    v2 = @"camera.talk.button.hint";
  }

  return accessibilityHomeUILocalizedString(v2);
}

@end