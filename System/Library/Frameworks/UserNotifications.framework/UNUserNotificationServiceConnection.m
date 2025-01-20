@interface UNUserNotificationServiceConnection
+ (id)sharedInstance;
- (NSMutableDictionary)observersByBundleIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callOutQueue;
- (OS_dispatch_queue)queue;
- (UNUserNotificationServiceConnection)init;
- (id)_queue_ensureConnection;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)clearedInfoForBundleIdentifier:(id)a3;
- (id)deliveredNotificationsForBundleIdentifier:(id)a3;
- (id)notificationCategoriesForBundleIdentifier:(id)a3;
- (id)notificationSettingsForBundleIdentifier:(id)a3;
- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3;
- (id)notificationTopicsForBundleIdentifier:(id)a3;
- (id)pendingNotificationRequestsForBundleIdentifier:(id)a3;
- (void)_invalidate;
- (void)_queue_addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_interruptedConnection;
- (void)_queue_invalidatedConnection;
- (void)_queue_removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)performBlockOnConnectionQueue:(id)a3;
- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setCallOutQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setObserversByBundleIdentifier:(id)a3;
- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation UNUserNotificationServiceConnection

uint64_t __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_75(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_91(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2_22;
  v8[3] = &unk_1E5F06710;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getNotificationCategoriesForBundleIdentifier:v9 withCompletionHandler:v8];
}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2_71;
  v8[3] = &unk_1E5F068D8;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getBadgeNumberForBundleIdentifier:v9 withCompletionHandler:v8];
}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2_22(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v3 count];
    BOOL v8 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)buf = 138543874;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = v8;
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld notification categories [ hasCompletionHandler: %d ]", buf, 0x1Cu);
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_23;
  v12[3] = &unk_1E5F06580;
  id v10 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v10;
  id v11 = v3;
  dispatch_async(v9, v12);
}

void __85__UNUserNotificationServiceConnection_setNotificationCategories_forBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 remoteObjectProxy];
  [v2 setNotificationCategories:*(void *)(a1 + 40) forBundleIdentifier:*(void *)(a1 + 48)];
}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    *(_DWORD *)buf = 138543618;
    id v33 = v6;
    __int16 v34 = 2048;
    uint64_t v35 = [v5 count];
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification categories", buf, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 addObject:v15];
        }
        else
        {
          uint64_t v16 = (void *)UNLogConnections;
          if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
          {
            __int16 v17 = v16;
            uint64_t v18 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v33 = v6;
            __int16 v34 = 2114;
            uint64_t v35 = (uint64_t)v18;
            id v19 = v18;
            _os_log_error_impl(&dword_1AE729000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Expected a UNNotificationCategory: %{public}@", buf, 0x16u);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__UNUserNotificationServiceConnection_setNotificationCategories_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  block[4] = self;
  id v25 = v9;
  id v26 = v6;
  id v21 = v6;
  id v22 = v9;
  dispatch_sync(queue, block);
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 48);
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_6;
  v9[3] = &unk_1E5F065F8;
  id v10 = v7;
  id v8 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 requestAuthorizationWithOptions:v6 forBundleIdentifier:v10 completionHandler:v9];
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_1AE729000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", buf, 0x16u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E5F06620;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 56);
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_83;
  v9[3] = &unk_1E5F06738;
  id v10 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 setNotificationTopics:v7 forBundleIdentifier:v10 withCompletionHandler:v9];
}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1AE729000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting topics %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F06760;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(queue, v16);
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 56);
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_77;
  v9[3] = &unk_1E5F06738;
  id v10 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 setBadgeCount:v7 forBundleIdentifier:v10 withCompletionHandler:v9];
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1AE729000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge count to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F06760;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(queue, v16);
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 56);
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_74;
  v9[3] = &unk_1E5F06738;
  id v10 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 setBadgeNumber:v7 forBundleIdentifier:v10 withCompletionHandler:v9];
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1AE729000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge number to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F06760;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(queue, v16);
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_90;
  v8[3] = &unk_1E5F06900;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getNotificationSettingsForTopicsWithBundleIdentifier:v9 withCompletionHandler:v8];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return v2;
}

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_12;
  v7[3] = &unk_1E5F06670;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getNotificationSettingsForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2_15;
  v8[3] = &unk_1E5F066C0;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getNotificationSettingsForBundleIdentifier:v9 withCompletionHandler:v8];
}

- (id)_queue_ensureConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    id v4 = @"com.apple.usernotifications.usernotificationservice";
    if (_os_feature_enabled_impl())
    {
      id v5 = @"com.apple.usernotifications.listener";

      id v4 = v5;
    }
    id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:0];
    id v7 = self->_connection;
    self->_connection = v6;

    id v8 = self->_connection;
    id v9 = +[UNUserNotificationService serverInterface];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    id v10 = self->_connection;
    id v11 = +[UNUserNotificationService clientInterface];
    [(NSXPCConnection *)v10 setExportedInterface:v11];

    id v12 = self->_connection;
    id v13 = objc_loadWeakRetained(&location);
    [(NSXPCConnection *)v12 setExportedObject:v13];

    objc_initWeak(&from, self->_queue);
    id v14 = self->_connection;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke;
    v23[3] = &unk_1E5F069A0;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v14 setInterruptionHandler:v23];
    id v15 = self->_connection;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_3;
    __int16 v20 = &unk_1E5F069A0;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)v15 setInvalidationHandler:&v17];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topic settings", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __53__UNUserNotificationServiceConnection_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = objc_alloc_init(UNUserNotificationServiceConnection);

  return MEMORY[0x1F41817F8]();
}

- (UNUserNotificationServiceConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)UNUserNotificationServiceConnection;
  v2 = [(UNUserNotificationServiceConnection *)&v12 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByBundleIdentifier = v2->_observersByBundleIdentifier;
    v2->_observersByBundleIdentifier = v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationServiceConnection", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationServiceConnection.call-out", v8);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2_15(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v3 != 0;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_16;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    BOOL v11 = v3 != 0;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d ]", (uint8_t *)&v8, 0x12u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

uint64_t __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_72(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_90(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get topic settings [ hasCompletionHandler: %d ]", buf, 0x12u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_91;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_74(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v3 != 0;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge number [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_75;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_77(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v3 != 0;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge count [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_78;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_83(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v3 != 0;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set topics [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_84;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_6(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138544130;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 1024;
    BOOL v23 = v8;
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested authorization [ didGrant: %d hasError: %d hasCompletionHandler: %d ]", buf, 0x1Eu);
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_7;
  block[3] = &unk_1E5F065D0;
  id v10 = *(id *)(a1 + 48);
  char v15 = a2;
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2_71(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got badge number [ badge: %@ hasCompletionHandler: %d ]", buf, 0x1Cu);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_72;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__UNUserNotificationServiceConnection_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __71__UNUserNotificationServiceConnection_addObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__UNUserNotificationServiceConnection_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __74__UNUserNotificationServiceConnection_removeObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__UNUserNotificationServiceConnection_setObservingUserNotifications_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06558;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __89__UNUserNotificationServiceConnection_setObservingUserNotifications_forBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 remoteObjectProxy];
  [v2 setObservingUserNotifications:*(unsigned __int8 *)(a1 + 48) forBundleIdentifier:*(void *)(a1 + 40)];
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_4;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_10;
  v8[3] = &unk_1E5F065F8;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 requestRemoveAuthorizationForBundleIdentifier:v9 completionHandler:v8];
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_9;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_10(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138544130;
    uint64_t v17 = v7;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 1024;
    BOOL v21 = v5 != 0;
    __int16 v22 = 1024;
    BOOL v23 = v8;
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested remove authorization [ didGrant: %d hasError: %d hasCompletionHandler: %d ]", buf, 0x1Eu);
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_11;
  block[3] = &unk_1E5F065D0;
  id v10 = *(id *)(a1 + 48);
  char v15 = a2;
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_async(v9, block);
}

uint64_t __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_14;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)notificationCategoriesForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_19;
  v7[3] = &unk_1E5F066E8;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getNotificationCategoriesForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld notification categories", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_21;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = UNSafeCast(v11, v8);
  if (v12)
  {
    uint64_t v13 = [v8 destinations];
    uint64_t v14 = (id)UNLogConnections;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = [v12 identifier];
      objc_msgSend(v21, "un_logDigest");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = v10;
      if (v13 == 15)
      {
        BOOL v23 = @"Default";
      }
      else
      {
        UNNotificationDestinationStrings(v13);
        BOOL v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      id v17 = [v8 content];
      uint64_t v18 = [v17 date];
      int v19 = objc_msgSend(v18, "un_logString");
      *(_DWORD *)long long buf = 138544130;
      id v29 = v9;
      __int16 v30 = 2114;
      id v31 = v15;
      __int16 v32 = 2114;
      id v33 = v23;
      __int16 v34 = 2114;
      uint64_t v35 = v19;
      _os_log_impl(&dword_1AE729000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification request %{public}@ to destinations: %{public}@, contentDate: %{public}@", buf, 0x2Au);

      if (v13 != 15) {
      id v10 = v22;
      }
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5F06760;
    void block[4] = self;
    id v25 = v9;
    id v27 = v10;
    id v26 = v12;
    dispatch_sync(queue, block);
  }
  else
  {
    id v16 = (void *)UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
      -[UNUserNotificationServiceConnection addNotificationRequest:forBundleIdentifier:withCompletionHandler:]((uint64_t)v9, v16);
    }
  }
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 56);
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_27;
  v9[3] = &unk_1E5F06738;
  id v10 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 addNotificationRequest:v7 forBundleIdentifier:v10 withCompletionHandler:v9];
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_26;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_27(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v3 != 0;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Added notification request: [ hasError: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_28;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  __int16 v15 = UNSafeCast(v14, v12);
  BOOL v16 = (void *)UNLogConnections;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v16;
      BOOL v18 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)long long buf = 138543618;
      id v26 = v11;
      __int16 v27 = 2114;
      long long v28 = v18;
      _os_log_impl(&dword_1AE729000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing notification content %{public}@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke;
    block[3] = &unk_1E5F06788;
    void block[4] = self;
    id v21 = v11;
    id v24 = v13;
    id v22 = v10;
    id v23 = v15;
    dispatch_sync(queue, block);
  }
  else if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
  {
    -[UNUserNotificationServiceConnection replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:]((uint64_t)v11, v16);
  }
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = *(id *)(a1 + 64);
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v14];
  BOOL v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_31;
  v10[3] = &unk_1E5F06738;
  id v11 = v6;
  id v9 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v9;
  [v5 replaceContentForRequestWithIdentifier:v7 bundleIdentifier:v11 replacementContent:v8 completionHandler:v10];
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_30;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_31(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v3 != 0;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaced notification content: [ hasError: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_32;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_32(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 addObject:v15];
        }
        else {
          NSLog((NSString *)@"Expected a UNNotificationRequest: %@", v15);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5F06088;
  id v20 = v8;
  id v21 = v9;
  id v22 = self;
  id v17 = v9;
  id v18 = v8;
  dispatch_sync(queue, block);
}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a1[4];
    id v3 = a1[5];
    uint64_t v5 = v2;
    uint64_t v6 = [v3 count];
    id v7 = objc_msgSend(a1[5], "un_map:", &__block_literal_global_41);
    *(_DWORD *)long long buf = 138543874;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification requests %{public}@", buf, 0x20u);
  }
  id v8 = objc_msgSend(a1[6], "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_42;
  v10[3] = &unk_1E5F06648;
  id v11 = a1[4];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v10];
  [v9 setNotificationRequests:a1[5] forBundleIdentifier:a1[4]];
}

id __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  id v3 = objc_msgSend(v2, "un_logDigest");

  return v3;
}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_42_cold_1();
  }
}

- (id)pendingNotificationRequestsForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  __int16 v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_43;
  v7[3] = &unk_1E5F067F0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getPendingNotificationRequestsForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld pending notification", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5F065A8;
  id v3 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v9];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_45;
  v6[3] = &unk_1E5F06818;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 getPendingNotificationRequestsForBundleIdentifier:v7 withCompletionHandler:v6];
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5F06100;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3_cold_1(a1, v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2_46;
  block[3] = &unk_1E5F06100;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2_46(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    id v3 = (void *)a1[5];
    id v5 = v2;
    uint64_t v6 = [v3 count];
    BOOL v7 = a1[6] != 0;
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v7;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld pending notification [ hasCompletionHandler: %d ]", (uint8_t *)&v9, 0x1Cu);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[5]);
  }
  return result;
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v8 count];
    BOOL v14 = objc_msgSend(v8, "un_map:", &__block_literal_global_49);
    *(_DWORD *)long long buf = 138543874;
    id v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v14;
    _os_log_impl(&dword_1AE729000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld pending notification requests with identifiers %{public}@", buf, 0x20u);
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_50;
  v19[3] = &unk_1E5F06760;
  v19[4] = self;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  dispatch_sync(queue, v19);
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_50(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5F06738;
  id v11 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_52;
  v8[3] = &unk_1E5F06860;
  id v7 = *(id *)(a1 + 56);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 removePendingNotificationRequestsWithIdentifiers:v5 forBundleIdentifier:v6 completionHandler:v8];
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_51;
    v6[3] = &unk_1E5F06580;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_52(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F065D0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    *(_DWORD *)long long buf = 138543618;
    id v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = [v8 count];
    _os_log_impl(&dword_1AE729000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld similar pending notification requests", buf, 0x16u);
  }
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E5F06760;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  dispatch_sync(queue, v17);
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5F06738;
  id v11 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_54;
  v8[3] = &unk_1E5F06860;
  id v7 = *(id *)(a1 + 56);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 removeSimilarNotificationRequests:v5 forBundleIdentifier:v6 completionHandler:v8];
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_53;
    v6[3] = &unk_1E5F06580;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_54(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F065D0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all pending notification requests", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5F06738;
  id v10 = a1[5];
  id v3 = a1[6];
  id v11 = a1[4];
  id v12 = v3;
  uint64_t v4 = [v2 remoteObjectProxyWithErrorHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_56;
  v7[3] = &unk_1E5F06860;
  id v5 = a1[5];
  id v6 = a1[6];
  void v7[4] = a1[4];
  id v8 = v6;
  [v4 removeAllPendingNotificationRequestsForBundleIdentifier:v5 completionHandler:v7];
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_55;
    v6[3] = &unk_1E5F06580;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_56(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F065D0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)deliveredNotificationsForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_57;
  v7[3] = &unk_1E5F067F0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getDeliveredNotificationsForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld delivered notifications", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  id v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2_59;
  v8[3] = &unk_1E5F06888;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getDeliveredNotificationsForBundleIdentifier:v9 withCompletionHandler:v8];
}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_58;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2_59(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = [v3 count];
    BOOL v8 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = v8;
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld delivered notifications [ hasCompletionHandler: %d ]", buf, 0x1Cu);
  }
  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_60;
  v12[3] = &unk_1E5F06580;
  id v10 = *(id *)(a1 + 48);
  id v13 = v3;
  id v14 = v10;
  id v11 = v3;
  dispatch_async(v9, v12);
}

uint64_t __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v8 count];
    id v14 = objc_msgSend(v8, "un_map:", &__block_literal_global_62);
    *(_DWORD *)long long buf = 138543874;
    id v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    uint64_t v28 = v14;
    _os_log_impl(&dword_1AE729000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld delivered notifications with identifiers %{public}@", buf, 0x20u);
  }
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_63;
  v19[3] = &unk_1E5F06760;
  v19[4] = self;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  dispatch_sync(queue, v19);
}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_63(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5F06738;
  id v11 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_65;
  v8[3] = &unk_1E5F06860;
  id v7 = *(id *)(a1 + 56);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 removeDeliveredNotificationsWithIdentifiers:v5 forBundleIdentifier:v6 completionHandler:v8];
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_64;
    v6[3] = &unk_1E5F06580;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_65(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F065D0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all delivered notifications", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5F06738;
  id v10 = a1[5];
  id v3 = a1[6];
  id v11 = a1[4];
  id v12 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_67;
  v7[3] = &unk_1E5F06860;
  id v5 = a1[5];
  id v6 = a1[6];
  void v7[4] = a1[4];
  id v8 = v6;
  [v4 removeAllDeliveredNotificationsForBundleIdentifier:v5 completionHandler:v7];
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_66;
    v6[3] = &unk_1E5F06580;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_67(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E5F065D0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_68;
  v7[3] = &unk_1E5F068B0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getBadgeNumberForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got badge number [ badge: %@ ]", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_70;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_70(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_73;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_73(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_76;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_76(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1AE729000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge string to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F06760;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(queue, v16);
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5F065A8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = *(id *)(a1 + 56);
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v13];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_80;
  v9[3] = &unk_1E5F06738;
  id v10 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v8;
  [v5 setBadgeString:v7 forBundleIdentifier:v10 withCompletionHandler:v9];
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_79;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_79(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_80(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543874;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v3 != 0;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge string [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_81;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_81(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_82;
  v7[3] = &unk_1E5F06580;
  id v5 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_82(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  id v2 = objc_msgSend(a1[4], "_queue_ensureConnection");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F065A8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v13 = v3;
  id v14 = v4;
  id v15 = a1[6];
  id v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_86;
  v8[3] = &unk_1E5F06710;
  id v9 = v6;
  id v7 = a1[6];
  id v10 = a1[4];
  id v11 = v7;
  [v5 getNotificationTopicsForBundleIdentifier:v9 withCompletionHandler:v8];
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_85;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_86(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void *)(a1 + 48) != 0;
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get topics [ hasCompletionHandler: %d ]", buf, 0x12u);
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_87;
  v10[3] = &unk_1E5F06580;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_87(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)notificationTopicsForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__1;
  BOOL v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_88;
  v7[3] = &unk_1E5F066E8;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getNotificationTopicsForBundleIdentifier:v5 withCompletionHandler:v7];
}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld topics", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_89;
  block[3] = &unk_1E5F060D8;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_89(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topic settings (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__1;
  BOOL v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_93;
  v7[3] = &unk_1E5F06928;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getNotificationSettingsForTopicsWithBundleIdentifier:v5 withCompletionHandler:v7];
}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld topic settings", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

- (id)clearedInfoForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cleared info (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__1;
  BOOL v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06698;
  void block[4] = self;
  id v11 = v4;
  p_long long buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v8;
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2;
  v10[3] = &unk_1E5F06648;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_94;
  v7[3] = &unk_1E5F06950;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 getClearedInfoForDataProviderMigrationWithBundleIdentifier:v5 withCompletionHandler:v7];
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR)) {
    __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2_cold_1();
  }
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got cleared info", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (void)performBlockOnConnectionQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__UNUserNotificationServiceConnection_performBlockOnConnectionQueue___block_invoke;
  block[3] = &unk_1E5F060D8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __69__UNUserNotificationServiceConnection_performBlockOnConnectionQueue___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v7;
    _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive remote notification token", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E5F06088;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __81__UNUserNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setExportedObject:0];

  [(UNUserNotificationServiceConnection *)self setConnection:0];
}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_1E5F06978;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");
}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_1E5F06978;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnection");
}

- (void)_queue_interruptedConnection
{
}

- (void)_queue_invalidatedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  [(UNUserNotificationServiceConnection *)self _invalidate];
}

- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(NSMutableDictionary *)self->_observersByBundleIdentifier objectForKey:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 didReceiveDeviceToken:v6 forBundleIdentifier:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_queue_addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    id v7 = [(NSMutableDictionary *)self->_observersByBundleIdentifier objectForKey:v6];
    if (!v7)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:4];
      [(NSMutableDictionary *)self->_observersByBundleIdentifier setObject:v7 forKey:v6];
    }
    [v7 addObject:v10];
    if ([v7 count])
    {
      id v8 = [(UNUserNotificationServiceConnection *)self _queue_ensureConnection];
      uint64_t v9 = [v8 remoteObjectProxy];
      [v9 setObservingUserNotifications:1 forBundleIdentifier:v6];
    }
  }
}

- (void)_queue_removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v11 = a4;
  observersByBundleIdentifier = self->_observersByBundleIdentifier;
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)observersByBundleIdentifier objectForKey:v11];
  [v8 removeObject:v7];

  if (![v8 count])
  {
    [(NSMutableDictionary *)self->_observersByBundleIdentifier removeObjectForKey:v11];
    uint64_t v9 = [(UNUserNotificationServiceConnection *)self _queue_ensureConnection];
    id v10 = [v9 remoteObjectProxy];
    [v10 setObservingUserNotifications:0 forBundleIdentifier:v11];
  }
}

- (NSMutableDictionary)observersByBundleIdentifier
{
  return self->_observersByBundleIdentifier;
}

- (void)setObserversByBundleIdentifier:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_observersByBundleIdentifier, 0);
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Requesting authorization failed with error: %{public}@");
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Requesting remove authorization failed with error: %{public}@");
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting notification settings failed with error: %{public}@");
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting notification categories failed with error: %{public}@");
}

- (void)addNotificationRequest:(uint64_t)a1 forBundleIdentifier:(void *)a2 withCompletionHandler:.cold.1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_4(&dword_1AE729000, v5, v6, "[%{public}@] Expected a UNNotificationRequest: %{public}@", v7, v8, v9, v10, v11);
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Adding notification request failed with error: %{public}@");
}

- (void)replaceContentForRequestWithIdentifier:(uint64_t)a1 bundleIdentifier:(void *)a2 replacementContent:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_3(v3);
  OUTLINED_FUNCTION_4(&dword_1AE729000, v5, v6, "[%{public}@] Expected a UNNotificationContent: %{public}@", v7, v8, v9, v10, v11);
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Replacing notification content failed with error: %{public}@");
}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_42_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Setting notification requests failed with error: %{public}@");
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting pending notification requests failed with error: %{public}@");
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1AE729000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Getting pending notification requests failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Removing pending notification with error: %{public}@");
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting similar pending notification requests failed with error: %{public}@");
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Removing all pending notification requests with error: %{public}@");
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting delivered notifications failed with error: %{public}@");
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Removing delivered notifications with error: %{public}@");
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Removing all delivered notifications with error: %{public}@");
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting badge number failed with error: %{public}@");
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Setting badge number failed with error: %{public}@");
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Setting badge count failed with error: %{public}@");
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Setting badge string failed with error: %{public}@");
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Setting topics failed with error: %{public}@");
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting topics failed with error: %{public}@");
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting topic settings failed with error: %{public}@");
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1AE729000, v0, v1, "[%{public}@] Getting cleared info failed with error: %{public}@");
}

@end