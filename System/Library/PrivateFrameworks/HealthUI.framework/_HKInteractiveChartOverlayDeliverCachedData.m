@interface _HKInteractiveChartOverlayDeliverCachedData
- (BOOL)deliverDataToCompletion;
- (HKGraphSeriesDataSource)dataSource;
- (HKInteractiveChartOverlayViewController)overlayController;
- (NSDate)endDate;
- (NSDate)startDate;
- (_HKInteractiveChartOverlayDeliverCachedData)initWithOverlayController:(id)a3 dataSource:(id)a4 graphSeriesContext:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 completion:(id)a10;
- (id)completion;
- (id)graphSeriesContext;
- (int64_t)resolution;
- (int64_t)timeScope;
- (void)setCompletion:(id)a3;
- (void)setOverlayController:(id)a3;
@end

@implementation _HKInteractiveChartOverlayDeliverCachedData

- (_HKInteractiveChartOverlayDeliverCachedData)initWithOverlayController:(id)a3 dataSource:(id)a4 graphSeriesContext:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_HKInteractiveChartOverlayDeliverCachedData;
  v19 = [(_HKInteractiveChartOverlayDeliverCachedData *)&v27 init];
  v20 = v19;
  if (v19)
  {
    [(_HKInteractiveChartOverlayDeliverCachedData *)v19 setOverlayController:v14];
    objc_storeStrong((id *)&v20->_dataSource, a4);
    objc_storeStrong(&v20->_graphSeriesContext, a5);
    v20->_timeScope = a6;
    v20->_resolution = a7;
    objc_storeStrong((id *)&v20->_startDate, a8);
    objc_storeStrong((id *)&v20->_endDate, a9);
    v21 = _Block_copy(v18);
    id completion = v20->_completion;
    v20->_id completion = v21;
  }
  return v20;
}

- (BOOL)deliverDataToCompletion
{
  v3 = [(_HKInteractiveChartOverlayDeliverCachedData *)self overlayController];
  v4 = [(_HKInteractiveChartOverlayDeliverCachedData *)self dataSource];
  v5 = [(_HKInteractiveChartOverlayDeliverCachedData *)self graphSeriesContext];
  int64_t v6 = [(_HKInteractiveChartOverlayDeliverCachedData *)self timeScope];
  int64_t v7 = [(_HKInteractiveChartOverlayDeliverCachedData *)self resolution];
  v8 = [(_HKInteractiveChartOverlayDeliverCachedData *)self startDate];
  v9 = [(_HKInteractiveChartOverlayDeliverCachedData *)self endDate];
  v10 = [(_HKInteractiveChartOverlayDeliverCachedData *)self completion];
  LOBYTE(v6) = [v3 _deliverCachedDataFromSource:v4 graphSeriesContext:v5 timeScope:v6 resolution:v7 startDate:v8 endDate:v9 completion:v10];

  return v6;
}

- (HKInteractiveChartOverlayViewController)overlayController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayController);
  return (HKInteractiveChartOverlayViewController *)WeakRetained;
}

- (void)setOverlayController:(id)a3
{
}

- (HKGraphSeriesDataSource)dataSource
{
  return self->_dataSource;
}

- (id)graphSeriesContext
{
  return self->_graphSeriesContext;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_graphSeriesContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_overlayController);
}

@end