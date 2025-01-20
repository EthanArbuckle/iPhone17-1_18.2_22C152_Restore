@interface _CNFlatMapSubscriptionContext
- (BOOL)isObserverReceiving;
- (BOOL)isOperatorReceiving;
- (CNQueue)decorators;
- (CNScheduler)downstream;
- (CNScheduler)resourceLock;
- (CNWeakArray)tokens;
- (_CNFlatMapSubscriptionContext)initWithSchedulerProvider:(id)a3;
- (void)setObserverReceiving:(BOOL)a3;
- (void)setOperatorReceiving:(BOOL)a3;
@end

@implementation _CNFlatMapSubscriptionContext

- (_CNFlatMapSubscriptionContext)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CNFlatMapSubscriptionContext;
  v5 = [(_CNFlatMapSubscriptionContext *)&v16 init];
  if (v5)
  {
    v6 = objc_alloc_init(CNQueue);
    decorators = v5->_decorators;
    v5->_decorators = v6;

    v8 = objc_alloc_init(CNWeakArray);
    tokens = v5->_tokens;
    v5->_tokens = v8;

    uint64_t v10 = [v4 newSerialSchedulerWithName:@"com.apple.contacts.reactive.flat-map.downstream"];
    downstream = v5->_downstream;
    v5->_downstream = (CNScheduler *)v10;

    uint64_t v12 = [v4 newSynchronousSerialSchedulerWithName:@"com.apple.contacts.reactive.flat-map.resource"];
    resourceLock = v5->_resourceLock;
    v5->_resourceLock = (CNScheduler *)v12;

    *(_WORD *)&v5->_operatorReceiving = 257;
    v14 = v5;
  }

  return v5;
}

- (CNQueue)decorators
{
  return self->_decorators;
}

- (CNWeakArray)tokens
{
  return self->_tokens;
}

- (CNScheduler)downstream
{
  return self->_downstream;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (BOOL)isOperatorReceiving
{
  return self->_operatorReceiving;
}

- (void)setOperatorReceiving:(BOOL)a3
{
  self->_operatorReceiving = a3;
}

- (BOOL)isObserverReceiving
{
  return self->_observerReceiving;
}

- (void)setObserverReceiving:(BOOL)a3
{
  self->_observerReceiving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_tokens, 0);

  objc_storeStrong((id *)&self->_decorators, 0);
}

@end