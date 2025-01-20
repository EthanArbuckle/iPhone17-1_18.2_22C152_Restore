@interface AFSiriTether
- (AFSiriTether)init;
- (AFSiriTether)initWithInstanceContext:(id)a3;
- (id)_connection;
- (void)_attach:(id)a3;
- (void)_attachmentStatusUpdate:(BOOL)a3;
- (void)_connectionInterrupted:(id)a3;
- (void)_connectionInvalid:(id)a3;
- (void)_listenForLaunchNotification;
- (void)_logEvent:(id)a3;
- (void)attach:(id)a3;
- (void)dealloc;
- (void)setAttachmentStatusChangedHandler:(id)a3;
- (void)waitForAttachment:(double)a3;
@end

@implementation AFSiriTether

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong(&self->_attachmentStatusChangedHandler, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_logEvent:(id)a3
{
  id v4 = a3;
  pendingEvents = self->_pendingEvents;
  id v12 = v4;
  if (self->_isAttached)
  {
    if ([(NSMutableArray *)pendingEvents count])
    {
      v6 = self->_pendingEvents;
      self->_pendingEvents = 0;
      v7 = v6;

      v8 = +[AFAnalytics sharedAnalytics];
      [v8 logEvents:v7];
    }
    v9 = +[AFAnalytics sharedAnalytics];
    [v9 logEvent:v12];
  }
  else
  {
    if (!pendingEvents)
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = self->_pendingEvents;
      self->_pendingEvents = v10;

      id v4 = v12;
      pendingEvents = self->_pendingEvents;
    }
    [(NSMutableArray *)pendingEvents addObject:v4];
  }
}

- (void)_listenForLaunchNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_notifyToken == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, self);
    EffectiveNotification = (const char *)AFNotifyGetEffectiveNotification((uint64_t)"com.apple.siri.daemon_launched", self->_instanceContext);
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__AFSiriTether__listenForLaunchNotification__block_invoke;
    handler[3] = &unk_1E592A778;
    objc_copyWeak(&v8, &location);
    uint32_t v5 = notify_register_dispatch(EffectiveNotification, &out_token, queue, handler);
    if (v5)
    {
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[AFSiriTether _listenForLaunchNotification]";
        __int16 v13 = 1024;
        uint32_t v14 = v5;
        _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s Notify register failed %u", buf, 0x12u);
      }
    }
    else
    {
      self->_notifyToken = out_token;
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __44__AFSiriTether__listenForLaunchNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained attach:0];
}

- (void)_attachmentStatusUpdate:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_isAttached != a3)
  {
    BOOL v3 = a3;
    uint32_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[AFSiriTether _attachmentStatusUpdate:]";
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v9, 0x12u);
    }
    self->_isAttached = v3;
    if (v3) {
      uint64_t v6 = 1922;
    }
    else {
      uint64_t v6 = 1923;
    }
    v7 = AFAnalyticsEventCreateCurrent(v6, 0);
    [(AFSiriTether *)self _logEvent:v7];

    attachmentStatusChangedHandler = (void (**)(id, BOOL))self->_attachmentStatusChangedHandler;
    if (attachmentStatusChangedHandler) {
      attachmentStatusChangedHandler[2](attachmentStatusChangedHandler, self->_isAttached);
    }
  }
}

- (void)_attach:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t v5 = (void (**)(void, void))v4;
  if (self->_isAttached)
  {
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    [(AFSiriTether *)self _listenForLaunchNotification];
    uint64_t v6 = [(AFSiriTether *)self _connection];
    if (v6)
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[AFSiriTether _attach:]";
        _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Sending attachment message", buf, 0xCu);
      }
      *(void *)buf = "attach";
      xpc_object_t values = xpc_BOOL_create(1);
      xpc_object_t v8 = xpc_dictionary_create((const char *const *)buf, &values, 1uLL);
      queue = self->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __24__AFSiriTether__attach___block_invoke;
      handler[3] = &unk_1E592B530;
      void handler[4] = self;
      __int16 v11 = v5;
      xpc_connection_send_message_with_reply(v6, v8, queue, handler);
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

uint64_t __24__AFSiriTether__attach___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x19F3A5530](a2);
  id v4 = AFSiriLogContextConnection;
  BOOL v5 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  uint64_t v6 = MEMORY[0x1E4F14590];
  if (v5)
  {
    int v9 = 136315394;
    v10 = "-[AFSiriTether _attach:]_block_invoke";
    __int16 v11 = 1024;
    BOOL v12 = v3 == MEMORY[0x1E4F14590];
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Attachment Reply %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == v6);
  }
  return [*(id *)(a1 + 32) _attachmentStatusUpdate:v3 == v6];
}

- (void)_connectionInvalid:(id)a3
{
  connection = self->_connection;
  if (connection == a3 && connection != 0)
  {
    xpc_connection_cancel((xpc_connection_t)a3);
    uint64_t v6 = self->_connection;
    self->_connection = 0;

    [(AFSiriTether *)self _attachmentStatusUpdate:0];
  }
}

- (void)_connectionInterrupted:(id)a3
{
  if (self->_connection == a3) {
    [(AFSiriTether *)self _attachmentStatusUpdate:0];
  }
}

- (id)_connection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionForMachService:AFSiriTetherMachService targetQueue:self->_queue flags:0];
    if (v4)
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v4);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __27__AFSiriTether__connection__block_invoke;
      handler[3] = &unk_1E592A748;
      objc_copyWeak(&v11, (id *)location);
      objc_copyWeak(&v12, &from);
      xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
      xpc_connection_activate((xpc_connection_t)v4);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      BOOL v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        instanceContext = self->_instanceContext;
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[AFSiriTether _connection]";
        __int16 v15 = 2112;
        v16 = instanceContext;
        _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Unable to create XPC connection from %@.", location, 0x16u);
      }
    }
    uint64_t v7 = self->_connection;
    p_connection = &self->_connection;
    *p_connection = (OS_xpc_object *)v4;

    connection = *p_connection;
  }
  return connection;
}

void __27__AFSiriTether__connection__block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x19F3A5530](a2) == MEMORY[0x1E4F145A8])
  {
    if (a2 == MEMORY[0x1E4F14520])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v4 = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _connectionInterrupted:v4];
    }
    else
    {
      if (a2 != MEMORY[0x1E4F14528]) {
        return;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v4 = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _connectionInvalid:v4];
    }
  }
}

- (void)setAttachmentStatusChangedHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AFSiriTether_setAttachmentStatusChangedHandler___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__AFSiriTether_setAttachmentStatusChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x19F3A50D0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)waitForAttachment:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0 && (BOOL v5 = dispatch_group_create()) != 0)
  {
    id v6 = v5;
    dispatch_group_enter(v5);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __34__AFSiriTether_waitForAttachment___block_invoke;
    v20[3] = &unk_1E592A720;
    uint64_t v7 = v6;
    v21 = v7;
    [(AFSiriTether *)self attach:v20];
    id v8 = AFAnalyticsEventCreateCurrent(1918, 0);
    int v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriTether waitForAttachment:]";
      __int16 v24 = 2048;
      double v25 = a3;
      _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s Waiting for attachment %lf", buf, 0x16u);
    }
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    intptr_t v11 = dispatch_group_wait(v7, v10);
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriTether waitForAttachment:]";
      __int16 v24 = 1024;
      LODWORD(v25) = v11 == 0;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Wait finished %d", buf, 0x12u);
    }
    uint64_t v13 = AFAnalyticsEventCreateCurrent(1919, 0);
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __34__AFSiriTether_waitForAttachment___block_invoke_8;
    v17[3] = &unk_1E592C338;
    v17[4] = self;
    id v18 = v8;
    id v19 = v13;
    id v15 = v13;
    id v16 = v8;
    dispatch_async(queue, v17);
  }
  else
  {
    [(AFSiriTether *)self attach:0];
  }
}

void __34__AFSiriTether_waitForAttachment___block_invoke(uint64_t a1)
{
}

uint64_t __34__AFSiriTether_waitForAttachment___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _logEvent:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _logEvent:v3];
}

- (void)attach:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFAnalyticsEventCreateCurrent(1920, 0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__AFSiriTether_attach___block_invoke;
  block[3] = &unk_1E592C598;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(queue, block);
}

void __23__AFSiriTether_attach___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _logEvent:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __23__AFSiriTether_attach___block_invoke_2;
  v3[3] = &unk_1E592A6F8;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 48);
  [v2 _attach:v3];
}

uint64_t __23__AFSiriTether_attach___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  int v9 = @"attached";
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = AFAnalyticsEventCreateCurrent(1921, v6);
  [v4 _logEvent:v7];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTether;
  [(AFSiriTether *)&v4 dealloc];
}

- (AFSiriTether)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSiriTether;
  BOOL v5 = [(AFSiriTether *)&v12 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(0, v6);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v5->_int notifyToken = -1;
    if (v4)
    {
      int v9 = (AFInstanceContext *)v4;
    }
    else
    {
      int v9 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;
  }
  return v5;
}

- (AFSiriTether)init
{
  uint64_t v3 = +[AFInstanceContext currentContext];
  id v4 = [(AFSiriTether *)self initWithInstanceContext:v3];

  return v4;
}

@end