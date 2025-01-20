@interface VOTCustomSliderCell
- (id)accessibilityValue;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)accessibilityIncrementOrDecrement:(BOOL)a3;
@end

@implementation VOTCustomSliderCell

- (id)accessibilityValue
{
  v2 = [(VOTCustomSliderCell *)self specifier];
  v3 = [v2 propertyForKey:@"VOSSettingsItem"];

  v4 = +[VOSSettingsHelper sharedInstance];
  v5 = [v4 valueForSettingsItem:v3];

  v6 = +[VOSSettingsHelper sharedInstance];
  v7 = [v6 formattedValue:v5 withItem:v3];

  return v7;
}

- (void)accessibilityIncrementOrDecrement:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VOTCustomSliderCell *)self specifier];
  v6 = [v5 propertyForKey:@"VOSSettingsItem"];

  v7 = [(VOTCustomSliderCell *)self control];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = +[VOSSettingsItem Volume];
    if (v6 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      v11 = +[VOSSettingsItem DuckingAmount];

      if (v6 != v11)
      {
        if (v3) {
          [(VOTCustomSliderCell *)&v28 accessibilityIncrement];
        }
        else {
          [(VOTCustomSliderCell *)&v27 accessibilityDecrement];
        }
        goto LABEL_19;
      }
    }
    v12 = [(VOTCustomSliderCell *)self control];
    [v12 value];
    float v14 = -0.05;
    if (v3) {
      float v14 = 0.05;
    }
    double v15 = (float)(v13 + v14);
    [v12 minimumValue];
    double v17 = v16;
    [v12 maximumValue];
    int v19 = (int)(v15 * 100.0);
    int v20 = 5 * (v19 / 5);
    if (v19 % 5 >= 3) {
      int v21 = 5;
    }
    else {
      int v21 = 0;
    }
    double v22 = (double)(v20 + v21) / 100.0;
    if (v22 <= v17) {
      double v22 = v17;
    }
    if (v22 <= *(float *)&v18) {
      float v23 = v22;
    }
    else {
      float v23 = *(float *)&v18;
    }
    *(float *)&double v18 = v23;
    [v12 setValue:0 animated:v18];
    v24 = +[VOSSettingsHelper sharedInstance];
    *(float *)&double v25 = v23;
    v26 = +[NSNumber numberWithFloat:v25];
    [v24 setValue:v26 forSettingsItem:v6];
  }
LABEL_19:
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

@end