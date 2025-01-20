@interface AVMobileChromelessContainerView
- (AVMobileChromelessContainerViewDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)itemViews;
- (double)spacing;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setItemViews:(id)a3;
- (void)setSpacing:(double)a3;
@end

@implementation AVMobileChromelessContainerView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_itemViews, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessContainerViewDelegate *)WeakRetained;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (CGSize)intrinsicContentSize
{
  -[AVMobileChromelessContainerView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_itemViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v20;
    double v10 = 0.0;
    double v11 = 0.0;
LABEL_3:
    uint64_t v12 = 0;
    int v13 = v8;
    v8 += v7;
    double v14 = v11;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v5);
      }
      objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "intrinsicContentSize", (void)v19);
      double v11 = v14 + v15;
      if (v14 + v15 + (double)(v13 + (int)v12) * self->_spacing > width) {
        break;
      }
      if (v10 < v16) {
        double v10 = v16;
      }
      ++v12;
      double v14 = v14 + v15;
      if (v7 == v12)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  UISizeRoundToViewScale();
  result.height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)AVMobileChromelessContainerView;
  [(AVView *)&v32 layoutSubviews];
  [(AVMobileChromelessContainerView *)self bounds];
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_itemViews, "count"));
  [(AVMobileChromelessContainerView *)self bounds];
  UIRoundToViewScale();
  double v5 = v4;
  memset(v33, 0, sizeof(v33));
  uint64_t v6 = self->_itemViews;
  if ([(NSArray *)v6 countByEnumeratingWithState:v33 objects:v35 count:16])
  {
    uint64_t v7 = (void *)**((void **)&v33[0] + 1);
    [**((id **)&v33[0] + 1) baselineOffsetFromBottom];
    [v7 intrinsicContentSize];
    [v7 baselineOffsetFromBottom];
    UIRoundToViewScale();
    double v5 = v8;
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = self->_itemViews;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v15 intrinsicContentSize];
        double v17 = v16;
        double v19 = v18;
        [v15 baselineOffsetFromBottom];
        double v21 = v5 + v20 - v19;
        [(AVMobileChromelessContainerView *)self bounds];
        float MaxX = CGRectGetMaxX(v37);
        v38.origin.x = v13;
        v38.origin.y = v21;
        v38.size.double width = v17;
        v38.size.height = v19;
        float v23 = CGRectGetMaxX(v38);
        BOOL v24 = vabds_f32(MaxX, v23) >= 0.00000011921 && MaxX < v23;
        [v15 setHidden:v24];
        if (v24) {
          [v3 addObject:v15];
        }
        objc_msgSend(v15, "avkit_setFrame:inLayoutDirection:", -[AVMobileChromelessContainerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), v13, v21, v17, v19);
        [(AVMobileChromelessContainerView *)self spacing];
        double v13 = v13 + v17 + v25;
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v11);
  }

  v26 = [(AVMobileChromelessContainerView *)self delegate];

  if (v26)
  {
    v27 = [(AVMobileChromelessContainerView *)self delegate];
    [v27 containerView:self layoutWithHiddenViews:v3];
  }
}

- (void)setItemViews:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = (NSArray *)a3;
  itemViews = self->_itemViews;
  if (itemViews != v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = itemViews;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_itemViews, a3);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = self->_itemViews;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[AVMobileChromelessContainerView addSubview:](self, "addSubview:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }

    [(AVMobileChromelessContainerView *)self invalidateIntrinsicContentSize];
    double v17 = [(AVMobileChromelessContainerView *)self superview];
    objc_msgSend(v17, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);
  }
}

@end