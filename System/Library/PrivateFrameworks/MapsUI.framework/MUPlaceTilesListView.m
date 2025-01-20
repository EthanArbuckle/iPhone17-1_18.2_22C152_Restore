@interface MUPlaceTilesListView
- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4;
- (MUPlaceTilesListView)initWithConfiguration:(id)a3;
- (MUPlaceTilesListView)initWithFrame:(CGRect)a3;
- (MUPlaceTilesListViewDelegate)listFeedbackDelegate;
- (NSArray)viewModels;
- (void)_commonInit;
- (void)_updateAppearance;
- (void)setListFeedbackDelegate:(id)a3;
- (void)setViewModels:(id)a3;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation MUPlaceTilesListView

- (MUPlaceTilesListView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesListView;
  v3 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v6, sel_initWithShowsSeparators_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUPlaceTilesListView *)v3 _commonInit];
  }
  return v4;
}

- (MUPlaceTilesListView)initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesListView;
  v3 = [(MUPlaceVerticalCardContainerView *)&v6 initWithConfiguration:a3];
  v4 = v3;
  if (v3) {
    [(MUPlaceTilesListView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(MUPlaceVerticalCardContainerView *)self setDelegate:self];
  [(MUPlaceTilesListView *)self setAccessibilityIdentifier:@"PlaceTilesList"];
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUPlaceTilesListView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_viewModels;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        v14 = [MUPlaceTileListContentView alloc];
        v15 = -[MUPlaceTileListContentView initWithFrame:](v14, "initWithFrame:", v8, v9, v10, v11, (void)v17);
        [(MUPlaceTileListContentView *)v15 setViewModel:v13];
        [v3 addObject:v15];

        ++v12;
      }
      while (v6 != v12);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v16 = (void *)[v3 copy];
  [(MUPlaceVerticalCardContainerView *)self setRowViews:v16];
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  -[NSArray objectAtIndexedSubscript:](self->_viewModels, "objectAtIndexedSubscript:", a5, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(MUPlaceTilesListView *)self listFeedbackDelegate];
  [v6 placeTilesListView:self didSelectViewModel:v7];
}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(unint64_t)a4
{
  return 1;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (MUPlaceTilesListViewDelegate)listFeedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listFeedbackDelegate);
  return (MUPlaceTilesListViewDelegate *)WeakRetained;
}

- (void)setListFeedbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listFeedbackDelegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end