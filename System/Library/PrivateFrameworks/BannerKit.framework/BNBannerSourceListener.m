@interface BNBannerSourceListener
+ (void)initialize;
- (BNBannerSourceListener)initWithAuthorizedBundleIDs:(id)a3;
- (BNBannerSourceListener)initWithServiceDomain:(id)a3 displayConfiguration:(id)a4 authorizedBundleIDs:(id)a5;
- (BNBannerSourceListenerDelegate)delegate;
- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4;
- (BOOL)_isPresentableWaitingToBeMadeReady:(id)a3;
- (BOOL)_isPresentableWithIdentificationWaitingToBeMadeReady:(id)a3;
- (BOOL)bannerSourceListenerPresentable:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5;
- (BOOL)bannerSourceListenerPresentableShouldEnablePresentableContextInterface:(id)a3;
- (id)_createSceneWithIdentifier:(id)a3 forProcess:(id)a4 preferredContentSize:(CGSize)a5 contentOutsets:(UIEdgeInsets)a6 userInfo:(id)a7;
- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4;
- (id)_removeUnpreparedPresentablesWithIdentification:(id)a3;
- (id)_uniquePresentableWithIdentification:(id)a3;
- (void)__layoutDescriptionWithReply:(id)a3;
- (void)__postPresentableWithSpecification:(id)a3 options:(id)a4 userInfo:(id)a5 reply:(id)a6;
- (void)__recommendSuspension:(id)a3 forReason:(id)a4 revokingCurrent:(id)a5 reply:(id)a6;
- (void)__revokePresentablesWithIdentification:(id)a3 withAnimation:(id)a4 reason:(id)a5 userInfo:(id)a6 reply:(id)a7;
- (void)_addConnection:(id)a3;
- (void)_addPresentable:(id)a3;
- (void)_addUnpreparedBannerSourcePresentableForBannerSpecification:(id)a3 remoteProcess:(id)a4 scene:(id)a5 readyCompletion:(id)a6;
- (void)_addUnpreparedPresentable:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_removePresentable:(id)a3;
- (void)_removePresentableWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4;
- (void)_removeUnpreparedPresentable:(id)a3;
- (void)_requestPostingBannerSourceListenerPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5;
- (void)_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:(id)a3 options:(unint64_t)a4 userInfo:(id)a5;
- (void)_stopObservingAndInvalidatePresentable:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)layoutDescriptionDidChange:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)sceneDidInvalidateForBannerSourceListenerPresentable:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BNBannerSourceListener

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (BNBannerSourceListener)initWithAuthorizedBundleIDs:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F62420];
  id v5 = a3;
  v6 = [v4 mainConfiguration];
  v7 = [(BNBannerSourceListener *)self initWithServiceDomain:@"com.apple.frontboard" displayConfiguration:v6 authorizedBundleIDs:v5];

  return v7;
}

- (BNBannerSourceListener)initWithServiceDomain:(id)a3 displayConfiguration:(id)a4 authorizedBundleIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)BNBannerSourceListener;
  v12 = [(BNBannerSourceListener *)&v27 init];
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_displayConfiguration, a4);
        objc_storeStrong((id *)&v12->_authorizedBundleIDs, a5);
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        connections = v12->_connections;
        v12->_connections = v13;

        uint64_t Serial = BSDispatchQueueCreateSerial();
        queue = v12->_queue;
        v12->_queue = (OS_dispatch_queue *)Serial;

        v17 = (void *)MEMORY[0x1E4F623F0];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __89__BNBannerSourceListener_initWithServiceDomain_displayConfiguration_authorizedBundleIDs___block_invoke;
        v24[3] = &unk_1E63B9680;
        id v25 = v9;
        v18 = v12;
        v26 = v18;
        uint64_t v19 = [v17 listenerWithConfigurator:v24];
        id v20 = v18[3];
        v18[3] = (id)v19;

        [v18[3] activate];
        goto LABEL_5;
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v12, @"BNBannerSourceListener.m", 68, @"Invalid parameter not satisfying: %@", @"serviceDomain" object file lineNumber description];

      if (v10) {
        goto LABEL_4;
      }
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, v12, @"BNBannerSourceListener.m", 69, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

void __89__BNBannerSourceListener_initWithServiceDomain_displayConfiguration_authorizedBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDomain:v3];
  v4 = +[BNBannerSourceSessionSpecification identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListener;
  [(BNBannerSourceListener *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v3 = self->_unpreparedPresentables;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 invalidate];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = (void *)[(NSMutableArray *)self->_connections copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) invalidate];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }

  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
}

- (void)layoutDescriptionDidChange:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_requesterIDsToPresentables allValues];
  objc_sync_exit(v5);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v6;
  uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v21)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v23 = v7;
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v27;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v10);
              }
              long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
              uint64_t v15 = objc_opt_class();
              id v16 = v14;
              if (v15)
              {
                if (objc_opt_isKindOfClass()) {
                  long long v17 = v16;
                }
                else {
                  long long v17 = 0;
                }
              }
              else
              {
                long long v17 = 0;
              }
              id v18 = v17;

              long long v19 = [v18 scene];
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __53__BNBannerSourceListener_layoutDescriptionDidChange___block_invoke;
              v24[3] = &unk_1E63B98E8;
              id v25 = v4;
              [v19 updateSettingsWithBlock:v24];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }
}

void __53__BNBannerSourceListener_layoutDescriptionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  [*(id *)(a1 + 32) containerSize];
  objc_msgSend(v6, "setContainerSize:");
  [*(id *)(a1 + 32) presentationSize];
  objc_msgSend(v6, "setPresentationSize:");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = [v6 remoteProcess];
  id v12 = 0;
  BOOL v8 = [(BNBannerSourceListener *)self _isConnectingProcessAuthorized:v7 error:&v12];
  id v9 = v12;

  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_1E63B9568;
    v11[4] = self;
    [v6 configureConnection:v11];
    [(BNBannerSourceListener *)self _addConnection:v6];
    [v6 activate];
  }
  else
  {
    id v10 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSourceListener listener:didReceiveConnection:withContext:](v10, (uint64_t)self, v9);
    }
    [v6 invalidate];
  }
}

void __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[BNBannerSourceSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = +[BNBannerSourceSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  BOOL v8 = __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  id v9 = &unk_1E63B96D0;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 32) + 32), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __68__BNBannerSourceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v9, 0xCu);
  }
  [WeakRetained _removeConnection:v3];
}

- (void)__layoutDescriptionWithReply:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 146, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  uint64_t v6 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__BNBannerSourceListener___layoutDescriptionWithReply___block_invoke;
  v9[3] = &unk_1E63B9910;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 performAsync:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __55__BNBannerSourceListener___layoutDescriptionWithReply___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    uint64_t v15 = @"Um, lost myself";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v6 = [v7 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v4];
LABEL_9:
    id v5 = 0;
    goto LABEL_10;
  }
  uint64_t v4 = objc_loadWeakRetained(WeakRetained + 8);
  if (objc_opt_respondsToSelector())
  {
    id v13 = 0;
    id v5 = [v4 bannerSourceListener:v3 layoutDescriptionWithError:&v13];
    id v6 = v13;
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"No delegate to fulfill request";
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v6 = [v8 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v9];

    goto LABEL_9;
  }
  long long v11 = *MEMORY[0x1E4F1DB30];
  long long v12 = v11;
  id v10 = 0;
  [v4 bannerSourceListener:v3 presentationSize:&v11 containerSize:&v12 error:&v10];
  id v6 = v10;
  id v5 = 0;
  if (!v6)
  {
    id v5 = +[BNBannerSourceLayoutDescription bannerSourceLayoutDescriptionWithPresentationSize:v11 containerSize:v12];
  }
LABEL_10:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)__postPresentableWithSpecification:(id)a3 options:(id)a4 userInfo:(id)a5 reply:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 177, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
  }
  uint64_t v15 = BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v49 = v11;
    _os_log_impl(&dword_1BEC04000, v15, OS_LOG_TYPE_DEFAULT, "Asked to post presentable with specification: %{public}@", buf, 0xCu);
  }
  uint64_t v16 = [MEMORY[0x1E4F62448] sharedInstance];
  long long v17 = [MEMORY[0x1E4F623E0] currentContext];
  id v18 = [v17 remoteProcess];
  long long v19 = [v16 registerProcessForHandle:v18];

  if ([v11 contentBehavior] == 1 || objc_msgSend(v11, "contentBehavior") == 2)
  {
    long long v20 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke;
    v40[3] = &unk_1E63B9960;
    v40[4] = self;
    id v41 = v11;
    id v42 = v19;
    id v45 = v14;
    id v43 = v12;
    id v44 = v13;
    [v20 performAsync:v40];
  }
  else if (![(BNBannerSourceListener *)self _isPresentableWithIdentificationWaitingToBeMadeReady:v11])
  {
    uint64_t v21 = [(BNBannerSourceListener *)self _uniquePresentableWithIdentification:v11];
    if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_3;
      v35[3] = &unk_1E63B9988;
      id v39 = v14;
      v35[4] = self;
      id v36 = v21;
      id v37 = v12;
      id v38 = v13;
      [v22 performAsync:v35];

      uint64_t v23 = v39;
    }
    else if (v19)
    {
      uint64_t v24 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_4;
      v28[3] = &unk_1E63B99D8;
      id v29 = v11;
      long long v30 = self;
      id v31 = v19;
      id v32 = v13;
      id v33 = v12;
      id v34 = v14;
      [v24 performAsync:v28];

      uint64_t v23 = v29;
    }
    else
    {
      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      v47 = @"calling process doesn't exist -- did it crash?";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      long long v26 = [v25 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v23];
      (*((void (**)(id, void, void *))v14 + 2))(v14, MEMORY[0x1E4F1CC28], v26);
    }
  }
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_2;
  v5[3] = &unk_1E63B9938;
  id v8 = *(id *)(a1 + 72);
  objc_copyWeak(&v9, &location);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _addUnpreparedBannerSourcePresentableForBannerSpecification:v3 remoteProcess:v4 scene:0 readyCompletion:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void (**)(uint64_t, void, void))(v3 + 16);
  id v5 = a2;
  v4(v3, MEMORY[0x1E4F1CC38], 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:options:userInfo:", v5, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"), *(void *)(a1 + 40));
}

uint64_t __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) unsignedIntegerValue];
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _requestPostingBannerSourceListenerPresentable:v3 options:v4 userInfo:v5];
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_4(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) requesterIdentifier];
  uint64_t v4 = [*v2 requestIdentifier];
  uint64_t v5 = [*v2 uniquePresentableIdentifier];
  id v6 = BNSceneIdentifierForRequest(v3, v4, v5);

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  [*v2 preferredContentSize];
  double v10 = v9;
  double v12 = v11;
  [*v2 contentOutsets];
  long long v17 = objc_msgSend(v7, "_createSceneWithIdentifier:forProcess:preferredContentSize:contentOutsets:userInfo:", v6, v8, *(void *)(a1 + 56), v10, v12, v13, v14, v15, v16);
  if (v17)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_5;
    v26[3] = &unk_1E63B99B0;
    objc_copyWeak(&v29, &location);
    id v27 = *(id *)(a1 + 64);
    id v28 = *(id *)(a1 + 56);
    [v18 _addUnpreparedBannerSourcePresentableForBannerSpecification:v19 remoteProcess:v20 scene:v17 readyCompletion:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  uint64_t v21 = *(void *)(a1 + 72);
  uint64_t v22 = [NSNumber numberWithInt:v17 != 0];
  if (v17)
  {
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Failed to make a scene";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v25 = [v23 errorWithDomain:@"BNBannerSourceErrorDomain" code:1 userInfo:v24];
    (*(void (**)(uint64_t, void *, void *))(v21 + 16))(v21, v22, v25);
  }
}

void __84__BNBannerSourceListener___postPresentableWithSpecification_options_userInfo_reply___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:options:userInfo:", v4, objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"), *(void *)(a1 + 40));
}

- (void)__revokePresentablesWithIdentification:(id)a3 withAnimation:(id)a4 reason:(id)a5 userInfo:(id)a6 reply:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v29 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 216, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
  }
  long long v17 = (id)BNLogHostingHost;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v13 requestIdentifier];
    uint64_t v19 = [v13 requesterIdentifier];
    id v20 = [v13 uniquePresentableIdentifier];
    if (v14)
    {
      [v14 BOOLValue];
      uint64_t v21 = NSStringFromBOOL();
    }
    else
    {
      uint64_t v21 = 0;
    }
    *(_DWORD *)buf = 138544386;
    id v38 = v18;
    __int16 v39 = 2114;
    v40 = v19;
    __int16 v41 = 2114;
    id v42 = v20;
    __int16 v43 = 2114;
    id v44 = v15;
    __int16 v45 = 2114;
    uint64_t v46 = v21;
    _os_log_impl(&dword_1BEC04000, v17, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentables with requestID %{public}@, requesterID %{public}@, and uniqueID %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x34u);
    if (v14) {
  }
    }
  objc_initWeak((id *)buf, self);
  uint64_t v22 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __101__BNBannerSourceListener___revokePresentablesWithIdentification_withAnimation_reason_userInfo_reply___block_invoke;
  v30[3] = &unk_1E63B9A00;
  objc_copyWeak(&v36, (id *)buf);
  v30[4] = self;
  id v23 = v13;
  id v31 = v23;
  id v24 = v15;
  id v32 = v24;
  id v25 = v14;
  id v33 = v25;
  id v26 = v29;
  id v34 = v26;
  id v27 = v16;
  id v35 = v27;
  [v22 performAsync:v30];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

void __101__BNBannerSourceListener___revokePresentablesWithIdentification_withAnimation_reason_userInfo_reply___block_invoke(uint64_t a1)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _removeUnpreparedPresentablesWithIdentification:*(void *)(a1 + 40)];
    id v4 = objc_loadWeakRetained(WeakRetained + 8);
    char v5 = objc_opt_respondsToSelector();
    uint64_t v6 = *(void *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
      uint64_t v15 = [*(id *)(a1 + 40) requestIdentifier];
      if (v15 && (id v16 = (void *)v15, v17 = objc_opt_respondsToSelector(), v16, (v17 & 1) != 0))
      {
        double v12 = [*(id *)(a1 + 40) requestIdentifier];
        id v18 = [*(id *)(a1 + 40) requesterIdentifier];
        uint64_t v19 = [*(id *)(a1 + 56) BOOLValue];
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v21 = *(void *)(a1 + 64);
        id v38 = 0;
        int v22 = [v4 bannerSourceListener:WeakRetained requestsRevokingPresentableWithRequestIdentifier:v12 requesterIdentifier:v18 animated:v19 reason:v20 userInfo:v21 error:&v38];
        uint64_t v11 = (uint64_t)v38;
        id v23 = (void *)MEMORY[0x1E4F1CBF0];
        if (!v22) {
          id v23 = 0;
        }
        id v24 = v23;

        uint64_t v3 = (uint64_t)v24;
      }
      else
      {
        id v25 = [*(id *)(a1 + 40) requestIdentifier];
        if (v25)
        {
        }
        else if (objc_opt_respondsToSelector())
        {
          double v12 = [*(id *)(a1 + 40) requesterIdentifier];
          uint64_t v31 = *(void *)(a1 + 48);
          uint64_t v32 = *(void *)(a1 + 64);
          id v37 = 0;
          int v33 = [v4 bannerSourceListener:WeakRetained requestsRevokingAllPresentablesForRequesterWithIdentifier:v12 reason:v31 userInfo:v32 error:&v37];
          uint64_t v11 = (uint64_t)v37;
          id v34 = (void *)MEMORY[0x1E4F1CBF0];
          if (!v33) {
            id v34 = 0;
          }
          id v35 = v34;

          uint64_t v3 = (uint64_t)v35;
          goto LABEL_25;
        }
        id v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        __int16 v43 = @"No delegate to fulfill request";
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v11 = [v36 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v12];
      }
      goto LABEL_25;
    }
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 56) BOOLValue];
    uint64_t v9 = *(void *)(a1 + 64);
    id v39 = 0;
    double v10 = [v4 bannerSourceListener:WeakRetained requestsRevokingPresentablesWithIdentification:v6 reason:v7 animated:v8 userInfo:v9 error:&v39];
    uint64_t v11 = (uint64_t)v39;
    double v12 = objc_msgSend(v10, "bn_identificationsForPresentables");

    if (v3)
    {
      if (!v12)
      {
        if ([(id)v11 code] == 3)
        {
          uint64_t v30 = 0;
          goto LABEL_24;
        }
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v13 = [(id)v3 arrayByAddingObjectsFromArray:v12];

      uint64_t v3 = v13;
    }
    else
    {
      uint64_t v3 = v12;
    }
    if (!(v3 | v11))
    {
      id v26 = NSString;
      id v27 = BNPresentableIdentificationDescription(*(void **)(a1 + 40));
      uint64_t v11 = [v26 stringWithFormat:@"No pending or presented presentables with identification %@", v27];

      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = v11;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      uint64_t v30 = [v28 errorWithDomain:@"BNBannerSourceErrorDomain" code:3 userInfo:v29];

      uint64_t v3 = 0;
LABEL_24:

      uint64_t v11 = v30;
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  id v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v40 = *MEMORY[0x1E4F28568];
  __int16 v41 = @"Um, lost myself";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  uint64_t v11 = [v14 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v4];
  uint64_t v3 = 0;
LABEL_26:

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)__recommendSuspension:(id)a3 forReason:(id)a4 revokingCurrent:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 262, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  uint64_t v15 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__BNBannerSourceListener___recommendSuspension_forReason_revokingCurrent_reply___block_invoke;
  v21[3] = &unk_1E63B9A28;
  objc_copyWeak(&v26, &location);
  id v16 = v11;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  id v19 = v14;
  id v25 = v19;
  [v15 performAsync:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __80__BNBannerSourceListener___recommendSuspension_forReason_revokingCurrent_reply___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    double v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v17 = @"Um, lost myself";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v9 = [v10 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v4];
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  id v4 = objc_loadWeakRetained(WeakRetained + 8);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"No delegate to fulfill request";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v9 = [v11 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v12];

    goto LABEL_8;
  }
  uint64_t v5 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v6 = [*(id *)(a1 + 40) BOOLValue];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v15 = 0;
  uint64_t v8 = [v4 bannerSourceListener:v3 recommendsSuspending:v5 forReason:v7 revokingCurrent:v6 error:&v15];
  id v9 = v15;
LABEL_9:

  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = [NSNumber numberWithBool:v8];
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v9);
}

- (BOOL)bannerSourceListenerPresentable:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5
{
  return [(BNBannerSourceListener *)self _isConnectingProcessAuthorized:a4 error:a5];
}

- (BOOL)bannerSourceListenerPresentableShouldEnablePresentableContextInterface:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained bannerSourceListenerShouldEnablePresentableContextInterface:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  [(BNBannerSourceListener *)self _removePresentableWithIdentification:v5 requiringUniqueMatch:1];
  [(BNBannerSourceListener *)self _stopObservingAndInvalidatePresentable:v5];
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  [(BNBannerSourceListener *)self _removePresentableWithIdentification:v5 requiringUniqueMatch:1];
  [(BNBannerSourceListener *)self _stopObservingAndInvalidatePresentable:v5];
}

- (void)sceneDidInvalidateForBannerSourceListenerPresentable:(id)a3
{
  id v4 = a3;
  if ([v4 bannerAppearState])
  {
    objc_initWeak(&location, self);
    id v5 = +[BNPresentableIdentification uniqueIdentificationForPresentable:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__BNBannerSourceListener_sceneDidInvalidateForBannerSourceListenerPresentable___block_invoke;
    v6[3] = &unk_1E63B9A50;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(BNBannerSourceListener *)self __revokePresentablesWithIdentification:v5 withAnimation:MEMORY[0x1E4F1CC28] reason:@"BNBannerRevocationReasonSceneDidInvalidate" userInfo:0 reply:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __79__BNBannerSourceListener_sceneDidInvalidateForBannerSourceListenerPresentable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    id v7 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR))
    {
      id v8 = v7;
      id v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = [v5 localizedDescription];
      int v13 = 138543874;
      id v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_ERROR, "%{public}@ (host-side) encountered error attempting to revoke bannerSourceListenerPresentable '%{public}@' for scene invalidation: %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 hasEntitlement:@"com.apple.bannerkit.post"];
  if (BNIsPrototypeFeatureDevelopmentEnabled())
  {
    char v8 = 1;
  }
  else
  {
    authorizedBundleIDs = self->_authorizedBundleIDs;
    double v10 = [v6 bundleIdentifier];
    char v8 = [(NSSet *)authorizedBundleIDs containsObject:v10];
  }
  char v11 = v7 & v8;
  if (a4 && (v7 & v8 & 1) == 0)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
    int v13 = [v6 bundleIdentifier];
    id v14 = (void *)[v12 initWithFormat:@"[%@ (%d)] ", v13, objc_msgSend(v6, "pid")];

    if ((v7 & 1) == 0) {
      [v14 appendString:@"missing entitlement"];
    }
    if ((v8 & 1) == 0)
    {
      if (v7) {
        __int16 v15 = @"not an authorized bundle ID";
      }
      else {
        __int16 v15 = @", not an authorized bundle ID";
      }
      [v14 appendString:v15];
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = v14;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a4 = [v16 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v17];
  }
  return v11;
}

- (void)_addConnection:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_connections addObject:v5];
  objc_sync_exit(v4);
}

- (void)_removeConnection:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_connections removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_addUnpreparedPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    unpreparedPresentables = v5->_unpreparedPresentables;
    if (!unpreparedPresentables)
    {
      int v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      char v8 = v5->_unpreparedPresentables;
      v5->_unpreparedPresentables = v7;

      unpreparedPresentables = v5->_unpreparedPresentables;
    }
    [(NSMutableSet *)unpreparedPresentables addObject:v9];
    objc_sync_exit(v5);

    id v4 = v9;
  }
}

- (BOOL)_isPresentableWaitingToBeMadeReady:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    char v6 = [(NSMutableSet *)v5->_unpreparedPresentables containsObject:v4];
    objc_sync_exit(v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isPresentableWithIdentificationWaitingToBeMadeReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v6 = v5->_unpreparedPresentables;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (BNIsPresentableIdentifiedByIdentification(*(void **)(*((void *)&v11 + 1) + 8 * i), v4, 1))
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_removeUnpreparedPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_unpreparedPresentables removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (id)_removeUnpreparedPresentablesWithIdentification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    id v6 = (void *)[(NSMutableSet *)v5->_unpreparedPresentables copy];
    id v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v22;
      *(void *)&long long v9 = 138543618;
      long long v19 = v9;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification(v12, v4, 0))
          {
            long long v13 = (id)BNLogHostingHost;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              long long v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              id v15 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v16 = BNEffectivePresentableDescription(v12);
              *(_DWORD *)buf = v19;
              id v26 = v15;
              __int16 v27 = 2114;
              id v28 = v16;
              _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) removing presentable waiting to be made ready: %{public}@", buf, 0x16u);
            }
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            __int16 v17 = +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", v12, v19);
            [v7 addObject:v17];

            [(BNBannerSourceListener *)obj _removeUnpreparedPresentable:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    objc_sync_exit(obj);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addPresentable:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!v4->_requesterIDsToPresentables)
    {
      id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      requesterIDsToPresentables = v4->_requesterIDsToPresentables;
      v4->_requesterIDsToPresentables = v5;
    }
    id v7 = [v9 requesterIdentifier];
    uint64_t v8 = [(NSMutableDictionary *)v4->_requesterIDsToPresentables objectForKeyedSubscript:v7];
    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      [(NSMutableDictionary *)v4->_requesterIDsToPresentables setObject:v8 forKeyedSubscript:v7];
    }
    [v8 addObject:v9];

    objc_sync_exit(v4);
  }
}

- (id)_presentablesWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 requesterIdentifier];
  uint64_t v8 = [v7 length];

  if (!v8) {
    goto LABEL_14;
  }
  id v9 = self;
  objc_sync_enter(v9);
  requesterIDsToPresentables = v9->_requesterIDsToPresentables;
  long long v11 = [v6 requesterIdentifier];
  long long v12 = [(NSMutableDictionary *)requesterIDsToPresentables objectForKeyedSubscript:v11];
  long long v13 = (void *)[v12 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v13;
  id v15 = 0;
  uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (BNIsPresentableIdentifiedByIdentification(v19, v6, a4))
        {
          if (!v15) {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          objc_msgSend(v15, "addObject:", v19, (void)v21);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  objc_sync_exit(v9);
  if (!v15) {
LABEL_14:
  }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);

  return v15;
}

- (id)_uniquePresentableWithIdentification:(id)a3
{
  id v5 = a3;
  id v6 = [(BNBannerSourceListener *)self _presentablesWithIdentification:v5 requiringUniqueMatch:1];
  if ((unint64_t)[v6 count] >= 2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BNBannerSourceListener.m", 456, @"Found multiple presentables with the unique identification: identificatio: %@; matching presentable: %@",
      v5,
      v6);
  }
  id v7 = [v6 anyObject];

  return v7;
}

- (void)_removePresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [v8 requesterIdentifier];
    id v7 = [(NSMutableDictionary *)v5->_requesterIDsToPresentables objectForKeyedSubscript:v6];
    if ([v7 containsObject:v8])
    {
      [v7 removeObject:v8];
      if (![v7 count]) {
        [(NSMutableDictionary *)v5->_requesterIDsToPresentables removeObjectForKey:v6];
      }
    }

    objc_sync_exit(v5);
    id v4 = v8;
  }
}

- (void)_removePresentableWithIdentification:(id)a3 requiringUniqueMatch:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    requesterIDsToPresentables = self->_requesterIDsToPresentables;
    id v9 = [v6 requesterIdentifier];
    uint64_t v10 = [(NSMutableDictionary *)requesterIDsToPresentables objectForKeyedSubscript:v9];
    long long v11 = (void *)[v10 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification(v17, v7, a4)) {
            -[BNBannerSourceListener _removePresentable:](self, "_removePresentable:", v17, (void)v18);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (void)_stopObservingAndInvalidatePresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 removePresentableObserver:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 invalidate];
  }
}

- (void)_requestPostingBannerSourceListenerPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v16 = 0;
    int v11 = [WeakRetained bannerSourceListener:self requestsPostingPresentable:v8 options:a4 userInfo:v9 error:&v16];
    id v12 = v16;
    if (v11) {
      [(BNBannerSourceListener *)self _addPresentable:v8];
    }
  }
  else
  {
    [v8 invalidate];
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"No delegate to fulfill request";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v12 = [v13 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v14];
  }
  if (v12)
  {
    uint64_t v15 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSourceListener _requestPostingBannerSourceListenerPresentable:options:userInfo:](v15);
    }
  }
}

- (void)_requestPostingBannerSourceListenerPresentableWaitingToBeMadeReady:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(BNBannerSourceListener *)self _isPresentableWaitingToBeMadeReady:v8])
  {
    [(BNBannerSourceListener *)self _requestPostingBannerSourceListenerPresentable:v8 options:a4 userInfo:v9];
    [(BNBannerSourceListener *)self _removeUnpreparedPresentable:v8];
  }
  else
  {
    [v8 invalidate];
    uint64_t v10 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = BNEffectivePresentableDescription(v8);
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2114;
      long long v18 = v14;
      _os_log_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) presentable is ready, but no longer tracked (likely revoked): %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_addUnpreparedBannerSourcePresentableForBannerSpecification:(id)a3 remoteProcess:(id)a4 scene:(id)a5 readyCompletion:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v14 = [v21 contentBehavior];
  uint64_t v15 = [v21 contentBehavior];
  if (objc_opt_respondsToSelector())
  {
    id v16 = [(BSServiceConnectionListener *)self->_connectionListener domain];
    uint64_t v17 = [WeakRetained bannerSourceListener:self newBannerSourceListenerPresentableForBannerSpecification:v21 serviceDomain:v16 remoteProcess:v10 readyCompletion:v12];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v16 = [(BSServiceConnectionListener *)self->_connectionListener domain];
    uint64_t v17 = [WeakRetained bannerSourceListener:self newBannerSourceListenerPresentableForBannerSpecification:v21 serviceDomain:v16 scene:v11 readyCompletion:v12];
  }
  else if (v15 == 1)
  {
    long long v18 = [BNBannerSourceListenerPresentableViewController alloc];
    id v16 = [(BSServiceConnectionListener *)self->_connectionListener domain];
    uint64_t v17 = [(BNBannerSourceListenerPresentableViewController *)v18 initWithSpecification:v21 serviceDomain:v16 readyCompletion:v12];
  }
  else
  {
    uint64_t v19 = [BNBannerSourceListenerHostedPresentableViewController alloc];
    id v16 = [(BSServiceConnectionListener *)self->_connectionListener domain];
    uint64_t v17 = [(BNBannerSourceListenerHostedPresentableViewController *)v19 initWithSpecification:v21 serviceDomain:v16 scene:v11 readyCompletion:v12];
  }
  long long v20 = (void *)v17;

  [v20 addPresentableObserver:self];
  [v20 setDelegate:self];
  [(BNBannerSourceListener *)self _addUnpreparedPresentable:v20];
  if (v14 == 2 || v15 == 1) {
    [v20 makeReadyIfPossible];
  }
}

- (id)_createSceneWithIdentifier:(id)a3 forProcess:(id)a4 preferredContentSize:(CGSize)a5 contentOutsets:(UIEdgeInsets)a6 userInfo:(id)a7
{
  CGFloat right = a6.right;
  CGFloat bottom = a6.bottom;
  CGFloat left = a6.left;
  CGFloat top = a6.top;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  BSDispatchQueueAssertMain();
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 547, @"Invalid parameter not satisfying: %@", @"sceneID" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  id v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"BNBannerSourceListener.m", 548, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v21 = [WeakRetained bannerSourceListener:self sceneSpecificationForBannerSceneWithIdentifier:v17 forProcess:v18 userInfo:v19];
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v21 = [WeakRetained sceneSpecificationForBannerSourceListener:self];
LABEL_7:
    long long v22 = (void *)v21;
    if (v21) {
      goto LABEL_9;
    }
  }
  long long v22 = +[FBSSceneSpecification specification];
LABEL_9:
  uint64_t v23 = [MEMORY[0x1E4F62458] parametersForSpecification:v22];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke;
  v44[3] = &unk_1E63B9A78;
  v44[4] = self;
  id v24 = WeakRetained;
  id v45 = v24;
  CGFloat v46 = width;
  CGFloat v47 = height;
  CGFloat v48 = top;
  CGFloat v49 = left;
  CGFloat v50 = bottom;
  CGFloat v51 = right;
  [v23 updateSettingsWithBlock:v44];
  if (objc_opt_respondsToSelector()) {
    [v24 bannerSourceListener:self didUpdateInitialSceneSettingsWithParameters:v23];
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke_2;
  v36[3] = &unk_1E63B9AA0;
  id v25 = v23;
  id v37 = v25;
  CGFloat v38 = width;
  CGFloat v39 = height;
  CGFloat v40 = top;
  CGFloat v41 = left;
  CGFloat v42 = bottom;
  CGFloat v43 = right;
  [v25 updateClientSettingsWithBlock:v36];
  if (objc_opt_respondsToSelector()) {
    [v24 bannerSourceListener:self didUpdateInitialSceneClientSettingsWithParameters:v25];
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F62450]);
  [v26 setSpecification:v22];
  __int16 v27 = (void *)MEMORY[0x1E4F62470];
  id v28 = [v18 identity];
  id v29 = [v27 identityForProcessIdentity:v28];
  [v26 setClientIdentity:v29];

  uint64_t v30 = [MEMORY[0x1E4F62480] identityForIdentifier:v17 workspaceIdentifier:@"com.apple.BannerKit"];
  [v26 setIdentity:v30];

  uint64_t v31 = [MEMORY[0x1E4F62490] sharedInstance];
  uint64_t v32 = [v31 createSceneWithDefinition:v26 initialParameters:v25];

  return v32;
}

void __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [*(id *)(*(void *)(a1 + 32) + 8) bounds];
  double v9 = v8;
  double v11 = v10;
  double v18 = v8;
  double v19 = v10;
  if (objc_opt_respondsToSelector())
  {
    id v12 = [*(id *)(a1 + 40) bannerSourceListener:*(void *)(a1 + 32) layoutDescriptionWithError:0];
    [v12 containerSize];
    double v18 = v13;
    double v19 = v14;
    [v12 presentationSize];
    double v9 = v15;
    double v11 = v16;
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) bannerSourceListener:*(void *)(a1 + 32) presentationSize:&v18 containerSize:&v18 error:0];
  }
  BSRectWithSize();
  objc_msgSend(v7, "setFrame:");
  [v7 setInterfaceOrientation:1];
  [v7 setDisplayConfiguration:*(void *)(*(void *)(a1 + 32) + 8)];
  [v7 setForeground:1];
  id v17 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v17, "userInterfaceStyle"));

  objc_msgSend(v7, "setContainerSize:", v18, v19);
  objc_msgSend(v7, "setPresentationSize:", v9, v11);
}

void __109__BNBannerSourceListener__createSceneWithIdentifier_forProcess_preferredContentSize_contentOutsets_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v8 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [*(id *)(a1 + 32) settings];
  objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  objc_msgSend(v6, "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v6, "setBannerContentOutsets:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (BNBannerSourceListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSourceListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requesterIDsToPresentables, 0);
  objc_storeStrong((id *)&self->_unpreparedPresentables, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIDs, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(uint64_t)a2 withContext:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v13 = [a3 localizedDescription];
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v7, v8, "%{public}@ (host-side) connection failed to authenticate: %{public}@", v9, v10, v11, v12, 2u);
}

- (void)_requestPostingBannerSourceListenerPresentable:(void *)a1 options:userInfo:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v4, v5, "%{public}@ (host-side) encountered error interacting with delegate: %{public}@", v6, v7, v8, v9, 2u);
}

@end