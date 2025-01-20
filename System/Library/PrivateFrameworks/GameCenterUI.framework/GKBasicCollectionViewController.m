@interface GKBasicCollectionViewController
- (CGSize)preferredContentSize;
- (GKBasicCollectionViewController)initWithDataSource:(id)a3 title:(id)a4;
- (GKCollectionViewDataSource)initialDataSource;
- (NSArray)metricsForSections;
- (id)target;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureDataSource;
- (void)setDataSource:(id)a3;
- (void)setInitialDataSource:(id)a3;
- (void)setMetricsForSections:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation GKBasicCollectionViewController

- (GKBasicCollectionViewController)initWithDataSource:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(GKGridLayout);
  v12.receiver = self;
  v12.super_class = (Class)GKBasicCollectionViewController;
  v9 = [(GKCollectionViewController *)&v12 initWithCollectionViewLayout:v8];

  if (v9)
  {
    v10 = [(GKBasicCollectionViewController *)v9 navigationItem];
    [v10 setTitle:v7];

    [(GKBasicCollectionViewController *)v9 setInitialDataSource:v6];
  }

  return v9;
}

- (void)setDataSource:(id)a3
{
  v5 = (GKCollectionViewDataSource *)a3;
  if (self->_initialDataSource != v5) {
    objc_storeStrong((id *)&self->_initialDataSource, a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)GKBasicCollectionViewController;
  [(GKCollectionViewController *)&v6 setDataSource:v5];
}

- (void)configureDataSource
{
  v5.receiver = self;
  v5.super_class = (Class)GKBasicCollectionViewController;
  [(GKCollectionViewController *)&v5 configureDataSource];
  if (self->_initialDataSource)
  {
    v3 = [(GKCollectionViewController *)self dataSource];
    initialDataSource = self->_initialDataSource;

    if (v3 != initialDataSource) {
      [(GKBasicCollectionViewController *)self setDataSource:self->_initialDataSource];
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [self->_target collectionViewController:self didSelectItemAtIndexPath:v5];
  }
}

- (CGSize)preferredContentSize
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    BOOL v9 = v6 > 1024.0;
    if (v8 > 1024.0) {
      BOOL v9 = 1;
    }
    double v10 = 320.0;
    if (v9) {
      double v10 = 375.0;
    }
  }
  else
  {
    double v10 = 320.0;
  }
  double v11 = 440.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (NSArray)metricsForSections
{
  return self->_metricsForSections;
}

- (void)setMetricsForSections:(id)a3
{
}

- (GKCollectionViewDataSource)initialDataSource
{
  return self->_initialDataSource;
}

- (void)setInitialDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDataSource, 0);
  objc_storeStrong((id *)&self->_metricsForSections, 0);

  objc_storeStrong(&self->_target, 0);
}

@end