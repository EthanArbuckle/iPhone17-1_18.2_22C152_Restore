@interface HMDRemoteDeviceInformation
- (HMDRemoteDeviceInformation)init;
- (id)attributeDescriptions;
- (void)addState:(uint64_t)a1;
- (void)clearState:(uint64_t)a1;
- (void)completeConfirmationsWithError:(uint64_t)a1;
- (void)queueConfirmationHandler:(double)a3 timeout:;
- (void)setRetryTimer:(uint64_t)a1;
@end

@implementation HMDRemoteDeviceInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_confirmationHandlers, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id)attributeDescriptions
{
  v22[4] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  v6 = (void *)[v4 initWithName:@"Device" value:Property options:1 formatter:0];
  v22[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = NSNumber;
  if (self) {
    clients = self->_clients;
  }
  else {
    clients = 0;
  }
  v10 = clients;
  v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", -[NSHashTable count](v10, "count"));
  v12 = (void *)[v7 initWithName:@"NumRegisteredClients" value:v11];
  v22[1] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = HMFBooleanToString();
  v15 = (void *)[v13 initWithName:@"Reachable" value:v14];
  v22[2] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  if (self) {
    int64_t state = self->_state;
  }
  else {
    int64_t state = 0;
  }
  v18 = [NSNumber numberWithInteger:state];
  v19 = (void *)[v16 initWithName:@"State" value:v18];
  v22[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  return v20;
}

- (HMDRemoteDeviceInformation)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)addState:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    *(void *)(a1 + 40) |= a2;
  }
}

- (void)queueConfirmationHandler:(double)a3 timeout:
{
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    id v6 = a2;
    dispatch_assert_queue_V2(v5);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v13 = (id)[WeakRetained newConfirmationHandlerWithTimeout:*(void *)(a1 + 24) workQueue:v6 handler:a3];

    [*(id *)(a1 + 48) addObject:v13];
    if (v13)
    {
      v8 = [v13 workQueue];
      dispatch_assert_queue_V2(v8);

      v9 = [v13 timeoutTimer];
      [v9 setDelegate:v13];

      v10 = [v13 workQueue];
      v11 = [v13 timeoutTimer];
      [v11 setDelegateQueue:v10];

      v12 = [v13 timeoutTimer];
      [v12 resume];
    }
  }
}

- (void)completeConfirmationsWithError:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v4 = (void *)[*(id *)(a1 + 48) copy];
    [*(id *)(a1 + 48) removeAllObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[HMDRemoteDeviceConfirmationHandler finishWithError:](*(void **)(*((void *)&v10 + 1) + 8 * v9++), v3);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)clearState:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    *(void *)(a1 + 40) &= ~2uLL;
  }
}

- (void)setRetryTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

@end