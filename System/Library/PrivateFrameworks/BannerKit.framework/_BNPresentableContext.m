@interface _BNPresentableContext
+ (void)initialize;
- (BNPresentable)presentable;
- (NSString)description;
- (_BNPresentableContext)initWithMachName:(id)a3 presentable:(id)a4;
- (id)_activeConnectionWithError:(id *)a3;
- (void)__bannerWillNotAppearWithReason:(id)a3 error:(id *)a4;
- (void)__bannerWillNotAppearWithReason:(id)a3 reply:(id)a4;
- (void)__handleTemplateContentEvent:(id)a3 error:(id *)a4;
- (void)__handleTemplateContentEvent:(id)a3 reply:(id)a4;
- (void)__setBannerAppearState:(id)a3 reason:(id)a4 error:(id *)a5;
- (void)__setBannerAppearState:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)__setUserInteractionWillBegin:(id)a3 error:(id *)a4;
- (void)__setUserInteractionWillBegin:(id)a3 reply:(id)a4;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_invalidateConnection;
- (void)_runPostConnectionInvalidation;
- (void)_setBannerAppearState:(int)a3 reason:(id)a4;
- (void)addPresentableObserver:(id)a3;
- (void)invalidate;
- (void)removePresentableObserver:(id)a3;
- (void)setHostNeedsUpdate;
- (void)setPresentable:(id)a3;
@end

@implementation _BNPresentableContext

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (_BNPresentableContext)initWithMachName:(id)a3 presentable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BNPresentableContext.m", 51, @"Invalid parameter not satisfying: %@", @"machName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"BNPresentableContext.m", 52, @"Invalid parameter not satisfying: %@", @"presentable" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)_BNPresentableContext;
  v10 = [(_BNPresentableContext *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_valid = 1;
    uint64_t v12 = [v7 copy];
    machName = v11->_machName;
    v11->_machName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_presentable, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v11->_connectionQueue;
    v11->_connectionQueue = (OS_dispatch_queue *)Serial;
  }
  return v11;
}

- (void)setHostNeedsUpdate
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1BEC04000, v0, v1, "Error informing host of update: context: %{public}@; error: %{public}@");
}

- (void)__setBannerAppearState:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v9 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61___BNPresentableContext___setBannerAppearState_reason_error___block_invoke;
  v12[3] = &unk_1E63B9798;
  objc_copyWeak(&v15, &location);
  id v10 = v7;
  id v13 = v10;
  id v11 = v8;
  id v14 = v11;
  [v9 performAsync:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)__setBannerAppearState:(id)a3 reason:(id)a4 reply:(id)a5
{
  uint64_t v9 = 0;
  id v8 = (void (**)(id, void))a5;
  [(_BNPresentableContext *)self __setBannerAppearState:a3 reason:a4 error:&v9];
  v8[2](v8, v9);
}

- (void)__bannerWillNotAppearWithReason:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)BNLogContextService;
  if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    presentable = self->_presentable;
    id v8 = v6;
    uint64_t v9 = BNEffectivePresentableDescription(presentable);
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v10 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke;
  v12[3] = &unk_1E63B97E8;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v5;
  id v13 = v11;
  [v10 performAsync:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)__bannerWillNotAppearWithReason:(id)a3 reply:(id)a4
{
  uint64_t v7 = 0;
  v6 = (void (**)(id, void))a4;
  [(_BNPresentableContext *)self __bannerWillNotAppearWithReason:a3 error:&v7];
  v6[2](v6, v7);
}

- (void)__setUserInteractionWillBegin:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke;
  v8[3] = &unk_1E63B97E8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 performAsync:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)__setUserInteractionWillBegin:(id)a3 reply:(id)a4
{
  uint64_t v7 = 0;
  v6 = (void (**)(id, void))a4;
  [(_BNPresentableContext *)self __setUserInteractionWillBegin:a3 error:&v7];
  v6[2](v6, v7);
}

- (void)__handleTemplateContentEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self->_presentable;
  uint64_t v7 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60___BNPresentableContext___handleTemplateContentEvent_error___block_invoke;
  v10[3] = &unk_1E63B9838;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 performAsync:v10];
}

- (void)__handleTemplateContentEvent:(id)a3 reply:(id)a4
{
  uint64_t v7 = 0;
  v6 = (void (**)(id, void))a4;
  [(_BNPresentableContext *)self __handleTemplateContentEvent:a3 error:&v7];
  v6[2](v6, v7);
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_valid)
  {
    v2->_valid = 0;
    v3 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "BNPresentableContext invalidated: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    [(_BNPresentableContext *)v2 _invalidateConnection];
  }
  objc_sync_exit(v2);
}

- (void)addPresentableObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSHashTable *)observers addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removePresentableObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  machName = self->_machName;
  uint64_t v6 = NSStringFromBOOL();
  uint64_t v7 = BNEffectivePresentableDescription(self->_presentable);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; machName: %@; isValid: %@: presentable: %@>",
    v4,
    self,
    machName,
    v6,
  id v8 = v7);

  return (NSString *)v8;
}

- (id)_activeConnectionWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_valid)
  {
    if (v4->_connection) {
      goto LABEL_9;
    }
    id v5 = (void *)MEMORY[0x1E4F623E8];
    machName = v4->_machName;
    uint64_t v7 = +[BNPresentableContextSessionSpecification identifier];
    id v8 = [(BNPresentable *)v4->_presentable requesterIdentifier];
    id v9 = [(BNPresentable *)v4->_presentable requestIdentifier];
    id v10 = [(BNPresentable *)v4->_presentable uniquePresentableIdentifier];
    id v11 = BNSceneIdentifierForRequest(v8, v9, v10);
    id v12 = [v5 endpointForMachName:machName service:v7 instance:v11];

    uint64_t v13 = [MEMORY[0x1E4F623E0] connectionWithEndpoint:v12];
    connection = v4->_connection;
    v4->_connection = (BSServiceConnection *)v13;

    id v15 = v4->_connection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke;
    v20[3] = &unk_1E63B9568;
    v20[4] = v4;
    [(BSServiceConnection *)v15 configureConnection:v20];
    [(BSServiceConnection *)v4->_connection activate];
    goto LABEL_8;
  }
  v16 = BNLogContextService;
  if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_ERROR)) {
    -[_BNPresentableContext _activeConnectionWithError:]((uint64_t)v4, v16);
  }
  if (a3)
  {
    __int16 v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Attempt to establish connection with an invalidated BNPresentableContext";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a3 = [v17 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v12];
LABEL_8:
  }
LABEL_9:
  id v18 = v4->_connection;
  objc_sync_exit(v4);

  return v18;
}

- (void)_invalidateConnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    v3 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = v2;
      _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(BSServiceConnection *)v2->_connection invalidate];
    connection = v2->_connection;
    v2->_connection = 0;

    [(_BNPresentableContext *)v2 _runPostConnectionInvalidation];
  }
  objc_sync_exit(v2);
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_setBannerAppearState:(int)a3 reason:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_presentableAppearState != a3)
  {
    self->_presentableAppearState = a3;
    switch(a3)
    {
      case 0:
        uint64_t v7 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          presentable = self->_presentable;
          uint64_t v9 = v7;
          uint64_t v10 = BNEffectivePresentableDescription(presentable);
          *(_DWORD *)buf = 138543618;
          v33 = v10;
          __int16 v34 = 2114;
          id v35 = v6;
          _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Presentable did disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);
        }
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableDidDisappearAsBanner:self->_presentable withReason:v6];
        }
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_62;
        v26[3] = &unk_1E63B97C0;
        v26[4] = self;
        id v27 = v6;
        [(_BNPresentableContext *)self _enumerateObserversRespondingToSelector:sel_presentableDidDisappearAsBanner_withReason_ usingBlock:v26];
        uint64_t v11 = v27;
        goto LABEL_24;
      case 1:
        long long v12 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          long long v13 = self->_presentable;
          long long v14 = v12;
          long long v15 = BNEffectivePresentableDescription(v13);
          *(_DWORD *)buf = 138543362;
          v33 = v15;
          _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "Presentable will appear as banner: %{public}@", buf, 0xCu);
        }
        v16 = sel_presentableWillAppearAsBanner_;
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableWillAppearAsBanner:self->_presentable];
        }
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke;
        v31[3] = &unk_1E63B9810;
        v31[4] = self;
        uint64_t v17 = v31;
        goto LABEL_18;
      case 2:
        id v18 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = self->_presentable;
          v20 = v18;
          uint64_t v21 = BNEffectivePresentableDescription(v19);
          *(_DWORD *)buf = 138543362;
          v33 = v21;
          _os_log_impl(&dword_1BEC04000, v20, OS_LOG_TYPE_DEFAULT, "Presentable did appear as banner: %{public}@", buf, 0xCu);
        }
        v16 = sel_presentableDidAppearAsBanner_;
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableDidAppearAsBanner:self->_presentable];
        }
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_56;
        v30[3] = &unk_1E63B9810;
        v30[4] = self;
        uint64_t v17 = v30;
LABEL_18:
        [(_BNPresentableContext *)self _enumerateObserversRespondingToSelector:v16 usingBlock:v17];
        break;
      case 3:
        v22 = (void *)BNLogContextService;
        if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
        {
          v23 = self->_presentable;
          v24 = v22;
          v25 = BNEffectivePresentableDescription(v23);
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          __int16 v34 = 2114;
          id v35 = v6;
          _os_log_impl(&dword_1BEC04000, v24, OS_LOG_TYPE_DEFAULT, "Presentable will disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);
        }
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableWillDisappearAsBanner:self->_presentable withReason:v6];
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_59;
        v28[3] = &unk_1E63B97C0;
        v28[4] = self;
        id v29 = v6;
        [(_BNPresentableContext *)self _enumerateObserversRespondingToSelector:sel_presentableWillDisappearAsBanner_withReason_ usingBlock:v28];
        uint64_t v11 = v29;
LABEL_24:

        break;
      default:
        break;
    }
  }
}

- (void)_runPostConnectionInvalidation
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___BNPresentableContext__runPostConnectionInvalidation__block_invoke;
  v3[3] = &unk_1E63B9860;
  objc_copyWeak(&v4, &location);
  [v2 performAsync:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

- (void)_activeConnectionWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEC04000, a2, OS_LOG_TYPE_ERROR, "Attempt to establish connection with an invalidated BNPresentableContext: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end