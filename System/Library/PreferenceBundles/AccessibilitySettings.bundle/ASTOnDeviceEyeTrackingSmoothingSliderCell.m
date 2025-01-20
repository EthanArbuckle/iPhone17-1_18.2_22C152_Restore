@interface ASTOnDeviceEyeTrackingSmoothingSliderCell
- (ASTOnDeviceEyeTrackingSmoothingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AXSSMotionTrackingCameraInput)eyeTracker;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
- (void)setEyeTracker:(id)a3;
@end

@implementation ASTOnDeviceEyeTrackingSmoothingSliderCell

- (ASTOnDeviceEyeTrackingSmoothingSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ASTOnDeviceEyeTrackingSmoothingSliderCell;
  v9 = [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)&v25 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"ASTOnDeviceEyeTrackerKey"];

    if (v10)
    {
      v11 = [v8 propertyForKey:@"ASTOnDeviceEyeTrackerKey"];
      [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 setEyeTracker:v11];

      [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 minimumValue];
      float v13 = v12;
      v14 = [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v15 = v13;
      [v14 setMinimumValue:v15];

      [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 maximumValue];
      float v17 = v16;
      v18 = [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v19 = v17;
      [v18 setMaximumValue:v19];

      [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 initialValue];
      float v21 = v20;
      v22 = [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 slider];
      *(float *)&double v23 = v21;
      [v22 setValue:v23];

      [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)v9 initialValue];
      -[ASTOnDeviceEyeTrackingSmoothingSliderCell _updateRightLabelWithValue:](v9, "_updateRightLabelWithValue:");
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
  [v7 setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:v6];

  [v4 value];
  float v9 = v8;

  double v10 = roundf(v9);

  [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)self _updateRightLabelWithValue:v10];
}

- (void)_updateRightLabelWithValue:(double)a3
{
  AXFormatFloatWithPercentage();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ASTOnDeviceEyeTrackingSmoothingSliderCell *)self setLabelText:v4];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  unint64_t v4 = vcvtas_u32_f32(v3);
  id v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:v4];
}

- (double)maximumValue
{
  return (double)kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeMaxUserPreference;
}

- (double)minimumValue
{
  return (double)kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeMinUserPreference;
}

- (double)initialValue
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize];

  if ((unint64_t)v3 >= kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeMinUserPreference) {
    return (double)*(uint64_t *)&v3;
  }
  else {
    return (double)(unint64_t)kAXSAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizeDefault;
  }
}

- (id)accessibilityLabel
{
  return settingsLocString(@"MOUSE_POINTER_HID_DEVICE_SMOOTHING", @"HandSettings");
}

- (AXSSMotionTrackingCameraInput)eyeTracker
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