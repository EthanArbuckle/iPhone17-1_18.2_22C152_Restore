@interface BPSStingFeatureCollectionView
- (BOOL)calculatedCellHeights;
- (BPSStingFeatureCollectionDelegate)selectionChangeDelegate;
- (BPSStingFeatureCollectionView)initWithFrame:(CGRect)a3;
- (CGSize)_findLargestCell:(id)a3 withCell:(id)a4;
- (NSArray)proActivities;
- (NSIndexPath)selectedIndexPath;
- (double)preferredCellHeight;
- (double)preferredCellWidth;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)setCalculatedCellHeights:(BOOL)a3;
- (void)setPreferredCellHeight:(double)a3;
- (void)setPreferredCellWidth:(double)a3;
- (void)setProActivities:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectionChangeDelegate:(id)a3;
@end

@implementation BPSStingFeatureCollectionView

- (BPSStingFeatureCollectionView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_new();
  [v8 setScrollDirection:1];
  [v8 setMinimumLineSpacing:0.0];
  [v8 setMinimumInteritemSpacing:0.0];
  objc_msgSend(v8, "setEstimatedItemSize:", 127.0, 106.0);
  v17.receiver = self;
  v17.super_class = (Class)BPSStingFeatureCollectionView;
  v9 = -[BPSStingFeatureCollectionView initWithFrame:collectionViewLayout:](&v17, "initWithFrame:collectionViewLayout:", v8, x, y, width, height);
  v10 = v9;
  if (v9)
  {
    [(BPSStingFeatureCollectionView *)v9 setDelegate:v9];
    [(BPSStingFeatureCollectionView *)v10 setDataSource:v10];
    [(BPSStingFeatureCollectionView *)v10 setShowsHorizontalScrollIndicator:0];
    v11 = +[UIColor blackColor];
    [(BPSStingFeatureCollectionView *)v10 setBackgroundColor:v11];

    [(BPSStingFeatureCollectionView *)v10 setPreferredCellWidth:127.0];
    [(BPSStingFeatureCollectionView *)v10 setPreferredCellHeight:106.0];
    uint64_t v12 = objc_opt_class();
    v13 = +[BPSStingFeatureCell reuseIdentifier];
    [(BPSStingFeatureCollectionView *)v10 registerClass:v12 forCellWithReuseIdentifier:v13];

    v14 = objc_opt_new();
    v15 = [v14 defaultSetupActionItems];
    [(BPSStingFeatureCollectionView *)v10 setProActivities:v15];
  }
  return v10;
}

- (CGSize)_findLargestCell:(id)a3 withCell:(id)a4
{
  id v5 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(BPSStingFeatureCollectionView *)self proActivities];
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    CGFloat v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = [v12 actionType];
        id v14 = [v13 integerValue];

        v15 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:v14];
        v16 = +[UIImage _systemImageNamed:v15];
        objc_super v17 = [v12 title];
        v18 = +[BPSStingSetupModel subtitleForActionType:v14];
        [v5 setImage:v16 title:v17 subtitle:v18];

        [v5 getPreferredCellSize];
        if (v20 > v10) {
          double v10 = v20;
        }
        if (v19 > v9) {
          CGFloat v9 = v19;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }
  else
  {
    CGFloat v9 = 0.0;
    double v10 = 0.0;
  }

  v21 = +[UIScreen mainScreen];
  [v21 bounds];
  double v23 = v22;
  [(BPSStingFeatureCollectionView *)self frame];
  long double v25 = v23 + v24 * -2.0;

  if (fmod(v25, v9) < 12.0)
  {
    v26 = bps_setup_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "width too close to removing peek, make it a bit wider", buf, 2u);
    }

    CGFloat v9 = v9 + 12.0;
  }
  v27 = bps_setup_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v39.double width = v9;
    v39.double height = v10;
    v28 = NSStringFromCGSize(v39);
    *(_DWORD *)buf = 138412290;
    v37 = v28;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "preferred cell size is: %@", buf, 0xCu);
  }
  double v29 = v9;
  double v30 = v10;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_proActivities count];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a4;
  objc_storeStrong((id *)&self->_selectedIndexPath, a4);
  uint64_t v6 = [(BPSStingFeatureCollectionView *)self selectionChangeDelegate];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(BPSStingFeatureCollectionView *)self selectionChangeDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = [(BPSStingFeatureCollectionView *)self selectionChangeDelegate];
      v11 = -[NSArray objectAtIndexedSubscript:](self->_proActivities, "objectAtIndexedSubscript:", [v12 row]);
      [v10 selectionChanged:v11];
    }
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[BPSStingFeatureCell reuseIdentifier];
  char v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  double v10 = -[NSArray objectAtIndexedSubscript:](self->_proActivities, "objectAtIndexedSubscript:", [v6 row]);
  v11 = [v10 actionType];
  id v12 = [v11 integerValue];

  v13 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:v12];
  if (!self->_calculatedCellHeights)
  {
    [(BPSStingFeatureCollectionView *)self _findLargestCell:v6 withCell:v9];
    double v15 = v14;
    -[BPSStingFeatureCollectionView setPreferredCellWidth:](self, "setPreferredCellWidth:");
    [(BPSStingFeatureCollectionView *)self setPreferredCellHeight:v15];
    self->_calculatedCellHeights = 1;
  }
  [(BPSStingFeatureCollectionView *)self preferredCellWidth];
  objc_msgSend(v9, "setPreferredCellWidth:");
  [(BPSStingFeatureCollectionView *)self preferredCellHeight];
  objc_msgSend(v9, "setPreferredCellHeight:");
  v16 = +[UIImage _systemImageNamed:v13];
  objc_super v17 = -[NSArray objectAtIndexedSubscript:](self->_proActivities, "objectAtIndexedSubscript:", [v6 row]);
  v18 = [v17 title];
  double v19 = +[BPSStingSetupModel subtitleForActionType:v12];
  [v9 setImage:v16 title:v18 subtitle:v19];

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (![v7 row] && !self->_selectedIndexPath)
  {
    [v8 setSelected:1];
    [(BPSStingFeatureCollectionView *)self selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
    [(BPSStingFeatureCollectionView *)self collectionView:self didSelectItemAtIndexPath:v7];
  }
  if (([v8 isSelected] & 1) == 0
    && [(NSIndexPath *)self->_selectedIndexPath isEqual:v7])
  {
    [v8 setSelected:1];
  }
}

- (BPSStingFeatureCollectionDelegate)selectionChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionChangeDelegate);

  return (BPSStingFeatureCollectionDelegate *)WeakRetained;
}

- (void)setSelectionChangeDelegate:(id)a3
{
}

- (double)preferredCellWidth
{
  return self->_preferredCellWidth;
}

- (void)setPreferredCellWidth:(double)a3
{
  self->_preferredCellWidth = a3;
}

- (double)preferredCellHeight
{
  return self->_preferredCellHeight;
}

- (void)setPreferredCellHeight:(double)a3
{
  self->_preferredCellHeight = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSArray)proActivities
{
  return self->_proActivities;
}

- (void)setProActivities:(id)a3
{
}

- (BOOL)calculatedCellHeights
{
  return self->_calculatedCellHeights;
}

- (void)setCalculatedCellHeights:(BOOL)a3
{
  self->_calculatedCellHeights = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proActivities, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);

  objc_destroyWeak((id *)&self->_selectionChangeDelegate);
}

@end