@interface EKUILargeTextUtilities
+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 maximumValue:(double)a4 shouldScaleForSmallerSizes:(BOOL)a5;
+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 shouldScaleForSmallerSizes:(BOOL)a4;
+ (double)contentSizeCategoryScaledValueForLargestNonAccessibilityValue:(double)a3 maximumValue:(double)a4;
+ (double)contentSizeCategoryScaledValueForLargestValue:(double)a3;
+ (double)contentSizeCategoryScaledValueFromContentSizeCategory:(id)a3 correspondingValue:(double)a4 maximumValue:(double)a5;
+ (void)clearCache;
@end

@implementation EKUILargeTextUtilities

+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 maximumValue:(double)a4 shouldScaleForSmallerSizes:(BOOL)a5
{
  v6 = (void *)__fontForScaling;
  if (!__fontForScaling)
  {
    uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v8 = (void *)__fontForScaling;
    __fontForScaling = v7;

    v6 = (void *)__fontForScaling;
  }
  [v6 _scaledValueForValue:a3];

  CUIKRoundToScreenScale();
  return result;
}

+ (void)clearCache
{
  v2 = (void *)__fontForScaling;
  __fontForScaling = 0;
}

+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 shouldScaleForSmallerSizes:(BOOL)a4
{
  [a1 contentSizeCategoryScaledValueForDefaultValue:a4 maximumValue:a3 shouldScaleForSmallerSizes:1.79769313e308];
  return result;
}

+ (double)contentSizeCategoryScaledValueForLargestNonAccessibilityValue:(double)a3 maximumValue:(double)a4
{
  [a1 contentSizeCategoryScaledValueFromContentSizeCategory:*MEMORY[0x1E4FB27B0] correspondingValue:a3 maximumValue:a4];
  return result;
}

+ (double)contentSizeCategoryScaledValueForLargestValue:(double)a3
{
  [a1 contentSizeCategoryScaledValueFromContentSizeCategory:*MEMORY[0x1E4FB2778] correspondingValue:a3 maximumValue:1.79769313e308];
  return result;
}

+ (double)contentSizeCategoryScaledValueFromContentSizeCategory:(id)a3 correspondingValue:(double)a4 maximumValue:(double)a5
{
  v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  uint64_t v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:a3];
  v8 = [v5 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v7];

  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
  [v9 _bodyLeading];
  [v8 _bodyLeading];

  CUIKRoundToScreenScale();
  double v11 = v10;

  return v11;
}

@end