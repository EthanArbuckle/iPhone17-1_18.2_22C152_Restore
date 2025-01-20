@interface HealthExperienceUI_CellWithAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axSwitchView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HealthExperienceUI_CellWithAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.CellWithAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (id)accessibilityValue
{
  v3 = [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)self _axSwitchView];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    uint64_t v5 = [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)&v8 accessibilityValue];
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)self _axSwitchView];
  v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 accessibilityTraits];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    id v5 = [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)&v8 accessibilityTraits];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)self _axSwitchView];
  v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HealthExperienceUI_CellWithAccessoryViewAccessibility;
    [(HealthExperienceUI_CellWithAccessoryViewAccessibility *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)_axSwitchView
{
  uint64_t v3 = objc_opt_class();

  return (id)[(HealthExperienceUI_CellWithAccessoryViewAccessibility *)self _accessibilityDescendantOfType:v3];
}

@end