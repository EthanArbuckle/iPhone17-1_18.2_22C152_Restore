@interface UIColor(PKAccessibility)
+ (id)pkaxHueNameForValue:()PKAccessibility;
- (__CFString)pkaxLightnessModifier;
- (__CFString)pkaxSaturationModifier;
- (double)pkaxHue;
- (double)pkaxLuma;
- (double)pkaxSaturation;
- (id)_pkaxColorDescriptionForHue:()PKAccessibility saturation:lightness:;
- (id)_pkaxLightnessHueFormatString;
- (id)_pkaxLightnessSaturationHueFormatString;
- (id)_pkaxSaturationHueFormatString;
- (id)pkaxApproximateColorDescription;
- (id)pkaxDescriptionWithLuma;
- (uint64_t)pkaxHueName;
@end

@implementation UIColor(PKAccessibility)

- (double)pkaxHue
{
  double v2 = 0.0;
  [a1 getHue:&v2 saturation:0 brightness:0 alpha:0];
  return v2;
}

- (double)pkaxSaturation
{
  double v2 = 0.0;
  [a1 getHue:0 saturation:&v2 brightness:0 alpha:0];
  return v2;
}

- (double)pkaxLuma
{
  double v5 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v2 = 0.0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  double result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (id)pkaxApproximateColorDescription
{
  double v2 = [a1 _pkaxCachedApproximateColorDescription];
  if (!v2)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    objc_msgSend(a1, "pkaxLuma", 0, 0);
    double v4 = v3;
    [a1 getHue:&v19 saturation:&v18 brightness:&v17 alpha:&v16];
    if (v4 > 0.99000001)
    {
      double v5 = _PencilKitBundle();
      v6 = v5;
      v7 = @"white";
LABEL_6:
      double v2 = [v5 localizedStringForKey:v7 value:v7 table:@"Localizable"];
LABEL_16:

      [a1 _pkaxSetCachedApproximateColorDescription:v2];
      goto LABEL_17;
    }
    if (v4 < 0.00999999978)
    {
      double v5 = _PencilKitBundle();
      v6 = v5;
      v7 = @"black";
      goto LABEL_6;
    }
    if (v18 >= 0.0500000007)
    {
      double v13 = v19;
      if (v19 > 0.0560000017 && v19 < 0.111000001)
      {
        double v13 = 0.430000007;
        if (v4 < 0.430000007)
        {
          v6 = _PencilKitBundle();
          v8 = [v6 localizedStringForKey:@"brown" value:@"brown" table:@"Localizable"];
          v9 = [a1 pkaxSaturationModifier];
          v14 = [a1 pkaxLightnessModifier];
          double v2 = [a1 _pkaxColorDescriptionForHue:v8 saturation:v9 lightness:v14];

LABEL_15:
          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(a1, "pkaxHueName", v13);
      v8 = [a1 pkaxSaturationModifier];
      v9 = [a1 pkaxLightnessModifier];
      v10 = a1;
      v11 = v6;
      v12 = v8;
    }
    else
    {
      v6 = _PencilKitBundle();
      v8 = [v6 localizedStringForKey:@"gray" value:@"gray" table:@"Localizable"];
      v9 = [a1 pkaxLightnessModifier];
      v10 = a1;
      v11 = v8;
      v12 = 0;
    }
    double v2 = [v10 _pkaxColorDescriptionForHue:v11 saturation:v12 lightness:v9];
    goto LABEL_15;
  }
LABEL_17:

  return v2;
}

- (uint64_t)pkaxHueName
{
  double v2 = objc_opt_class();
  [a1 pkaxHue];

  return objc_msgSend(v2, "pkaxHueNameForValue:");
}

- (__CFString)pkaxLightnessModifier
{
  [a1 pkaxLuma];
  if (v1 < 0.349999994)
  {
    double v2 = _PencilKitBundle();
    double v3 = v2;
    double v4 = @"dark shade";
    double v5 = @"dark";
LABEL_5:
    v6 = [v2 localizedStringForKey:v4 value:v5 table:@"Localizable"];

    goto LABEL_7;
  }
  if (v1 > 0.850000024)
  {
    double v2 = _PencilKitBundle();
    double v3 = v2;
    double v4 = @"light shade";
    double v5 = @"light";
    goto LABEL_5;
  }
  v6 = &stru_1F1FB2C00;
LABEL_7:

  return v6;
}

- (__CFString)pkaxSaturationModifier
{
  [a1 pkaxSaturation];
  if (v2 < 0.200000003)
  {
    double v3 = _PencilKitBundle();
    double v4 = v3;
    double v5 = @"grayish";
LABEL_6:
    v7 = [v3 localizedStringForKey:v5 value:v5 table:@"Localizable"];

    goto LABEL_8;
  }
  if (v2 > 0.899999976)
  {
    [a1 pkaxLuma];
    if (v6 > 0.699999988)
    {
      double v3 = _PencilKitBundle();
      double v4 = v3;
      double v5 = @"vibrant";
      goto LABEL_6;
    }
  }
  v7 = &stru_1F1FB2C00;
LABEL_8:

  return v7;
}

+ (id)pkaxHueNameForValue:()PKAccessibility
{
  if (a1 < 0.0 || a1 > 1.0)
  {
    double v2 = 0;
  }
  else
  {
    if (a1 >= 0.0280000009)
    {
      if (a1 >= 0.0560000017)
      {
        if (a1 >= 0.111000001)
        {
          if (a1 >= 0.128999993)
          {
            if (a1 >= 0.166999996)
            {
              if (a1 >= 0.222000003)
              {
                if (a1 >= 0.388999999)
                {
                  if (a1 >= 0.469000012)
                  {
                    if (a1 >= 0.540000021)
                    {
                      if (a1 >= 0.611000001)
                      {
                        if (a1 >= 0.666999996)
                        {
                          if (a1 >= 0.800000012)
                          {
                            if (a1 >= 0.888999999)
                            {
                              if (a1 >= 0.916999996)
                              {
                                if (a1 >= 0.958000004)
                                {
                                  double v3 = _PencilKitBundle();
                                  double v4 = v3;
                                  if (a1 >= 0.986000001)
                                  {
                                    double v5 = @"red hue";
                                    double v6 = @"red";
                                  }
                                  else
                                  {
                                    double v5 = @"pink red hue";
                                    double v6 = @"pink red";
                                  }
                                }
                                else
                                {
                                  double v3 = _PencilKitBundle();
                                  double v4 = v3;
                                  double v5 = @"pink hue";
                                  double v6 = @"pink";
                                }
                              }
                              else
                              {
                                double v3 = _PencilKitBundle();
                                double v4 = v3;
                                double v5 = @"magenta pink hue";
                                double v6 = @"magenta pink";
                              }
                            }
                            else
                            {
                              double v3 = _PencilKitBundle();
                              double v4 = v3;
                              double v5 = @"magenta hue";
                              double v6 = @"magenta";
                            }
                          }
                          else
                          {
                            double v3 = _PencilKitBundle();
                            double v4 = v3;
                            double v5 = @"purple hue";
                            double v6 = @"purple";
                          }
                        }
                        else
                        {
                          double v3 = _PencilKitBundle();
                          double v4 = v3;
                          double v5 = @"blue hue";
                          double v6 = @"blue";
                        }
                      }
                      else
                      {
                        double v3 = _PencilKitBundle();
                        double v4 = v3;
                        double v5 = @"cyan blue hue";
                        double v6 = @"cyan blue";
                      }
                    }
                    else
                    {
                      double v3 = _PencilKitBundle();
                      double v4 = v3;
                      double v5 = @"cyan hue";
                      double v6 = @"cyan";
                    }
                  }
                  else
                  {
                    double v3 = _PencilKitBundle();
                    double v4 = v3;
                    double v5 = @"blue green hue";
                    double v6 = @"blue green";
                  }
                }
                else
                {
                  double v3 = _PencilKitBundle();
                  double v4 = v3;
                  double v5 = @"green hue";
                  double v6 = @"green";
                }
              }
              else
              {
                double v3 = _PencilKitBundle();
                double v4 = v3;
                double v5 = @"yellow green hue";
                double v6 = @"yellow green";
              }
            }
            else
            {
              double v3 = _PencilKitBundle();
              double v4 = v3;
              double v5 = @"yellow hue";
              double v6 = @"yellow";
            }
          }
          else
          {
            double v3 = _PencilKitBundle();
            double v4 = v3;
            double v5 = @"yellow orange hue";
            double v6 = @"yellow orange";
          }
        }
        else
        {
          double v3 = _PencilKitBundle();
          double v4 = v3;
          double v5 = @"orange hue";
          double v6 = @"orange";
        }
      }
      else
      {
        double v3 = _PencilKitBundle();
        double v4 = v3;
        double v5 = @"red orange hue";
        double v6 = @"red orange";
      }
    }
    else
    {
      double v3 = _PencilKitBundle();
      double v4 = v3;
      double v5 = @"red hue";
      double v6 = @"red";
    }
    double v2 = [v3 localizedStringForKey:v5 value:v6 table:@"Localizable"];
  }

  return v2;
}

- (id)pkaxDescriptionWithLuma
{
  [a1 pkaxLuma];
  uint64_t v3 = vcvtad_u64_f64(v2 * 100.0);
  double v4 = NSString;
  double v5 = [a1 pkaxApproximateColorDescription];
  double v6 = PKAccessibilityLocalizedUnsignedInteger(v3);
  v7 = [v4 stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

- (id)_pkaxColorDescriptionForHue:()PKAccessibility saturation:lightness:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 length];
  uint64_t v12 = [v9 length];
  if (v11)
  {
    if (v12)
    {
      double v13 = [a1 _pkaxLightnessSaturationHueFormatString];
      [NSString localizedStringWithValidatedFormat:v13, @"%@%@%@", 0, v10, v9, v8 validFormatSpecifiers error];
LABEL_8:
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    double v13 = [a1 _pkaxLightnessHueFormatString];
    v14 = NSString;
    id v17 = v10;
    id v18 = v8;
LABEL_7:
    [v14 localizedStringWithValidatedFormat:v13, @"%@%@", 0, v17, v18, v19 validFormatSpecifiers error];
    goto LABEL_8;
  }
  if (v12)
  {
    double v13 = [a1 _pkaxSaturationHueFormatString];
    v14 = NSString;
    id v17 = v9;
    id v18 = v8;
    goto LABEL_7;
  }
  id v15 = v8;
LABEL_9:

  return v15;
}

- (id)_pkaxLightnessHueFormatString
{
  v0 = _PencilKitBundle();
  double v1 = [v0 localizedStringForKey:@"ax.color.format.lightness.hue" value:@"%1$@ %2$@" table:@"Localizable"];

  return v1;
}

- (id)_pkaxSaturationHueFormatString
{
  v0 = _PencilKitBundle();
  double v1 = [v0 localizedStringForKey:@"ax.color.format.saturation.hue" value:@"%1$@ %2$@" table:@"Localizable"];

  return v1;
}

- (id)_pkaxLightnessSaturationHueFormatString
{
  v0 = _PencilKitBundle();
  double v1 = [v0 localizedStringForKey:@"ax.color.format.lightness.saturation.hue" value:@"%1$@ %2$@ %3$@" table:@"Localizable"];

  return v1;
}

@end