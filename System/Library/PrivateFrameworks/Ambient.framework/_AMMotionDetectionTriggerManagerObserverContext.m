@interface _AMMotionDetectionTriggerManagerObserverContext
- (AMMotionDetectionTriggerManagerObserver)observer;
- (OS_dispatch_queue)queue;
- (_AMMotionDetectionTriggerManagerObserverContext)initWithObserver:(id)a3 queue:(id)a4;
@end

@implementation _AMMotionDetectionTriggerManagerObserverContext

- (_AMMotionDetectionTriggerManagerObserverContext)initWithObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AMMotionDetectionTriggerManagerObserverContext;
  v8 = [(_AMMotionDetectionTriggerManagerObserverContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AMMotionDetectionTriggerManagerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (AMMotionDetectionTriggerManagerObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end