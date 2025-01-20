@interface MUActionGroupSectionView
- (MUActionGroupSectionView)initWithConfiguration:(id)a3;
- (MUActionGroupSectionView)initWithFrame:(CGRect)a3;
- (NSArray)viewModels;
- (void)_updateAppearance;
- (void)setViewModels:(id)a3;
@end

@implementation MUActionGroupSectionView

- (MUActionGroupSectionView)initWithFrame:(CGRect)a3
{
  v4 = +[MUPlaceVerticalCardConfiguration separatorConfiguration];
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  double v6 = 16.0;
  if (IsMacCatalyst) {
    double v7 = 16.0;
  }
  else {
    double v7 = 0.0;
  }
  if (!IsMacCatalyst) {
    double v6 = 56.0;
  }
  objc_msgSend(v4, "setBottomSeparatorInset:", 0.0, v6, 0.0, v7);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v9 stringByReplacingOccurrencesOfString:@"MU" withString:&stru_1EE3BF360];
  [(MUActionGroupSectionView *)self setAccessibilityIdentifier:v10];

  v11 = [(MUActionGroupSectionView *)self initWithConfiguration:v4];
  return v11;
}

- (MUActionGroupSectionView)initWithConfiguration:(id)a3
{
  id v4 = a3;
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  double v6 = 16.0;
  if (IsMacCatalyst) {
    double v7 = 16.0;
  }
  else {
    double v7 = 0.0;
  }
  if (!IsMacCatalyst) {
    double v6 = 56.0;
  }
  objc_msgSend(v4, "setBottomSeparatorInset:", 0.0, v6, 0.0, v7);
  v10.receiver = self;
  v10.super_class = (Class)MUActionGroupSectionView;
  v8 = [(MUPlaceVerticalCardContainerView *)&v10 initWithConfiguration:v4];

  return v8;
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_viewModels, "isEqual:") & 1) == 0)
  {
    id v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUActionGroupSectionView *)self _updateAppearance];
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
  id v4 = self->_viewModels;
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
        v14 = [MUButtonCellRowView alloc];
        v15 = -[MUButtonCellRowView initWithFrame:](v14, "initWithFrame:", v8, v9, v10, v11, (void)v17);
        [(MUButtonCellRowView *)v15 setViewModel:v13];
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

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
}

@end