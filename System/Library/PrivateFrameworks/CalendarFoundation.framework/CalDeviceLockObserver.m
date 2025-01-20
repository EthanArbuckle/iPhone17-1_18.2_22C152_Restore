@interface CalDeviceLockObserver
+ (BOOL)hasBeenUnlockedSinceBoot;
+ (NSString)stateChangedNotificationName;
+ (void)hasBeenUnlockedSinceBoot;
- (BOOL)hasBeenUnlockedSinceBoot;
- (BOOL)internalHasBeenUnlockedSinceBoot;
- (CalDarwinNotificationListener)notificationListener;
- (CalDeviceLockObserver)init;
- (CalDeviceLockObserver)initWithStateChangedCallback:(id)a3;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (id)stateChangedCallback;
- (void)_notificationReceived;
- (void)setCallbackQueue:(id)a3;
- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setNotificationListener:(id)a3;
- (void)setStateChangedCallback:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CalDeviceLockObserver

- (CalDeviceLockObserver)init
{
  return [(CalDeviceLockObserver *)self initWithStateChangedCallback:&__block_literal_global_23];
}

- (CalDeviceLockObserver)initWithStateChangedCallback:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CalDeviceLockObserver;
  v5 = [(CalDeviceLockObserver *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(CalDeviceLockObserver *)v5 setStateChangedCallback:v4];
    v7 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v7, @"work");
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];

    dispatch_queue_t v10 = dispatch_queue_create(v9, 0);
    [(CalDeviceLockObserver *)v6 setWorkQueue:v10];

    v11 = (objc_class *)objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain(v11, @"callback");
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];

    dispatch_queue_t v14 = dispatch_queue_create(v13, MEMORY[0x1E4F14430]);
    [(CalDeviceLockObserver *)v6 setCallbackQueue:v14];
  }
  return v6;
}

- (void)_notificationReceived
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 notificationListener];
  id v4 = [v3 notificationName];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Notification received: [%@]", (uint8_t *)&v5, 0xCu);
}

void __46__CalDeviceLockObserver__notificationReceived__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  uint64_t v2 = [(id)objc_opt_class() hasBeenUnlockedSinceBoot];
  [*v1 setInternalHasBeenUnlockedSinceBoot:v2];
  if (v2)
  {
    v3 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __46__CalDeviceLockObserver__notificationReceived__block_invoke_cold_1();
    }

    id v4 = [*v1 notificationListener];

    if (v4)
    {
      int v5 = [*v1 notificationListener];
      [v5 deactivate];

      [*v1 setNotificationListener:0];
    }
  }
  v6 = [*v1 stateChangedCallback];
  if (v6)
  {
    uint64_t v7 = [*v1 callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CalDeviceLockObserver__notificationReceived__block_invoke_5;
    block[3] = &unk_1E56CD7E8;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __46__CalDeviceLockObserver__notificationReceived__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CalDeviceLockObserver *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E56CE1F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (([*(id *)(a1 + 32) internalHasBeenUnlockedSinceBoot] & 1) == 0)
  {
    v3 = [*v2 notificationListener];

    if (!v3)
    {
      uint64_t v4 = [(id)objc_opt_class() hasBeenUnlockedSinceBoot];
      int v5 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_2((uint64_t)v2, v4);
      }

      [*v2 setInternalHasBeenUnlockedSinceBoot:v4];
      if ((v4 & 1) == 0)
      {
        uint64_t v6 = +[CalFoundationLogSubsystem defaultCategory];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_1((uint64_t *)v2, v6);
        }

        objc_initWeak(&location, *v2);
        uint64_t v7 = [CalDarwinNotificationListener alloc];
        uint64_t v8 = [(id)objc_opt_class() stateChangedNotificationName];
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        dispatch_queue_t v14 = __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_7;
        v15 = &unk_1E56CDCB0;
        objc_copyWeak(&v16, &location);
        char v9 = [(CalDarwinNotificationListener *)v7 initWithNotificationName:v8 callback:&v12];
        objc_msgSend(*v2, "setNotificationListener:", v9, v12, v13, v14, v15);

        dispatch_queue_t v10 = [*v2 notificationListener];
        [v10 activate];

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
  uint64_t result = [*(id *)(a1 + 32) internalHasBeenUnlockedSinceBoot];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notificationReceived];
}

+ (BOOL)hasBeenUnlockedSinceBoot
{
  uint64_t v2 = MKBDeviceUnlockedSinceBoot();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) == 0) {
    return v2 == 1;
  }
  int v5 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[CalDeviceLockObserver hasBeenUnlockedSinceBoot];
  }

  return 0;
}

+ (NSString)stateChangedNotificationName
{
  return (NSString *)[NSString stringWithUTF8String:"com.apple.mobile.keybagd.first_unlock"];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (CalDarwinNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (void)setNotificationListener:(id)a3
{
}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

- (void)setStateChangedCallback:(id)a3
{
}

- (BOOL)internalHasBeenUnlockedSinceBoot
{
  return self->_internalHasBeenUnlockedSinceBoot;
}

- (void)setInternalHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_internalHasBeenUnlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedCallback, 0);
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __46__CalDeviceLockObserver__notificationReceived__block_invoke_cold_1()
{
  v0 = CalBooleanAsString(1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v1, v2, "Deactivating and setting to nil [%@]'s listener since the value of 'hasBeenUnlockedSinceBoot' is now [%@]", v3, v4, v5, v6, v7);
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Starting up [%@]'s listener in order to find out when the value of 'hasBeenUnlockedSinceBoot' should change.", (uint8_t *)&v3, 0xCu);
}

void __49__CalDeviceLockObserver_hasBeenUnlockedSinceBoot__block_invoke_cold_2(uint64_t a1, char a2)
{
  uint64_t v2 = CalBooleanAsString(a2 & 1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_190D88000, v3, v4, "[%@]'s listener is not listening.  Found initial 'hasBeenUnlockedSinceBoot' value of [%@]", v5, v6, v7, v8, v9);
}

+ (void)hasBeenUnlockedSinceBoot
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSNumber numberWithInt:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v4, 0xCu);
}

@end