@interface ASDNotificationCenter
+ (id)defaultCenter;
+ (id)interface;
- (ASDNotificationCenter)init;
- (ASDNotificationCenterDialogObserver)dialogObserver;
- (void)addNotificationObserver:(id)a3 forName:(id)a4;
- (void)addProgressObserver:(id)a3;
- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverNotifications:(id)a3;
- (void)deliverProgress:(id)a3;
- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)removeNotificationObserver:(id)a3 forName:(id)a4;
- (void)removeProgressObserver:(id)a3;
- (void)setDialogObserver:(id)a3;
@end

@implementation ASDNotificationCenter

+ (id)defaultCenter
{
  if (qword_1EB4D65E8 != -1) {
    dispatch_once(&qword_1EB4D65E8, &__block_literal_global_24);
  }
  v2 = (void *)_MergedGlobals_50;
  return v2;
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC626D0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_deliverNotifications_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_deliverProgress_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_deliverAuthenticateRequest_withResultHandler_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v13 forSelector:sel_deliverDialogRequest_withResultHandler_ argumentIndex:1 ofReply:1];
  [v2 setClasses:v13 forSelector:sel_deliverEngagementRequest_withResultHandler_ argumentIndex:1 ofReply:1];

  return v2;
}

- (void)addProgressObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_progressObservers addObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)addNotificationObserver:(id)a3 forName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_observerLock);
  uint64_t v7 = [(NSMutableDictionary *)self->_notificationObservers objectForKeyedSubscript:v6];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_notificationObservers setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
  os_unfair_lock_unlock(&self->_observerLock);
}

uint64_t __38__ASDNotificationCenter_defaultCenter__block_invoke()
{
  _MergedGlobals_50 = objc_alloc_init(ASDNotificationCenter);
  return MEMORY[0x1F41817F8]();
}

- (ASDNotificationCenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)ASDNotificationCenter;
  v2 = [(ASDNotificationCenter *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDNotificationCenter", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_observerLock._os_unfair_lock_opaque = 0;
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeProgress = v2->_activeProgress;
    v2->_activeProgress = v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notificationObservers = v2->_notificationObservers;
    v2->_notificationObservers = v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    progressObservers = v2->_progressObservers;
    v2->_progressObservers = (NSHashTable *)v10;
  }
  return v2;
}

- (void)removeProgressObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSHashTable *)self->_progressObservers removeObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)removeNotificationObserver:(id)a3 forName:(id)a4
{
  p_observerLock = &self->_observerLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_observerLock);
  id v9 = [(NSMutableDictionary *)self->_notificationObservers objectForKeyedSubscript:v7];

  [v9 removeObject:v8];
  os_unfair_lock_unlock(p_observerLock);
}

- (void)setDialogObserver:(id)a3
{
  id obj = a3;
  os_unfair_lock_lock(&self->_observerLock);
  objc_storeWeak((id *)&self->_dialogObserver, obj);
  os_unfair_lock_unlock(&self->_observerLock);
  if (obj)
  {
    dispatch_queue_t v4 = [[ASDSupportedDialogHandlers alloc] initWithDialogObserver:obj];
    id v5 = +[ASDServiceBroker defaultBroker];
    [v5 setSupportedNotificationDelivery:v4];
  }
  else
  {
    dispatch_queue_t v4 = +[ASDServiceBroker defaultBroker];
    [(ASDSupportedDialogHandlers *)v4 setSupportedNotificationDelivery:0];
  }
}

- (ASDNotificationCenterDialogObserver)dialogObserver
{
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogObserver);
  os_unfair_lock_unlock(p_observerLock);
  return (ASDNotificationCenterDialogObserver *)WeakRetained;
}

- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ASDNotificationCenter_deliverAlertPresentationRequest_resultHandler___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__ASDNotificationCenter_deliverAlertPresentationRequest_resultHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dialogObserver];
  if (objc_opt_respondsToSelector())
  {
    [v4 handleAlertPresentationRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, @"No dialog observer was available to handle the request");
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ASDNotificationCenter_deliverAuthenticateRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__ASDNotificationCenter_deliverAuthenticateRequest_withResultHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dialogObserver];
  if (objc_opt_respondsToSelector())
  {
    [v4 handleAuthenticateRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, @"No dialog observer was available to handle the request");
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ASDNotificationCenter_deliverDialogRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __64__ASDNotificationCenter_deliverDialogRequest_withResultHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dialogObserver];
  if (objc_opt_respondsToSelector())
  {
    [v4 handleDialogRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, @"No dialog observer was available to handle the request");
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ASDNotificationCenter_deliverEngagementRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E58B3510;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__ASDNotificationCenter_deliverEngagementRequest_withResultHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dialogObserver];
  if (objc_opt_respondsToSelector())
  {
    [v4 handleEngagementRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v3 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, @"No dialog observer was available to handle the engagement request");
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void)deliverNotifications:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2112;
    id v15 = v4;
    id v6 = v13;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_INFO, "[%@]: Received notifications: %@", buf, 0x16u);
  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke;
  v9[3] = &unk_1E58B2DF0;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  dispatch_async(dispatchQueue, v9);
}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 name];
        id v10 = [v2 objectForKeyedSubscript:v9];
        uint64_t v11 = v10;
        if (v10)
        {
          [v10 addObject:v8];
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
          [v2 setObject:v12 forKeyedSubscript:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke_2;
  v13[3] = &unk_1E58B4A50;
  v13[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v13];
}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v7 = (os_unfair_lock_s *)(v6 + 32);
    id v8 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
    id v9 = [*(id *)(v6 + 24) objectForKeyedSubscript:v8];

    id v10 = (void *)[v9 copy];
    os_unfair_lock_unlock(v7);
    uint64_t v11 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v11 = 0;
    id v10 = 0;
  }
  id v12 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke_3;
  block[3] = &unk_1E58B2FA8;
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v5;
  id v13 = v5;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x19F392F00](v3);
        objc_msgSend(v7, "notificationCenter:receivedNotifications:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (void)deliverProgress:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_INFO, "[%@]: Received progress: %@", buf, 0x16u);
  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__ASDNotificationCenter_deliverProgress___block_invoke;
  v9[3] = &unk_1E58B2DF0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(dispatchQueue, v9);
}

void __41__ASDNotificationCenter_deliverProgress___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v2;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v9 = [v8 bundleID];
          if (v9)
          {
            if ([v8 completedUnitCount])
            {
              float v10 = (float)[v8 completedUnitCount];
              float v11 = v10 / (float)[v8 totalUnitCount];
            }
            else
            {
              float v11 = 0.0;
            }
            if ([*(id *)(v1 + 8) containsObject:v9])
            {
              if (v11 >= 1.0)
              {
                id v12 = ASDLogHandleForCategory(13);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v13 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  v35 = v13;
                  __int16 v36 = 2114;
                  v37 = v9;
                  __int16 v38 = 2048;
                  double v39 = v11;
                  id v14 = v13;
                  _os_log_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Completed progress reporting progress at: %.2f", buf, 0x20u);
                }
                if ([*(id *)(v1 + 8) containsObject:v9]) {
                  [*(id *)(v1 + 8) removeObject:v9];
                }
              }
            }
            else
            {
              uint64_t v15 = ASDLogHandleForCategory(13);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                id v16 = objc_opt_class();
                id v17 = v16;
                uint64_t v18 = [v8 completedUnitCount];
                *(_DWORD *)buf = 138544130;
                v35 = v16;
                __int16 v36 = 2114;
                v37 = v9;
                __int16 v38 = 2048;
                double v39 = v11;
                __int16 v40 = 2048;
                uint64_t v41 = v18;
                _os_log_impl(&dword_19BF6A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Starting progress reporting at: %.2f complete: %lld", buf, 0x2Au);
              }
              [*(id *)(v1 + 8) addObject:v9];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
    id v2 = v24;
  }

  uint64_t v19 = *(void *)(a1 + 32);
  if (v19)
  {
    v20 = (os_unfair_lock_s *)(v19 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v19 + 32));
    uint64_t v19 = [*(id *)(v19 + 40) copy];
    os_unfair_lock_unlock(v20);
    uint64_t v21 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v21 = 0;
  }
  v22 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ASDNotificationCenter_deliverProgress___block_invoke_2;
  block[3] = &unk_1E58B2FA8;
  id v27 = (id)v19;
  uint64_t v28 = v21;
  id v29 = *(id *)(a1 + 40);
  id v23 = (id)v19;
  dispatch_async(v22, block);
}

void __41__ASDNotificationCenter_deliverProgress___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x19F392F00](v3);
        objc_msgSend(v7, "notificationCenter:receivedProgress:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ASDNotificationCenter_deliverViewPresentationRequest_resultHandler___block_invoke;
  block[3] = &unk_1E58B3510;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__ASDNotificationCenter_deliverViewPresentationRequest_resultHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dialogObserver];
  if (objc_opt_respondsToSelector())
  {
    [v4 handleViewPresentationRequest:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDErrorDomain", 1060, @"No dialog observer was available to handle the request");
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dialogObserver);
  objc_storeStrong((id *)&self->_progressObservers, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeProgress, 0);
}

@end