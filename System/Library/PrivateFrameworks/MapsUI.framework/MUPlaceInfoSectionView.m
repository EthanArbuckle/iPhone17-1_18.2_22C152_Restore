@interface MUPlaceInfoSectionView
- (MUPlaceInfoSectionView)initWithFrame:(CGRect)a3;
- (NSArray)viewModels;
- (id)draggableContent;
- (void)_updateAppearance;
- (void)setViewModels:(id)a3;
@end

@implementation MUPlaceInfoSectionView

- (MUPlaceInfoSectionView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceInfoSectionView;
  return -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v4, sel_initWithShowsSeparators_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    objc_super v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUPlaceInfoSectionView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v4 = self->_viewModels;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        BOOL v14 = [(MUPlaceVerticalCardContainerView *)self isDeveloperPlaceCard];
        v15 = [MULabeledValueActionRowView alloc];
        if (v14) {
          v16 = [(MULabeledValueActionRowView *)v15 initForDeveloperPlaceCard];
        }
        else {
          v16 = -[MULabeledValueActionRowView initWithFrame:](v15, "initWithFrame:", v8, v9, v10, v11);
        }
        v17 = v16;
        [(MULabeledValueActionRowView *)v16 setViewModel:v13];
        [v3 addObject:v17];

        ++v12;
      }
      while (v6 != v12);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v18 = (void *)[v3 copy];
  [(MUPlaceVerticalCardContainerView *)self setRowViews:v18];
}

- (id)draggableContent
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v4 = [(MUStackView *)self arrangedSubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v10 = objc_alloc_init(MUInfoCardDraggableContent);
        [(MUInfoCardDraggableContent *)v10 setView:v9];
        double v11 = [v9 viewModel];
        uint64_t v12 = [v11 valueString];
        [(MUInfoCardDraggableContent *)v10 setDraggableContent:v12];

        -[MUInfoCardDraggableContent setAnalyticsTarget:](v10, "setAnalyticsTarget:", [v11 analyticsTarget]);
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v13 = (void *)[v3 copy];
  return v13;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
}

@end