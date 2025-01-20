@interface IDSActivityMonitor
- (BOOL)listeningForUpdates;
- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4;
- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5;
- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 xpcConnector:(id)a6;
- (IDSActivityMonitorListenerDelegate)delegate;
- (NSArray)subscriptions;
- (NSString)activity;
- (NSString)activityIdentifier;
- (OS_dispatch_queue)queue;
- (_IDSActivityMonitorXPCConnector)XPCConnector;
- (void)beginBroadcastingWithInfo:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5;
- (void)setActivityIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListeningForUpdates:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setXPCConnector:(id)a3;
- (void)stopBroadcastingForSubActivity:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSActivityMonitor

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[_IDSActivityMonitorXPCConnector weakSharedInstance];
  v9 = [(IDSActivityMonitor *)self initWithActivity:v7 serviceIdentifier:v6 queue:0 xpcConnector:v8];

  return v9;
}

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_IDSActivityMonitorXPCConnector weakSharedInstance];
  v12 = [(IDSActivityMonitor *)self initWithActivity:v10 serviceIdentifier:v9 queue:v8 xpcConnector:v11];

  return v12;
}

- (IDSActivityMonitor)initWithActivity:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 xpcConnector:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (OS_dispatch_queue *)a5;
  id v14 = a6;
  if (v14 && [v11 length] && objc_msgSend(v12, "length"))
  {
    v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Creaating new activity monitor with activity %@ service identifier %@", buf, 0x16u);
    }

    v23.receiver = self;
    v23.super_class = (Class)IDSActivityMonitor;
    v16 = [(IDSActivityMonitor *)&v23 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_activity, a3);
      objc_storeStrong((id *)&v17->_XPCConnector, a6);
      uint64_t v18 = [NSString stringWithFormat:@"%@-%@", v12, v11];
      activityIdentifier = v17->_activityIdentifier;
      v17->_activityIdentifier = (NSString *)v18;

      v20 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      if (v13) {
        v20 = v13;
      }
      v17->_queue = v20;
    }
    self = v17;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)dealloc
{
  XPCConnector = self->_XPCConnector;
  v4 = [(IDSActivityMonitor *)self activityIdentifier];
  [(_IDSActivityMonitorXPCConnector *)XPCConnector removeListener:self forTopic:v4];

  v5.receiver = self;
  v5.super_class = (Class)IDSActivityMonitor;
  [(IDSActivityMonitor *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    id v6 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IDSActivityMonitor *)self activityIdentifier];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Adding delegate %@ to activity monitor %@", (uint8_t *)&v10, 0x16u);
    }
    objc_storeWeak((id *)&self->_delegate, v4);
    id v8 = [(IDSActivityMonitor *)self XPCConnector];
    id v9 = [(IDSActivityMonitor *)self activityIdentifier];
    if (v4) {
      [v8 addListener:self forTopic:v9];
    }
    else {
      [v8 removeListener:self forTopic:v9];
    }
  }
}

- (void)beginBroadcastingWithInfo:(id)a3 withCompletion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F6C3B8];
  objc_super v5 = (void (**)(id, void *))a4;
  id v6 = [v4 registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_191A2D10C(v6);
  }

  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ids.activity.error" code:-600 userInfo:0];
  v5[2](v5, v7);
}

- (void)stopBroadcastingForSubActivity:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    id v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Stopping broadcast with subActivity %@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v9 = [(IDSActivityMonitor *)self XPCConnector];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19193EBF0;
    v11[3] = &unk_1E5729E78;
    objc_copyWeak(&v14, (id *)buf);
    id v12 = v6;
    id v13 = v7;
    [v9 performAction:v11 errorHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ids.activity.error" code:-100 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (BOOL)listeningForUpdates
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Getting listening status for self: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(IDSActivityMonitor *)self XPCConnector];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19193EDD8;
  v7[3] = &unk_1E5729EC8;
  v7[4] = self;
  v7[5] = &buf;
  [v4 performSyncAction:v7];

  char v5 = *(unsigned char *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (void)setListeningForUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    BOOL v10 = v3;
    __int16 v11 = 2112;
    id v12 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Set listening for updates %d on self %@", buf, 0x12u);
  }

  id v6 = [(IDSActivityMonitor *)self XPCConnector];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19193F03C;
  v7[3] = &unk_1E5729EF0;
  BOOL v8 = v3;
  v7[4] = self;
  [v6 performSyncAction:v7];
}

- (NSArray)subscriptions
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = sub_191918670;
  __int16 v11 = sub_191918558;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = [MEMORY[0x1E4F1C978] array];
  BOOL v3 = [(IDSActivityMonitor *)self XPCConnector];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19193F258;
  v6[3] = &unk_1E5729EC8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performSyncAction:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)handleIncomingUpdate:(id)a3 onActivity:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(IDSActivityMonitor *)self delegate];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_19193F534;
  v14[3] = &unk_1E5729A88;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (IDSActivityMonitorListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSActivityMonitorListenerDelegate *)WeakRetained;
}

- (NSString)activity
{
  return self->_activity;
}

- (_IDSActivityMonitorXPCConnector)XPCConnector
{
  return self->_XPCConnector;
}

- (void)setXPCConnector:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_XPCConnector, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end