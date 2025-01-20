@interface UIColorAccessibility_ElectricTouch_UIKit
+ (Class)safeCategoryBaseClass;
+ (id)axHueNameForValue:(double)a3;
+ (id)safeCategoryTargetClassName;
- (double)axHue;
- (double)axSaturation;
- (id)_axCachedApproximateColorDescription;
- (id)axApproximateColorDescription;
- (id)axColorStringForSpeaking;
- (id)axHueName;
- (id)axLightnessModifier;
- (id)axSaturationModifier;
- (void)_axSetCachedApproximateColorDescription:(id)a3;
@end

@implementation UIColorAccessibility_ElectricTouch_UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIColor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedApproximateColorDescription
{
  return (id)[(UIColorAccessibility_ElectricTouch_UIKit *)self _accessibilityValueForKey:@"kAXCachedApproximateColorDescription"];
}

- (void)_axSetCachedApproximateColorDescription:(id)a3
{
}

- (double)axHue
{
  double v3 = 0.0;
  [(UIColorAccessibility_ElectricTouch_UIKit *)self getHue:&v3 saturation:0 brightness:0 alpha:0];
  return v3;
}

- (double)axSaturation
{
  double v3 = 0.0;
  [(UIColorAccessibility_ElectricTouch_UIKit *)self getHue:0 saturation:&v3 brightness:0 alpha:0];
  return v3;
}

- (id)axApproximateColorDescription
{
  double v3 = [(UIColorAccessibility_ElectricTouch_UIKit *)self _axCachedApproximateColorDescription];
  if (!v3)
  {
    [(UIColorAccessibility_ElectricTouch_UIKit *)self axHue];
    double v5 = v4;
    [(UIColorAccessibility_ElectricTouch_UIKit *)self axSaturation];
    double v7 = v6;
    [(UIColorAccessibility_ElectricTouch_UIKit *)self axLuminance];
    double v9 = v8;
    if (v8 <= 0.99000001)
    {
      if (v8 >= 0.00999999978)
      {
        if (v7 >= 0.0500000007)
        {
          v16 = NSString;
          v17 = accessibilityLocalizedString(@"color.format.lightness.saturation.hue");
          v18 = [(UIColorAccessibility_ElectricTouch_UIKit *)self axLightnessModifier];
          v19 = [(UIColorAccessibility_ElectricTouch_UIKit *)self axSaturationModifier];
          if (v5 <= 0.0560000017 || v5 >= 0.111000001 || v9 >= 0.430000007)
          {
            uint64_t v20 = [(UIColorAccessibility_ElectricTouch_UIKit *)self axHueName];
          }
          else
          {
            uint64_t v20 = accessibilityLocalizedString(@"color.brown");
          }
          v21 = (void *)v20;
          double v3 = objc_msgSend(v16, "stringWithFormat:", v17, v18, v19, v20);
        }
        else
        {
          v12 = NSString;
          v13 = accessibilityLocalizedString(@"color.format.lightness.hue");
          v14 = [(UIColorAccessibility_ElectricTouch_UIKit *)self axLightnessModifier];
          v15 = accessibilityLocalizedString(@"color.gray");
          double v3 = objc_msgSend(v12, "stringWithFormat:", v13, v14, v15);
        }
        goto LABEL_7;
      }
      v10 = @"color.black";
    }
    else
    {
      v10 = @"color.white";
    }
    double v3 = accessibilityLocalizedString(v10);
LABEL_7:
    [(UIColorAccessibility_ElectricTouch_UIKit *)self _axSetCachedApproximateColorDescription:v3];
  }

  return v3;
}

- (id)axHueName
{
  double v3 = objc_opt_class();
  [(UIColorAccessibility_ElectricTouch_UIKit *)self axHue];

  return (id)objc_msgSend(v3, "axHueNameForValue:");
}

- (id)axLightnessModifier
{
  [(UIColorAccessibility_ElectricTouch_UIKit *)self axLuminance];
  if (v2 < 0.349999994)
  {
    double v3 = @"color.lightness.low";
LABEL_5:
    accessibilityLocalizedString(v3);
    double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v2 > 0.850000024)
  {
    double v3 = @"color.lightness.high";
    goto LABEL_5;
  }
  double v4 = &stru_26F68FB90;
LABEL_7:

  return v4;
}

- (id)axSaturationModifier
{
  [(UIColorAccessibility_ElectricTouch_UIKit *)self axSaturation];
  if (v3 < 0.200000003)
  {
    double v4 = @"color.saturation.low";
LABEL_6:
    accessibilityLocalizedString(v4);
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v3 > 0.899999976)
  {
    [(UIColorAccessibility_ElectricTouch_UIKit *)self axLuminance];
    if (v5 > 0.699999988)
    {
      double v4 = @"color.saturation.high";
      goto LABEL_6;
    }
  }
  double v6 = &stru_26F68FB90;
LABEL_8:

  return v6;
}

+ (id)axHueNameForValue:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    _AXAssert();
    double v4 = 0;
    goto LABEL_40;
  }
  if (a3 >= 0.0280000009)
  {
    if (a3 < 0.0560000017)
    {
      double v5 = @"color.hue.red.orange";
      goto LABEL_39;
    }
    if (a3 < 0.111000001)
    {
      double v5 = @"color.hue.orange";
      goto LABEL_39;
    }
    if (a3 < 0.128999993)
    {
      double v5 = @"color.hue.orange.yellow";
      goto LABEL_39;
    }
    if (a3 < 0.166999996)
    {
      double v5 = @"color.hue.yellow";
      goto LABEL_39;
    }
    if (a3 < 0.222000003)
    {
      double v5 = @"color.hue.yellow.green";
      goto LABEL_39;
    }
    if (a3 < 0.388999999)
    {
      double v5 = @"color.hue.green";
      goto LABEL_39;
    }
    if (a3 < 0.469000012)
    {
      double v5 = @"color.hue.green.cyan";
      goto LABEL_39;
    }
    if (a3 < 0.540000021)
    {
      double v5 = @"color.hue.cyan";
      goto LABEL_39;
    }
    if (a3 < 0.611000001)
    {
      double v5 = @"color.hue.cyan.blue";
      goto LABEL_39;
    }
    if (a3 < 0.666999996)
    {
      double v5 = @"color.hue.blue";
      goto LABEL_39;
    }
    if (a3 < 0.800000012)
    {
      double v5 = @"color.hue.blue.magenta";
      goto LABEL_39;
    }
    if (a3 < 0.888999999)
    {
      double v5 = @"color.hue.magenta";
      goto LABEL_39;
    }
    if (a3 < 0.916999996)
    {
      double v5 = @"color.hue.magenta.pink";
      goto LABEL_39;
    }
    if (a3 < 0.958000004)
    {
      double v5 = @"color.hue.pink";
      goto LABEL_39;
    }
    if (a3 < 0.986000001)
    {
      double v5 = @"color.hue.pink.red";
      goto LABEL_39;
    }
  }
  double v5 = @"color.hue.red";
LABEL_39:
  double v4 = accessibilityLocalizedString(v5);
LABEL_40:

  return v4;
}

- (id)axColorStringForSpeaking
{
  [(UIColorAccessibility_ElectricTouch_UIKit *)self axLuminance];
  double v3 = NSString;
  double v4 = [(UIColorAccessibility_ElectricTouch_UIKit *)self axApproximateColorDescription];
  double v5 = AXFormatInteger();
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end