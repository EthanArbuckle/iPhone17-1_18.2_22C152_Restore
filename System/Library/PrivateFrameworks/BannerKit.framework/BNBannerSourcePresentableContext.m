@interface BNBannerSourcePresentableContext
- (BNBannerSourcePresentableContext)initWithPresentableIdentification:(id)a3 contentBehavior:(int64_t)a4 serviceDomain:(id)a5;
- (BNBannerSourcePresentableContextDelegate)delegate;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isTouchOutsideDismissalEnabled;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSUUID)uniquePresentableIdentifier;
- (int64_t)contentBehavior;
- (void)__setDraggingDismissalEnabled:(id)a3 error:(id *)a4;
- (void)__setDraggingInteractionEnabled:(id)a3 error:(id *)a4;
- (void)__setTouchOutsideDismissalEnabled:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)handlePresentableWillNotAppearWithReason:(id)a3;
- (void)handleTemplateContentEvent:(int64_t)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updatePresentableAppearState:(int)a3 reason:(id)a4;
- (void)updateUserInteractionWillBegin:(BOOL)a3;
@end

@implementation BNBannerSourcePresentableContext

- (BNBannerSourcePresentableContext)initWithPresentableIdentification:(id)a3 contentBehavior:(int64_t)a4 serviceDomain:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)BNBannerSourcePresentableContext;
  v11 = [(BNBannerSourcePresentableContext *)&v32 init];
  if (v11)
  {
    if (!v9)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, v11, @"BNBannerSourcePresentableContext.m", 30, @"Invalid parameter not satisfying: %@", @"presentableIdentification" object file lineNumber description];
    }
    v12 = [v9 requesterIdentifier];
    uint64_t v13 = [v12 copy];
    requesterIdentifier = v11->_requesterIdentifier;
    v11->_requesterIdentifier = (NSString *)v13;

    v15 = [v9 requestIdentifier];
    uint64_t v16 = [v15 copy];
    requestIdentifier = v11->_requestIdentifier;
    v11->_requestIdentifier = (NSString *)v16;

    v18 = [v9 uniquePresentableIdentifier];
    uint64_t v19 = [v18 copy];
    uniquePresentableIdentifier = v11->_uniquePresentableIdentifier;
    v11->_uniquePresentableIdentifier = (NSUUID *)v19;

    v11->_contentBehavior = a4;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)Serial;

    v23 = (void *)MEMORY[0x1E4F623F0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __100__BNBannerSourcePresentableContext_initWithPresentableIdentification_contentBehavior_serviceDomain___block_invoke;
    v29[3] = &unk_1E63B9680;
    id v30 = v10;
    v24 = v11;
    v31 = v24;
    uint64_t v25 = [v23 listenerWithConfigurator:v29];
    id v26 = v24[1];
    v24[1] = (id)v25;

    [v24[1] activate];
  }

  return v11;
}

void __100__BNBannerSourcePresentableContext_initWithPresentableIdentification_contentBehavior_serviceDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 setDomain:v3];
  v4 = +[BNPresentableContextSessionSpecification identifier];
  [v6 setService:v4];

  v5 = BNSceneIdentifierForRequest(*(void **)(*(void *)(a1 + 40) + 40), *(void **)(*(void *)(a1 + 40) + 48), *(void **)(*(void *)(a1 + 40) + 56));
  [v6 setInstance:v5];

  [v6 setDelegate:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourcePresentableContext;
  [(BNBannerSourcePresentableContext *)&v3 dealloc];
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(BSServiceConnectionHost *)self->_connection remoteTarget];
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      id v6 = [NSNumber numberWithInteger:a3];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke;
      v14[3] = &unk_1E63B96A8;
      objc_copyWeak(&v15, (id *)location);
      objc_msgSend(v5, "__handleTemplateContentEvent:reply:", v6, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v13, self);
      v7 = [NSNumber numberWithInteger:a3];
      id v12 = 0;
      objc_msgSend(v5, "__handleTemplateContentEvent:error:", v7, &v12);
      id v8 = v12;

      if (v8)
      {
        id v9 = (id)BNLogContextHost;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = objc_loadWeakRetained(&v13);
          v11 = BNPresentableIdentificationDescription(v10);
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v11;
          __int16 v17 = 2114;
          id v18 = v8;
          _os_log_error_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_ERROR, "Error asking client presentable to handle template content event: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);
        }
      }

      objc_destroyWeak(&v13);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:]();
  }
}

void __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR)) {
      __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke_cold_1(a1, v4);
    }
  }
}

- (void)updatePresentableAppearState:(int)a3 reason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(BSServiceConnectionHost *)self->_connection remoteTarget];
  if (v7)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      id v8 = [NSNumber numberWithUnsignedInt:v4];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke;
      v16[3] = &unk_1E63B96A8;
      objc_copyWeak(&v17, (id *)location);
      objc_msgSend(v7, "__setBannerAppearState:reason:reply:", v8, v6, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v15, self);
      id v9 = [NSNumber numberWithUnsignedInt:v4];
      id v14 = 0;
      objc_msgSend(v7, "__setBannerAppearState:reason:error:", v9, v6, &v14);
      id v10 = v14;

      if (v10)
      {
        v11 = (id)BNLogContextHost;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = objc_loadWeakRetained(&v15);
          id v13 = BNPresentableIdentificationDescription(v12);
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v13;
          __int16 v19 = 2114;
          id v20 = v10;
          _os_log_error_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_ERROR, "Error updating client presentable appearance state: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);
        }
      }

      objc_destroyWeak(&v15);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:]();
  }
}

void __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR)) {
      __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke_cold_1(a1, v4);
    }
  }
}

- (void)handlePresentableWillNotAppearWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BSServiceConnectionHost *)self->_connection remoteTarget];
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke;
      v12[3] = &unk_1E63B96A8;
      objc_copyWeak(&v13, (id *)location);
      objc_msgSend(v5, "__bannerWillNotAppearWithReason:reply:", v4, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v11, self);
      id v10 = 0;
      objc_msgSend(v5, "__bannerWillNotAppearWithReason:error:", v4, &v10);
      id v6 = v10;
      if (v6)
      {
        v7 = (id)BNLogContextHost;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v8 = objc_loadWeakRetained(&v11);
          id v9 = BNPresentableIdentificationDescription(v8);
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v9;
          __int16 v15 = 2114;
          id v16 = v6;
          _os_log_error_impl(&dword_1BEC04000, v7, OS_LOG_TYPE_ERROR, "Error notifying client presentable will not appear: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);
        }
      }

      objc_destroyWeak(&v11);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:]();
  }
}

void __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR)) {
      __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke_cold_1(a1, v4);
    }
  }
}

- (void)updateUserInteractionWillBegin:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(BSServiceConnectionHost *)self->_connection remoteTarget];
  if (v5)
  {
    if (self->_contentBehavior == 1)
    {
      objc_initWeak((id *)location, self);
      id v6 = [NSNumber numberWithBool:v3];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke;
      v14[3] = &unk_1E63B96A8;
      objc_copyWeak(&v15, (id *)location);
      objc_msgSend(v5, "__setUserInteractionWillBegin:reply:", v6, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);
    }
    else
    {
      objc_initWeak(&v13, self);
      v7 = [NSNumber numberWithBool:v3];
      id v12 = 0;
      objc_msgSend(v5, "__setUserInteractionWillBegin:error:", v7, &v12);
      id v8 = v12;

      if (v8)
      {
        id v9 = (id)BNLogContextHost;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = objc_loadWeakRetained(&v13);
          id v11 = BNPresentableIdentificationDescription(v10);
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v11;
          __int16 v17 = 2114;
          id v18 = v8;
          _os_log_error_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_ERROR, "Error informing client of user interaction change: presentable: %{public}@; error: %{public}@",
            location,
            0x16u);
        }
      }

      objc_destroyWeak(&v13);
    }
  }
  else if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSourcePresentableContext handleTemplateContentEvent:]();
  }
}

void __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR)) {
      __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke_cold_1(a1, v4);
    }
  }
}

- (void)invalidate
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v9 remoteProcess];
    id v18 = 0;
    int v13 = [WeakRetained bannerSourcePresentableContext:self isConnectingProcessAuthorized:v12 error:&v18];
    id v14 = v18;

    if (v13)
    {
      id v15 = self;
      objc_sync_enter(v15);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke;
      v17[3] = &unk_1E63B9568;
      v17[4] = v15;
      [v9 configureConnection:v17];
      objc_storeStrong((id *)&v15->_connection, a4);
      [(BSServiceConnectionHost *)v15->_connection activate];
      objc_sync_exit(v15);

      goto LABEL_8;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v16 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_ERROR)) {
    -[BNBannerSourcePresentableContext listener:didReceiveConnection:withContext:](v16, (uint64_t)self, v14);
  }
  [v9 invalidate];
LABEL_8:
}

void __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BNPresentableContextSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[BNPresentableContextSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke_2;
  id v9 = &unk_1E63B96D0;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 32) + 16), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__BNBannerSourcePresentableContext_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)BNLogContextHost;
    if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      id v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    if (WeakRetained[9] == 1) {
      *((unsigned char *)WeakRetained + 32) = 1;
    }
  }
}

- (void)__setDraggingDismissalEnabled:(id)a3 error:(id *)a4
{
  self->_draggingDismissalEnabled = [a3 integerValue] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bannerSourcePresentableContextDraggingDismissalEnabledDidChange:self];
  }
}

- (void)__setDraggingInteractionEnabled:(id)a3 error:(id *)a4
{
  self->_draggingInteractionEnabled = [a3 integerValue] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bannerSourcePresentableContextDraggingInteractionEnabledDidChange:self];
  }
}

- (void)__setTouchOutsideDismissalEnabled:(id)a3 error:(id *)a4
{
  self->_touchOutsideDismissalEnabled = [a3 integerValue] != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bannerSourcePresentableContextTouchOutsideDismissalEnabledDidChange:self];
  }
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (BNBannerSourcePresentableContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSourcePresentableContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (BOOL)isDraggingDismissalEnabled
{
  return self->_draggingDismissalEnabled;
}

- (BOOL)isDraggingInteractionEnabled
{
  return self->_draggingInteractionEnabled;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return self->_touchOutsideDismissalEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)handleTemplateContentEvent:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v0, v1, "Failed to obtain remote target from connection: context: %{public}@; error: %{public}@",
    v2);
}

void __63__BNBannerSourcePresentableContext_handleTemplateContentEvent___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  id v3 = OUTLINED_FUNCTION_4_0();
  id v4 = BNPresentableIdentificationDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v5, v6, "Error asking client presentable to handle template content event: presentable: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void __72__BNBannerSourcePresentableContext_updatePresentableAppearState_reason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  id v3 = OUTLINED_FUNCTION_4_0();
  id v4 = BNPresentableIdentificationDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v5, v6, "Error updating client presentable appearance state: presentable: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void __77__BNBannerSourcePresentableContext_handlePresentableWillNotAppearWithReason___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  id v3 = OUTLINED_FUNCTION_4_0();
  id v4 = BNPresentableIdentificationDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v5, v6, "Error notifying client presentable will not appear: presentable: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void __67__BNBannerSourcePresentableContext_updateUserInteractionWillBegin___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  id v3 = OUTLINED_FUNCTION_4_0();
  id v4 = BNPresentableIdentificationDescription(v3);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1BEC04000, v5, v6, "Error informing client of user interaction change: presentable: %{public}@; error: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

- (void)listener:(void *)a1 didReceiveConnection:(uint64_t)a2 withContext:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a3 localizedDescription];
  int v9 = 138543618;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  id v12 = v7;
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v4, v8, "%{public}@ (host-side) connection failed to authenticate: %{public}@", (uint8_t *)&v9);
}

@end