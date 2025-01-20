@interface EKUIConstrainedFontUtilities
+ (id)constrainedBodyBoldTextLabelFont;
+ (id)constrainedBodyTextLabelFont;
+ (id)constrainedCaption1TextLabelFont;
+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 addingSymbolicTraits:(unsigned int)a5 traitCollection:(id)a6;
+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 traitCollection:(id)a5;
+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 maximumContentSizeCategory:(id)a5 traitCollection:(id)a6;
+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 traitCollection:(id)a5;
+ (int64_t)tableViewCellCappedSymbolImageScaleWithScale:(int64_t)a3 traitCollection:(id)a4;
+ (void)clearFontCaches;
+ (void)initialize;
@end

@implementation EKUIConstrainedFontUtilities

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EKUIConstrainedFontUtilities_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __42__EKUIConstrainedFontUtilities_initialize__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_clearFontCaches name:*MEMORY[0x1E4FB27A8] object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_clearFontCaches name:*MEMORY[0x1E4F1C370] object:0];
}

+ (void)clearFontCaches
{
  id v2 = (void *)__constrainedBodyTextLabelFont;
  __constrainedBodyTextLabelFont = 0;

  v3 = (void *)__constrainedCaption1TextLabelFont;
  __constrainedCaption1TextLabelFont = 0;

  v4 = (void *)__constrainedBodyBoldTextLabelFont;
  __constrainedBodyBoldTextLabelFont = 0;
}

+ (id)constrainedBodyTextLabelFont
{
  id v2 = (void *)__constrainedBodyTextLabelFont;
  if (!__constrainedBodyTextLabelFont)
  {
    v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:1];
    uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
    v5 = (void *)__constrainedBodyTextLabelFont;
    __constrainedBodyTextLabelFont = v4;

    id v2 = (void *)__constrainedBodyTextLabelFont;
  }

  return v2;
}

+ (id)constrainedCaption1TextLabelFont
{
  id v2 = (void *)__constrainedCaption1TextLabelFont;
  if (!__constrainedCaption1TextLabelFont)
  {
    v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8] addingSymbolicTraits:0 options:1];
    uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
    v5 = (void *)__constrainedCaption1TextLabelFont;
    __constrainedCaption1TextLabelFont = v4;

    id v2 = (void *)__constrainedCaption1TextLabelFont;
  }

  return v2;
}

+ (id)constrainedBodyBoldTextLabelFont
{
  id v2 = (void *)__constrainedBodyBoldTextLabelFont;
  if (!__constrainedBodyBoldTextLabelFont)
  {
    v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2 options:1];
    uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
    v5 = (void *)__constrainedBodyBoldTextLabelFont;
    __constrainedBodyBoldTextLabelFont = v4;

    id v2 = (void *)__constrainedBodyBoldTextLabelFont;
  }

  return v2;
}

+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 traitCollection:(id)a5
{
  return (id)[a1 constrainedFontForTextStyle:a3 minimumContentSizeCategory:*MEMORY[0x1E4FB27F0] maximumContentSizeCategory:a4 traitCollection:a5];
}

+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 traitCollection:(id)a5
{
  return (id)[a1 constrainedFontForTextStyle:a3 minimumContentSizeCategory:a4 maximumContentSizeCategory:*MEMORY[0x1E4FB27F0] traitCollection:a5];
}

+ (id)constrainedFontForTextStyle:(id)a3 minimumContentSizeCategory:(id)a4 maximumContentSizeCategory:(id)a5 traitCollection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v12)
  {
    v14 = [v12 preferredContentSizeCategory];
  }
  else
  {
    v15 = +[EKUIApplicationExtensionOverrides shared];
    v14 = [v15 preferredContentSizeCategoryOrOverride];
  }
  id v16 = (id)*MEMORY[0x1E4FB27F0];
  if ((id)*MEMORY[0x1E4FB27F0] != v10
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v14, (UIContentSizeCategory)v10) == NSOrderedAscending)
  {
    id v17 = v10;

    v14 = v17;
  }
  if (v16 != v11
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v14, (UIContentSizeCategory)v11) == NSOrderedDescending)
  {
    id v18 = v11;

    v14 = v18;
  }
  v19 = (void *)MEMORY[0x1E4FB08E0];
  v20 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v14];
  v21 = [v19 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v20];

  return v21;
}

+ (id)constrainedFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 addingSymbolicTraits:(unsigned int)a5 traitCollection:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v13 = [v11 preferredContentSizeCategory];
  }
  else
  {
    v14 = +[EKUIApplicationExtensionOverrides shared];
    v13 = [v14 preferredContentSizeCategoryOrOverride];
  }
  if ((id)*MEMORY[0x1E4FB27F0] != v10
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v13, (UIContentSizeCategory)v10) == NSOrderedDescending)
  {
    id v15 = v10;

    v13 = v15;
  }
  id v16 = (void *)MEMORY[0x1E4FB08E8];
  id v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v13];
  id v18 = [v16 preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v17];

  v19 = [v18 fontDescriptorWithSymbolicTraits:v7];
  if (v19) {
    v20 = v19;
  }
  else {
    v20 = v18;
  }
  v21 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v20 size:0.0];

  return v21;
}

+ (int64_t)tableViewCellCappedSymbolImageScaleWithScale:(int64_t)a3 traitCollection:(id)a4
{
  id v5 = a4;
  v6 = [v5 preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]);

  if (v7 == NSOrderedAscending)
  {
    id v9 = [v5 preferredContentSizeCategory];
    NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E4FB2798]);

    int64_t v8 = 2;
    if (v10 == NSOrderedAscending) {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 1;
  }
  if (v8 >= a3) {
    int64_t v11 = a3;
  }
  else {
    int64_t v11 = v8;
  }
  if ((unint64_t)(a3 + 1) >= 2) {
    int64_t v12 = v11;
  }
  else {
    int64_t v12 = v8;
  }

  return v12;
}

@end