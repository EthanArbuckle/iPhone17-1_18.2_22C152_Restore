@interface AVTGroupListCollectionView
- (AVTGroupListCollectionView)initWithGroupItems:(id)a3 environment:(id)a4;
- (AVTGroupPickerDelegate)delegate;
- (CALayer)border;
- (NSArray)groupItems;
- (UICollectionView)collectionView;
- (double)borderWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)selectedGroupIndex;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setBorder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedGroupIndex:(int64_t)a3;
- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setupBorder;
- (void)setupView;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCollectionLayoutItemSize:(id)a3;
@end

@implementation AVTGroupListCollectionView

- (AVTGroupListCollectionView)initWithGroupItems:(id)a3 environment:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTGroupListCollectionView;
  v7 = -[AVTGroupListCollectionView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_groupItems, a3);
    [(AVTGroupListCollectionView *)v8 setupView];
    [(AVTGroupListCollectionView *)v8 setupBorder];
  }

  return v8;
}

- (void)setupBorder
{
  v3 = [MEMORY[0x263F157E8] layer];
  border = self->_border;
  self->_border = v3;

  id v5 = +[AVTUIColorRepository separatorColor];
  -[CALayer setBackgroundColor:](self->_border, "setBackgroundColor:", [v5 CGColor]);

  id v6 = [(AVTGroupListCollectionView *)self layer];
  [v6 addSublayer:self->_border];
}

- (void)setupView
{
  id v10 = objc_alloc_init(MEMORY[0x263F1C508]);
  objc_msgSend(v10, "setSectionInset:", 10.0, 10.0, 10.0, 10.0);
  [v10 setMinimumInteritemSpacing:0.0];
  [v10 setMinimumLineSpacing:0.0];
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  [(AVTGroupListCollectionView *)self bounds];
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10);
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  id v6 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v6];

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  v7 = self->_collectionView;
  uint64_t v8 = objc_opt_class();
  v9 = +[AVTGroupListCollectionViewCell cellIdentifier];
  [(UICollectionView *)v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  [(AVTGroupListCollectionView *)self addSubview:self->_collectionView];
}

- (double)borderWidth
{
  return AVTRoundToViewScale(self, 1.0);
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)AVTGroupListCollectionView;
  [(AVTGroupListCollectionView *)&v23 layoutSubviews];
  id v3 = [(AVTGroupListCollectionView *)self collectionView];
  v4 = [v3 collectionViewLayout];
  [(AVTGroupListCollectionView *)self updateCollectionLayoutItemSize:v4];

  [(AVTGroupListCollectionView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(AVTGroupListCollectionView *)self collectionView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = [(AVTGroupListCollectionView *)self traitCollection];
  double v15 = 0.0;
  if ([v14 layoutDirection] != 1)
  {
    [(AVTGroupListCollectionView *)self bounds];
    double v17 = v16;
    [(AVTGroupListCollectionView *)self borderWidth];
    double v15 = v17 - v18;
  }

  [(AVTGroupListCollectionView *)self borderWidth];
  double v20 = v19;
  [(AVTGroupListCollectionView *)self bounds];
  double Height = CGRectGetHeight(v24);
  v22 = [(AVTGroupListCollectionView *)self border];
  objc_msgSend(v22, "setFrame:", v15, 0.0, v20, Height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVTGroupListCollectionView;
  id v4 = a3;
  [(AVTGroupListCollectionView *)&v10 traitCollectionDidChange:v4];
  id v5 = +[AVTUIColorRepository separatorColor];
  -[CALayer setBackgroundColor:](self->_border, "setBackgroundColor:", [v5 CGColor]);

  uint64_t v6 = [v4 userInterfaceStyle];
  double v7 = [(AVTGroupListCollectionView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    double v9 = [(AVTGroupListCollectionView *)self collectionView];
    [v9 reloadData];
  }
}

- (void)updateCollectionLayoutItemSize:(id)a3
{
  id v9 = a3;
  [(AVTGroupListCollectionView *)self bounds];
  double v5 = v4;
  [v9 sectionInset];
  double v7 = v6;
  [v9 sectionInset];
  objc_msgSend(v9, "setEstimatedItemSize:", v5 - (v7 + v8), 10.0);
  [v9 invalidateLayout];
}

- (void)reloadData
{
  id v2 = [(AVTGroupListCollectionView *)self collectionView];
  [v2 reloadData];
}

- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4
{
  id v6 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  double v5 = [(AVTGroupListCollectionView *)self collectionView];
  [v5 selectItemAtIndexPath:v6 animated:1 scrollPosition:2];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(AVTGroupListCollectionView *)self groupItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[AVTGroupListCollectionViewCell cellIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  objc_super v10 = [(AVTGroupListCollectionView *)self groupItems];
  uint64_t v11 = [v6 item];

  double v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [v12 localizedName];
  [v9 setTitle:v13];

  v14 = [v12 symbolNameProvider];
  double v15 = [(AVTGroupListCollectionView *)self traitCollection];
  double v16 = v14[2](v14, [v15 userInterfaceStyle]);
  [v9 setSymbolName:v16];

  return v9;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(AVTGroupListCollectionView *)self delegate];
  uint64_t v6 = [v5 item];

  [v7 groupPicker:self didDeselectGroupAtIndex:v6];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(AVTGroupListCollectionView *)self delegate];
  uint64_t v6 = [v5 item];

  [v7 groupPicker:self didSelectGroupAtIndex:v6 tapped:1];
}

- (AVTGroupPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTGroupPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (int64_t)selectedGroupIndex
{
  return self->selectedGroupIndex;
}

- (void)setSelectedGroupIndex:(int64_t)a3
{
  self->selectedGroupIndex = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (CALayer)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end