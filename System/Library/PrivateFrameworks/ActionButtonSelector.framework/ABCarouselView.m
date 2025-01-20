@interface ABCarouselView
- (BOOL)isDragging;
- (double)_contentWidth;
- (double)_itemPageWidth;
- (double)_minOffset;
- (id)delegate;
- (id)initWithItems:(void *)a3 selectedIndex:;
- (id)items;
- (id)scrollToItemAtIndex:(int)a3 animated:;
- (id)setDelegate:(id *)result;
- (uint64_t)scrollGestureRecognizer;
- (void)_addItemViewForItem:(id)a3 index:(int64_t)a4;
- (void)_beginTracking;
- (void)_endTracking;
- (void)_handleScrollGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_trackDelta:(double)a3;
- (void)applyAlphaBlend:(double)a3 toItemsAtIndexes:;
- (void)layoutSubviews;
- (void)reloadWithItems:(int)a3 animated:;
- (void)setZPosition:(double)a3 forItemAtIndex:;
@end

@implementation ABCarouselView

- (id)initWithItems:(void *)a3 selectedIndex:
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)ABCarouselView;
    v7 = (id *)objc_msgSendSuper2(&v31, sel_initWithFrame_, -25.0, -25.0, 50.0, 50.0);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 51, a2);
      uint64_t v8 = objc_opt_new();
      id v9 = a1[52];
      a1[52] = (id)v8;

      a1[54] = a3;
      uint64_t v10 = objc_opt_new();
      id v11 = a1[59];
      a1[59] = (id)v10;

      uint64_t v12 = objc_opt_new();
      id v13 = a1[53];
      a1[53] = (id)v12;

      v14 = [a1 traitCollection];
      BOOL v15 = [v14 layoutDirection] == 1;

      if (v15) {
        uint64_t v16 = [a1[51] count] + ~(unint64_t)a1[54];
      }
      else {
        uint64_t v16 = (uint64_t)a1[54];
      }
      [a1 _itemPageWidth];
      [a1[53] setValue:v17 * (double)v16];
      objc_initWeak(&location, a1);
      v18 = (void *)MEMORY[0x263F1CB60];
      v32[0] = a1[53];
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __46__ABCarouselView_initWithItems_selectedIndex___block_invoke;
      v28 = &unk_265212F20;
      objc_copyWeak(&v29, &location);
      [v18 _createTransformerWithInputAnimatableProperties:v19 presentationValueChangedCallback:&v25];

      for (unint64_t i = 0; i < objc_msgSend(a1[51], "count", v25, v26, v27, v28); ++i)
      {
        v21 = [a1[51] objectAtIndexedSubscript:i];
        [a1 _addItemViewForItem:v21 index:i];
      }
      uint64_t v22 = [objc_alloc(MEMORY[0x263F1C838]) initWithTarget:a1 action:sel__handleScrollGesture_];
      id v23 = a1[61];
      a1[61] = (id)v22;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __46__ABCarouselView_initWithItems_selectedIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (id)items
{
  if (a1)
  {
    a1 = (id *)a1[51];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isDragging
{
  if (result) {
    return *(void *)(result + 440) != 0;
  }
  return result;
}

- (id)scrollToItemAtIndex:(int)a3 animated:
{
  if (result)
  {
    v5 = result;
    id v6 = [result traitCollection];
    uint64_t v7 = [v6 layoutDirection];

    if (v7 == 1) {
      a2 = [v5[51] count] + ~a2;
    }
    [v5 _itemPageWidth];
    double v9 = v8 * (double)a2;
    id v10 = v5[53];
    if (a3)
    {
      return (id *)[v10 setInput:v9];
    }
    else
    {
      return (id *)[v10 setOutput:v9];
    }
  }
  return result;
}

- (void)reloadWithItems:(int)a3 animated:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = v6;
  if (a1)
  {
    double v8 = [v6 differenceFromArray:*(void *)(a1 + 408) withOptions:4];
    if ([v8 hasChanges])
    {
      int v21 = a3;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v20 = v8;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v15 = [v14 changeType];
            if (v15 == 1)
            {
              if ([v14 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
              {
                double v17 = objc_msgSend(*(id *)(a1 + 416), "objectAtIndexedSubscript:", objc_msgSend(v14, "index"));
                [v17 removeFromSuperview];

                objc_msgSend(*(id *)(a1 + 416), "removeObjectAtIndex:", objc_msgSend(v14, "index"));
              }
            }
            else if (!v15)
            {
              if ([v14 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v16 = [v14 object];
                objc_msgSend((id)a1, "_addItemViewForItem:index:", v16, objc_msgSend(v14, "index"));
              }
              else
              {
                uint64_t v16 = objc_msgSend(*(id *)(a1 + 416), "objectAtIndexedSubscript:", objc_msgSend(v14, "associatedIndex"));
                objc_msgSend(*(id *)(a1 + 416), "removeObjectAtIndex:", objc_msgSend(v14, "associatedIndex"));
                objc_msgSend(*(id *)(a1 + 416), "setObject:atIndexedSubscript:", v16, objc_msgSend(v14, "index"));
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __43__ABCarouselView_reloadWithItems_animated___block_invoke;
      v22[3] = &unk_265212E38;
      v22[4] = a1;
      uint64_t v18 = MEMORY[0x24C555A80](v22);
      v19 = (void *)v18;
      if (!v21 || *(void *)(a1 + 440) || *(void *)(a1 + 448)) {
        (*(void (**)(uint64_t))(v18 + 16))(v18);
      }
      else {
        [MEMORY[0x263F1CB60] animateWithSpringDuration:0 bounce:v18 initialSpringVelocity:0 delay:0.5 options:0.15 animations:0.0 completion:0.0];
      }
      double v8 = v20;
      objc_storeStrong((id *)(a1 + 408), a2);
      [(id)a1 setNeedsLayout];
    }
  }
}

unint64_t __43__ABCarouselView_reloadWithItems_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v3 = [v2 layoutDirection];

  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 416) count];
  if (result)
  {
    unint64_t v5 = 0;
    uint64_t v6 = -1;
    do
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 416) count] + v6;
      if (v3 != 1) {
        uint64_t v7 = v5;
      }
      double v8 = (double)v7 * 49.0 + 0.5 + (double)v7 * 50.0;
      id v9 = [*(id *)(*(void *)(a1 + 32) + 416) objectAtIndexedSubscript:v5];
      objc_msgSend(v9, "setFrame:", v8, 0.5, 49.0, 49.0);

      ++v5;
      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 416) count];
      --v6;
    }
    while (v5 < result);
  }
  return result;
}

- (void)setZPosition:(double)a3 forItemAtIndex:
{
  if (a1)
  {
    id v5 = [*(id *)(a1 + 416) objectAtIndexedSubscript:a2];
    v4 = [v5 layer];
    [v4 setZPosition:a3];
  }
}

- (void)applyAlphaBlend:(double)a3 toItemsAtIndexes:
{
  id v10 = a2;
  if (a1)
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
    if (ABEqualObjects(v6, a1[57]))
    {
      char v7 = ABEqualObjects(a1[58], v10);

      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v8 = [NSNumber numberWithDouble:a3];
    id v9 = a1[57];
    a1[57] = (void *)v8;

    objc_storeStrong(a1 + 58, a2);
    [a1 setNeedsLayout];
  }
LABEL_7:
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)ABCarouselView;
  [(ABCarouselView *)&v39 layoutSubviews];
  [(ABCarouselView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(ABFloatSpringProperty *)self->_offsetSpring output];
  double v10 = v9;
  [(NSNumber *)self->_decelerationOffset doubleValue];
  if (v11 == v10)
  {
    decelerationOffset = self->_decelerationOffset;
    self->_decelerationOffset = 0;
  }
  -[ABCarouselView setBounds:](self, "setBounds:", v10, v4, v6, v8);
  id v13 = [(ABCarouselView *)self traitCollection];
  uint64_t v14 = [v13 layoutDirection];

  [(ABFloatSpringProperty *)self->_offsetSpring output];
  double v16 = v15;
  [(ABCarouselView *)self _itemPageWidth];
  double v18 = round(v16 / v17);
  if (v14 == 1) {
    double v18 = (double)(unint64_t)([(NSMutableArray *)self->_itemViews count] - 1) - v18;
  }
  if ([(NSMutableArray *)self->_itemViews count])
  {
    uint64_t v19 = 0;
    double v20 = (double)(uint64_t)v18;
    do
    {
      int v21 = [(NSMutableArray *)self->_itemViews objectAtIndexedSubscript:v19];
      double v22 = (double)v19 - v20;
      if (v22 < 0.0) {
        double v22 = -v22;
      }
      double v23 = fmax(v22, 0.0);
      if (v23 > 1.0) {
        double v23 = 1.0;
      }
      double v24 = ABClamp(v23, 0.0, 1.0);
      long long v25 = [(NSArray *)self->_items objectAtIndexedSubscript:v19];
      double v26 = 0.2;
      if (v25)
      {
        if (v25[8]) {
          double v26 = 1.0;
        }
        else {
          double v26 = 0.2;
        }
      }

      [v21 setAlpha:v26 * 0.55 + v24 * (v26 * 0.25 - v26 * 0.55)];
      if (self->_alphaBlend && [(NSIndexSet *)self->_indexesToApplyAlphaBlend containsIndex:v19])
      {
        [(NSNumber *)self->_alphaBlend doubleValue];
        double v28 = v27;
        [v21 alpha];
        [v21 setAlpha:v28 * v29];
      }
      CGAffineTransformMakeScale(&v38, v24 * -0.05 + 1.0, v24 * -0.05 + 1.0);
      CGAffineTransform v37 = v38;
      [v21 setTransform:&v37];

      ++v19;
    }
    while (v19 < (unint64_t)[(NSMutableArray *)self->_itemViews count]);
  }
  [(ABFloatSpringProperty *)self->_offsetSpring input];
  double v31 = v30;
  [(ABCarouselView *)self _itemPageWidth];
  int64_t v33 = llround(v31 / v32);
  if (v14 == 1) {
    int64_t v33 = [(NSMutableArray *)self->_itemViews count] + ~v33;
  }
  if (self->_selectedIndex != v33)
  {
    self->_selectedIndex = v33;
    [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
    v34 = -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      v36 = -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
      [v36 carouselView:self didSelectItemAtIndex:self->_selectedIndex];
    }
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 60);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_handleScrollGesture:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    double v4 = [v9 view];
    objc_msgSend(v9, "setTranslation:inView:", v4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

    [(ABCarouselView *)self _beginTracking];
  }
  else if ([v9 state] == 2)
  {
    double v5 = [v9 view];
    [v9 translationInView:v5];
    double v7 = v6;

    double v8 = [v9 view];
    objc_msgSend(v9, "setTranslation:inView:", v8, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

    [(ABCarouselView *)self _trackDelta:v7];
  }
  else
  {
    [(ABCarouselView *)self _endTracking];
  }
}

- (void)_handleTapGesture:(id)a3
{
  itemViews = self->_itemViews;
  double v5 = [a3 view];
  int64_t v6 = [(NSMutableArray *)itemViews indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [(ABCarouselView *)self traitCollection];
    uint64_t v8 = [v7 layoutDirection];

    if (v8 == 1) {
      int64_t v6 = [(NSArray *)self->_items count] + ~v6;
    }
    [(ABCarouselView *)self _itemPageWidth];
    double v10 = v9 * (double)v6;
    offsetSpring = self->_offsetSpring;
    [(ABFloatSpringProperty *)offsetSpring setInput:v10];
  }
}

- (void)_addItemViewForItem:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  double v11 = [[ABCarouselItemView alloc] initWithItem:v6];

  [(ABCarouselView *)self addSubview:v11];
  double v7 = [(ABCarouselView *)self traitCollection];
  uint64_t v8 = [v7 layoutDirection];

  int64_t v9 = [(NSArray *)self->_items count] + ~a4;
  if (v8 != 1) {
    int64_t v9 = a4;
  }
  -[ABCarouselItemView setFrame:](v11, "setFrame:", (double)v9 * 49.0 + 0.5 + (double)v9 * 50.0, 0.5, 49.0, 49.0);
  double v10 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__handleTapGesture_];
  [(ABCarouselItemView *)v11 addGestureRecognizer:v10];
  [(NSMutableArray *)self->_itemViews insertObject:v11 atIndex:a4];
}

- (double)_minOffset
{
  return 0.0;
}

- (double)_contentWidth
{
  double v3 = (double)([(NSArray *)self->_items count] - 1);
  return (double)([(NSArray *)self->_items count] - 1) * 50.0 + v3 * 49.0;
}

- (double)_itemPageWidth
{
  [(ABCarouselView *)self _contentWidth];
  double v4 = v3;
  [(ABCarouselView *)self _minOffset];
  return (v4 - v5) / (double)([(NSArray *)self->_items count] - 1);
}

- (void)_beginTracking
{
  double v3 = NSNumber;
  [(ABFloatSpringProperty *)self->_offsetSpring output];
  objc_msgSend(v3, "numberWithDouble:");
  double v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dragInitialOffset = self->_dragInitialOffset;
  self->_dragInitialOffset = v4;

  [(UISelectionFeedbackGenerator *)self->_feedbackGenerator prepare];
  [(ABFloatSpringProperty *)self->_offsetSpring setTrackingBounce:0.0 duration:0.08];
  [(ABFloatSpringProperty *)self->_offsetSpring setTracking:1];
  id v6 = -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 carouselViewWillStartDragging:self];
  }
}

- (void)_trackDelta:(double)a3
{
  [(ABFloatSpringProperty *)self->_offsetSpring input];
  double v6 = v5;
  [(ABCarouselView *)self _minOffset];
  double v8 = v7;
  [(ABCarouselView *)self _contentWidth];
  if (v8 >= v6) {
    double v10 = v8;
  }
  else {
    double v10 = v6;
  }
  if (v10 <= v9) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  double v12 = 10.0;
  if (v6 >= v8) {
    double v13 = 10.0;
  }
  else {
    double v13 = -10.0;
  }
  double v14 = -v13;
  if (v6 >= v8) {
    double v14 = 10.0;
  }
  if (v14 != 0.0) {
    double v11 = v11 + (-1.0 / ((v6 - v11) / v13 + -1.0) + -1.0) / 0.55 * v13;
  }
  double v15 = v11 - a3;
  BOOL v16 = v11 - a3 < v8;
  BOOL v17 = v11 - a3 <= v8;
  if (v11 - a3 >= v8) {
    double v18 = 10.0;
  }
  else {
    double v18 = -10.0;
  }
  if (v17) {
    double v19 = v8;
  }
  else {
    double v19 = v15;
  }
  if (v16) {
    double v12 = -v18;
  }
  if (v19 <= v9) {
    double v9 = v19;
  }
  if (v12 != 0.0) {
    double v9 = v9 + (1.0 - 1.0 / ((v15 - v9) / v18 * 0.55 + 1.0)) * v18;
  }
  [(ABFloatSpringProperty *)self->_offsetSpring setOutput:v9];
  double v20 = -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    [(ABFloatSpringProperty *)self->_offsetSpring output];
    double v23 = v22;
    [(NSNumber *)self->_dragInitialOffset doubleValue];
    [v25 carouselView:self didDragToOffset:v23 initialOffset:v24];
  }
}

- (void)_endTracking
{
  dragInitialOffset = self->_dragInitialOffset;
  self->_dragInitialOffset = 0;

  [(ABFloatSpringProperty *)self->_offsetSpring setTracking:0];
  [(UIViewFloatAnimatableProperty *)self->_offsetSpring velocity];
  double v5 = v4;
  [(ABFloatSpringProperty *)self->_offsetSpring projectForDeceleration:0.992];
  double v7 = v6;
  [(ABCarouselView *)self _minOffset];
  if (v7 >= v8 && ([(ABCarouselView *)self _contentWidth], v7 <= v9))
  {
    offsetSpring = self->_offsetSpring;
    double v12 = -v5;
    if (v5 >= 0.0) {
      double v12 = v5;
    }
    double v11 = v12 * 0.05 / 1000.0 + 0.45;
  }
  else
  {
    offsetSpring = self->_offsetSpring;
    double v11 = 0.55;
  }
  [(ABFloatSpringProperty *)offsetSpring setBounce:0.175 duration:v11];
  [(ABCarouselView *)self _itemPageWidth];
  double v14 = v13 * round(v7 / v13);
  [(ABCarouselView *)self _minOffset];
  double v16 = v15;
  [(ABCarouselView *)self _contentWidth];
  [(ABFloatSpringProperty *)self->_offsetSpring setInput:ABClamp(v14, v16, v17)];
  double v18 = NSNumber;
  [(ABFloatSpringProperty *)self->_offsetSpring input];
  objc_msgSend(v18, "numberWithDouble:");
  double v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  decelerationOffset = self->_decelerationOffset;
  self->_decelerationOffset = v19;

  char v21 = self->_dragInitialOffset;
  self->_dragInitialOffset = 0;

  double v22 = -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    -[ABCarouselView delegate]((id *)&self->super.super.super.super.super.isa);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    [v24 carouselViewWillEndDragging:self];
  }
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 60, a2);
  }
  return result;
}

- (uint64_t)scrollGestureRecognizer
{
  if (result) {
    return *(void *)(result + 488);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_indexesToApplyAlphaBlend, 0);
  objc_storeStrong((id *)&self->_alphaBlend, 0);
  objc_storeStrong((id *)&self->_decelerationOffset, 0);
  objc_storeStrong((id *)&self->_dragInitialOffset, 0);
  objc_storeStrong((id *)&self->_offsetSpring, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end