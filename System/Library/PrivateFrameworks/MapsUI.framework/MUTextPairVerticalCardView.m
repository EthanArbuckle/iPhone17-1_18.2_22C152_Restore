@interface MUTextPairVerticalCardView
- (MUTextPairVerticalCardView)initWithFrame:(CGRect)a3;
- (NSArray)viewModels;
- (void)_recalculateStackingIfNeeded;
- (void)_updateAppearance;
- (void)_updateInsets;
- (void)layoutSubviews;
- (void)setViewModels:(id)a3;
@end

@implementation MUTextPairVerticalCardView

- (MUTextPairVerticalCardView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUTextPairVerticalCardView;
  v3 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v6, sel_initWithShowsSeparators_, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUTextPairVerticalCardView *)v3 setAccessibilityIdentifier:@"TextPairVerticalCard"];
    [(MUTextPairVerticalCardView *)v4 _updateInsets];
  }
  return v4;
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_viewModels, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUTextPairVerticalCardView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(MUStackView *)self arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MUPlaceVerticalCardContainerView *)self removeArrangedSubview:*(void *)(*((void *)&v24 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->_viewModels;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        v18 = [MUTextPairView alloc];
        v19 = -[MUTextPairView initWithFrame:](v18, "initWithFrame:", v12, v13, v14, v15, (void)v20);
        [(MUTextPairView *)v19 setViewModel:v17];
        [(MUStackView *)self addArrangedSubview:v19];

        ++v16;
      }
      while (v10 != v16);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)_updateInsets
{
  int64_t v3 = +[MUInfoCardStyle containerStyle];
  double v4 = 16.0;
  if (v3 == 1) {
    double v4 = 0.0;
  }
  -[MUStackView setContentEdgeInsets:](self, "setContentEdgeInsets:", v4, 16.0, v4, 16.0);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUTextPairVerticalCardView;
  [(MUTextPairVerticalCardView *)&v4 layoutSubviews];
  [(MUTextPairVerticalCardView *)self _recalculateStackingIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)MUTextPairVerticalCardView;
  [(MUTextPairVerticalCardView *)&v3 layoutSubviews];
}

- (void)_recalculateStackingIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = [(MUStackView *)self arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [(MUTextPairVerticalCardView *)self bounds];
        if ([v7 shouldStackForProposedWidth:CGRectGetWidth(v24) + -16.0 + -16.0])
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = [(MUStackView *)self arrangedSubviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * j) setStacked:v4];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
}

@end