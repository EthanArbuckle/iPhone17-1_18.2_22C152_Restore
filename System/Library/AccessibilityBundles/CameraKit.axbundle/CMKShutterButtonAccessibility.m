@interface CMKShutterButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation CMKShutterButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CMKShutterButton";
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
  return [(CMKShutterButtonAccessibility *)self safeBoolForKey:@"_accessibilityViewIsVisible"];
}

- (id)accessibilityLabel
{
  if ([(CMKShutterButtonAccessibility *)self isAccessibilityElement])
  {
    v3 = [(CMKShutterButtonAccessibility *)self safeValueForKey:@"buttonMode"];
    unint64_t v4 = [v3 integerValue];

    v5 = @"camera.video.stop.record.button.text";
    v6 = @"camera.video.record.button.text";
    if (v4 == 7) {
      v6 = @"camera.timelapse.stop";
    }
    if (v4 == 3) {
      v6 = @"camera.timelapse.start";
    }
    if (v4 - 5 >= 2) {
      v5 = v6;
    }
    if (v4 > 7 || ((1 << v4) & 0xEE) == 0) {
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
  if (accessibilityIdentifier_CheckingAXElement) {
    return 0;
  }
  accessibilityIdentifier_CheckingAXElement = 1;
  BOOL v3 = [(CMKShutterButtonAccessibility *)self isAccessibilityElement];
  accessibilityIdentifier_CheckingAXElement = 0;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(CMKShutterButtonAccessibility *)self safeValueForKey:@"buttonMode"];
  uint64_t v5 = [v4 integerValue];

  v6 = @"PhotoCapture";
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 2) {
    v6 = @"SlomoCapture";
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return @"VideoCapture";
  }
  else {
    return v6;
  }
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)CMKShutterButtonAccessibility;
  BOOL v2 = [(CMKShutterButtonAccessibility *)&v4 accessibilityActivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v2;
}

@end