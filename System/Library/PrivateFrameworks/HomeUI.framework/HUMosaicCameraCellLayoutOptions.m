@interface HUMosaicCameraCellLayoutOptions
+ (double)columnWidthForContainerWidth:(double)a3 numberOfColumns:(unint64_t)a4 padding:(double)a5;
+ (double)heightForWidth:(double)a3;
+ (double)widthForHeight:(double)a3;
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4;
- (BOOL)isMosaicCell;
- (BOOL)isSingleCell;
- (UIFont)secondaryLabelFont;
- (UIFont)timingLabelFont;
- (double)cameraCellHeight;
- (double)cameraCellWidth;
- (double)cornerRadiusForCellSize:(CGSize)a3;
- (double)descriptionInset;
- (double)expandedFormatAspectRatio;
- (double)interItemSpacing;
- (double)maxWidth;
- (double)minimumCameraCellWidth;
- (double)mosaicInterItemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)viewSizeSubclass;
- (unint64_t)numColumnsForContainerWidth:(double)a3 minimumCameraCellWidth:(double)a4 padding:(double)a5;
- (void)setDescriptionInset:(double)a3;
- (void)setExpandedFormatAspectRatio:(double)a3;
- (void)setInterItemSpacing:(double)a3;
- (void)setIsMosaicCell:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMosaicInterItemSpacing:(double)a3;
- (void)setSecondaryLabelFont:(id)a3;
- (void)setTimingLabelFont:(id)a3;
- (void)setViewSizeSubclass:(int64_t)a3;
@end

@implementation HUMosaicCameraCellLayoutOptions

- (double)mosaicInterItemSpacing
{
  return self->_mosaicInterItemSpacing;
}

- (void)setIsMosaicCell:(BOOL)a3
{
  self->_isMosaicCell = a3;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4
{
  v20[5] = *MEMORY[0x1E4F143B8];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HUMosaicCameraCellLayoutOptions;
  v6 = objc_msgSendSuper2(&v18, sel_defaultOptionsForCellSizeSubclass_);
  [v6 setViewSizeSubclass:a4];
  uint64_t v7 = *MEMORY[0x1E4F438C8];
  v8 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438C8] variant:1024];
  [v6 setFont:v8];

  v9 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] systemFontSize];
  v10 = objc_msgSend(v9, "monospacedDigitSystemFontOfSize:weight:");
  v11 = [MEMORY[0x1E4F42A40] metricsForTextStyle:v7];
  v12 = [v11 scaledFontForFont:v10];
  [v6 setTimingLabelFont:v12];

  v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v7];
  [v6 setSecondaryLabelFont:v13];

  [v6 setDescriptionInset:10.0];
  v19[0] = &unk_1F19B5030;
  v19[1] = &unk_1F19B5018;
  v20[0] = &unk_1F19B6550;
  v20[1] = &unk_1F19B6560;
  v19[2] = &unk_1F19B5048;
  v19[3] = &unk_1F19B50A8;
  v20[2] = &unk_1F19B6570;
  v20[3] = &unk_1F19B63D0;
  v19[4] = &unk_1F19B5060;
  v20[4] = &unk_1F19B6560;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:5];
  objc_msgSend(v6, "setInterItemSpacing:", HUConstantForCellSizeSubclass(a3, v14));

  [v6 setExpandedFormatAspectRatio:0.98];
  if (a3 == 3)
  {
    [v6 setMaxWidth:359.0];
  }
  else
  {
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 bounds];
    [v6 setMaxWidth:v16];
  }
  [v6 setMosaicInterItemSpacing:2.0];

  return v6;
}

- (void)setViewSizeSubclass:(int64_t)a3
{
  self->_viewSizeSubclass = a3;
}

- (void)setTimingLabelFont:(id)a3
{
}

- (void)setSecondaryLabelFont:(id)a3
{
}

- (void)setMosaicInterItemSpacing:(double)a3
{
  self->_mosaicInterItemSpacing = a3;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (void)setExpandedFormatAspectRatio:(double)a3
{
  self->_expandedFormatAspectRatio = a3;
}

- (void)setDescriptionInset:(double)a3
{
  self->_descriptionInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelFont, 0);

  objc_storeStrong((id *)&self->_timingLabelFont, 0);
}

- (double)cornerRadiusForCellSize:(CGSize)a3
{
  if (![(HUMosaicCameraCellLayoutOptions *)self isSingleCell]) {
    return 0.0;
  }

  [(HUGridCellLayoutOptions *)self cellCornerRadius];
  return result;
}

- (BOOL)isSingleCell
{
  return ![(HUMosaicCameraCellLayoutOptions *)self isMosaicCell];
}

- (BOOL)isMosaicCell
{
  return self->_isMosaicCell;
}

- (UIFont)timingLabelFont
{
  return self->_timingLabelFont;
}

- (double)descriptionInset
{
  return self->_descriptionInset;
}

- (UIFont)secondaryLabelFont
{
  return self->_secondaryLabelFont;
}

- (double)cameraCellHeight
{
  [(HUMosaicCameraCellLayoutOptions *)self cameraCellWidth];
  return v2 / 1.77777778;
}

- (double)cameraCellWidth
{
  unint64_t v3 = [(HUMosaicCameraCellLayoutOptions *)self viewSizeSubclass] - 1;
  if (v3 > 9) {
    double v4 = 320.0;
  }
  else {
    double v4 = dbl_1BEA1A7C0[v3];
  }
  [(HUMosaicCameraCellLayoutOptions *)self maxWidth];
  if (v4 < v5) {
    double v5 = v4;
  }
  return v5 + -40.0;
}

- (int64_t)viewSizeSubclass
{
  return self->_viewSizeSubclass;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (unint64_t)numColumnsForContainerWidth:(double)a3 minimumCameraCellWidth:(double)a4 padding:(double)a5
{
  if ([(HUGridCellLayoutOptions *)self cellSizeSubclass] == 3
    && a4 + a4 + a5 - a3 < 0.00000011920929)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

+ (double)columnWidthForContainerWidth:(double)a3 numberOfColumns:(unint64_t)a4 padding:(double)a5
{
  return (a3 - a5 * (double)(a4 - 1)) / (double)a4;
}

+ (double)heightForWidth:(double)a3
{
  return a3 / 1.77777778;
}

+ (double)widthForHeight:(double)a3
{
  return a3 * 1.77777778;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUMosaicCameraCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v6 copyWithZone:a3];
  [(HUMosaicCameraCellLayoutOptions *)self descriptionInset];
  objc_msgSend(v4, "setDescriptionInset:");
  return v4;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)minimumCameraCellWidth
{
  return self->_minimumCameraCellWidth;
}

- (double)expandedFormatAspectRatio
{
  return self->_expandedFormatAspectRatio;
}

@end