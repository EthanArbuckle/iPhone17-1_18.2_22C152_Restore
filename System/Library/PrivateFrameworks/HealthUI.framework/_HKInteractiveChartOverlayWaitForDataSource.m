@interface _HKInteractiveChartOverlayWaitForDataSource
- (HKGraphSeriesDataSource)dataSource;
- (HKGraphSeriesDataSourceDelegate)previousDelegate;
- (HKInteractiveChartOverlayViewController)overlayController;
- (NSMutableArray)deliveries;
- (_HKInteractiveChartOverlayWaitForCacheData)parent;
- (_HKInteractiveChartOverlayWaitForDataSource)initWithOverlayController:(id)a3 dataSource:(id)a4 parent:(id)a5;
- (void)_requestDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 priorityDelegate:(id)a7;
- (void)addWaitForDataGraphSeriesContext:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 priorityDelegate:(id)a8 completion:(id)a9;
- (void)dataSourceDidUpdateCache:(id)a3;
- (void)setDeliveries:(id)a3;
- (void)setOverlayController:(id)a3;
- (void)setParent:(id)a3;
- (void)setPreviousDelegate:(id)a3;
@end

@implementation _HKInteractiveChartOverlayWaitForDataSource

- (_HKInteractiveChartOverlayWaitForDataSource)initWithOverlayController:(id)a3 dataSource:(id)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_HKInteractiveChartOverlayWaitForDataSource;
  v11 = [(_HKInteractiveChartOverlayWaitForDataSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(_HKInteractiveChartOverlayWaitForDataSource *)v11 setOverlayController:v8];
    [(_HKInteractiveChartOverlayWaitForDataSource *)v12 setParent:v10];
    objc_storeStrong((id *)&v12->_dataSource, a4);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(_HKInteractiveChartOverlayWaitForDataSource *)v12 setDeliveries:v13];

    v14 = [v9 delegate];
    [(_HKInteractiveChartOverlayWaitForDataSource *)v12 setPreviousDelegate:v14];

    [v9 setDelegate:v12];
  }

  return v12;
}

- (void)addWaitForDataGraphSeriesContext:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 priorityDelegate:(id)a8 completion:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  v20 = [_HKInteractiveChartOverlayDeliverCachedData alloc];
  v21 = [(_HKInteractiveChartOverlayWaitForDataSource *)self overlayController];
  v22 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
  v25 = [(_HKInteractiveChartOverlayDeliverCachedData *)v20 initWithOverlayController:v21 dataSource:v22 graphSeriesContext:v19 timeScope:a4 resolution:a5 startDate:v18 endDate:v17 completion:v15];

  v23 = [(_HKInteractiveChartOverlayWaitForDataSource *)self deliveries];
  [v23 addObject:v25];

  [(_HKInteractiveChartOverlayWaitForDataSource *)self _requestDataForTimeScope:a4 resolution:a5 startDate:v18 endDate:v17 priorityDelegate:v16];
}

- (void)_requestDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 priorityDelegate:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  id v14 = a7;
  id v15 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
  id v16 = v15;
  if (v15)
  {
    [v15 blockPathForX:v12 zoom:a3 resolution:a4];
  }
  else
  {
    long long v26 = 0uLL;
    uint64_t v27 = 0;
  }

  long long v24 = 0uLL;
  uint64_t v25 = 0;
  id v17 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
  id v18 = v17;
  if (v17)
  {
    [v17 blockPathForX:v13 zoom:a3 resolution:a4];
  }
  else
  {
    long long v24 = 0uLL;
    uint64_t v25 = 0;
  }

  id v19 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
  long long v22 = v26;
  uint64_t v23 = v27;
  long long v20 = v24;
  uint64_t v21 = v25;
  [v19 blocksRequestedFromPath:&v22 toPath:&v20 priorityDelegate:v14];
}

- (void)dataSourceDidUpdateCache:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [(_HKInteractiveChartOverlayWaitForDataSource *)self deliveries];
  v5 = (void *)[v4 copy];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v12, "deliverDataToCompletion", (void)v22)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v13 = [(_HKInteractiveChartOverlayWaitForDataSource *)self deliveries];
  [v13 removeObjectsInArray:v6];

  id v14 = [(_HKInteractiveChartOverlayWaitForDataSource *)self deliveries];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    id v16 = [(_HKInteractiveChartOverlayWaitForDataSource *)self previousDelegate];
    id v17 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
    [v17 setDelegate:v16];

    id v18 = [(_HKInteractiveChartOverlayWaitForDataSource *)self previousDelegate];

    if (v18)
    {
      id v19 = [(_HKInteractiveChartOverlayWaitForDataSource *)self previousDelegate];
      long long v20 = [(_HKInteractiveChartOverlayWaitForDataSource *)self dataSource];
      [v19 dataSourceDidUpdateCache:v20];
    }
    uint64_t v21 = [(_HKInteractiveChartOverlayWaitForDataSource *)self parent];
    [v21 removeWaitForDataSource:self];
  }
}

- (HKGraphSeriesDataSource)dataSource
{
  return self->_dataSource;
}

- (HKInteractiveChartOverlayViewController)overlayController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayController);
  return (HKInteractiveChartOverlayViewController *)WeakRetained;
}

- (void)setOverlayController:(id)a3
{
}

- (_HKInteractiveChartOverlayWaitForCacheData)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (_HKInteractiveChartOverlayWaitForCacheData *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (HKGraphSeriesDataSourceDelegate)previousDelegate
{
  return self->_previousDelegate;
}

- (void)setPreviousDelegate:(id)a3
{
}

- (NSMutableArray)deliveries
{
  return self->_deliveries;
}

- (void)setDeliveries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveries, 0);
  objc_storeStrong((id *)&self->_previousDelegate, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_overlayController);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end