@interface VoiceOverPitchLabeledSliderCell
- (VoiceOverPitchLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation VoiceOverPitchLabeledSliderCell

- (VoiceOverPitchLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)VoiceOverPitchLabeledSliderCell;
  v5 = [(VoiceOverPitchLabeledSliderCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(VoiceOverPitchLabeledSliderCell *)v5 initialValue];
    -[VoiceOverPitchLabeledSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  AXFormatFloatWithPercentage();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(VoiceOverPitchLabeledSliderCell *)self setLabelText:v4];
}

- (id)accessibilityLabel
{
  return settingsLocString(@"PITCH", @"VoiceOverSettings");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  float v6 = v5;

  [(VoiceOverPitchLabeledSliderCell *)self _updateRightLabelWithValue:v6];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverPitch:v4];
}

- (double)maximumValue
{
  return 1.0;
}

- (double)minimumValue
{
  return 0.0;
}

- (double)initialValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 voiceOverPitch];
  double v4 = v3;

  return v4;
}

@end