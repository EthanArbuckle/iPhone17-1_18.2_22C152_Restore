@interface MenuCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axChildSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.MenuCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MenuCell", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MenuCell", @"accessibilityIsDimmed", "B", 0);
}

- (id)_axChildSwitch
{
  uint64_t v3 = objc_opt_class();

  return (id)[(MenuCellAccessibility *)self _accessibilityDescendantOfType:v3];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MenuCellAccessibility *)self safeStringForKey:@"titleText"];
}

- (id)accessibilityValue
{
  uint64_t v3 = [(MenuCellAccessibility *)self _axChildSwitch];

  if (v3)
  {
    v4 = [(MenuCellAccessibility *)self _axChildSwitch];
    v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MenuCellAccessibility;
    v5 = [(MenuCellAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [(MenuCellAccessibility *)self _axChildSwitch];

  if (v3)
  {
    v4 = [(MenuCellAccessibility *)self _axChildSwitch];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MenuCellAccessibility;
    [(MenuCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)MenuCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(MenuCellAccessibility *)&v10 accessibilityTraits];
  v4 = [(MenuCellAccessibility *)self _axChildSwitch];

  uint64_t v5 = *MEMORY[0x263F1CF60];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v3 | v5;
  int v7 = [(MenuCellAccessibility *)self safeBoolForKey:@"accessibilityIsDimmed"];
  uint64_t v8 = *MEMORY[0x263F1CF20];
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v6 | v8;
}

@end