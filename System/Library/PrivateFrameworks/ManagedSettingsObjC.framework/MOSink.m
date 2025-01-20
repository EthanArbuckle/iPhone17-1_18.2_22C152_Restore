@interface MOSink
- (BOOL)active;
- (MOSink)initWithCompletion:(id)a3 receiveInput:(id)a4;
- (MOSubscription)subscription;
- (NSObject)lock;
- (id)receiveCompletionBlock;
- (id)receiveInputBlock;
- (unint64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation MOSink

- (MOSink)initWithCompletion:(id)a3 receiveInput:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)MOSink;
  id v5 = a4;
  id v6 = a3;
  v7 = [(MOSubscriber *)&v15 initSubscriber];
  uint64_t v8 = MEMORY[0x1BA9CEAC0](v6);

  id receiveCompletionBlock = v7->_receiveCompletionBlock;
  v7->_id receiveCompletionBlock = (id)v8;

  uint64_t v10 = MEMORY[0x1BA9CEAC0](v5);
  id receiveInputBlock = v7->_receiveInputBlock;
  v7->_id receiveInputBlock = (id)v10;

  v7->_active = 1;
  uint64_t v12 = objc_opt_new();
  lock = v7->_lock;
  v7->_lock = v12;

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v6 = a3;
  id v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active && !self->_subscription)
  {
    objc_storeStrong((id *)&self->_subscription, a3);
    objc_sync_exit(v5);

    [v6 requestDemand:-1];
  }
  else
  {
    objc_sync_exit(v5);

    [v6 cancel];
  }
}

- (void)dealloc
{
  [(MOSink *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MOSink;
  [(MOSink *)&v3 dealloc];
}

- (unint64_t)receiveInput:(id)a3
{
  id v4 = a3;
  id v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active)
  {
    uint64_t v6 = MEMORY[0x1BA9CEAC0](self->_receiveInputBlock);
    objc_sync_exit(v5);

    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
    id v5 = v6;
  }
  else
  {
    objc_sync_exit(v5);
  }

  return 0;
}

- (void)receiveCompletion:(id)a3
{
  id v6 = a3;
  id v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active)
  {
    uint64_t v5 = MEMORY[0x1BA9CEAC0](self->_receiveCompletionBlock);
    objc_sync_exit(v4);

    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    [(MOSink *)self cancel];
    id v4 = v5;
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)cancel
{
  objc_super v3 = self->_lock;
  objc_sync_enter(v3);
  BOOL active = self->_active;
  if (self->_active)
  {
    uint64_t v10 = self->_subscription;
    subscription = self->_subscription;
    self->_subscription = 0;

    id receiveInputBlock = self->_receiveInputBlock;
    self->_id receiveInputBlock = 0;

    id receiveCompletionBlock = self->_receiveCompletionBlock;
    self->_id receiveCompletionBlock = 0;

    self->_BOOL active = 0;
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_sync_exit(v3);

  uint64_t v8 = v10;
  if (active && v10 != 0)
  {
    [(MOSubscription *)v10 cancel];
    uint64_t v8 = v10;
  }
}

- (id)receiveCompletionBlock
{
  return self->_receiveCompletionBlock;
}

- (id)receiveInputBlock
{
  return self->_receiveInputBlock;
}

- (MOSubscription)subscription
{
  return self->_subscription;
}

- (BOOL)active
{
  return self->_active;
}

- (NSObject)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong(&self->_receiveInputBlock, 0);
  objc_storeStrong(&self->_receiveCompletionBlock, 0);
}

@end