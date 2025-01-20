@interface _MPActiveUserChangeMonitor
- (NSMutableSet)receivedNotifications;
- (NSSet)expectedNotifications;
- (OS_dispatch_source)notificationTimer;
- (_MPActiveUserChangeMonitor)initWithDelegate:(id)a3;
- (_MPActiveUserChangeMonitorDelegate)delegate;
- (os_unfair_lock_s)stateLock;
- (void)_cancelNotificationTimerWithReason:(id)a3;
- (void)_startNotificationTimerWithEventHandler:(id)a3;
- (void)ingestNotificationName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationTimer:(id)a3;
- (void)setReceivedNotifications:(id)a3;
@end

@implementation _MPActiveUserChangeMonitor

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_receivedNotifications, 0);

  objc_storeStrong((id *)&self->_expectedNotifications, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_MPActiveUserChangeMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MPActiveUserChangeMonitorDelegate *)WeakRetained;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (void)setNotificationTimer:(id)a3
{
}

- (OS_dispatch_source)notificationTimer
{
  return self->_notificationTimer;
}

- (void)setReceivedNotifications:(id)a3
{
}

- (NSMutableSet)receivedNotifications
{
  return self->_receivedNotifications;
}

- (NSSet)expectedNotifications
{
  return self->_expectedNotifications;
}

- (void)_cancelNotificationTimerWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_MPActiveUserChangeMonitor.m" lineNumber:87 description:@"Must provide a reason for logging."];
  }
  v6 = [(_MPActiveUserChangeMonitor *)self notificationTimer];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
      int v11 = 134218498;
      v12 = self;
      __int16 v13 = 2048;
      v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_INFO, "<_MPActiveUserChangeMonitor %p> - Canceled notification timer %p [%{public}@]", (uint8_t *)&v11, 0x20u);
    }
    v9 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
    dispatch_source_cancel(v9);

    [(_MPActiveUserChangeMonitor *)self setNotificationTimer:0];
  }
}

- (void)_startNotificationTimerWithEventHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_MPActiveUserChangeMonitor *)self notificationTimer];

  if (v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_MPActiveUserChangeMonitor.m" lineNumber:77 description:@"Cancel existing timer before starting a new one."];
  }
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
  [(_MPActiveUserChangeMonitor *)self setNotificationTimer:v7];

  v8 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
  dispatch_time_t v9 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  v10 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
  dispatch_source_set_event_handler(v10, v5);

  int v11 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
  dispatch_resume(v11);

  v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = [(_MPActiveUserChangeMonitor *)self notificationTimer];
    int v15 = 134218240;
    id v16 = self;
    __int16 v17 = 2048;
    v18 = v13;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_INFO, "<_MPActiveUserChangeMonitor %p> - Started notification timer %p", (uint8_t *)&v15, 0x16u);
  }
}

- (void)ingestNotificationName:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  id v5 = [(_MPActiveUserChangeMonitor *)self expectedNotifications];
  if ([v5 containsObject:v4])
  {
    v6 = [(_MPActiveUserChangeMonitor *)self receivedNotifications];
    int v7 = [v6 containsObject:v4];

    if (!v7)
    {
      v8 = [(_MPActiveUserChangeMonitor *)self receivedNotifications];
      [v8 addObject:v4];

      dispatch_time_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(_MPActiveUserChangeMonitor *)self receivedNotifications];
        uint64_t v11 = [v10 count];
        v12 = [(_MPActiveUserChangeMonitor *)self expectedNotifications];
        *(_DWORD *)buf = 134218754;
        v23 = self;
        __int16 v24 = 2114;
        id v25 = v4;
        __int16 v26 = 2048;
        uint64_t v27 = v11;
        __int16 v28 = 2048;
        uint64_t v29 = [v12 count];
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "<_MPActiveUserChangeMonitor %p> - Ingesting notification %{public}@ [%ld of %ld]", buf, 0x2Au);
      }
      __int16 v13 = [NSString stringWithFormat:@"Received %@", v4];
      [(_MPActiveUserChangeMonitor *)self _cancelNotificationTimerWithReason:v13];

      v14 = [(_MPActiveUserChangeMonitor *)self receivedNotifications];
      int v15 = [(_MPActiveUserChangeMonitor *)self expectedNotifications];
      int v16 = [v14 isEqualToSet:v15];

      __int16 v17 = [(_MPActiveUserChangeMonitor *)self receivedNotifications];
      v18 = v17;
      if (v16)
      {
        [v17 removeAllObjects];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke;
        block[3] = &unk_1E57F9EA8;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        int v19 = [v17 containsObject:@"MPMediaLibraryPathDidChangeNotification"];

        if (v19)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_2;
          v20[3] = &unk_1E57F9EA8;
          v20[4] = self;
          [(_MPActiveUserChangeMonitor *)self _startNotificationTimerWithEventHandler:v20];
        }
      }
    }
  }
  else
  {
  }
  os_unfair_lock_unlock(&self->_stateLock);
}

- (_MPActiveUserChangeMonitor)initWithDelegate:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPActiveUserChangeMonitor;
  id v5 = [(_MPActiveUserChangeMonitor *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    int v7 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = @"MPMediaLibraryPathDidChangeNotification";
    v15[1] = @"MPMediaLibraryDidChangeNotification";
    v15[2] = *MEMORY[0x1E4FB8350];
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    uint64_t v9 = [v7 setWithArray:v8];
    expectedNotifications = v6->_expectedNotifications;
    v6->_expectedNotifications = (NSSet *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSSet count](v6->_expectedNotifications, "count"));
    receivedNotifications = v6->_receivedNotifications;
    v6->_receivedNotifications = (NSMutableSet *)v11;

    v6->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

@end