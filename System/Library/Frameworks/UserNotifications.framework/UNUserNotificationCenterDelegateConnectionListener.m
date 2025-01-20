@interface UNUserNotificationCenterDelegateConnectionListener
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UNUserNotificationCenterDelegateConnectionListener)init;
- (void)_queue_didChangeSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_queue_ensureListenerForBundleIdentifier:(id)a3;
- (void)_queue_invalidateListenerForBundleIdentifier:(id)a3;
- (void)_queue_setDelegate:(id)a3 forBundleIdentifier:(id)a4;
- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4;
- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setDelegate:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNUserNotificationCenterDelegateConnectionListener

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __68__UNUserNotificationCenterDelegateConnectionListener_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(UNUserNotificationCenterDelegateConnectionListener);

  return MEMORY[0x1F41817F8]();
}

- (UNUserNotificationCenterDelegateConnectionListener)init
{
  v14.receiver = self;
  v14.super_class = (Class)UNUserNotificationCenterDelegateConnectionListener;
  v2 = [(UNUserNotificationCenterDelegateConnectionListener *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    listenerByBundleIdentifier = v2->_listenerByBundleIdentifier;
    v2->_listenerByBundleIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    delegateByBundleIdentifier = v2->_delegateByBundleIdentifier;
    v2->_delegateByBundleIdentifier = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.usernotifications.DelegateConnectionListener", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.usernotifications.DelegateConnectionListener.call-out", v10);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)setDelegate:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__UNUserNotificationCenterDelegateConnectionListener_setDelegate_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __86__UNUserNotificationCenterDelegateConnectionListener_setDelegate_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setDelegate:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __127__UNUserNotificationCenterDelegateConnectionListener_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5F060B0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __127__UNUserNotificationCenterDelegateConnectionListener_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveNotificationResponse:forBundleIdentifier:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__UNUserNotificationCenterDelegateConnectionListener_didChangeSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __92__UNUserNotificationCenterDelegateConnectionListener_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeSettings:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationCenterDelegateConnectionListener_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __104__UNUserNotificationCenterDelegateConnectionListener_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didOpenApplicationForResponse:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[UNUserNotificationCenterDelegateService serverInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&__block_literal_global_6];
  [v5 setInvalidationHandler:&__block_literal_global_9];
  [v5 resume];

  return 1;
}

void __89__UNUserNotificationCenterDelegateConnectionListener_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AE729000, v0, OS_LOG_TYPE_DEFAULT, "delegate connection interrupted", v1, 2u);
  }
}

void __89__UNUserNotificationCenterDelegateConnectionListener_listener_shouldAcceptNewConnection___block_invoke_7()
{
  v0 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AE729000, v0, OS_LOG_TYPE_DEFAULT, "delegate connection invalidated", v1, 2u);
  }
}

- (void)_queue_setDelegate:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  delegateByBundleIdentifier = self->_delegateByBundleIdentifier;
  if (v9)
  {
    [(NSMutableDictionary *)delegateByBundleIdentifier setObject:v9 forKey:v7];
    [(UNUserNotificationCenterDelegateConnectionListener *)self _queue_ensureListenerForBundleIdentifier:v7];
  }
  else
  {
    [(NSMutableDictionary *)delegateByBundleIdentifier removeObjectForKey:v7];
    [(UNUserNotificationCenterDelegateConnectionListener *)self _queue_invalidateListenerForBundleIdentifier:v7];
  }
}

- (void)_queue_ensureListenerForBundleIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_listenerByBundleIdentifier objectForKey:v4];
  if (!v5)
  {
    id v6 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Listening for connections to delegate", (uint8_t *)&v8, 0xCu);
    }
    id v7 = +[UNUserNotificationCenterDelegateService serviceNameForBundleIdentifier:v4];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v7];
    [v5 setDelegate:self];
    [(NSMutableDictionary *)self->_listenerByBundleIdentifier setObject:v5 forKey:v4];
    [v5 resume];
  }
}

- (void)_queue_invalidateListenerForBundleIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_listenerByBundleIdentifier objectForKey:v4];
  if (v5)
  {
    id v6 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating listener for delegate", (uint8_t *)&v7, 0xCu);
    }
    [v5 invalidate];
    [(NSMutableDictionary *)self->_listenerByBundleIdentifier removeObjectForKey:v4];
  }
}

- (void)_queue_didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_t v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [v8 actionIdentifier];
    id v14 = [v8 notification];
    v15 = [v14 request];
    id v16 = [v15 identifier];
    id v17 = objc_msgSend(v16, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    id v28 = v9;
    __int16 v29 = 2114;
    v30 = v13;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1AE729000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action %{public}@ response for notification %{public}@", buf, 0x20u);
  }
  id v18 = [(NSMutableDictionary *)self->_delegateByBundleIdentifier objectForKey:v9];
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  id v24 = v18;
  id v25 = v8;
  id v26 = v10;
  id v20 = v10;
  id v21 = v8;
  id v22 = v18;
  dispatch_async(callOutQueue, block);
}

void __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5F060D8;
  id v4 = *(id *)(a1 + 48);
  [v1 didReceiveNotificationResponse:v2 withCompletionHandler:v3];
}

uint64_t __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_queue_didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] changed settings %{public}@", buf, 0x16u);
  }
  id v9 = [(NSMutableDictionary *)self->_delegateByBundleIdentifier objectForKey:v7];
  callOutQueue = self->_callOutQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__UNUserNotificationCenterDelegateConnectionListener__queue_didChangeSettings_forBundleIdentifier___block_invoke;
  v13[3] = &unk_1E5F06128;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  dispatch_async(callOutQueue, v13);
}

uint64_t __99__UNUserNotificationCenterDelegateConnectionListener__queue_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeSettings:*(void *)(a1 + 40)];
}

- (void)_queue_didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 actionIdentifier];
    id v11 = [v6 notification];
    id v12 = [v11 request];
    id v13 = [v12 identifier];
    id v14 = objc_msgSend(v13, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1AE729000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did open application for action %{public}@ response for notification %{public}@", buf, 0x20u);
  }
  id v15 = [(NSMutableDictionary *)self->_delegateByBundleIdentifier objectForKey:v7];
  callOutQueue = self->_callOutQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __111__UNUserNotificationCenterDelegateConnectionListener__queue_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  v19[3] = &unk_1E5F06128;
  id v20 = v15;
  id v21 = v6;
  id v17 = v6;
  id v18 = v15;
  dispatch_async(callOutQueue, v19);
}

uint64_t __111__UNUserNotificationCenterDelegateConnectionListener__queue_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didOpenApplicationForResponse:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateByBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_listenerByBundleIdentifier, 0);
}

@end