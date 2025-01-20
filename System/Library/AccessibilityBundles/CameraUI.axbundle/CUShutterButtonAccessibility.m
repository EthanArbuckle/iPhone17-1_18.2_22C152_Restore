@interface CUShutterButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CUShutterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CUShutterButton";
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
  return [(CUShutterButtonAccessibility *)self safeBoolForKey:@"_accessibilityViewIsVisible"];
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(CUShutterButtonAccessibility *)self isAccessibilityElement])
  {
    v3 = [(CUShutterButtonAccessibility *)self safeValueForKey:@"mode"];
    unint64_t v4 = [v3 integerValue];

    v5 = @"camera.video.stop.record.button.text";
    v6 = @"camera.video.record.button.text";
    if (v4 == 8) {
      v6 = @"camera.timelapse.stop";
    }
    if (v4 == 3) {
      v6 = @"camera.timelapse.start";
    }
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 6) {
      v5 = v6;
    }
    if (v4 > 8 || ((1 << v4) & 0x1CE) == 0) {
      v8 = @"camera.photo.button.text";
    }
    else {
      v8 = v5;
    }
    v9 = accessibilityCameraKitLocalizedString(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)accessibilityIdentifier
{
  if (accessibilityIdentifier_CheckingAXElement_0) {
    return 0;
  }
  accessibilityIdentifier_CheckingAXElement_0 = 1;
  BOOL v3 = [(CUShutterButtonAccessibility *)self isAccessibilityElement];
  accessibilityIdentifier_CheckingAXElement_0 = 0;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(CUShutterButtonAccessibility *)self safeValueForKey:@"mode"];
  uint64_t v5 = [v4 integerValue];

  if ((unint64_t)(v5 - 1) > 6) {
    return @"PhotoCapture";
  }
  else {
    return off_2650A0378[v5 - 1];
  }
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)CUShutterButtonAccessibility;
  BOOL v2 = [(CUShutterButtonAccessibility *)&v4 accessibilityActivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v2;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CUShutterButtonAccessibility;
  return *MEMORY[0x263F1CF40] | [(CUShutterButtonAccessibility *)&v3 accessibilityTraits];
}

@end