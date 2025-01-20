@interface HKChartSummaryTrendModelObserverWrapper
- (HKChartSummaryTrendModelObserver)weakObserver;
- (void)setWeakObserver:(id)a3;
@end

@implementation HKChartSummaryTrendModelObserverWrapper

- (HKChartSummaryTrendModelObserver)weakObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakObserver);
  return (HKChartSummaryTrendModelObserver *)WeakRetained;
}

- (void)setWeakObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end