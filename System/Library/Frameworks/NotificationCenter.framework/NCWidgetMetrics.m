@interface NCWidgetMetrics
+ (double)defaultWidgetRowHeight;
+ (double)scaledValueForValue:(double)a3;
+ (double)widgetRowHeight;
+ (void)_updateWidgetRowHeightForContentSizeCategory;
@end

@implementation NCWidgetMetrics

+ (double)scaledValueForValue:(double)a3
{
  v4 = [MEMORY[0x263F1CBC8] keyWindow];
  if (v4) {
    [MEMORY[0x263F1CBC8] keyWindow];
  }
  else {
  v5 = [MEMORY[0x263F1C920] mainScreen];
  }
  v6 = [v5 traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v7
    && ((v8 = (void *)*MEMORY[0x263F1D148],
         UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v7, (UIContentSizeCategory)*MEMORY[0x263F1D148]) == NSOrderedAscending)
     || (id v9 = v8, v7, (v7 = v9) != 0)))
  {
    v10 = [MEMORY[0x263F1C668] defaultMetrics];
    v11 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:v7];
    [v10 scaledValueForValue:v11 compatibleWithTraitCollection:a3];
    double v13 = v12;
  }
  else
  {
    v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v7 _scaledValueForValue:a3];
    double v13 = v14;
  }

  return v13;
}

+ (double)defaultWidgetRowHeight
{
  if (defaultWidgetRowHeight_onceToken != -1) {
    dispatch_once(&defaultWidgetRowHeight_onceToken, &__block_literal_global_12);
  }
  return *(double *)&defaultWidgetRowHeight___defaultRowHeight;
}

double __41__NCWidgetMetrics_defaultWidgetRowHeight__block_invoke()
{
  double result = *MEMORY[0x263F1D608];
  *(double *)&defaultWidgetRowHeight___defaultRowHeight = result;
  return result;
}

+ (double)widgetRowHeight
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__NCWidgetMetrics_widgetRowHeight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (widgetRowHeight_onceToken != -1) {
    dispatch_once(&widgetRowHeight_onceToken, block);
  }
  double result = *(double *)&__rowHeightForContentSizeCategory;
  if (*(double *)&__rowHeightForContentSizeCategory == 0.0)
  {
    objc_msgSend(a1, "defaultWidgetRowHeight", *(double *)&__rowHeightForContentSizeCategory);
    objc_msgSend(a1, "scaledValueForValue:");
    v4 = [MEMORY[0x263F1C920] mainScreen];
    UIRoundToScreenScale();
    __rowHeightForContentSizeCategory = v5;

    return *(double *)&__rowHeightForContentSizeCategory;
  }
  return result;
}

void __34__NCWidgetMetrics_widgetRowHeight__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__updateWidgetRowHeightForContentSizeCategory name:*MEMORY[0x263F1D158] object:0];
}

+ (void)_updateWidgetRowHeightForContentSizeCategory
{
  __rowHeightForContentSizeCategory = 0;
}

@end