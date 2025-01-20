@interface AIAudiogramFrequencyInputCell
- (AIAudiogramFrequencyInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)_canShowMasked;
- (BOOL)isAccessibilityElement;
- (BOOL)leftEarMasked;
- (BOOL)rightEarMasked;
- (NSNumber)frequency;
- (NSNumber)hearingLevel;
- (NSNumber)leftHearingLevel;
- (NSNumber)rightHearingLevel;
- (UIImageView)leftEarSymbolImageView;
- (UIImageView)rightEarSymbolImageView;
- (UILabel)frequencyLabel;
- (UILabel)leftEarSensitivity;
- (UILabel)rightEarSensitivity;
- (UIStackView)containerStackView;
- (UIStackView)leftEarStackView;
- (UIStackView)rightEarStackView;
- (id)_symbolConfigurationForSymbolType:(int64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)createImageViewWithImage:(id)a3 symbolType:(int64_t)a4;
- (id)createLabelWithText:(id)a3 textColor:(id)a4 font:(id)a5;
- (int64_t)ear;
- (unint64_t)accessibilityTraits;
- (void)_setWidth:(id)a3 forEar:(int64_t)a4;
- (void)configureLayout;
- (void)setContainerStackView:(id)a3;
- (void)setEar:(int64_t)a3;
- (void)setFrequency:(id)a3;
- (void)setFrequencyLabel:(id)a3;
- (void)setHearingLevel:(id)a3;
- (void)setLeftEarLabelWidth:(id)a3;
- (void)setLeftEarMasked:(BOOL)a3;
- (void)setLeftEarSensitivity:(id)a3;
- (void)setLeftEarStackView:(id)a3;
- (void)setLeftEarSymbolImageView:(id)a3;
- (void)setLeftHearingLevel:(id)a3;
- (void)setRightEarLabelWidth:(id)a3;
- (void)setRightEarMasked:(BOOL)a3;
- (void)setRightEarSensitivity:(id)a3;
- (void)setRightEarStackView:(id)a3;
- (void)setRightEarSymbolImageView:(id)a3;
- (void)setRightHearingLevel:(id)a3;
@end

@implementation AIAudiogramFrequencyInputCell

- (AIAudiogramFrequencyInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v87[2] = *MEMORY[0x263EF8340];
  v83.receiver = self;
  v83.super_class = (Class)AIAudiogramFrequencyInputCell;
  v4 = [(AIAudiogramFrequencyInputCell *)&v83 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] labelColor];
    uint64_t v6 = *MEMORY[0x263F83570];
    v7 = [MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F83648]];
    v8 = [(AIAudiogramFrequencyInputCell *)v4 createLabelWithText:&stru_26F2D3B98 textColor:v5 font:v7];
    [(AIAudiogramFrequencyInputCell *)v4 setFrequencyLabel:v8];

    v9 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
    v10 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v11 = [MEMORY[0x263F82760] preferredFontForTextStyle:v6];
    v12 = [(AIAudiogramFrequencyInputCell *)v4 createLabelWithText:v9 textColor:v10 font:v11];
    [(AIAudiogramFrequencyInputCell *)v4 setLeftEarSensitivity:v12];

    v13 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
    v14 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v15 = [MEMORY[0x263F82760] preferredFontForTextStyle:v6];
    v16 = [(AIAudiogramFrequencyInputCell *)v4 createLabelWithText:v13 textColor:v14 font:v15];
    [(AIAudiogramFrequencyInputCell *)v4 setRightEarSensitivity:v16];

    v82 = filledImageForSymbolType(11);
    v17 = [(AIAudiogramFrequencyInputCell *)v4 createImageViewWithImage:v82 symbolType:11];
    [(AIAudiogramFrequencyInputCell *)v4 setLeftEarSymbolImageView:v17];

    v18 = [MEMORY[0x263F825C8] systemBlueColor];
    v19 = [(AIAudiogramFrequencyInputCell *)v4 leftEarSymbolImageView];
    [v19 setTintColor:v18];

    v20 = labelForSymbolType(11);
    v21 = [(AIAudiogramFrequencyInputCell *)v4 leftEarSymbolImageView];
    [v21 setAccessibilityLabel:v20];

    v81 = filledImageForSymbolType(4);
    v22 = [(AIAudiogramFrequencyInputCell *)v4 createImageViewWithImage:v81 symbolType:4];
    [(AIAudiogramFrequencyInputCell *)v4 setRightEarSymbolImageView:v22];

    v23 = [MEMORY[0x263F825C8] systemPinkColor];
    v24 = [(AIAudiogramFrequencyInputCell *)v4 rightEarSymbolImageView];
    [v24 setTintColor:v23];

    v25 = labelForSymbolType(4);
    v26 = [(AIAudiogramFrequencyInputCell *)v4 rightEarSymbolImageView];
    [v26 setAccessibilityLabel:v25];

    id v27 = objc_alloc(MEMORY[0x263F82BF8]);
    v28 = [(AIAudiogramFrequencyInputCell *)v4 leftEarSymbolImageView];
    v87[0] = v28;
    v29 = [(AIAudiogramFrequencyInputCell *)v4 leftEarSensitivity];
    v87[1] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
    v31 = (void *)[v27 initWithArrangedSubviews:v30];
    [(AIAudiogramFrequencyInputCell *)v4 setLeftEarStackView:v31];

    v32 = [(AIAudiogramFrequencyInputCell *)v4 leftEarStackView];
    [v32 setAxis:0];

    v33 = [(AIAudiogramFrequencyInputCell *)v4 leftEarStackView];
    [v33 setDistribution:0];

    v34 = [(AIAudiogramFrequencyInputCell *)v4 leftEarStackView];
    [v34 setSpacing:7.0];

    id v35 = objc_alloc(MEMORY[0x263F82BF8]);
    v36 = [(AIAudiogramFrequencyInputCell *)v4 rightEarSymbolImageView];
    v86[0] = v36;
    v37 = [(AIAudiogramFrequencyInputCell *)v4 rightEarSensitivity];
    v86[1] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    v39 = (void *)[v35 initWithArrangedSubviews:v38];
    [(AIAudiogramFrequencyInputCell *)v4 setRightEarStackView:v39];

    v40 = [(AIAudiogramFrequencyInputCell *)v4 rightEarStackView];
    [v40 setAxis:0];

    v41 = [(AIAudiogramFrequencyInputCell *)v4 rightEarStackView];
    [v41 setDistribution:0];

    v42 = [(AIAudiogramFrequencyInputCell *)v4 rightEarStackView];
    [v42 setSpacing:7.0];

    id v43 = objc_alloc(MEMORY[0x263F82BF8]);
    v44 = [(AIAudiogramFrequencyInputCell *)v4 frequencyLabel];
    v85[0] = v44;
    id v45 = objc_alloc_init(MEMORY[0x263F82E00]);
    v85[1] = v45;
    v46 = [(AIAudiogramFrequencyInputCell *)v4 leftEarStackView];
    v85[2] = v46;
    v47 = [(AIAudiogramFrequencyInputCell *)v4 rightEarStackView];
    v85[3] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:4];
    v49 = (void *)[v43 initWithArrangedSubviews:v48];
    [(AIAudiogramFrequencyInputCell *)v4 setContainerStackView:v49];

    v50 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    [v50 setAxis:0];

    v51 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    [v51 setDistribution:0];

    v52 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    [v52 setSpacing:8.0];

    v53 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    v54 = [(AIAudiogramFrequencyInputCell *)v4 leftEarStackView];
    [v53 setCustomSpacing:v54 afterView:20.0];

    v55 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

    v56 = [(AIAudiogramFrequencyInputCell *)v4 contentView];
    v57 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    [v56 addSubview:v57];

    v72 = (void *)MEMORY[0x263F08938];
    v80 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    v78 = [v80 leadingAnchor];
    v79 = [(AIAudiogramFrequencyInputCell *)v4 contentView];
    v77 = [v79 leadingAnchor];
    v76 = [v78 constraintEqualToAnchor:v77 constant:16.0];
    v84[0] = v76;
    v75 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    v73 = [v75 trailingAnchor];
    v74 = [(AIAudiogramFrequencyInputCell *)v4 contentView];
    v71 = [v74 trailingAnchor];
    v70 = [v73 constraintEqualToAnchor:v71 constant:-7.0];
    v84[1] = v70;
    v69 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    v68 = [v69 topAnchor];
    v58 = [(AIAudiogramFrequencyInputCell *)v4 contentView];
    v59 = [v58 topAnchor];
    v60 = [v68 constraintEqualToAnchor:v59 constant:12.0];
    v84[2] = v60;
    v61 = [(AIAudiogramFrequencyInputCell *)v4 containerStackView];
    v62 = [v61 bottomAnchor];
    v63 = [(AIAudiogramFrequencyInputCell *)v4 contentView];
    v64 = [v63 bottomAnchor];
    v65 = [v62 constraintEqualToAnchor:v64 constant:-12.0];
    v84[3] = v65;
    v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:4];
    [v72 activateConstraints:v66];

    [(AIAudiogramFrequencyInputCell *)v4 setHearingLevel:0];
  }
  return v4;
}

- (void)configureLayout
{
  v48[1] = *MEMORY[0x263EF8340];
  v3 = [(AIAudiogramFrequencyInputCell *)self frequencyLabel];
  v4 = [v3 text];
  [(AIAudiogramFrequencyInputCell *)self frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t v47 = *MEMORY[0x263F82270];
  uint64_t v9 = v47;
  v10 = [(AIAudiogramFrequencyInputCell *)self frequencyLabel];
  v11 = [v10 font];
  v48[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  float Width = CGRectGetWidth(v49);

  v14 = [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
  v15 = [v14 text];
  [(AIAudiogramFrequencyInputCell *)self frame];
  double v17 = v16;
  double v19 = v18;
  uint64_t v45 = v9;
  v20 = [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
  v21 = [v20 font];
  v46 = v21;
  v22 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  float v23 = CGRectGetWidth(v50);

  v24 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
  v25 = [v24 text];
  [(AIAudiogramFrequencyInputCell *)self frame];
  double v27 = v26;
  double v29 = v28;
  uint64_t v43 = v9;
  v30 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
  v31 = [v30 font];
  v44 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  objc_msgSend(v25, "boundingRectWithSize:options:attributes:context:", 32, v32, 0, v27, v29);
  *(float *)&double v27 = CGRectGetWidth(v51);

  [(AIAudiogramFrequencyInputCell *)self frame];
  CGFloat v33 = CGRectGetWidth(v52) * 0.6;
  v34 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
  id v35 = v34;
  if (v33 >= (float)((float)(Width + v23) + *(float *)&v27))
  {
    [v34 setAxis:0];

    v41 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    [v41 setAlignment:0];

    v42 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    [v42 setSpacing:8.0];

    v38 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    v39 = [(AIAudiogramFrequencyInputCell *)self leftEarStackView];
    double v40 = 20.0;
  }
  else
  {
    [v34 setAxis:1];

    v36 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    [v36 setAlignment:1];

    v37 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    [v37 setSpacing:0.0];

    v38 = [(AIAudiogramFrequencyInputCell *)self containerStackView];
    v39 = [(AIAudiogramFrequencyInputCell *)self leftEarStackView];
    double v40 = 0.0;
  }
  [v38 setCustomSpacing:v39 afterView:v40];
}

- (id)createLabelWithText:(id)a3 textColor:(id)a4 font:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setText:v9];

  [v10 setTextColor:v8];
  [v10 setFont:v7];

  LODWORD(v11) = 1144750080;
  [v10 setContentHuggingPriority:0 forAxis:v11];
  LODWORD(v12) = 1144750080;
  [v10 setContentCompressionResistancePriority:0 forAxis:v12];
  return v10;
}

- (id)createImageViewWithImage:(id)a3 symbolType:(int64_t)a4
{
  double v6 = (objc_class *)MEMORY[0x263F82828];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithImage:v7];
  [v8 setContentMode:1];
  id v9 = [(AIAudiogramFrequencyInputCell *)self _symbolConfigurationForSymbolType:a4];
  [v8 setPreferredSymbolConfiguration:v9];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [v8 widthAnchor];
  double v11 = [v8 heightAnchor];
  [v7 size];
  double v13 = v12;
  [v7 size];
  double v15 = v14;

  double v16 = [v10 constraintEqualToAnchor:v11 multiplier:v13 / v15];

  LODWORD(v17) = 1144750080;
  [v16 setPriority:v17];
  [v16 setActive:1];
  LODWORD(v18) = 1132068864;
  [v8 setContentCompressionResistancePriority:0 forAxis:v18];

  return v8;
}

- (id)_symbolConfigurationForSymbolType:(int64_t)a3
{
  v4 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835F0] scale:1];
  if (a3 == 11)
  {
    double v5 = [MEMORY[0x263F82818] configurationWithWeight:9];
    uint64_t v6 = [v4 configurationByApplyingConfiguration:v5];

    v4 = (void *)v6;
  }
  return v4;
}

- (void)setFrequency:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_frequency, a3);
  id v16 = v5;
  if ((int)[v16 intValue] < 1000)
  {
    id v9 = @"AudiogramIngestionHertzAbbreviation";
    v10 = v16;
  }
  else
  {
    HIDWORD(v6) = 652835029 * [v16 intValue] + 17179864;
    LODWORD(v6) = HIDWORD(v6);
    if ((v6 >> 3) <= 0x418936)
    {
      objc_msgSend(NSNumber, "numberWithInt:", ((int)objc_msgSend(v16, "intValue") / 1000));
    }
    else
    {
      id v7 = NSString;
      [v16 doubleValue];
      objc_msgSend(v7, "stringWithFormat:", @"%.1f", v8 / 1000.0);
    v10 = };

    id v9 = @"AudiogramIngestionKiloHertzAbbreviation";
  }
  double v11 = aiLocString(v9);
  double v12 = NSString;
  double v13 = aiLocString(@"AudiogramIngestionResultsFrequency");
  double v14 = objc_msgSend(v12, "stringWithFormat:", v13, v10, v11);
  double v15 = [(AIAudiogramFrequencyInputCell *)self frequencyLabel];
  [v15 setText:v14];
}

- (void)setLeftHearingLevel:(id)a3
{
  id v10 = a3;
  v4 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
  id v5 = NSString;
  unint64_t v6 = aiLocString(@"AudiogramIngestionResultsFrequency");
  id v7 = v10;
  if (!v10)
  {
    id v7 = aiLocString(@"AudiogramIngestionResultsNoData");
  }
  double v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
  id v9 = [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
  [v9 setText:v8];

  if (!v10) {
}
  }

- (void)setRightHearingLevel:(id)a3
{
  id v10 = a3;
  v4 = aiLocString(@"AudiogramIngestionDecibelAbbreviation");
  id v5 = NSString;
  unint64_t v6 = aiLocString(@"AudiogramIngestionResultsFrequency");
  id v7 = v10;
  if (!v10)
  {
    id v7 = aiLocString(@"AudiogramIngestionResultsNoData");
  }
  double v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
  id v9 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
  [v9 setText:v8];

  if (!v10) {
}
  }

- (void)setLeftEarMasked:(BOOL)a3
{
  if (a3)
  {
    if ([(AIAudiogramFrequencyInputCell *)self _canShowMasked]) {
      uint64_t v4 = 8;
    }
    else {
      uint64_t v4 = 11;
    }
  }
  else
  {
    uint64_t v4 = 11;
  }
  filledImageForSymbolType(v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(AIAudiogramFrequencyInputCell *)self leftEarSymbolImageView];
  [v5 setImage:v12];

  unint64_t v6 = [MEMORY[0x263F825C8] systemBlueColor];
  id v7 = [(AIAudiogramFrequencyInputCell *)self leftEarSymbolImageView];
  [v7 setTintColor:v6];

  double v8 = labelForSymbolType(v4);
  id v9 = [(AIAudiogramFrequencyInputCell *)self leftEarSymbolImageView];
  [v9 setAccessibilityLabel:v8];

  id v10 = [(AIAudiogramFrequencyInputCell *)self leftEarSymbolImageView];
  double v11 = [(AIAudiogramFrequencyInputCell *)self _symbolConfigurationForSymbolType:v4];
  [v10 setPreferredSymbolConfiguration:v11];
}

- (void)setRightEarMasked:(BOOL)a3
{
  if (a3)
  {
    if ([(AIAudiogramFrequencyInputCell *)self _canShowMasked]) {
      uint64_t v4 = 9;
    }
    else {
      uint64_t v4 = 4;
    }
  }
  else
  {
    uint64_t v4 = 4;
  }
  filledImageForSymbolType(v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(AIAudiogramFrequencyInputCell *)self rightEarSymbolImageView];
  [v5 setImage:v12];

  unint64_t v6 = [MEMORY[0x263F825C8] systemPinkColor];
  id v7 = [(AIAudiogramFrequencyInputCell *)self rightEarSymbolImageView];
  [v7 setTintColor:v6];

  double v8 = labelForSymbolType(v4);
  id v9 = [(AIAudiogramFrequencyInputCell *)self rightEarSymbolImageView];
  [v9 setAccessibilityLabel:v8];

  id v10 = [(AIAudiogramFrequencyInputCell *)self rightEarSymbolImageView];
  double v11 = [(AIAudiogramFrequencyInputCell *)self _symbolConfigurationForSymbolType:v4];
  [v10 setPreferredSymbolConfiguration:v11];
}

- (BOOL)_canShowMasked
{
  return _os_feature_enabled_impl();
}

- (void)setLeftEarLabelWidth:(id)a3
{
}

- (void)setRightEarLabelWidth:(id)a3
{
}

- (void)_setWidth:(id)a3 forEar:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 1) {
    [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
  }
  else {
  id v7 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = objc_msgSend(v7, "constraints", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
      if ([v13 firstAttribute] == 7)
      {
        if ([v13 isActive])
        {
          NSClassFromString(&cfstr_Nscontentsizel.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
    id v14 = v13;

    if (!v14) {
      goto LABEL_17;
    }
    [v6 floatValue];
    [v14 setConstant:v15];
  }
  else
  {
LABEL_14:

LABEL_17:
    id v16 = [v7 widthAnchor];
    [v6 floatValue];
    id v14 = [v16 constraintEqualToConstant:v17];

    [v14 setActive:1];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AIAudiogramFrequencyInputCell *)self frequencyLabel];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v3 = objc_opt_new();
  uint64_t v4 = [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
  id v5 = [v4 text];
  id v6 = aiLocString(@"AudiogramIngestionResultsNoData");
  int v7 = [v5 containsString:v6];

  if (v7)
  {
    double v8 = aiLocString(@"AudiogramIngestionNoLeftSymbol");
    [v3 appendString:v8];
  }
  else
  {
    double v8 = aiLocString(@"AudiogramIngestionSymbolAtLevelFormat");
    uint64_t v9 = [(AIAudiogramFrequencyInputCell *)self leftEarSymbolImageView];
    uint64_t v10 = [v9 accessibilityLabel];
    uint64_t v11 = [(AIAudiogramFrequencyInputCell *)self leftEarSensitivity];
    uint64_t v12 = [v11 accessibilityLabel];
    double v13 = AXCFormattedString();
    objc_msgSend(v3, "appendString:", v13, v10, v12);
  }
  [v3 appendString:@", "];
  id v14 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
  float v15 = [v14 text];
  id v16 = aiLocString(@"AudiogramIngestionResultsNoData");
  int v17 = [v15 containsString:v16];

  if (v17)
  {
    long long v18 = aiLocString(@"AudiogramIngestionNoRightSymbol");
    [v3 appendString:v18];
  }
  else
  {
    long long v18 = aiLocString(@"AudiogramIngestionSymbolAtLevelFormat");
    long long v19 = [(AIAudiogramFrequencyInputCell *)self rightEarSymbolImageView];
    long long v20 = [v19 accessibilityLabel];
    long long v21 = [(AIAudiogramFrequencyInputCell *)self rightEarSensitivity];
    v22 = [v21 accessibilityLabel];
    uint64_t v23 = AXCFormattedString();
    objc_msgSend(v3, "appendString:", v23, v20, v22);
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (int64_t)ear
{
  return self->_ear;
}

- (void)setEar:(int64_t)a3
{
  self->_ear = a3;
}

- (NSNumber)frequency
{
  return self->_frequency;
}

- (NSNumber)hearingLevel
{
  return self->_hearingLevel;
}

- (void)setHearingLevel:(id)a3
{
}

- (NSNumber)leftHearingLevel
{
  return self->_leftHearingLevel;
}

- (NSNumber)rightHearingLevel
{
  return self->_rightHearingLevel;
}

- (BOOL)leftEarMasked
{
  return self->_leftEarMasked;
}

- (BOOL)rightEarMasked
{
  return self->_rightEarMasked;
}

- (UILabel)frequencyLabel
{
  return self->_frequencyLabel;
}

- (void)setFrequencyLabel:(id)a3
{
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
}

- (UIImageView)leftEarSymbolImageView
{
  return self->_leftEarSymbolImageView;
}

- (void)setLeftEarSymbolImageView:(id)a3
{
}

- (UIImageView)rightEarSymbolImageView
{
  return self->_rightEarSymbolImageView;
}

- (void)setRightEarSymbolImageView:(id)a3
{
}

- (UILabel)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (void)setLeftEarSensitivity:(id)a3
{
}

- (UILabel)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (void)setRightEarSensitivity:(id)a3
{
}

- (UIStackView)leftEarStackView
{
  return self->_leftEarStackView;
}

- (void)setLeftEarStackView:(id)a3
{
}

- (UIStackView)rightEarStackView
{
  return self->_rightEarStackView;
}

- (void)setRightEarStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarStackView, 0);
  objc_storeStrong((id *)&self->_leftEarStackView, 0);
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);
  objc_storeStrong((id *)&self->_rightEarSymbolImageView, 0);
  objc_storeStrong((id *)&self->_leftEarSymbolImageView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_frequencyLabel, 0);
  objc_storeStrong((id *)&self->_rightHearingLevel, 0);
  objc_storeStrong((id *)&self->_leftHearingLevel, 0);
  objc_storeStrong((id *)&self->_hearingLevel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end