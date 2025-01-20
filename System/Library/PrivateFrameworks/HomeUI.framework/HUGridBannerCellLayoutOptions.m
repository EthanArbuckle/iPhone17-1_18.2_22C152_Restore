@interface HUGridBannerCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (UIFont)descriptionFont;
- (UIFont)footerViewLabelFont;
- (UIFont)iconDescriptionFont;
- (double)bannerCellHeightForWidth:(double)a3 title:(id)a4 description:(id)a5 footer:(id)a6 forContentSizeCategory:(id)a7;
- (double)cellHeight;
- (double)dismissButtonHeightAndWidth;
- (double)dismissButtonTopInset;
- (double)dismissButtonTrailingInset;
- (double)horizontalItemSpacing;
- (double)iconDescriptionInset;
- (double)iconHeight;
- (double)iconTopInset;
- (double)iconTrailingInset;
- (double)iconWidth;
- (double)leadingInset;
- (double)titleInterLineSpacing;
- (double)titleTopInset;
- (double)trailingInset;
- (double)verticalLabelSpacing;
- (double)verticalSpacingForLineView;
- (double)verticalSpacingForLipElements;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maxNumberOfDescriptionLines;
- (unint64_t)maxNumberOfTitleLines;
- (void)setCellHeight:(double)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setDismissButtonHeightAndWidth:(double)a3;
- (void)setDismissButtonTopInset:(double)a3;
- (void)setDismissButtonTrailingInset:(double)a3;
- (void)setFooterViewLabelFont:(id)a3;
- (void)setHorizontalItemSpacing:(double)a3;
- (void)setIconDescriptionFont:(id)a3;
- (void)setIconDescriptionInset:(double)a3;
- (void)setIconHeight:(double)a3;
- (void)setIconTopInset:(double)a3;
- (void)setIconTrailingInset:(double)a3;
- (void)setIconWidth:(double)a3;
- (void)setLeadingInset:(double)a3;
- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3;
- (void)setMaxNumberOfTitleLines:(unint64_t)a3;
- (void)setTitleInterLineSpacing:(double)a3;
- (void)setTitleTopInset:(double)a3;
- (void)setTrailingInset:(double)a3;
- (void)setVerticalLabelSpacing:(double)a3;
- (void)setVerticalSpacingForLineView:(double)a3;
- (void)setVerticalSpacingForLipElements:(double)a3;
@end

@implementation HUGridBannerCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___HUGridBannerCellLayoutOptions;
  v4 = objc_msgSendSuper2(&v29, sel_defaultOptionsForCellSizeSubclass_);
  [v4 setDismissButtonTrailingInset:12.0];
  [v4 setDismissButtonTopInset:12.0];
  [v4 setDismissButtonHeightAndWidth:32.0];
  v54[0] = &unk_1F19B5030;
  v54[1] = &unk_1F19B5018;
  v55[0] = &unk_1F19B6400;
  v55[1] = &unk_1F19B64C0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
  objc_msgSend(v4, "setLeadingInset:", HUConstantForCellSizeSubclass(a3, v5));

  v52[0] = &unk_1F19B5030;
  v52[1] = &unk_1F19B5018;
  v53[0] = &unk_1F19B6400;
  v53[1] = &unk_1F19B64C0;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
  objc_msgSend(v4, "setIconTopInset:", HUConstantForCellSizeSubclass(a3, v6));

  v50[0] = &unk_1F19B5030;
  v50[1] = &unk_1F19B5018;
  v51[0] = &unk_1F19B6530;
  v51[1] = &unk_1F19B6530;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  objc_msgSend(v4, "setIconWidth:", HUConstantForCellSizeSubclass(a3, v7));

  v48[0] = &unk_1F19B5030;
  v48[1] = &unk_1F19B5018;
  v49[0] = &unk_1F19B6530;
  v49[1] = &unk_1F19B6530;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  objc_msgSend(v4, "setIconHeight:", HUConstantForCellSizeSubclass(a3, v8));

  v46[0] = &unk_1F19B5030;
  v46[1] = &unk_1F19B5018;
  v47[0] = &unk_1F19B6400;
  v47[1] = &unk_1F19B63E0;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  objc_msgSend(v4, "setIconTrailingInset:", HUConstantForCellSizeSubclass(a3, v9));

  v10 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F0]];
  uint64_t v44 = *MEMORY[0x1E4F43848];
  uint64_t v42 = *MEMORY[0x1E4F43940];
  v11 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43908]];
  v43 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v45 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v14 = [v10 fontDescriptorByAddingAttributes:v13];
  v28 = [v14 fontDescriptorWithDesign:*MEMORY[0x1E4F43830]];

  v15 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v28 size:0.0];
  [v4 setIconDescriptionFont:v15];

  [v4 setIconDescriptionInset:6.0];
  v40[0] = &unk_1F19B5030;
  v40[1] = &unk_1F19B5018;
  v41[0] = &unk_1F19B63E0;
  v41[1] = &unk_1F19B63E0;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  objc_msgSend(v4, "setTitleTopInset:", HUConstantForCellSizeSubclass(a3, v16));

  v38[0] = &unk_1F19B5030;
  v38[1] = &unk_1F19B5018;
  v39[0] = &unk_1F19B64C0;
  v39[1] = &unk_1F19B64C0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  objc_msgSend(v4, "setTrailingInset:", HUConstantForCellSizeSubclass(a3, v17));

  v36[0] = &unk_1F19B5030;
  v36[1] = &unk_1F19B5018;
  v37[0] = &unk_1F19B63D0;
  v37[1] = &unk_1F19B63E0;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  objc_msgSend(v4, "setHorizontalItemSpacing:", HUConstantForCellSizeSubclass(a3, v18));

  v19 = [v4 font];
  [v19 lineHeight];
  objc_msgSend(v4, "setTitleInterLineSpacing:");

  uint64_t v20 = *MEMORY[0x1E4F43870];
  v21 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F43870] traits:32770];
  [v4 setFont:v21];

  v22 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C0] traits:0x8000];
  [v4 setDescriptionFont:v22];

  v34[0] = &unk_1F19B5030;
  v34[1] = &unk_1F19B5018;
  v35[0] = &unk_1F19B6370;
  v35[1] = &unk_1F19B6540;
  v34[2] = &unk_1F19B50A8;
  v34[3] = &unk_1F19B5060;
  v35[2] = &unk_1F19B64B0;
  v35[3] = &unk_1F19B6540;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v23));

  [v4 setVerticalLabelSpacing:0.0];
  v32[0] = &unk_1F19B5030;
  v32[1] = &unk_1F19B5018;
  v33[0] = &unk_1F19B63E0;
  v33[1] = &unk_1F19B63E0;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  objc_msgSend(v4, "setVerticalSpacingForLineView:", HUConstantForCellSizeSubclass(a3, v24));

  v30[0] = &unk_1F19B5030;
  v30[1] = &unk_1F19B5018;
  v31[0] = &unk_1F19B64C0;
  v31[1] = &unk_1F19B64C0;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  objc_msgSend(v4, "setVerticalSpacingForLipElements:", HUConstantForCellSizeSubclass(a3, v25));

  v26 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:v20 traits:0x8000];
  [v4 setFooterViewLabelFont:v26];

  [v4 setMaxNumberOfTitleLines:0];
  [v4 setMaxNumberOfDescriptionLines:0];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUGridBannerCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v9 copyWithZone:a3];
  [(HUGridBannerCellLayoutOptions *)self dismissButtonTrailingInset];
  objc_msgSend(v4, "setDismissButtonTrailingInset:");
  [(HUGridBannerCellLayoutOptions *)self dismissButtonTopInset];
  objc_msgSend(v4, "setDismissButtonTopInset:");
  [(HUGridBannerCellLayoutOptions *)self dismissButtonHeightAndWidth];
  objc_msgSend(v4, "setDismissButtonHeightAndWidth:");
  [(HUGridBannerCellLayoutOptions *)self titleInterLineSpacing];
  objc_msgSend(v4, "setTitleInterLineSpacing:");
  [(HUGridBannerCellLayoutOptions *)self titleTopInset];
  objc_msgSend(v4, "setTitleTopInset:");
  [(HUGridBannerCellLayoutOptions *)self trailingInset];
  objc_msgSend(v4, "setTrailingInset:");
  [(HUGridBannerCellLayoutOptions *)self iconTopInset];
  objc_msgSend(v4, "setIconTopInset:");
  [(HUGridBannerCellLayoutOptions *)self iconTrailingInset];
  objc_msgSend(v4, "setIconTrailingInset:");
  [(HUGridBannerCellLayoutOptions *)self iconHeight];
  objc_msgSend(v4, "setIconHeight:");
  [(HUGridBannerCellLayoutOptions *)self iconWidth];
  objc_msgSend(v4, "setIconWidth:");
  v5 = [(HUGridBannerCellLayoutOptions *)self iconDescriptionFont];
  [v4 setIconDescriptionFont:v5];

  [(HUGridBannerCellLayoutOptions *)self iconDescriptionInset];
  objc_msgSend(v4, "setIconDescriptionInset:");
  [(HUGridBannerCellLayoutOptions *)self leadingInset];
  objc_msgSend(v4, "setLeadingInset:");
  [(HUGridBannerCellLayoutOptions *)self titleTopInset];
  objc_msgSend(v4, "setTitleTopInset:");
  v6 = [(HUGridBannerCellLayoutOptions *)self descriptionFont];
  [v4 setDescriptionFont:v6];

  [(HUGridBannerCellLayoutOptions *)self cellHeight];
  objc_msgSend(v4, "setCellHeight:");
  objc_msgSend(v4, "setMaxNumberOfDescriptionLines:", -[HUGridBannerCellLayoutOptions maxNumberOfDescriptionLines](self, "maxNumberOfDescriptionLines"));
  objc_msgSend(v4, "setMaxNumberOfTitleLines:", -[HUGridBannerCellLayoutOptions maxNumberOfTitleLines](self, "maxNumberOfTitleLines"));
  [(HUGridBannerCellLayoutOptions *)self horizontalItemSpacing];
  objc_msgSend(v4, "setHorizontalItemSpacing:");
  [(HUGridBannerCellLayoutOptions *)self verticalLabelSpacing];
  objc_msgSend(v4, "setVerticalLabelSpacing:");
  [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLineView];
  objc_msgSend(v4, "setVerticalSpacingForLineView:");
  [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLipElements];
  objc_msgSend(v4, "setVerticalSpacingForLipElements:");
  v7 = [(HUGridBannerCellLayoutOptions *)self footerViewLabelFont];
  [v4 setFooterViewLabelFont:v7];

  return v4;
}

- (void)setTitleTopInset:(double)a3
{
  self->_titleTopInset = a3;
}

- (void)setVerticalSpacingForLineView:(double)a3
{
  self->_verticalSpacingForLineView = a3;
}

- (void)setTrailingInset:(double)a3
{
  self->_trailingInset = a3;
}

- (void)setFooterViewLabelFont:(id)a3
{
}

- (void)setDescriptionFont:(id)a3
{
}

- (double)titleTopInset
{
  return self->_titleTopInset;
}

- (void)setVerticalSpacingForLipElements:(double)a3
{
  self->_verticalSpacingForLipElements = a3;
}

- (void)setVerticalLabelSpacing:(double)a3
{
  self->_verticalLabelSpacing = a3;
}

- (void)setTitleInterLineSpacing:(double)a3
{
  self->_titleInterLineSpacing = a3;
}

- (void)setMaxNumberOfTitleLines:(unint64_t)a3
{
  self->_maxNumberOfTitleLines = a3;
}

- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3
{
  self->_maxNumberOfDescriptionLines = a3;
}

- (void)setLeadingInset:(double)a3
{
  self->_leadingInset = a3;
}

- (void)setIconWidth:(double)a3
{
  self->_iconWidth = a3;
}

- (void)setIconTrailingInset:(double)a3
{
  self->_iconTrailingInset = a3;
}

- (void)setIconTopInset:(double)a3
{
  self->_iconTopInset = a3;
}

- (void)setIconHeight:(double)a3
{
  self->_iconHeight = a3;
}

- (void)setIconDescriptionInset:(double)a3
{
  self->_iconDescriptionInset = a3;
}

- (void)setIconDescriptionFont:(id)a3
{
}

- (void)setHorizontalItemSpacing:(double)a3
{
  self->_horizontalItemSpacing = a3;
}

- (void)setDismissButtonTrailingInset:(double)a3
{
  self->_dismissButtonTrailingInset = a3;
}

- (void)setDismissButtonTopInset:(double)a3
{
  self->_dismissButtonTopInset = a3;
}

- (void)setDismissButtonHeightAndWidth:(double)a3
{
  self->_dismissButtonHeightAndWidth = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (double)verticalSpacingForLipElements
{
  return self->_verticalSpacingForLipElements;
}

- (double)verticalSpacingForLineView
{
  return self->_verticalSpacingForLineView;
}

- (double)verticalLabelSpacing
{
  return self->_verticalLabelSpacing;
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (double)titleInterLineSpacing
{
  return self->_titleInterLineSpacing;
}

- (unint64_t)maxNumberOfTitleLines
{
  return self->_maxNumberOfTitleLines;
}

- (unint64_t)maxNumberOfDescriptionLines
{
  return self->_maxNumberOfDescriptionLines;
}

- (double)leadingInset
{
  return self->_leadingInset;
}

- (double)iconWidth
{
  return self->_iconWidth;
}

- (double)iconTrailingInset
{
  return self->_iconTrailingInset;
}

- (double)iconTopInset
{
  return self->_iconTopInset;
}

- (double)iconHeight
{
  return self->_iconHeight;
}

- (double)iconDescriptionInset
{
  return self->_iconDescriptionInset;
}

- (UIFont)iconDescriptionFont
{
  return self->_iconDescriptionFont;
}

- (double)horizontalItemSpacing
{
  return self->_horizontalItemSpacing;
}

- (UIFont)footerViewLabelFont
{
  return self->_footerViewLabelFont;
}

- (double)dismissButtonTrailingInset
{
  return self->_dismissButtonTrailingInset;
}

- (double)dismissButtonTopInset
{
  return self->_dismissButtonTopInset;
}

- (double)dismissButtonHeightAndWidth
{
  return self->_dismissButtonHeightAndWidth;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewLabelFont, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);

  objc_storeStrong((id *)&self->_iconDescriptionFont, 0);
}

- (double)bannerCellHeightForWidth:(double)a3 title:(id)a4 description:(id)a5 footer:(id)a6 forContentSizeCategory:(id)a7
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = *MEMORY[0x1E4F43770];
  [(HUGridBannerCellLayoutOptions *)self leadingInset];
  double v18 = v17;
  if (v16 > (unint64_t)v15)
  {
    [(HUGridBannerCellLayoutOptions *)self iconWidth];
    double v20 = v18 + v19;
    [(HUGridBannerCellLayoutOptions *)self horizontalItemSpacing];
    double v18 = v20 + v21;
  }
  [(HUGridBannerCellLayoutOptions *)self trailingInset];
  double v23 = a3 - (v18 + v22);
  uint64_t v56 = *MEMORY[0x1E4F42508];
  uint64_t v24 = v56;
  v25 = [(HUGridCellLayoutOptions *)self font];
  v57[0] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, v23, 3.40282347e38);
  double v28 = v27;

  [(HUGridBannerCellLayoutOptions *)self verticalLabelSpacing];
  double v30 = v29 + ceil(v28) + 0.0;
  uint64_t v54 = v24;
  v31 = [(HUGridBannerCellLayoutOptions *)self descriptionFont];
  v55 = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 1, v32, 0, v23, 3.40282347e38);
  double v34 = v33;

  double v35 = v30 + ceil(v34);
  if (v16 <= (unint64_t)v15)
  {
    [(HUGridBannerCellLayoutOptions *)self titleTopInset];
    double v43 = v35 + v42;
    [(HUGridBannerCellLayoutOptions *)self iconHeight];
    double v45 = v44;
    [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLipElements];
    double v39 = v43 + v45 + v46;
    if (![v14 length]) {
      goto LABEL_12;
    }
LABEL_11:
    [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLineView];
    double v48 = v39 + v47 + 1.0;
    [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLipElements];
    double v50 = v49;
    v51 = [(HUGridBannerCellLayoutOptions *)self footerViewLabelFont];
    [v51 lineHeight];
    double v39 = v48 + ceil(v52) + v50 * 2.0;

    goto LABEL_12;
  }
  if (![v14 length])
  {
    [(HUGridBannerCellLayoutOptions *)self iconHeight];
    if (v36 > v35)
    {
      [(HUGridBannerCellLayoutOptions *)self iconHeight];
      double v35 = v37;
    }
  }
  [(HUGridBannerCellLayoutOptions *)self titleTopInset];
  double v39 = v35 + v38;
  if ([v14 length]) {
    goto LABEL_11;
  }
  [(HUGridBannerCellLayoutOptions *)self iconHeight];
  if (v35 >= v40)
  {
    [(HUGridBannerCellLayoutOptions *)self verticalSpacingForLineView];
    double v39 = v39 + v41 + 1.0;
  }
LABEL_12:

  return v39;
}

@end