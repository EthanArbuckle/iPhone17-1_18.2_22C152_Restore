@interface COMTActionDirector
+ (id)directorForCluster:(id)a3;
- (BOOL)_activate;
- (BOOL)activated;
- (COCluster)cluster;
- (COClusterRoleMonitor)monitor;
- (COMTActionDirector)initWithCluster:(id)a3;
- (COMTActionDirector)initWithProvider:(id)a3 cluster:(id)a4;
- (COMTActionDirectorServiceProvider)provider;
- (COMessageChannel)messageChannel;
- (NSMutableArray)actionHandler;
- (NSObject)monitorObserver;
- (NSSet)members;
- (OS_dispatch_queue)dispatchQueue;
- (id)_requestHandlerForAction:(id)a3;
- (id)_requestHandlerForTypedAction:(id)a3;
- (unint64_t)chunkSize;
- (void)_notifyHandlerOfSnapshotChanges_unsafe:(id)a3;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)handleMembersChanged:(id)a3;
- (void)handlePerformActionRequest:(id)a3 from:(id)a4 callback:(id)a5;
- (void)registerHandler:(id)a3 forType:(id)a4 actions:(id)a5 queue:(id)a6;
- (void)removeHandler:(id)a3;
- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 fallback:(id)a6 withCompletion:(id)a7;
- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6;
- (void)requestAction:(id)a3 members:(id)a4 withCompletion:(id)a5;
- (void)requestActions:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6;
- (void)requestActions:(id)a3 members:(id)a4 withCompletion:(id)a5;
- (void)setActionHandler:(id)a3;
- (void)setMembers:(id)a3;
- (void)setMonitorObserver:(id)a3;
@end

@implementation COMTActionDirector

- (COMessageChannel)messageChannel
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__COMTActionDirector_messageChannel__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMTActionDirector *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMessageChannel *)v2;
}

void __36__COMTActionDirector_messageChannel__block_invoke(uint64_t a1)
{
}

- (BOOL)activated
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__COMTActionDirector_activated__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMTActionDirector *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __31__COMTActionDirector_activated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

- (unint64_t)chunkSize
{
  return 6290432;
}

- (void)dealloc
{
  v3 = [(COMTActionDirector *)self monitor];
  v4 = [(COMTActionDirector *)self monitorObserver];
  [v3 removeObserverForSnapshots:v4];

  v5.receiver = self;
  v5.super_class = (Class)COMTActionDirector;
  [(COMTActionDirector *)&v5 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_activate
{
  v3 = [(COMTActionDirector *)self cluster];
  v4 = [(COMTActionDirector *)self provider];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __31__COMTActionDirector__activate__block_invoke;
  v17[3] = &unk_2645CAE30;
  objc_copyWeak(&v18, &location);
  objc_super v5 = (void *)MEMORY[0x223C8B4A0](v17);
  v6 = [v4 clusterRoleMonitorWithCluster:v3];
  monitor = self->_monitor;
  self->_monitor = v6;

  char v8 = [(COClusterRoleMonitor *)self->_monitor addObserverForSnapshotsToDispatchQueue:self->_dispatchQueue block:v5];
  monitorObserver = self->_monitorObserver;
  self->_monitorObserver = v8;

  id v10 = [v4 messageChannelWithTopic:@"v1" cluster:v3];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __31__COMTActionDirector__activate__block_invoke_2;
  v15[3] = &unk_2645CAE58;
  objc_copyWeak(&v16, &location);
  [v10 registerHandler:v15 forRequestClass:objc_opt_class()];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __31__COMTActionDirector__activate__block_invoke_3;
  v13[3] = &unk_2645CAEA8;
  objc_copyWeak(&v14, &location);
  [v10 activateWithCompletion:v13];
  messageChannel = self->_messageChannel;
  self->_messageChannel = (COMessageChannel *)v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return 1;
}

void __31__COMTActionDirector__activate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleMembersChanged:v5];
  }
}

void __31__COMTActionDirector__activate__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = [v7 member];
    [WeakRetained handlePerformActionRequest:v11 from:v10 callback:v8];
  }
}

void __31__COMTActionDirector__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __31__COMTActionDirector__activate__block_invoke_4;
    v5[3] = &unk_2645CAE80;
    id v6 = v3;
    id v7 = WeakRetained;
    [WeakRetained _withLock:v5];
  }
}

void __31__COMTActionDirector__activate__block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v1 = (void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v4 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    id v5 = COCoreLogForCategory(20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __31__COMTActionDirector__activate__block_invoke_4_cold_1(v3, v1, v5);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 12) = 1;
    id v6 = [*v3 members];

    if (v6)
    {
      id v7 = *v3;
      id v8 = [*v3 members];
      objc_msgSend(v7, "_notifyHandlerOfSnapshotChanges_unsafe:", v8);
    }
    id v5 = COCoreLogForCategory(20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *v3;
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ message channel activation succeeded", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_requestHandlerForTypedAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__COMTActionDirector__requestHandlerForTypedAction___block_invoke;
  v8[3] = &unk_2645CAED0;
  id v5 = v4;
  id v9 = v5;
  int v10 = self;
  id v11 = &v12;
  [(COMTActionDirector *)self _withLock:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__COMTActionDirector__requestHandlerForTypedAction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) targetType];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "actionHandler", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 targetType];
        int v10 = [v9 isEqualToString:v2];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_requestHandlerForAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__COMTActionDirector__requestHandlerForAction___block_invoke;
  v8[3] = &unk_2645CAED0;
  id v5 = v4;
  id v9 = v5;
  int v10 = self;
  long long v11 = &v12;
  [(COMTActionDirector *)self _withLock:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __47__COMTActionDirector__requestHandlerForAction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "actionHandler", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 actions];
        int v10 = [v9 containsObject:v2];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_notifyHandlerOfSnapshotChanges_unsafe:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(COMTActionDirector *)self actionHandler];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = [v10 delegate];
        if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v12 = [v10 delegateQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __61__COMTActionDirector__notifyHandlerOfSnapshotChanges_unsafe___block_invoke;
          block[3] = &unk_2645CAEF8;
          id v14 = v11;
          v15 = self;
          id v16 = v4;
          dispatch_async(v12, block);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

uint64_t __61__COMTActionDirector__notifyHandlerOfSnapshotChanges_unsafe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) director:*(void *)(a1 + 40) membersChanged:*(void *)(a1 + 48)];
}

- (void)handleMembersChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__COMTActionDirector_handleMembersChanged___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMTActionDirector *)self _withLock:v6];
}

void __43__COMTActionDirector_handleMembersChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) members];
  id v4 = (id)[v2 mutableCopy];

  [v4 minusSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setMembers:*(void *)(a1 + 40)];
  id v3 = *(unsigned char **)(a1 + 32);
  if (v3[12]) {
    objc_msgSend(v3, "_notifyHandlerOfSnapshotChanges_unsafe:", *(void *)(a1 + 40));
  }
}

- (void)handlePerformActionRequest:(id)a3 from:(id)a4 callback:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v37 = a4;
  id v35 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v11 = [(COMTActionDirector *)self dispatchQueue];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v38 = v8;
  long long v12 = v8;
  long long v13 = v9;
  id obj = [v12 actions];
  uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v58;
    v42 = self;
    id v36 = v10;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v16 = objc_alloc_init(MEMORY[0x263F58190]);
        [v13 addObject:v16];
        long long v17 = [v15 actionIdentifier];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke;
        v51[3] = &unk_2645CAF48;
        id v52 = v11;
        id v53 = v10;
        id v18 = v17;
        id v54 = v18;
        v55 = self;
        id v19 = v16;
        id v56 = v19;
        long long v20 = (void (**)(void, void, void))MEMORY[0x223C8B4A0](v51);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(COMTActionDirector *)self _requestHandlerForTypedAction:v15];
        }
        else {
        v21 = [(COMTActionDirector *)self _requestHandlerForAction:v15];
        }
        uint64_t v22 = v21;
        if (v21)
        {
          id v23 = [v21 delegate];
          if (v23)
          {
            [v22 delegateQueue];
            v24 = v11;
            v26 = v25 = v13;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_111;
            block[3] = &unk_2645CAF70;
            void block[4] = v42;
            block[5] = v15;
            id v47 = v38;
            id v23 = v23;
            id v48 = v23;
            id v49 = v37;
            v50 = v20;
            dispatch_async(v26, block);

            long long v13 = v25;
            long long v11 = v24;
            id v10 = v36;
          }
        }
        else
        {
          id v23 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D58E8 code:-7003 userInfo:0];
          ((void (**)(void, void, id))v20)[2](v20, 0, v23);
        }

        self = v42;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v41);
  }

  v27 = (void *)MEMORY[0x263F581B8];
  v28 = [(COMTActionDirector *)self dispatchQueue];
  v29 = [v27 schedulerWithDispatchQueue:v28];

  v30 = [MEMORY[0x263F58190] combineAllFutures:v13 ignoringErrors:1 scheduler:v29];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_113;
  v43[3] = &unk_2645CAF98;
  id v44 = v10;
  id v45 = v35;
  id v31 = v10;
  v32 = v13;
  id v33 = v35;
  id v34 = (id)[v30 addCompletionBlock:v43];
}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2;
  v11[3] = &unk_2645CAF20;
  id v12 = v5;
  id v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v6;
  id v8 = *(void **)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 56);
  id v17 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 40) setObject:v2 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    if (*(void *)(a1 + 56))
    {
      id v3 = [[COMTErrorResult alloc] initWithError:*(void *)(a1 + 56) actionIdentifier:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) setObject:v3 forKey:*(void *)(a1 + 48)];
    }
    else
    {
      COCoreLogForCategory(20);
      id v3 = (COMTErrorResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_ERROR)) {
        __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2_cold_1(a1, &v3->super.super);
      }
    }
  }
  return [*(id *)(a1 + 72) finishWithNoResult];
}

uint64_t __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_111(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = COCoreLogForCategory(20);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    int v8 = 138544130;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatching %{public}@ for %p to %p", (uint8_t *)&v8, 0x2Au);
  }

  return [*(id *)(a1 + 56) director:*(void *)(a1 + 32) performAction:*(void *)(a1 + 40) from:*(void *)(a1 + 64) callback:*(void *)(a1 + 72)];
}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_113(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [[COMTPerformActionResponse alloc] initWithResults:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, COMTPerformActionResponse *, void))(v1 + 16))(v1, v2, 0);
}

+ (id)directorForCluster:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&directorForCluster__lock);
  uint64_t v4 = (void *)directorForCluster__directors;
  if (!directorForCluster__directors)
  {
    uint64_t v5 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    uint64_t v6 = (void *)directorForCluster__directors;
    directorForCluster__directors = v5;

    uint64_t v4 = (void *)directorForCluster__directors;
  }
  id v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    id v7 = [[COMTActionDirector alloc] initWithCluster:v3];
    [(id)directorForCluster__directors setObject:v7 forKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&directorForCluster__lock);
  int v8 = COCoreLogForCategory(20);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ returned for cluster %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (COMTActionDirector)initWithProvider:(id)a3 cluster:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)COMTActionDirector;
  uint64_t v9 = [(COMTActionDirector *)&v17 init];
  int v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_cluster, a4);
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Coordination.COMTActionDirector", v11);
    dispatchQueue = v10->_dispatchQueue;
    v10->_dispatchQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_provider, a3);
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    actionHandler = v10->_actionHandler;
    v10->_actionHandler = (NSMutableArray *)v14;

    [(COMTActionDirector *)v10 _activate];
  }

  return v10;
}

- (COMTActionDirector)initWithCluster:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(_COMTActionDirectorServiceProvider);
  uint64_t v6 = [(COMTActionDirector *)self initWithProvider:v5 cluster:v4];

  return v6;
}

- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6
{
  v21[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v21[0] = v10;
  dispatch_queue_t v12 = (void *)MEMORY[0x263EFF8C0];
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [v12 arrayWithObjects:v21 count:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__COMTActionDirector_requestAction_members_activity_withCompletion___block_invoke;
  v18[3] = &unk_2645CAFC0;
  id v19 = v10;
  id v20 = v11;
  id v16 = v10;
  id v17 = v11;
  [(COMTActionDirector *)self requestActions:v15 members:v14 activity:v13 withCompletion:v18];
}

void __68__COMTActionDirector_requestAction_members_activity_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
    return;
  }
  uint64_t v5 = [a2 results];
  uint64_t v6 = [*(id *)(a1 + 32) actionIdentifier];
  id v10 = [v5 objectForKey:v6];

  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v8 = v10;
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = [v10 error];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D58E8 code:-7001 userInfo:0];
  }
  id v8 = 0;
LABEL_11:
  id v11 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestAction:(id)a3 members:(id)a4 withCompletion:(id)a5
{
}

- (void)requestActions:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[COMTPerformActionRequest alloc] initWithActions:v10];
  uint64_t v15 = v14;
  if (v12) {
    [(COMessageChannelRequest *)v14 setNetworkActivity:v12];
  }
  id v16 = COCoreLogForCategory(20);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v25 = self;
    __int16 v26 = 2048;
    v27 = v15;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl(&dword_2217C1000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %p for actions %{public}@ from members %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  id v17 = [(COMTActionDirector *)self messageChannel];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__COMTActionDirector_requestActions_members_activity_withCompletion___block_invoke;
  v20[3] = &unk_2645CAFE8;
  objc_copyWeak(&v23, (id *)buf);
  id v18 = v15;
  v21 = v18;
  id v19 = v13;
  id v22 = v19;
  [v17 sendRequest:v18 members:v11 withCompletionHandler:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __69__COMTActionDirector_requestActions_members_activity_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v9 = COCoreLogForCategory(20);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138544130;
      id v14 = WeakRetained;
      __int16 v15 = 2048;
      id v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ recevied response %p for request %p (error: %{public}@)", (uint8_t *)&v13, 0x2Au);
    }

    if (v7)
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = [MEMORY[0x263F087E8] errorWithDomain:0x26D3D58E8 code:-7002 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_9;
      }
      id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v11();
  }
LABEL_9:
}

- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 fallback:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__COMTActionDirector_requestAction_members_activity_fallback_withCompletion___block_invoke;
  v22[3] = &unk_2645CB010;
  objc_copyWeak(&v28, &location);
  id v17 = v15;
  id v26 = v17;
  id v18 = v12;
  id v23 = v18;
  id v19 = v13;
  id v24 = v19;
  id v20 = v14;
  id v25 = v20;
  id v21 = v16;
  id v27 = v21;
  [(COMTActionDirector *)self requestAction:v18 members:v19 activity:v20 withCompletion:v22];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __77__COMTActionDirector_requestAction_members_activity_fallback_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_12;
  }
  id v8 = [v6 domain];
  if (![v8 isEqualToString:0x26D3D58E8] || objc_msgSend(v6, "code") != -7003)
  {
    uint64_t v9 = [v6 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F33DD8]])
    {
      uint64_t v10 = [v6 code];

      if (v10 == -1106) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_13;
  }

LABEL_8:
  id v11 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v12 = COCoreLogForCategory(20);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412802;
    id v15 = WeakRetained;
    __int16 v16 = 2048;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%@ action %p not handled by remote, using fallback: %@", (uint8_t *)&v14, 0x20u);
  }

  [WeakRetained requestAction:v11 members:*(void *)(a1 + 40) activity:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 64)];
LABEL_13:
}

- (void)requestActions:(id)a3 members:(id)a4 withCompletion:(id)a5
{
}

- (void)registerHandler:(id)a3 forType:(id)a4 actions:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke;
  v18[3] = &unk_2645CB038;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [(COMTActionDirector *)self _withLock:v18];
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) actionHandler];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v30 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v8 = [v7 targetType];
      int v9 = [v8 isEqualToString:*(void *)(a1 + 40)];

      if (v9)
      {
        id v12 = COCoreLogForCategory(20);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_1();
        }
        goto LABEL_15;
      }
      id v10 = *(void **)(a1 + 56);
      id v11 = [v7 actions];
      LODWORD(v10) = [v10 intersectsSet:v11];

      if (v10)
      {
        id v12 = COCoreLogForCategory(20);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_2();
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_16:

  id v13 = [[COMTActionRequestHandler alloc] initWithType:*(void *)(a1 + 40) actions:*(void *)(a1 + 56) delegate:*(void *)(a1 + 48) dispatchQueue:*(void *)(a1 + 64)];
  id v14 = [*(id *)(a1 + 32) actionHandler];
  [v14 addObject:v13];

  uint64_t v15 = [*(id *)(a1 + 32) members];
  if (v15)
  {
    id v16 = (void *)v15;
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      __int16 v18 = *(NSObject **)(a1 + 64);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_124;
      v26[3] = &unk_2645CAE80;
      id v19 = *(id *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 32);
      id v27 = v19;
      uint64_t v28 = v20;
      dispatch_async(v18, v26);
    }
  }
  id v21 = COCoreLogForCategory(20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = v22;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    __int16 v37 = 2114;
    uint64_t v38 = v23;
    __int16 v39 = 2114;
    uint64_t v40 = v25;
    _os_log_impl(&dword_2217C1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ registered delegate %p for type %{public}@ and actions %{public}@", buf, 0x2Au);
  }
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_124(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 members];
  [v1 director:v2 membersChanged:v3];
}

- (void)removeHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__COMTActionDirector_removeHandler___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMTActionDirector *)self _withLock:v6];
}

void __36__COMTActionDirector_removeHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 32), "actionHandler", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      int v9 = [v8 delegate];
      id v10 = *(void **)(a1 + 40);

      if (v9 == v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v8;

    if (!v11) {
      goto LABEL_14;
    }
    id v12 = [*v2 actionHandler];
    [v12 removeObject:v11];

    id v13 = COCoreLogForCategory(20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ removed delegate %p", buf, 0x16u);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    id v11 = COCoreLogForCategory(20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __36__COMTActionDirector_removeHandler___block_invoke_cold_1();
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (COClusterRoleMonitor)monitor
{
  return self->_monitor;
}

- (NSObject)monitorObserver
{
  return self->_monitorObserver;
}

- (void)setMonitorObserver:(id)a3
{
}

- (NSSet)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (NSMutableArray)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (COMTActionDirectorServiceProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_monitorObserver, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_messageChannel, 0);
}

void __31__COMTActionDirector__activate__block_invoke_4_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, (uint64_t)a2, a3, "%{public}@ message channel activation failed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "%{public}@ action callback did not provide result or error", (uint8_t *)&v3, 0xCu);
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ failed to register delegate %p: duplicate target");
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ failed to register delegate %p: duplicate action");
}

void __36__COMTActionDirector_removeHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ failed to remove delegate %p: not found");
}

@end