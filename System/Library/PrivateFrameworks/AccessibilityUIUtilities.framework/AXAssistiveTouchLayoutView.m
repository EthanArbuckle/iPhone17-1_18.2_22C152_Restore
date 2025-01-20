@interface AXAssistiveTouchLayoutView
+ (NSString)imageMaximumContentSizeCategory;
+ (NSString)imageMinimumContentSizeCategory;
+ (NSString)labelMaximumContentSizeCategory;
+ (NSString)labelMinimumContentSizeCategory;
+ (UIFont)labelFont;
+ (UIFontMetrics)fontMetrics;
+ (UITraitCollection)traitCollectionForImagePreferredContentSizeCategory;
+ (UITraitCollection)traitCollectionForLabelPreferredContentSizeCategory;
+ (double)_layoutViewSideLengthScaledFromDefaultLength:(double)a3 labelContentSizeCategory:(id)a4;
+ (double)defaultSideLength;
+ (double)layoutViewSideLengthScaledFromDefaultLength:(double)a3;
+ (double)minimumOuterPadding;
+ (id)_imageMaximumContentSizeCategoryIndependentOfLabel;
+ (id)_preferredContentSizeCategoryCappedByMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4;
+ (id)_traitCollectionForMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4;
+ (void)labelMaximumContentSizeCategory;
- (NSArray)itemConstraints;
- (NSMutableArray)positioningLayoutGuides;
- (id)_setUpConstraintsForPreferredPositionsForItems:(id)a3 positions:(id)a4;
- (id)_setUpConstraintsToAlignItems:(id)a3 rows:(id)a4 columns:(id)a5;
- (id)_setUpConstraintsToAvoidCollisions:(id)a3 rows:(id)a4 columns:(id)a5 clockwiseOctagonalLocations:(id)a6;
- (void)_enableAutoLayoutForAllItems:(id)a3;
- (void)_enumerateListsOfLocations:(id)a3 items:(id)a4 withBlock:(id)a5;
- (void)centerItems:(id)a3;
- (void)centerItems:(id)a3 withView:(id)a4;
- (void)layoutItemsByLocation:(id)a3 hasBackButton:(BOOL)a4;
- (void)layoutItemsByLocation:(id)a3 positions:(id)a4 rows:(id)a5 columns:(id)a6 clockwiseOctagonalLocations:(id)a7 horizontallyCenteredLocation:(id)a8;
- (void)setItemConstraints:(id)a3;
- (void)setPositioningLayoutGuides:(id)a3;
@end

@implementation AXAssistiveTouchLayoutView

+ (double)defaultSideLength
{
  int IsPad = AXDeviceIsPad();
  double result = 295.0;
  if (IsPad) {
    return 390.0;
  }
  return result;
}

+ (double)minimumOuterPadding
{
  return 10.0;
}

+ (double)layoutViewSideLengthScaledFromDefaultLength:(double)a3
{
  v5 = [a1 labelMinimumContentSizeCategory];
  v6 = [a1 labelMaximumContentSizeCategory];
  v7 = [a1 _preferredContentSizeCategoryCappedByMinimumContentSizeCategory:v5 maximumContentSizeCategory:v6];
  [a1 _layoutViewSideLengthScaledFromDefaultLength:v7 labelContentSizeCategory:a3];
  double v9 = v8;

  return v9;
}

+ (double)_layoutViewSideLengthScaledFromDefaultLength:(double)a3 labelContentSizeCategory:(id)a4
{
  v6 = (NSString *)a4;
  v7 = [a1 fontMetrics];
  double v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v6];
  [v7 scaledValueForValue:v8 compatibleWithTraitCollection:a3];
  double v10 = v9;

  v11 = [a1 _imageMaximumContentSizeCategoryIndependentOfLabel];
  NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v6, v11);

  if (v12 == NSOrderedDescending)
  {
    v13 = [a1 fontMetrics];
    v14 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v11];
    [v13 scaledValueForValue:v14 compatibleWithTraitCollection:a3];
    double v16 = v15;

    double v10 = v16 + (v10 - v16) / 3.0;
  }

  return v10;
}

+ (UIFontMetrics)fontMetrics
{
  return (UIFontMetrics *)[MEMORY[0x1E4FB17A8] defaultMetrics];
}

+ (NSString)labelMinimumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E4FB27D0];
}

+ (NSString)labelMaximumContentSizeCategory
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4FB27F0];
  AXDeviceGetMainScreenBounds();
  double Width = CGRectGetWidth(v33);
  if (Width > 0.0)
  {
    double v5 = Width;
    [a1 minimumOuterPadding];
    v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
    if (!labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory)
    {
      double v8 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      double v9 = (void *)*MEMORY[0x1E4FB27D0];
      uint64_t v10 = *MEMORY[0x1E4FB27C0];
      v29[0] = *MEMORY[0x1E4FB27D0];
      v29[1] = v10;
      uint64_t v11 = *MEMORY[0x1E4FB27B0];
      v29[2] = *MEMORY[0x1E4FB27B8];
      v29[3] = v11;
      uint64_t v12 = *MEMORY[0x1E4FB2790];
      v29[4] = *MEMORY[0x1E4FB2798];
      v29[5] = v12;
      uint64_t v13 = *MEMORY[0x1E4FB2780];
      v29[6] = *MEMORY[0x1E4FB2788];
      v29[7] = v13;
      v29[8] = *MEMORY[0x1E4FB2778];
      v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 9, 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        double v17 = v5 + v8 * -2.0;
        uint64_t v18 = *(void *)v26;
LABEL_5:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
          [a1 defaultSideLength];
          objc_msgSend(a1, "_layoutViewSideLengthScaledFromDefaultLength:labelContentSizeCategory:", v20);
          if (v21 > v17) {
            break;
          }
          objc_storeStrong((id *)&labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory, v20);
          if (v16 == ++v19)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
            if (v16) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
      if (!labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory)
      {
        v22 = ASTLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[AXAssistiveTouchLayoutView labelMaximumContentSizeCategory];
        }

        objc_storeStrong((id *)&labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory, v9);
        v7 = (void *)labelMaximumContentSizeCategory_cachedMaximumContentSizeCategory;
      }
    }
    id v23 = v7;

    id v3 = v23;
  }
  return (NSString *)v3;
}

+ (NSString)imageMinimumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E4FB27D0];
}

+ (NSString)imageMaximumContentSizeCategory
{
  id v3 = [a1 labelMaximumContentSizeCategory];
  v4 = [a1 _imageMaximumContentSizeCategoryIndependentOfLabel];
  double v5 = AXUIContentSizeCategoryMin(v3, v4);

  return (NSString *)v5;
}

+ (id)_imageMaximumContentSizeCategoryIndependentOfLabel
{
  return (id)*MEMORY[0x1E4FB27B0];
}

+ (id)_preferredContentSizeCategoryCappedByMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4FB1438];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 sharedApplication];
  double v9 = [v8 preferredContentSizeCategory];

  uint64_t v10 = AXUIContentSizeCategoryMax(v9, v7);

  uint64_t v11 = AXUIContentSizeCategoryMin(v10, v6);

  return v11;
}

+ (id)_traitCollectionForMinimumContentSizeCategory:(id)a3 maximumContentSizeCategory:(id)a4
{
  v4 = (void *)MEMORY[0x1E4FB1E20];
  double v5 = [a1 _preferredContentSizeCategoryCappedByMinimumContentSizeCategory:a3 maximumContentSizeCategory:a4];
  id v6 = [v4 traitCollectionWithPreferredContentSizeCategory:v5];

  return v6;
}

+ (UITraitCollection)traitCollectionForLabelPreferredContentSizeCategory
{
  id v3 = [a1 labelMinimumContentSizeCategory];
  v4 = [a1 labelMaximumContentSizeCategory];
  double v5 = [a1 _traitCollectionForMinimumContentSizeCategory:v3 maximumContentSizeCategory:v4];

  return (UITraitCollection *)v5;
}

+ (UITraitCollection)traitCollectionForImagePreferredContentSizeCategory
{
  id v3 = [a1 imageMinimumContentSizeCategory];
  v4 = [a1 imageMaximumContentSizeCategory];
  double v5 = [a1 _traitCollectionForMinimumContentSizeCategory:v3 maximumContentSizeCategory:v4];

  return (UITraitCollection *)v5;
}

+ (UIFont)labelFont
{
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = (void *)MEMORY[0x1E4FB1798];
  int IsPad = AXDeviceIsPad();
  double v6 = 14.0;
  if (IsPad) {
    double v6 = 16.0;
  }
  if (IsBoldTextEnabled) {
    [v4 systemFontOfSize:v6];
  }
  else {
  id v7 = [v4 _lightSystemFontOfSize:v6];
  }
  double v8 = [a1 fontMetrics];
  double v9 = [a1 traitCollectionForLabelPreferredContentSizeCategory];
  uint64_t v10 = [v8 scaledFontForFont:v7 compatibleWithTraitCollection:v9];

  return (UIFont *)v10;
}

- (void)layoutItemsByLocation:(id)a3 hasBackButton:(BOOL)a4
{
  BOOL v45 = a4;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  [v55 count];
  uint64_t v4 = AXAssistiveTouchNamedLayout();
  double v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  double v6 = AXAssistiveTouchLocationsForLayout();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1E4F29238];
        AXAssitiveTouchPosition();
        uint64_t v13 = objc_msgSend(v12, "valueWithCGPoint:");
        [v5 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v59 objects:v76 count:16];
    }
    while (v8);
  }

  v58 = (void *)*MEMORY[0x1E4F49090];
  uint64_t v15 = *MEMORY[0x1E4F49090];
  v74[0] = *MEMORY[0x1E4F49088];
  v14 = (void *)v74[0];
  v74[1] = v15;
  v75 = (void *)*MEMORY[0x1E4F49098];
  uint64_t v16 = v75;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  v56 = v16;
  v57 = v14;
  if ((unint64_t)(v4 - 5) <= 1)
  {
    v73[0] = v14;
    v73[1] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];

    double v17 = (void *)v18;
  }
  v20 = (void *)*MEMORY[0x1E4F49080];
  v72[0] = *MEMORY[0x1E4F49070];
  uint64_t v19 = (void *)v72[0];
  v72[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  id v23 = (void *)*MEMORY[0x1E4F49060];
  v70[0] = *MEMORY[0x1E4F49058];
  uint64_t v22 = v70[0];
  v70[1] = v23;
  uint64_t v71 = *MEMORY[0x1E4F49068];
  uint64_t v24 = v71;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
  v52 = (void *)v21;
  v53 = v17;
  v69[0] = v17;
  v69[1] = v21;
  v49 = (void *)v25;
  v69[2] = v25;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  v68[0] = v57;
  v68[1] = v19;
  v68[2] = v22;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  long long v27 = v58;
  v67[0] = v58;
  v67[1] = v23;
  v46 = v23;
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  v66[0] = v56;
  v66[1] = v20;
  v29 = v20;
  v66[2] = v24;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  v50 = (void *)v26;
  v65[0] = v26;
  v65[1] = v28;
  v48 = (void *)v30;
  v65[2] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
  v32 = (void *)v31;
  if ((unint64_t)(v4 - 3) > 1)
  {
    v37 = v19;
    if ((unint64_t)(v4 - 5) > 1)
    {
      v40 = 0;
      v41 = v53;
      long long v27 = v58;
      v36 = v46;
      goto LABEL_16;
    }
    v47 = (void *)v31;
    CGRect v33 = v28;
    v38 = v57;
    long long v27 = v58;
    v63 = v58;
    v34 = &v63;
    v39 = v53;
    v36 = v46;
    v35 = v56;
  }
  else
  {
    v47 = (void *)v31;
    CGRect v33 = v28;
    v64 = v58;
    v34 = &v64;
    v35 = v20;
    v37 = v19;
    v36 = v46;
    v38 = v19;
    v39 = v53;
  }
  v34[1] = v27;
  v34[2] = v35;
  v34[3] = v29;
  v34[4] = v36;
  v34[5] = v36;
  v34[6] = v37;
  v34[7] = v38;
  v40 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v41 = v39;
  long long v28 = v33;
  v32 = v47;
LABEL_16:
  id v42 = 0;
  switch(v4)
  {
    case 1:
      v43 = (void *)*MEMORY[0x1E4F49078];
      if (v45) {
        v43 = v36;
      }
      id v42 = v43;
      goto LABEL_25;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      id v42 = v27;
      goto LABEL_18;
    case 7:
      id v42 = v36;
      goto LABEL_24;
    default:
LABEL_18:
      if (v4 != 7) {
        goto LABEL_25;
      }
LABEL_24:
      id v44 = v36;

      id v42 = v44;
LABEL_25:
      [(AXAssistiveTouchLayoutView *)self layoutItemsByLocation:v55 positions:v5 rows:v51 columns:v32 clockwiseOctagonalLocations:v40 horizontallyCenteredLocation:v42];

      return;
  }
}

- (void)layoutItemsByLocation:(id)a3 positions:(id)a4 rows:(id)a5 columns:(id)a6 clockwiseOctagonalLocations:(id)a7 horizontallyCenteredLocation:(id)a8
{
  id v32 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = [v32 allValues];
  [(AXAssistiveTouchLayoutView *)self _enableAutoLayoutForAllItems:v19];

  v20 = [(AXAssistiveTouchLayoutView *)self itemConstraints];

  if (v20)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v22 = [(AXAssistiveTouchLayoutView *)self itemConstraints];
    [v21 deactivateConstraints:v22];

    [(AXAssistiveTouchLayoutView *)self setItemConstraints:0];
  }
  id v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v24 = [(AXAssistiveTouchLayoutView *)self _setUpConstraintsForPreferredPositionsForItems:v32 positions:v18];

  [v23 addObjectsFromArray:v24];
  uint64_t v25 = [(AXAssistiveTouchLayoutView *)self _setUpConstraintsToAlignItems:v32 rows:v17 columns:v16];
  [v23 addObjectsFromArray:v25];

  uint64_t v26 = [(AXAssistiveTouchLayoutView *)self _setUpConstraintsToAvoidCollisions:v32 rows:v17 columns:v16 clockwiseOctagonalLocations:v15];

  [v23 addObjectsFromArray:v26];
  if (v14)
  {
    long long v27 = [v32 objectForKeyedSubscript:v14];
    long long v28 = v27;
    if (v27)
    {
      v29 = [v27 centerXAnchor];
      uint64_t v30 = [(AXAssistiveTouchLayoutView *)self centerXAnchor];
      uint64_t v31 = [v29 constraintEqualToAnchor:v30];
      [v23 addObject:v31];
    }
    else
    {
      _AXAssert();
    }
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v23];
  [(AXAssistiveTouchLayoutView *)self setItemConstraints:v23];
}

- (id)_setUpConstraintsForPreferredPositionsForItems:(id)a3 positions:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v44 = a4;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v7 = [(AXAssistiveTouchLayoutView *)self positioningLayoutGuides];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AXAssistiveTouchLayoutView *)self removeLayoutGuide:*(void *)(*((void *)&v61 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  [(AXAssistiveTouchLayoutView *)self setPositioningLayoutGuides:v12];

  id v43 = [MEMORY[0x1E4F1CA48] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v6;
  uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v45)
  {
    uint64_t v41 = *(void *)v58;
    id v42 = self;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v58 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v13;
        uint64_t v14 = *(void *)(*((void *)&v57 + 1) + 8 * v13);
        id v15 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        [(AXAssistiveTouchLayoutView *)self addLayoutGuide:v15];
        id v16 = [(AXAssistiveTouchLayoutView *)self positioningLayoutGuides];
        [v16 addObject:v15];

        id v17 = [obj objectForKeyedSubscript:v14];
        id v18 = [v44 objectForKeyedSubscript:v14];
        [v18 CGPointValue];
        double v20 = v19;
        double v22 = v21;

        id v23 = [v15 widthAnchor];
        uint64_t v24 = [(AXAssistiveTouchLayoutView *)self widthAnchor];
        uint64_t v25 = [v23 constraintEqualToAnchor:v24 multiplier:v20];

        LODWORD(v26) = 1131937792;
        [v25 setPriority:v26];
        long long v27 = [v15 heightAnchor];
        long long v28 = [(AXAssistiveTouchLayoutView *)self heightAnchor];
        v29 = [v27 constraintEqualToAnchor:v28 multiplier:v22];

        v52 = v29;
        LODWORD(v30) = 1131937792;
        [v29 setPriority:v30];
        id v55 = [v15 topAnchor];
        v54 = [(AXAssistiveTouchLayoutView *)self topAnchor];
        v53 = [v55 constraintEqualToAnchor:v54];
        v65[0] = v53;
        [v15 bottomAnchor];
        v50 = v49 = v17;
        uint64_t v31 = v17;
        v51 = [v17 imageView];
        v48 = [v51 centerYAnchor];
        v47 = [v50 constraintEqualToAnchor:v48];
        v65[1] = v47;
        v65[2] = v29;
        id v32 = [v15 leftAnchor];
        CGRect v33 = [(AXAssistiveTouchLayoutView *)self leftAnchor];
        v34 = [v32 constraintEqualToAnchor:v33];
        void v65[3] = v34;
        v35 = [v15 rightAnchor];
        v36 = [v31 imageView];
        v37 = [v36 centerXAnchor];
        v38 = [v35 constraintEqualToAnchor:v37];
        v65[4] = v38;
        v65[5] = v25;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:6];
        [v43 addObjectsFromArray:v39];

        self = v42;
        uint64_t v13 = v56 + 1;
      }
      while (v45 != v56 + 1);
      uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v45);
  }

  return v43;
}

- (void)_enumerateListsOfLocations:(id)a3 items:(id)a4 withBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, uint64_t))a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v7);
        }
        uint64_t v24 = v10;
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (!v13)
        {
          id v15 = 0;
          goto LABEL_22;
        }
        uint64_t v14 = v13;
        id v15 = 0;
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            double v19 = (void *)v18;
            if (v18) {
              BOOL v20 = v15 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
              if (!v18) {
                goto LABEL_18;
              }
            }
            else
            {
              v9[2](v9, v15, v18);
            }
            id v21 = v19;

            id v15 = v21;
LABEL_18:
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v14);
LABEL_22:

        uint64_t v10 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
}

- (id)_setUpConstraintsToAlignItems:(id)a3 rows:(id)a4 columns:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 array];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke;
  v20[3] = &unk_1E649C960;
  id v13 = v12;
  id v21 = v13;
  [(AXAssistiveTouchLayoutView *)self _enumerateListsOfLocations:v10 items:v11 withBlock:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke_2;
  v18[3] = &unk_1E649C960;
  id v14 = v13;
  id v19 = v14;
  [(AXAssistiveTouchLayoutView *)self _enumerateListsOfLocations:v9 items:v11 withBlock:v18];

  id v15 = v19;
  id v16 = v14;

  return v16;
}

void __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v10 = [a3 imageView];
  id v6 = [v10 centerYAnchor];
  id v7 = [v5 imageView];

  id v8 = [v7 centerYAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  [v4 addObject:v9];
}

void __73__AXAssistiveTouchLayoutView__setUpConstraintsToAlignItems_rows_columns___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v10 = [a3 imageView];
  id v6 = [v10 centerXAnchor];
  id v7 = [v5 imageView];

  id v8 = [v7 centerXAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  [v4 addObject:v9];
}

- (id)_setUpConstraintsToAvoidCollisions:(id)a3 rows:(id)a4 columns:(id)a5 clockwiseOctagonalLocations:(id)a6
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v107 = a4;
  id v106 = a5;
  id v109 = a6;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v110 = v10;
  id v12 = [v10 allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v120 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        uint64_t v18 = [v17 leadingAnchor];
        id v19 = [(AXAssistiveTouchLayoutView *)self leadingAnchor];
        BOOL v20 = [v18 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v19 multiplier:1.0];
        [v11 addObject:v20];

        id v21 = [(AXAssistiveTouchLayoutView *)self trailingAnchor];
        uint64_t v22 = [v17 trailingAnchor];
        uint64_t v23 = [v21 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v22 multiplier:1.0];
        [v11 addObject:v23];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v119 objects:v128 count:16];
    }
    while (v14);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v24 = [v110 allValues];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v115 objects:v127 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v116 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v115 + 1) + 8 * j);
        long long v30 = [v29 topAnchor];
        long long v31 = [(AXAssistiveTouchLayoutView *)self topAnchor];
        long long v32 = [v30 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];
        [v11 addObject:v32];

        CGRect v33 = [(AXAssistiveTouchLayoutView *)self bottomAnchor];
        v34 = [v29 bottomAnchor];
        uint64_t v35 = [v33 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v34 multiplier:1.0];
        [v11 addObject:v35];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v115 objects:v127 count:16];
    }
    while (v26);
  }

  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke;
  v113[3] = &unk_1E649C960;
  id v36 = v11;
  id v114 = v36;
  [(AXAssistiveTouchLayoutView *)self _enumerateListsOfLocations:v107 items:v110 withBlock:v113];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke_2;
  v111[3] = &unk_1E649C960;
  id v108 = v36;
  id v112 = v108;
  [(AXAssistiveTouchLayoutView *)self _enumerateListsOfLocations:v106 items:v110 withBlock:v111];
  v37 = v109;
  if (v109)
  {
    if ([v109 count] != 8) {
      _AXAssert();
    }
    v38 = [v109 objectAtIndexedSubscript:0];
    uint64_t v39 = [v110 objectForKeyedSubscript:v38];

    v40 = [v109 objectAtIndexedSubscript:1];
    v105 = [v110 objectForKeyedSubscript:v40];

    uint64_t v41 = [v109 objectAtIndexedSubscript:2];
    v103 = [v110 objectForKeyedSubscript:v41];

    id v42 = [v109 objectAtIndexedSubscript:3];
    v101 = [v110 objectForKeyedSubscript:v42];

    id v43 = [v109 objectAtIndexedSubscript:4];
    v100 = [v110 objectForKeyedSubscript:v43];

    id v44 = [v109 objectAtIndexedSubscript:5];
    v104 = [v110 objectForKeyedSubscript:v44];

    uint64_t v45 = [v109 objectAtIndexedSubscript:6];
    v102 = [v110 objectForKeyedSubscript:v45];

    v46 = [v109 objectAtIndexedSubscript:7];
    v47 = (void *)v39;
    v48 = [v110 objectForKeyedSubscript:v46];

    v98 = v48;
    v99 = v47;
    if (v47 && v48)
    {
      v94 = [v47 label];
      v49 = [v94 leftAnchor];
      v50 = [v48 imageViewContainerView];
      v51 = [v50 rightAnchor];
      v52 = [v49 constraintGreaterThanOrEqualToAnchor:v51];
      v126[0] = v52;
      v53 = [v99 label];
      v54 = [v53 bottomAnchor];
      id v55 = [v48 label];
      uint64_t v56 = [v55 topAnchor];
      long long v57 = [v54 constraintLessThanOrEqualToAnchor:v56];
      v126[1] = v57;
      long long v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
      [v108 addObjectsFromArray:v58];

      v37 = v109;
    }
    if (v105 && v103)
    {
      long long v59 = [v105 label];
      v95 = [v59 rightAnchor];
      long long v60 = [v103 imageViewContainerView];
      long long v61 = [v60 leftAnchor];
      long long v62 = [v95 constraintLessThanOrEqualToAnchor:v61];
      v125[0] = v62;
      long long v63 = [v105 label];
      long long v64 = [v63 bottomAnchor];
      v65 = [v103 label];
      v66 = [v65 topAnchor];
      v67 = [v64 constraintLessThanOrEqualToAnchor:v66];
      v125[1] = v67;
      uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
      [v108 addObjectsFromArray:v68];

      v37 = v109;
    }
    if (v104 && v102)
    {
      v69 = [v102 label];
      v96 = [v69 rightAnchor];
      v70 = [v104 imageViewContainerView];
      uint64_t v71 = [v70 leftAnchor];
      v72 = [v96 constraintLessThanOrEqualToAnchor:v71];
      v124[0] = v72;
      v73 = [v102 label];
      v74 = [v73 bottomAnchor];
      v75 = [v104 label];
      v76 = [v75 topAnchor];
      uint64_t v77 = [v74 constraintLessThanOrEqualToAnchor:v76];
      v124[1] = v77;
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
      [v108 addObjectsFromArray:v78];

      v37 = v109;
    }
    v80 = v100;
    v79 = v101;
    if (v100 && v101)
    {
      v81 = [v101 label];
      v97 = [v81 leftAnchor];
      v82 = [v100 imageViewContainerView];
      v83 = [v82 rightAnchor];
      v84 = [v97 constraintGreaterThanOrEqualToAnchor:v83];
      v123[0] = v84;
      v85 = [v101 label];
      v86 = [v85 bottomAnchor];
      v87 = [v100 label];
      v88 = [v87 topAnchor];
      v89 = [v86 constraintLessThanOrEqualToAnchor:v88];
      v123[1] = v89;
      v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];
      [v108 addObjectsFromArray:v90];

      v80 = v100;
      v79 = v101;

      v37 = v109;
    }
  }
  v91 = v112;
  id v92 = v108;

  return v92;
}

void __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = [a3 leftAnchor];
  id v6 = [v5 rightAnchor];

  id v7 = [v8 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v6 multiplier:1.0];
  [v4 addObject:v7];
}

void __106__AXAssistiveTouchLayoutView__setUpConstraintsToAvoidCollisions_rows_columns_clockwiseOctagonalLocations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v6 topAnchor];
  id v9 = [v7 bottomAnchor];
  id v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9 constant:1.0];
  [v5 addObject:v10];

  id v11 = [v6 topAnchor];

  id v12 = [v7 label];

  uint64_t v13 = [v12 lastBaselineAnchor];
  id v15 = [v11 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v13 multiplier:1.0];

  LODWORD(v14) = 1131937792;
  [v15 setPriority:v14];
  [*(id *)(a1 + 32) addObject:v15];
}

- (void)centerItems:(id)a3
{
}

- (void)centerItems:(id)a3 withView:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(AXAssistiveTouchLayoutView *)self _enableAutoLayoutForAllItems:v6];
  id v8 = [(AXAssistiveTouchLayoutView *)self itemConstraints];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28DC8];
    id v10 = [(AXAssistiveTouchLayoutView *)self itemConstraints];
    [v9 deactivateConstraints:v10];

    [(AXAssistiveTouchLayoutView *)self setItemConstraints:0];
  }
  uint64_t v27 = self;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v18 = [v17 window];

        if (v18)
        {
          id v19 = [v17 centerXAnchor];
          BOOL v20 = [v7 centerXAnchor];
          id v21 = [v19 constraintEqualToAnchor:v20];
          [v11 addObject:v21];

          uint64_t v22 = [v17 centerYAnchor];
          uint64_t v23 = [v7 centerYAnchor];
          uint64_t v24 = [v22 constraintEqualToAnchor:v23];
          [v11 addObject:v24];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  [(AXAssistiveTouchLayoutView *)v27 setItemConstraints:v11];
  uint64_t v25 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v26 = [(AXAssistiveTouchLayoutView *)v27 itemConstraints];
  [v25 activateConstraints:v26];
}

- (void)_enableAutoLayoutForAllItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v9 = [v8 imageView];
        LODWORD(v10) = 1148846080;
        [v9 setContentCompressionResistancePriority:0 forAxis:v10];

        id v11 = [v8 imageView];
        LODWORD(v12) = 1148846080;
        [v11 setContentCompressionResistancePriority:1 forAxis:v12];

        uint64_t v13 = [v8 label];
        LODWORD(v14) = 1148846080;
        [v13 setContentCompressionResistancePriority:1 forAxis:v14];

        uint64_t v15 = [v8 imageView];
        LODWORD(v16) = 1148846080;
        [v15 setContentHuggingPriority:0 forAxis:v16];

        id v17 = [v8 imageView];
        LODWORD(v18) = 1148846080;
        [v17 setContentHuggingPriority:1 forAxis:v18];

        id v19 = [v8 label];
        LODWORD(v20) = 1148846080;
        [v19 setContentHuggingPriority:0 forAxis:v20];

        id v21 = [v8 label];
        LODWORD(v22) = 1148846080;
        [v21 setContentHuggingPriority:1 forAxis:v22];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

- (NSArray)itemConstraints
{
  return self->_itemConstraints;
}

- (void)setItemConstraints:(id)a3
{
}

- (NSMutableArray)positioningLayoutGuides
{
  return self->_positioningLayoutGuides;
}

- (void)setPositioningLayoutGuides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positioningLayoutGuides, 0);
  objc_storeStrong((id *)&self->_itemConstraints, 0);
}

+ (void)labelMaximumContentSizeCategory
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_1C39D1000, log, OS_LOG_TYPE_ERROR, "Unable to find any content size category >= Large that would fit the AssistiveTouch menu. Device width: %f", (uint8_t *)&v2, 0xCu);
}

@end