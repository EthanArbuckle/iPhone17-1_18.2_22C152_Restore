@interface CNObservableEvent
+ (CNObservableEvent)eventWithResult:(id)a3;
+ (id)completionEvent;
+ (id)failureEventWithError:(id)a3;
- (BOOL)hasValue;
- (NSError)error;
- (id)value;
- (unint64_t)eventType;
- (void)dematerializeWithObserver:(id)a3;
@end

@implementation CNObservableEvent

+ (CNObservableEvent)eventWithResult:(id)a3
{
  id v3 = a3;
  v4 = [[_CNObservableResultEvent alloc] initWithResult:v3];

  return (CNObservableEvent *)v4;
}

+ (id)completionEvent
{
  if (completionEvent_cn_once_token_1 != -1) {
    dispatch_once(&completionEvent_cn_once_token_1, &__block_literal_global_49);
  }
  v2 = (void *)completionEvent_cn_once_object_1;

  return v2;
}

uint64_t __36__CNObservableEvent_completionEvent__block_invoke()
{
  v0 = objc_alloc_init(_CNObservableCompletionEvent);
  uint64_t v1 = completionEvent_cn_once_object_1;
  completionEvent_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)failureEventWithError:(id)a3
{
  id v3 = a3;
  v4 = [[_CNObservableFailureEvent alloc] initWithError:v3];

  return v4;
}

- (unint64_t)eventType
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)hasValue
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)value
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSError)error
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dematerializeWithObserver:(id)a3
{
  id v5 = a3;
  CNAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end