@interface AssistiveTouchIdleSliderCell
- (AssistiveTouchIdleSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation AssistiveTouchIdleSliderCell

- (AssistiveTouchIdleSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AssistiveTouchIdleSliderCell;
  v5 = [(AssistiveTouchIdleSliderCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(AssistiveTouchIdleSliderCell *)v5 initialValue];
    -[AssistiveTouchIdleSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v4 = AXFormatFloatWithPercentage();
  [(AssistiveTouchIdleSliderCell *)self setLabelText:v4];

  id v5 = objc_initWeak(&location, self);
  v6 = [(AssistiveTouchIdleSliderCell *)self slider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __59__AssistiveTouchIdleSliderCell__updateRightLabelWithValue___block_invoke;
  v7[3] = &unk_209258;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityValueBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __59__AssistiveTouchIdleSliderCell__updateRightLabelWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initialValue];
  v2 = AXFormatFloatWithPercentage();

  return v2;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"IDLE_OPACITY_TITLE", @"AssistiveTouchIdleOpacitySettings");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  double v6 = v5;
  v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchIdleOpacity:v6];

  [v4 value];
  float v9 = v8;

  [(AssistiveTouchIdleSliderCell *)self _updateRightLabelWithValue:v9];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchIdleOpacity:v4];
}

- (double)maximumValue
{
  return 1.0;
}

- (double)minimumValue
{
  return 0.15;
}

- (double)initialValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchIdleOpacity];
  double v4 = v3;

  return v4;
}

@end