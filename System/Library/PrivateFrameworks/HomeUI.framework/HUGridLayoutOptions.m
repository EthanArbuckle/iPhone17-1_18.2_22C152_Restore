@interface HUGridLayoutOptions
+ (id)defaultOptionsForViewSize:(CGSize)a3;
+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4;
+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5;
+ (id)defaultOptionsForViewSize:(CGSize)a3 overrideSizeSubclass:(int64_t)a4;
+ (unint64_t)_numberOfAccessibilityColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3;
+ (unint64_t)_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3 contentSizeCategory:(id)a4;
+ (unint64_t)_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3;
- (BOOL)headlineHidden;
- (BOOL)isEditing;
- (BOOL)statusHidden;
- (CGSize)viewSize;
- (HUFilterCategoryCellLayoutOptions)filterCategoryCellOptions;
- (HUGridBannerCellLayoutOptions)bannerCellOptions;
- (HUGridCameraCellLayoutOptions)cameraCellOptions;
- (HUGridHeadlineCellLayoutOptions)headlineCellOptions;
- (HUGridLayoutOptions)initWithViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5;
- (HUGridMediaPlatterCellLayoutOptions)mediaPlatterCellOptions;
- (HUGridPlaceholderServiceCellLayoutOptions)placeholderServiceCellOptions;
- (HUGridSceneCellLayoutOptions)sceneCellOptions;
- (HUGridScenePlaceholderLayoutOptions)placeholderSceneCellOptions;
- (HUGridServiceCellLayoutOptions)serviceCellOptions;
- (HUGridStatusCellLayoutOptions)statusCellOptions;
- (HUGridWelcomeUIBannerCellLayoutOptions)welcomeUIBannerCellOptions;
- (HUMosaicCameraCellLayoutOptions)mosaicCameraCellOptions;
- (NSNumber)overrideNumberOfColumns;
- (NSNumber)overrideViewSizeSubclass;
- (NSString)contentSizeCategory;
- (NSString)description;
- (UIEdgeInsets)sectionTitleMargin;
- (UIFont)headlineFont;
- (UIFont)sectionHeaderFont;
- (double)_pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:(double)a3;
- (double)_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:(double)a3 totalNumberOfColumns:(int64_t)a4 totalWidth:(double)a5 useDefaultSectionMargin:(BOOL)a6;
- (double)_pointWidthForFractionalNumberOfColumns:(double)a3;
- (double)_preferredSectionHeightForNumberOfRows:(unint64_t)a3 withCellHeight:(double)a4;
- (double)cameraCellHeight;
- (double)cameraCellWidth;
- (double)columnSpacing;
- (double)fixedWidthForCell;
- (double)gutter;
- (double)headlineBaselineToSceneHeaderBaselineDistance;
- (double)headlineCellHeight;
- (double)largeTitleCellTopMargin;
- (double)minimumMarginBelowHeadline;
- (double)pointWidthForCurrentViewSizeSubclass;
- (double)pointWidthForFullWidthCell;
- (double)pointWidthForNumberOfColumns:(int64_t)a3;
- (double)pointWidthForWelcomeUIBanner;
- (double)preferredSectionHeightForNumberOfSceneRows:(unint64_t)a3;
- (double)preferredSectionHeightForNumberOfServiceRows:(unint64_t)a3 spanningColumns:(unint64_t)a4;
- (double)rowSpacing;
- (double)sectionBottomMargin;
- (double)sectionBottomToNextSectionTitleBaselineDistance;
- (double)sectionHeaderCellHeight;
- (double)sectionLeadingMargin;
- (double)sectionTopMargin;
- (double)sectionTrailingMargin;
- (double)statusListCellBottomMargin;
- (double)statusListCellHeight;
- (double)statusListCellTopMargin;
- (id)_childDisplayOptions;
- (id)_columnStyleToString:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cellSizeSubclass;
- (int64_t)numberOfCameraCellsPerRow;
- (int64_t)numberOfColumns;
- (int64_t)scrollDirection;
- (int64_t)viewSizeSubclass;
- (unint64_t)columnStyle;
- (unint64_t)contentColorStyle;
- (void)setBannerCellOptions:(id)a3;
- (void)setCameraCellOptions:(id)a3;
- (void)setColumnSpacing:(double)a3;
- (void)setColumnStyle:(unint64_t)a3;
- (void)setContentColorStyle:(unint64_t)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFilterCategoryCellOptions:(id)a3;
- (void)setHeadlineBaselineToSceneHeaderBaselineDistance:(double)a3;
- (void)setHeadlineCellOptions:(id)a3;
- (void)setHeadlineFont:(id)a3;
- (void)setHeadlineHidden:(BOOL)a3;
- (void)setMediaPlatterCellOptions:(id)a3;
- (void)setMinimumMarginBelowHeadline:(double)a3;
- (void)setMosaicCameraCellOptions:(id)a3;
- (void)setOverrideNumberOfColumns:(id)a3;
- (void)setOverrideViewSizeSubclass:(id)a3;
- (void)setPlaceholderSceneCellOptions:(id)a3;
- (void)setPlaceholderServiceCellOptions:(id)a3;
- (void)setRowSpacing:(double)a3;
- (void)setSceneCellOptions:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setSectionBottomMargin:(double)a3;
- (void)setSectionBottomToNextSectionTitleBaselineDistance:(double)a3;
- (void)setSectionHeaderFont:(id)a3;
- (void)setSectionLeadingMargin:(double)a3;
- (void)setSectionTitleMargin:(UIEdgeInsets)a3;
- (void)setSectionTopMargin:(double)a3;
- (void)setSectionTrailingMargin:(double)a3;
- (void)setServiceCellOptions:(id)a3;
- (void)setStatusCellOptions:(id)a3;
- (void)setStatusHidden:(BOOL)a3;
- (void)setWelcomeUIBannerCellOptions:(id)a3;
@end

@implementation HUGridLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  v62[6] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithViewSize:columnStyle:overrideSizeSubclass:", a4, v9, width, height);

  uint64_t v11 = [v10 viewSizeSubclass];
  uint64_t v12 = [v10 cellSizeSubclass];
  v13 = +[HUGridCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setCameraCellOptions:v13];

  v14 = +[HUGridStatusCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setStatusCellOptions:v14];

  v15 = +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setSceneCellOptions:v15];

  v16 = +[HUGridScenePlaceholderLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setPlaceholderSceneCellOptions:v16];

  v17 = +[HUGridServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setServiceCellOptions:v17];

  v18 = +[HUGridPlaceholderServiceCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setPlaceholderServiceCellOptions:v18];

  v19 = +[HUGridBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setBannerCellOptions:v19];

  v20 = +[HUGridWelcomeUIBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setWelcomeUIBannerCellOptions:v20];

  v21 = +[HUFilterCategoryCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setFilterCategoryCellOptions:v21];

  v22 = +[HUGridMediaPlatterCellLayoutOptions defaultOptionsForCellSizeSubclass:v12];
  [v10 setMediaPlatterCellOptions:v22];

  [v10 setScrollDirection:0];
  v23 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438B8] traits:32770];
  [v10 setHeadlineFont:v23];

  v24 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
  v25 = [v24 textProperties];
  v26 = [v25 font];
  v27 = (void *)[v26 copy];
  [v10 setSectionHeaderFont:v27];

  v61[0] = &unk_1F19B5030;
  v61[1] = &unk_1F19B5018;
  v62[0] = &unk_1F19B6320;
  v62[1] = &unk_1F19B6330;
  v61[2] = &unk_1F19B5048;
  v61[3] = &unk_1F19B5060;
  v62[2] = &unk_1F19B6340;
  v62[3] = &unk_1F19B6350;
  v61[4] = &unk_1F19B5078;
  v61[5] = &unk_1F19B5090;
  v62[4] = &unk_1F19B6360;
  v62[5] = &unk_1F19B6370;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:6];
  objc_msgSend(v10, "setHeadlineBaselineToSceneHeaderBaselineDistance:", HUConstantFloatForViewSizeSubclass(v11, v28));

  v29 = [v10 sectionHeaderFont];
  v30 = v29;
  double v31 = 10.0;
  if (v11 == 6) {
    double v31 = 8.0;
  }
  [v29 _scaledValueForValue:v31];
  objc_msgSend(v10, "setSectionTopMargin:");

  [v10 sectionTopMargin];
  objc_msgSend(v10, "setSectionBottomMargin:");
  v59[0] = &unk_1F19B5030;
  v59[1] = &unk_1F19B5018;
  v60[0] = &unk_1F19B6380;
  v60[1] = &unk_1F19B6390;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
  objc_msgSend(v10, "setSectionLeadingMargin:", HUConstantFloatForViewSizeSubclass(v11, v32));

  [v10 sectionLeadingMargin];
  objc_msgSend(v10, "setSectionTrailingMargin:");
  [v10 sectionLeadingMargin];
  double v34 = v33;
  [v10 sectionTrailingMargin];
  v36 = +[HUGridHeadlineCellLayoutOptions defaultOptionsForCellSizeSubclass:v12 viewSizeSubclass:v11 viewWidth:width containerLeadingMargin:v34 containerTrailingMargin:v35];
  [v10 setHeadlineCellOptions:v36];

  v57[0] = &unk_1F19B5018;
  v57[1] = &unk_1F19B5060;
  v58[0] = &unk_1F19B63A0;
  v58[1] = &unk_1F19B63A0;
  v57[2] = &unk_1F19B5090;
  v58[2] = &unk_1F19B63B0;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
  double v38 = HUConstantFloatForViewSizeSubclass(v11, v37);

  v39 = [v10 sectionHeaderFont];
  [v39 _scaledValueForValue:v38];
  objc_msgSend(v10, "setSectionBottomToNextSectionTitleBaselineDistance:");

  [v10 sectionLeadingMargin];
  double v41 = v40;
  [v10 sectionTrailingMargin];
  objc_msgSend(v10, "setSectionTitleMargin:", 0.0, v41, 0.0, v42);
  v55[0] = &unk_1F19B5030;
  v55[1] = &unk_1F19B5018;
  v56[0] = &unk_1F19B63C0;
  v56[1] = &unk_1F19B63D0;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  double v44 = HUConstantFloatForViewSizeSubclass(v11, v43);

  [v10 setRowSpacing:v44];
  [v10 setColumnSpacing:v44];
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    if (_os_feature_enabled_impl())
    {
      [v10 setSectionTopMargin:0.0];
      [v10 setSectionBottomMargin:0.0];
      [v10 setSectionLeadingMargin:0.0];
      [v10 setSectionTrailingMargin:0.0];
      CCUILayoutGutter();
      objc_msgSend(v10, "setRowSpacing:");
      CCUILayoutGutter();
      objc_msgSend(v10, "setColumnSpacing:");
    }
    else
    {
      [v10 setSectionTopMargin:v44];
      double v45 = v44 + v44;
      [v10 setSectionBottomMargin:v45];
      [v10 setSectionLeadingMargin:v45];
      [v10 setSectionTrailingMargin:v45];
    }
    [v10 sectionTopMargin];
    double v47 = v46;
    [v10 sectionLeadingMargin];
    double v49 = v48;
    [v10 sectionBottomMargin];
    double v51 = v50;
    [v10 sectionTrailingMargin];
    objc_msgSend(v10, "setSectionTitleMargin:", v47, v49, v51, v52);
    [v10 sectionBottomToNextSectionTitleBaselineDistance];
    [v10 setSectionBottomToNextSectionTitleBaselineDistance:v53 * 1.5];
  }
  [v10 setOverrideNumberOfColumns:0];
  [v10 setContentColorStyle:0];
  [v10 setContentSizeCategory:*MEMORY[0x1E4F437D0]];
  [v10 setMinimumMarginBelowHeadline:20.0];

  return v10;
}

- (double)_pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:(double)a3 totalNumberOfColumns:(int64_t)a4 totalWidth:(double)a5 useDefaultSectionMargin:(BOOL)a6
{
  if (a6)
  {
    double v10 = 40.0;
  }
  else
  {
    [(HUGridLayoutOptions *)self sectionLeadingMargin];
    double v12 = v11;
    [(HUGridLayoutOptions *)self sectionTrailingMargin];
    double v10 = v12 + v13;
  }
  double v25 = v10;
  double v14 = a5 - v10;
  double v15 = (double)a4 + -1.0;
  [(HUGridLayoutOptions *)self columnSpacing];
  double v17 = (v14 - v15 * v16) / (double)a4 * a3;
  [(HUGridLayoutOptions *)self columnSpacing];
  double v19 = HUFloorToScreenScale(v17 + (a3 + -1.0) * v18);
  if (v19 >= 0.0) {
    double v20 = v19;
  }
  else {
    double v20 = 0.0;
  }
  [(HUGridLayoutOptions *)self columnSpacing];
  double v22 = (floor(v20 * 1000.0 + 1.0) / 1000.0 - (a3 + -1.0) * v21) / a3 * (double)a4;
  [(HUGridLayoutOptions *)self columnSpacing];
  if (v25 + v22 + v15 * v23 > a5 && v20 != 0.0) {
    return floor(v20 * 1000.0) / 1000.0;
  }
  return v20;
}

- (double)columnSpacing
{
  return self->_columnSpacing;
}

- (double)sectionLeadingMargin
{
  return self->_sectionLeadingMargin;
}

- (double)sectionTrailingMargin
{
  return self->_sectionTrailingMargin;
}

- (void)setSectionTrailingMargin:(double)a3
{
  self->_sectionTrailingMargin = a3;
}

- (void)setSectionLeadingMargin:(double)a3
{
  self->_sectionLeadingMargin = a3;
}

- (double)sectionTopMargin
{
  return self->_sectionTopMargin;
}

- (UIFont)sectionHeaderFont
{
  return self->_sectionHeaderFont;
}

- (void)setWelcomeUIBannerCellOptions:(id)a3
{
}

- (void)setStatusCellOptions:(id)a3
{
}

- (void)setServiceCellOptions:(id)a3
{
}

- (void)setSectionTopMargin:(double)a3
{
  self->_sectionTopMargin = a3;
}

- (void)setSectionTitleMargin:(UIEdgeInsets)a3
{
  self->_sectionTitleMargin = a3;
}

- (void)setSectionHeaderFont:(id)a3
{
}

- (void)setSectionBottomToNextSectionTitleBaselineDistance:(double)a3
{
  self->_sectionBottomToNextSectionTitleBaselineDistance = a3;
}

- (void)setSectionBottomMargin:(double)a3
{
  self->_sectionBottomMargin = a3;
}

- (void)setScrollDirection:(int64_t)a3
{
  self->_scrollDirection = a3;
}

- (void)setSceneCellOptions:(id)a3
{
}

- (void)setRowSpacing:(double)a3
{
  self->_rowSpacing = a3;
}

- (void)setPlaceholderServiceCellOptions:(id)a3
{
}

- (void)setPlaceholderSceneCellOptions:(id)a3
{
}

- (void)setOverrideNumberOfColumns:(id)a3
{
}

- (void)setMinimumMarginBelowHeadline:(double)a3
{
  self->_minimumMarginBelowHeadline = a3;
}

- (void)setMediaPlatterCellOptions:(id)a3
{
}

- (void)setHeadlineFont:(id)a3
{
}

- (void)setHeadlineCellOptions:(id)a3
{
}

- (void)setHeadlineBaselineToSceneHeaderBaselineDistance:(double)a3
{
  self->_headlineBaselineToSceneHeaderBaselineDistance = a3;
}

- (void)setFilterCategoryCellOptions:(id)a3
{
}

- (void)setContentColorStyle:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_contentColorStyle = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(HUGridLayoutOptions *)self _childDisplayOptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setContentColorStyle:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setColumnSpacing:(double)a3
{
  self->_columnSpacing = a3;
}

- (void)setCameraCellOptions:(id)a3
{
}

- (void)setBannerCellOptions:(id)a3
{
}

- (HUGridLayoutOptions)initWithViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUGridLayoutOptions;
  long long v11 = [(HUGridLayoutOptions *)&v14 init];
  long long v12 = v11;
  if (v11)
  {
    v11->_viewSize.CGFloat width = width;
    v11->_viewSize.CGFloat height = height;
    objc_storeStrong((id *)&v11->_overrideViewSizeSubclass, a5);
    v12->_columnStyle = a4;
  }

  return v12;
}

- (int64_t)cellSizeSubclass
{
  unint64_t v2 = [(HUGridLayoutOptions *)self viewSizeSubclass];
  if (v2 > 0xA) {
    return 1;
  }
  else {
    return qword_1BEA1A768[v2];
  }
}

- (double)_pointWidthForFractionalNumberOfColumns:(double)a3
{
  unint64_t v5 = [(HUGridLayoutOptions *)self columnStyle];
  if (v5)
  {
    if (v5 == 1)
    {
      [(HUGridLayoutOptions *)self _pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:a3];
    }
  }
  else
  {
    int64_t v7 = [(HUGridLayoutOptions *)self numberOfColumns];
    [(HUGridLayoutOptions *)self viewSize];
    [(HUGridLayoutOptions *)self _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:v7 totalNumberOfColumns:0 totalWidth:a3 useDefaultSectionMargin:v8];
  }
  return result;
}

- (int64_t)viewSizeSubclass
{
  v3 = [(HUGridLayoutOptions *)self overrideViewSizeSubclass];

  if (v3)
  {
    v4 = [(HUGridLayoutOptions *)self overrideViewSizeSubclass];
    int64_t v5 = [v4 integerValue];

    return v5;
  }
  else if ([(HUGridLayoutOptions *)self columnStyle])
  {
    return 7;
  }
  else
  {
    [(HUGridLayoutOptions *)self viewSize];
    return HUViewSizeSubclassForViewSize(v7, v8);
  }
}

- (unint64_t)columnStyle
{
  return self->_columnStyle;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)overrideViewSizeSubclass
{
  return self->_overrideViewSizeSubclass;
}

- (int64_t)numberOfColumns
{
  v3 = [(HUGridLayoutOptions *)self overrideNumberOfColumns];

  if (v3)
  {
    v4 = [(HUGridLayoutOptions *)self overrideNumberOfColumns];
    uint64_t v5 = [v4 integerValue];
LABEL_3:
    int64_t v6 = v5;

    return v6;
  }
  int64_t result = [(HUGridLayoutOptions *)self columnStyle];
  if (!result)
  {
    double v15 = objc_opt_class();
    int64_t v16 = [(HUGridLayoutOptions *)self viewSizeSubclass];
    v4 = [(HUGridLayoutOptions *)self contentSizeCategory];
    uint64_t v5 = [v15 _numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:v16 contentSizeCategory:v4];
    goto LABEL_3;
  }
  if (result == 1)
  {
    [(HUGridLayoutOptions *)self pointWidthForFullWidthCell];
    double v9 = v8;
    [(HUGridLayoutOptions *)self pointWidthForNumberOfColumns:1];
    double v11 = v10;
    [(HUGridLayoutOptions *)self columnSpacing];
    double v13 = v11 + v12;
    [(HUGridLayoutOptions *)self columnSpacing];
    return vcvtmd_s64_f64((v9 + v14) / v13);
  }
  return result;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (NSNumber)overrideNumberOfColumns
{
  return self->_overrideNumberOfColumns;
}

+ (unint64_t)_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3
{
  unint64_t result = 8;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      if (objc_msgSend(MEMORY[0x1E4F69138], "isHomeUIService", v3, v4)) {
        unint64_t result = 3;
      }
      else {
        unint64_t result = 4;
      }
      break;
    case 6:
      unint64_t result = 18;
      break;
    case 7:
    case 8:
      unint64_t result = 10;
      break;
    case 10:
      unint64_t result = 12;
      break;
    default:
      return result;
  }
  return result;
}

+ (unint64_t)_numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3 contentSizeCategory:(id)a4
{
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4F43780], (UIContentSizeCategory)a4);
  if (a3)
  {
    BOOL v6 = 0;
  }
  else
  {
    double v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 scale];
    double v9 = v8;
    double v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 nativeScale];
    BOOL v6 = v9 < v11;
  }
  double v12 = objc_opt_class();
  if (v5 == NSOrderedDescending && !v6)
  {
    return [v12 _numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:a3];
  }
  else
  {
    return [v12 _numberOfAccessibilityColumnsForFlexibleWidthStyleWithSizeSubclass:a3];
  }
}

- (void)setContentSizeCategory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  self->_contentSizeCategory = v4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  NSComparisonResult v5 = [(HUGridLayoutOptions *)self _childDisplayOptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setContentSizeCategory:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_childDisplayOptions
{
  v12[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUGridLayoutOptions *)self cameraCellOptions];
  uint64_t v4 = [(HUGridLayoutOptions *)self headlineCellOptions];
  v12[1] = v4;
  NSComparisonResult v5 = [(HUGridLayoutOptions *)self statusCellOptions];
  v12[2] = v5;
  uint64_t v6 = [(HUGridLayoutOptions *)self sceneCellOptions];
  v12[3] = v6;
  uint64_t v7 = [(HUGridLayoutOptions *)self placeholderSceneCellOptions];
  v12[4] = v7;
  uint64_t v8 = [(HUGridLayoutOptions *)self serviceCellOptions];
  v12[5] = v8;
  uint64_t v9 = [(HUGridLayoutOptions *)self placeholderServiceCellOptions];
  v12[6] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:7];

  return v10;
}

- (HUGridSceneCellLayoutOptions)sceneCellOptions
{
  return self->_sceneCellOptions;
}

- (HUGridHeadlineCellLayoutOptions)headlineCellOptions
{
  return self->_headlineCellOptions;
}

- (HUGridStatusCellLayoutOptions)statusCellOptions
{
  return self->_statusCellOptions;
}

- (HUGridServiceCellLayoutOptions)serviceCellOptions
{
  return self->_serviceCellOptions;
}

- (HUGridPlaceholderServiceCellLayoutOptions)placeholderServiceCellOptions
{
  return self->_placeholderServiceCellOptions;
}

- (HUGridScenePlaceholderLayoutOptions)placeholderSceneCellOptions
{
  return self->_placeholderSceneCellOptions;
}

- (HUGridCameraCellLayoutOptions)cameraCellOptions
{
  return self->_cameraCellOptions;
}

- (double)rowSpacing
{
  return self->_rowSpacing;
}

- (double)pointWidthForNumberOfColumns:(int64_t)a3
{
  [(HUGridLayoutOptions *)self _pointWidthForFractionalNumberOfColumns:(double)a3];
  return result;
}

- (HUFilterCategoryCellLayoutOptions)filterCategoryCellOptions
{
  return self->_filterCategoryCellOptions;
}

- (double)sectionHeaderCellHeight
{
  [(HUGridLayoutOptions *)self sectionBottomToNextSectionTitleBaselineDistance];
  double v4 = v3;
  [(HUGridLayoutOptions *)self sectionBottomMargin];
  return v4 - v5;
}

- (double)sectionBottomMargin
{
  return self->_sectionBottomMargin;
}

- (double)sectionBottomToNextSectionTitleBaselineDistance
{
  return self->_sectionBottomToNextSectionTitleBaselineDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideViewSizeSubclass, 0);
  objc_storeStrong((id *)&self->_mosaicCameraCellOptions, 0);
  objc_storeStrong((id *)&self->_mediaPlatterCellOptions, 0);
  objc_storeStrong((id *)&self->_filterCategoryCellOptions, 0);
  objc_storeStrong((id *)&self->_welcomeUIBannerCellOptions, 0);
  objc_storeStrong((id *)&self->_bannerCellOptions, 0);
  objc_storeStrong((id *)&self->_placeholderServiceCellOptions, 0);
  objc_storeStrong((id *)&self->_serviceCellOptions, 0);
  objc_storeStrong((id *)&self->_placeholderSceneCellOptions, 0);
  objc_storeStrong((id *)&self->_sceneCellOptions, 0);
  objc_storeStrong((id *)&self->_statusCellOptions, 0);
  objc_storeStrong((id *)&self->_headlineCellOptions, 0);
  objc_storeStrong((id *)&self->_cameraCellOptions, 0);
  objc_storeStrong((id *)&self->_overrideNumberOfColumns, 0);
  objc_storeStrong((id *)&self->_sectionHeaderFont, 0);

  objc_storeStrong((id *)&self->_headlineFont, 0);
}

- (void)setStatusHidden:(BOOL)a3
{
  self->_statusHidden = a3;
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_editing = a3;
  id v4 = [(HUGridLayoutOptions *)self headlineCellOptions];
  [v4 setEditing:v3];
}

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:", 0, a3.width, a3.height);
}

+ (id)defaultOptionsForViewSize:(CGSize)a3 overrideSizeSubclass:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  uint64_t v8 = objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 0, v7, width, height);

  return v8;
}

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", a4, &unk_1F19B5018, a3.width, a3.height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(HUGridLayoutOptions *)self viewSize];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = [(HUGridLayoutOptions *)self columnStyle];
  long long v10 = [(HUGridLayoutOptions *)self overrideViewSizeSubclass];
  long long v11 = objc_msgSend(v4, "initWithViewSize:columnStyle:overrideSizeSubclass:", v9, v10, v6, v8);

  objc_msgSend(v11, "setScrollDirection:", -[HUGridLayoutOptions scrollDirection](self, "scrollDirection"));
  objc_msgSend(v11, "setStatusHidden:", -[HUGridLayoutOptions statusHidden](self, "statusHidden"));
  objc_msgSend(v11, "setHeadlineHidden:", -[HUGridLayoutOptions headlineHidden](self, "headlineHidden"));
  objc_msgSend(v11, "setEditing:", -[HUGridLayoutOptions isEditing](self, "isEditing"));
  long long v12 = [(HUGridLayoutOptions *)self headlineFont];
  [v11 setHeadlineFont:v12];

  long long v13 = [(HUGridLayoutOptions *)self sectionHeaderFont];
  [v11 setSectionHeaderFont:v13];

  [(HUGridLayoutOptions *)self headlineBaselineToSceneHeaderBaselineDistance];
  objc_msgSend(v11, "setHeadlineBaselineToSceneHeaderBaselineDistance:");
  [(HUGridLayoutOptions *)self sectionTopMargin];
  objc_msgSend(v11, "setSectionTopMargin:");
  [(HUGridLayoutOptions *)self sectionBottomMargin];
  objc_msgSend(v11, "setSectionBottomMargin:");
  [(HUGridLayoutOptions *)self sectionLeadingMargin];
  objc_msgSend(v11, "setSectionLeadingMargin:");
  [(HUGridLayoutOptions *)self sectionTrailingMargin];
  objc_msgSend(v11, "setSectionTrailingMargin:");
  [(HUGridLayoutOptions *)self sectionBottomToNextSectionTitleBaselineDistance];
  objc_msgSend(v11, "setSectionBottomToNextSectionTitleBaselineDistance:");
  [(HUGridLayoutOptions *)self sectionTitleMargin];
  objc_msgSend(v11, "setSectionTitleMargin:");
  [(HUGridLayoutOptions *)self headlineBaselineToSceneHeaderBaselineDistance];
  objc_msgSend(v11, "setHeadlineBaselineToSceneHeaderBaselineDistance:");
  [(HUGridLayoutOptions *)self minimumMarginBelowHeadline];
  objc_msgSend(v11, "setMinimumMarginBelowHeadline:");
  [(HUGridLayoutOptions *)self rowSpacing];
  objc_msgSend(v11, "setRowSpacing:");
  [(HUGridLayoutOptions *)self columnSpacing];
  objc_msgSend(v11, "setColumnSpacing:");
  double v14 = [(HUGridLayoutOptions *)self overrideNumberOfColumns];
  [v11 setOverrideNumberOfColumns:v14];

  uint64_t v15 = [(HUGridLayoutOptions *)self cameraCellOptions];
  [v11 setCameraCellOptions:v15];

  int64_t v16 = [(HUGridLayoutOptions *)self headlineCellOptions];
  [v11 setHeadlineCellOptions:v16];

  double v17 = [(HUGridLayoutOptions *)self statusCellOptions];
  [v11 setStatusCellOptions:v17];

  double v18 = [(HUGridLayoutOptions *)self sceneCellOptions];
  [v11 setSceneCellOptions:v18];

  double v19 = [(HUGridLayoutOptions *)self placeholderSceneCellOptions];
  [v11 setPlaceholderSceneCellOptions:v19];

  double v20 = [(HUGridLayoutOptions *)self serviceCellOptions];
  [v11 setServiceCellOptions:v20];

  double v21 = [(HUGridLayoutOptions *)self placeholderServiceCellOptions];
  [v11 setPlaceholderServiceCellOptions:v21];

  double v22 = [(HUGridLayoutOptions *)self bannerCellOptions];
  [v11 setBannerCellOptions:v22];

  double v23 = [(HUGridLayoutOptions *)self welcomeUIBannerCellOptions];
  [v11 setWelcomeUIBannerCellOptions:v23];

  objc_msgSend(v11, "setContentColorStyle:", -[HUGridLayoutOptions contentColorStyle](self, "contentColorStyle"));
  v24 = [(HUGridLayoutOptions *)self contentSizeCategory];
  [v11 setContentSizeCategory:v24];

  return v11;
}

- (double)gutter
{
  return 10.0;
}

+ (unint64_t)_numberOfAccessibilityColumnsForFlexibleWidthStyleWithSizeSubclass:(int64_t)a3
{
  unint64_t result = 4;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      if (objc_msgSend(MEMORY[0x1E4F69138], "isHomeUIService", v3, v4)) {
        unint64_t result = 3;
      }
      else {
        unint64_t result = 2;
      }
      break;
    case 4:
    case 5:
    case 9:
      return result;
    case 6:
      unint64_t result = 8;
      break;
    case 7:
    case 8:
    case 10:
      unint64_t result = 6;
      break;
    default:
      unint64_t result = objc_msgSend((id)4, "_numberOfNormalColumnsForFlexibleWidthStyleWithSizeSubclass:");
      break;
  }
  return result;
}

- (double)pointWidthForCurrentViewSizeSubclass
{
  if (![(HUGridLayoutOptions *)self viewSizeSubclass]
    || [(HUGridLayoutOptions *)self viewSizeSubclass] == 1
    || [(HUGridLayoutOptions *)self viewSizeSubclass] == 2
    || [(HUGridLayoutOptions *)self viewSizeSubclass] == 6)
  {
    [(HUGridLayoutOptions *)self pointWidthForFullWidthCell];
  }
  else
  {
    [(HUGridLayoutOptions *)self columnSpacing];
    double v5 = v4;
    [(HUGridLayoutOptions *)self pointWidthForNumberOfColumns:2];
    return v5 + v6 * 2.0;
  }
  return result;
}

- (double)fixedWidthForCell
{
  unint64_t v3 = [(HUGridLayoutOptions *)self viewSizeSubclass] - 1;
  if (v3 > 9) {
    double v4 = 320.0;
  }
  else {
    double v4 = dbl_1BEA1A7C0[v3];
  }
  double v5 = objc_opt_class();
  int64_t v6 = [(HUGridLayoutOptions *)self viewSizeSubclass];
  double v7 = [(HUGridLayoutOptions *)self contentSizeCategory];
  uint64_t v8 = [v5 _numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:v6 contentSizeCategory:v7];

  [(HUGridLayoutOptions *)self _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:v8 totalNumberOfColumns:1 totalWidth:1.0 useDefaultSectionMargin:v4];
  return result;
}

- (double)pointWidthForFullWidthCell
{
  [(HUGridLayoutOptions *)self viewSize];
  double v4 = v3;
  [(HUGridLayoutOptions *)self sectionLeadingMargin];
  double v6 = v4 - v5;
  [(HUGridLayoutOptions *)self sectionTrailingMargin];
  return v6 - v7;
}

- (double)_pointWidthForFixedColumnStyleWithFractionalNumberOfColumns:(double)a3
{
  unint64_t v5 = [(HUGridLayoutOptions *)self viewSizeSubclass] - 1;
  if (v5 > 9) {
    double v6 = 320.0;
  }
  else {
    double v6 = dbl_1BEA1A7C0[v5];
  }
  double v7 = objc_opt_class();
  int64_t v8 = [(HUGridLayoutOptions *)self viewSizeSubclass];
  unint64_t v9 = [(HUGridLayoutOptions *)self contentSizeCategory];
  uint64_t v10 = [v7 _numberOfColumnsForFlexibleWidthStyleWithSizeSubclass:v8 contentSizeCategory:v9];

  [(HUGridLayoutOptions *)self _pointWidthForFlexibleColumnStyleWithFractionalNumberOfColumns:v10 totalNumberOfColumns:0 totalWidth:a3 useDefaultSectionMargin:v6];
  return result;
}

- (double)cameraCellWidth
{
  uint64_t v3 = [(HUGridLayoutOptions *)self viewSizeSubclass];
  uint64_t v4 = [(HUGridLayoutOptions *)self numberOfColumns];
  float v5 = (float)v4;
  if (v3 > 2) {
    float v5 = (float)v4 * 0.5;
  }
  double v6 = v5;

  [(HUGridLayoutOptions *)self _pointWidthForFractionalNumberOfColumns:v6];
  return result;
}

- (double)cameraCellHeight
{
  uint64_t v3 = [(HUGridLayoutOptions *)self cameraCellOptions];
  [v3 headerViewHeight];
  double v5 = v4;
  [(HUGridLayoutOptions *)self cameraCellWidth];
  double v7 = v6;
  int64_t v8 = [(HUGridLayoutOptions *)self cameraCellOptions];
  [v8 cameraViewAspectRatio];
  double v10 = HURoundToScreenScale(v5 + v7 / v9);

  return v10;
}

- (double)headlineCellHeight
{
  uint64_t v3 = [(HUGridLayoutOptions *)self headlineCellOptions];
  [v3 headlineBaselineOffset];
  double v5 = v4;

  BOOL v6 = [(HUGridLayoutOptions *)self statusHidden];
  double v7 = 0.0;
  if (v6) {
    [(HUGridLayoutOptions *)self headlineBaselineToSceneHeaderBaselineDistance];
  }
  double v8 = v5 + v7;
  BOOL v9 = [(HUGridLayoutOptions *)self isEditing];
  double result = v8 + 26.0;
  if (!v9) {
    return v8;
  }
  return result;
}

- (double)statusListCellHeight
{
  unint64_t v2 = [(HUGridLayoutOptions *)self statusCellOptions];
  [v2 cellHeight];
  UICeilToViewScale();
  double v4 = v3;

  return v4;
}

- (double)statusListCellTopMargin
{
  int v3 = [MEMORY[0x1E4F69758] isAMac];
  [(HUGridLayoutOptions *)self gutter];
  if (v3) {
    return result + result;
  }
  return result;
}

- (double)statusListCellBottomMargin
{
  [(HUGridLayoutOptions *)self gutter];
  return v2 + v2;
}

- (double)largeTitleCellTopMargin
{
  return 40.0;
}

- (double)preferredSectionHeightForNumberOfSceneRows:(unint64_t)a3
{
  double v5 = [(HUGridLayoutOptions *)self sceneCellOptions];
  [v5 cellHeight];
  -[HUGridLayoutOptions _preferredSectionHeightForNumberOfRows:withCellHeight:](self, "_preferredSectionHeightForNumberOfRows:withCellHeight:", a3);
  double v7 = v6;

  return v7;
}

- (double)preferredSectionHeightForNumberOfServiceRows:(unint64_t)a3 spanningColumns:(unint64_t)a4
{
  [(HUGridLayoutOptions *)self pointWidthForNumberOfColumns:a4];

  -[HUGridLayoutOptions _preferredSectionHeightForNumberOfRows:withCellHeight:](self, "_preferredSectionHeightForNumberOfRows:withCellHeight:", a3);
  return result;
}

- (double)_preferredSectionHeightForNumberOfRows:(unint64_t)a3 withCellHeight:(double)a4
{
  [(HUGridLayoutOptions *)self sectionTopMargin];
  double v8 = v7;
  [(HUGridLayoutOptions *)self sectionBottomMargin];
  double v10 = v8 + v9 + (double)a3 * a4;
  [(HUGridLayoutOptions *)self rowSpacing];
  return v10 + (double)(a3 - 1) * v11;
}

- (double)pointWidthForWelcomeUIBanner
{
  if (![(HUGridLayoutOptions *)self viewSizeSubclass]
    || [(HUGridLayoutOptions *)self viewSizeSubclass] == 1
    || [(HUGridLayoutOptions *)self viewSizeSubclass] == 2)
  {
    [(HUGridLayoutOptions *)self pointWidthForFullWidthCell];
  }
  else
  {
    [(HUGridLayoutOptions *)self columnSpacing];
    double v5 = v4;
    [(HUGridLayoutOptions *)self pointWidthForNumberOfColumns:2];
    return v5 + v6 * 1.5;
  }
  return result;
}

- (id)_columnStyleToString:(unint64_t)a3
{
  int v3 = &stru_1F18F92B8;
  if (!a3) {
    int v3 = @"HUGridLayoutColumnStyleFlexibleWidth";
  }
  if (a3 == 1) {
    return @"HUGridLayoutColumnStyleFixedWidth";
  }
  else {
    return v3;
  }
}

- (NSString)description
{
  int v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  double v4 = NSString;
  [(HUGridLayoutOptions *)self viewSize];
  uint64_t v6 = v5;
  [(HUGridLayoutOptions *)self viewSize];
  double v8 = [v4 stringWithFormat:@"(%f, %f)", v6, v7];
  [v3 appendString:v8 withName:@"viewSize"];
  double v9 = [(HUGridLayoutOptions *)self _columnStyleToString:[(HUGridLayoutOptions *)self columnStyle]];
  [v3 appendString:v9 withName:@"columnStyle"];

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HUGridLayoutOptions isEditing](self, "isEditing"), @"editing");
  double v11 = [v3 build];

  return (NSString *)v11;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setColumnStyle:(unint64_t)a3
{
  self->_columnStyle = a3;
}

- (BOOL)headlineHidden
{
  return self->_headlineHidden;
}

- (void)setHeadlineHidden:(BOOL)a3
{
  self->_headlineHidden = a3;
}

- (BOOL)statusHidden
{
  return self->_statusHidden;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UIFont)headlineFont
{
  return self->_headlineFont;
}

- (double)headlineBaselineToSceneHeaderBaselineDistance
{
  return self->_headlineBaselineToSceneHeaderBaselineDistance;
}

- (UIEdgeInsets)sectionTitleMargin
{
  double top = self->_sectionTitleMargin.top;
  double left = self->_sectionTitleMargin.left;
  double bottom = self->_sectionTitleMargin.bottom;
  double right = self->_sectionTitleMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)minimumMarginBelowHeadline
{
  return self->_minimumMarginBelowHeadline;
}

- (HUGridBannerCellLayoutOptions)bannerCellOptions
{
  return self->_bannerCellOptions;
}

- (HUGridWelcomeUIBannerCellLayoutOptions)welcomeUIBannerCellOptions
{
  return self->_welcomeUIBannerCellOptions;
}

- (HUGridMediaPlatterCellLayoutOptions)mediaPlatterCellOptions
{
  return self->_mediaPlatterCellOptions;
}

- (HUMosaicCameraCellLayoutOptions)mosaicCameraCellOptions
{
  return self->_mosaicCameraCellOptions;
}

- (void)setMosaicCameraCellOptions:(id)a3
{
}

- (int64_t)numberOfCameraCellsPerRow
{
  return self->_numberOfCameraCellsPerRow;
}

- (void)setOverrideViewSizeSubclass:(id)a3
{
}

@end