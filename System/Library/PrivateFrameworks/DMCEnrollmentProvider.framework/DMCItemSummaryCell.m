@interface DMCItemSummaryCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (DMCItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)detailViews;
- (double)detailLabelOriginX;
- (void)createViewWithDescriptors:(id)a3;
- (void)createViewWithItemDetailArray:(id)a3;
- (void)layoutSubviews;
- (void)setDetailLabelOriginX:(double)a3;
- (void)setDetailViews:(id)a3;
@end

@implementation DMCItemSummaryCell

- (DMCItemSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DMCItemSummaryCell;
  v4 = [(DMCItemSummaryCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(DMCItemSummaryCell *)v4 setSelectionStyle:0];
    v5->_detailLabelOriginX = -1.0;
  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)DMCItemSummaryCell;
  [(DMCItemSummaryCell *)&v23 layoutSubviews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(DMCItemSummaryCell *)self detailViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    double v7 = 12.0;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        v10 = [(DMCItemSummaryCell *)self contentView];
        [v10 frame];
        double v12 = v11;
        double v14 = v13;

        objc_msgSend(v9, "sizeThatFits:", v12 + -20.0, v14);
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        v26.origin.x = 10.0;
        v26.origin.y = v7;
        v26.size.width = v16;
        v26.size.height = v18;
        CGRect v27 = CGRectIntegral(v26);
        objc_msgSend(v9, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
        v28.origin.x = 10.0;
        v28.origin.y = v7;
        v28.size.width = v16;
        v28.size.height = v18;
        double v7 = CGRectGetMaxY(v28) + 10.0;
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v37 = *MEMORY[0x263EF8340];
  double detailLabelOriginX = self->_detailLabelOriginX;
  if (detailLabelOriginX < 0.0)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v6 = [(DMCItemSummaryCell *)self detailViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "desiredValueLabelOriginXForSize:", width + -20.0, 3.40282347e38);
          if (v12 > v10) {
            double v10 = v12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
    }

    +[DMCProfileKeyValueView defaultPreferredValueLabelOriginX];
    if (v10 > v13) {
      double detailLabelOriginX = v10;
    }
    else {
      double detailLabelOriginX = v13;
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v14 = [(DMCItemSummaryCell *)self detailViews];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    double v18 = 12.0;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        [v20 setPreferredValueLabelOriginX:detailLabelOriginX];
        objc_msgSend(v20, "sizeThatFits:", width + -20.0, 3.40282347e38);
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        v39.origin.x = 10.0;
        v39.origin.y = v18;
        v39.size.double width = v22;
        v39.size.height = v24;
        CGRect v40 = CGRectIntegral(v39);
        objc_msgSend(v20, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
        v41.origin.x = 10.0;
        v41.origin.y = v18;
        v41.size.double width = v22;
        v41.size.height = v24;
        double v18 = CGRectGetMaxY(v41) + 10.0;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }
  else
  {
    double v18 = 12.0;
  }

  double v25 = width;
  double v26 = v18;
  result.height = v26;
  result.double width = v25;
  return result;
}

- (void)setDetailLabelOriginX:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_detailLabelOriginX != a3)
  {
    self->_double detailLabelOriginX = a3 + -10.0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(DMCItemSummaryCell *)self detailViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPreferredValueLabelOriginX:self->_detailLabelOriginX];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(DMCItemSummaryCell *)self setNeedsLayout];
  }
}

- (void)createViewWithDescriptors:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(DMCItemSummaryCell *)self detailViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v4 count])
  {
    unint64_t v11 = 0;
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      uint64_t v16 = [v4 objectAtIndex:v11];
      unint64_t v17 = v11 + 1;
      double v18 = [v4 objectAtIndex:v17];
      long long v19 = -[DMCProfileKeyValueView initWithFrame:]([DMCProfileKeyValueView alloc], "initWithFrame:", v12, v13, v14, v15);
      long long v20 = v19;
      if (self->_detailLabelOriginX >= 0.0) {
        -[DMCProfileKeyValueView setPreferredValueLabelOriginX:](v19, "setPreferredValueLabelOriginX:");
      }
      [(DMCProfileKeyValueView *)v20 setKey:v16 value:v18];
      double v21 = [(DMCItemSummaryCell *)self contentView];
      [v21 addSubview:v20];

      [v10 addObject:v20];
      unint64_t v11 = v17 + 1;
    }
    while (v11 < [v4 count]);
  }
  [(DMCItemSummaryCell *)self setDetailViews:v10];
  [(DMCItemSummaryCell *)self setNeedsLayout];
}

- (void)createViewWithItemDetailArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [(DMCItemSummaryCell *)self detailViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        double v21 = [DMCProfileKeyValueView alloc];
        long long v22 = -[DMCProfileKeyValueView initWithFrame:](v21, "initWithFrame:", v15, v16, v17, v18, (void)v25);
        long long v23 = v22;
        if (self->_detailLabelOriginX >= 0.0) {
          -[DMCProfileKeyValueView setPreferredValueLabelOriginX:](v22, "setPreferredValueLabelOriginX:");
        }
        [(DMCProfileKeyValueView *)v23 setItemDetail:v20];
        long long v24 = [(DMCItemSummaryCell *)self contentView];
        [v24 addSubview:v23];

        [v10 addObject:v23];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }

  [(DMCItemSummaryCell *)self setDetailViews:v10];
  [(DMCItemSummaryCell *)self setNeedsLayout];
}

- (NSArray)detailViews
{
  return self->_detailViews;
}

- (void)setDetailViews:(id)a3
{
}

- (double)detailLabelOriginX
{
  return self->_detailLabelOriginX;
}

- (void).cxx_destruct
{
}

@end