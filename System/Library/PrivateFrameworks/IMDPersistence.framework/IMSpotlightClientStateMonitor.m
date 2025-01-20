@interface IMSpotlightClientStateMonitor
- (IMSpotlightClientState)clientState;
- (IMSpotlightClientStateMonitor)init;
- (IMSpotlightClientStateMonitor)initWithChangeHandler:(id)a3;
- (NSLock)lock;
- (OS_dispatch_queue)queue;
- (id)changeHandler;
- (int)clientStateToken;
- (void)_updateClientState;
- (void)dealloc;
- (void)setClientState:(id)a3;
@end

@implementation IMSpotlightClientStateMonitor

- (IMSpotlightClientStateMonitor)initWithChangeHandler:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IMSpotlightClientStateMonitor;
  v5 = [(IMSpotlightClientStateMonitor *)&v23 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.imdpersistence.IMSpotlightClientStateMonitor", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = _Block_copy(v4);
    id changeHandler = v5->_changeHandler;
    v5->_id changeHandler = v11;

    id location = 0;
    objc_initWeak(&location, v5);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = sub_1AFC2ACE0;
    v20 = &unk_1E5F9CCF8;
    objc_copyWeak(&v21, &location);
    v5->_clientStateToken = IMDispatchForNotify();
    v13 = v5->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1AFC2AD20;
    block[3] = &unk_1E5F8E798;
    v16 = v5;
    dispatch_async(v13, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (IMSpotlightClientStateMonitor)init
{
  return (IMSpotlightClientStateMonitor *)MEMORY[0x1F4181798](self, sel_initWithChangeHandler_);
}

- (void)dealloc
{
  notify_cancel(self->_clientStateToken);
  v3.receiver = self;
  v3.super_class = (Class)IMSpotlightClientStateMonitor;
  [(IMSpotlightClientStateMonitor *)&v3 dealloc];
}

- (void)_updateClientState
{
  uint64_t v8 = 0;
  dispatch_queue_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1AFC2AF20;
  v12 = sub_1AFC2AF30;
  id v13 = 0;
  objc_super v3 = +[IMDDatabase synchronousDatabase];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC2AF38;
  v7[3] = &unk_1E5F9CD20;
  v7[4] = &v8;
  [v3 fetchSpotlightClientStateWithCompletion:v7];

  id v4 = [(IMSpotlightClientStateMonitor *)self lock];
  [v4 lock];

  objc_storeStrong((id *)&self->_clientState, (id)v9[5]);
  if (self->_changeHandler)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1AFC2AF48;
    block[3] = &unk_1E5F965B0;
    void block[4] = self;
    block[5] = &v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v5 = [(IMSpotlightClientStateMonitor *)self lock];
  [v5 unlock];

  _Block_object_dispose(&v8, 8);
}

- (IMSpotlightClientState)clientState
{
  objc_super v3 = [(IMSpotlightClientStateMonitor *)self lock];
  [v3 lock];

  id v4 = (void *)[(IMSpotlightClientState *)self->_clientState copy];
  v5 = [(IMSpotlightClientStateMonitor *)self lock];
  [v5 unlock];

  return (IMSpotlightClientState *)v4;
}

- (void)setClientState:(id)a3
{
}

- (NSLock)lock
{
  return self->_lock;
}

- (int)clientStateToken
{
  return self->_clientStateToken;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
}

@end