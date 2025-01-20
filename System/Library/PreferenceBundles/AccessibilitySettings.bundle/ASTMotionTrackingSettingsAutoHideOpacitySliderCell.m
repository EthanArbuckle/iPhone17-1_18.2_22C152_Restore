@interface ASTMotionTrackingSettingsAutoHideOpacitySliderCell
- (ASTMotionTrackingSettingsAutoHideOpacitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation ASTMotionTrackingSettingsAutoHideOpacitySliderCell

- (ASTMotionTrackingSettingsAutoHideOpacitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)ASTMotionTrackingSettingsAutoHideOpacitySliderCell;
  v5 = [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)v5 initialValue];
    -[ASTMotionTrackingSettingsAutoHideOpacitySliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v4 = AXFormatFloatWithPercentage();
  [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)self setLabelText:v4];

  v5 = [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)self slider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_initWeak(&location, self);
    objc_super v8 = [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)self slider];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __81__ASTMotionTrackingSettingsAutoHideOpacitySliderCell__updateRightLabelWithValue___block_invoke;
    v9[3] = &unk_209258;
    objc_copyWeak(&v10, &location);
    [v8 _setAccessibilityValueBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

id __81__ASTMotionTrackingSettingsAutoHideOpacitySliderCell__updateRightLabelWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initialValue];
  v2 = AXFormatFloatWithPercentage();

  return v2;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"MOUSE_POINTER_HID_DEVICE_AUTO_HIDE_OPACITY_TITLE", @"HandSettings");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  double v6 = v5;
  id v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchEyeTrackingAutoHideOpacity:v6];

  [v4 value];
  float v9 = v8;

  [(ASTMotionTrackingSettingsAutoHideOpacitySliderCell *)self _updateRightLabelWithValue:v9];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchEyeTrackingAutoHideOpacity:v4];
}

- (double)maximumValue
{
  return kAXSAssistiveTouchEyeTrackingAutoHideOpacityMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchEyeTrackingAutoHideOpacityMin;
}

- (double)initialValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchEyeTrackingAutoHideOpacity];
  double v4 = v3;

  return v4;
}

@end