@interface AXUISettingsZoomLabeledSliderCell
- (AXUISettingsZoomLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
@end

@implementation AXUISettingsZoomLabeledSliderCell

- (AXUISettingsZoomLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AXUISettingsZoomLabeledSliderCell;
  v5 = [(AXUISettingsLabeledSliderCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(AXUISettingsZoomLabeledSliderCell *)v5 initialValue];
    -[AXUISettingsZoomLabeledSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
  }
  return v6;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  v5 = AXFormatMagnificationFactor();
  [(AXUISettingsLabeledSliderCell *)self setLabelText:v5];

  v6 = [(AXUISettingsLabeledSliderCell *)self slider];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(AXUISettingsLabeledSliderCell *)self slider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__AXUISettingsZoomLabeledSliderCell__updateRightLabelWithValue___block_invoke;
    v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
    *(double *)&v9[4] = a3;
    [v8 _setAccessibilityValueBlock:v9];
  }
}

uint64_t __64__AXUISettingsZoomLabeledSliderCell__updateRightLabelWithValue___block_invoke()
{
  return AXFormatMagnificationFactor();
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(@"MAX_PREFERRED_ZOOM_LEVEL_TITLE_FOOTER");
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  double v6 = round(v5 * 4.0) * 0.25;
  *(float *)&double v6 = v6;
  [v4 setValue:0 animated:v6];
  [v4 value];
  float v8 = v7;

  [(AXUISettingsZoomLabeledSliderCell *)self _updateRightLabelWithValue:v8];
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [a3 value];
  double v4 = v3;
  id v5 = [MEMORY[0x1E4F49458] sharedInstance];
  [v5 setZoomPreferredMaximumZoomScale:v4];
}

- (double)maximumValue
{
  return *MEMORY[0x1E4F48288];
}

- (double)minimumValue
{
  return *MEMORY[0x1E4F48290];
}

- (double)initialValue
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  [v2 zoomPreferredMaximumZoomScale];
  double v4 = v3;

  return v4;
}

@end