@interface _BPSScanInner
- (BPSSubscriber)downstream;
- (_BPSScanInner)initWithDownstream:(id)a3 nextPartialResult:(id)a4 initialResult:(id)a5;
- (id)nextPartialResult;
- (id)result;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setNextPartialResult:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation _BPSScanInner

- (_BPSScanInner)initWithDownstream:(id)a3 nextPartialResult:(id)a4 initialResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BPSScanInner;
  v12 = [(_BPSScanInner *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    uint64_t v14 = [v10 copy];
    id nextPartialResult = v13->_nextPartialResult;
    v13->_id nextPartialResult = (id)v14;

    objc_storeStrong(&v13->_result, a5);
  }

  return v13;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSScanInner *)self downstream];
  [v5 receiveSubscription:v4];
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSScanInner *)v4 nextPartialResult];
  v7 = [(_BPSScanInner *)v4 result];
  v8 = ((void (**)(void, void *, id))v6)[2](v6, v7, v5);

  [(_BPSScanInner *)v4 setResult:v8];
  id v9 = [(_BPSScanInner *)v4 downstream];
  id v10 = [(_BPSScanInner *)v4 result];
  int64_t v11 = [v9 receiveInput:v10];

  return v11;
}

- (void)receiveCompletion:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSDebounceInner receiveCompletion:]();
  }

  v7 = [(_BPSScanInner *)v4 downstream];
  [v7 receiveCompletion:v5];
}

- (void)cancel
{
  v3 = self;
  v2 = [(_BPSScanInner *)v3 downstream];
  [v2 cancel];
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

- (void)setNextPartialResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end