@interface SFNavigationBarMetrics
+ (id)traitsAffectingBarMetrics;
- (NSString)_contentSizeCategoryForFontsWithPreferredCategory:(NSString *)a1;
- (SFNavigationBarMetrics)init;
- (double)barHeightWithBarMetricsCategory:(uint64_t)a1;
- (double)distanceFromLabelBaselineToURLOutlineBottom;
- (double)minimumBarHeight;
- (double)narrowEditingScaleFactor;
- (double)squishHeightQuantizationOffsetWithBarMetricsCategory:(uint64_t)a1;
- (double)urlContainerTop;
- (double)urlLabelVerticalOffset;
- (double)urlOutlineCornerRadius;
- (double)urlOutlineHeight;
- (uint64_t)_updateForContentSizeCategory:(uint64_t)a3 legibilityWeight:;
- (uint64_t)traitCollectionForButtonMetrics;
- (uint64_t)updateForStatusBarHeight:(uint64_t)result;
- (uint64_t)updateForTraitCollection:(uint64_t)a1;
- (void)_updateMetrics;
- (void)accessoryImageSymbolConfiguration;
- (void)defaultBoldFont;
- (void)defaultLabelFont;
- (void)mediumButtonImageSymbolConfiguration;
- (void)narrowEditingLabelFont;
- (void)squishedAccessoryImageSymbolConfiguration;
@end

@implementation SFNavigationBarMetrics

+ (id)traitsAffectingBarMetrics
{
  v2[3] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];

  return v0;
}

- (NSString)_contentSizeCategoryForFontsWithPreferredCategory:(NSString *)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    UIContentSizeCategory v5 = (UIContentSizeCategory)*MEMORY[0x1E4FB27D0];
    if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) != NSOrderedAscending
      && UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB27F0]))
    {
      v6 = (UIContentSizeCategory *)(UIContentSizeCategoryIsAccessibilityCategory(v4)
                                   ? MEMORY[0x1E4FB2790]
                                   : MEMORY[0x1E4FB27B0]);
      UIContentSizeCategory v5 = *v6;
      if (UIContentSizeCategoryCompareToCategory(*v6, v4) != NSOrderedAscending) {
        UIContentSizeCategory v5 = v4;
      }
    }
    a1 = v5;
  }

  return a1;
}

- (SFNavigationBarMetrics)init
{
  v10.receiver = self;
  v10.super_class = (Class)SFNavigationBarMetrics;
  v2 = [(SFNavigationBarMetrics *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    uint64_t v4 = [v3 legibilityWeight];

    uint64_t v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = (void *)*MEMORY[0x1E4FB27D0];
    }
    -[SFNavigationBarMetrics _updateForContentSizeCategory:legibilityWeight:]((uint64_t)v2, v7, v4);

    -[SFNavigationBarMetrics _updateMetrics]((uint64_t)v2);
    v8 = v2;
  }

  return v2;
}

- (uint64_t)_updateForContentSizeCategory:(uint64_t)a3 legibilityWeight:
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    -[SFNavigationBarMetrics _contentSizeCategoryForFontsWithPreferredCategory:]((NSString *)a1, v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 16);
    if (v7)
    {
      v8 = [v7 preferredContentSizeCategory];
      BOOL v9 = UIContentSizeCategoryCompareToCategory(v8, v6) != NSOrderedSame;
    }
    else
    {
      BOOL v9 = 1;
    }
    _SFToolbarContentSizeCategoryForPreferredCategory();
    objc_super v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 208);
    if (v11)
    {
      v12 = [v11 preferredContentSizeCategory];
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v12, v10))
      {
      }
      else
      {
        uint64_t v13 = [*(id *)(a1 + 208) legibilityWeight];

        int v14 = v13 != a3 || v9;
        if (v14 != 1)
        {
          a1 = 0;
          goto LABEL_13;
        }
      }
    }
    uint64_t v15 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v6];
    v16 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v15;

    v17 = (void *)MEMORY[0x1E4FB1E20];
    v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v10];
    v24[0] = v18;
    v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:a3];
    v24[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v21 = [v17 traitCollectionWithTraitsFromCollections:v20];
    v22 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = v21;

    a1 = 1;
LABEL_13:
  }
  return a1;
}

- (void)_updateMetrics
{
  if (a1)
  {
    double v2 = *(double *)(a1 + 104);
    double v3 = *MEMORY[0x1E4F78760];
    v30 = [*(id *)(a1 + 16) preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v30);
    double v5 = 1.0;
    if (IsAccessibilityCategory) {
      _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection();
    }
    *(double *)(a1 + 136) = v5;
    v6 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:50.0];
    *(double *)(a1 + 72) = ceil(v7);
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:44.0];
    double v9 = ceil(v8);
    if (v9 < 56.0 && *(unsigned char *)(a1 + 8) != 0) {
      double v9 = 56.0;
    }
    *(double *)(a1 + 80) = v9;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:10.0];
    *(void *)(a1 + 144) = v11;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:19.0];
    *(double *)(a1 + 24) = ceil(v12);
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:7.0];
    *(void *)(a1 + 160) = v13;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:36.0];
    *(void *)(a1 + 168) = v14;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:12.0];
    *(void *)(a1 + 200) = v15;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:-4.0];
    *(void *)(a1 + 176) = v16;
    _SFOnePixel();
    objc_msgSend(v6, "scaledValueForValue:compatibleWithTraitCollection:", *(void *)(a1 + 16));
    *(void *)(a1 + 184) = v17;
    _SFOnePixel();
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:-v18];
    *(void *)(a1 + 192) = v19;
    double v20 = 13.5;
    if (v2 > v3)
    {
      double v21 = 10.5;
    }
    else
    {
      double v20 = 10.0;
      double v21 = 7.5;
    }
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:v20];
    *(void *)(a1 + 88) = v22;
    [v6 scaledValueForValue:*(void *)(a1 + 16) compatibleWithTraitCollection:v21];
    *(void *)(a1 + 96) = v23;
    v24 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    v25 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    v26 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    *(unsigned char *)(a1 + 56) = 1;
    v27 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    v28 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    v29 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;
  }
}

- (uint64_t)updateForTraitCollection:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    double v5 = [v3 preferredContentSizeCategory];
    int v6 = -[SFNavigationBarMetrics _updateForContentSizeCategory:legibilityWeight:](a1, v5, [v4 legibilityWeight]);

    int v7 = objc_opt_respondsToSelector();
    if (v7 & 1) == 0 || (v6)
    {
      if ((v7 | v6)) {
        goto LABEL_7;
      }
    }
    else
    {
      int v8 = [v4 _presentationSemanticContext] == 2;
      if (*(unsigned __int8 *)(a1 + 8) != v8)
      {
        *(unsigned char *)(a1 + 8) = v8;
LABEL_7:
        -[SFNavigationBarMetrics _updateMetrics](a1);
        a1 = 1;
        goto LABEL_9;
      }
    }
    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (uint64_t)updateForStatusBarHeight:(uint64_t)result
{
  if (result)
  {
    if (*(double *)(result + 104) == a2)
    {
      return 0;
    }
    else
    {
      *(double *)(result + 104) = a2;
      -[SFNavigationBarMetrics _updateMetrics](result);
      return 1;
    }
  }
  return result;
}

- (double)barHeightWithBarMetricsCategory:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = 72;
  if (a2 == 1) {
    uint64_t v2 = 80;
  }
  return *(double *)(a1 + v2);
}

- (double)squishHeightQuantizationOffsetWithBarMetricsCategory:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = 88;
  if (a2 == 1) {
    uint64_t v2 = 96;
  }
  return *(double *)(a1 + v2);
}

- (void)defaultLabelFont
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[4];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
      double v5 = (void *)MEMORY[0x1E4FB1798];
      [MEMORY[0x1E4FB1798] labelFontSize];
      int v6 = objc_msgSend(v5, "systemFontOfSize:");
      uint64_t v7 = [v4 scaledFontForFont:v6 compatibleWithTraitCollection:v2[2]];
      int v8 = (void *)v2[4];
      void v2[4] = v7;

      id v3 = (void *)v2[4];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)defaultBoldFont
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[5];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
      double v5 = (void *)MEMORY[0x1E4FB1798];
      [MEMORY[0x1E4FB1798] labelFontSize];
      int v6 = objc_msgSend(v5, "boldSystemFontOfSize:");
      uint64_t v7 = [v4 scaledFontForFont:v6 compatibleWithTraitCollection:v2[2]];
      int v8 = (void *)v2[5];
      v2[5] = v7;

      id v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)narrowEditingLabelFont
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[6];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
      double v5 = [MEMORY[0x1E4FB1798] systemFontOfSize:15.0];
      uint64_t v6 = [v4 scaledFontForFont:v5 compatibleWithTraitCollection:v2[2]];
      uint64_t v7 = (void *)v2[6];
      v2[6] = v6;

      id v3 = (void *)v2[6];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)narrowEditingScaleFactor
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    *(unsigned char *)(a1 + 56) = 0;
    id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v2 setText:@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"];
    id v3 = -[SFNavigationBarMetrics defaultLabelFont]((void *)a1);
    [v2 setFont:v3];

    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
    double v7 = v6;
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v8 setText:@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"];
    double v9 = -[SFNavigationBarMetrics narrowEditingLabelFont]((void *)a1);
    [v8 setFont:v9];

    objc_msgSend(v8, "sizeThatFits:", v4, v5);
    *(double *)(a1 + 64) = v10 / v7;
  }
  return *(double *)(a1 + 64);
}

- (void)accessoryImageSymbolConfiguration
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[14];
    if (!v3)
    {
      double v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
      [MEMORY[0x1E4FB1798] labelFontSize];
      objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v2[2]);
      double v6 = v5;

      uint64_t v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:1 scale:v6];
      id v8 = (void *)v2[14];
      v2[14] = v7;

      id v3 = (void *)v2[14];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)squishedAccessoryImageSymbolConfiguration
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[15];
    if (!v3)
    {
      double v4 = [MEMORY[0x1E4FB17A8] defaultMetrics];
      [v4 scaledValueForValue:v2[2] compatibleWithTraitCollection:12.0];
      double v6 = v5;

      uint64_t v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:v6];
      id v8 = (void *)v2[15];
      v2[15] = v7;

      id v3 = (void *)v2[15];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)mediumButtonImageSymbolConfiguration
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (void *)a1[16];
    if (!v3)
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1830], "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28C8], 2, a1[26]);
      double v5 = (void *)v2[16];
      v2[16] = v4;

      id v3 = (void *)v2[16];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)urlOutlineCornerRadius
{
  if (a1) {
    return *(double *)(a1 + 144);
  }
  else {
    return 0.0;
  }
}

- (double)minimumBarHeight
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (double)urlContainerTop
{
  if (a1) {
    return *(double *)(a1 + 160);
  }
  else {
    return 0.0;
  }
}

- (double)urlOutlineHeight
{
  if (a1) {
    return *(double *)(a1 + 168);
  }
  else {
    return 0.0;
  }
}

- (double)urlLabelVerticalOffset
{
  if (a1) {
    return *(double *)(a1 + 176);
  }
  else {
    return 0.0;
  }
}

- (double)distanceFromLabelBaselineToURLOutlineBottom
{
  if (a1) {
    return *(double *)(a1 + 200);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)traitCollectionForButtonMetrics
{
  if (result) {
    return *(void *)(result + 208);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollectionForButtonMetrics, 0);
  objc_storeStrong((id *)&self->_mediumButtonImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_squishedAccessoryImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_accessoryImageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_narrowEditingLabelFont, 0);
  objc_storeStrong((id *)&self->_defaultBoldFont, 0);
  objc_storeStrong((id *)&self->_defaultLabelFont, 0);

  objc_storeStrong((id *)&self->_traitCollectionForFontMetrics, 0);
}

@end