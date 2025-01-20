@interface ASTMotionTrackingSmoothingSliderCell
- (ASTMotionTrackingSmoothingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AXSSMotionTrackingHIDInput)eyeTracker;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
- (void)setEyeTracker:(id)a3;
@end

@implementation ASTMotionTrackingSmoothingSliderCell

- (ASTMotionTrackingSmoothingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ASTMotionTrackingSmoothingSliderCell;
  v9 = [(ASTMotionTrackingSmoothingSliderCell *)&v25 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"ASTEyeTrackerKey"];

    if (v10)
    {
      v11 = [v8 propertyForKey:@"ASTEyeTrackerKey"];
      [(ASTMotionTrackingSmoothingSliderCell *)v9 setEyeTracker:v11];

      [(ASTMotionTrackingSmoothingSliderCell *)v9 minimumValue];
      float v13 = v12;
      v14 = [(ASTMotionTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v15 = v13;
      [v14 setMinimumValue:v15];

      [(ASTMotionTrackingSmoothingSliderCell *)v9 maximumValue];
      float v17 = v16;
      v18 = [(ASTMotionTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v19 = v17;
      [v18 setMaximumValue:v19];

      [(ASTMotionTrackingSmoothingSliderCell *)v9 initialValue];
      float v21 = v20;
      v22 = [(ASTMotionTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v23 = v21;
      [v22 setValue:v23];

      [(ASTMotionTrackingSmoothingSliderCell *)v9 initialValue];
      -[ASTMotionTrackingSmoothingSliderCell _updateRightLabelWithValue:](v9, "_updateRightLabelWithValue:");
    }
  }

  return v9;
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  unint64_t v6 = vcvtas_u32_f32(v5);
  v7 = +[AXSettings sharedInstance];
  id v8 = +[NSNumber numberWithUnsignedInteger:v6];
  v9 = [(ASTMotionTrackingSmoothingSliderCell *)self eyeTracker];
  [v7 updateSmoothingBufferSize:v8 forEyeTracker:v9];

  [v4 value];
  float v11 = v10;

  double v12 = roundf(v11);

  [(ASTMotionTrackingSmoothingSliderCell *)self _updateRightLabelWithValue:v12];
}

- (void)_updateRightLabelWithValue:(double)a3
{
  AXFormatFloatWithPercentage();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASTMotionTrackingSmoothingSliderCell *)self setLabelText:v4];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  unint64_t v5 = vcvtas_u32_f32(v4);
  id v8 = +[AXSettings sharedInstance];
  unint64_t v6 = +[NSNumber numberWithUnsignedInteger:v5];
  v7 = [(ASTMotionTrackingSmoothingSliderCell *)self eyeTracker];
  [v8 updateSmoothingBufferSize:v6 forEyeTracker:v7];
}

- (double)maximumValue
{
  return (double)kAXSAssistiveTouchMotionTrackerSmoothingBufferSizeMaxUserPreference;
}

- (double)minimumValue
{
  return (double)kAXSAssistiveTouchMotionTrackerSmoothingBufferSizeMinUserPreference;
}

- (double)initialValue
{
  v3 = +[AXSettings sharedInstance];
  float v4 = [(ASTMotionTrackingSmoothingSliderCell *)self eyeTracker];
  unint64_t v5 = [v3 smoothingBufferSizeForEyeTracker:v4];

  if (v5) {
    id v6 = [v5 unsignedIntegerValue];
  }
  else {
    id v6 = (id)kAXSAssistiveTouchMotionTrackerSmoothingBufferSizeDefault;
  }
  double v7 = (double)(unint64_t)v6;

  return v7;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"MOUSE_POINTER_HID_DEVICE_SMOOTHING", @"HandSettings");
}

- (AXSSMotionTrackingHIDInput)eyeTracker
{
  return self->_eyeTracker;
}

- (void)setEyeTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end