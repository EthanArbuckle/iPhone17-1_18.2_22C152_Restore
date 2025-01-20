@interface WDMedicalRecordDisplayItem
+ (id)accountSourceItem;
+ (id)conceptCardItemWithCategoryType:(int64_t)a3;
+ (id)conceptHeaderItemWithCategoryType:(int64_t)a3 title:(id)a4;
+ (id)detailAttributedSubtitleItem;
+ (id)detailSpinnerItem;
+ (id)detailSubtitleItem;
+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4;
+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4 extraTopPadding:(BOOL)a5;
+ (id)detailTitleItem;
+ (id)recordCardItem;
+ (id)sectionHeaderItem;
+ (id)standaloneItem;
+ (id)timelineSummaryAppendixItem;
+ (id)timelineSummaryCategoryMinimizedItem;
+ (id)timelineSummaryCategoryMinimizedItemWithCategoryType:(int64_t)a3;
+ (id)timelineSummaryCategoryTitleItem;
+ (id)timelineSummaryCategoryTitleItemWithCategoryType:(int64_t)a3;
+ (id)timelineSummaryContentWithSubtitleItem;
+ (id)timelineSummaryDetailCategoryTitleItemWithMedicalRecord:(id)a3;
+ (id)timelineSummaryPanelTitleItem;
+ (id)timelineSummaryReferenceRangeItem;
+ (id)timelineSummarySourceTitleItem;
+ (id)timelineSummaryValueItem;
- (BOOL)actionEnabled;
- (BOOL)extraTopPadding;
- (BOOL)separatorHidden;
- (BOOL)showDisclosureIndicator;
- (BOOL)showSelection;
- (BOOL)showSpinner;
- (BOOL)useRegularFontForSubtitle;
- (HKClinicalBrandable)brandableObject;
- (HKConcept)ontologyConcept;
- (HKInspectableValueInRange)chartValueWithRange;
- (HKMedicalRecord)medicalRecord;
- (HKUIMetricColors)metricColors;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSNumber)recordCount;
- (NSString)contextString;
- (NSString)dateString;
- (NSString)headerString;
- (NSString)panelName;
- (NSString)subtitle;
- (NSString)title;
- (NSString)unitString;
- (NSString)valueString;
- (UIColor)backgroundColor;
- (UIColor)imageColor;
- (UIEdgeInsets)separatorInsets;
- (UIImage)image;
- (WDMedicalRecordCategorySummary)categorySummary;
- (WDMedicalRecordDisplayItem)init;
- (double)rowHeight;
- (id)description;
- (int64_t)displayItemType;
- (int64_t)placement;
- (int64_t)recordCategoryType;
- (int64_t)separatorStyle;
- (void)setActionEnabled:(BOOL)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBrandableObject:(id)a3;
- (void)setCategorySummary:(id)a3;
- (void)setChartValueWithRange:(id)a3;
- (void)setContextString:(id)a3;
- (void)setDateString:(id)a3;
- (void)setDisplayItemType:(int64_t)a3;
- (void)setExtraTopPadding:(BOOL)a3;
- (void)setHeaderString:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageColor:(id)a3;
- (void)setMedicalRecord:(id)a3;
- (void)setMetricColors:(id)a3;
- (void)setOntologyConcept:(id)a3;
- (void)setPanelName:(id)a3;
- (void)setPlacement:(int64_t)a3;
- (void)setRecordCategoryType:(int64_t)a3;
- (void)setRecordCount:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShowDisclosureIndicator:(BOOL)a3;
- (void)setShowSelection:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnitString:(id)a3;
- (void)setUseRegularFontForSubtitle:(BOOL)a3;
- (void)setValueString:(id)a3;
@end

@implementation WDMedicalRecordDisplayItem

- (WDMedicalRecordDisplayItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)WDMedicalRecordDisplayItem;
  v2 = [(WDMedicalRecordDisplayItem *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_separatorStyle = 1;
    v2->_separatorHidden = 1;
    +[WDMedicalRecordGroupableCell defaultGap];
    CGFloat v5 = v4;
    +[WDMedicalRecordGroupableCell defaultGap];
    v3->_separatorInsets.top = 0.0;
    v3->_separatorInsets.left = v5;
    v3->_separatorInsets.bottom = 0.0;
    v3->_separatorInsets.right = v6;
    v3->_actionEnabled = 1;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(WDMedicalRecordDisplayItem *)self displayItemType];
  CGFloat v5 = [(WDMedicalRecordDisplayItem *)self title];
  CGFloat v6 = [(WDMedicalRecordDisplayItem *)self subtitle];
  v7 = [(WDMedicalRecordDisplayItem *)self valueString];
  objc_super v8 = [(WDMedicalRecordDisplayItem *)self chartValueWithRange];
  v9 = [v3 stringWithFormat:@"Display Item Type: %li, Title: %@, Subtitle: %@, Value: %@, Chart Value: %@", v4, v5, v6, v7, v8];

  return v9;
}

+ (id)recordCardItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:0];
  return v2;
}

+ (id)timelineSummaryCategoryTitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:2];
  return v2;
}

+ (id)timelineSummaryCategoryTitleItemWithCategoryType:(int64_t)a3
{
  int64_t v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v4 setDisplayItemType:2];
  [(WDMedicalRecordDisplayItem *)v4 setPlacement:3];
  CGFloat v5 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  CGFloat v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  objc_super v8 = [v7 displayName];
  [(WDMedicalRecordDisplayItem *)v4 setTitle:v8];

  v9 = [v7 displayImage];
  [(WDMedicalRecordDisplayItem *)v4 setImage:v9];

  v10 = [v7 categoryMetricColors];
  [(WDMedicalRecordDisplayItem *)v4 setMetricColors:v10];

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", [v7 categoryType]);
  return v4;
}

+ (id)timelineSummaryDetailCategoryTitleItemWithMedicalRecord:(id)a3
{
  id v3 = a3;
  int64_t v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v4 setDisplayItemType:2];
  [(WDMedicalRecordDisplayItem *)v4 setPlacement:3];
  CGFloat v5 = [v3 title];
  [(WDMedicalRecordDisplayItem *)v4 setTitle:v5];

  CGFloat v6 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  v7 = NSNumber;
  uint64_t v8 = [v3 recordCategoryType];

  v9 = [v7 numberWithInteger:v8];
  v10 = [v6 objectForKeyedSubscript:v9];

  v11 = [v10 displayImage];
  [(WDMedicalRecordDisplayItem *)v4 setImage:v11];

  v12 = [v10 categoryMetricColors];
  [(WDMedicalRecordDisplayItem *)v4 setMetricColors:v12];

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", [v10 categoryType]);
  return v4;
}

+ (id)timelineSummaryCategoryMinimizedItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:3];
  return v2;
}

+ (id)timelineSummaryCategoryMinimizedItemWithCategoryType:(int64_t)a3
{
  int64_t v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v4 setDisplayItemType:3];
  [(WDMedicalRecordDisplayItem *)v4 setPlacement:3];
  CGFloat v5 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  CGFloat v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 categoryMetricColors];
  [(WDMedicalRecordDisplayItem *)v4 setMetricColors:v8];

  -[WDMedicalRecordDisplayItem setRecordCategoryType:](v4, "setRecordCategoryType:", [v7 categoryType]);
  return v4;
}

+ (id)timelineSummarySourceTitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:1];
  return v2;
}

+ (id)timelineSummaryContentWithSubtitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:4];
  [(WDMedicalRecordDisplayItem *)v2 setShowDisclosureIndicator:0];
  return v2;
}

+ (id)timelineSummaryValueItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:5];
  return v2;
}

+ (id)timelineSummaryReferenceRangeItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:6];
  return v2;
}

+ (id)timelineSummaryAppendixItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:7];
  [(WDMedicalRecordDisplayItem *)v2 setSeparatorHidden:1];
  return v2;
}

+ (id)timelineSummaryPanelTitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:8];
  [(WDMedicalRecordDisplayItem *)v2 setPlacement:1];
  return v2;
}

+ (id)detailTitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:14];
  return v2;
}

+ (id)detailSubtitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:15];
  return v2;
}

+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 detailSubtitleItem];
  [v8 setTitle:v7];

  [v8 setSubtitle:v6];
  [v8 setSeparatorStyle:0];
  [v8 setSeparatorHidden:0];
  return v8;
}

+ (id)detailSubtitleItemWithTitle:(id)a3 subtitle:(id)a4 extraTopPadding:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = [a1 detailSubtitleItemWithTitle:a3 subtitle:a4];
  [v6 setExtraTopPadding:v5];
  return v6;
}

+ (id)detailAttributedSubtitleItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:16];
  return v2;
}

+ (id)detailSpinnerItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:17];
  return v2;
}

+ (id)sectionHeaderItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:9];
  [(WDMedicalRecordDisplayItem *)v2 setSeparatorStyle:0];
  [(WDMedicalRecordDisplayItem *)v2 setSeparatorHidden:0];
  -[WDMedicalRecordDisplayItem setSeparatorInsets:](v2, "setSeparatorInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  return v2;
}

+ (id)accountSourceItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:10];
  return v2;
}

+ (id)standaloneItem
{
  v2 = objc_alloc_init(WDMedicalRecordDisplayItem);
  [(WDMedicalRecordDisplayItem *)v2 setDisplayItemType:11];
  return v2;
}

+ (id)conceptHeaderItemWithCategoryType:(int64_t)a3 title:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(WDMedicalRecordDisplayItem);
  id v7 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = [v9 displayImage];
  [(WDMedicalRecordDisplayItem *)v6 setImage:v10];

  v11 = [v9 categoryMetricColors];
  [(WDMedicalRecordDisplayItem *)v6 setMetricColors:v11];

  LODWORD(v11) = +[HRFeatures hideCategoryNameFromHeader];
  uint64_t v12 = [v5 length];
  if (v11)
  {
    if (!v12)
    {
      v19 = [v9 displayName];
      [(WDMedicalRecordDisplayItem *)v6 setTitle:v19];

      goto LABEL_9;
    }
    v13 = v6;
    id v14 = v5;
  }
  else
  {
    if (v12)
    {
      v15 = NSString;
      v16 = HRLocalizedString(@"DATATYPE_HEADER_FORMAT_2_%@_%@");
      v17 = [v9 displayName];
      v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17, v5);
      [(WDMedicalRecordDisplayItem *)v6 setTitle:v18];

      goto LABEL_9;
    }
    v13 = v6;
    id v14 = 0;
  }
  [(WDMedicalRecordDisplayItem *)v13 setTitle:v14];
LABEL_9:
  [(WDMedicalRecordDisplayItem *)v6 setDisplayItemType:18];
  [(WDMedicalRecordDisplayItem *)v6 setPlacement:3];

  return v6;
}

+ (id)conceptCardItemWithCategoryType:(int64_t)a3
{
  int64_t v4 = objc_alloc_init(WDMedicalRecordDisplayItem);
  id v5 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 displayImage];
  [(WDMedicalRecordDisplayItem *)v4 setImage:v8];

  v9 = [v7 categoryMetricColors];
  [(WDMedicalRecordDisplayItem *)v4 setMetricColors:v9];

  [(WDMedicalRecordDisplayItem *)v4 setDisplayItemType:19];
  [(WDMedicalRecordDisplayItem *)v4 setPlacement:2];

  return v4;
}

- (int64_t)displayItemType
{
  return self->_displayItemType;
}

- (void)setDisplayItemType:(int64_t)a3
{
  self->_displayItemType = a3;
}

- (BOOL)extraTopPadding
{
  return self->_extraTopPadding;
}

- (void)setExtraTopPadding:(BOOL)a3
{
  self->_extraTopPadding = a3;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  self->_separatorStyle = a3;
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (int64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(int64_t)a3
{
  self->_placement = a3;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (void)setRecordCategoryType:(int64_t)a3
{
  self->_recordCategoryType = a3;
}

- (BOOL)showDisclosureIndicator
{
  return self->_showDisclosureIndicator;
}

- (void)setShowDisclosureIndicator:(BOOL)a3
{
  self->_showDisclosureIndicator = a3;
}

- (BOOL)showSelection
{
  return self->_showSelection;
}

- (void)setShowSelection:(BOOL)a3
{
  self->_showSelection = a3;
}

- (BOOL)useRegularFontForSubtitle
{
  return self->_useRegularFontForSubtitle;
}

- (void)setUseRegularFontForSubtitle:(BOOL)a3
{
  self->_useRegularFontForSubtitle = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void)setAttributedSubtitle:(id)a3
{
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (void)setImageColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (void)setMetricColors:(id)a3
{
}

- (HKInspectableValueInRange)chartValueWithRange
{
  return self->_chartValueWithRange;
}

- (void)setChartValueWithRange:(id)a3
{
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (void)setMedicalRecord:(id)a3
{
}

- (WDMedicalRecordCategorySummary)categorySummary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_categorySummary);
  return (WDMedicalRecordCategorySummary *)WeakRetained;
}

- (void)setCategorySummary:(id)a3
{
}

- (HKClinicalBrandable)brandableObject
{
  return self->_brandableObject;
}

- (void)setBrandableObject:(id)a3
{
}

- (NSString)panelName
{
  return self->_panelName;
}

- (void)setPanelName:(id)a3
{
}

- (NSString)headerString
{
  return self->_headerString;
}

- (void)setHeaderString:(id)a3
{
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
}

- (NSNumber)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(id)a3
{
}

- (BOOL)actionEnabled
{
  return self->_actionEnabled;
}

- (void)setActionEnabled:(BOOL)a3
{
  self->_actionEnabled = a3;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_recordCount, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_panelName, 0);
  objc_storeStrong((id *)&self->_brandableObject, 0);
  objc_destroyWeak((id *)&self->_categorySummary);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_chartValueWithRange, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end