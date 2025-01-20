@interface HACCSlider
- (BOOL)_isSubModule;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (BOOL)providesOwnSeparator;
- (HACCContentModuleDelegate)delegate;
- (HACCSlider)initWithModule:(unint64_t)a3 andDelegate:(id)a4;
- (HUITitleDarkStepSliderView)sliderView;
- (NSNumberFormatter)numberFormatter;
- (double)value;
- (id)_sliderConfig;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)contentValue;
- (unint64_t)accessibilityTraits;
- (unint64_t)module;
- (unint64_t)numberOfSteps;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setNumberOfSteps:(unint64_t)a3;
- (void)setSliderView:(id)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 andNotify:(BOOL)a4;
- (void)sliderDidChange:(id)a3;
- (void)updateValue;
- (void)updateValueString;
@end

@implementation HACCSlider

- (HACCSlider)initWithModule:(unint64_t)a3 andDelegate:(id)a4
{
  v42[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HACCSlider;
  v7 = -[HACCSlider initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    [(HACCSlider *)v7 setModule:a3];
    [(HACCSlider *)v8 setDelegate:v6];
    v9 = [HUITitleDarkStepSliderView alloc];
    [(HACCSlider *)v8 _sliderConfig];
    v10 = id v40 = v6;
    uint64_t v11 = [(HUITitleDarkStepSliderView *)v9 initWithConfig:v10];
    sliderView = v8->_sliderView;
    v8->_sliderView = (HUITitleDarkStepSliderView *)v11;

    v13 = [(HUITitleDarkStepSliderView *)v8->_sliderView slider];
    [v13 setSupportsVibrancy:1];

    v14 = [(HUITitleDarkStepSliderView *)v8->_sliderView slider];
    [v14 setDrawsEndTicks:0];

    v15 = [(HUITitleDarkStepSliderView *)v8->_sliderView slider];
    v16 = [MEMORY[0x263F825C8] whiteColor];
    [v15 setMinimumTrackTintColor:v16];

    v17 = [(HUITitleDarkStepSliderView *)v8->_sliderView slider];
    v18 = [MEMORY[0x263F825C8] whiteColor];
    [v17 setTickColor:v18];

    [(HUITitleDarkStepSliderView *)v8->_sliderView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(HUITitleDarkStepSliderView *)v8->_sliderView slider];
    [v19 addTarget:v8 action:sel_sliderDidChange_ forControlEvents:4096];

    [(HACCSlider *)v8 addSubview:v8->_sliderView];
    v35 = (void *)MEMORY[0x263F08938];
    v39 = [(HUITitleDarkStepSliderView *)v8->_sliderView leadingAnchor];
    v38 = [(HACCSlider *)v8 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v42[0] = v37;
    v36 = [(HUITitleDarkStepSliderView *)v8->_sliderView trailingAnchor];
    v20 = [(HACCSlider *)v8 trailingAnchor];
    v21 = [v36 constraintEqualToAnchor:v20];
    v42[1] = v21;
    v22 = [(HUITitleDarkStepSliderView *)v8->_sliderView topAnchor];
    v23 = [(HACCSlider *)v8 topAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v42[2] = v24;
    v25 = [(HUITitleDarkStepSliderView *)v8->_sliderView bottomAnchor];
    v26 = [(HACCSlider *)v8 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v42[3] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    [v35 activateConstraints:v28];

    v29 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v8->_numberFormatter;
    v8->_numberFormatter = v29;

    [(NSNumberFormatter *)v8->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v8->_numberFormatter setPercentSymbol:&stru_26DAB2B88];
    [(NSNumberFormatter *)v8->_numberFormatter setMaximumFractionDigits:0];
    v31 = v8->_numberFormatter;
    v32 = [NSNumber numberWithInt:0];
    v33 = [(NSNumberFormatter *)v31 stringFromNumber:v32];
    [(NSNumberFormatter *)v31 setNotANumberSymbol:v33];

    id v6 = v40;
    [(HACCSlider *)v8 updateValue];
  }

  return v8;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HACCSlider;
  [(HACCSlider *)&v14 layoutSubviews];
  v3 = [MEMORY[0x263F33CA0] controlCenterModuleBackgroundMaterial];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 visualStylingProviderForCategory:2];
    v5 = [v4 _visualStylingForStyle:1];
    if ([(HACCSlider *)self module] == 11 || [(HACCSlider *)self module] == 10)
    {
      id v6 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
      v7 = [v5 color];
      [v6 setMinimumTrackTintColor:v7];

      v8 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
      v9 = [v8 _minTrackView];
      objc_msgSend(v9, "mt_replaceVisualStyling:", v5);
    }
    v10 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
    uint64_t v11 = [v5 color];
    [v10 setMaximumTrackTintColor:v11];

    v12 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
    v13 = [v12 _maxTrackView];
    objc_msgSend(v13, "mt_replaceVisualStyling:", v5);
  }
}

- (BOOL)providesOwnSeparator
{
  unint64_t v2 = [(HACCSlider *)self module];
  return (v2 < 0xE) & (0x2924u >> v2);
}

- (BOOL)_isSubModule
{
  BOOL v3 = [(HACCSlider *)self providesOwnSeparator];
  if (v3)
  {
    unint64_t v4 = [(HACCSlider *)self module] - 1;
    v5 = [(HACCSlider *)self delegate];
    LOBYTE(v4) = [v5 shouldDisplayControlForModule:v4];

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)_sliderConfig
{
  BOOL v3 = HUICCMenuTextLabel();
  unint64_t v4 = HUICCMenuTextLabel();
  BOOL v5 = [(HACCSlider *)self _isSubModule];
  switch([(HACCSlider *)self module])
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 12uLL:
    case 13uLL:
      objc_super v14 = hearingLocString();
      [v3 setText:v14];

      uint64_t v11 = 0;
      v12 = 0;
      id v9 = 0;
      uint64_t v13 = 3;
      break;
    case 3uLL:
    case 6uLL:
    case 14uLL:
    case 25uLL:
    case 26uLL:
      id v6 = [MEMORY[0x263F825C8] whiteColor];
      v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"speaker.fill"];
      v8 = [v7 imageWithTintColor:v6 renderingMode:1];

      id v9 = v8;
      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x263F823D0];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __27__HACCSlider__sliderConfig__block_invoke;
      v21[3] = &unk_2647CD8C0;
      objc_copyWeak(&v22, &location);
      uint64_t v11 = [v10 actionWithHandler:v21];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

      BOOL v3 = 0;
      v12 = 0;
      uint64_t v13 = 2;
      break;
    case 9uLL:
      v15 = [MEMORY[0x263F825C8] whiteColor];
      v16 = [MEMORY[0x263F827E8] _systemImageNamed:@"circle.fill"];
      uint64_t v13 = 1;
      id v9 = [v16 imageWithTintColor:v15 renderingMode:1];

      v17 = [MEMORY[0x263F827E8] _systemImageNamed:@"sun.max"];
      v12 = [v17 imageWithTintColor:v15 renderingMode:1];

      unint64_t v4 = 0;
      BOOL v3 = 0;
      uint64_t v11 = 0;
      break;
    case 10uLL:
    case 11uLL:
      v18 = hearingLocString();
      [v3 setText:v18];

      uint64_t v11 = 0;
      v12 = 0;
      id v9 = 0;
      uint64_t v13 = 4;
      break;
    default:

      unint64_t v4 = 0;
      BOOL v3 = 0;
      uint64_t v11 = 0;
      v12 = 0;
      id v9 = 0;
      uint64_t v13 = 0;
      break;
  }
  v19 = objc_alloc_init(HUISliderConfig);
  [(HUISliderConfig *)v19 setStyle:v13];
  [(HUISliderConfig *)v19 setMinImage:v9];
  [(HUISliderConfig *)v19 setMaxImage:v12];
  [(HUISliderConfig *)v19 setMinTextLabel:v3];
  [(HUISliderConfig *)v19 setMinImageAction:v11];
  [(HUISliderConfig *)v19 setValueLabel:v4];
  [(HUISliderConfig *)v19 setProvidesOwnSeparator:[(HACCSlider *)self providesOwnSeparator]];
  [(HUISliderConfig *)v19 setIsSubmenuSlider:v5];
  [(HUISliderConfig *)v19 setIsLargeText:HUICCLargeTextEnabled()];

  return v19;
}

void __27__HACCSlider__sliderConfig__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained sliderView];
  unint64_t v4 = [v3 slider];
  [v4 setValue:0.0];

  id v7 = objc_loadWeakRetained(v1);
  BOOL v5 = [v7 sliderView];
  id v6 = [v5 slider];
  [v6 sendActionsForControlEvents:4096];
}

- (void)setNumberOfSteps:(unint64_t)a3
{
  BOOL v5 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
  [v5 setSegmentCount:a3];

  sliderView = self->_sliderView;
  [(HUITitleDarkStepSliderView *)sliderView setNeedsLayout];
}

- (unint64_t)numberOfSteps
{
  unint64_t v2 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
  unint64_t v3 = [v2 segmentCount];

  return v3;
}

- (void)sliderDidChange:(id)a3
{
  [a3 value];
  double v5 = v4;
  [(HACCSlider *)self setValue:1 andNotify:v5];
}

- (void)setValue:(double)a3 andNotify:(BOOL)a4
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 >= 1.0) {
    double v5 = 100.0;
  }
  else {
    double v5 = a3 * 100.0;
  }
  double v6 = (double)(int)llround(v5) / 100.0;
  if (self->_value != v6)
  {
    BOOL v7 = a4;
    unint64_t numberOfSteps = self->_numberOfSteps;
    if (v6 != 1.0 && numberOfSteps >= 2)
    {
      double v10 = 1.0 / (double)numberOfSteps;
      float v11 = v6 / v10;
      double v6 = v10 * (double)(int)llroundf(v11);
    }
    self->_value = v6;
    [(HACCSlider *)self setNeedsLayout];
    [(HACCSlider *)self layoutIfNeeded];
    if (v7)
    {
      v12 = [(HACCSlider *)self delegate];
      [v12 controlDidActivate:self];
    }
  }
  [(HACCSlider *)self updateValueString];
}

- (void)updateValueString
{
  unint64_t v3 = [(HACCSlider *)self module];
  float v4 = 0.0;
  if (v3 <= 0x1A)
  {
    if (((1 << v3) & 0x60073FE) != 0)
    {
      double value = self->_value;
LABEL_4:
      float v4 = value;
      goto LABEL_5;
    }
    if (((1 << v3) & 0xC00) != 0)
    {
      double value = self->_value + -0.5 + self->_value + -0.5;
      goto LABEL_4;
    }
  }
LABEL_5:
  id v11 = [(HACCSlider *)self sliderView];
  double v6 = [v11 valueLabel];
  numberFormatter = self->_numberFormatter;
  *(float *)&double v8 = v4;
  id v9 = [NSNumber numberWithFloat:v8];
  double v10 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v9];
  [v6 setText:v10];
}

- (void)updateValue
{
  unint64_t v3 = (void *)MEMORY[0x22A6624A0](self, a2);
  float v4 = [(HACCSlider *)self delegate];
  double v5 = [v4 currentHearingDevice];

  double v6 = 0;
  float v7 = 0.0;
  uint64_t v8 = 0;
  switch([(HACCSlider *)self module])
  {
    case 1uLL:
      [v5 leftMixedVolume];
      float v7 = v9;
      int v10 = [v5 leftMixedVolumeSteps];
      goto LABEL_11;
    case 2uLL:
      [v5 rightMixedVolume];
      float v7 = v16;
      int v10 = [v5 rightMixedVolumeSteps];
LABEL_11:
      uint64_t v8 = v10;
      goto LABEL_28;
    case 3uLL:
      [v5 combinedVolumeForProperty:0x4000000000];
      float v7 = v17;
      int v18 = [v5 leftMixedVolumeSteps];
      int v19 = [v5 rightMixedVolumeSteps];
      goto LABEL_17;
    case 4uLL:
      [v5 leftMicrophoneVolume];
      float v7 = v20;
      int v21 = [v5 leftMicrophoneVolumeSteps];
      goto LABEL_15;
    case 5uLL:
      [v5 rightMicrophoneVolume];
      float v7 = v22;
      int v21 = [v5 rightMicrophoneVolumeSteps];
LABEL_15:
      uint64_t v8 = v21;
      goto LABEL_28;
    case 6uLL:
      [v5 combinedVolumeForProperty:64];
      float v7 = v23;
      int v18 = [v5 leftMicrophoneVolumeSteps];
      int v19 = [v5 rightMicrophoneVolumeSteps];
LABEL_17:
      if (v18 <= v19) {
        int v24 = v19;
      }
      else {
        int v24 = v18;
      }
      uint64_t v8 = v24;
      goto LABEL_28;
    case 7uLL:
      [v5 leftSensitivity];
      float v7 = v25;
      int v26 = [v5 leftSensitivitySteps];
      goto LABEL_23;
    case 8uLL:
      [v5 rightSensitivity];
      float v7 = v27;
      int v26 = [v5 rightSensitivitySteps];
LABEL_23:
      uint64_t v8 = v26;
      goto LABEL_28;
    case 9uLL:
      [v5 combinedVolumeForProperty:0x80000000];
      float v7 = v28;
      int v29 = [v5 leftSensitivitySteps];
      int v30 = [v5 rightSensitivitySteps];
      if (v29 <= v30) {
        int v31 = v30;
      }
      else {
        int v31 = v29;
      }
      uint64_t v8 = v31;
LABEL_28:
      double v6 = hearingLocString();
      break;
    case 10uLL:
      v32 = v5;
      uint64_t v33 = 0x2000000000;
      goto LABEL_31;
    case 11uLL:
      v32 = v5;
      uint64_t v33 = 0x1000000000;
LABEL_31:
      [v32 combinedVolumeForProperty:v33];
      float v7 = v34;
      v35 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
      [v35 setRestrictsValuesToTicks:0];

      double v6 = hearingLocString();
      uint64_t v8 = 2;
      break;
    case 12uLL:
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      id v66 = [v5 leftSelectedStreamingProgram];
      if (([(id)v62[5] isStream] & 1) == 0)
      {
        v36 = [v5 leftPrograms];
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __25__HACCSlider_updateValue__block_invoke;
        v60[3] = &unk_2647CD8E8;
        v60[4] = &v61;
        [v36 enumerateObjectsUsingBlock:v60];
      }
      [v5 leftStreamVolume];
      double v38 = v37;
      LODWORD(v8) = [v5 leftStreamVolumeSteps];
      v39 = NSString;
      id v40 = hearingLocString();
      if ([(id)v62[5] isStream]) {
        [(id)v62[5] name];
      }
      else {
      v50 = hearingLocString();
      }
      uint64_t v51 = objc_msgSend(v39, "stringWithFormat:", v40, v50);
      goto LABEL_49;
    case 13uLL:
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      id v66 = [v5 rightSelectedStreamingProgram];
      if (([(id)v62[5] isStream] & 1) == 0)
      {
        objc_super v41 = [v5 rightPrograms];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __25__HACCSlider_updateValue__block_invoke_2;
        v59[3] = &unk_2647CD8E8;
        v59[4] = &v61;
        [v41 enumerateObjectsUsingBlock:v59];
      }
      [v5 rightStreamVolume];
      double v38 = v42;
      LODWORD(v8) = [v5 rightStreamVolumeSteps];
      v43 = NSString;
      id v40 = hearingLocString();
      if ([(id)v62[5] isStream]) {
        [(id)v62[5] name];
      }
      else {
      v50 = hearingLocString();
      }
      uint64_t v51 = objc_msgSend(v43, "stringWithFormat:", v40, v50);
LABEL_49:
      double v6 = (void *)v51;
      float v7 = v38;
      uint64_t v8 = (int)v8;

      goto LABEL_50;
    case 14uLL:
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__0;
      v65 = __Block_byref_object_dispose__0;
      id v66 = [v5 rightSelectedStreamingProgram];
      if (([(id)v62[5] isStream] & 1) == 0)
      {
        id v11 = [v5 programs];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __25__HACCSlider_updateValue__block_invoke_3;
        v58[3] = &unk_2647CD8E8;
        v58[4] = &v61;
        [v11 enumerateObjectsUsingBlock:v58];
      }
      [v5 combinedVolumeForProperty:128];
      double v13 = v12;
      int v14 = [v5 leftStreamVolumeSteps];
      int v15 = [v5 rightStreamVolumeSteps];
      if (v14 <= v15) {
        LODWORD(v8) = v15;
      }
      else {
        LODWORD(v8) = v14;
      }
      if ([(id)v62[5] isStream]) {
        [(id)v62[5] name];
      }
      else {
      double v6 = hearingLocString();
      }
      float v7 = v13;
      uint64_t v8 = (int)v8;
LABEL_50:
      _Block_object_dispose(&v61, 8);

      break;
    case 25uLL:
      v44 = [MEMORY[0x263F47548] sharedInstance];
      [v44 relativeVolume];
      float v7 = v45;

      v46 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
      [v46 setRestrictsValuesToTicks:0];

      goto LABEL_42;
    case 26uLL:
      v47 = [MEMORY[0x263F47548] sharedInstance];
      [v47 mediaVolume];
      float v7 = v48;

      v49 = [(HUITitleDarkStepSliderView *)self->_sliderView slider];
      [v49 setRestrictsValuesToTicks:0];

LABEL_42:
      double v6 = hearingLocString();
      uint64_t v8 = 0;
      break;
    default:
      break;
  }
  [(HACCSlider *)self updateValueString];
  v52 = [(HACCSlider *)self sliderView];
  v53 = [v52 titleLabel];
  [v53 setText:v6];

  v54 = [(HACCSlider *)self sliderView];
  v55 = [v54 slider];
  *(float *)&double v56 = v7;
  [v55 setValue:v56];

  v57 = [(HACCSlider *)self sliderView];
  objc_msgSend(v57, "setIsSubmenu:", -[HACCSlider _isSubModule](self, "_isSubModule"));

  [(HACCSlider *)self setNumberOfSteps:v8];
  [(HACCSlider *)self setValue:0 andNotify:v7];
}

void __25__HACCSlider_updateValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __25__HACCSlider_updateValue__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __25__HACCSlider_updateValue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)contentValue
{
  unint64_t v2 = NSNumber;
  [(HACCSlider *)self value];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(HACCSlider *)self delegate];
  float v4 = [v3 currentHearingDevice];

  unint64_t v5 = [(HACCSlider *)self module];
  double v6 = 0;
  switch(v5)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0x1AuLL:
      double v6 = hearingLocString();
      break;
    case 0xCuLL:
      uint64_t v25 = 0;
      int v26 = &v25;
      uint64_t v27 = 0x3032000000;
      double v28 = __Block_byref_object_copy__0;
      int v29 = __Block_byref_object_dispose__0;
      id v30 = [v4 leftSelectedStreamingProgram];
      if (([(id)v26[5] isStream] & 1) == 0)
      {
        id v7 = [v4 leftPrograms];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __32__HACCSlider_accessibilityLabel__block_invoke;
        v24[3] = &unk_2647CD8E8;
        v24[4] = &v25;
        [v7 enumerateObjectsUsingBlock:v24];
      }
      uint64_t v8 = NSString;
      double v9 = hearingLocString();
      if ([(id)v26[5] isStream]) {
        [(id)v26[5] name];
      }
      else {
      double v20 = hearingLocString();
      }
      uint64_t v21 = objc_msgSend(v8, "stringWithFormat:", v9, v20);
      goto LABEL_25;
    case 0xDuLL:
      uint64_t v25 = 0;
      int v26 = &v25;
      uint64_t v27 = 0x3032000000;
      double v28 = __Block_byref_object_copy__0;
      int v29 = __Block_byref_object_dispose__0;
      id v30 = [v4 rightSelectedStreamingProgram];
      if (([(id)v26[5] isStream] & 1) == 0)
      {
        int v10 = [v4 rightPrograms];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __32__HACCSlider_accessibilityLabel__block_invoke_2;
        v23[3] = &unk_2647CD8E8;
        v23[4] = &v25;
        [v10 enumerateObjectsUsingBlock:v23];
      }
      id v11 = NSString;
      double v9 = hearingLocString();
      if ([(id)v26[5] isStream]) {
        [(id)v26[5] name];
      }
      else {
      double v20 = hearingLocString();
      }
      uint64_t v21 = objc_msgSend(v11, "stringWithFormat:", v9, v20);
      goto LABEL_25;
    case 0xEuLL:
      uint64_t v25 = 0;
      int v26 = &v25;
      uint64_t v27 = 0x3032000000;
      double v28 = __Block_byref_object_copy__0;
      int v29 = __Block_byref_object_dispose__0;
      id v30 = [v4 rightSelectedStreamingProgram];
      if (([(id)v26[5] isStream] & 1) == 0)
      {
        double v12 = [v4 programs];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __32__HACCSlider_accessibilityLabel__block_invoke_3;
        v22[3] = &unk_2647CD8E8;
        v22[4] = &v25;
        [v12 enumerateObjectsUsingBlock:v22];
      }
      double v13 = NSString;
      double v9 = hearingLocString();
      if ([(id)v26[5] isStream]) {
        [(id)v26[5] name];
      }
      else {
      double v20 = hearingLocString();
      }
      uint64_t v21 = objc_msgSend(v13, "stringWithFormat:", v9, v20);
LABEL_25:
      double v6 = (void *)v21;

      _Block_object_dispose(&v25, 8);
      break;
    case 0x19uLL:
      int v14 = NSString;
      int v15 = hearingLocString();
      double v16 = [MEMORY[0x263F47548] sharedInstance];
      double v17 = [v16 selectedComfortSound];
      int v18 = [v17 localizedName];
      double v6 = objc_msgSend(v14, "stringWithFormat:", v15, v18);

      break;
    default:
      break;
  }

  return v6;
}

void __32__HACCSlider_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __32__HACCSlider_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __32__HACCSlider_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)accessibilityValue
{
  unint64_t v2 = [(HACCSlider *)self sliderView];
  unint64_t v3 = [v2 valueLabel];
  float v4 = [v3 accessibilityLabel];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83248];
}

- (void)accessibilityDecrement
{
  [(HUITitleDarkStepSliderView *)self->_sliderView accessibilityDecrement];
  [(HACCSlider *)self updateValueString];
}

- (void)accessibilityIncrement
{
  [(HUITitleDarkStepSliderView *)self->_sliderView accessibilityIncrement];
  [(HACCSlider *)self updateValueString];
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (HUITitleDarkStepSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end