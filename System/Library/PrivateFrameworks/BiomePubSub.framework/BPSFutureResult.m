@interface BPSFutureResult
+ (id)failureWithError:(id)a3;
+ (id)successWithValue:(id)a3;
- (BPSFutureResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5;
- (NSError)error;
- (id)value;
- (int64_t)state;
@end

@implementation BPSFutureResult

- (BPSFutureResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BPSFutureResult;
  v11 = [(BPSFutureResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_state = a3;
    objc_storeStrong((id *)&v11->_error, a5);
    objc_storeStrong(&v12->_value, a4);
  }

  return v12;
}

+ (id)successWithValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithState:0 value:v4 error:0];

  return v5;
}

+ (id)failureWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithState:1 value:0 error:v4];

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end