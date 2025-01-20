@interface AVCustomStackLayout
- (AVCustomStackLayout)init;
- (AVCustomStackLayout)initWithLayoutRowHeads:(id)a3;
- (NSArray)rowHeads;
- (NSMutableArray)rowSpacing;
- (NSString)debugIdentifier;
- (double)_heightForRow:(unint64_t)a3 startingFrom:(id)a4 inBoundingSize:(CGSize)a5;
- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3;
- (id)_flexibleWidthMapForLayoutItemsBeginningWithLayoutItem:(id)a3 endingWithItem:(id)a4 withAvailableSize:(CGSize)a5;
- (id)_lastVisibleLayoutItemAttributesFrom:(id)a3;
- (id)itemsThatFitSize:(CGSize)a3;
- (id)layoutFramesInBoundingSize:(CGSize)a3;
- (id)prioritizedSizeThatFitsSize:(CGSize)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setRowHeads:(id)a3;
- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4;
- (void)setRowSpacing:(id)a3;
@end

@implementation AVCustomStackLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSpacing, 0);
  objc_storeStrong((id *)&self->_rowHeads, 0);

  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

- (void)setRowSpacing:(id)a3
{
}

- (NSMutableArray)rowSpacing
{
  return self->_rowSpacing;
}

- (void)setRowHeads:(id)a3
{
}

- (NSArray)rowHeads
{
  return self->_rowHeads;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (double)_heightForRow:(unint64_t)a3 startingFrom:(id)a4 inBoundingSize:(CGSize)a5
{
  double height = a5.height;
  id v8 = a4;
  v9 = v8;
  double v10 = 0.0;
  if (v8)
  {
    v11 = v8;
    do
    {
      if (([v11 isCollapsedOrExcluded] & 1) == 0)
      {
        [v11 minimumSize];
        if (v10 >= v12) {
          double v13 = v10;
        }
        else {
          double v13 = v12;
        }
        if (v13 >= height) {
          double v10 = height;
        }
        else {
          double v10 = v13;
        }
      }
      uint64_t v14 = [v11 nextAttributesInLayoutOrder];

      v11 = (void *)v14;
    }
    while (v14);
  }
  v15 = [(AVCustomStackLayout *)self rowHeads];
  uint64_t v16 = [v15 count] - 1;

  if (v16 != a3) {
    double height = v10;
  }

  return height;
}

- (id)_lastVisibleLayoutItemAttributesFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v5 = 0;
  if (v3)
  {
    v6 = v3;
    do
    {
      if (([v6 isCollapsedOrExcluded] & 1) == 0)
      {
        id v7 = v6;

        v5 = v7;
      }
      uint64_t v8 = [v6 nextAttributesInLayoutOrder];

      v6 = (void *)v8;
    }
    while (v8);
  }

  return v5;
}

- (id)_flexibleWidthMapForLayoutItemsBeginningWithLayoutItem:(id)a3 endingWithItem:(id)a4 withAvailableSize:(CGSize)a5
{
  double width = a5.width;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = v7;
  double v12 = v11;
  if (v11)
  {
    double v13 = 0.0;
    id v14 = v11;
    double v15 = 0.0;
    do
    {
      if (![v14 hasFlexibleContentSize]
        || [v10 count]
        || ([v14 isCollapsedOrExcluded] & 1) != 0)
      {
        if ([v14 hasFlexibleContentSize]
          && [v10 count]
          && ([v14 isCollapsedOrExcluded] & 1) == 0)
        {
          if (v14 != v8)
          {
            [v14 trailingInterItemSpace];
            double width = width - v18;
          }
          double width = width - v13;
          double v13 = 0.0;
        }
        else if (([v14 hasFlexibleContentSize] & 1) == 0 {
               && ([v14 isCollapsedOrExcluded] & 1) == 0)
        }
        {
          [v14 minimumSize];
          double v13 = v13 + v16;
          if (v14 != v8)
          {
            [v14 trailingInterItemSpace];
            double v13 = v13 + v17;
          }
        }
      }
      else
      {
        v19 = [v14 nextAttributesInLayoutOrder];
        if (v19)
        {
          [v14 trailingInterItemSpace];
          double v21 = v20;
        }
        else
        {
          double v21 = 0.0;
        }

        double v15 = v13;
        double v13 = v21;
      }
      if ([v14 hasFlexibleContentSize]
        && ([v14 isCollapsedOrExcluded] & 1) == 0)
      {
        [v10 addObject:v14];
      }
      uint64_t v22 = [v14 nextAttributesInLayoutOrder];

      id v14 = (id)v22;
    }
    while (v22);
  }
  else
  {
    double v15 = 0.0;
    double v13 = 0.0;
  }
  if ((unint64_t)[v10 count] < 2) {
    double v23 = width - v13;
  }
  else {
    double v23 = width / (double)(unint64_t)[v10 count];
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __111__AVCustomStackLayout__flexibleWidthMapForLayoutItemsBeginningWithLayoutItem_endingWithItem_withAvailableSize___block_invoke;
  v29[3] = &unk_1E5FC37D8;
  id v24 = v9;
  double v32 = v23;
  double v33 = v15;
  id v30 = v24;
  v31 = v10;
  double v34 = v13;
  id v25 = v10;
  [v25 enumerateObjectsUsingBlock:v29];
  v26 = v31;
  id v27 = v24;

  return v27;
}

void __111__AVCustomStackLayout__flexibleWidthMapForLayoutItemsBeginningWithLayoutItem_endingWithItem_withAvailableSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    uint64_t v5 = [*(id *)(a1 + 40) count] - 1;
    v6 = NSNumber;
    double v7 = *(double *)(a1 + 48);
    if (v5 != a3) {
      goto LABEL_6;
    }
    double v8 = *(double *)(a1 + 64);
  }
  else
  {
    v6 = NSNumber;
    double v7 = *(double *)(a1 + 48);
    double v8 = *(double *)(a1 + 56);
  }
  double v7 = v7 - v8;
LABEL_6:
  v9 = [v6 numberWithDouble:v7];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = [(AVCustomStackLayout *)self rowHeads];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AVCustomStackLayout_layoutHeightThatFitsRowsStartingWithRow___block_invoke;
  v8[3] = &unk_1E5FC37B0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v5 enumerateObjectsUsingBlock:v8];

  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __63__AVCustomStackLayout_layoutHeightThatFitsRowsStartingWithRow___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(void *)(a1 + 48) <= a3)
  {
    uint64_t v5 = [a2 firstAttributesInLayoutOrder];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = 0.0;
      do
      {
        if (([v6 isCollapsedOrExcluded] & 1) == 0)
        {
          [v6 minimumSize];
          if (v7 < v8) {
            double v7 = v8;
          }
        }
        uint64_t v9 = [v6 nextAttributesInLayoutOrder];

        double v6 = (void *)v9;
      }
      while (v9);
    }
    else
    {
      double v7 = 0.0;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    id v12 = [*(id *)(a1 + 32) rowSpacing];
    id v10 = [v12 objectAtIndexedSubscript:a3];
    [v10 floatValue];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v11;
  }
}

- (void)setRowSpacing:(double)a3 afterRow:(unint64_t)a4
{
  id v7 = [NSNumber numberWithDouble:a3];
  double v6 = [(AVCustomStackLayout *)self rowSpacing];
  [v6 setObject:v7 atIndexedSubscript:a4];
}

- (id)prioritizedSizeThatFitsSize:(CGSize)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = -[AVCustomStackLayout itemsThatFitSize:](self, "itemsThatFitSize:", a3.width, a3.height);
  v4 = objc_alloc_init(AVPrioritizedSize);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "minimumSize", (void)v18);
        double v12 = v11;
        double v13 = [v5 lastObject];
        if (v10 == v13) {
          double v14 = 0.0;
        }
        else {
          [v10 trailingInterItemSpace];
        }
        double v15 = v12 + v14;

        [v10 minimumSize];
        -[AVPrioritizedSize addSize:withPriority:](v4, "addSize:withPriority:", [v10 displayPriority], v15, v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)itemsThatFitSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v6 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v7 = [(AVCustomStackLayout *)self rowHeads];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__AVCustomStackLayout_itemsThatFitSize___block_invoke;
  v11[3] = &unk_1E5FC3788;
  CGFloat v13 = width;
  CGFloat v14 = height;
  id v12 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v11];

  uint64_t v9 = [v8 array];

  return v9;
}

void __40__AVCustomStackLayout_itemsThatFitSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v6 = *(double *)(a1 + 40);
  id v7 = [a2 firstAttributesInPriorityOrder];
  if (!v7) {
    return;
  }
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  id v40 = v7;
  double v11 = v7;
  do
  {
    int v12 = [v11 canSubstituteOtherAttributes];
    if ([v11 canOnlyAppearInControlOverflowMenu]) {
      v9 |= [v11 isIncluded];
    }
    if ([v11 canOverflowToAuxiliaryMenu]) {
      v10 |= [v11 isIncluded];
    }
    v8 |= v12;
    uint64_t v13 = [v11 nextAttributesInLayoutOrder];

    double v11 = (void *)v13;
  }
  while (v13);
  int v14 = v8 & (v9 | v10);
  double v15 = v40;
  while (!*a4)
  {
    id v41 = v15;
    if ([v15 canSubstituteOtherAttributes] & v14)
    {
      int v16 = 1;
      if ((v14 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else if ([v41 canSubstituteOtherAttributes])
    {
      int v16 = 0;
      if ((v14 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      int v16 = [v41 isIncluded];
      if ((v14 & 1) == 0)
      {
LABEL_15:
        char v17 = 0;
        if (!v16) {
          goto LABEL_31;
        }
        goto LABEL_20;
      }
    }
    if ([v41 canOverflowToAuxiliaryMenu]) {
      goto LABEL_31;
    }
    char v17 = [v41 canOnlyAppearInControlOverflowMenu];
    if (!v16) {
      goto LABEL_31;
    }
LABEL_20:
    if ((v17 & 1) == 0
      && ([*(id *)(a1 + 32) containsObject:v41] & 1) == 0
      && ([v41 canOnlyAppearInControlOverflowMenu] & 1) == 0)
    {
      [v41 minimumSize];
      double v19 = v18;
      [v41 trailingInterItemSpace];
      double v21 = v19 + v20;
      uint64_t v22 = [v41 displayPartnerAttributes];

      if (v22)
      {
        uint64_t v23 = [v41 displayPartnerAttributes];
        [v23 minimumSize];
        double v25 = v24;

        v26 = [v41 displayPartnerAttributes];
        [v26 trailingInterItemSpace];
        double v21 = v21 + v25 + v27;
      }
      else
      {
        double v25 = 0.0;
      }
      double v28 = v21 + -0.00000011920929;
      if (v21 + -0.00000011920929 > v6)
      {
        uint64_t v33 = objc_msgSend(v41, "displayPartnerAttributes", v28);
        if (v33
          && (double v34 = (void *)v33,
              [v41 trailingInterItemSpace],
              double v36 = v25 + v19 + v35,
              v34,
              v36 <= v6))
        {
          [*(id *)(a1 + 32) addObject:v41];
          v38 = *(void **)(a1 + 32);
          v39 = [v41 displayPartnerAttributes];
          [v38 addObject:v39];
        }
        else
        {
          v37 = [v41 displayPartnerAttributes];

          if (!v37 && v19 <= v6) {
            [*(id *)(a1 + 32) addObject:v41];
          }
        }
        *a4 = 1;
        double v15 = v41;
        break;
      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v41, v28);
      v29 = [v41 displayPartnerAttributes];

      if (v29)
      {
        id v30 = *(void **)(a1 + 32);
        v31 = [v41 displayPartnerAttributes];
        [v30 addObject:v31];
      }
      double v6 = v6 - v21;
    }
LABEL_31:
    uint64_t v32 = [v41 nextAttributesInPriorityOrder];

    double v15 = (void *)v32;
    if (!v32) {
      break;
    }
  }
}

- (id)layoutFramesInBoundingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  double v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(AVCustomStackLayout *)self rowHeads];
  uint64_t v8 = [v7 count];

  int v9 = [(AVCustomStackLayout *)self rowHeads];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__AVCustomStackLayout_layoutFramesInBoundingSize___block_invoke;
  v14[3] = &unk_1E5FC3760;
  CGFloat v18 = width;
  CGFloat v19 = height;
  v14[4] = self;
  int v16 = v21;
  uint64_t v20 = v8;
  char v17 = v22;
  id v10 = v6;
  id v15 = v10;
  [v9 enumerateObjectsUsingBlock:v14];

  double v11 = v15;
  id v12 = v10;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);

  return v12;
}

void __50__AVCustomStackLayout_layoutFramesInBoundingSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 firstAttributesInLayoutOrder];
  objc_msgSend(*(id *)(a1 + 32), "_heightForRow:startingFrom:inBoundingSize:", a3, v5, *(double *)(a1 + 64), *(double *)(a1 + 72) - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  double v7 = v6;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  uint64_t v8 = [*(id *)(a1 + 32) rowSpacing];
  int v9 = [v8 objectAtIndexedSubscript:a3];
  [v9 floatValue];
  float v38 = v10;

  double v11 = [*(id *)(a1 + 32) _lastVisibleLayoutItemAttributesFrom:v5];
  id v12 = objc_msgSend(*(id *)(a1 + 32), "_flexibleWidthMapForLayoutItemsBeginningWithLayoutItem:endingWithItem:withAvailableSize:", v5, v11, *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v39 = v5;
  if (v39)
  {
    double v13 = 0.0;
    double v14 = 0.0;
    id v15 = v39;
    do
    {
      int v16 = [v12 objectForKeyedSubscript:v15];
      [v16 doubleValue];
      double v18 = v17;

      [v15 trailingInterItemSpace];
      double v20 = v19;
      int v21 = [v15 hasFlexibleContentSize];
      [v15 minimumSize];
      if (v18 >= v22) {
        double v23 = v18;
      }
      else {
        double v23 = v22;
      }
      if (v21) {
        double v24 = v23;
      }
      else {
        double v24 = v22;
      }
      double v25 = v7;
      if (*(void *)(a1 + 80) == 1)
      {
        [v15 minimumSize];
        double v25 = v26;
      }
      double v27 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      [v15 minimumSize];
      if (*(void *)(a1 + 80) == 1) {
        double v29 = (v7 + v27) * 0.5 - v28 * 0.5;
      }
      else {
        double v29 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
      int v30 = [v15 isCollapsedOrExcluded];
      double v31 = -0.0;
      if (v15 == v11) {
        double v32 = -0.0;
      }
      else {
        double v32 = v20;
      }
      double v33 = v32 + v24;
      if (v30) {
        double v34 = v14;
      }
      else {
        double v34 = v33;
      }
      if (!v30) {
        double v31 = v14;
      }
      double v13 = v13 + v31;
      double v35 = *(void **)(a1 + 40);
      double v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v13, v29, v24, v25);
      [v35 addObject:v36];

      uint64_t v37 = [v15 nextAttributesInLayoutOrder];

      double v14 = v34;
      id v15 = (void *)v37;
    }
    while (v37);
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + v38;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7
                                                              + v38
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
}

- (AVCustomStackLayout)initWithLayoutRowHeads:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVCustomStackLayout;
  id v5 = [(AVCustomStackLayout *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rowHeads = v5->_rowHeads;
    v5->_rowHeads = (NSArray *)v6;

    uint64_t v8 = [v4 count];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
    rowSpacing = v5->_rowSpacing;
    v5->_rowSpacing = (NSMutableArray *)v9;

    for (; v8; --v8)
      [(NSMutableArray *)v5->_rowSpacing addObject:&unk_1F094A100];
  }

  return v5;
}

- (AVCustomStackLayout)init
{
  return [(AVCustomStackLayout *)self initWithLayoutRowHeads:MEMORY[0x1E4F1CBF0]];
}

@end