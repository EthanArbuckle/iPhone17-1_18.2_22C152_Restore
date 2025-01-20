@interface VoiceOverDuckingSliderCell
- (VoiceOverDuckingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)_currentDuckingValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_setCurrentDuckingValue:(double)a3;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)accessibilityIncrementOrDecrement:(BOOL)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation VoiceOverDuckingSliderCell

- (VoiceOverDuckingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VoiceOverDuckingSliderCell;
  v5 = [(VoiceOverDuckingSliderCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(VoiceOverDuckingSliderCell *)v5 initialValue];
    -[VoiceOverDuckingSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
    [(VoiceOverDuckingSliderCell *)v6 initialValue];
    float v8 = v7;
    v9 = [(VoiceOverDuckingSliderCell *)v6 slider];
    *(float *)&double v10 = v8;
    [v9 setValue:v10];
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v5 = AXFormatFloatWithPercentage();
  [(VoiceOverDuckingSliderCell *)self setLabelText:v5];

  v6 = [(VoiceOverDuckingSliderCell *)self slider];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    float v8 = [(VoiceOverDuckingSliderCell *)self slider];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __57__VoiceOverDuckingSliderCell__updateRightLabelWithValue___block_invoke;
    v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
    *(double *)&v9[4] = a3;
    [v8 _setAccessibilityValueBlock:v9];
  }
}

uint64_t __57__VoiceOverDuckingSliderCell__updateRightLabelWithValue___block_invoke()
{
  return AXFormatFloatWithPercentage();
}

- (double)maximumValue
{
  return 0.99;
}

- (double)minimumValue
{
  return 0.01;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"DUCKING_AMOUNT", @"VoiceOverSettings");
}

- (id)accessibilityValue
{
  [(VoiceOverDuckingSliderCell *)self _currentDuckingValue];

  return (id)AXFormatFloatWithPercentage();
}

- (double)_currentDuckingValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 voiceOverMediaDuckingAmount];
  double v4 = v3;

  return v4;
}

- (void)_setCurrentDuckingValue:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverMediaDuckingAmount:a3];
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  float v6 = v5;

  [(VoiceOverDuckingSliderCell *)self _updateRightLabelWithValue:v6];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  id v8 = a3;
  [v8 value];
  double v5 = v4;
  [(VoiceOverDuckingSliderCell *)self _currentDuckingValue];
  if (vabdd_f64(v5, v6) >= 0.001)
  {
    [v8 value];
    [(VoiceOverDuckingSliderCell *)self _setCurrentDuckingValue:v7];
  }
}

- (void)accessibilityIncrementOrDecrement:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VoiceOverDuckingSliderCell *)self slider];
  [v5 value];
  float v7 = v6;

  float v8 = -0.05;
  if (v3) {
    float v8 = 0.05;
  }
  double v9 = (float)(v7 + v8) * 100.0;
  if ((int)v9 % 5 >= 3) {
    int v10 = 5;
  }
  else {
    int v10 = 0;
  }
  double v11 = fmax((double)(5 * ((int)v9 / 5) + v10) / 100.0, 0.01);
  if (v11 > 0.99) {
    double v11 = 0.99;
  }
  float v12 = v11;
  v13 = [(VoiceOverDuckingSliderCell *)self slider];
  *(float *)&double v14 = v12;
  [v13 setValue:0 animated:v14];

  v15 = [(VoiceOverDuckingSliderCell *)self slider];
  [v15 value];
  [(VoiceOverDuckingSliderCell *)self _updateRightLabelWithValue:v16];

  id v18 = [(VoiceOverDuckingSliderCell *)self slider];
  [v18 value];
  [(VoiceOverDuckingSliderCell *)self _setCurrentDuckingValue:v17];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

@end