@interface CertUIItemDetailsSummaryCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (CertUIItemDetailsSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)detailViews;
- (double)detailLabelOriginX;
- (void)createViewWithDescriptors:(id)a3;
- (void)createViewWithItemDetailArray:(id)a3;
- (void)layoutSubviews;
- (void)setDetailLabelOriginX:(double)a3;
- (void)setDetailViews:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CertUIItemDetailsSummaryCell

- (CertUIItemDetailsSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CertUIItemDetailsSummaryCell;
  v4 = [(CertUIItemDetailsSummaryCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CertUIItemDetailsSummaryCell *)v4 setSelectionStyle:0];
    v5->_detailLabelOriginX = -1.0;
  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)CertUIItemDetailsSummaryCell;
  [(CertUIItemDetailsSummaryCell *)&v23 layoutSubviews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(CertUIItemDetailsSummaryCell *)self detailViews];
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
        v10 = [(CertUIItemDetailsSummaryCell *)self contentView];
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
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(CertUIItemDetailsSummaryCell *)self detailViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 12.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "sizeThatFits:", width + -20.0, 3.40282347e38);
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        v24.origin.x = 10.0;
        v24.origin.y = v8;
        v24.size.double width = v12;
        v24.size.height = v14;
        CGRect v25 = CGRectIntegral(v24);
        objc_msgSend(v10, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
        v26.origin.x = 10.0;
        v26.origin.y = v8;
        v26.size.double width = v12;
        v26.size.height = v14;
        double v8 = CGRectGetMaxY(v26) + 10.0;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 12.0;
  }

  double v15 = width;
  double v16 = v8;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CertUIItemDetailsSummaryCell;
  [(CertUIItemDetailsSummaryCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setDetailLabelOriginX:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_detailLabelOriginX != a3)
  {
    self->_detailLabelOriginX = a3 + -10.0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v4 = [(CertUIItemDetailsSummaryCell *)self detailViews];
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

    [(CertUIItemDetailsSummaryCell *)self setNeedsLayout];
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
  uint64_t v5 = [(CertUIItemDetailsSummaryCell *)self detailViews];
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
      double v16 = [v4 objectAtIndex:v11];
      unint64_t v17 = v11 + 1;
      long long v18 = [v4 objectAtIndex:v17];
      long long v19 = -[CertUIKeyValueView initWithFrame:]([CertUIKeyValueView alloc], "initWithFrame:", v12, v13, v14, v15);
      long long v20 = v19;
      if (self->_detailLabelOriginX >= 0.0) {
        -[CertUIKeyValueView setPreferredValueLabelOriginX:](v19, "setPreferredValueLabelOriginX:");
      }
      [(CertUIKeyValueView *)v20 setKey:v16 value:v18];
      long long v21 = [(CertUIItemDetailsSummaryCell *)self contentView];
      [v21 addSubview:v20];

      [v10 addObject:v20];
      unint64_t v11 = v17 + 1;
    }
    while (v11 < [v4 count]);
  }
  [(CertUIItemDetailsSummaryCell *)self setDetailViews:v10];
  [(CertUIItemDetailsSummaryCell *)self setNeedsLayout];
}

- (void)createViewWithItemDetailArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [(CertUIItemDetailsSummaryCell *)self detailViews];
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
        long long v21 = [CertUIKeyValueView alloc];
        long long v22 = -[CertUIKeyValueView initWithFrame:](v21, "initWithFrame:", v15, v16, v17, v18, (void)v25);
        long long v23 = v22;
        if (self->_detailLabelOriginX >= 0.0) {
          -[CertUIKeyValueView setPreferredValueLabelOriginX:](v22, "setPreferredValueLabelOriginX:");
        }
        [(CertUIKeyValueView *)v23 setItemDetail:v20];
        long long v24 = [(CertUIItemDetailsSummaryCell *)self contentView];
        [v24 addSubview:v23];

        [v10 addObject:v23];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }

  [(CertUIItemDetailsSummaryCell *)self setDetailViews:v10];
  [(CertUIItemDetailsSummaryCell *)self setNeedsLayout];
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