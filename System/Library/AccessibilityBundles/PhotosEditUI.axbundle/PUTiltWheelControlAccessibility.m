@interface PUTiltWheelControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGAffineTransform)_transformForTiltAngle:(SEL)a3;
- (double)_axDegreesToRadians:(double)a3;
- (double)_axRadiansToDegrees:(double)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PUTiltWheelControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUTiltWheelControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTiltWheelControl", @"tiltAngle", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTiltWheelControl", @"maxTiltAngle", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTiltWheelControl", @"minTiltAngle", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTiltWheelControl", @"_setTiltAngleFromUserInteraction:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTiltWheelControl", @"_transformForTiltAngle:", "{CGAffineTransform=dddddd}", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityLabel
{
  return accessibilityPhotosEditUILocalizedString(@"tilt.wheel.control");
}

- (id)accessibilityValue
{
  id v3 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"tiltAngle"];
  [v3 floatValue];
  [(PUTiltWheelControlAccessibility *)self _axRadiansToDegrees:v4];

  v5 = NSString;
  v6 = accessibilityPhotosEditUILocalizedString(@"tilt.degrees");
  v7 = AXFormatFloat();
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  return v8;
}

- (void)accessibilityIncrement
{
  id v3 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"tiltAngle"];
  [v3 floatValue];

  float v4 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"maxTiltAngle"];
  [v4 floatValue];

  AXPerformSafeBlock();
}

uint64_t __57__PUTiltWheelControlAccessibility_accessibilityIncrement__block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 40);
  if (v1 < *(double *)(result + 48)) {
    return [*(id *)(result + 32) _setTiltAngleFromUserInteraction:v1 + 0.0174532925];
  }
  return result;
}

- (void)accessibilityDecrement
{
  id v3 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"tiltAngle"];
  [v3 floatValue];

  float v4 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"minTiltAngle"];
  [v4 floatValue];

  AXPerformSafeBlock();
}

uint64_t __57__PUTiltWheelControlAccessibility_accessibilityDecrement__block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 40);
  if (v1 > *(double *)(result + 48)) {
    return [*(id *)(result + 32) _setTiltAngleFromUserInteraction:v1 + -0.0174532925];
  }
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)PUTiltWheelControlAccessibility;
    return -[PUTiltWheelControlAccessibility accessibilityScroll:](&v23, sel_accessibilityScroll_);
  }
  if (a3 == 3)
  {
    v14 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"tiltAngle"];
    [v14 floatValue];
    double v16 = v15;

    [(PUTiltWheelControlAccessibility *)self _axRadiansToDegrees:v16];
    uint64_t v18 = v17;
    v19 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"minTiltAngle"];
    [v19 floatValue];
    double v21 = v20;

    [(PUTiltWheelControlAccessibility *)self _axRadiansToDegrees:v21];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke_2;
    v27 = &unk_2650A54B8;
    uint64_t v29 = v18;
    uint64_t v30 = v22;
    double v31 = v16;
    v28 = self;
    goto LABEL_7;
  }
  if (a3 == 4)
  {
    float v4 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"tiltAngle"];
    [v4 floatValue];
    double v6 = v5;

    [(PUTiltWheelControlAccessibility *)self _axRadiansToDegrees:v6];
    uint64_t v8 = v7;
    v9 = [(PUTiltWheelControlAccessibility *)self safeValueForKey:@"maxTiltAngle"];
    [v9 floatValue];
    double v11 = v10;

    [(PUTiltWheelControlAccessibility *)self _axRadiansToDegrees:v11];
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke;
    v35 = &unk_2650A54B8;
    uint64_t v37 = v8;
    uint64_t v38 = v12;
    double v39 = v6;
    v36 = self;
LABEL_7:
    AXPerformSafeBlock();
  }
  return 1;
}

void __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  if ((int)*(double *)(a1 + 40) < (int)*(double *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) _axDegreesToRadians:5.0];
    double v4 = v2 + v3;
    [*(id *)(a1 + 32) _axRadiansToDegrees:*(double *)(a1 + 56)];
    double v6 = v5 + 5.0;
    [*(id *)(a1 + 32) _setTiltAngleFromUserInteraction:v4];
    if ((int)v6 <= (int)*(double *)(a1 + 48))
    {
      uint64_t v7 = NSString;
      uint64_t v8 = accessibilityPhotosEditUILocalizedString(@"tilt.degrees");
      v9 = AXFormatFloat();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      id argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    }
  }
}

void __55__PUTiltWheelControlAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  if ((int)*(double *)(a1 + 40) > (int)*(double *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) _axDegreesToRadians:5.0];
    double v4 = v2 - v3;
    [*(id *)(a1 + 32) _axRadiansToDegrees:*(double *)(a1 + 56)];
    double v6 = v5 + -5.0;
    [*(id *)(a1 + 32) _setTiltAngleFromUserInteraction:v4];
    if ((int)v6 >= (int)*(double *)(a1 + 48))
    {
      uint64_t v7 = NSString;
      uint64_t v8 = accessibilityPhotosEditUILocalizedString(@"tilt.degrees");
      v9 = AXFormatFloat();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      id argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    }
  }
}

- (CGAffineTransform)_transformForTiltAngle:(SEL)a3
{
  -[PUTiltWheelControlAccessibility _axRadiansToDegrees:](self, "_axRadiansToDegrees:");
  double v7 = v6;
  uint64_t v8 = NSString;
  v9 = accessibilityPhotosEditUILocalizedString(@"tilt.degrees");
  float v10 = AXFormatFloat();
  double v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

  uint64_t v12 = [MEMORY[0x263F21660] axAttributedStringWithString:v11];
  [v12 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
  id v13 = v12;
  if ((-286331153 * (int)v7 + 143165576) <= 0x11111110)
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&_transformForTiltAngle__LastSend > 0.5) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
    }
    _transformForTiltAngle__LastSend = CFAbsoluteTimeGetCurrent();
  }
  v15.receiver = self;
  v15.super_class = (Class)PUTiltWheelControlAccessibility;
  [(CGAffineTransform *)&v15 _transformForTiltAngle:a4];

  return result;
}

- (double)_axRadiansToDegrees:(double)a3
{
  return a3 * 180.0 / 3.14159265;
}

- (double)_axDegreesToRadians:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

@end