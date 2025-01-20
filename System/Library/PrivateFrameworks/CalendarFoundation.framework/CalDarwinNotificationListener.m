@interface CalDarwinNotificationListener
- (BOOL)_addObserver;
- (BOOL)_removeObserver;
- (BOOL)listening;
- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4;
- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4 queue:(id)a5;
- (NSString)notificationName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (id)callback;
- (id)description;
- (void)_addObserver;
- (void)_notificationWithNameReceived:(id)a3;
- (void)_removeObserver;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)setListening:(BOOL)a3;
@end

@implementation CalDarwinNotificationListener

- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CalDarwinNotificationListener;
  v12 = [(CalDarwinNotificationListener *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationName, a3);
    uint64_t v14 = MEMORY[0x192FD8850](v10);
    id callback = v13->_callback;
    v13->_id callback = (id)v14;

    v16 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v16, @"work");
    id v17 = objc_claimAutoreleasedReturnValue();
    v18 = (const char *)[v17 UTF8String];

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v20;

    if (v11)
    {
      v22 = (OS_dispatch_queue *)v11;
      callbackQueue = v13->_callbackQueue;
      v13->_callbackQueue = v22;
    }
    else
    {
      v24 = (objc_class *)objc_opt_class();
      CalGenerateQualifiedIdentifierWithClassAndSubdomain(v24, @"callback");
      id v25 = objc_claimAutoreleasedReturnValue();
      v26 = (const char *)[v25 UTF8String];

      callbackQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v27 = dispatch_queue_create(v26, callbackQueue);
      v28 = v13->_callbackQueue;
      v13->_callbackQueue = (OS_dispatch_queue *)v27;
    }
  }

  return v13;
}

- (CalDarwinNotificationListener)initWithNotificationName:(id)a3 callback:(id)a4
{
  return [(CalDarwinNotificationListener *)self initWithNotificationName:a3 callback:a4 queue:0];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "The listener has been stopped.  Listener: [%@]", v2, v3, v4, v5, v6);
}

- (id)description
{
  uint64_t v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalDarwinNotificationListener;
  uint64_t v4 = [(CalDarwinNotificationListener *)&v9 description];
  uint64_t v5 = [(CalDescriptionBuilder *)v3 initWithSuperclassDescription:v4];

  uint8_t v6 = [(CalDarwinNotificationListener *)self notificationName];
  [(CalDescriptionBuilder *)v5 setKey:@"notificationName" withString:v6];

  [(CalDescriptionBuilder *)v5 setKey:@"listening" withBoolean:[(CalDarwinNotificationListener *)self listening]];
  v7 = [(CalDescriptionBuilder *)v5 build];

  return v7;
}

- (void)activate
{
  uint64_t v3 = [(CalDarwinNotificationListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CalDarwinNotificationListener_activate__block_invoke;
  block[3] = &unk_1E56CD9A0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __41__CalDarwinNotificationListener_activate__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) listening])
  {
    uint64_t v2 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __41__CalDarwinNotificationListener_activate__block_invoke_cold_1();
    }
  }
  else if ([*v1 _addObserver])
  {
    uint64_t v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __41__CalDarwinNotificationListener_activate__block_invoke_cold_2();
    }

    [*v1 setListening:1];
  }
}

- (void)deactivate
{
  uint64_t v3 = [(CalDarwinNotificationListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CalDarwinNotificationListener_deactivate__block_invoke;
  block[3] = &unk_1E56CD9A0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __43__CalDarwinNotificationListener_deactivate__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) listening])
  {
    if ([*v1 _removeObserver])
    {
      uint64_t v2 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
        __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_1();
      }

      [*v1 setListening:0];
    }
  }
  else
  {
    uint64_t v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_2();
    }
  }
}

- (void)_notificationWithNameReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CalDarwinNotificationListener _notificationWithNameReceived:]();
  }

  uint8_t v6 = [(CalDarwinNotificationListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke;
  block[3] = &unk_1E56CD9A0;
  block[4] = self;
  dispatch_async(v6, block);
}

void __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) listening])
  {
    uint64_t v2 = [*(id *)(a1 + 32) callback];
    if (v2)
    {
      uint64_t v3 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke_2;
      block[3] = &unk_1E56CD7E8;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

uint64_t __63__CalDarwinNotificationListener__notificationWithNameReceived___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_addObserver
{
  uint64_t v3 = [(CalDarwinNotificationListener *)self notificationName];
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)CalDarwinNotificationListener_ObservationCallback, v3, 0, (CFNotificationSuspensionBehavior)1024);
  }
  else
  {
    id v5 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CalDarwinNotificationListener _addObserver]();
    }
  }
  return v3 != 0;
}

- (BOOL)_removeObserver
{
  uint64_t v3 = [(CalDarwinNotificationListener *)self notificationName];
  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v3, 0);
  }
  else
  {
    id v5 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CalDarwinNotificationListener _removeObserver]();
    }
  }
  return v3 != 0;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)listening
{
  return self->_listening;
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

void __41__CalDarwinNotificationListener_activate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "The listener is already listening.  Will not start listening.  Listener: [%@]", v2, v3, v4, v5, v6);
}

void __41__CalDarwinNotificationListener_activate__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "The listener has been started.  Listener: [%@]", v2, v3, v4, v5, v6);
}

void __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "The listener has been stopped.  Listener: [%@]", v2, v3, v4, v5, v6);
}

void __43__CalDarwinNotificationListener_deactivate__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "The listener is not listening.  Will not stop listening.  Listener: [%@]", v2, v3, v4, v5, v6);
}

- (void)_notificationWithNameReceived:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_190D88000, v1, OS_LOG_TYPE_DEBUG, "Received notification with name: [%@].  Listener: [%@]", v2, 0x16u);
}

- (void)_addObserver
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "The listener was given a 'nil' notification name.  Will not add it as an observer.  Listener: [%@]", v2, v3, v4, v5, v6);
}

- (void)_removeObserver
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "The listener was given a 'nil' notification name.  Will not remove it as an observer.  Listener: [%@]", v2, v3, v4, v5, v6);
}

@end