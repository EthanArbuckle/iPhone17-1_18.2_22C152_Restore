@interface ETTranscriptColorWheelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (ETTranscriptColorWheelAccessibility)initWithFrame:(CGRect)a3;
- (double)_accessibilityDifferenceBetweenAngle:(double)a3 andAngle:(double)a4;
- (double)_accessibilityOriginalPickerRotation;
- (void)_accessibilityAdjustColorPickerBy:(double)a3;
- (void)_accessibilityDecrementColorPicker;
- (void)_accessibilityIncrementColorPicker;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetOriginalPickerRotation:(double)a3;
- (void)_accessibilitySpeakPickerColor;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updatePickerPositionForPoint:(CGPoint)a3;
@end

@implementation ETTranscriptColorWheelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETTranscriptColorWheel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityOriginalPickerRotation
{
  MEMORY[0x270F0A440](self, &__ETTranscriptColorWheel___accessibilityOriginalPickerRotation);
  return result;
}

- (void)_accessibilitySetOriginalPickerRotation:(double)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETTranscriptColorWheel" isKindOfClass:@"DTSColorWheel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETTranscriptColorWheel", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"pickerRotation", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"pickerCircle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"colorWheelRadius", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"gradientWidth", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"updatePickerPositionForPoint:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"touchesBegan: withEvent:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"touchesEnded: withEvent:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DTSColorWheel", @"touchesCancelled: withEvent:", "v", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptColorWheelAccessibility;
  [(ETTranscriptColorWheelAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ETTranscriptColorWheelAccessibility *)self safeValueForKey:@"pickerCircle"];
  [v3 setAccessibilityIdentifier:@"digital.touch.picker.circle.identifier"];
}

- (ETTranscriptColorWheelAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ETTranscriptColorWheelAccessibility;
  id v3 = -[ETTranscriptColorWheelAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(ETTranscriptColorWheelAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)updatePickerPositionForPoint:(CGPoint)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ETTranscriptColorWheelAccessibility;
  -[ETTranscriptColorWheelAccessibility updatePickerPositionForPoint:](&v11, sel_updatePickerPositionForPoint_, a3.x, a3.y);
  objc_super v4 = [(ETTranscriptColorWheelAccessibility *)self safeValueForKey:@"pickerCircle"];
  [(ETTranscriptColorWheelAccessibility *)self _accessibilityOriginalPickerRotation];
  if (v5 > 0.0)
  {
    [(ETTranscriptColorWheelAccessibility *)self safeCGFloatForKey:@"pickerRotation"];
    double v7 = v6;
    [(ETTranscriptColorWheelAccessibility *)self _accessibilityOriginalPickerRotation];
    [(ETTranscriptColorWheelAccessibility *)self _accessibilityDifferenceBetweenAngle:v7 andAngle:v8];
    if (fabs(v9) >= 0.104719755)
    {
      [(ETTranscriptColorWheelAccessibility *)self _accessibilitySpeakPickerColor];
      [(ETTranscriptColorWheelAccessibility *)self _accessibilitySetOriginalPickerRotation:v7];
    }
  }
  objc_opt_class();
  v10 = __UIAccessibilityCastAsClass();
  if ([v10 _accessibilityViewIsVisible]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ETTranscriptColorWheelAccessibility *)self safeCGFloatForKey:@"pickerRotation"];
  -[ETTranscriptColorWheelAccessibility _accessibilitySetOriginalPickerRotation:](self, "_accessibilitySetOriginalPickerRotation:");
  v8.receiver = self;
  v8.super_class = (Class)ETTranscriptColorWheelAccessibility;
  [(ETTranscriptColorWheelAccessibility *)&v8 touchesBegan:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptColorWheelAccessibility;
  [(ETTranscriptColorWheelAccessibility *)&v5 touchesEnded:a3 withEvent:a4];
  [(ETTranscriptColorWheelAccessibility *)self _accessibilitySetOriginalPickerRotation:-1.0];
  [(ETTranscriptColorWheelAccessibility *)self _accessibilitySpeakPickerColor];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptColorWheelAccessibility;
  [(ETTranscriptColorWheelAccessibility *)&v5 touchesCancelled:a3 withEvent:a4];
  [(ETTranscriptColorWheelAccessibility *)self _accessibilitySetOriginalPickerRotation:-1.0];
  [(ETTranscriptColorWheelAccessibility *)self _accessibilitySpeakPickerColor];
}

- (void)_accessibilityIncrementColorPicker
{
}

- (void)_accessibilityDecrementColorPicker
{
}

- (void)_accessibilityAdjustColorPickerBy:(double)a3
{
  [(ETTranscriptColorWheelAccessibility *)self safeCGFloatForKey:@"pickerRotation"];
  double v6 = v5 + a3;
  [(ETTranscriptColorWheelAccessibility *)self safeCGFloatForKey:@"colorWheelRadius"];
  double v8 = v7;
  [(ETTranscriptColorWheelAccessibility *)self safeCGFloatForKey:@"gradientWidth"];
  double v10 = v8 - v9 * 0.5;
  objc_super v11 = [(ETTranscriptColorWheelAccessibility *)self safeValueForKey:@"bounds"];
  [v11 CGRectValue];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  double v20 = CGRectGetWidth(v24) * 0.5;
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  double v21 = CGRectGetHeight(v25) * 0.5;
  __double2 v22 = __sincos_stret(v6);

  -[ETTranscriptColorWheelAccessibility updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:", v20 + v10 * v22.__cosval, v21 + v10 * v22.__sinval);
}

- (double)_accessibilityDifferenceBetweenAngle:(double)a3 andAngle:(double)a4
{
  return fmod(a3 - a4 + 3.14159265, 6.28318531) + -3.14159265;
}

- (void)_accessibilitySpeakPickerColor
{
  id v4 = [(ETTranscriptColorWheelAccessibility *)self safeValueForKey:@"pickerCircle"];
  v2 = [v4 safeValueForKey:@"backgroundColor"];
  id v3 = [v2 axColorStringForSpeaking];
  UIAccessibilitySpeak();
}

@end