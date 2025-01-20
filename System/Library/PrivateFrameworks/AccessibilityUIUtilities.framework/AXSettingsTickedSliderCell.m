@interface AXSettingsTickedSliderCell
- (AXDispatchTimer)valueTimer;
- (AXSettingsTickedSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AccessibilityAirPodSettingsController)controller;
- (Class)sliderCellClass;
- (NSString)btAddress;
- (double)_defaultSliderValue;
- (double)_determineDisplayValue:(double)a3;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (double)rightViewPadding;
- (id)accessibilityLabel;
- (id)maximumTextSizeString;
- (void)_updateRightLabelWithValue:(double)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
- (void)layoutSubviews;
- (void)setController:(id)a3;
- (void)setValueTimer:(id)a3;
@end

@implementation AXSettingsTickedSliderCell

- (AXSettingsTickedSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AXSettingsTickedSliderCell;
  v5 = [(AXUISettingsLabeledSliderCell *)&v16 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(AXSettingsTickedSliderCell *)v5 initialValue];
    -[AXSettingsTickedSliderCell _updateRightLabelWithValue:](v6, "_updateRightLabelWithValue:");
    v7 = NSNumber;
    [(AXSettingsTickedSliderCell *)v6 _defaultSliderValue];
    v9 = [v7 numberWithDouble:v8 / 100.0];
    v17[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v11 = [(AXUISettingsLabeledSliderCell *)v6 slider];
    [v11 setTicks:v10];

    id v12 = objc_alloc(MEMORY[0x1E4F48318]);
    v13 = (void *)[v12 initWithTargetSerialQueue:MEMORY[0x1E4F14428]];
    [(AXSettingsTickedSliderCell *)v6 setValueTimer:v13];

    v14 = [(AXSettingsTickedSliderCell *)v6 valueTimer];
    [v14 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v6;
}

- (double)_defaultSliderValue
{
  v3 = [(AXSettingsTickedSliderCell *)self controller];
  int v4 = [v3 isInWatchSettings];

  v5 = [MEMORY[0x1E4F49418] sharedInstance];
  v6 = [(AXSettingsTickedSliderCell *)self btAddress];
  if (v4) {
    unsigned int v7 = objc_msgSend(v5, "nps_defaultToneVolumeForDeviceAddress:", v6);
  }
  else {
    unsigned int v7 = [v5 defaultToneVolumeForDeviceAddress:v6];
  }
  unsigned int v8 = v7;

  return (double)v8;
}

- (double)_determineDisplayValue:(double)a3
{
  double v5 = (a3 + -15.0) / 85.0;
  v6 = [(AXSettingsTickedSliderCell *)self controller];
  [v6 displayedMaxValue];
  double v8 = (v5 * (v7 + -15.0) + 15.0) / 100.0;

  [(AXSettingsTickedSliderCell *)self _defaultSliderValue];
  BOOL v10 = vabdd_f64(a3, v9) < 0.001;
  double result = 1.0;
  if (!v10) {
    return v8;
  }
  return result;
}

- (void)_updateRightLabelWithValue:(double)a3
{
  [(AXSettingsTickedSliderCell *)self _determineDisplayValue:a3];
  uint64_t v5 = v4;
  v6 = AXFormatFloatWithPercentage();
  [(AXUISettingsLabeledSliderCell *)self setLabelText:v6];

  double v7 = [(AXUISettingsLabeledSliderCell *)self slider];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(AXUISettingsLabeledSliderCell *)self slider];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__AXSettingsTickedSliderCell__updateRightLabelWithValue___block_invoke;
    v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v10[4] = v5;
    [v9 _setAccessibilityValueBlock:v10];
  }
}

uint64_t __57__AXSettingsTickedSliderCell__updateRightLabelWithValue___block_invoke()
{
  return AXFormatFloatWithPercentage();
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AXSettingsTickedSliderCell *)self controller];
  v6 = NSNumber;
  [v4 value];
  double v7 = objc_msgSend(v6, "numberWithFloat:");
  [v5 setToneVolume:v7 specifier:0];

  char v8 = AXLogAirPodSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = NSNumber;
    [v4 value];
    BOOL v10 = objc_msgSend(v9, "numberWithFloat:");
    int v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1C39D1000, v8, OS_LOG_TYPE_INFO, "Finish dragging: %@", (uint8_t *)&v12, 0xCu);
  }
  v11 = [(AXSettingsTickedSliderCell *)self valueTimer];
  [v11 cancel];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AXSettingsTickedSliderCell;
  [(PSTableCell *)&v5 layoutSubviews];
  v3 = [(AXUISettingsLabeledSliderCell *)self slider];
  [v3 value];
  [(AXSettingsTickedSliderCell *)self _updateRightLabelWithValue:v4];
}

- (void)handleSliderBeingDragged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = AXLogAirPodSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = NSNumber;
    [v4 value];
    double v7 = objc_msgSend(v6, "numberWithFloat:");
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1C39D1000, v5, OS_LOG_TYPE_INFO, "Dragging airpod slider: %@", buf, 0xCu);
  }
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  [(AXSettingsTickedSliderCell *)self _updateRightLabelWithValue:v8];
  double v9 = [(AXSettingsTickedSliderCell *)self controller];
  BOOL v10 = NSNumber;
  [v4 value];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v9 applyHapticIfNecessary:v11];

  int v12 = [(AXSettingsTickedSliderCell *)self valueTimer];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__AXSettingsTickedSliderCell_handleSliderBeingDragged___block_invoke;
  v14[3] = &unk_1E649BF98;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v12 afterDelay:v14 processBlock:0.25];
}

void __55__AXSettingsTickedSliderCell_handleSliderBeingDragged___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) controller];
  v3 = NSNumber;
  [*(id *)(a1 + 40) value];
  id v4 = objc_msgSend(v3, "numberWithFloat:");
  [v2 setToneVolume:v4 specifier:0];

  objc_super v5 = AXLogAirPodSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSNumber;
    [*(id *)(a1 + 40) value];
    double v7 = objc_msgSend(v6, "numberWithFloat:");
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl(&dword_1C39D1000, v5, OS_LOG_TYPE_DEFAULT, "Set controller value: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (NSString)btAddress
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 propertyForKey:@"BTAddress"];

  return (NSString *)v3;
}

- (id)accessibilityLabel
{
  return (id)AXAirPodsLocalizedStringForKey();
}

- (double)maximumValue
{
  return 100.0;
}

- (double)minimumValue
{
  return 15.0;
}

- (double)initialValue
{
  v3 = [(AXSettingsTickedSliderCell *)self controller];
  int v4 = [v3 isInWatchSettings];

  objc_super v5 = [MEMORY[0x1E4F49418] sharedInstance];
  v6 = [(AXSettingsTickedSliderCell *)self btAddress];
  if (v4)
  {
    objc_msgSend(v5, "nps_toneVolumeForDeviceAddress:", v6);
    double v8 = v7;
  }
  else
  {
    double v8 = (double)[v5 toneVolumeForDeviceAddress:v6];
  }

  return v8;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (id)maximumTextSizeString
{
  [(AXSettingsTickedSliderCell *)self _determineDisplayValue:100.0];
  return (id)AXFormatFloatWithPercentage();
}

- (double)rightViewPadding
{
  return 5.0;
}

- (AccessibilityAirPodSettingsController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (AccessibilityAirPodSettingsController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AXDispatchTimer)valueTimer
{
  return self->_valueTimer;
}

- (void)setValueTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTimer, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end