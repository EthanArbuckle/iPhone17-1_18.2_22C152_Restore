@interface AXUISettingsSpeechRateSliderCell
- (AXUISettingsSpeechRateSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (Class)sliderCellClass;
- (NSArray)buttonConstraints;
- (NSArray)extraLargeTextButtonConstraints;
- (NSArray)largeTextButtonConstraints;
- (NSNumber)defaultValue;
- (UIButton)fastButton;
- (UIButton)slowButton;
- (UILabel)valueLabel;
- (UISlider)sliderView;
- (double)displayValue;
- (id)accessibilityLabel;
- (id)labelColor;
- (id)newControl;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_changeSpeechRateFromButton:(BOOL)a3;
- (void)_changeValueBySpeechRateIncrementWithSnapToDefault:(double)a3 snapThreshold:(double)a4;
- (void)_updateAccessibilityValueBlock;
- (void)_updateButtonShapes;
- (void)_updateTextSizeLayout;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)applyHapticIfNecessary:(id)a3;
- (void)handleSliderBeingDragged:(id)a3;
- (void)handleSliderDidFinishDrag:(id)a3;
- (void)layoutSubviews;
- (void)setButtonConstraints:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setExtraLargeTextButtonConstraints:(id)a3;
- (void)setFastButton:(id)a3;
- (void)setLargeTextButtonConstraints:(id)a3;
- (void)setSliderView:(id)a3;
- (void)setSlowButton:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)updateValue;
- (void)userSelectedValue;
@end

@implementation AXUISettingsSpeechRateSliderCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (AXUISettingsSpeechRateSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v169[1] = *MEMORY[0x1E4F143B8];
  v164.receiver = self;
  v164.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  id v151 = a4;
  id v153 = a5;
  v7 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v164, sel_initWithStyle_reuseIdentifier_specifier_, a3, v151);
  v8 = v7;
  if (v7)
  {
    id v9 = objc_alloc([(AXUISettingsSpeechRateSliderCell *)v7 sliderCellClass]);
    v154 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v154 setPostTickColor:v10];

    v11 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [v154 setTrackFillColor:v11];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [v154 setMinimumTrackTintColor:v12];

    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v154 setMaximumTrackTintColor:v13];

    [v154 setTickHeight:16.0];
    [(AXUISettingsSpeechRateSliderCell *)v8 setSliderView:v154];
    [v154 setContinuous:1];
    v14 = [v153 propertyForKey:*MEMORY[0x1E4F93110]];
    [(AXUISettingsSpeechRateSliderCell *)v8 setDefaultValue:v14];

    v15 = [(AXUISettingsSpeechRateSliderCell *)v8 defaultValue];
    v169[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:1];
    [v154 setTicks:v16];

    [v154 addTarget:v8 action:sel_handleSliderBeingDragged_ forControlEvents:4096];
    [v154 addTarget:v8 action:sel_handleSliderDidFinishDrag_ forControlEvents:192];
    [v154 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v17) = 1148846080;
    [v154 setContentCompressionResistancePriority:1 forAxis:v17];
    v18 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    [v18 addSubview:v154];

    objc_initWeak(&location, v8);
    v19 = (void *)MEMORY[0x1E4FB13F0];
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v161[3] = &unk_1E649C360;
    objc_copyWeak(&v162, &location);
    v142 = [v19 actionWithTitle:&stru_1F1F0EB90 image:0 identifier:0 handler:v161];
    v20 = (void *)MEMORY[0x1E4FB13F0];
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2;
    v159[3] = &unk_1E649C360;
    objc_copyWeak(&v160, &location);
    v141 = [v20 actionWithTitle:&stru_1F1F0EB90 image:0 identifier:0 handler:v159];
    v152 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v21 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
    [v152 setPreferredSymbolConfigurationForImage:v21];

    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"tortoise.fill"];
    v23 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v140 = [v22 imageWithTintColor:v23 renderingMode:1];

    uint64_t v24 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v152 primaryAction:v142];
    slowButton = v8->_slowButton;
    v8->_slowButton = (UIButton *)v24;

    [(UIButton *)v8->_slowButton _setWantsAccessibilityUnderline:0];
    LODWORD(v26) = 1144750080;
    [(UIButton *)v8->_slowButton setContentHuggingPriority:0 forAxis:v26];
    [(UIButton *)v8->_slowButton setImage:v140 forState:0];
    v27 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    [v27 addSubview:v8->_slowButton];

    uint64_t v28 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v152 primaryAction:v141];
    fastButton = v8->_fastButton;
    v8->_fastButton = (UIButton *)v28;

    v30 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hare.fill"];
    v31 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v139 = [v30 imageWithTintColor:v31 renderingMode:1];

    [(UIButton *)v8->_fastButton setImage:v139 forState:0];
    [(UIButton *)v8->_fastButton _setWantsAccessibilityUnderline:0];
    LODWORD(v32) = 1144750080;
    [(UIButton *)v8->_fastButton setContentHuggingPriority:0 forAxis:v32];
    [(UIButton *)v8->_fastButton setContentHorizontalAlignment:3];
    [(UIButton *)v8->_fastButton setContentVerticalAlignment:3];
    v33 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    [v33 addSubview:v8->_fastButton];

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v34;

    [(UILabel *)v8->_valueLabel setAdjustsFontForContentSizeCategory:1];
    v36 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v8->_valueLabel setFont:v36];

    LODWORD(v37) = 1144750080;
    [(UILabel *)v8->_valueLabel setContentHuggingPriority:0 forAxis:v37];
    v38 = [(AXUISettingsSpeechRateSliderCell *)v8 labelColor];
    [(UILabel *)v8->_valueLabel setTextColor:v38];

    v39 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    [v39 addSubview:v8->_valueLabel];

    [(UIButton *)v8->_fastButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v8->_slowButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v41 = [MEMORY[0x1E4F28F08] mainQueue];
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_3;
    v157[3] = &unk_1E649C1E8;
    objc_copyWeak(&v158, &location);
    id v42 = (id)[v40 addObserverForName:*MEMORY[0x1E4FB2428] object:0 queue:v41 usingBlock:v157];

    [(AXUISettingsSpeechRateSliderCell *)v8 _updateButtonShapes];
    v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v44 = [MEMORY[0x1E4F28F08] mainQueue];
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_4;
    v155[3] = &unk_1E649C1E8;
    objc_copyWeak(&v156, &location);
    id v45 = (id)[v43 addObserverForName:*MEMORY[0x1E4FB27A8] object:0 queue:v44 usingBlock:v155];

    v93 = [v153 propertyForKey:@"SpeechRateProperty"];
    double v46 = v93[2]();
    v47 = [(AXUISettingsSpeechRateSliderCell *)v8 sliderView];
    *(float *)&double v48 = v46;
    [v47 setValue:v48];

    [(AXUISettingsSpeechRateSliderCell *)v8 _updateAccessibilityValueBlock];
    v147 = [(UILabel *)v8->_valueLabel topAnchor];
    v143 = [v154 bottomAnchor];
    v49 = [v147 constraintEqualToAnchor:v143 constant:5.0];
    v168[0] = v49;
    v50 = [(UILabel *)v8->_valueLabel bottomAnchor];
    v51 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v52 = [v51 bottomAnchor];
    v53 = [v50 constraintEqualToAnchor:v52 constant:-5.0];
    v168[1] = v53;
    v54 = [(UILabel *)v8->_valueLabel centerXAnchor];
    v55 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v56 = [v55 centerXAnchor];
    v57 = [v54 constraintEqualToAnchor:v56 constant:0.0];
    v168[2] = v57;
    v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:3];

    v148 = [v154 leadingAnchor];
    v144 = [(UIButton *)v8->_slowButton trailingAnchor];
    v136 = [v148 constraintEqualToAnchor:v144 constant:10.0];
    v167[0] = v136;
    v133 = [v154 trailingAnchor];
    v130 = [(UIButton *)v8->_fastButton leadingAnchor];
    v127 = [v133 constraintEqualToAnchor:v130 constant:-10.0];
    v167[1] = v127;
    v124 = [v154 centerYAnchor];
    v121 = [(UIButton *)v8->_fastButton centerYAnchor];
    v118 = [v124 constraintEqualToAnchor:v121 constant:0.0];
    v167[2] = v118;
    v112 = [(UIButton *)v8->_slowButton topAnchor];
    v115 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v109 = [v115 topAnchor];
    v106 = [v112 constraintEqualToAnchor:v109 constant:5.0];
    v167[3] = v106;
    v100 = [(UIButton *)v8->_fastButton topAnchor];
    v103 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v97 = [v103 topAnchor];
    v94 = [v100 constraintEqualToAnchor:v97 constant:5.0];
    v167[4] = v94;
    v58 = [(UIButton *)v8->_slowButton leadingAnchor];
    v59 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v60 = [v59 leadingAnchor];
    v61 = [v58 constraintEqualToAnchor:v60 constant:0.0];
    v167[5] = v61;
    v62 = [(UIButton *)v8->_fastButton trailingAnchor];
    v63 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v64 = [v63 trailingAnchor];
    v65 = [v62 constraintEqualToAnchor:v64 constant:0.0];
    v167[6] = v65;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:7];
    [(AXUISettingsSpeechRateSliderCell *)v8 setButtonConstraints:v66];

    v145 = [v154 leadingAnchor];
    v149 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v137 = [v149 leadingAnchor];
    v134 = [v145 constraintEqualToAnchor:v137 constant:15.0];
    v166[0] = v134;
    v128 = [v154 trailingAnchor];
    v131 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v125 = [v131 trailingAnchor];
    v122 = [v128 constraintEqualToAnchor:v125 constant:-15.0];
    v166[1] = v122;
    v116 = [v154 topAnchor];
    v119 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v113 = [v119 topAnchor];
    v110 = [v116 constraintEqualToAnchor:v113 constant:5.0];
    v166[2] = v110;
    v104 = [(UIButton *)v8->_slowButton bottomAnchor];
    v107 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v101 = [v107 bottomAnchor];
    v98 = [v104 constraintEqualToAnchor:v101 constant:-5.0];
    v166[3] = v98;
    v91 = [(UIButton *)v8->_fastButton bottomAnchor];
    v95 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v89 = [v95 bottomAnchor];
    v87 = [v91 constraintEqualToAnchor:v89 constant:-5.0];
    v166[4] = v87;
    v67 = [(UIButton *)v8->_slowButton leadingAnchor];
    v68 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v69 = [v68 leadingAnchor];
    v70 = [v67 constraintEqualToAnchor:v69 constant:0.0];
    v166[5] = v70;
    v71 = [(UIButton *)v8->_fastButton trailingAnchor];
    v72 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v73 = [v72 trailingAnchor];
    v74 = [v71 constraintEqualToAnchor:v73 constant:0.0];
    v166[6] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:7];
    [(AXUISettingsSpeechRateSliderCell *)v8 setLargeTextButtonConstraints:v75];

    v146 = [v154 leadingAnchor];
    v150 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v138 = [v150 leadingAnchor];
    v135 = [v146 constraintEqualToAnchor:v138 constant:15.0];
    v165[0] = v135;
    v129 = [v154 trailingAnchor];
    v132 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v126 = [v132 trailingAnchor];
    v123 = [v129 constraintEqualToAnchor:v126 constant:-15.0];
    v165[1] = v123;
    v117 = [v154 topAnchor];
    v120 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v114 = [v120 topAnchor];
    v111 = [v117 constraintEqualToAnchor:v114 constant:5.0];
    v165[2] = v111;
    v105 = [(UIButton *)v8->_slowButton bottomAnchor];
    v108 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v102 = [v108 bottomAnchor];
    v99 = [v105 constraintEqualToAnchor:v102 constant:-5.0];
    v165[3] = v99;
    v92 = [(UIButton *)v8->_fastButton bottomAnchor];
    v96 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v90 = [v96 bottomAnchor];
    v88 = [v92 constraintEqualToAnchor:v90 constant:-5.0];
    v165[4] = v88;
    v76 = [(UIButton *)v8->_slowButton leadingAnchor];
    v77 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v78 = [v77 leadingAnchor];
    v79 = [v76 constraintEqualToAnchor:v78 constant:-20.0];
    v165[5] = v79;
    v80 = [(UIButton *)v8->_fastButton trailingAnchor];
    v81 = [(AXUISettingsSpeechRateSliderCell *)v8 contentView];
    v82 = [v81 trailingAnchor];
    v83 = [v80 constraintEqualToAnchor:v82 constant:20.0];
    v165[6] = v83;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:7];
    [(AXUISettingsSpeechRateSliderCell *)v8 setExtraLargeTextButtonConstraints:v84];

    [MEMORY[0x1E4F28DC8] activateConstraints:v86];
    [(AXUISettingsSpeechRateSliderCell *)v8 _updateTextSizeLayout];
    [(AXUISettingsSpeechRateSliderCell *)v8 setNeedsLayout];
    [(AXUISettingsSpeechRateSliderCell *)v8 layoutIfNeeded];

    objc_destroyWeak(&v156);
    objc_destroyWeak(&v158);

    objc_destroyWeak(&v160);
    objc_destroyWeak(&v162);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeSpeechRateFromButton:0];
}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _changeSpeechRateFromButton:1];
}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateButtonShapes];
}

void __76__AXUISettingsSpeechRateSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTextSizeLayout];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  [(AXUISettingsSpeechRateSliderCell *)&v3 _accessibilityLoadAccessibilityInformation];
  [(AXUISettingsSpeechRateSliderCell *)self _updateAccessibilityValueBlock];
}

- (void)_updateTextSizeLayout
{
  objc_super v3 = [(AXUISettingsSpeechRateSliderCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    v6 = [(AXUISettingsSpeechRateSliderCell *)self traitCollection];
    v7 = [v6 preferredContentSizeCategory];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4FB2778]];

    id v9 = (void *)MEMORY[0x1E4F28DC8];
    if (v8)
    {
      v10 = [(AXUISettingsSpeechRateSliderCell *)self largeTextButtonConstraints];
      [v9 deactivateConstraints:v10];

      v11 = (void *)MEMORY[0x1E4F28DC8];
      v12 = [(AXUISettingsSpeechRateSliderCell *)self buttonConstraints];
      [v11 deactivateConstraints:v12];

      v13 = (void *)MEMORY[0x1E4F28DC8];
      [(AXUISettingsSpeechRateSliderCell *)self extraLargeTextButtonConstraints];
    }
    else
    {
      v19 = [(AXUISettingsSpeechRateSliderCell *)self buttonConstraints];
      [v9 deactivateConstraints:v19];

      v20 = (void *)MEMORY[0x1E4F28DC8];
      v21 = [(AXUISettingsSpeechRateSliderCell *)self extraLargeTextButtonConstraints];
      [v20 deactivateConstraints:v21];

      v13 = (void *)MEMORY[0x1E4F28DC8];
      [(AXUISettingsSpeechRateSliderCell *)self largeTextButtonConstraints];
    uint64_t v14 = };
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28DC8];
    v16 = [(AXUISettingsSpeechRateSliderCell *)self extraLargeTextButtonConstraints];
    [v15 deactivateConstraints:v16];

    double v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = [(AXUISettingsSpeechRateSliderCell *)self largeTextButtonConstraints];
    [v17 deactivateConstraints:v18];

    v13 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v14 = [(AXUISettingsSpeechRateSliderCell *)self buttonConstraints];
  }
  id v22 = (id)v14;
  objc_msgSend(v13, "activateConstraints:");
}

- (void)_updateAccessibilityValueBlock
{
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke;
    v6[3] = &unk_1E649C388;
    objc_copyWeak(&v7, &location);
    [(AXUISettingsSpeechRateSliderCell *)self _setAccessibilityValueBlock:v6];
    objc_super v3 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke_2;
    v4[3] = &unk_1E649C388;
    objc_copyWeak(&v5, &location);
    [v3 _setAccessibilityValueBlock:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

id __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained[154] text];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

id __66__AXUISettingsSpeechRateSliderCell__updateAccessibilityValueBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained[154] text];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)_updateButtonShapes
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  slowButton = self->_slowButton;
  v40[0] = self->_fastButton;
  v40[1] = slowButton;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v36;
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v25 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      uint64_t v27 = v4;
      do
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        if (UIAccessibilityButtonShapesEnabled())
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
          [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
          v13 = [v12 layer];
          [v13 setCornerRadius:8.0];

          uint64_t v14 = [(AXUISettingsSpeechRateSliderCell *)self traitCollection];
          uint64_t v15 = [v14 userInterfaceStyle];

          if (v15 == 2) {
            [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
          }
          else {
          double v17 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
          }
          objc_msgSend(v12, "setBackgroundColor:", v17, v25);

          [v12 setTag:123456];
          [v12 setUserInteractionEnabled:0];
          [v11 addSubview:v12];
          v30 = (void *)MEMORY[0x1E4F28DC8];
          v16 = [v12 centerXAnchor];
          v34 = [v11 centerXAnchor];
          v33 = [v16 constraintEqualToAnchor:v34];
          v39[0] = v33;
          double v32 = [v12 centerYAnchor];
          v31 = [v11 centerYAnchor];
          v29 = [v32 constraintEqualToAnchor:v31];
          v39[1] = v29;
          v18 = [v12 widthAnchor];
          v19 = [v11 widthAnchor];
          v20 = [v18 constraintEqualToAnchor:v19 multiplier:0.8];
          v39[2] = v20;
          v21 = [v12 heightAnchor];
          id v22 = [v11 heightAnchor];
          v23 = [v21 constraintEqualToAnchor:v22 multiplier:0.8];
          v39[3] = v23;
          uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
          [v30 activateConstraints:v24];

          uint64_t v5 = v25;
          uint64_t v4 = v27;
        }
        else
        {
          v12 = [v11 subviews];
          v16 = (void *)[v12 copy];
          [v16 enumerateObjectsUsingBlock:&__block_literal_global_4];
        }

        ++v10;
      }
      while (v4 != v10);
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }
}

void __55__AXUISettingsSpeechRateSliderCell__updateButtonShapes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 tag] == 123456) {
    [v2 removeFromSuperview];
  }
}

- (void)applyHapticIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSTableCell *)self specifier];
  uint64_t v14 = [v5 propertyForKey:@"SpeechShouldPlayHapticDistance"];

  [v4 doubleValue];
  double v7 = v6;

  double v8 = [(AXUISettingsSpeechRateSliderCell *)self defaultValue];
  [v8 doubleValue];
  double v10 = v14[2](v7, v9);

  if (v10 >= 0.01 || self->_hapticPlayedValue)
  {
    if (v10 > 0.02) {
      self->_hapticPlayedValue = 0;
    }
  }
  else
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      v12 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
      v13 = self->_hapticGenerator;
      self->_hapticGenerator = v12;

      hapticGenerator = self->_hapticGenerator;
    }
    [(UIImpactFeedbackGenerator *)hapticGenerator impactOccurred];
    self->_hapticPlayedValue = 1;
  }
}

- (void)_changeValueBySpeechRateIncrementWithSnapToDefault:(double)a3 snapThreshold:(double)a4
{
  double v7 = [(PSTableCell *)self specifier];
  id v22 = [v7 propertyForKey:@"SpeechRateFormatterProperty"];

  double v8 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v8 value];
  double v10 = v22[2](v9) / 100.0;

  double v11 = ((double (*)(double (**)(double), double))v22[2])(v22, 1.0) / 100.0;
  double v12 = fmax(v10 + a3, 0.0);
  if (v11 >= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  uint64_t v14 = [(AXUISettingsSpeechRateSliderCell *)self defaultValue];
  [v14 doubleValue];
  double v15 = vabdd_f64(v13, ((double (*)(double (**)(double)))v22[2])(v22) / 100.0);

  if (v15 < a4)
  {
    v16 = [(AXUISettingsSpeechRateSliderCell *)self defaultValue];
    [v16 doubleValue];
    double v13 = ((double (*)(void))v22[2])() / 100.0;
  }
  double v17 = [(PSTableCell *)self specifier];
  v18 = [v17 propertyForKey:@"SpeechRateForSliderValueProperty"];

  float v19 = v18[2](v18, v13);
  v20 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  *(float *)&double v21 = v19;
  [v20 setValue:v21];
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [(AXUISettingsSpeechRateSliderCell *)self _changeValueBySpeechRateIncrementWithSnapToDefault:0.0 snapThreshold:0.03];
  uint64_t v5 = NSNumber;
  [v4 value];
  int v7 = v6;

  LODWORD(v8) = v7;
  float v9 = [v5 numberWithFloat:v8];
  [(AXUISettingsSpeechRateSliderCell *)self applyHapticIfNecessary:v9];

  [(AXUISettingsSpeechRateSliderCell *)self updateValue];
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)handleSliderDidFinishDrag:(id)a3
{
  [(AXUISettingsSpeechRateSliderCell *)self updateValue];
  [(AXUISettingsSpeechRateSliderCell *)self userSelectedValue];
}

- (void)_changeSpeechRateFromButton:(BOOL)a3
{
  double v4 = -0.1;
  if (a3) {
    double v4 = 0.1;
  }
  [(AXUISettingsSpeechRateSliderCell *)self _changeValueBySpeechRateIncrementWithSnapToDefault:v4 snapThreshold:0.05];
  [(AXUISettingsSpeechRateSliderCell *)self updateValue];
  [(AXUISettingsSpeechRateSliderCell *)self userSelectedValue];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSpeechRateSliderCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(AXUISettingsSpeechRateSliderCell *)self updateValue];
}

- (double)displayValue
{
  objc_super v3 = [(PSTableCell *)self specifier];
  double v4 = [v3 propertyForKey:@"SpeechRateFormatterProperty"];

  if (v4)
  {
    double v5 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
    [v5 value];
    double v7 = v4[2](v4, v6);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)updateValue
{
  objc_super v3 = AXUILocalizedStringForKey(@"SPEECH_RATE_PERCENTAGE");
  [(AXUISettingsSpeechRateSliderCell *)self displayValue];
  uint64_t v26 = v4;
  double v5 = AXCFormattedString();
  -[UILabel setText:](self->_valueLabel, "setText:", v5, v26);

  float v6 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v6 setNeedsDisplay];

  double v7 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v7 value];
  float v9 = v8;
  double v10 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v10 minimumValue];
  float v12 = v11;

  if (v9 <= v12)
  {
    uint64_t v19 = 1201;
    if (self->_playedSlowBounce) {
      goto LABEL_9;
    }
    uint64_t v20 = 1224;
    goto LABEL_8;
  }
  double v13 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v13 value];
  float v15 = v14;
  v16 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
  [v16 maximumValue];
  float v18 = v17;

  uint64_t v19 = 1202;
  if (v15 < v18)
  {
    self->_playedFastBounce = 0;
    self->_playedSlowBounce = 0;
    goto LABEL_9;
  }
  if (!self->_playedFastBounce)
  {
    uint64_t v20 = 1216;
LABEL_8:
    double v21 = [*(id *)((char *)&self->super.super.super.super.super.isa + v20) imageView];
    id v22 = [MEMORY[0x1E4F41A30] effect];
    [v21 addSymbolEffect:v22];

    *((unsigned char *)&self->super.super.super.super.super.isa + v19) = 1;
  }
LABEL_9:
  v23 = [(PSTableCell *)self specifier];
  uint64_t v27 = [v23 propertyForKey:@"SpeechRateChangedProperty"];

  if (v27)
  {
    uint64_t v24 = [(AXUISettingsSpeechRateSliderCell *)self sliderView];
    [v24 value];
    v27[2](v25);
  }
}

- (void)userSelectedValue
{
  id v2 = [(PSTableCell *)self specifier];
  uint64_t v4 = [v2 propertyForKey:@"SpeechRateSelectedProperty"];

  objc_super v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    objc_super v3 = (void *)v4;
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2530];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityLabel
{
  id v2 = [(PSTableCell *)self specifier];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)labelColor
{
  id v2 = [MEMORY[0x1E4F92E40] appearance];
  int v3 = [v2 usesDarkTheme];

  if (v3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  return v4;
}

- (id)newControl
{
  id v2 = [AXUISettingsTickMarkSlider alloc];
  int v3 = -[AXUISettingsTickMarkSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AXUISettingsTickMarkSlider *)v3 setTicks:&unk_1F1F202F0];
  return v3;
}

- (UISlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (UIButton)fastButton
{
  return self->_fastButton;
}

- (void)setFastButton:(id)a3
{
}

- (UIButton)slowButton
{
  return self->_slowButton;
}

- (void)setSlowButton:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (NSArray)largeTextButtonConstraints
{
  return self->_largeTextButtonConstraints;
}

- (void)setLargeTextButtonConstraints:(id)a3
{
}

- (NSArray)extraLargeTextButtonConstraints
{
  return self->_extraLargeTextButtonConstraints;
}

- (void)setExtraLargeTextButtonConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeTextButtonConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextButtonConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_slowButton, 0);
  objc_storeStrong((id *)&self->_fastButton, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
}

@end