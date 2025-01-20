@interface HMINotifydObserver
- (BOOL)start;
- (HMINotifydObserver)initWithNotificationName:(const char *)a3 andQueue:(id)a4 andCallback:(id)a5;
- (OS_dispatch_queue)queue;
- (const)notificationName;
- (id)callback;
- (int)token;
- (void)dealloc;
- (void)publishInitialValue;
- (void)publishValueForToken:(int)a3;
- (void)setToken:(int)a3;
@end

@implementation HMINotifydObserver

- (HMINotifydObserver)initWithNotificationName:(const char *)a3 andQueue:(id)a4 andCallback:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMINotifydObserver;
  v11 = [(HMINotifydObserver *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v13 = MEMORY[0x22A641EE0](v10);
    id callback = v12->_callback;
    v12->_id callback = (id)v13;

    v12->_notificationName = a3;
    v12->_token = -1;
  }

  return v12;
}

- (BOOL)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(HMINotifydObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMINotifydObserver *)self token] == -1)
  {
    *(_DWORD *)buf = -1;
    id v9 = [(HMINotifydObserver *)self notificationName];
    id v10 = [(HMINotifydObserver *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__HMINotifydObserver_start__block_invoke;
    handler[3] = &unk_26477E370;
    handler[4] = self;
    uint32_t v11 = notify_register_dispatch(v9, (int *)buf, v10, handler);

    BOOL v8 = v11 == 0;
    if (!v11)
    {
      [(HMINotifydObserver *)self publishInitialValue];
      [(HMINotifydObserver *)self setToken:*(unsigned int *)buf];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x22A641C70]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_ERROR, "%{public}@Already started listening for the notification", buf, 0xCu);
    }
    return 0;
  }
  return v8;
}

uint64_t __27__HMINotifydObserver_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) publishValueForToken:a2];
}

- (void)publishValueForToken:(int)a3
{
  v5 = [(HMINotifydObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    v6 = [(HMINotifydObserver *)self callback];
    ((void (**)(void, HMINotifydObserver *, uint64_t))v6)[2](v6, self, state64);
  }
}

- (void)publishInitialValue
{
  v3 = [(HMINotifydObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  int out_token = -1;
  if (!notify_register_check([(HMINotifydObserver *)self notificationName], &out_token))
  {
    [(HMINotifydObserver *)self publishValueForToken:out_token];
    notify_cancel(out_token);
  }
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1) {
    notify_cancel(token);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMINotifydObserver;
  [(HMINotifydObserver *)&v4 dealloc];
}

- (const)notificationName
{
  return self->_notificationName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)callback
{
  return self->_callback;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_int token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end