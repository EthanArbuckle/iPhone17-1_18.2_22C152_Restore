@interface _HKAnnotationColumnLayout
- (BOOL)includeSeparators;
- (BOOL)reverseColumnsInRightToLeftLayoutDirection;
- (CGSize)intrinsicContentSize;
- (NSMutableArray)columnViews;
- (NSMutableArray)separatorViews;
- (_HKAnnotationColumnLayout)initWithContext:(int64_t)a3;
- (double)_columnSeparation;
- (double)_largestColumnWidth;
- (double)_minimumHeight;
- (double)_minimumWidth;
- (double)_minimumWidthForPackedLayout;
- (double)_minimumWithForEqualLayout;
- (double)_totalColumnWidth;
- (id)_makeSeparatorView;
- (int64_t)context;
- (void)_addSeparatorViews;
- (void)_clearColumnViews;
- (void)_clearSeparatorViews;
- (void)_invalidateLayout;
- (void)_layoutColumnsEqually;
- (void)_layoutColumnsPacked;
- (void)_layoutColumnsWithWidth:(double)a3 columnSeparation:(double)a4 currentSize:(CGSize)a5;
- (void)addColumnView:(id)a3;
- (void)clearViews;
- (void)clearViewsFromIndex:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setColumnView:(id)a3 atIndex:(unint64_t)a4;
- (void)setColumnViews:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setIncludeSeparators:(BOOL)a3;
- (void)setReverseColumnsInRightToLeftLayoutDirection:(BOOL)a3;
- (void)setSeparatorViews:(id)a3;
@end

@implementation _HKAnnotationColumnLayout

- (_HKAnnotationColumnLayout)initWithContext:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_HKAnnotationColumnLayout;
  v4 = -[_HKAnnotationColumnLayout initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v4->_includeSeparators = 0;
    v4->_reverseColumnsInRightToLeftLayoutDirection = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    columnViews = v5->_columnViews;
    v5->_columnViews = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    separatorViews = v5->_separatorViews;
    v5->_separatorViews = v8;
  }
  return v5;
}

- (void)setIncludeSeparators:(BOOL)a3
{
  if (self->_includeSeparators)
  {
    if (!a3)
    {
      [(_HKAnnotationColumnLayout *)self _clearSeparatorViews];
LABEL_6:
      [(_HKAnnotationColumnLayout *)self _invalidateLayout];
    }
  }
  else if (a3)
  {
    [(_HKAnnotationColumnLayout *)self _addSeparatorViews];
    goto LABEL_6;
  }
  self->_includeSeparators = a3;
}

- (void)setReverseColumnsInRightToLeftLayoutDirection:(BOOL)a3
{
  if (self->_reverseColumnsInRightToLeftLayoutDirection != a3)
  {
    self->_reverseColumnsInRightToLeftLayoutDirection = a3;
    [(_HKAnnotationColumnLayout *)self _invalidateLayout];
  }
}

- (void)addColumnView:(id)a3
{
  id v4 = a3;
  if ([(_HKAnnotationColumnLayout *)self includeSeparators])
  {
    v5 = [(_HKAnnotationColumnLayout *)self columnViews];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = [(_HKAnnotationColumnLayout *)self _makeSeparatorView];
      v8 = [(_HKAnnotationColumnLayout *)self separatorViews];
      [v8 addObject:v7];

      [(_HKAnnotationColumnLayout *)self addSubview:v7];
    }
  }
  v9 = [(_HKAnnotationColumnLayout *)self columnViews];
  [v9 addObject:v4];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:1];
  [(_HKAnnotationColumnLayout *)self addSubview:v4];

  [(_HKAnnotationColumnLayout *)self _invalidateLayout];
}

- (void)setColumnView:(id)a3 atIndex:(unint64_t)a4
{
  id v11 = a3;
  uint64_t v6 = [(_HKAnnotationColumnLayout *)self columnViews];
  unint64_t v7 = [v6 count];

  if (v7 <= a4)
  {
    [(_HKAnnotationColumnLayout *)self addColumnView:v11];
  }
  else
  {
    v8 = [(_HKAnnotationColumnLayout *)self columnViews];
    v9 = [v8 objectAtIndexedSubscript:a4];

    if (([v9 isEqual:v11] & 1) == 0)
    {
      [v9 removeFromSuperview];
      v10 = [(_HKAnnotationColumnLayout *)self columnViews];
      [v10 setObject:v11 atIndexedSubscript:a4];

      [v11 setTranslatesAutoresizingMaskIntoConstraints:1];
      [(_HKAnnotationColumnLayout *)self addSubview:v11];
      [(_HKAnnotationColumnLayout *)self _invalidateLayout];
    }
  }
}

- (void)clearViews
{
  [(_HKAnnotationColumnLayout *)self _clearColumnViews];
  [(_HKAnnotationColumnLayout *)self _clearSeparatorViews];
}

- (void)clearViewsFromIndex:(unint64_t)a3
{
  if (a3)
  {
    if ([(NSMutableArray *)self->_columnViews count] > a3)
    {
      if ([(NSMutableArray *)self->_columnViews count] > a3)
      {
        unint64_t v5 = a3;
        do
        {
          uint64_t v6 = [(NSMutableArray *)self->_columnViews objectAtIndexedSubscript:v5];
          [v6 removeFromSuperview];

          ++v5;
        }
        while (v5 < [(NSMutableArray *)self->_columnViews count]);
      }
      -[NSMutableArray removeObjectsInRange:](self->_columnViews, "removeObjectsInRange:", a3, [(NSMutableArray *)self->_columnViews count] - a3);
      if (self->_includeSeparators && [(NSMutableArray *)self->_separatorViews count])
      {
        unint64_t v7 = a3 - 1;
        if (v7 < [(NSMutableArray *)self->_separatorViews count])
        {
          unint64_t v8 = v7;
          do
          {
            v9 = [(NSMutableArray *)self->_separatorViews objectAtIndexedSubscript:v8];
            [v9 removeFromSuperview];

            ++v8;
          }
          while (v8 < [(NSMutableArray *)self->_separatorViews count]);
        }
        separatorViews = self->_separatorViews;
        unint64_t v11 = [(NSMutableArray *)separatorViews count] - v7;
        -[NSMutableArray removeObjectsInRange:](separatorViews, "removeObjectsInRange:", v7, v11);
      }
    }
  }
  else
  {
    [(_HKAnnotationColumnLayout *)self clearViews];
  }
}

- (void)layoutSubviews
{
  v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int64_t v5 = [(_HKAnnotationColumnLayout *)self context];
    if ((unint64_t)(v5 - 1) >= 2)
    {
      if (!v5)
      {
        [(_HKAnnotationColumnLayout *)self _layoutColumnsEqually];
      }
    }
    else
    {
      [(_HKAnnotationColumnLayout *)self _layoutColumnsPacked];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  [(_HKAnnotationColumnLayout *)self _minimumWidth];
  double v4 = v3;
  [(_HKAnnotationColumnLayout *)self _minimumHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)_invalidateLayout
{
  [(_HKAnnotationColumnLayout *)self invalidateIntrinsicContentSize];
  [(_HKAnnotationColumnLayout *)self setNeedsLayout];
}

- (void)_clearColumnViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  unint64_t v8 = [(_HKAnnotationColumnLayout *)self columnViews];
  [v8 removeAllObjects];
}

- (void)_clearSeparatorViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(_HKAnnotationColumnLayout *)self separatorViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  unint64_t v8 = [(_HKAnnotationColumnLayout *)self separatorViews];
  [v8 removeAllObjects];
}

- (void)_addSeparatorViews
{
  double v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      uint64_t v6 = [(_HKAnnotationColumnLayout *)self _makeSeparatorView];
      uint64_t v7 = [(_HKAnnotationColumnLayout *)self separatorViews];
      [v7 addObject:v6];

      [(_HKAnnotationColumnLayout *)self addSubview:v6];
      --v5;
    }
    while (v5);
  }
}

- (void)_layoutColumnsEqually
{
  double v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  double v4 = (double)(unint64_t)[v3 count];

  [(_HKAnnotationColumnLayout *)self frame];
  double v6 = v5;
  double v8 = v7;
  [(_HKAnnotationColumnLayout *)self _columnSeparation];
  double v10 = v9;
  double v11 = (v6 - v9 * (v4 + -1.0)) / v4;
  -[_HKAnnotationColumnLayout _layoutColumnsWithWidth:columnSeparation:currentSize:](self, "_layoutColumnsWithWidth:columnSeparation:currentSize:", v11, v10, v6, v8);
}

- (void)_layoutColumnsPacked
{
  [(_HKAnnotationColumnLayout *)self _columnSeparation];
  double v4 = v3;
  [(_HKAnnotationColumnLayout *)self frame];
  -[_HKAnnotationColumnLayout _layoutColumnsWithWidth:columnSeparation:currentSize:](self, "_layoutColumnsWithWidth:columnSeparation:currentSize:", 0.0, v4);
}

- (void)_layoutColumnsWithWidth:(double)a3 columnSeparation:(double)a4 currentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a3;
  if (a3 == 0.0)
  {
    [(_HKAnnotationColumnLayout *)self _minimumWidthForPackedLayout];
    double v11 = v10 - width;
    long long v12 = [(_HKAnnotationColumnLayout *)self columnViews];
    double v13 = v11 / (double)(unint64_t)[v12 count];

    double v14 = fmax(v13, 0.0);
  }
  else
  {
    double v14 = 0.0;
  }
  unint64_t v15 = 0;
  double v50 = a4 * 0.5;
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  double v16 = 1.79769313e308;
  double v49 = v8;
  while (1)
  {
    v17 = [(_HKAnnotationColumnLayout *)self columnViews];
    unint64_t v18 = [v17 count];

    if (v15 >= v18) {
      break;
    }
    v19 = [(_HKAnnotationColumnLayout *)self columnViews];
    v20 = [v19 objectAtIndexedSubscript:v15];

    objc_msgSend(v20, "systemLayoutSizeFittingSize:", width, v16);
    double v22 = v21;
    double v24 = v23;
    if (v15)
    {
      if ([(_HKAnnotationColumnLayout *)self includeSeparators])
      {
        double v25 = v16;
        double v26 = v14;
        double v27 = width;
        double v28 = a4;
        double v29 = v54[3];
        v30 = [(_HKAnnotationColumnLayout *)self separatorViews];
        v31 = [v30 objectAtIndexedSubscript:v15 - 1];

        objc_msgSend(v31, "setFrame:", v50 + v29, 0.0, 1.0, height);
        a4 = v28;
        double width = v27;
        double v14 = v26;
        double v16 = v25;
        double v8 = v49;
      }
      v54[3] = v54[3] + a4;
      if (v8 <= 0.0) {
        double v32 = v22;
      }
      else {
        double v32 = v8;
      }
      double v33 = v32 - v14;
    }
    else
    {
      if (v8 > 0.0) {
        double v22 = v8;
      }
      v34 = [(_HKAnnotationColumnLayout *)self columnViews];
      uint64_t v35 = [v34 count];
      double v33 = v22 - v14;

      if (v35 == 1)
      {
        [(_HKAnnotationColumnLayout *)self frame];
        if (v33 < v36) {
          double v33 = v36;
        }
      }
    }
    if (height >= v24) {
      double v37 = v24;
    }
    else {
      double v37 = height;
    }
    objc_msgSend(v20, "setFrame:", v54[3], height - v37, v33);
    v54[3] = v33 + v54[3];

    ++v15;
  }
  if ([(_HKAnnotationColumnLayout *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v38 = [(_HKAnnotationColumnLayout *)self columnViews];
    uint64_t v39 = [v38 count];

    if (v39)
    {
      v40 = [(_HKAnnotationColumnLayout *)self columnViews];
      v41 = [(_HKAnnotationColumnLayout *)self columnViews];
      v42 = objc_msgSend(v40, "objectAtIndexedSubscript:", objc_msgSend(v41, "count") - 1);

      [v42 frame];
      double v44 = v43;
      [v42 frame];
      double v46 = 0.0;
      if (v44 + v45 >= width) {
        double v47 = 0.0;
      }
      else {
        double v47 = width - (v44 + v45);
      }
      if (v47 > 0.0) {
        double v46 = v47 + 0.0;
      }
      v54[3] = v46;
      if ([(_HKAnnotationColumnLayout *)self reverseColumnsInRightToLeftLayoutDirection])
      {
        v48 = [(_HKAnnotationColumnLayout *)self columnViews];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke;
        v52[3] = &unk_1E6D52F40;
        v52[4] = self;
        v52[5] = &v53;
        *(double *)&v52[6] = v50;
        *(double *)&v52[7] = a4;
        [v48 enumerateObjectsWithOptions:2 usingBlock:v52];
      }
      else
      {
        v48 = [(_HKAnnotationColumnLayout *)self columnViews];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __82___HKAnnotationColumnLayout__layoutColumnsWithWidth_columnSeparation_currentSize___block_invoke_2;
        v51[3] = &unk_1E6D52F68;
        v51[4] = self;
        *(double *)&v51[5] = v47;
        *(double *)&v51[6] = v50;
        [v48 enumerateObjectsWithOptions:2 usingBlock:v51];
      }
    }
  }
  _Block_object_dispose(&v53, 8);
}

- (double)_minimumWidth
{
  int64_t v3 = [(_HKAnnotationColumnLayout *)self context];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
    {
      [(_HKAnnotationColumnLayout *)self _minimumWithForEqualLayout];
    }
  }
  else
  {
    [(_HKAnnotationColumnLayout *)self _minimumWidthForPackedLayout];
  }
  return result;
}

- (double)_minimumWithForEqualLayout
{
  int64_t v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v4 = [v3 count];

  [(_HKAnnotationColumnLayout *)self _columnSeparation];
  double v6 = v5;
  [(_HKAnnotationColumnLayout *)self _largestColumnWidth];
  return v6 * (double)(v4 - 1) + v7 * (double)v4;
}

- (double)_minimumWidthForPackedLayout
{
  int64_t v3 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v4 = [v3 count];

  [(_HKAnnotationColumnLayout *)self _columnSeparation];
  double v6 = v5;
  [(_HKAnnotationColumnLayout *)self _totalColumnWidth];
  return v7 + v6 * (double)(v4 - 1);
}

- (double)_largestColumnWidth
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        if (v6 < v8) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)_columnSeparation
{
  int64_t v2 = [(_HKAnnotationColumnLayout *)self context];
  double result = 10.0;
  if (v2 == 2) {
    return 20.0;
  }
  return result;
}

- (double)_totalColumnWidth
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v2 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)_minimumHeight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v2 = [(_HKAnnotationColumnLayout *)self columnViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
        if (v6 < v8) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)_makeSeparatorView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:1];
  int64_t context = self->_context;
  if (context) {
    BOOL v5 = context == 2;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activitySeparatorDefaultColor");
  }
  else
  {
    if (context != 1) {
      goto LABEL_10;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activitySeparatorLollipopColor");
  }
  double v7 = (void *)v6;
  [v3 setBackgroundColor:v6];

LABEL_10:
  return v3;
}

- (BOOL)includeSeparators
{
  return self->_includeSeparators;
}

- (BOOL)reverseColumnsInRightToLeftLayoutDirection
{
  return self->_reverseColumnsInRightToLeftLayoutDirection;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_int64_t context = a3;
}

- (NSMutableArray)columnViews
{
  return self->_columnViews;
}

- (void)setColumnViews:(id)a3
{
}

- (NSMutableArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
}

@end