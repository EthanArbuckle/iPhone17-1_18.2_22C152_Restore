@interface AFUserNotificationAnnouncementSpeakingStateObserver
- (AFUserNotificationAnnouncementSpeakingStateObserver)initWithQueue:(id)a3 delegate:(id)a4;
- (id)_connection;
- (id)_currentConnection;
- (void)_cleanUpConnection;
- (void)_notifyObserverOfFailureForAllObservingNotifications;
- (void)_removeObserverForNotificationRequestIdentifier:(id)a3;
- (void)_speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4;
- (void)_startObservingNotificationWithRequestIdentifier:(id)a3;
- (void)_tearDown;
- (void)cleanUpConnection;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)invalidate;
- (void)speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4;
- (void)startObservingNotificationWithRequestIdentifier:(id)a3;
- (void)stopObservingNotificationWithRequestIdentifier:(id)a3;
@end

@implementation AFUserNotificationAnnouncementSpeakingStateObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observingNotifications, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_cleanUpConnection
{
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)cleanUpConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AFUserNotificationAnnouncementSpeakingStateObserver_cleanUpConnection__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __72__AFUserNotificationAnnouncementSpeakingStateObserver_cleanUpConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnection];
}

- (void)connectionInterrupted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFUserNotificationAnnouncementSpeakingStateObserver connectionInterrupted]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInterrupted__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpConnection];
  v2 = *(void **)(a1 + 32);
  return [v2 _notifyObserverOfFailureForAllObservingNotifications];
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFUserNotificationAnnouncementSpeakingStateObserver connectionInvalidated]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __76__AFUserNotificationAnnouncementSpeakingStateObserver_connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpConnection];
}

- (void)_tearDown
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _tearDown]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableSet *)self->_observingNotifications removeAllObjects];
  [(AFUserNotificationAnnouncementSpeakingStateObserver *)self _cleanUpConnection];
}

- (void)_notifyObserverOfFailureForAllObservingNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_observingNotifications count])
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      observingNotifications = self->_observingNotifications;
      int v7 = 136315394;
      uint64_t v8 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _notifyObserverOfFailureForAllObservingNotifications]";
      __int16 v9 = 2112;
      v10 = observingNotifications;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Notifying all identifiers as failed. %@", (uint8_t *)&v7, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [(NSMutableSet *)self->_observingNotifications allObjects];
    [WeakRetained notificationAnnouncementObserver:self announcementSpeakingStateDidUpdate:4 forNotificationRequestIdentifiers:v5];

    [(NSMutableSet *)self->_observingNotifications removeAllObjects];
  }
}

- (id)_currentConnection
{
  v2 = [(AFUserNotificationAnnouncementSpeakingStateObserver *)self _connection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_28885];

  return v3;
}

void __73__AFUserNotificationAnnouncementSpeakingStateObserver__currentConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _currentConnection]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.announcement_state.service" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    __int16 v6 = self->_connection;
    id v7 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEC33A0];
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    uint64_t v8 = self->_connection;
    id v9 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEE6D68];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    objc_initWeak(&location, self);
    v10 = self->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke;
    v15[3] = &unk_1E592B978;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:v15];
    uint64_t v11 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke_2;
    v13[3] = &unk_1E592B978;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v11 setInterruptionHandler:v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void __66__AFUserNotificationAnnouncementSpeakingStateObserver__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInterrupted];
}

- (void)_speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(NSMutableSet *)self->_observingNotifications count])
  {
    id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    [v7 intersectSet:self->_observingNotifications];
    uint64_t v8 = [v7 count];
    id v9 = AFSiriLogContextConnection;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        if ((unint64_t)a3 > 5) {
          uint64_t v11 = @"(unknown)";
        }
        else {
          uint64_t v11 = *(&off_1E5925C68 + a3);
        }
        v13 = v11;
        int v16 = 136315650;
        v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v7;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = [v7 allObjects];
      [WeakRetained notificationAnnouncementObserver:self announcementSpeakingStateDidUpdate:a3 forNotificationRequestIdentifiers:v15];
    }
    else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
      _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Received a notification for speaking state changes, but we're not observing any of them.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _speakingStateDidChange:forIdentifiers:]";
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Received a notification for speaking state changes, but no observers.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_removeObserverForNotificationRequestIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(NSMutableSet *)self->_observingNotifications containsObject:v4];
  id v6 = AFSiriLogContextConnection;
  BOOL v7 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Removing speaking state observer for notification request identifier %@", (uint8_t *)&v9, 0x16u);
    }
    [(NSMutableSet *)self->_observingNotifications removeObject:v4];
    if (![(NSMutableSet *)self->_observingNotifications count])
    {
      uint64_t v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
        _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s No longer observing any notifications. Closing connection.", (uint8_t *)&v9, 0xCu);
      }
      [(AFUserNotificationAnnouncementSpeakingStateObserver *)self _cleanUpConnection];
    }
  }
  else if (v7)
  {
    int v9 = 136315394;
    v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _removeObserverForNotificationRequestIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Not currently observing for notification request identifier %@, ignoring.", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_startObservingNotificationWithRequestIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_observingNotifications containsObject:v4])
  {
    char v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _startObservingNotificationWithRequestIdentifier:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Already observing notification request identifier %@, ignoring.", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = [(NSMutableSet *)self->_observingNotifications count];
    BOOL v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[AFUserNotificationAnnouncementSpeakingStateObserver _startObservingNotificationWithRequestIdentifier:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s Adding speaking state observer for notification request identifier %@", (uint8_t *)&v9, 0x16u);
    }
    [(NSMutableSet *)self->_observingNotifications addObject:v4];
    if (!v6)
    {
      uint64_t v8 = [(AFUserNotificationAnnouncementSpeakingStateObserver *)self _currentConnection];
      [v8 beginObserving];
    }
  }
}

- (void)speakingStateDidChange:(int64_t)a3 forIdentifiers:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__AFUserNotificationAnnouncementSpeakingStateObserver_speakingStateDidChange_forIdentifiers___block_invoke;
  block[3] = &unk_1E592B3C0;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __93__AFUserNotificationAnnouncementSpeakingStateObserver_speakingStateDidChange_forIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speakingStateDidChange:*(void *)(a1 + 48) forIdentifiers:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFUserNotificationAnnouncementSpeakingStateObserver_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__AFUserNotificationAnnouncementSpeakingStateObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDown];
}

- (void)stopObservingNotificationWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __102__AFUserNotificationAnnouncementSpeakingStateObserver_stopObservingNotificationWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E592C710;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

uint64_t __102__AFUserNotificationAnnouncementSpeakingStateObserver_stopObservingNotificationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserverForNotificationRequestIdentifier:*(void *)(a1 + 40)];
}

- (void)startObservingNotificationWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __103__AFUserNotificationAnnouncementSpeakingStateObserver_startObservingNotificationWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E592C710;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

uint64_t __103__AFUserNotificationAnnouncementSpeakingStateObserver_startObservingNotificationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObservingNotificationWithRequestIdentifier:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(AFUserNotificationAnnouncementSpeakingStateObserver *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)AFUserNotificationAnnouncementSpeakingStateObserver;
  [(AFUserNotificationAnnouncementSpeakingStateObserver *)&v3 dealloc];
}

- (AFUserNotificationAnnouncementSpeakingStateObserver)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUserNotificationAnnouncementSpeakingStateObserver;
  int v9 = [(AFUserNotificationAnnouncementSpeakingStateObserver *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    observingNotifications = v10->_observingNotifications;
    v10->_observingNotifications = (NSMutableSet *)v11;
  }
  return v10;
}

@end