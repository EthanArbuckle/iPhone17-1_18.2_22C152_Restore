@interface LevelPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldAnnounce;
- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnounceDegreesIfNeeded:(double)a3;
- (void)_updateOffsetLabel:(double)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LevelPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LevelPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LevelPageViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewWillDisappear:", "v", "B", 0);
  [v3 validateClass:@"LevelPageViewController" hasInstanceVariable:@"_orientation" withType:"q"];
  [v3 validateClass:@"LevelPageViewController" hasInstanceVariable:@"_degreesLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LevelPageViewController", @"_updateOffsetLabel:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LevelPageViewController", @"_updateForRotation: shiftAngle:", "B", "d", "d", 0);
}

- (BOOL)_axShouldAnnounce
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  char v4 = [v3 _accessibilityViewIsVisible];

  return v4;
}

- (void)_axAnnounceDegreesIfNeeded:(double)a3
{
  if (vabdd_f64(*(double *)&_axAnnounceDegreesIfNeeded__LastAnnouncedDegrees, a3) > 1.0
    && CFAbsoluteTimeGetCurrent() - *(double *)&_axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced > 1.0
    && [(LevelPageViewControllerAccessibility *)self _axShouldAnnounce])
  {
    _axAnnounceDegreesIfNeeded__LastAnnouncedDegrees = *(void *)&a3;
    _axAnnounceDegreesIfNeeded__LastTimeLocationWasAnnounced = CFAbsoluteTimeGetCurrent();
    v5 = [(LevelPageViewControllerAccessibility *)self safeValueForKey:@"_degreesLabel"];
    id v6 = [v5 accessibilityLabel];

    UIAccessibilitySpeakIfNotSpeaking();
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)LevelPageViewControllerAccessibility;
  [(LevelPageViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];

  [v3 setAccessibilityIdentifier:@"levelPageView"];
  objc_opt_class();
  char v4 = __UIAccessibilityCastAsClass();
  LODWORD(v2) = [v4 _appearState];

  [(id)*MEMORY[0x263F1D020] _accessibilitySetApplicationOrientation:(v2 - 1) < 2];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  [(LevelPageViewControllerAccessibility *)&v3 viewDidLoad];
  [(LevelPageViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  [(LevelPageViewControllerAccessibility *)&v3 viewWillAppear:a3];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetApplicationOrientation:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LevelPageViewControllerAccessibility;
  [(LevelPageViewControllerAccessibility *)&v3 viewWillDisappear:a3];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetApplicationOrientation:0];
}

- (void)_updateOffsetLabel:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LevelPageViewControllerAccessibility;
  -[LevelPageViewControllerAccessibility _updateOffsetLabel:](&v5, sel__updateOffsetLabel_);
  [(LevelPageViewControllerAccessibility *)self _axAnnounceDegreesIfNeeded:a3];
}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  uint64_t v7 = [(LevelPageViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_orientation"];
  v15.receiver = self;
  v15.super_class = (Class)LevelPageViewControllerAccessibility;
  BOOL v8 = [(LevelPageViewControllerAccessibility *)&v15 _updateForRotation:a3 shiftAngle:a4];
  uint64_t v9 = [(LevelPageViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_orientation"];
  if (v7 != v9)
  {
    uint64_t v10 = v9;
    if ([(LevelPageViewControllerAccessibility *)self _axShouldAnnounce])
    {
      if ((unint64_t)(v10 - 3) >= 2) {
        v11 = @"LEVEL_FACE_UP";
      }
      else {
        v11 = @"LEVEL_HORIZONTAL";
      }
      if ((unint64_t)(v10 - 1) >= 2) {
        v12 = v11;
      }
      else {
        v12 = @"LEVEL_VERTICAL";
      }
      v13 = accessibilityLocalizedString(v12);
      UIAccessibilitySpeakOrQueueIfNeeded();
    }
  }
  return v8;
}

@end