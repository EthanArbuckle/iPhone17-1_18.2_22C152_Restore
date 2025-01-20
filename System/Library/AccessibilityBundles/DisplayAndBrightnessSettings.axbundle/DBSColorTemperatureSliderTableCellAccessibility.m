@interface DBSColorTemperatureSliderTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation DBSColorTemperatureSliderTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSColorTemperatureSliderTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"ScreenColorTemperature");
}

- (id)accessibilityValue
{
  v3 = [(DBSColorTemperatureSliderTableCellAccessibility *)self _accessibilityAbsoluteValue];
  [v3 doubleValue];
  double v5 = fabs(v4 + -0.5);
  if (v5 < 0.15)
  {
    v6 = @"screen.color.midpoint";
LABEL_11:
    v7 = accessibilityLocalizedString(v6);
    goto LABEL_12;
  }
  if (fabs(v4 + -0.25) < 0.15)
  {
    v6 = @"screen.color.cooler";
    goto LABEL_11;
  }
  if (fabs(v4) < 0.15)
  {
    v6 = @"screen.color.coolest";
    goto LABEL_11;
  }
  if (fabs(v4 + -0.75) < 0.15)
  {
    v6 = @"screen.color.warmer";
    goto LABEL_11;
  }
  if (v5 < 1.0)
  {
    v6 = @"screen.color.warmest";
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)DBSColorTemperatureSliderTableCellAccessibility;
  v10 = [(DBSColorTemperatureSliderTableCellAccessibility *)&v11 accessibilityValue];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end