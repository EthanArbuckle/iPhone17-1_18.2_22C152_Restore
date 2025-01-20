@interface HUGridWelcomeUIBannerCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (UIColor)continueButtonColor;
- (UIColor)descriptionLabelColor;
- (UIColor)footerLabelColor;
- (UIColor)titleLabelColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContinueButtonColor:(id)a3;
- (void)setDescriptionLabelColor:(id)a3;
- (void)setFooterLabelColor:(id)a3;
- (void)setTitleLabelColor:(id)a3;
@end

@implementation HUGridWelcomeUIBannerCellLayoutOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtonColor, 0);
  objc_storeStrong((id *)&self->_footerLabelColor, 0);
  objc_storeStrong((id *)&self->_descriptionLabelColor, 0);

  objc_storeStrong((id *)&self->_titleLabelColor, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUGridWelcomeUIBannerCellLayoutOptions;
  id v4 = [(HUGridBannerCellLayoutOptions *)&v9 copyWithZone:a3];
  v5 = [(HUGridWelcomeUIBannerCellLayoutOptions *)self footerLabelColor];
  [v4 setFooterLabelColor:v5];

  v6 = [(HUGridWelcomeUIBannerCellLayoutOptions *)self titleLabelColor];
  [v4 setTitleLabelColor:v6];

  v7 = [(HUGridWelcomeUIBannerCellLayoutOptions *)self descriptionLabelColor];
  [v4 setDescriptionLabelColor:v7];

  return v4;
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (UIColor)footerLabelColor
{
  return self->_footerLabelColor;
}

- (UIColor)descriptionLabelColor
{
  return self->_descriptionLabelColor;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUGridWelcomeUIBannerCellLayoutOptions;
  id v4 = objc_msgSendSuper2(&v14, sel_defaultOptionsForCellSizeSubclass_);
  v5 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438F8] traits:2];
  [v4 setFont:v5];

  v6 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C0] traits:2];
  [v4 setDescriptionFont:v6];

  v7 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438A0] traits:0x8000];
  [v4 setFooterViewLabelFont:v7];

  [v4 setVerticalSpacingForLineView:48.0];
  v15[0] = &unk_1F19B5030;
  v15[1] = &unk_1F19B5018;
  v16[0] = &unk_1F19B6580;
  v16[1] = &unk_1F19B6580;
  v15[2] = &unk_1F19B5048;
  v15[3] = &unk_1F19B50A8;
  v16[2] = &unk_1F19B6580;
  v16[3] = &unk_1F19B64B0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  objc_msgSend(v4, "setTrailingInset:", HUConstantForCellSizeSubclass(a3, v8));

  objc_super v9 = [MEMORY[0x1E4F428B8] labelColor];
  [v4 setFooterLabelColor:v9];

  v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v4 setTitleLabelColor:v10];

  v11 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v4 setDescriptionLabelColor:v11];

  v12 = [MEMORY[0x1E4F428B8] systemFillColor];
  [v4 setContinueButtonColor:v12];

  return v4;
}

- (void)setTitleLabelColor:(id)a3
{
}

- (void)setFooterLabelColor:(id)a3
{
}

- (void)setDescriptionLabelColor:(id)a3
{
}

- (void)setContinueButtonColor:(id)a3
{
}

- (UIColor)continueButtonColor
{
  return self->_continueButtonColor;
}

@end