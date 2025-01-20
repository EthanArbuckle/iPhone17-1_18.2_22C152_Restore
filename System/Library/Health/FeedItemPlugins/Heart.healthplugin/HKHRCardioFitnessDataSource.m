@interface HKHRCardioFitnessDataSource
- (BOOL)classificationsAvailable;
- (HKHRCardioFitnessAnalyticsManager)analyticsManager;
- (HKHRCardioFitnessDataSource)initWithHealthStore:(id)a3 classificationsAvailable:(BOOL)a4;
- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (void)didChangeFromOverlayWithIdentifier:(id)a3 toOverlayWithIdentifier:(id)a4;
- (void)setAnalyticsManager:(id)a3;
- (void)setClassificationsAvailable:(BOOL)a3;
@end

@implementation HKHRCardioFitnessDataSource

- (HKHRCardioFitnessDataSource)initWithHealthStore:(id)a3 classificationsAvailable:(BOOL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRCardioFitnessDataSource;
  v7 = [(HKHRCardioFitnessDataSource *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_classificationsAvailable = a4;
    id v9 = objc_alloc(MEMORY[0x263F47630]);
    v10 = (void *)[objc_alloc(MEMORY[0x263F47628]) initWithHealthStore:v6];
    uint64_t v11 = [v9 initWithSignalSource:v10];
    analyticsManager = v8->_analyticsManager;
    v8->_analyticsManager = (HKHRCardioFitnessAnalyticsManager *)v11;
  }
  return v8;
}

- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  if (self->_classificationsAvailable) {
    [MEMORY[0x263F46408] cardioFitnessInteractiveChartViewControllerWithDisplayDate:a6 applicationItems:a5 preferredOverlay:a7 analyticsDelegate:self restorationUserActivity:a8 trendModel:a9 factorDisplayTypes:a10 additionalChartOptions:a11];
  }
  else {
  uint64_t v11 = [MEMORY[0x263F46408] vo2MaxInteractiveChartViewControllerWithDisplayDate:a6 applicationItems:a5 restorationUserActivity:a8 trendModel:a9 factorDisplayTypes:a10 additionalChartOptions:a11];
  }

  return v11;
}

- (void)didChangeFromOverlayWithIdentifier:(id)a3 toOverlayWithIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HKHRCardioFitnessDataSource *)self analyticsManager];
  id v8 = (id)[v7 submitClassificationChartOverlaySelectedEventCurrentOverlay:v6 previousOverlay:v9];
}

- (BOOL)classificationsAvailable
{
  return self->_classificationsAvailable;
}

- (void)setClassificationsAvailable:(BOOL)a3
{
  self->_classificationsAvailable = a3;
}

- (HKHRCardioFitnessAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end