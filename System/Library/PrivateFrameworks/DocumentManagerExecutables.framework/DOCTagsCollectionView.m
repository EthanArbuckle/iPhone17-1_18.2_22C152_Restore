@interface DOCTagsCollectionView
- (BOOL)showsAddTagButton;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)intrinsicContentSize;
- (CGSize)lastIntrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)result;
- (DOCTagsCollectionView)init;
- (DOCTagsCollectionViewDelegate)delegate;
- (NSArray)nodes;
- (NSDictionary)sizingCells;
- (UICollectionView)collectionView;
- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)tagsData;
- (id)_cellMenuTargetForIndexPath:(id)a3;
- (id)_indexPathOfTag:(id)a3;
- (id)_layout;
- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_reloadData;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)doc_commonInit;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setNodes:(id)a3;
- (void)setShowsAddTagButton:(BOOL)a3;
- (void)setupCells:(id)a3 registerClasses:(BOOL)a4;
- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4;
- (void)updateForChangedTraitsAffectingFonts;
@end

@implementation DOCTagsCollectionView

- (DOCTagsCollectionView)init
{
  v5.receiver = self;
  v5.super_class = (Class)DOCTagsCollectionView;
  v2 = [(DOCTagsCollectionView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DOCTagsCollectionView *)v2 doc_commonInit];
  }
  return v3;
}

- (void)doc_commonInit
{
  v21[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82570]);
  uint64_t v4 = *MEMORY[0x263F83508];
  v20[0] = *MEMORY[0x263F83500];
  v20[1] = v4;
  v21[0] = &unk_26DF54268;
  v21[1] = &unk_26DF54268;
  v20[2] = *MEMORY[0x263F83510];
  v21[2] = &unk_26DF54268;
  objc_super v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v3 _setRowAlignmentsOptions:v5];

  v6 = +[DOCTagAppearance infoCollection];
  [v6 verticalTagSpacing];
  objc_msgSend(v3, "setMinimumLineSpacing:");

  v7 = +[DOCTagAppearance infoCollection];
  [v7 horizontalTagSpacing];
  objc_msgSend(v3, "setMinimumInteritemSpacing:");

  v8 = [MEMORY[0x263EFF8C0] array];
  nodes = self->_nodes;
  self->_nodes = v8;

  self->_showsAddTagButton = 1;
  id v10 = objc_alloc(MEMORY[0x263F82528]);
  [(DOCTagsCollectionView *)self bounds];
  v11 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v11;

  [(UICollectionView *)self->_collectionView setOpaque:0];
  [(UICollectionView *)self->_collectionView setBackgroundColor:0];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  v18[0] = @"TagCellIdentifier";
  v18[1] = @"AddTagCellIdentifier";
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [(DOCTagsCollectionView *)self setupCells:v13 registerClasses:1];

  [(UICollectionView *)self->_collectionView setAutoresizingMask:2];
  v14 = objc_alloc_init(_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData);
  tagsData = self->_tagsData;
  self->_tagsData = v14;

  [(DOCTagsCollectionViewData *)self->_tagsData setDelegate:self];
  [(DOCTagsCollectionView *)self updateForChangedTraitsAffectingFonts];
  v16 = objc_msgSend(MEMORY[0x263F82DA0], "doc_traitsAffectingFonts");
  id v17 = (id)[(DOCTagsCollectionView *)self registerForTraitChanges:v16 withAction:sel_updateForChangedTraitsAffectingFonts];

  [(DOCTagsCollectionView *)self addSubview:self->_collectionView];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)DOCTagsCollectionView;
  [(DOCTagsCollectionView *)&v20 layoutSubviews];
  id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;
  double v7 = v6;
  p_lastIntrinsicContentSize = &self->_lastIntrinsicContentSize;
  double width = self->_lastIntrinsicContentSize.width;
  double height = self->_lastIntrinsicContentSize.height;

  if (v5 != width || v7 != height)
  {
    v12 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v12 collectionViewContentSize];
    p_lastIntrinsicContentSize->double width = v13;
    self->_lastIntrinsicContentSize.double height = v14;

    [(UICollectionView *)self->_collectionView frame];
    double v16 = v15;
    double v17 = self->_lastIntrinsicContentSize.height;
    if (p_lastIntrinsicContentSize->width != v18 || v17 != v16) {
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), p_lastIntrinsicContentSize->width, v17);
    }
    [(DOCTagsCollectionView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setShowsAddTagButton:(BOOL)a3
{
  if (self->_showsAddTagButton != a3)
  {
    self->_showsAddTagButton = a3;
    [(DOCTagsCollectionView *)self _reloadData];
  }
}

- (CGSize)intrinsicContentSize
{
  double width = self->_lastIntrinsicContentSize.width;
  double height = self->_lastIntrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result
{
  double height = self->_lastIntrinsicContentSize.height;
  result.double height = height;
  return result;
}

- (void)setNodes:(id)a3
{
}

- (void)_reloadData
{
  [(UICollectionView *)self->_collectionView reloadData];

  [(DOCTagsCollectionView *)self setNeedsLayout];
}

- (void)setupCells:(id)a3 registerClasses:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  double v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        CGFloat v14 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v17);
        id v15 = objc_alloc_init(v14);
        [(NSDictionary *)v7 setObject:v15 forKeyedSubscript:v13];
        if (v4) {
          [(UICollectionView *)self->_collectionView registerClass:v14 forCellWithReuseIdentifier:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  sizingCells = self->_sizingCells;
  self->_sizingCells = v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(DOCTagsCollectionViewData *)self->_tagsData countOfTags] + self->_showsAddTagButton;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__DOCTagsCollectionView_collectionView_cellForItemAtIndexPath___block_invoke;
  v12[3] = &unk_2648FB568;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = [(DOCTagsCollectionView *)self cellForIndexPath:v8 dequeueCell:v12];

  return v10;
}

uint64_t __63__DOCTagsCollectionView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dequeueReusableCellWithReuseIdentifier:a2 forIndexPath:*(void *)(a1 + 40)];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__DOCTagsCollectionView_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
  v12[3] = &unk_2648FB590;
  void v12[4] = self;
  double v5 = [(DOCTagsCollectionView *)self cellForIndexPath:a5 dequeueCell:v12];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

id __70__DOCTagsCollectionView_collectionView_layout_sizeForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 sizingCells];
  double v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 item];
  if (v7 == [(DOCTagsCollectionViewData *)self->_tagsData countOfTags])
  {
    double v8 = [(DOCTagsCollectionView *)self delegate];
    double v9 = [v10 cellForItemAtIndexPath:v6];
    [v8 tagsCollectionView:self didSelectAddTagButton:v9];
  }
}

- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [v6 item];
  int64_t v9 = [(DOCTagsCollectionViewData *)self->_tagsData countOfTags];
  id v10 = (void (*)(void *, __CFString *))v7[2];
  if (v8 == v9)
  {
    double v11 = v10(v7, @"AddTagCellIdentifier");
  }
  else
  {
    double v11 = v10(v7, @"TagCellIdentifier");

    uint64_t v7 = -[DOCTagsCollectionViewData tagAtIndex:](self->_tagsData, "tagAtIndex:", [v6 item]);
    v12 = [v11 tagView];
    [v12 setDelegate:self];

    id v13 = [v11 tagView];
    [v13 setTagValue:v7];

    BOOL v14 = [(DOCTagsCollectionViewData *)self->_tagsData presenceOf:v7] == 1;
    id v15 = [v11 tagView];
    [v15 setIsMixed:v14];
  }

  return v11;
}

- (id)_layout
{
  return [(UICollectionView *)self->_collectionView collectionViewLayout];
}

- (void)updateForChangedTraitsAffectingFonts
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"TagCellIdentifier";
  v6[1] = @"AddTagCellIdentifier";
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(DOCTagsCollectionView *)self setupCells:v3 registerClasses:0];

  self->_lastIntrinsicContentSize.double width = 0.0;
  self->_lastIntrinsicContentSize.double height = 0.0;
  BOOL v4 = [(DOCTagsCollectionView *)self _layout];
  double v5 = +[DOCTagAppearance infoCollection];
  [v5 horizontalTagSpacing];
  objc_msgSend(v4, "setMinimumInteritemSpacing:");

  [v4 invalidateLayout];
  [(DOCTagsCollectionView *)self invalidateIntrinsicContentSize];
  [(DOCTagsCollectionView *)self setNeedsLayout];
}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DOCTagsCollectionView *)self _indexPathOfTag:v7];
  if (v8)
  {
    int64_t v9 = objc_opt_new();
    v15[0] = v7;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v9 setDeletions:v10];

    [(DOCTagsCollectionViewData *)self->_tagsData applyPendingExternalChange:v9 timeout:1.0];
    double v11 = [(DOCTagsCollectionView *)self collectionView];
    BOOL v14 = v8;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [v11 deleteItemsAtIndexPaths:v12];

    id v13 = [(DOCTagsCollectionView *)self delegate];
    [v13 tagsCollectionItem:v6 didDeleteTag:v7];
  }
}

- (id)_indexPathOfTag:(id)a3
{
  int64_t v3 = [(DOCTagsCollectionViewData *)self->_tagsData indexOfTag:a3];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F088C8] indexPathForRow:v3 inSection:0];
  }

  return v4;
}

- (id)_cellMenuTargetForIndexPath:(id)a3
{
  int64_t v3 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:a3];
  BOOL v4 = objc_msgSend(v3, "doc_tagsCollectionCellMenuTarget");

  return v4;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id v7 = [v6 firstObject];
  uint64_t v8 = [v6 count];

  if (v8 == 1)
  {
    int64_t v9 = [(DOCTagsCollectionView *)self _cellMenuTargetForIndexPath:v7];
    id v10 = [v9 menuForContextMenuPresentation];
    double v11 = v10;
    if (v10
      && ([v10 children],
          v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 count],
          v12,
          v13))
    {
      BOOL v14 = (void *)MEMORY[0x263F82610];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __91__DOCTagsCollectionView_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
      v17[3] = &unk_2648FB5B8;
      id v18 = v11;
      id v15 = [v14 configurationWithIdentifier:0 previewProvider:0 actionProvider:v17];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

id __91__DOCTagsCollectionView_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  double v5 = objc_msgSend(a3, "cellForItemAtIndexPath:", a5, a4);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [v5 tagView];
    [v6 cornerRadius];

    id v7 = objc_alloc_init(MEMORY[0x263F82AD0]);
    uint64_t v8 = (void *)MEMORY[0x263F824C0];
    [v5 bounds];
    int64_t v9 = objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:");
    [v7 setVisiblePath:v9];

    id v10 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v5 parameters:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = +[DOCTagAppearance infoCollection];
  [v7 dimmingAlphaDuringMenuPresentation];
  double v9 = v8;

  if (v9 != 1.0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __89__DOCTagsCollectionView_collectionView_willDisplayContextMenuWithConfiguration_animator___block_invoke;
    v10[3] = &unk_2648FB5E0;
    v10[4] = self;
    *(double *)&v10[5] = v9;
    [v6 addAnimations:v10];
  }
}

uint64_t __89__DOCTagsCollectionView_collectionView_willDisplayContextMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = +[DOCTagAppearance infoCollection];
  [v7 dimmingAlphaDuringMenuPresentation];
  double v9 = v8;

  if (v9 != 1.0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __96__DOCTagsCollectionView_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
    v10[3] = &unk_2648FB608;
    v10[4] = self;
    [v6 addAnimations:v10];
  }
}

uint64_t __96__DOCTagsCollectionView_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (DOCTagsCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCTagsCollectionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (BOOL)showsAddTagButton
{
  return self->_showsAddTagButton;
}

- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)tagsData
{
  return self->_tagsData;
}

- (CGSize)lastIntrinsicContentSize
{
  double width = self->_lastIntrinsicContentSize.width;
  double height = self->_lastIntrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSDictionary)sizingCells
{
  return self->_sizingCells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingCells, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tagsData, 0);
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end