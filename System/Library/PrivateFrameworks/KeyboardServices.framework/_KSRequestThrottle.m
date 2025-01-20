@interface _KSRequestThrottle
- (NSString)debugIdentifier;
- (OS_dispatch_queue)queue;
- (_KSRequestThrottle)init;
- (_KSRequestThrottle)initWithCurve:(id)a3 maximumDelay:(double)a4;
- (void)_launch;
- (void)postRequest:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _KSRequestThrottle

- (void)setQueue:(id)a3
{
}

- (void)setDebugIdentifier:(id)a3
{
}

- (_KSRequestThrottle)init
{
  return [(_KSRequestThrottle *)self initWithCurve:&__block_literal_global_5 maximumDelay:60.0];
}

- (_KSRequestThrottle)initWithCurve:(id)a3 maximumDelay:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_KSRequestThrottle;
  v7 = [(_KSRequestThrottle *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id curveFunction = v7->_curveFunction;
    v7->_id curveFunction = (id)v8;

    v7->_maximum = a4;
  }

  return v7;
}

- (void)postRequest:(id)a3
{
  id v4 = a3;
  v5 = [(_KSRequestThrottle *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___KSRequestThrottle_postRequest___block_invoke;
  v7[3] = &unk_264890A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
  }
  return v3;
}

- (void)_launch
{
  objc_initWeak(&location, self);
  ++self->_retryCount;
  request = (void (**)(id, void *))self->_request;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29___KSRequestThrottle__launch__block_invoke;
  v4[3] = &unk_264891610;
  objc_copyWeak(&v5, &location);
  request[2](request, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong(&self->_curveFunction, 0);
}

@end