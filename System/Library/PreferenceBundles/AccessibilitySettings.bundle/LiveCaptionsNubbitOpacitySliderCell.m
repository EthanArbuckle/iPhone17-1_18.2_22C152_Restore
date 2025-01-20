@interface LiveCaptionsNubbitOpacitySliderCell
- (LiveCaptionsNubbitOpacitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation LiveCaptionsNubbitOpacitySliderCell

- (LiveCaptionsNubbitOpacitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)LiveCaptionsNubbitOpacitySliderCell;
  v5 = [(LiveCaptionsNubbitOpacitySliderCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(LiveCaptionsNubbitOpacitySliderCell *)v5 initialValue];
    -[LiveCaptionsNubbitOpacitySliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v4 = AXFormatFloatWithPercentage();
  [(LiveCaptionsNubbitOpacitySliderCell *)self setLabelText:v4];

  id v5 = objc_initWeak(&location, self);
  v6 = [(LiveCaptionsNubbitOpacitySliderCell *)self slider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __66__LiveCaptionsNubbitOpacitySliderCell__updateRightLabelWithValue___block_invoke;
  v7[3] = &unk_209258;
  objc_copyWeak(&v8, &location);
  [v6 _setAccessibilityValueBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __66__LiveCaptionsNubbitOpacitySliderCell__updateRightLabelWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initialValue];
  v2 = AXFormatFloatWithPercentage();

  return v2;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"LIVE_CAPTIONS_IDLE_OPACITY_TITLE", @"Accessibility");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  _AXSLiveCaptionsSetNubbitIdleOpacity();
  [v4 value];
  float v6 = v5;

  [(LiveCaptionsNubbitOpacitySliderCell *)self _updateRightLabelWithValue:v6];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  _AXSLiveCaptionsSetNubbitIdleOpacity();
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
  v2 = (void *)_AXSLiveCaptionsNubbitIdleOpacity();
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

@end