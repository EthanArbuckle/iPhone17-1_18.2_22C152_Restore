@interface HUGridCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (HUGridCellBackgroundDisplayOptions)backgroundDisplayOptions;
- (HUGridCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3;
- (NSString)contentSizeCategory;
- (UIFont)font;
- (UIVisualEffect)iconVibrancyEffect;
- (UIVisualEffect)secondaryVibrancyEffect;
- (UIVisualEffect)vibrancyEffect;
- (double)cellCornerRadius;
- (double)cellInnerMargin;
- (double)cellScaleFactor;
- (double)gutter;
- (double)iconSize;
- (double)secondaryContentDimmingFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cellSizeSubclass;
- (int64_t)iconContentMode;
- (unint64_t)contentColorStyle;
- (unint64_t)onStateBorderStyle;
- (void)setBackgroundDisplayOptions:(id)a3;
- (void)setCellCornerRadius:(double)a3;
- (void)setCellInnerMargin:(double)a3;
- (void)setCellScaleFactor:(double)a3;
- (void)setContentColorStyle:(unint64_t)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setFont:(id)a3;
- (void)setIconContentMode:(int64_t)a3;
- (void)setIconSize:(double)a3;
- (void)setIconVibrancyEffect:(id)a3;
- (void)setOnStateBorderStyle:(unint64_t)a3;
- (void)setSecondaryContentDimmingFactor:(double)a3;
- (void)setSecondaryVibrancyEffect:(id)a3;
- (void)setVibrancyEffect:(id)a3;
@end

@implementation HUGridCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCellSizeSubclass:", -[HUGridCellLayoutOptions cellSizeSubclass](self, "cellSizeSubclass"));
  v5 = [(HUGridCellLayoutOptions *)self backgroundDisplayOptions];
  [v4 setBackgroundDisplayOptions:v5];

  v6 = [(HUGridCellLayoutOptions *)self vibrancyEffect];
  [v4 setVibrancyEffect:v6];

  v7 = [(HUGridCellLayoutOptions *)self secondaryVibrancyEffect];
  [v4 setSecondaryVibrancyEffect:v7];

  v8 = [(HUGridCellLayoutOptions *)self iconVibrancyEffect];
  [v4 setIconVibrancyEffect:v8];

  [(HUGridCellLayoutOptions *)self secondaryContentDimmingFactor];
  objc_msgSend(v4, "setSecondaryContentDimmingFactor:");
  objc_msgSend(v4, "setContentColorStyle:", -[HUGridCellLayoutOptions contentColorStyle](self, "contentColorStyle"));
  v9 = [(HUGridCellLayoutOptions *)self contentSizeCategory];
  [v4 setContentSizeCategory:v9];

  v10 = [(HUGridCellLayoutOptions *)self font];
  [v4 setFont:v10];

  [(HUGridCellLayoutOptions *)self iconSize];
  objc_msgSend(v4, "setIconSize:");
  [(HUGridCellLayoutOptions *)self cellInnerMargin];
  objc_msgSend(v4, "setCellInnerMargin:");
  [(HUGridCellLayoutOptions *)self cellCornerRadius];
  objc_msgSend(v4, "setCellCornerRadius:");
  objc_msgSend(v4, "setOnStateBorderStyle:", -[HUGridCellLayoutOptions onStateBorderStyle](self, "onStateBorderStyle"));
  return v4;
}

- (void)setContentColorStyle:(unint64_t)a3
{
  self->_contentColorStyle = a3;
  id v4 = [(HUGridCellLayoutOptions *)self backgroundDisplayOptions];
  [v4 setContentColorStyle:a3];
}

- (HUGridCellBackgroundDisplayOptions)backgroundDisplayOptions
{
  return self->_backgroundDisplayOptions;
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (double)iconSize
{
  return self->_iconSize;
}

- (double)cellCornerRadius
{
  return self->_cellCornerRadius;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_10 != -1) {
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_244);
  }
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    a3 = 4;
  }
  v5 = (void *)[objc_alloc((Class)a1) initWithCellSizeSubclass:a3];
  v6 = +[HUGridCellBackgroundDisplayOptions defaultOptions];
  [v5 setBackgroundDisplayOptions:v6];

  [v5 setVibrancyEffect:qword_1EBA47B78];
  [v5 setSecondaryVibrancyEffect:0];
  [v5 setSecondaryContentDimmingFactor:0.67];
  [v5 setContentColorStyle:0];
  [v5 setContentSizeCategory:*MEMORY[0x1E4F437D0]];
  HUDefaultSizeForIconSize();
  [v5 setIconSize:v7];
  v21[0] = &unk_1F19B5030;
  v21[1] = &unk_1F19B5018;
  v22[0] = &unk_1F19B63C0;
  v22[1] = &unk_1F19B63D0;
  v21[2] = &unk_1F19B5048;
  v21[3] = &unk_1F19B50A8;
  v22[2] = &unk_1F19B63E0;
  v22[3] = &unk_1F19B63F0;
  v21[4] = &unk_1F19B5060;
  v22[4] = &unk_1F19B63D0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  objc_msgSend(v5, "setCellInnerMargin:", HUConstantForCellSizeSubclass(a3, v8));

  [v5 setCellCornerRadius:16.0];
  [v5 setCellScaleFactor:1.0];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    v9 = [v5 backgroundDisplayOptions];
    [v9 setDisplayStyle:2];

    v10 = [MEMORY[0x1E4F42FE8] controlCenterPrimaryVibrancyEffect];
    [v5 setVibrancyEffect:v10];

    v11 = [MEMORY[0x1E4F42FE8] controlCenterSecondaryVibrancyEffect];
    [v5 setSecondaryVibrancyEffect:v11];

    if ([MEMORY[0x1E4F69138] isHomeControlService])
    {
      v12 = (void *)MEMORY[0x1E4F428C0];
      v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      v14 = [v12 colorEffectMonochromeTint:v13 blendingAmount:1.0 brightnessAdjustment:0.45];

      v15 = (void *)MEMORY[0x1E4F43020];
      v20[0] = v14;
      v16 = [v5 vibrancyEffect];
      v20[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
      v18 = [v15 effectCombiningEffects:v17];
      [v5 setIconVibrancyEffect:v18];
    }
    else
    {
      if ([MEMORY[0x1E4F69138] isSpringBoard]) {
        [v5 secondaryVibrancyEffect];
      }
      else {
      v14 = [v5 vibrancyEffect];
      }
      [v5 setIconVibrancyEffect:v14];
    }

    CCUICompactModuleContinuousCornerRadius();
    objc_msgSend(v5, "setCellCornerRadius:");
    [v5 setSecondaryContentDimmingFactor:0.25];
  }

  return v5;
}

- (void)setVibrancyEffect:(id)a3
{
}

- (void)setIconSize:(double)a3
{
  self->_iconSize = a3;
}

- (void)setCellCornerRadius:(double)a3
{
  self->_cellCornerRadius = a3;
}

- (void)setSecondaryVibrancyEffect:(id)a3
{
}

- (void)setSecondaryContentDimmingFactor:(double)a3
{
  self->_secondaryContentDimmingFactor = a3;
}

- (void)setCellInnerMargin:(double)a3
{
  self->_cellInnerMargin = a3;
}

- (void)setBackgroundDisplayOptions:(id)a3
{
}

- (HUGridCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUGridCellLayoutOptions;
  result = [(HUGridCellLayoutOptions *)&v5 init];
  if (result) {
    result->_cellSizeSubclass = a3;
  }
  return result;
}

- (void)setCellScaleFactor:(double)a3
{
  self->_cellScaleFactor = a3;
}

- (int64_t)cellSizeSubclass
{
  return self->_cellSizeSubclass;
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (UIVisualEffect)secondaryVibrancyEffect
{
  return self->_secondaryVibrancyEffect;
}

- (double)secondaryContentDimmingFactor
{
  return self->_secondaryContentDimmingFactor;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

- (unint64_t)onStateBorderStyle
{
  return self->_onStateBorderStyle;
}

- (void)setOnStateBorderStyle:(unint64_t)a3
{
  self->_onStateBorderStyle = a3;
}

- (void)setIconVibrancyEffect:(id)a3
{
}

- (UIVisualEffect)iconVibrancyEffect
{
  return self->_iconVibrancyEffect;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)cellInnerMargin
{
  return self->_cellInnerMargin;
}

- (void)setContentSizeCategory:(id)a3
{
  self->_contentSizeCategory = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_iconVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_secondaryVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);

  objc_storeStrong((id *)&self->_backgroundDisplayOptions, 0);
}

- (double)gutter
{
  return 10.0;
}

void __61__HUGridCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke()
{
  id v2 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
  uint64_t v0 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v2 style:4];
  v1 = (void *)qword_1EBA47B78;
  qword_1EBA47B78 = v0;
}

- (int64_t)iconContentMode
{
  return self->_iconContentMode;
}

- (void)setIconContentMode:(int64_t)a3
{
  self->_iconContentMode = a3;
}

- (double)cellScaleFactor
{
  return self->_cellScaleFactor;
}

@end