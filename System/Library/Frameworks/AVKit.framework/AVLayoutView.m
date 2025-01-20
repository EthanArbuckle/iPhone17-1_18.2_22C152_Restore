@interface AVLayoutView
+ (Class)layerClass;
- (AVCABackdropLayerView)backdropLayerView;
- (AVCustomStackLayout)currentStackLayout;
- (AVLayoutItemAttributes)layoutAttributes;
- (AVLayoutView)init;
- (AVLayoutView)initWithFrame:(CGRect)a3;
- (AVLayoutViewItem)targetViewForSecondaryMaterialOverlayView;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)hasVisibleArrangedSubview;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isLayoutDirty;
- (BOOL)isRemoved;
- (BOOL)prefersLowQualityEffects;
- (BOOL)stackLayoutNeedsUpdate;
- (CGSize)extrinsicContentSize;
- (NSArray)arrangedSubviews;
- (NSMutableArray)flattenedArrangedSubviewsInLayoutOrder;
- (NSString)debugDescription;
- (NSString)debugIdentifier;
- (UIVisualEffectView)secondaryMaterialOverlayView;
- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3;
- (id)_includedItemsFromSubviews:(id)a3 inStackLayout:(id)a4 thatFitSize:(CGSize)a5;
- (id)backgroundColor;
- (id)prioritizedSizeThatFitsSize:(CGSize)a3;
- (unint64_t)shapeStyle;
- (void)_applyShapeStyle;
- (void)_insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)_removeArrangedSubview:(id)a3;
- (void)_updateStackLayoutIfNeeded;
- (void)layoutSubviews;
- (void)reevaluateHiddenStateOfAllItems;
- (void)setArrangedSubviews:(id)a3;
- (void)setBackdropLayerView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setContentLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setCurrentStackLayout:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setFlattenedArrangedSubviewsInLayoutOrder:(id)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setLayoutDirty:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setPrefersLowQualityEffects:(BOOL)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4;
- (void)setSecondaryMaterialOverlayView:(id)a3;
- (void)setShapeStyle:(unint64_t)a3;
- (void)setStackLayoutNeedsUpdate:(BOOL)a3;
- (void)setTargetViewForSecondaryMaterialOverlayView:(id)a3;
@end

@implementation AVLayoutView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetViewForSecondaryMaterialOverlayView, 0);
  objc_storeStrong((id *)&self->_secondaryMaterialOverlayView, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);
  objc_storeStrong((id *)&self->_currentStackLayout, 0);
  objc_storeStrong((id *)&self->_flattenedArrangedSubviewsInLayoutOrder, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);

  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (void)setTargetViewForSecondaryMaterialOverlayView:(id)a3
{
}

- (AVLayoutViewItem)targetViewForSecondaryMaterialOverlayView
{
  return self->_targetViewForSecondaryMaterialOverlayView;
}

- (void)setStackLayoutNeedsUpdate:(BOOL)a3
{
  self->_stackLayoutNeedsUpdate = a3;
}

- (BOOL)stackLayoutNeedsUpdate
{
  return self->_stackLayoutNeedsUpdate;
}

- (void)setSecondaryMaterialOverlayView:(id)a3
{
}

- (UIVisualEffectView)secondaryMaterialOverlayView
{
  return self->_secondaryMaterialOverlayView;
}

- (void)setBackdropLayerView:(id)a3
{
}

- (AVCABackdropLayerView)backdropLayerView
{
  return self->_backdropLayerView;
}

- (void)setLayoutDirty:(BOOL)a3
{
  self->_layoutDirty = a3;
}

- (BOOL)isLayoutDirty
{
  return self->_layoutDirty;
}

- (void)setCurrentStackLayout:(id)a3
{
}

- (AVCustomStackLayout)currentStackLayout
{
  return self->_currentStackLayout;
}

- (void)setFlattenedArrangedSubviewsInLayoutOrder:(id)a3
{
}

- (NSMutableArray)flattenedArrangedSubviewsInLayoutOrder
{
  return self->_flattenedArrangedSubviewsInLayoutOrder;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (BOOL)prefersLowQualityEffects
{
  return self->_prefersLowQualityEffects;
}

- (unint64_t)shapeStyle
{
  return self->_shapeStyle;
}

- (NSArray)arrangedSubviews
{
  return self->_arrangedSubviews;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  self->_extrinsicContentSize = a3;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVLayoutView *)self isCollapsed] || ![(AVLayoutView *)self isIncluded]) {
    return 1;
  }

  return [(AVLayoutView *)self isRemoved];
}

- (id)_includedItemsFromSubviews:(id)a3 inStackLayout:(id)a4 thatFitSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(v9, "itemsThatFitSize:", width, height);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v54 = v9;
    int v14 = 0;
    uint64_t v15 = *(void *)v77;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v77 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = [*(id *)(*((void *)&v76 + 1) + 8 * i) layoutAttributes];
        if ([v17 canSubstituteOtherAttributes])
        {

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v19 = v10;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v84 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v72;
            while (1)
            {
              if (*(void *)v72 != v22) {
                objc_enumerationMutation(v19);
              }
              if (!--v21)
              {
                uint64_t v21 = [v19 countByEnumeratingWithState:&v71 objects:v84 count:16];
                if (!v21) {
                  break;
                }
              }
            }
          }
          char v51 = v14;

          v23 = [MEMORY[0x1E4F1CA48] array];
          v24 = [MEMORY[0x1E4F1CA48] array];
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          v53 = v11;
          v25 = v11;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v67 objects:v83 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            v28 = 0;
            uint64_t v29 = *(void *)v68;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v68 != v29) {
                  objc_enumerationMutation(v25);
                }
                v31 = [*(id *)(*((void *)&v67 + 1) + 8 * j) layoutAttributes];
                if (([v19 containsObject:v31] & 1) == 0
                  && [v31 isIncluded])
                {
                  [v23 addObject:v31];
                }
                if ([v19 containsObject:v31]
                  && [v31 isIncluded]
                  && [v31 canOverflowToAuxiliaryMenu])
                {
                  [v24 addObject:v31];
                }
                if ([v31 canSubstituteOtherAttributes])
                {
                  id v32 = v31;

                  v28 = v32;
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v67 objects:v83 count:16];
            }
            while (v27);
          }
          else
          {
            v28 = 0;
          }

          v33 = [MEMORY[0x1E4F1CA48] array];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v18 = v23;
          uint64_t v34 = [v18 countByEnumeratingWithState:&v63 objects:v82 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v64;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v64 != v36) {
                  objc_enumerationMutation(v18);
                }
                v38 = *(void **)(*((void *)&v63 + 1) + 8 * k);
                if ([v38 canOverflowToAuxiliaryMenu]) {
                  [v33 addObject:v38];
                }
              }
              uint64_t v35 = [v18 countByEnumeratingWithState:&v63 objects:v82 count:16];
            }
            while (v35);
          }

          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v39 = v33;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v81 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v60;
            while (1)
            {
              if (*(void *)v60 != v42) {
                objc_enumerationMutation(v39);
              }
              if (!--v41)
              {
                uint64_t v41 = [v39 countByEnumeratingWithState:&v59 objects:v81 count:16];
                if (!v41) {
                  break;
                }
              }
            }
          }

          char v43 = ([v39 count] != 0) | v51;
          if (v43)
          {
            char v52 = v43;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v44 = v24;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v55 objects:v80 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v56;
              do
              {
                for (uint64_t m = 0; m != v46; ++m)
                {
                  if (*(void *)v56 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  v49 = *(void **)(*((void *)&v55 + 1) + 8 * m);
                  if ((unint64_t)[v49 displayPriority] <= 1) {
                    [v49 setIncluded:0];
                  }
                }
                uint64_t v46 = [v44 countByEnumeratingWithState:&v55 objects:v80 count:16];
              }
              while (v46);
            }

            char v43 = v52;
          }
          [v28 setIncluded:v43 & 1];
          id v9 = v54;
          v10 = objc_msgSend(v54, "itemsThatFitSize:", width, height);

          v11 = v53;
          goto LABEL_66;
        }
        if ([v17 canOnlyAppearInControlOverflowMenu]) {
          v14 |= [v17 isIncluded];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v76 objects:v85 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    if ((v14 & 1) == 0)
    {
      id v9 = v54;
      goto LABEL_67;
    }
    v18 = _AVLog();
    id v9 = v54;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "Has control that can only overflow, but no layout views can substitute others.", buf, 2u);
    }
  }
  else
  {
    v18 = v11;
  }
LABEL_66:

LABEL_67:

  return v10;
}

- (void)_removeArrangedSubview:(id)a3
{
  id v7 = a3;
  v4 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
  uint64_t v5 = [v4 indexOfObject:v7];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
    [v6 removeObjectAtIndex:v5];

    [v7 removeFromSuperview];
    [(AVLayoutView *)self setStackLayoutNeedsUpdate:1];
    [(AVLayoutView *)self setNeedsLayout];
  }
}

- (void)_insertArrangedSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
  [v7 insertObject:v6 atIndex:a4];

  [(AVLayoutView *)self insertSubview:v6 atIndex:a4 + 1];
  [(AVLayoutView *)self setStackLayoutNeedsUpdate:1];

  [(AVLayoutView *)self setNeedsLayout];
}

- (void)_applyShapeStyle
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  unint64_t v6 = [(AVLayoutView *)self shapeStyle];
  if (v6 == 1)
  {
    [(AVLayoutView *)self bounds];
    double Width = CGRectGetWidth(v34);
    [(AVLayoutView *)self bounds];
    double Height = CGRectGetHeight(v35);
    uint64_t v11 = 0;
    if (Width >= Height) {
      double Height = Width;
    }
    double v10 = Height * 0.5;
  }
  else if (v6)
  {
    uint64_t v11 = 0;
    double v10 = 0.0;
  }
  else
  {
    if (v5 == 5) {
      double v7 = 0.77;
    }
    else {
      double v7 = 1.0;
    }
    [(AVLayoutView *)self bounds];
    BOOL v8 = CGRectGetHeight(v33) <= v7 * 40.0;
    double v9 = 8.0;
    if (!v8) {
      double v9 = 16.0;
    }
    double v10 = v7 * v9;
    uint64_t v11 = 1;
  }
  int v14 = [(AVLayoutView *)self backdropLayerView];
  uint64_t v15 = [v14 layer];
  [v15 setCornerRadius:v10];

  v16 = [(AVLayoutView *)self backdropLayerView];
  v17 = [v16 layer];
  [v17 setMaskedCorners:15];

  v18 = [(AVLayoutView *)self backdropLayerView];
  id v19 = [v18 layer];
  uint64_t v20 = v19;
  uint64_t v21 = (void *)MEMORY[0x1E4F39EA8];
  if (!v11) {
    uint64_t v21 = (void *)MEMORY[0x1E4F39EA0];
  }
  [v19 setCornerCurve:*v21];

  if ([(AVLayoutView *)self effectiveUserInterfaceLayoutDirection]) {
    uint64_t v22 = 10;
  }
  else {
    uint64_t v22 = 5;
  }
  v23 = [(AVLayoutView *)self secondaryMaterialOverlayView];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  [(AVLayoutView *)self frame];
  if (v27 == v29 && v25 == v28) {
    uint64_t v22 = 15;
  }

  id v31 = [(AVLayoutView *)self secondaryMaterialOverlayView];
  [v31 _setCornerRadius:v11 continuous:v22 maskedCorners:v10];
}

- (void)_updateStackLayoutIfNeeded
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(AVLayoutView *)self stackLayoutNeedsUpdate])
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    v4 = [(AVLayoutView *)self arrangedSubviews];
    double v26 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = [(AVLayoutView *)self arrangedSubviews];
    uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v5)
    {
      uint64_t v25 = *(void *)v41;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v40 + 1) + 8 * v6);
          uint64_t v34 = 0;
          CGRect v35 = &v34;
          uint64_t v36 = 0x3032000000;
          v37 = __Block_byref_object_copy__24657;
          v38 = __Block_byref_object_dispose__24658;
          id v39 = 0;
          uint64_t v28 = 0;
          double v29 = &v28;
          uint64_t v30 = 0x3032000000;
          id v31 = __Block_byref_object_copy__24657;
          id v32 = __Block_byref_object_dispose__24658;
          id v33 = 0;
          if ([(AVLayoutView *)self effectiveUserInterfaceLayoutDirection] == 1) {
            uint64_t v8 = 2 * ([(AVLayoutView *)self semanticContentAttribute] != 1);
          }
          else {
            uint64_t v8 = 0;
          }
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke;
          v27[3] = &unk_1E5FC4598;
          v27[4] = &v28;
          v27[5] = &v34;
          [v7 enumerateObjectsWithOptions:v8 usingBlock:v27];
          [(id)v29[5] setNextAttributesInLayoutOrder:0];
          double v9 = [v7 sortedArrayUsingComparator:&__block_literal_global_24659];
          double v10 = [v9 firstObject];
          uint64_t v11 = [v10 layoutAttributes];

          for (unint64_t i = 1; i < [v7 count]; ++i)
          {
            uint64_t v13 = [v9 objectAtIndexedSubscript:i];
            int v14 = [v13 layoutAttributes];
            [v11 setNextAttributesInPriorityOrder:v14];

            uint64_t v15 = [v13 layoutAttributes];

            uint64_t v11 = (void *)v15;
          }
          [v11 setNextAttributesInPriorityOrder:0];
          v16 = [AVLayoutViewRowHead alloc];
          uint64_t v17 = v35[5];
          v18 = [v9 firstObject];
          id v19 = [v18 layoutAttributes];
          uint64_t v20 = [(AVLayoutViewRowHead *)v16 initWithFirstAttributesInLayoutOrder:v17 firstAttributesInPriorityOrder:v19];

          [v26 addObject:v20];
          _Block_object_dispose(&v28, 8);

          _Block_object_dispose(&v34, 8);
          ++v6;
        }
        while (v6 != v5);
        uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v5);
    }

    uint64_t v21 = [[AVCustomStackLayout alloc] initWithLayoutRowHeads:v26];
    [(AVLayoutView *)self setCurrentStackLayout:v21];

    uint64_t v22 = [(AVLayoutView *)self debugIdentifier];
    v23 = [(AVLayoutView *)self currentStackLayout];
    [v23 setDebugIdentifier:v22];

    [(AVLayoutView *)self setStackLayoutNeedsUpdate:0];
  }
}

void __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  uint64_t v5 = [v4 layoutAttributes];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNextAttributesInLayoutOrder:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;
  }
  uint64_t v9 = [v4 layoutAttributes];

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __42__AVLayoutView__updateStackLayoutIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 layoutAttributes];
  unint64_t v7 = [v6 displayPriority];
  uint64_t v8 = [v5 layoutAttributes];
  unint64_t v9 = [v8 displayPriority];

  if (v7 <= v9)
  {
    uint64_t v11 = [v4 layoutAttributes];
    unint64_t v12 = [v11 displayPriority];
    uint64_t v13 = [v5 layoutAttributes];
    uint64_t v10 = v12 < [v13 displayPriority];
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AVLayoutView *)self debugIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> - %@", v4, self, v5];

  return (NSString *)v6;
}

- (void)reevaluateHiddenStateOfAllItems
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "avkit_reevaluateHiddenStateOfItem:", *(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setDebugIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_debugIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_debugIdentifier, a3);
    uint64_t v5 = [(AVLayoutView *)self currentStackLayout];
    [v5 setDebugIdentifier:v6];
  }
}

- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4
{
  id v6 = [(AVLayoutView *)self currentStackLayout];
  [v6 setRowSpacing:a4 afterRow:a3];
}

- (BOOL)hasVisibleArrangedSubview
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 _isInAWindow]
          && !objc_msgSend(v6, "avkit_isCompletelyTransparent"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)setContentLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  -[AVLayoutView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", a3.top, a3.leading, a3.bottom, a3.trailing);

  [(AVLayoutView *)self setNeedsLayout];
}

- (void)setShapeStyle:(unint64_t)a3
{
  if (self->_shapeStyle != a3)
  {
    self->_shapeStyle = a3;
    [(AVLayoutView *)self _applyShapeStyle];
  }
}

- (void)setPrefersLowQualityEffects:(BOOL)a3
{
  if (self->_prefersLowQualityEffects != a3)
  {
    BOOL v3 = a3;
    self->_prefersLowQualityEffects = a3;
    uint64_t v5 = [(AVLayoutView *)self backdropLayerView];
    [v5 setForceLowQualityEffect:v3];

    id v6 = [(AVLayoutView *)self backdropLayerView];
    [v6 updateActiveBackdropEffectIfGroupLeader];
  }
}

- (void)setArrangedSubviews:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_arrangedSubviews, a3);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  long long v7 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
  uint64_t v24 = [v6 setWithArray:v7];

  double v26 = self;
  if ([(AVLayoutView *)self effectiveUserInterfaceLayoutDirection] == 1) {
    uint64_t v8 = 2 * ([(AVLayoutView *)self semanticContentAttribute] != 1);
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v24);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __36__AVLayoutView_setArrangedSubviews___block_invoke;
        v34[3] = &unk_1E5FC4548;
        id v35 = v9;
        [v15 enumerateObjectsWithOptions:v8 usingBlock:v34];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v12);
  }

  v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v25;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
        if (([v16 containsObject:v22] & 1) == 0) {
          [(AVLayoutView *)v26 _removeArrangedSubview:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v19);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __36__AVLayoutView_setArrangedSubviews___block_invoke_2;
  v27[3] = &unk_1E5FC4570;
  id v28 = v17;
  double v29 = v26;
  id v23 = v17;
  [v9 enumerateObjectsUsingBlock:v27];
}

uint64_t __36__AVLayoutView_setArrangedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __36__AVLayoutView_setArrangedSubviews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  int v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    long long v7 = [v6 flattenedArrangedSubviewsInLayoutOrder];
    uint64_t v8 = [v7 indexOfObject:v12];

    id v10 = v12;
    if (v8 == a3) {
      goto LABEL_5;
    }
    [*(id *)(a1 + 40) _removeArrangedSubview:v12];
    id v6 = *(void **)(a1 + 40);
  }
  uint64_t v9 = [v6 _insertArrangedSubview:v12 atIndex:a3];
  id v10 = v12;
LABEL_5:

  return MEMORY[0x1F41817F8](v9, v10);
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(AVLayoutView *)self backdropLayerView];
  [v5 setCustomBackgroundColor:v4];
}

- (id)backgroundColor
{
  v2 = [(AVLayoutView *)self backdropLayerView];
  BOOL v3 = [v2 backgroundColor];

  return v3;
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)AVLayoutView;
  [(AVLayoutView *)&v3 setNeedsLayout];
  [(AVLayoutView *)self setLayoutDirty:1];
}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  id v5 = [(AVLayoutView *)self currentStackLayout];
  [v5 layoutHeightThatFitsRowsStartingWithRow:a3];
  double v7 = v6;
  [(AVLayoutView *)self contentLayoutMargins];
  double v9 = v7 + v8;

  return v9;
}

- (id)prioritizedSizeThatFitsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AVLayoutView *)self _updateStackLayoutIfNeeded];
  double v6 = [(AVLayoutView *)self currentStackLayout];
  double v7 = objc_msgSend(v6, "prioritizedSizeThatFitsSize:", width, height);

  return v7;
}

- (void)layoutSubviews
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)AVLayoutView;
  [(AVView *)&v51 layoutSubviews];
  objc_super v3 = [(AVLayoutView *)self backdropLayerView];
  [(AVLayoutView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  if ([(AVLayoutView *)self isLayoutDirty])
  {
    [(AVLayoutView *)self _updateStackLayoutIfNeeded];
    [(AVLayoutView *)self frame];
    double v5 = v4;
    double v7 = v6;
    [(AVLayoutView *)self contentLayoutMargins];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [(AVLayoutView *)self effectiveUserInterfaceLayoutDirection];
    if (v16 == 1) {
      double v17 = v15;
    }
    else {
      double v17 = v11;
    }
    if (v16 != 1) {
      double v11 = v15;
    }
    uint64_t v18 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
    uint64_t v19 = [(AVLayoutView *)self currentStackLayout];
    double v20 = v5 - (v17 + v11);
    double v21 = v7 - (v9 + v13);
    uint64_t v22 = -[AVLayoutView _includedItemsFromSubviews:inStackLayout:thatFitSize:](self, "_includedItemsFromSubviews:inStackLayout:thatFitSize:", v18, v19, v20, v21);

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v23 = [(AVLayoutView *)self flattenedArrangedSubviewsInLayoutOrder];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(v23);
          }
          double v27 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v28 = [v27 layoutAttributes];
          objc_msgSend(v28, "setCollapsed:", objc_msgSend(v22, "containsObject:", v28) ^ 1);
          [v27 layoutAttributesDidChange];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v24);
    }

    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    double v29 = [(AVLayoutView *)self currentStackLayout];
    long long v30 = objc_msgSend(v29, "layoutFramesInBoundingSize:", v20, v21);

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __30__AVLayoutView_layoutSubviews__block_invoke;
    v42[3] = &unk_1E5FC4520;
    v42[4] = self;
    v42[5] = &v43;
    [v30 enumerateObjectsUsingBlock:v42];
    if (!*((unsigned char *)v44 + 24))
    {
      long long v31 = [v30 firstObject];
      [v31 CGRectValue];
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      long long v40 = [(AVLayoutView *)self secondaryMaterialOverlayView];
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

      long long v41 = [(AVLayoutView *)self secondaryMaterialOverlayView];
      [v41 setHidden:1];
    }
    [(AVLayoutView *)self setLayoutDirty:0];

    _Block_object_dispose(&v43, 8);
  }
  [(AVLayoutView *)self _applyShapeStyle];
}

void __30__AVLayoutView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = [*(id *)(a1 + 32) flattenedArrangedSubviewsInLayoutOrder];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    double v8 = [*(id *)(a1 + 32) flattenedArrangedSubviewsInLayoutOrder];
    double v9 = [v8 objectAtIndexedSubscript:a3];

    [v5 CGRectValue];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [*(id *)(a1 + 32) contentLayoutMargins];
    double v19 = v11 + v18;
    [*(id *)(a1 + 32) contentLayoutMargins];
    double v21 = v13 + v20;
    [v9 frame];
    v40.origin.x = v19;
    v40.origin.y = v21;
    v40.size.double width = v15;
    v40.size.double height = v17;
    if (!CGRectEqualToRect(v38, v40)) {
      objc_msgSend(v9, "setFrame:", v19, v21, v15, v17);
    }
    uint64_t v22 = [v9 layoutAttributes];
    if ([v22 prefersSecondaryMaterialOverlay])
    {
      id v23 = [v9 layoutAttributes];
      if ([v23 isCollapsedOrExcluded])
      {
      }
      else
      {
        int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

        if (v27) {
          goto LABEL_8;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        id v28 = [*(id *)(a1 + 32) secondaryMaterialOverlayView];
        [v28 setHidden:0];

        double v29 = [*(id *)(a1 + 32) secondaryMaterialOverlayView];
        [v29 frame];
        v41.origin.x = v19;
        v41.origin.y = v21;
        v41.size.double width = v15;
        v41.size.double height = v17;
        BOOL v30 = CGRectEqualToRect(v39, v41);

        if (v30) {
          goto LABEL_8;
        }
        uint64_t v22 = [*(id *)(a1 + 32) secondaryMaterialOverlayView];
        objc_msgSend(v22, "setFrame:", v19, v21, v15, v17);
      }
    }

LABEL_8:
    goto LABEL_12;
  }
  uint64_t v24 = _AVLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [*(id *)(a1 + 32) debugIdentifier];
    double v26 = [*(id *)(a1 + 32) flattenedArrangedSubviewsInLayoutOrder];
    int v31 = 138412802;
    double v32 = v25;
    __int16 v33 = 2048;
    uint64_t v34 = [v26 count];
    __int16 v35 = 2048;
    unint64_t v36 = a3;
    _os_log_impl(&dword_1B05B7000, v24, OS_LOG_TYPE_DEFAULT, "%@ - Computed more frames than we have arranged subviews. Number of arranged subviews: %ld -- current frame index: %ld", (uint8_t *)&v31, 0x20u);
  }
LABEL_12:
}

- (AVLayoutView)init
{
  return -[AVLayoutView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (AVLayoutView)initWithFrame:(CGRect)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)AVLayoutView;
  objc_super v3 = -[AVView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_collapsed = 0;
    v3->_included = 1;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    flattenedArrangedSubviewsInLayoutOrder = v4->_flattenedArrangedSubviewsInLayoutOrder;
    v4->_flattenedArrangedSubviewsInLayoutOrder = (NSMutableArray *)v5;

    unint64_t v7 = objc_alloc_init(AVCustomStackLayout);
    currentStackLayout = v4->_currentStackLayout;
    v4->_currentStackLayout = v7;

    [(AVView *)v4 setHasBackdropView:1];
    double v9 = [AVCABackdropLayerView alloc];
    [(AVLayoutView *)v4 bounds];
    uint64_t v10 = -[AVCABackdropLayerView initWithFrame:](v9, "initWithFrame:");
    backdropLayerView = v4->_backdropLayerView;
    v4->_backdropLayerView = (AVCABackdropLayerView *)v10;

    double v12 = [(AVCABackdropLayerView *)v4->_backdropLayerView layer];
    [v12 setMasksToBounds:1];

    [(AVLayoutView *)v4 addSubview:v4->_backdropLayerView];
    double v13 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    [(UIVisualEffectView *)v13 setUserInteractionEnabled:0];
    double v14 = (void *)MEMORY[0x1E4FB1EF8];
    double v15 = [MEMORY[0x1E4FB1618] blackColor];
    double v16 = [v14 effectCompositingColor:v15 withMode:23 alpha:0.06];
    v23[0] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(UIVisualEffectView *)v13 setBackgroundEffects:v17];

    secondaryMaterialOverlayView = v4->_secondaryMaterialOverlayView;
    v4->_secondaryMaterialOverlayView = v13;
    double v19 = v13;

    [(UIVisualEffectView *)v4->_secondaryMaterialOverlayView setHidden:1];
    double v20 = [(AVLayoutView *)v4 secondaryMaterialOverlayView];
    [(AVLayoutView *)v4 addSubview:v20];

    [(AVLayoutView *)v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(AVLayoutView *)v4 setClipsToBounds:1];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end