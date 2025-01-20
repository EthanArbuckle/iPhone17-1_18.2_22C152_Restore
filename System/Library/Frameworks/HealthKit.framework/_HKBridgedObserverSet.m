@interface _HKBridgedObserverSet
- (HKObserverSet)observers;
- (id)bridgedObserver;
- (void)setBridgedObserver:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation _HKBridgedObserverSet

- (id)bridgedObserver
{
  return self->_bridgedObserver;
}

- (void)setBridgedObserver:(id)a3
{
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong(&self->_bridgedObserver, 0);
}

@end