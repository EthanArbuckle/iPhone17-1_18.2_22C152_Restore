@interface _HKInteractiveChartWeakObserverWrapper
- (HKInteractiveChartViewObserver)observer;
- (_HKInteractiveChartWeakObserverWrapper)initWithObserver:(id)a3;
@end

@implementation _HKInteractiveChartWeakObserverWrapper

- (_HKInteractiveChartWeakObserverWrapper)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKInteractiveChartWeakObserverWrapper;
  v5 = [(_HKInteractiveChartWeakObserverWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v6;
}

- (HKInteractiveChartViewObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (HKInteractiveChartViewObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end