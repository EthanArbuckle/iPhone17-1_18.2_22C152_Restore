@interface CMFNotificationObserver
- (CMFNotificationObserver)initWithName:(id)a3 queue:(id)a4 callback:(id)a5;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)callback;
- (int)token;
- (void)dealloc;
- (void)setToken:(int)a3;
@end

@implementation CMFNotificationObserver

- (CMFNotificationObserver)initWithName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CMFNotificationObserver;
  v11 = [(CMFNotificationObserver *)&v22 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x21668A040](v10);
    id callback = v11->_callback;
    v11->_id callback = (id)v12;

    uint64_t v14 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_token = 0;
    objc_initWeak(&location, v11);
    v16 = [(NSString *)v11->_name UTF8String];
    queue = v11->_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__CMFNotificationObserver_initWithName_queue_callback___block_invoke;
    v19[3] = &unk_2641978A0;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v16, &v11->_token, queue, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __55__CMFNotificationObserver_initWithName_queue_callback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained callback];
    v2[2]();

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)CMFNotificationObserver;
  [(CMFNotificationObserver *)&v3 dealloc];
}

- (id)callback
{
  return self->_callback;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end