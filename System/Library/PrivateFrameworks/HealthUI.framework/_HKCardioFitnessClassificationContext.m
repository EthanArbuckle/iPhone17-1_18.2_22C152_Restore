@interface _HKCardioFitnessClassificationContext
- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6;
- (_HKCardioFitnessClassificationContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 delegate:(id)a6;
- (_HKCardioFitnessClassificationContextDelegate)delegate;
- (id)baseDisplayTypeForOverlay:(int64_t)a3;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKCardioFitnessClassificationContext

- (_HKCardioFitnessClassificationContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)_HKCardioFitnessClassificationContext;
  v11 = [(_HKCardioFitnessOverlayContext *)&v14 initWithMode:a3 applicationItems:a4 overlayChartController:a5];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v12;
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return 0;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  v12 = [(_HKCardioFitnessOverlayContext *)self overlayChartController];
  v13 = [v12 primaryDisplayType];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    v15 = [(_HKCardioFitnessOverlayContext *)self overlayChartController];
    v16 = [v14 graphSeriesForTimeScope:a5];

    v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __124___HKCardioFitnessClassificationContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D51BB8;
    v19[4] = self;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

- (_HKCardioFitnessClassificationContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_HKCardioFitnessClassificationContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end