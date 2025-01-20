@interface CAMSemanticStyleDetailView
- (CAMSemanticStyle)semanticStyle;
- (CAMSemanticStyleDetailView)initWithFrame:(CGRect)a3;
- (NSNumberFormatter)_integerFormatter;
- (UILabel)_styleDescriptionLabel;
- (UILabel)_styleTitleLabel;
- (UILabel)_toneTitleLabel;
- (UILabel)_toneValueLabel;
- (UILabel)_warmthTitleLabel;
- (UILabel)_warmthValueLabel;
- (id)_descriptionForSemanticStylePreset:(int64_t)a3;
- (void)_updateTextForCurrentStyle;
- (void)setSemanticStyle:(id)a3;
@end

@implementation CAMSemanticStyleDetailView

- (CAMSemanticStyleDetailView)initWithFrame:(CGRect)a3
{
  v92[17] = *MEMORY[0x263EF8340];
  v91.receiver = self;
  v91.super_class = (Class)CAMSemanticStyleDetailView;
  v3 = -[CAMSemanticStyleDetailView initWithFrame:](&v91, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = CEKFontOfSizeWeightStyle();
    uint64_t v5 = CEKFontOfSizeWeightStyle();
    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
    styleTitleLabel = v3->__styleTitleLabel;
    v3->__styleTitleLabel = (UILabel *)v11;

    [(UILabel *)v3->__styleTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__styleTitleLabel setNumberOfLines:0];
    [(UILabel *)v3->__styleTitleLabel setFont:v5];
    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__styleTitleLabel];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    styleDescriptionLabel = v3->__styleDescriptionLabel;
    v3->__styleDescriptionLabel = (UILabel *)v13;

    [(UILabel *)v3->__styleDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__styleDescriptionLabel setNumberOfLines:0];
    [(UILabel *)v3->__styleDescriptionLabel setLineBreakMode:0];
    v90 = (void *)v4;
    [(UILabel *)v3->__styleDescriptionLabel setFont:v4];
    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__styleDescriptionLabel];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    toneTitleLabel = v3->__toneTitleLabel;
    v3->__toneTitleLabel = (UILabel *)v15;

    [(UILabel *)v3->__toneTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__toneTitleLabel setNumberOfLines:1];
    [(UILabel *)v3->__toneTitleLabel setFont:v5];
    v17 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v3->__toneTitleLabel setTextColor:v17];

    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__toneTitleLabel];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    toneValueLabel = v3->__toneValueLabel;
    v3->__toneValueLabel = (UILabel *)v18;

    [(UILabel *)v3->__toneValueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__toneValueLabel setNumberOfLines:1];
    [(UILabel *)v3->__toneValueLabel setFont:v5];
    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__toneValueLabel];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    warmthTitleLabel = v3->__warmthTitleLabel;
    v3->__warmthTitleLabel = (UILabel *)v20;

    [(UILabel *)v3->__warmthTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__warmthTitleLabel setNumberOfLines:1];
    [(UILabel *)v3->__warmthTitleLabel setFont:v5];
    v22 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v3->__warmthTitleLabel setTextColor:v22];

    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__warmthTitleLabel];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    warmthValueLabel = v3->__warmthValueLabel;
    v3->__warmthValueLabel = (UILabel *)v23;

    [(UILabel *)v3->__warmthValueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->__warmthValueLabel setNumberOfLines:1];
    v89 = (void *)v5;
    [(UILabel *)v3->__warmthValueLabel setFont:v5];
    [(CAMSemanticStyleDetailView *)v3 addSubview:v3->__warmthValueLabel];
    v70 = (void *)MEMORY[0x263F08938];
    v88 = [(UILabel *)v3->__styleTitleLabel leadingAnchor];
    v87 = [(CAMSemanticStyleDetailView *)v3 leadingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87 constant:17.0];
    v92[0] = v86;
    v85 = [(UILabel *)v3->__styleTitleLabel trailingAnchor];
    v84 = [(CAMSemanticStyleDetailView *)v3 trailingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84 constant:-17.0];
    v92[1] = v83;
    v82 = [(UILabel *)v3->__styleTitleLabel topAnchor];
    v81 = [(CAMSemanticStyleDetailView *)v3 topAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:12.0];
    v92[2] = v80;
    v79 = [(UILabel *)v3->__styleDescriptionLabel leadingAnchor];
    v78 = [(CAMSemanticStyleDetailView *)v3 leadingAnchor];
    v77 = [v79 constraintEqualToAnchor:v78 constant:17.0];
    v92[3] = v77;
    v76 = [(UILabel *)v3->__styleDescriptionLabel trailingAnchor];
    v75 = [(CAMSemanticStyleDetailView *)v3 trailingAnchor];
    v74 = [v76 constraintLessThanOrEqualToAnchor:v75 constant:-17.0];
    v92[4] = v74;
    v73 = [(UILabel *)v3->__styleDescriptionLabel topAnchor];
    v72 = [(UILabel *)v3->__toneTitleLabel bottomAnchor];
    v71 = [v73 constraintEqualToAnchor:v72 constant:6.0];
    v92[5] = v71;
    v69 = [(UILabel *)v3->__styleDescriptionLabel bottomAnchor];
    v68 = [(CAMSemanticStyleDetailView *)v3 bottomAnchor];
    v67 = [v69 constraintEqualToAnchor:v68 constant:-12.0];
    v92[6] = v67;
    v66 = [(UILabel *)v3->__toneTitleLabel leadingAnchor];
    v65 = [(CAMSemanticStyleDetailView *)v3 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:17.0];
    v92[7] = v64;
    v63 = [(UILabel *)v3->__toneTitleLabel topAnchor];
    v62 = [(UILabel *)v3->__styleTitleLabel bottomAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:1.0];
    v92[8] = v61;
    v60 = [(UILabel *)v3->__toneValueLabel leadingAnchor];
    v59 = [(UILabel *)v3->__toneTitleLabel trailingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:6.0];
    v92[9] = v58;
    v57 = [(UILabel *)v3->__toneValueLabel widthAnchor];
    v56 = [v57 constraintGreaterThanOrEqualToConstant:30.0];
    v92[10] = v56;
    v55 = [(UILabel *)v3->__toneValueLabel topAnchor];
    v54 = [(UILabel *)v3->__styleTitleLabel bottomAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:1.0];
    v92[11] = v53;
    v52 = [(UILabel *)v3->__warmthTitleLabel leadingAnchor];
    v51 = [(UILabel *)v3->__toneValueLabel trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 constant:9.0];
    v92[12] = v50;
    v49 = [(UILabel *)v3->__warmthTitleLabel topAnchor];
    v48 = [(UILabel *)v3->__styleTitleLabel bottomAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:1.0];
    v92[13] = v47;
    v25 = [(UILabel *)v3->__warmthValueLabel leadingAnchor];
    v26 = [(UILabel *)v3->__warmthTitleLabel trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:6.0];
    v92[14] = v27;
    v28 = [(UILabel *)v3->__warmthValueLabel widthAnchor];
    v29 = [v28 constraintGreaterThanOrEqualToConstant:30.0];
    v92[15] = v29;
    v30 = [(UILabel *)v3->__warmthValueLabel topAnchor];
    v31 = [(UILabel *)v3->__styleTitleLabel bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:1.0];
    v92[16] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:17];
    [v70 activateConstraints:v33];

    v34 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [(CAMSemanticStyleDetailView *)v3 setBackgroundColor:v34];

    v35 = [(CAMSemanticStyleDetailView *)v3 layer];
    [v35 setCornerRadius:16.0];

    uint64_t v36 = *MEMORY[0x263F15A20];
    v37 = [(CAMSemanticStyleDetailView *)v3 layer];
    [v37 setCornerCurve:v36];

    v38 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    integerFormatter = v3->__integerFormatter;
    v3->__integerFormatter = v38;

    [(NSNumberFormatter *)v3->__integerFormatter setPositiveFormat:@"0"];
    [(NSNumberFormatter *)v3->__integerFormatter setNegativeFormat:@"0"];
    v40 = [(NSNumberFormatter *)v3->__integerFormatter stringFromNumber:&unk_26BDDE208];
    [(NSNumberFormatter *)v3->__integerFormatter setZeroSymbol:v40];

    v41 = [(NSNumberFormatter *)v3->__integerFormatter plusSign];
    [(NSNumberFormatter *)v3->__integerFormatter setPositivePrefix:v41];

    v42 = [(NSNumberFormatter *)v3->__integerFormatter minusSign];
    int v43 = [v42 isEqualToString:@"-"];
    v44 = v3->__integerFormatter;
    if (v43)
    {
      [(NSNumberFormatter *)v44 setNegativePrefix:@"−"];
    }
    else
    {
      v45 = [(NSNumberFormatter *)v44 minusSign];
      [(NSNumberFormatter *)v3->__integerFormatter setNegativePrefix:v45];
    }
    [(CAMSemanticStyleDetailView *)v3 _updateTextForCurrentStyle];
  }
  return v3;
}

- (void)setSemanticStyle:(id)a3
{
  id v5 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    [(CAMSemanticStyleDetailView *)self _updateTextForCurrentStyle];
  }
}

- (void)_updateTextForCurrentStyle
{
  id v29 = [(CAMSemanticStyleDetailView *)self semanticStyle];
  v3 = NSString;
  uint64_t v4 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_SETTINGS_DETAIL_TITLE", 0);
  id v5 = [v29 displayName];
  id v6 = [v3 stringWithValidatedFormat:v4, @"%@", 0, v5 validFormatSpecifiers error];

  double v7 = objc_msgSend(v6, "cam_uppercaseStringWithPreferredLocale");
  double v8 = [(CAMSemanticStyleDetailView *)self _styleTitleLabel];
  [v8 setText:v7];

  double v9 = -[CAMSemanticStyleDetailView _descriptionForSemanticStylePreset:](self, "_descriptionForSemanticStylePreset:", [v29 presetType]);
  double v10 = [(CAMSemanticStyleDetailView *)self _styleDescriptionLabel];
  [v10 setText:v9];

  uint64_t v11 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_CONTROL_TONE", 0);
  v12 = objc_msgSend(v11, "cam_uppercaseStringWithPreferredLocale");
  uint64_t v13 = [(CAMSemanticStyleDetailView *)self _toneTitleLabel];
  [v13 setText:v12];

  v14 = [(CAMSemanticStyleDetailView *)self _integerFormatter];
  uint64_t v15 = NSNumber;
  [v29 sceneBias];
  v17 = [v15 numberWithDouble:v16 * 100.0];
  uint64_t v18 = [v14 stringFromNumber:v17];
  v19 = [(CAMSemanticStyleDetailView *)self _toneValueLabel];
  [v19 setText:v18];

  uint64_t v20 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_CONTROL_WARMTH", 0);
  v21 = objc_msgSend(v20, "cam_uppercaseStringWithPreferredLocale");
  v22 = [(CAMSemanticStyleDetailView *)self _warmthTitleLabel];
  [v22 setText:v21];

  uint64_t v23 = [(CAMSemanticStyleDetailView *)self _integerFormatter];
  v24 = NSNumber;
  [v29 warmthBias];
  v26 = [v24 numberWithDouble:v25 * 100.0];
  v27 = [v23 stringFromNumber:v26];
  v28 = [(CAMSemanticStyleDetailView *)self _warmthValueLabel];
  [v28 setText:v27];

  [(CAMSemanticStyleDetailView *)self setNeedsLayout];
}

- (id)_descriptionForSemanticStylePreset:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = CAMLocalizedFrameworkString(off_263FA3110[a3], 0);
  }
  return v4;
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (UILabel)_styleTitleLabel
{
  return self->__styleTitleLabel;
}

- (UILabel)_styleDescriptionLabel
{
  return self->__styleDescriptionLabel;
}

- (UILabel)_toneTitleLabel
{
  return self->__toneTitleLabel;
}

- (UILabel)_warmthTitleLabel
{
  return self->__warmthTitleLabel;
}

- (UILabel)_toneValueLabel
{
  return self->__toneValueLabel;
}

- (UILabel)_warmthValueLabel
{
  return self->__warmthValueLabel;
}

- (NSNumberFormatter)_integerFormatter
{
  return self->__integerFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__integerFormatter, 0);
  objc_storeStrong((id *)&self->__warmthValueLabel, 0);
  objc_storeStrong((id *)&self->__toneValueLabel, 0);
  objc_storeStrong((id *)&self->__warmthTitleLabel, 0);
  objc_storeStrong((id *)&self->__toneTitleLabel, 0);
  objc_storeStrong((id *)&self->__styleDescriptionLabel, 0);
  objc_storeStrong((id *)&self->__styleTitleLabel, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end