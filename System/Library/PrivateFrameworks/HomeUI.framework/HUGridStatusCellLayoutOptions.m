@interface HUGridStatusCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (CGPoint)badgeOffsetForUserInterfaceLayoutDirection:(int64_t)a3;
- (UIFont)descriptionFont;
- (UIFont)largeDescriptionFont;
- (double)backgroundSize;
- (double)badgeSize;
- (double)cellHeight;
- (double)cellSpacing;
- (double)cellToBackgroundHorizontalSpacing;
- (double)cellWidthForAttributedTitle:(id)a3 shortTitle:(id)a4;
- (double)cellWidthForTitle:(id)a3 shortTitle:(id)a4;
- (double)descriptionInnerMargin;
- (double)estimatedCellWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)titleAlignmentForUserInterfaceLayoutDirection:(int64_t)a3;
- (unint64_t)numberOfTitleLines;
- (void)setBackgroundSize:(double)a3;
- (void)setBadgeSize:(double)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setDescriptionInnerMargin:(double)a3;
- (void)setEstimatedCellWidth:(double)a3;
- (void)setLargeDescriptionFont:(id)a3;
- (void)setNumberOfTitleLines:(unint64_t)a3;
@end

@implementation HUGridStatusCellLayoutOptions

id __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:a1];
  uint64_t v11 = *MEMORY[0x1E4F43848];
  uint64_t v9 = *MEMORY[0x1E4F43940];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43908]];
  v10 = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v5 = [v1 fontDescriptorByAddingAttributes:v4];
  v6 = [v5 fontDescriptorWithDesign:*MEMORY[0x1E4F43830]];

  v7 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeDescriptionFont, 0);

  objc_storeStrong((id *)&self->_descriptionFont, 0);
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___HUGridStatusCellLayoutOptions;
  v4 = objc_msgSendSuper2(&v10, sel_defaultOptionsForCellSizeSubclass_);
  v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43888]];
  [v4 setFont:v5];

  v6 = __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(*MEMORY[0x1E4F438A0]);
  [v4 setDescriptionFont:v6];

  v7 = __67__HUGridStatusCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke(*MEMORY[0x1E4F438F0]);
  [v4 setLargeDescriptionFont:v7];

  [v4 setCellCornerRadius:0.0];
  v11[0] = &unk_1F19B5030;
  v11[1] = &unk_1F19B50A8;
  v12[0] = &unk_1F19B6440;
  v12[1] = &unk_1F19B64B0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  objc_msgSend(v4, "setBackgroundSize:", HUConstantForCellSizeSubclass(a3, v8));

  [v4 setIconSize:36.0];
  [v4 setDescriptionInnerMargin:6.0];
  [v4 setNumberOfTitleLines:2];
  [v4 setBadgeSize:20.0];
  [v4 setEstimatedCellWidth:150.0];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUGridStatusCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v8 copyWithZone:a3];
  v5 = [(HUGridStatusCellLayoutOptions *)self descriptionFont];
  [v4 setDescriptionFont:v5];

  v6 = [(HUGridStatusCellLayoutOptions *)self largeDescriptionFont];
  [v4 setLargeDescriptionFont:v6];

  [(HUGridStatusCellLayoutOptions *)self descriptionInnerMargin];
  objc_msgSend(v4, "setDescriptionInnerMargin:");
  objc_msgSend(v4, "setNumberOfTitleLines:", -[HUGridStatusCellLayoutOptions numberOfTitleLines](self, "numberOfTitleLines"));
  [(HUGridStatusCellLayoutOptions *)self backgroundSize];
  objc_msgSend(v4, "setBackgroundSize:");
  [(HUGridStatusCellLayoutOptions *)self badgeSize];
  objc_msgSend(v4, "setBadgeSize:");
  [(HUGridStatusCellLayoutOptions *)self estimatedCellWidth];
  objc_msgSend(v4, "setEstimatedCellWidth:");
  return v4;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  self->_numberOfTitleLines = a3;
}

- (void)setLargeDescriptionFont:(id)a3
{
}

- (void)setEstimatedCellWidth:(double)a3
{
  self->_estimatedCellWidth = a3;
}

- (void)setDescriptionInnerMargin:(double)a3
{
  self->_descriptionInnerMargin = a3;
}

- (void)setDescriptionFont:(id)a3
{
}

- (void)setBadgeSize:(double)a3
{
  self->_badgeSize = a3;
}

- (void)setBackgroundSize:(double)a3
{
  self->_backgroundSize = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (UIFont)largeDescriptionFont
{
  return self->_largeDescriptionFont;
}

- (double)estimatedCellWidth
{
  return self->_estimatedCellWidth;
}

- (double)descriptionInnerMargin
{
  return self->_descriptionInnerMargin;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (double)badgeSize
{
  return self->_badgeSize;
}

- (double)backgroundSize
{
  return self->_backgroundSize;
}

- (double)cellHeight
{
  double v3 = (double)[(HUGridStatusCellLayoutOptions *)self numberOfTitleLines];
  id v4 = [(HUGridCellLayoutOptions *)self font];
  [v4 lineHeight];
  double v6 = v5;
  v7 = [(HUGridCellLayoutOptions *)self font];
  [v7 leading];
  double v9 = v8 + v3 * v6 + 1.0;

  [(HUGridCellLayoutOptions *)self iconSize];
  if (result < v9) {
    return v9;
  }
  return result;
}

- (double)cellWidthForTitle:(id)a3 shortTitle:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E4F28B18];
    id v8 = a3;
    a3 = (id)[[v7 alloc] initWithString:v8];
  }
  [(HUGridStatusCellLayoutOptions *)self cellWidthForAttributedTitle:a3 shortTitle:v6];
  double v10 = v9;

  return v10;
}

- (double)cellWidthForAttributedTitle:(id)a3 shortTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
  }
  else {
    id v8 = 0;
  }
  double v9 = HUGridStatusCell_legacyParseTextLines(v6, v8);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HUGridStatusCellLayoutOptions_cellWidthForAttributedTitle_shortTitle___block_invoke;
  v17[3] = &unk_1E63909D0;
  v17[4] = self;
  v17[5] = v18;
  objc_msgSend(v9, "na_each:", v17);
  [(HUGridStatusCellLayoutOptions *)self backgroundSize];
  double v11 = v10;
  [(HUGridStatusCellLayoutOptions *)self backgroundToTitleSpacing];
  double v13 = v12;
  UICeilToViewScale();
  double v15 = v11 + v13 + v14;
  _Block_object_dispose(v18, 8);

  return v15;
}

void __72__HUGridStatusCellLayoutOptions_cellWidthForAttributedTitle_shortTitle___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = *MEMORY[0x1E4F42508];
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 font];
  v20[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v7 = objc_msgSend(v4, "hf_attributedStringWithDefaultAttributes:", v6);

  objc_msgSend(v7, "boundingRectWithSize:options:context:", 1, 0, *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  double v9 = v8;
  double v10 = (void *)MEMORY[0x1E4F6A420];
  double v11 = [v4 string];

  double v12 = [*(id *)(a1 + 32) font];
  [v10 languageAwareOutsetsForString:v11 withFont:v12];
  double v14 = v13;
  double v16 = v15;

  double v17 = v9 + v14 + v16;
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v17 > *(double *)(v18 + 24)) {
    *(double *)(v18 + 24) = v17;
  }
}

- (double)cellSpacing
{
  [(HUGridCellLayoutOptions *)self gutter];
  return v2 + v2;
}

- (double)cellToBackgroundHorizontalSpacing
{
  return 0.0;
}

- (CGPoint)badgeOffsetForUserInterfaceLayoutDirection:(int64_t)a3
{
  if (a3 == 1) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = 3;
  }
  [(HUGridStatusCellLayoutOptions *)self backgroundSize];
  double v6 = v5;
  [(HUGridStatusCellLayoutOptions *)self backgroundSize];

  double Point = HUCircleGetPoint(v4, 0.0 - v6 * 0.5, 0.0 - v7 * 0.5, v6, v7);
  result.y = v9;
  result.x = Point;
  return result;
}

- (int64_t)titleAlignmentForUserInterfaceLayoutDirection:(int64_t)a3
{
  return 2 * (a3 == 1);
}

@end