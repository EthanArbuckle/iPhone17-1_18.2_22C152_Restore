@interface HKReferenceRangeViewConfiguration
+ (id)annotationEmbeddedConfiguration;
+ (id)defaultConfiguration;
- (BOOL)hideReferenceRangeValues;
- (Class)labelClass;
- (NSString)currentValueUnitTextStyle;
- (NSString)referenceRangeTextStyle;
- (UIColor)currentValueTextColor;
- (UIColor)currentValueUnitTextColor;
- (UIColor)referenceRangeViewBorderColor;
- (UIColor)referenceRangeViewColor;
- (UIColor)referenceValueTextColor;
- (UIFont)currentValueUnitFont;
- (UIFont)currentValueValueFontWithRange;
- (UIFont)currentValueValueFontWithoutRange;
- (UIFont)dynamicTypeAnchorFont;
- (double)currentValueTextSize;
- (double)currentValueToReferenceValuePadding;
- (double)horizontalPadding;
- (double)referenceRangeViewHeight;
- (double)referenceValueYOffset;
- (int64_t)currentValueNumLinesIfNoRange;
- (void)setCurrentValueNumLinesIfNoRange:(int64_t)a3;
- (void)setCurrentValueTextColor:(id)a3;
- (void)setCurrentValueTextSize:(double)a3;
- (void)setCurrentValueToReferenceValuePadding:(double)a3;
- (void)setCurrentValueUnitFont:(id)a3;
- (void)setCurrentValueUnitTextColor:(id)a3;
- (void)setCurrentValueUnitTextStyle:(id)a3;
- (void)setCurrentValueValueFontWithRange:(id)a3;
- (void)setCurrentValueValueFontWithoutRange:(id)a3;
- (void)setDynamicTypeAnchorFont:(id)a3;
- (void)setHideReferenceRangeValues:(BOOL)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setLabelClass:(Class)a3;
- (void)setReferenceRangeTextStyle:(id)a3;
- (void)setReferenceRangeViewBorderColor:(id)a3;
- (void)setReferenceRangeViewColor:(id)a3;
- (void)setReferenceRangeViewHeight:(double)a3;
- (void)setReferenceValueTextColor:(id)a3;
- (void)setReferenceValueYOffset:(double)a3;
@end

@implementation HKReferenceRangeViewConfiguration

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(HKReferenceRangeViewConfiguration);
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueToReferenceValuePadding:3.0];
  [(HKReferenceRangeViewConfiguration *)v2 setHorizontalPadding:16.0];
  v3 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewColor:v3];

  v4 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewBorderColor:v4];

  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewHeight:16.0];
  v5 = [MEMORY[0x1E4FB1618] labelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueTextColor:v5];

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueUnitTextColor:v6];

  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceValueTextColor:v7];

  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueTextSize:27.0];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueUnitTextStyle:*MEMORY[0x1E4FB2950]];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueNumLinesIfNoRange:3];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeTextStyle:*MEMORY[0x1E4FB28F0]];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceValueYOffset:5.0];
  [(HKReferenceRangeViewConfiguration *)v2 setLabelClass:objc_opt_class()];
  return v2;
}

+ (id)annotationEmbeddedConfiguration
{
  v2 = objc_alloc_init(HKReferenceRangeViewConfiguration);
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueToReferenceValuePadding:2.0];
  [(HKReferenceRangeViewConfiguration *)v2 setHorizontalPadding:0.0];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewColor:v3];

  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewBorderColor:0];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceRangeViewHeight:12.0];
  v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopValueFont");
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueValueFontWithoutRange:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopValueFontSmaller");
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueValueFontWithRange:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueUnitFont:v6];

  v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [(HKReferenceRangeViewConfiguration *)v2 setDynamicTypeAnchorFont:v7];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueTextColor:v8];

  v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueUnitTextColor:v9];

  v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceValueTextColor:v10];

  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueTextSize:22.0];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueUnitTextStyle:*MEMORY[0x1E4FB2950]];
  [(HKReferenceRangeViewConfiguration *)v2 setCurrentValueNumLinesIfNoRange:1];
  [(HKReferenceRangeViewConfiguration *)v2 setHideReferenceRangeValues:1];
  [(HKReferenceRangeViewConfiguration *)v2 setReferenceValueYOffset:2.0];
  [(HKReferenceRangeViewConfiguration *)v2 setLabelClass:objc_opt_class()];
  return v2;
}

- (double)currentValueToReferenceValuePadding
{
  return self->_currentValueToReferenceValuePadding;
}

- (void)setCurrentValueToReferenceValuePadding:(double)a3
{
  self->_currentValueToReferenceValuePadding = a3;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (double)referenceRangeViewHeight
{
  return self->_referenceRangeViewHeight;
}

- (void)setReferenceRangeViewHeight:(double)a3
{
  self->_referenceRangeViewHeight = a3;
}

- (UIColor)referenceRangeViewColor
{
  return self->_referenceRangeViewColor;
}

- (void)setReferenceRangeViewColor:(id)a3
{
}

- (UIColor)referenceRangeViewBorderColor
{
  return self->_referenceRangeViewBorderColor;
}

- (void)setReferenceRangeViewBorderColor:(id)a3
{
}

- (UIFont)currentValueValueFontWithRange
{
  return self->_currentValueValueFontWithRange;
}

- (void)setCurrentValueValueFontWithRange:(id)a3
{
}

- (UIFont)currentValueValueFontWithoutRange
{
  return self->_currentValueValueFontWithoutRange;
}

- (void)setCurrentValueValueFontWithoutRange:(id)a3
{
}

- (UIFont)currentValueUnitFont
{
  return self->_currentValueUnitFont;
}

- (void)setCurrentValueUnitFont:(id)a3
{
}

- (UIFont)dynamicTypeAnchorFont
{
  return self->_dynamicTypeAnchorFont;
}

- (void)setDynamicTypeAnchorFont:(id)a3
{
}

- (UIColor)currentValueTextColor
{
  return self->_currentValueTextColor;
}

- (void)setCurrentValueTextColor:(id)a3
{
}

- (UIColor)currentValueUnitTextColor
{
  return self->_currentValueUnitTextColor;
}

- (void)setCurrentValueUnitTextColor:(id)a3
{
}

- (UIColor)referenceValueTextColor
{
  return self->_referenceValueTextColor;
}

- (void)setReferenceValueTextColor:(id)a3
{
}

- (double)referenceValueYOffset
{
  return self->_referenceValueYOffset;
}

- (void)setReferenceValueYOffset:(double)a3
{
  self->_referenceValueYOffset = a3;
}

- (double)currentValueTextSize
{
  return self->_currentValueTextSize;
}

- (void)setCurrentValueTextSize:(double)a3
{
  self->_currentValueTextSize = a3;
}

- (NSString)currentValueUnitTextStyle
{
  return self->_currentValueUnitTextStyle;
}

- (void)setCurrentValueUnitTextStyle:(id)a3
{
}

- (int64_t)currentValueNumLinesIfNoRange
{
  return self->_currentValueNumLinesIfNoRange;
}

- (void)setCurrentValueNumLinesIfNoRange:(int64_t)a3
{
  self->_currentValueNumLinesIfNoRange = a3;
}

- (NSString)referenceRangeTextStyle
{
  return self->_referenceRangeTextStyle;
}

- (void)setReferenceRangeTextStyle:(id)a3
{
}

- (BOOL)hideReferenceRangeValues
{
  return self->_hideReferenceRangeValues;
}

- (void)setHideReferenceRangeValues:(BOOL)a3
{
  self->_hideReferenceRangeValues = a3;
}

- (Class)labelClass
{
  return self->_labelClass;
}

- (void)setLabelClass:(Class)a3
{
  self->_labelClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceRangeTextStyle, 0);
  objc_storeStrong((id *)&self->_currentValueUnitTextStyle, 0);
  objc_storeStrong((id *)&self->_referenceValueTextColor, 0);
  objc_storeStrong((id *)&self->_currentValueUnitTextColor, 0);
  objc_storeStrong((id *)&self->_currentValueTextColor, 0);
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, 0);
  objc_storeStrong((id *)&self->_currentValueUnitFont, 0);
  objc_storeStrong((id *)&self->_currentValueValueFontWithoutRange, 0);
  objc_storeStrong((id *)&self->_currentValueValueFontWithRange, 0);
  objc_storeStrong((id *)&self->_referenceRangeViewBorderColor, 0);
  objc_storeStrong((id *)&self->_referenceRangeViewColor, 0);
}

@end