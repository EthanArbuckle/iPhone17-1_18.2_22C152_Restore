@interface GKGameLayerCollectionDataSource
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)standardCellSizeForCollectionView:(id)a3;
- (GKGameLayerCollectionDataSource)initWithGameRecord:(id)a3;
- (GKGameRecord)gameRecord;
- (NSString)title;
- (UIViewController)presentationViewController;
- (double)cellSpacing;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)itemCount;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setGameRecord:(id)a3;
- (void)setPresentationViewController:(id)a3;
@end

@implementation GKGameLayerCollectionDataSource

- (GKGameLayerCollectionDataSource)initWithGameRecord:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKGameLayerCollectionDataSource;
  v5 = [(GKGameLayerCollectionDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKGameLayerCollectionDataSource *)v5 setGameRecord:v4];
  }

  return v6;
}

- (NSString)title
{
  return (NSString *)&stru_1F07B2408;
}

- (CGSize)standardCellSizeForCollectionView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)cellSpacing
{
  return 0.0;
}

- (int64_t)itemCount
{
  return 0;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1570]);

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v4 = [a3 indexPathsForSelectedItems];
  BOOL v5 = [v4 count] == 0;

  return v5;
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (UIViewController)presentationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationViewController);

  objc_storeStrong((id *)&self->_gameRecord, 0);
}

@end