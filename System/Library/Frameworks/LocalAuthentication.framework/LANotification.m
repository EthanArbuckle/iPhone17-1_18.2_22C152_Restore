@interface LANotification
+ (BOOL)isAppActive;
+ (void)postNotificationWithNewValue:(id)a3 oldValue:(id)a4;
- (BOOL)appMustBeActive;
- (BOOL)notifyOnResume;
- (LANotification)initWithObserver:(id)a3;
- (LANotificationObserver)observer;
- (LANotificationProxy)proxy;
- (LANotificationXPC)notification;
- (NSObject)oldValue;
- (NSObject)value;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)_notificationNameWhenAppIsActive:(BOOL)a3;
- (id)darwinNotificationForValue:(id)a3;
- (void)_appActivityChanged:(id)a3;
- (void)_checkWaiting;
- (void)_notifyObserverWithAction:(id)a3 completionHandler:(id)a4;
- (void)_observeAppActivity:(BOOL)a3;
- (void)dealloc;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
- (void)postNewValue:(id)a3 oldValue:(id)a4;
- (void)resume;
- (void)setAppMustBeActive:(BOOL)a3;
- (void)setNotifyOnResume:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)suspend;
@end

@implementation LANotification

- (LANotification)initWithObserver:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LANotification;
  v5 = [(LANotification *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_notifyOnResume = 1;
    [(LANotification *)v6 setAppMustBeActive:1];
    v7 = [[LANotificationProxy alloc] initWithTarget:v6];
    proxy = v6->_proxy;
    v6->_proxy = v7;
  }
  return v6;
}

+ (void)postNotificationWithNewValue:(id)a3 oldValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_opt_new();
  [v7 postNewValue:v6 oldValue:v5];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LANotification;
  [(LANotification *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(LANotification *)self value];
  id v7 = [(LANotification *)self oldValue];
  v8 = [(LANotification *)self observer];
  v9 = [v3 stringWithFormat:@"<%@ %p: value: %@, oldValue: %@, observer: %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)resume
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = LA_LOG_6();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "%{public}@ is resuming", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(LANotification *)self notification];
  BOOL v5 = [(LANotification *)self notifyOnResume];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__LANotification_resume__block_invoke;
  v6[3] = &unk_1E63C4890;
  objc_copyWeak(&v7, (id *)buf);
  [v4 resumeAndNotify:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __24__LANotification_resume__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_6();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has resumed", (uint8_t *)&v4, 0xCu);
  }
}

- (void)suspend
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = LA_LOG_6();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1BED06000, v3, OS_LOG_TYPE_INFO, "%{public}@ is suspending", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v4 = [(LANotification *)self notification];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__LANotification_suspend__block_invoke;
  v5[3] = &unk_1E63C4890;
  objc_copyWeak(&v6, (id *)buf);
  [v4 suspendWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __25__LANotification_suspend__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_6();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ has been suspended", (uint8_t *)&v4, 0xCu);
  }
}

- (void)postNewValue:(id)a3 oldValue:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(LANotification *)self darwinNotificationForValue:v6];
  uint64_t v9 = LA_LOG_6();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    id v27 = v7;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is posting newValue: %{public}@, oldValue: %{public}@, darwin notification: %{public}@", buf, 0x2Au);
  }

  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 1u);
  }
  objc_initWeak((id *)buf, self);
  v11 = [(LANotification *)self connection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40__LANotification_postNewValue_oldValue___block_invoke;
  v21[3] = &unk_1E63C48E0;
  v21[4] = self;
  v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__LANotification_postNewValue_oldValue___block_invoke_2;
  v17[3] = &unk_1E63C5680;
  objc_copyWeak(&v20, (id *)buf);
  id v15 = v6;
  id v18 = v15;
  id v16 = v7;
  id v19 = v16;
  [v12 postNotificationOfClassNamed:v14 newValue:v15 oldValue:v16 completionHandler:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __40__LANotification_postNewValue_oldValue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void __40__LANotification_postNewValue_oldValue___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = LA_LOG_6();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138543874;
    id v7 = WeakRetained;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_INFO, "%{public}@ posted newValue: %{public}@, oldValue: %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

+ (BOOL)isAppActive
{
  return (_appIsActive & 1) == 0;
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = a4;
  uint64_t v11 = (void (**)(void))a5;
  objc_storeStrong((id *)&self->_value, a3);
  oldValue = self->_oldValue;
  self->_oldValue = v10;

  if ([(LANotification *)self appMustBeActive] && _appIsActive == 1)
  {
    v13 = LA_LOG_6();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = self;
      _os_log_impl(&dword_1BED06000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait for app activation before notifying observer", (uint8_t *)&v14, 0xCu);
    }

    self->_waitingForActivation = 1;
    v11[2](v11);
  }
  else
  {
    [(LANotification *)self _notifyObserverWithAction:@"has received new value" completionHandler:v11];
  }
}

- (void)_notifyObserverWithAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  __int16 v8 = LA_LOG_6();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@, notifying observer", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(LANotification *)self observer];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(LANotification *)self observer];
    [v11 notification:self completionHandler:v7];
  }
  v7[2](v7);
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = +[LAClient createConnection:0 legacyService:0];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    id v6 = [MEMORY[0x1E4F30BA0] interfaceWithInternalProtocol:&unk_1F19F6298];
    id v7 = [(LANotification *)self connection];
    [v7 setRemoteObjectInterface:v6];

    __int16 v8 = [(LANotification *)self connection];
    [v8 resume];

    connection = self->_connection;
  }

  return connection;
}

- (LANotificationXPC)notification
{
  notification = self->_notification;
  if (!notification)
  {
    uint64_t v4 = [(LANotification *)self connection];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__LANotification_notification__block_invoke;
    v11[3] = &unk_1E63C48E0;
    v11[4] = self;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];
    id v6 = [(LANotification *)self proxy];
    id v7 = (objc_class *)objc_opt_class();
    __int16 v8 = NSStringFromClass(v7);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__LANotification_notification__block_invoke_2;
    v10[3] = &unk_1E63C56A8;
    v10[4] = self;
    [v5 addNotificationObserver:v6 className:v8 completionHandler:v10];

    notification = self->_notification;
  }

  return notification;
}

void __30__LANotification_notification__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void __30__LANotification_notification__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)darwinNotificationForValue:(id)a3
{
  return 0;
}

- (BOOL)appMustBeActive
{
  return self->_appMustBeActive;
}

- (void)setAppMustBeActive:(BOOL)a3
{
  self->_appMustBeActive = a3;
  -[LANotification _observeAppActivity:](self, "_observeAppActivity:");

  [(LANotification *)self _checkWaiting];
}

- (void)_observeAppActivity:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [(LANotification *)self _notificationNameWhenAppIsActive:1];
  id v7 = [(LANotification *)self _notificationNameWhenAppIsActive:0];
  __int16 v8 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v16 = v15;
        if (v3) {
          [v15 addObserver:self selector:sel__appActivityChanged_ name:v14 object:0];
        }
        else {
          [v15 removeObserver:self name:v14 object:0];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)_notificationNameWhenAppIsActive:(BOOL)a3
{
  if (a3) {
    return @"UIApplicationDidBecomeActiveNotification";
  }
  else {
    return @"UIApplicationWillResignActiveNotification";
  }
}

- (void)_appActivityChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = [(LANotification *)self _notificationNameWhenAppIsActive:1];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) != 0
    || ([v4 name],
        __int16 v8 = objc_claimAutoreleasedReturnValue(),
        [(LANotification *)self _notificationNameWhenAppIsActive:0],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v10))
  {
    _appIsActive = v7 ^ 1;
  }
  uint64_t v11 = LA_LOG_6();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(LANotification *)(uint64_t)self _appActivityChanged:v11];
  }

  [(LANotification *)self _checkWaiting];
}

- (void)_checkWaiting
{
  if (self->_waitingForActivation && (_appIsActive != 1 || ![(LANotification *)self appMustBeActive]))
  {
    self->_waitingForActivation = 0;
    [(LANotification *)self _notifyObserverWithAction:@"activated pending notification" completionHandler:&__block_literal_global_14];
  }
}

- (LANotificationObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (LANotificationObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)notifyOnResume
{
  return self->_notifyOnResume;
}

- (void)setNotifyOnResume:(BOOL)a3
{
  self->_notifyOnResume = a3;
}

- (NSObject)value
{
  return self->_value;
}

- (NSObject)oldValue
{
  return self->_oldValue;
}

- (LANotificationProxy)proxy
{
  return self->_proxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_notification, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_appActivityChanged:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 138543874;
  uint64_t v5 = a1;
  if (_appIsActive) {
    BOOL v3 = "inactive";
  }
  else {
    BOOL v3 = "active";
  }
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  __int16 v8 = 2082;
  id v9 = v3;
  _os_log_debug_impl(&dword_1BED06000, log, OS_LOG_TYPE_DEBUG, "%{public}@ received %{public}@, app is %{public}s", (uint8_t *)&v4, 0x20u);
}

@end