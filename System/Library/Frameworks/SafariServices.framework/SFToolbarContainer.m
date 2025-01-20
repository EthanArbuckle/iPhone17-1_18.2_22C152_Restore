@interface SFToolbarContainer
- (double)widthRangeUsingNarrowMetrics:(void *)a3 compatibleWithTraitCollection:;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (uint64_t)setMinimumWidth:(uint64_t)result;
- (void)initWithToolbar:(void *)a1;
- (void)layoutSubviews;
- (void)setToolbarInsets:(double)a3;
@end

@implementation SFToolbarContainer

- (void)initWithToolbar:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SFToolbarContainer;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 51, a2);
      [a1 addSubview:a1[51]];
    }
  }

  return a1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFToolbarContainer;
  -[SFToolbarContainer hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SFToolbarContainer *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    [(UIToolbar *)self->_toolbar frame];
    CGFloat v9 = v21.origin.x;
    CGFloat v10 = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
    double MinX = CGRectGetMinX(v21);
    v22.origin.double x = v9;
    v22.origin.double y = v10;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v14 = fmax(MinX, fmin(CGRectGetMaxX(v22) + -1.0, x));
    v23.origin.double x = v9;
    v23.origin.double y = v10;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v23);
    v24.origin.double x = v9;
    v24.origin.double y = v10;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v24);
    toolbar = self->_toolbar;
    -[UIToolbar convertPoint:fromView:](toolbar, "convertPoint:fromView:", self, v14, fmax(MinY, fmin(MaxY + -1.0, y)));
    -[UIToolbar hitTest:withEvent:](toolbar, "hitTest:withEvent:", v7);
    v8 = (SFToolbarContainer *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SFToolbarContainer;
  [(SFToolbarContainer *)&v9 layoutSubviews];
  v3 = [(UIToolbar *)self->_toolbar items];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(SFToolbarContainer *)self bounds];
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v5 + self->_toolbarInsets.left, v6 + self->_toolbarInsets.top, v7 - (self->_toolbarInsets.left + self->_toolbarInsets.right), v8 - (self->_toolbarInsets.top + self->_toolbarInsets.bottom));
  }
  [(SFToolbarContainer *)self setHidden:v4 == 0];
}

- (void)setToolbarInsets:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 54) != a4
      || *((double *)a1 + 53) != a3
      || *((double *)a1 + 56) != a6
      || *((double *)a1 + 55) != a5)
    {
      *((double *)a1 + 53) = a3;
      *((double *)a1 + 54) = a4;
      *((double *)a1 + 55) = a5;
      *((double *)a1 + 56) = a6;
      return (void *)[a1 setNeedsLayout];
    }
  }
  return a1;
}

- (double)widthRangeUsingNarrowMetrics:(void *)a3 compatibleWithTraitCollection:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    double v6 = [*(id *)(a1 + 408) items];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if (a2) {
        double v8 = 10.0;
      }
      else {
        double v8 = 18.0;
      }
      double v9 = 30.0;
      if ((a2 & 1) == 0)
      {
        CGFloat v10 = [MEMORY[0x1E4FB17A8] defaultMetrics];
        [v10 scaledValueForValue:v5 compatibleWithTraitCollection:30.0];
        _SFRoundFloatToPixels();
        double v9 = v11;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v12 = objc_msgSend(*(id *)(a1 + 408), "items", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        double v16 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * i) _width];
            double v16 = v16 + fmax(v18, v9);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
      else
      {
        double v16 = 0.0;
      }

      double v19 = *(double *)(a1 + 432)
          + *(double *)(a1 + 448)
          + fmax(*(double *)(a1 + 416), v16 + (double)(unint64_t)(v7 - 1) * v8);
    }
    else
    {
      double v19 = *(double *)(a1 + 416);
    }
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

- (uint64_t)setMinimumWidth:(uint64_t)result
{
  if (result) {
    *(double *)(result + 416) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end