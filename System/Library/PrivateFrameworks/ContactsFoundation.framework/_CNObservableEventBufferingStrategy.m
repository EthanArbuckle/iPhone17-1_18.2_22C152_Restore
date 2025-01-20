@interface _CNObservableEventBufferingStrategy
+ (id)strategyWithEvents:(id)a3;
+ (id)strategyWithQueue:(id)a3;
- (BOOL)isSequenceTerminated;
- (id)allEvents;
- (void)addEvent:(id)a3;
@end

@implementation _CNObservableEventBufferingStrategy

+ (id)strategyWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[_CNObservableEventDynamicQueueBufferingStrategy alloc] initWithQueue:v3];

  return v4;
}

+ (id)strategyWithEvents:(id)a3
{
  id v3 = a3;
  v4 = [[_CNObservableEventStaticArrayBufferingStrategy alloc] initWithEvents:v3];

  return v4;
}

- (void)addEvent:(id)a3
{
  id v5 = a3;
  CNAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)allEvents
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isSequenceTerminated
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end