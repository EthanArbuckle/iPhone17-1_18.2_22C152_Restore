@interface _CNObservableEventDynamicQueueBufferingStrategy
- (BOOL)isSequenceTerminated;
- (CNQueue)queue;
- (_CNObservableEventDynamicQueueBufferingStrategy)initWithQueue:(id)a3;
- (id)allEvents;
- (void)addEvent:(id)a3;
@end

@implementation _CNObservableEventDynamicQueueBufferingStrategy

- (BOOL)isSequenceTerminated
{
  return 0;
}

- (id)allEvents
{
  v2 = [(_CNObservableEventDynamicQueueBufferingStrategy *)self queue];
  v3 = [v2 allObjects];

  return v3;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNObservableEventDynamicQueueBufferingStrategy *)self queue];
  [v5 enqueue:v4];
}

- (CNQueue)queue
{
  return self->_queue;
}

- (_CNObservableEventDynamicQueueBufferingStrategy)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableEventDynamicQueueBufferingStrategy;
  v6 = [(_CNObservableEventDynamicQueueBufferingStrategy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end