@interface MKTransitSystemFilterView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MKTransitSystemFilterView)initWithFrame:(CGRect)a3;
- (MKTransitSystemFilterViewDelegate)delegate;
- (NSArray)transitSystems;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (unint64_t)selectedIndex;
- (void)_contentSizeDidChange;
- (void)_setupCollectionView;
- (void)_setupConstraints;
- (void)_updateAppearance;
- (void)_updateSegmentPosition;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setTransitSystems:(id)a3;
@end

@implementation MKTransitSystemFilterView

- (MKTransitSystemFilterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitSystemFilterView;
  v3 = -[MKTransitSystemFilterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKTransitSystemFilterView *)v3 _setupCollectionView];
    [(MKTransitSystemFilterView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupCollectionView
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [v10 setMinimumInteritemSpacing:8.0];
  [v10 setScrollDirection:1];
  id v3 = objc_alloc(MEMORY[0x1E4F42858]);
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [MEMORY[0x1E4F428B8] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v6];

  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"filterCell"];
  [(MKTransitSystemFilterView *)self addSubview:self->_collectionView];
  v7 = (UICollectionViewDiffableDataSource *)[objc_alloc(MEMORY[0x1E4F42880]) initWithCollectionView:self->_collectionView cellProvider:&__block_literal_global_76];
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

id __49__MKTransitSystemFilterView__setupCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v8 conformsToProtocol:&unk_1EDA43670])
  {
    v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:v7];
    id v10 = [v8 name];
    [v9 setTitleText:v10];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setupConstraints
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(UICollectionView *)self->_collectionView heightAnchor];
  v4 = [v3 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v4;

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v19 = [(MKTransitSystemFilterView *)self leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v17 = [(UICollectionView *)self->_collectionView trailingAnchor];
  id v6 = [(MKTransitSystemFilterView *)self trailingAnchor];
  id v7 = [v17 constraintEqualToAnchor:v6];
  v21[1] = v7;
  id v8 = [(UICollectionView *)self->_collectionView topAnchor];
  v9 = [(MKTransitSystemFilterView *)self topAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v21[2] = v10;
  v11 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v12 = [(MKTransitSystemFilterView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v14 = self->_heightConstraint;
  v21[3] = v13;
  v21[4] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  [v16 activateConstraints:v15];

  [(MKTransitSystemFilterView *)self _contentSizeDidChange];
}

- (void)setTransitSystems:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_transitSystems, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    transitSystems = self->_transitSystems;
    self->_transitSystems = v4;

    [(MKTransitSystemFilterView *)self _updateAppearance];
    [(MKTransitSystemFilterView *)self _updateSegmentPosition];
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    [(MKTransitSystemFilterView *)self _updateSegmentPosition];
  }
}

- (void)_updateSegmentPosition
{
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex < [(NSArray *)self->_transitSystems count])
  {
    collectionView = self->_collectionView;
    id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:self->_selectedIndex inSection:0];
    [(UICollectionView *)collectionView selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
}

- (void)_updateAppearance
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F42650]);
  [v4 appendSectionsWithIdentifiers:&unk_1ED97F530];
  id v3 = [(MKTransitSystemFilterView *)self transitSystems];
  [v4 appendItemsWithIdentifiers:v3];

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v4 animatingDifferences:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  if ([v8 row] != self->_selectedIndex)
  {
    self->_unint64_t selectedIndex = [v8 row];
    [(MKTransitSystemFilterView *)self _updateSegmentPosition];
    id v5 = [(MKTransitSystemFilterView *)self transitSystems];
    id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

    id v7 = [(MKTransitSystemFilterView *)self delegate];
    [v7 filterView:self didChangeSystemSelection:v6];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = *MEMORY[0x1E4F42508];
  id v6 = a5;
  id v7 = +[MKFontManager sharedManager];
  id v8 = [v7 sectionHeaderFont];
  v23[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  transitSystems = self->_transitSystems;
  uint64_t v11 = [v6 row];

  v12 = [(NSArray *)transitSystems objectAtIndexedSubscript:v11];
  v13 = [v12 name];
  [v13 sizeWithAttributes:v9];
  double v15 = v14;

  v16 = +[MKFontManager sharedManager];
  v17 = [v16 sectionHeaderFont];
  objc_msgSend(v17, "_mapkit_scaledValueForValue:", 32.0);
  double v19 = v18;

  double v20 = v15 + 12.0 + 12.0;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = [(MKTransitSystemFilterView *)self traitCollection];
  double v7 = 16.0;
  if ([v6 userInterfaceIdiom] == 5) {
    double v8 = 24.0;
  }
  else {
    double v8 = 16.0;
  }
  v9 = [(MKTransitSystemFilterView *)self traitCollection];
  if ([v9 userInterfaceIdiom] == 5) {
    double v7 = 24.0;
  }

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v8;
  double v13 = v7;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (void)_contentSizeDidChange
{
  id v3 = +[MKFontManager sharedManager];
  id v4 = [v3 sectionHeaderFont];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 32.0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  dataSource = self->_dataSource;
  id v6 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  [(UICollectionViewDiffableDataSource *)dataSource applySnapshotUsingReloadData:v6];
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)transitSystems
{
  return self->_transitSystems;
}

- (MKTransitSystemFilterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKTransitSystemFilterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitSystems, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end