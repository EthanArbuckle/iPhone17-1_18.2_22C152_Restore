@interface ToggleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)accessibilityActivationPoint;
- (id)_axChildSwitch;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ToggleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ToggleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axChildSwitch
{
  uint64_t v3 = objc_opt_class();

  return (id)[(ToggleCellAccessibility *)self _accessibilityDescendantOfType:v3];
}

- (id)accessibilityValue
{
  uint64_t v3 = [(ToggleCellAccessibility *)self _axChildSwitch];

  if (v3)
  {
    v4 = [(ToggleCellAccessibility *)self _axChildSwitch];
    v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ToggleCellAccessibility;
    v5 = [(ToggleCellAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [(ToggleCellAccessibility *)self _axChildSwitch];

  if (v3)
  {
    v4 = [(ToggleCellAccessibility *)self _axChildSwitch];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ToggleCellAccessibility;
    [(ToggleCellAccessibility *)&v11 accessibilityActivationPoint];
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = [(ToggleCellAccessibility *)self _axChildSwitch];

  if (v3)
  {
    v4 = [(ToggleCellAccessibility *)self _axChildSwitch];
    unint64_t v5 = [v4 accessibilityTraits];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ToggleCellAccessibility;
    return [(ToggleCellAccessibility *)&v7 accessibilityTraits];
  }
}

@end