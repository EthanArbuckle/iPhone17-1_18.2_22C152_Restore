@interface HACCPSESettings
- (BOOL)enabled;
- (HACCContentModuleDelegate)delegate;
- (HACCPSESettings)initWithFrame:(CGRect)a3;
- (HACCStackView)stackView;
- (HUITitleDarkStepSliderView)amplificationSlider;
- (HUITitleDarkStepSliderView)balanceSlider;
- (HUITitleDarkStepSliderView)noiseSupressorSlider;
- (HUITitleDarkStepSliderView)toneSlider;
- (NSArray)requiredVisualStyleCategories;
- (NSNumberFormatter)numberFormatter;
- (double)currentAmplification;
- (double)currentBalance;
- (double)currentNoiseSupressor;
- (double)currentTone;
- (id)contentValue;
- (unint64_t)module;
- (void)amplificationSliderDidChange:(id)a3;
- (void)balanceSliderDidChange:(id)a3;
- (void)noiseSliderDidChange:(id)a3;
- (void)setAmplificationSlider:(id)a3;
- (void)setBalanceSlider:(id)a3;
- (void)setCurrentAmplification:(double)a3;
- (void)setCurrentBalance:(double)a3;
- (void)setCurrentNoiseSupressor:(double)a3;
- (void)setCurrentTone:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setNoiseSupressorSlider:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setStackView:(id)a3;
- (void)setToneSlider:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)toneSliderDidChange:(id)a3;
- (void)updateAccessibilityBalanceValue;
- (void)updateAccessibilityToneValue;
- (void)updateValue;
@end

@implementation HACCPSESettings

- (HACCPSESettings)initWithFrame:(CGRect)a3
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  v99.receiver = self;
  v99.super_class = (Class)HACCPSESettings;
  val = -[HACCPSESettings initWithFrame:](&v99, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (val)
  {
    v3 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    unsigned int v4 = [v3 getAACPCapabilityInteger:6];

    PAInitializeLogging();
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"Found PSE device with version %lu", v4);
    v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HACCPSESettings initWithFrame:]", 57, v5];
    v7 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = v7;
      uint64_t v10 = [v8 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v102 = v10;
      _os_log_impl(&dword_226B65000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    int v11 = _os_feature_enabled_impl();
    if (v4 > 1) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    int v89 = v12;
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = val->_numberFormatter;
    val->_numberFormatter = v13;

    [(NSNumberFormatter *)val->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)val->_numberFormatter setPercentSymbol:&stru_26DAB2B88];
    [(NSNumberFormatter *)val->_numberFormatter setMaximumFractionDigits:0];
    v15 = val->_numberFormatter;
    v16 = [NSNumber numberWithInt:0];
    v17 = [(NSNumberFormatter *)v15 stringFromNumber:v16];
    [(NSNumberFormatter *)v15 setNotANumberSymbol:v17];

    v95 = [MEMORY[0x263F825C8] whiteColor];
    unsigned int v94 = HUICCLargeTextEnabled();
    v18 = objc_alloc_init(HACCStackView);
    stackView = val->_stackView;
    val->_stackView = v18;

    [(HACCStackView *)val->_stackView setAxis:1];
    [(HACCStackView *)val->_stackView setAlignment:0];
    [(HACCStackView *)val->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HACCPSESettings *)val addSubview:val->_stackView];
    v90 = (void *)MEMORY[0x263F08938];
    v93 = [(HACCStackView *)val->_stackView leadingAnchor];
    v92 = [(HACCPSESettings *)val leadingAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v100[0] = v91;
    v20 = [(HACCStackView *)val->_stackView trailingAnchor];
    v21 = [(HACCPSESettings *)val trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v100[1] = v22;
    v23 = [(HACCStackView *)val->_stackView topAnchor];
    v24 = [(HACCPSESettings *)val topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v100[2] = v25;
    v26 = [(HACCStackView *)val->_stackView bottomAnchor];
    v27 = [(HACCPSESettings *)val bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v100[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:4];
    [v90 activateConstraints:v29];

    v30 = objc_alloc_init(HUISliderConfig);
    [(HUISliderConfig *)v30 setStyle:2];
    v31 = [MEMORY[0x263F827E8] _systemImageNamed:@"speaker.fill"];
    v32 = [v31 imageWithTintColor:v95 renderingMode:1];
    [(HUISliderConfig *)v30 setMinImage:v32];

    v33 = HUICCMenuTextLabel();
    [(HUISliderConfig *)v30 setValueLabel:v33];

    [(HUISliderConfig *)v30 setIsLargeText:v94];
    v34 = [[HUITitleDarkStepSliderView alloc] initWithConfig:v30];
    amplificationSlider = val->_amplificationSlider;
    val->_amplificationSlider = v34;

    [(HUITitleDarkStepSliderView *)val->_amplificationSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [(HUITitleDarkStepSliderView *)val->_amplificationSlider slider];
    [v36 addTarget:val action:sel_amplificationSliderDidChange_ forControlEvents:4096];

    v37 = val->_amplificationSlider;
    v38 = hearingLocString();
    [(HUITitleDarkStepSliderView *)v37 setAccessibilityLabel:v38];

    v39 = [(HUITitleDarkStepSliderView *)val->_amplificationSlider titleLabel];
    v40 = hearingLocString();
    [v39 setText:v40];

    v41 = [(HUITitleDarkStepSliderView *)val->_amplificationSlider slider];
    [v41 setDrawsEndTicks:0];

    [(HACCStackView *)val->_stackView addArrangedSubview:val->_amplificationSlider withSeparator:0];
    v42 = objc_alloc_init(HUISliderConfig);
    [(HUISliderConfig *)v42 setStyle:3];
    v43 = HUICCMenuTextLabel();
    [(HUISliderConfig *)v42 setMinTextLabel:v43];

    v44 = [(HUISliderConfig *)v42 minTextLabel];
    v45 = hearingLocString();
    [v44 setText:v45];

    v46 = HUICCMenuTextLabel();
    [(HUISliderConfig *)v42 setValueLabel:v46];

    v47 = [(HUISliderConfig *)v42 valueLabel];
    v48 = hearingLocString();
    [v47 setText:v48];

    [(HUISliderConfig *)v42 setIsLargeText:v94];
    v49 = [[HUITitleDarkStepSliderView alloc] initWithConfig:v42];
    balanceSlider = val->_balanceSlider;
    val->_balanceSlider = v49;

    [(HUITitleDarkStepSliderView *)val->_balanceSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = [(HUITitleDarkStepSliderView *)val->_balanceSlider slider];
    [v51 addTarget:val action:sel_balanceSliderDidChange_ forControlEvents:4096];

    v52 = val->_balanceSlider;
    v53 = hearingLocString();
    [(HUITitleDarkStepSliderView *)v52 setAccessibilityLabel:v53];

    v54 = [(HUITitleDarkStepSliderView *)val->_balanceSlider titleLabel];
    v55 = hearingLocString();
    [v54 setText:v55];

    v56 = [(HUITitleDarkStepSliderView *)val->_balanceSlider slider];
    [v56 setDrawsEndTicks:0];

    v57 = [(HUITitleDarkStepSliderView *)val->_balanceSlider slider];
    [v57 setSegmentCount:2];

    v58 = [(HUITitleDarkStepSliderView *)val->_balanceSlider slider];
    [v58 setRestrictsValuesToTicks:0];

    [(HACCStackView *)val->_stackView addArrangedSubview:val->_balanceSlider withSeparator:1];
    v59 = objc_alloc_init(HUISliderConfig);
    [(HUISliderConfig *)v59 setStyle:1];
    v60 = [MEMORY[0x263F827E8] _systemImageNamed:@"circlebadge.fill"];
    v61 = [v60 imageWithTintColor:v95 renderingMode:1];
    [(HUISliderConfig *)v59 setMinImage:v61];

    v62 = [MEMORY[0x263F827E8] _systemImageNamed:@"sun.max.fill"];
    v63 = [v62 imageWithTintColor:v95 renderingMode:1];
    [(HUISliderConfig *)v59 setMaxImage:v63];

    [(HUISliderConfig *)v59 setIsLargeText:v94];
    v64 = [[HUITitleDarkStepSliderView alloc] initWithConfig:v59];
    toneSlider = val->_toneSlider;
    val->_toneSlider = v64;

    [(HUITitleDarkStepSliderView *)val->_toneSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    v66 = [(HUITitleDarkStepSliderView *)val->_toneSlider slider];
    [v66 addTarget:val action:sel_toneSliderDidChange_ forControlEvents:4096];

    v67 = val->_toneSlider;
    v68 = hearingLocString();
    [(HUITitleDarkStepSliderView *)v67 setAccessibilityLabel:v68];

    v69 = [(HUITitleDarkStepSliderView *)val->_toneSlider titleLabel];
    v70 = hearingLocString();
    [v69 setText:v70];

    v71 = [(HUITitleDarkStepSliderView *)val->_toneSlider slider];
    [v71 setDrawsEndTicks:0];

    v72 = [(HUITitleDarkStepSliderView *)val->_toneSlider slider];
    [v72 setSegmentCount:2];

    v73 = [(HUITitleDarkStepSliderView *)val->_toneSlider slider];
    [v73 setRestrictsValuesToTicks:0];

    [(HACCStackView *)val->_stackView addArrangedSubview:val->_toneSlider withSeparator:1];
    if (v89)
    {
      v74 = objc_alloc_init(HUISliderConfig);
      [(HUISliderConfig *)v74 setStyle:2];
      v75 = [MEMORY[0x263F827E8] _systemImageNamed:@"speaker.fill"];
      v76 = [v75 imageWithTintColor:v95 renderingMode:1];
      [(HUISliderConfig *)v74 setMinImage:v76];

      v77 = HUICCMenuTextLabel();
      [(HUISliderConfig *)v74 setValueLabel:v77];

      [(HUISliderConfig *)v74 setIsLargeText:v94];
      v78 = [[HUITitleDarkStepSliderView alloc] initWithConfig:v74];
      noiseSupressorSlider = val->_noiseSupressorSlider;
      val->_noiseSupressorSlider = v78;

      [(HUITitleDarkStepSliderView *)val->_noiseSupressorSlider setTranslatesAutoresizingMaskIntoConstraints:0];
      v80 = [(HUITitleDarkStepSliderView *)val->_noiseSupressorSlider slider];
      [v80 addTarget:val action:sel_noiseSliderDidChange_ forControlEvents:4096];

      v81 = val->_noiseSupressorSlider;
      v82 = paLocString();
      [(HUITitleDarkStepSliderView *)v81 setAccessibilityLabel:v82];

      v83 = [(HUITitleDarkStepSliderView *)val->_noiseSupressorSlider titleLabel];
      v84 = paLocString();
      [v83 setText:v84];

      v85 = [(HUITitleDarkStepSliderView *)val->_noiseSupressorSlider slider];
      [v85 setDrawsEndTicks:0];

      [(HACCStackView *)val->_stackView addArrangedSubview:val->_noiseSupressorSlider withSeparator:1];
    }
    v86 = HUICCBackgroundVisualStylingProviderForCategory(2);
    [(HACCPSESettings *)val setVisualStylingProvider:v86 forCategory:2];

    [(HACCPSESettings *)val updateValue];
    objc_initWeak((id *)buf, val);
    v87 = [MEMORY[0x263F5D458] sharedInstance];
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __33__HACCPSESettings_initWithFrame___block_invoke;
    v97[3] = &unk_2647CD168;
    objc_copyWeak(&v98, (id *)buf);
    [v87 registerUpdateBlock:v97 forRetrieveSelector:sel_personalMediaEnabled withListener:val];

    objc_destroyWeak(&v98);
    objc_destroyWeak((id *)buf);
  }
  return val;
}

void __33__HACCPSESettings_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (double)currentBalance
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v3 = [v2 address];

  unsigned int v4 = [MEMORY[0x263F5D458] sharedInstance];
  [v4 transparencyBalanceForAddress:v3];
  double v6 = v5;

  v7 = [MEMORY[0x263F5D450] sharedInstance];
  int v8 = [v7 yodelEnabledForAddress:v3];

  if (v8)
  {
    v9 = [MEMORY[0x263F5D450] sharedInstance];
    [v9 balanceForAddress:v3];
    double v6 = v10;
  }
  return v6;
}

- (void)setCurrentBalance:(double)a3
{
  unsigned int v4 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v8 = [v4 address];

  double v5 = [MEMORY[0x263F5D450] sharedInstance];
  int v6 = [v5 yodelEnabledForAddress:v8];

  if (v6)
  {
    v7 = [MEMORY[0x263F5D450] sharedInstance];
    [v7 setBalance:v8 forAddress:a3];
  }
  else
  {
    v7 = [MEMORY[0x263F5D458] sharedInstance];
    [v7 setTransparencyBalance:v8 forAddress:a3];
  }
}

- (double)currentTone
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v3 = [v2 address];

  unsigned int v4 = [MEMORY[0x263F5D458] sharedInstance];
  [v4 transparencyToneForAddress:v3];
  double v6 = v5;

  v7 = [MEMORY[0x263F5D450] sharedInstance];
  int v8 = [v7 yodelEnabledForAddress:v3];

  if (v8)
  {
    v9 = [MEMORY[0x263F5D450] sharedInstance];
    [v9 toneForAddress:v3];
    double v6 = v10;
  }
  return v6;
}

- (void)setCurrentTone:(double)a3
{
  unsigned int v4 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v8 = [v4 address];

  double v5 = [MEMORY[0x263F5D450] sharedInstance];
  int v6 = [v5 yodelEnabledForAddress:v8];

  if (v6)
  {
    v7 = [MEMORY[0x263F5D450] sharedInstance];
    [v7 setTone:v8 forAddress:a3];
  }
  else
  {
    v7 = [MEMORY[0x263F5D458] sharedInstance];
    [v7 setTransparencyTone:v8 forAddress:a3];
  }
}

- (double)currentAmplification
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v3 = [v2 address];

  unsigned int v4 = [MEMORY[0x263F5D458] sharedInstance];
  [v4 transparencyAmplificationForAddress:v3];
  double v6 = v5;

  v7 = [MEMORY[0x263F5D450] sharedInstance];
  int v8 = [v7 yodelEnabledForAddress:v3];

  if (v8)
  {
    v9 = [MEMORY[0x263F5D450] sharedInstance];
    [v9 amplificationForAddress:v3];
    double v6 = v10;
  }
  return v6;
}

- (void)setCurrentAmplification:(double)a3
{
  unsigned int v4 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v8 = [v4 address];

  double v5 = [MEMORY[0x263F5D450] sharedInstance];
  int v6 = [v5 yodelEnabledForAddress:v8];

  if (v6)
  {
    v7 = [MEMORY[0x263F5D450] sharedInstance];
    [v7 setAmplification:v8 forAddress:a3];
  }
  else
  {
    v7 = [MEMORY[0x263F5D458] sharedInstance];
    [v7 setTransparencyAmplification:v8 forAddress:a3];
  }
}

- (double)currentNoiseSupressor
{
  v2 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v3 = [v2 address];

  unsigned int v4 = [MEMORY[0x263F5D458] sharedInstance];
  [v4 transparencyNoiseSupressorForAddress:v3];
  double v6 = v5;

  v7 = [MEMORY[0x263F5D450] sharedInstance];
  int v8 = [v7 yodelEnabledForAddress:v3];

  if (v8)
  {
    v9 = [MEMORY[0x263F5D450] sharedInstance];
    [v9 noiseSupressorForAddress:v3];
    double v6 = v10;
  }
  return v6;
}

- (void)setCurrentNoiseSupressor:(double)a3
{
  unsigned int v4 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v8 = [v4 address];

  double v5 = [MEMORY[0x263F5D450] sharedInstance];
  int v6 = [v5 yodelEnabledForAddress:v8];

  if (v6)
  {
    v7 = [MEMORY[0x263F5D450] sharedInstance];
    [v7 setNoiseSupressor:v8 forAddress:a3];
  }
  else
  {
    v7 = [MEMORY[0x263F5D458] sharedInstance];
    [v7 setTransparencyNoiseSupressor:v8 forAddress:a3];
  }
}

- (void)updateAccessibilityBalanceValue
{
  [(HACCPSESettings *)self currentBalance];
  double v4 = v3;
  paLocString();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 > 0.5)
  {
    uint64_t v5 = paLocString();

    id v14 = (id)v5;
  }
  double v6 = v4 + -0.5;
  v7 = paLocString();
  if (v6 != 0.0)
  {
    double v8 = fabs(v6);
    v9 = NSString;
    numberFormatter = self->_numberFormatter;
    int v11 = [NSNumber numberWithDouble:v8 + v8];
    int v12 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v11];
    uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v14, v12);

    v7 = (void *)v13;
  }
  [(HUITitleDarkStepSliderView *)self->_balanceSlider setAccessibilityValue:v7];
}

- (void)updateAccessibilityToneValue
{
  [(HACCPSESettings *)self currentTone];
  double v4 = v3;
  paLocString();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 > 0.5)
  {
    uint64_t v5 = paLocString();

    id v14 = (id)v5;
  }
  double v6 = v4 + -0.5;
  v7 = paLocString();
  if (v6 != 0.0)
  {
    double v8 = fabs(v6);
    v9 = NSString;
    numberFormatter = self->_numberFormatter;
    int v11 = [NSNumber numberWithDouble:v8 + v8];
    int v12 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v11];
    uint64_t v13 = objc_msgSend(v9, "stringWithFormat:", v14, v12);

    v7 = (void *)v13;
  }
  [(HUITitleDarkStepSliderView *)self->_toneSlider setAccessibilityValue:v7];
}

- (void)amplificationSliderDidChange:(id)a3
{
  [a3 value];
  double v5 = v4;
  numberFormatter = self->_numberFormatter;
  v7 = [NSNumber numberWithDouble:v4];
  id v9 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v7];

  double v8 = [(HUITitleDarkStepSliderView *)self->_amplificationSlider valueLabel];
  [v8 setText:v9];

  [(HUITitleDarkStepSliderView *)self->_amplificationSlider setAccessibilityValue:v9];
  [(HACCPSESettings *)self setCurrentAmplification:v5];
}

- (void)balanceSliderDidChange:(id)a3
{
  [a3 value];
  [(HACCPSESettings *)self setCurrentBalance:v4];
  [(HACCPSESettings *)self updateAccessibilityBalanceValue];
}

- (void)toneSliderDidChange:(id)a3
{
  [a3 value];
  [(HACCPSESettings *)self setCurrentTone:v4];
  [(HACCPSESettings *)self updateAccessibilityToneValue];
}

- (void)noiseSliderDidChange:(id)a3
{
  [a3 value];
  double v5 = v4;
  numberFormatter = self->_numberFormatter;
  v7 = [NSNumber numberWithDouble:v4];
  id v9 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v7];

  double v8 = [(HUITitleDarkStepSliderView *)self->_noiseSupressorSlider valueLabel];
  [v8 setText:v9];

  [(HUITitleDarkStepSliderView *)self->_noiseSupressorSlider setAccessibilityValue:v9];
  [(HACCPSESettings *)self setCurrentNoiseSupressor:v5];
}

- (void)updateValue
{
  [(HACCPSESettings *)self currentAmplification];
  double v4 = v3;
  double v5 = [(HUITitleDarkStepSliderView *)self->_amplificationSlider valueLabel];
  numberFormatter = self->_numberFormatter;
  v7 = [NSNumber numberWithDouble:v4];
  double v8 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v7];
  [v5 setText:v8];

  id v9 = [(HUITitleDarkStepSliderView *)self->_amplificationSlider slider];
  *(float *)&double v10 = v4;
  [v9 setValue:v10];

  int v11 = [(HUITitleDarkStepSliderView *)self->_balanceSlider slider];
  [(HACCPSESettings *)self currentBalance];
  *(float *)&double v12 = v12;
  [v11 setValue:v12];

  uint64_t v13 = [(HUITitleDarkStepSliderView *)self->_toneSlider slider];
  [(HACCPSESettings *)self currentTone];
  *(float *)&double v14 = v14;
  [v13 setValue:v14];

  [(HACCPSESettings *)self currentNoiseSupressor];
  double v16 = v15;
  v17 = [(HUITitleDarkStepSliderView *)self->_noiseSupressorSlider valueLabel];
  v18 = self->_numberFormatter;
  v19 = [NSNumber numberWithDouble:v16];
  v20 = [(NSNumberFormatter *)v18 stringFromNumber:v19];
  [v17 setText:v20];

  v21 = [(HUITitleDarkStepSliderView *)self->_noiseSupressorSlider slider];
  *(float *)&double v22 = v16;
  [v21 setValue:v22];

  [(HACCPSESettings *)self updateAccessibilityBalanceValue];
  [(HACCPSESettings *)self updateAccessibilityToneValue];
  v23 = [(HUITitleDarkStepSliderView *)self->_amplificationSlider valueLabel];
  v24 = self->_numberFormatter;
  v25 = [NSNumber numberWithDouble:v4];
  v26 = [(NSNumberFormatter *)v24 stringFromNumber:v25];
  [v23 setText:v26];

  amplificationSlider = self->_amplificationSlider;
  v28 = [(HUITitleDarkStepSliderView *)amplificationSlider valueLabel];
  v29 = [v28 text];
  [(HUITitleDarkStepSliderView *)amplificationSlider setAccessibilityValue:v29];

  noiseSupressorSlider = self->_noiseSupressorSlider;
  v31 = [(HUITitleDarkStepSliderView *)noiseSupressorSlider valueLabel];
  v32 = [v31 text];
  [(HUITitleDarkStepSliderView *)noiseSupressorSlider setAccessibilityValue:v32];

  uint64_t v33 = HUICCLargeTextEnabled();
  [(HUITitleDarkStepSliderView *)self->_amplificationSlider setIsLargeText:v33];
  [(HUITitleDarkStepSliderView *)self->_balanceSlider setIsLargeText:v33];
  [(HUITitleDarkStepSliderView *)self->_toneSlider setIsLargeText:v33];
  [(HUITitleDarkStepSliderView *)self->_noiseSupressorSlider setIsLargeText:v33];
  HUICCBackgroundVisualStylingProviderForCategory(2);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  [(HACCPSESettings *)self setVisualStylingProvider:v34 forCategory:2];
}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  return (id)MEMORY[0x263EFFA88];
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26DAB9B08;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HACCPSESettings *)self requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__HACCPSESettings_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_2647CD360;
    id v11 = v6;
    double v12 = self;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __56__HACCPSESettings_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  id v26 = [*(id *)(a1 + 32) _visualStylingForStyle:1];
  v2 = [*(id *)(a1 + 40) amplificationSlider];
  double v3 = [v2 slider];
  double v4 = [v26 color];
  [v3 setMaximumTrackTintColor:v4];

  double v5 = [*(id *)(a1 + 40) amplificationSlider];
  id v6 = [v5 slider];
  v7 = [v6 _maxTrackView];
  objc_msgSend(v7, "mt_replaceVisualStyling:", v26);

  double v8 = [*(id *)(a1 + 40) balanceSlider];
  int v9 = [v8 slider];
  double v10 = [v9 _minTrackView];
  objc_msgSend(v10, "mt_replaceVisualStyling:", v26);

  id v11 = [*(id *)(a1 + 40) balanceSlider];
  double v12 = [v11 slider];
  uint64_t v13 = [v12 _maxTrackView];
  objc_msgSend(v13, "mt_replaceVisualStyling:", v26);

  double v14 = [*(id *)(a1 + 40) toneSlider];
  double v15 = [v14 slider];
  double v16 = [v15 _minTrackView];
  objc_msgSend(v16, "mt_replaceVisualStyling:", v26);

  v17 = [*(id *)(a1 + 40) toneSlider];
  v18 = [v17 slider];
  v19 = [v18 _maxTrackView];
  objc_msgSend(v19, "mt_replaceVisualStyling:", v26);

  v20 = [*(id *)(a1 + 40) noiseSupressorSlider];
  v21 = [v20 slider];
  double v22 = [v26 color];
  [v21 setMaximumTrackTintColor:v22];

  v23 = [*(id *)(a1 + 40) noiseSupressorSlider];
  v24 = [v23 slider];
  v25 = [v24 _maxTrackView];
  objc_msgSend(v25, "mt_replaceVisualStyling:", v26);
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

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (HACCStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (HUITitleDarkStepSliderView)amplificationSlider
{
  return self->_amplificationSlider;
}

- (void)setAmplificationSlider:(id)a3
{
}

- (HUITitleDarkStepSliderView)balanceSlider
{
  return self->_balanceSlider;
}

- (void)setBalanceSlider:(id)a3
{
}

- (HUITitleDarkStepSliderView)toneSlider
{
  return self->_toneSlider;
}

- (void)setToneSlider:(id)a3
{
}

- (HUITitleDarkStepSliderView)noiseSupressorSlider
{
  return self->_noiseSupressorSlider;
}

- (void)setNoiseSupressorSlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseSupressorSlider, 0);
  objc_storeStrong((id *)&self->_toneSlider, 0);
  objc_storeStrong((id *)&self->_balanceSlider, 0);
  objc_storeStrong((id *)&self->_amplificationSlider, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end