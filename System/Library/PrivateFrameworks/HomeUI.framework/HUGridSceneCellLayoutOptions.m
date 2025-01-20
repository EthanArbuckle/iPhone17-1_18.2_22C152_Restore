@interface HUGridSceneCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (UIFont)descriptionFont;
- (double)cellHeight;
- (double)iconInnerHorizontalMargin;
- (double)titleDescriptionLineSpacing;
- (double)titleInterLineSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfTitleLines;
- (void)setCellHeight:(double)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setIconInnerHorizontalMargin:(double)a3;
- (void)setNumberOfTitleLines:(unint64_t)a3;
- (void)setTitleDescriptionLineSpacing:(double)a3;
- (void)setTitleInterLineSpacing:(double)a3;
@end

@implementation HUGridSceneCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridSceneCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v7 copyWithZone:a3];
  [(HUGridSceneCellLayoutOptions *)self iconInnerHorizontalMargin];
  objc_msgSend(v4, "setIconInnerHorizontalMargin:");
  v5 = [(HUGridSceneCellLayoutOptions *)self descriptionFont];
  [v4 setDescriptionFont:v5];

  [(HUGridSceneCellLayoutOptions *)self titleInterLineSpacing];
  objc_msgSend(v4, "setTitleInterLineSpacing:");
  [(HUGridSceneCellLayoutOptions *)self titleDescriptionLineSpacing];
  objc_msgSend(v4, "setTitleDescriptionLineSpacing:");
  [(HUGridSceneCellLayoutOptions *)self cellHeight];
  objc_msgSend(v4, "setCellHeight:");
  objc_msgSend(v4, "setNumberOfTitleLines:", -[HUGridSceneCellLayoutOptions numberOfTitleLines](self, "numberOfTitleLines"));
  return v4;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (double)titleInterLineSpacing
{
  return self->_titleInterLineSpacing;
}

- (double)titleDescriptionLineSpacing
{
  return self->_titleDescriptionLineSpacing;
}

- (void)setTitleDescriptionLineSpacing:(double)a3
{
  self->_titleDescriptionLineSpacing = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (double)iconInnerHorizontalMargin
{
  return self->_iconInnerHorizontalMargin;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___HUGridSceneCellLayoutOptions;
  id v4 = objc_msgSendSuper2(&v31, sel_defaultOptionsForCellSizeSubclass_);
  v42[0] = &unk_1F19B5030;
  v42[1] = &unk_1F19B5018;
  v43[0] = &unk_1F19B63D0;
  v43[1] = &unk_1F19B63E0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  objc_msgSend(v4, "setIconInnerHorizontalMargin:", HUConstantForCellSizeSubclass(a3, v5));

  v40[0] = &unk_1F19B5030;
  v40[1] = &unk_1F19B5018;
  v41[0] = &unk_1F19B64C0;
  v41[1] = &unk_1F19B64D0;
  v40[2] = &unk_1F19B5060;
  v41[2] = &unk_1F19B6400;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  double v7 = HUConstantForCellSizeSubclass(a3, v6);

  uint64_t v8 = *MEMORY[0x1E4F438A0];
  v9 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F438A0]];
  v10 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v8 weight:*MEMORY[0x1E4F43908]];
  [v9 scaledValueForValue:v7];
  v11 = objc_msgSend(v10, "fontWithSize:");
  [v4 setFont:v11];

  v38[0] = &unk_1F19B5030;
  v38[1] = &unk_1F19B5018;
  v39[0] = &unk_1F19B63E0;
  v39[1] = &unk_1F19B6400;
  v38[2] = &unk_1F19B5060;
  v39[2] = &unk_1F19B64E0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  double v13 = HUConstantForCellSizeSubclass(a3, v12);

  uint64_t v14 = *MEMORY[0x1E4F43890];
  v15 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43890]];
  v16 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v14 weight:*MEMORY[0x1E4F43930]];
  [v15 scaledValueForValue:v13];
  v17 = objc_msgSend(v16, "fontWithSize:");
  [v4 setDescriptionFont:v17];

  v18 = [v4 font];
  [v18 lineHeight];
  objc_msgSend(v4, "setTitleInterLineSpacing:");

  v36[0] = &unk_1F19B5030;
  v36[1] = &unk_1F19B5018;
  v37[0] = &unk_1F19B6370;
  v37[1] = &unk_1F19B6440;
  v36[2] = &unk_1F19B50A8;
  v36[3] = &unk_1F19B5060;
  v37[2] = &unk_1F19B64B0;
  v37[3] = &unk_1F19B64F0;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v19));

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    MEMORY[0x1C1897430]();
    objc_msgSend(v4, "setCellHeight:");
    v34[0] = &unk_1F19B5030;
    v34[1] = &unk_1F19B5018;
    v35[0] = &unk_1F19B63E0;
    v35[1] = &unk_1F19B6400;
    v34[2] = &unk_1F19B5048;
    v34[3] = &unk_1F19B50A8;
    v35[2] = &unk_1F19B6500;
    v35[3] = &unk_1F19B63F0;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
    double v21 = HUConstantForCellSizeSubclass(a3, v20);

    uint64_t v22 = *MEMORY[0x1E4F43880];
    v23 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880]];
    v24 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v23 size:v21];
    [v4 setFont:v24];

    v25 = [MEMORY[0x1E4F42A40] metricsForTextStyle:v22];
    v26 = (void *)MEMORY[0x1E4F42A30];
    [v25 scaledValueForValue:v13];
    v27 = objc_msgSend(v26, "systemFontOfSize:weight:");
    [v4 setDescriptionFont:v27];

    v28 = [v4 font];
    [v28 lineHeight];
    objc_msgSend(v4, "setTitleInterLineSpacing:");

    v32[0] = &unk_1F19B5030;
    v32[1] = &unk_1F19B5018;
    v33[0] = &unk_1F19B64C0;
    v33[1] = &unk_1F19B64D0;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    objc_msgSend(v4, "setTitleDescriptionLineSpacing:", HUConstantForCellSizeSubclass(a3, v29));

    [v4 setIconSize:38.0];
    [v4 setIconInnerHorizontalMargin:20.0];
    [v4 setCellInnerMargin:20.0];
  }
  [v4 setNumberOfTitleLines:2];

  return v4;
}

- (void)setTitleInterLineSpacing:(double)a3
{
  self->_titleInterLineSpacing = a3;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  self->_numberOfTitleLines = a3;
}

- (void)setIconInnerHorizontalMargin:(double)a3
{
  self->_iconInnerHorizontalMargin = a3;
}

- (void)setDescriptionFont:(id)a3
{
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (void).cxx_destruct
{
}

@end