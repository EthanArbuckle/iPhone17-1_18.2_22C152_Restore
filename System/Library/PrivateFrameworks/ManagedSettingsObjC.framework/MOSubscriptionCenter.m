@interface MOSubscriptionCenter
+ (MOSubscriptionCenter)sharedCenter;
- (MOPassthroughSubject)effectiveSubject;
- (MOSubscriptionCenter)init;
- (NSMutableDictionary)effectiveSubscriptions;
- (NSObject)connectionLock;
- (NSObject)subscriptionLock;
- (NSSet)effectiveInterestedGroups;
- (NSXPCConnection)currentConnection;
- (NSXPCConnection)xpcConnection;
- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3;
- (void)dealloc;
- (void)effectiveSettingsChangedForGroups:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)subscribeForEffectiveChanges:(id)a3 identifier:(id)a4;
- (void)unsubscribeFromEffectiveChanges:(id)a3;
- (void)updateSubscription;
@end

@implementation MOSubscriptionCenter

- (NSSet)effectiveInterestedGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(MOSubscriptionCenter *)self effectiveSubscriptions];
  v3 = [v2 allValues];

  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "unionSet:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = (void *)[v4 copy];
  return (NSSet *)v10;
}

- (NSMutableDictionary)effectiveSubscriptions
{
  return self->_effectiveSubscriptions;
}

uint64_t __36__MOSubscriptionCenter_sharedCenter__block_invoke()
{
  sharedCenter__sharedCenter = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (MOSubscriptionCenter)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOSubscriptionCenter;
  v2 = [(MOSubscriptionCenter *)&v12 init];
  uint64_t v3 = objc_opt_new();
  effectiveSubscriptions = v2->_effectiveSubscriptions;
  v2->_effectiveSubscriptions = (NSMutableDictionary *)v3;

  uint64_t v5 = objc_opt_new();
  effectiveSubject = v2->_effectiveSubject;
  v2->_effectiveSubject = (MOPassthroughSubject *)v5;

  uint64_t v7 = objc_opt_new();
  subscriptionLock = v2->_subscriptionLock;
  v2->_subscriptionLock = v7;

  uint64_t v9 = objc_opt_new();
  connectionLock = v2->_connectionLock;
  v2->_connectionLock = v9;

  return v2;
}

+ (MOSubscriptionCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedCenter__sharedCenter;
  return (MOSubscriptionCenter *)v2;
}

- (void)subscribeForEffectiveChanges:(id)a3 identifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 count])
  {
    uint64_t v7 = self->_subscriptionLock;
    objc_sync_enter(v7);
    uint64_t v8 = [(MOSubscriptionCenter *)self effectiveInterestedGroups];
    [(NSMutableDictionary *)self->_effectiveSubscriptions setObject:v11 forKeyedSubscript:v6];
    uint64_t v9 = [(MOSubscriptionCenter *)self effectiveInterestedGroups];
    char v10 = [v8 isEqualToSet:v9];

    objc_sync_exit(v7);
    if ((v10 & 1) == 0) {
      [(MOSubscriptionCenter *)self updateSubscription];
    }
  }
  else
  {
    [(MOSubscriptionCenter *)self unsubscribeFromEffectiveChanges:v6];
  }
}

- (void)updateSubscription
{
  uint64_t v3 = self->_subscriptionLock;
  objc_sync_enter(v3);
  v4 = [(MOSubscriptionCenter *)self effectiveInterestedGroups];
  objc_sync_exit(v3);

  uint64_t v5 = [(MOSubscriptionCenter *)self xpcConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MOSubscriptionCenter_updateSubscription__block_invoke;
  v7[3] = &unk_1E61CC388;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  +[MOXPCRemoteObjectProxy proxyFromConnection:v5 withRetryCount:1 proxyHandler:v7];
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v3 = self->_connectionLock;
  objc_sync_enter(v3);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    id v6 = +[MOManagedSettingsAgentPublisherConnection newConnectionWithExportedObject:self];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__MOSubscriptionCenter_xpcConnection__block_invoke;
    v11[3] = &unk_1E61CBE28;
    objc_copyWeak(&v12, &location);
    [v6 setInterruptionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MOSubscriptionCenter_xpcConnection__block_invoke_2;
    v9[3] = &unk_1E61CBE28;
    objc_copyWeak(&v10, &location);
    [v6 setInvalidationHandler:v9];
    objc_storeStrong((id *)p_currentConnection, v6);
    [v6 activate];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
  }
  uint64_t v7 = currentConnection;
  objc_sync_exit(v3);

  return v7;
}

- (MOPassthroughSubject)effectiveSubject
{
  return self->_effectiveSubject;
}

void __42__MOSubscriptionCenter_updateSubscription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    id v8 = +[MOLogger subscription];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Subscribing for effective changes in groups: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      [v5 subscribeToEffectiveChangesForGroups:*(void *)(a1 + 32) objC:1];
    }
    else
    {
      if (v9)
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B8ED1000, v8, OS_LOG_TYPE_DEFAULT, "Clearing effective settings change subscriptions", (uint8_t *)&v12, 2u);
      }

      [v5 clearEffectiveSubscription:1];
      [*(id *)(a1 + 40) clearCurrentConnectionAndInvalidate:1];
    }
  }
  else
  {
    id v11 = +[MOLogger subscription];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __42__MOSubscriptionCenter_updateSubscription__block_invoke_cold_1((uint64_t)v6, v11);
    }
  }
}

- (void)dealloc
{
  [(MOSubscriptionCenter *)self clearCurrentConnectionAndInvalidate:1];
  v3.receiver = self;
  v3.super_class = (Class)MOSubscriptionCenter;
  [(MOSubscriptionCenter *)&v3 dealloc];
}

void __37__MOSubscriptionCenter_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:1];
  [WeakRetained updateSubscription];
}

void __37__MOSubscriptionCenter_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentConnectionAndInvalidate:0];
}

- (void)clearCurrentConnectionAndInvalidate:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_connectionLock;
  objc_sync_enter(obj);
  if (v3)
  {
    [(NSXPCConnection *)self->_currentConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_currentConnection invalidate];
  }
  currentConnection = self->_currentConnection;
  self->_currentConnection = 0;

  objc_sync_exit(obj);
}

- (void)unsubscribeFromEffectiveChanges:(id)a3
{
  id v9 = a3;
  v4 = self->_subscriptionLock;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_effectiveSubscriptions objectForKeyedSubscript:v9];

  if (v5)
  {
    id v6 = [(MOSubscriptionCenter *)self effectiveInterestedGroups];
    [(NSMutableDictionary *)self->_effectiveSubscriptions setObject:0 forKeyedSubscript:v9];
    uint64_t v7 = [(MOSubscriptionCenter *)self effectiveInterestedGroups];
    char v8 = [v6 isEqualToSet:v7];

    objc_sync_exit(v4);
    if ((v8 & 1) == 0) {
      [(MOSubscriptionCenter *)self updateSubscription];
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)effectiveSettingsChangedForGroups:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[MOLogger subscription];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1B8ED1000, v5, OS_LOG_TYPE_DEFAULT, "Effective settings changed for groups: %{public}@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__MOSubscriptionCenter_effectiveSettingsChangedForGroups___block_invoke;
    v6[3] = &unk_1E61CC3B0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __58__MOSubscriptionCenter_effectiveSettingsChangedForGroups___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) effectiveSubject];
  [v2 sendValue:*(void *)(a1 + 40)];
}

- (NSObject)subscriptionLock
{
  return self->_subscriptionLock;
}

- (NSXPCConnection)currentConnection
{
  return self->_currentConnection;
}

- (void)setCurrentConnection:(id)a3
{
}

- (NSObject)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_subscriptionLock, 0);
  objc_storeStrong((id *)&self->_effectiveSubscriptions, 0);
  objc_storeStrong((id *)&self->_effectiveSubject, 0);
}

void __42__MOSubscriptionCenter_updateSubscription__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8ED1000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain remote object proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end