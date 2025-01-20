@interface AMSDeviceMessenger
- (AMSDaemonConnection)connection;
- (AMSDeviceMessenger)init;
- (NSMutableArray)updateHandlers;
- (OS_dispatch_queue)queue;
- (id)_getProxyObject;
- (id)_identifierFromDialogRequest:(id)a3;
- (id)clearDialog:(id)a3;
- (id)dialogsWithFilter:(id)a3;
- (id)sendDialog:(id)a3 account:(id)a4;
- (void)_sendDelegateUpdateForMessage:(id)a3;
- (void)addUpdateHandlerForType:(int64_t)a3 filter:(id)a4 handler:(id)a5;
- (void)deviceMessengerDidClearMessage:(id)a3;
- (void)deviceMessengerDidReceiveMessage:(id)a3;
- (void)deviceMessengerDidReceiveReply:(id)a3;
- (void)deviceMessengerDidUpdateDevices;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateHandlers:(id)a3;
@end

@implementation AMSDeviceMessenger

- (AMSDeviceMessenger)init
{
  v14.receiver = self;
  v14.super_class = (Class)AMSDeviceMessenger;
  v2 = [(AMSDeviceMessenger *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSDaemonConnection);
    connection = v2->_connection;
    v2->_connection = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AMSDeviceMessenger", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updateHandlers = v2->_updateHandlers;
    v2->_updateHandlers = v7;

    objc_initWeak(&location, v2);
    v9 = v2->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__AMSDeviceMessenger_init__block_invoke;
    v11[3] = &unk_1E559F890;
    objc_copyWeak(&v12, &location);
    [(AMSDaemonConnection *)v9 addInterruptionHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__AMSDeviceMessenger_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)addUpdateHandlerForType:(int64_t)a3 filter:(id)a4 handler:(id)a5
{
  v8 = (AMSDeviceMessengerFilter *)a4;
  id v9 = a5;
  if (!v8) {
    v8 = objc_alloc_init(AMSDeviceMessengerFilter);
  }
  [(AMSDeviceMessengerFilter *)v8 setMessageType:a3];
  v10 = [(AMSDeviceMessenger *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AMSDeviceMessenger_addUpdateHandlerForType_filter_handler___block_invoke;
  block[3] = &unk_1E559F7F0;
  v15 = self;
  id v16 = v9;
  objc_super v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);
}

void __61__AMSDeviceMessenger_addUpdateHandlerForType_filter_handler___block_invoke(uint64_t a1)
{
  v4 = objc_alloc_init(AMSDeviceUpdateHandlerInfo);
  [(AMSDeviceUpdateHandlerInfo *)v4 setFilter:*(void *)(a1 + 32)];
  v2 = (void *)[*(id *)(a1 + 48) copy];
  [(AMSDeviceUpdateHandlerInfo *)v4 setBlock:v2];

  v3 = [*(id *)(a1 + 40) updateHandlers];
  [v3 addObject:v4];
}

- (id)dialogsWithFilter:(id)a3
{
  v4 = (AMSDeviceMessengerFilter *)a3;
  if (!v4) {
    v4 = objc_alloc_init(AMSDeviceMessengerFilter);
  }
  [(AMSDeviceMessengerFilter *)v4 setMessageType:1];
  dispatch_queue_t v5 = objc_alloc_init(AMSMutablePromise);
  v6 = [(AMSDeviceMessenger *)self _getProxyObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke;
  v12[3] = &unk_1E55A1DF0;
  v7 = v5;
  v13 = v7;
  objc_super v14 = self;
  v15 = v4;
  v8 = v4;
  [v6 addFinishBlock:v12];

  id v9 = v15;
  v10 = v7;

  return v10;
}

void __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke_2;
    v8[3] = &unk_1E55A1DC8;
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    id v6 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    id v10 = *(id *)(a1 + 48);
    [a2 getMessagesWithPurpose:50 completion:v8];
  }
}

void __40__AMSDeviceMessenger_dialogsWithFilter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    int8x16_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v10;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to receive dialogs", buf, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (!v7)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    id v12 = objc_msgSend(v8, "OSLogObject", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_opt_class();
      objc_super v14 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v13;
      __int16 v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Received dialogs", buf, 0x16u);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v5;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v22 = [v21 object];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v24 = [v21 object];
            if ([*(id *)(a1 + 48) matchesMessage:v21]) {
              [v15 addObject:v24];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    [*(id *)(a1 + 40) finishWithResult:v15];
    id v6 = v25;
    id v5 = v26;
  }
}

- (id)clearDialog:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 logKey];
  id v6 = AMSSetLogKey(v5);

  uint64_t v7 = [(AMSDeviceMessenger *)self _identifierFromDialogRequest:v4];
  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  int8x16_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v10;
    __int16 v29 = 2114;
    long long v30 = v11;
    __int16 v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing dialog with identifier: %{public}@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = objc_alloc_init(AMSMutableBinaryPromise);
    uint64_t v13 = [(AMSDeviceMessenger *)self _getProxyObject];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __34__AMSDeviceMessenger_clearDialog___block_invoke;
    v22[3] = &unk_1E55A1E18;
    objc_super v14 = v12;
    v23 = v14;
    id v24 = v7;
    id v25 = v4;
    id v26 = self;
    [v13 addFinishBlock:v22];

    id v15 = v14;
    id v16 = v15;
  }
  else
  {
    uint64_t v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      v20 = [v4 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      long long v30 = v20;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid dialog for clear", buf, 0x16u);
    }
    AMSError(2, @"AMSDeviceMessenger Error", @"Invalid bridge dialog for clear", 0);
    id v15 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
    id v16 = +[AMSBinaryPromise promiseWithError:v15];
  }

  return v16;
}

void __34__AMSDeviceMessenger_clearDialog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else
  {
    id v6 = [AMSXDMessage alloc];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = +[AMSXDDevice allPairedDevices];
    int8x16_t v9 = [(AMSXDMessage *)v6 initWithIdentifier:v7 destination:v8 purpose:1 object:*(void *)(a1 + 48)];

    uint64_t v10 = [*(id *)(a1 + 48) logKey];
    [(AMSXDMessage *)v9 setLogKey:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__AMSDeviceMessenger_clearDialog___block_invoke_2;
    v12[3] = &unk_1E559E9E8;
    void v12[4] = *(void *)(a1 + 56);
    uint64_t v13 = v9;
    id v14 = *(id *)(a1 + 32);
    id v11 = v9;
    [v5 sendMessage:v11 completion:v12];
  }
}

void __34__AMSDeviceMessenger_clearDialog___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [*(id *)(a1 + 40) logKey];
      *(_DWORD *)id v16 = 138543618;
      *(void *)&v16[4] = v9;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      id v11 = "%{public}@: [%{public}@] Clear bridge dialog message sent!";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl(&dword_18D554000, v12, v13, v11, v16, v14);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v10 = [*(id *)(a1 + 40) logKey];
      *(_DWORD *)id v16 = 138543874;
      *(void *)&v16[4] = v15;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2114;
      id v17 = v5;
      id v11 = "%{public}@: [%{public}@] Clear bridge dialog message NOT sent! Error: %{public}@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess:error:", v5 == 0, v5, *(_OWORD *)v16, *(void *)&v16[16], v17);
}

- (id)sendDialog:(id)a3 account:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 logKey];
  id v9 = AMSSetLogKey(v8);

  uint64_t v10 = [(AMSDeviceMessenger *)self _identifierFromDialogRequest:v6];
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    uint32_t v14 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v13;
    __int16 v33 = 2114;
    __int16 v34 = v14;
    __int16 v35 = 2114;
    uint64_t v36 = v10;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending dialog with identifier: %{public}@", buf, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = objc_alloc_init(AMSMutableBinaryPromise);
    id v16 = [(AMSDeviceMessenger *)self _getProxyObject];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __41__AMSDeviceMessenger_sendDialog_account___block_invoke;
    v25[3] = &unk_1E55A1E40;
    id v17 = v15;
    id v26 = v17;
    id v27 = v7;
    id v28 = v6;
    id v29 = v10;
    long long v30 = self;
    [v16 addFinishBlock:v25];

    uint64_t v18 = v17;
    uint64_t v19 = v18;
  }
  else
  {
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      v23 = [v6 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v22;
      __int16 v33 = 2114;
      __int16 v34 = v23;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid dialog for send", buf, 0x16u);
    }
    AMSError(2, @"AMSDeviceMessenger Error", @"Invalid bridge dialog for send", 0);
    uint64_t v18 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = +[AMSBinaryPromise promiseWithError:v18];
  }

  return v19;
}

void __41__AMSDeviceMessenger_sendDialog_account___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "ams_DSID");
    if (v6)
    {
      id v7 = [*(id *)(a1 + 48) userInfo];
      v8 = (void *)[v7 mutableCopy];
      id v9 = v8;
      if (v8) {
        id v10 = v8;
      }
      else {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      id v11 = v10;

      [v11 setObject:v6 forKeyedSubscript:@"DSID"];
      [*(id *)(a1 + 48) setUserInfo:v11];
    }
    id v12 = [AMSXDMessage alloc];
    uint64_t v13 = *(void *)(a1 + 56);
    uint32_t v14 = +[AMSXDDevice allPairedDevices];
    uint64_t v15 = [(AMSXDMessage *)v12 initWithIdentifier:v13 destination:v14 purpose:50 object:*(void *)(a1 + 48)];

    id v16 = [*(id *)(a1 + 48) logKey];
    [(AMSXDMessage *)v15 setLogKey:v16];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__AMSDeviceMessenger_sendDialog_account___block_invoke_2;
    v18[3] = &unk_1E559E9E8;
    v18[4] = *(void *)(a1 + 64);
    uint64_t v19 = v15;
    id v20 = *(id *)(a1 + 32);
    id v17 = v15;
    [v5 sendMessage:v17 completion:v18];
  }
}

void __41__AMSDeviceMessenger_sendDialog_account___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [*(id *)(a1 + 40) logKey];
      *(_DWORD *)id v16 = 138543618;
      *(void *)&v16[4] = v9;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      id v11 = "%{public}@: [%{public}@] Bridge dialog message sent!";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
LABEL_10:
      _os_log_impl(&dword_18D554000, v12, v13, v11, v16, v14);
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v10 = [*(id *)(a1 + 40) logKey];
      *(_DWORD *)id v16 = 138543874;
      *(void *)&v16[4] = v15;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2114;
      id v17 = v5;
      id v11 = "%{public}@: [%{public}@] Bridge dialog message NOT sent! Error: %{public}@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithSuccess:error:", v5 == 0, v5, *(_OWORD *)v16, *(void *)&v16[16], v17);
}

- (void)deviceMessengerDidClearMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = [v4 logKey];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received clear for: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(AMSDeviceMessenger *)self _sendDelegateUpdateForMessage:v4];
}

- (void)deviceMessengerDidReceiveMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = [v4 logKey];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received message: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(AMSDeviceMessenger *)self _sendDelegateUpdateForMessage:v4];
}

- (void)deviceMessengerDidReceiveReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = [v4 logKey];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Daemon received reply: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(AMSDeviceMessenger *)self _sendDelegateUpdateForMessage:v4];
}

- (void)deviceMessengerDidUpdateDevices
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Daemon did update devices", (uint8_t *)&v5, 0xCu);
  }

  [(AMSDeviceMessenger *)self _sendDelegateUpdateForMessage:0];
}

- (id)_getProxyObject
{
  if (self->_proxyObject)
  {
    v2 = +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:");
  }
  else
  {
    v2 = [(AMSDaemonConnection *)self->_connection deviceMessengerProxyWithDelegate:self];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__AMSDeviceMessenger__getProxyObject__block_invoke;
    v5[3] = &unk_1E55A02E8;
    objc_copyWeak(&v6, &location);
    [v2 addSuccessBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__AMSDeviceMessenger__getProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void *)WeakRetained[1];
  WeakRetained[1] = v3;
}

- (id)_identifierFromDialogRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 identifier];
  }
  else
  {
    uint64_t v7 = [v3 title];
    v8 = (void *)v7;
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    else {
      int v9 = &stru_1EDCA7308;
    }
    uint64_t v10 = v9;

    uint64_t v11 = [v3 message];
    id v12 = (void *)v11;
    if (v11) {
      __int16 v13 = (__CFString *)v11;
    }
    else {
      __int16 v13 = &stru_1EDCA7308;
    }
    id v14 = v13;

    id v6 = [NSString stringWithFormat:@"%@-%@", v10, v14];
  }
  return v6;
}

- (void)_sendDelegateUpdateForMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Sending update to delegate", buf, 0xCu);
  }

  uint64_t v7 = [(AMSDeviceMessenger *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__AMSDeviceMessenger__sendDelegateUpdateForMessage___block_invoke;
  v9[3] = &unk_1E559F1E0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

void __52__AMSDeviceMessenger__sendDelegateUpdateForMessage___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "updateHandlers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        if (!*(void *)(a1 + 40)
          || ([*(id *)(*((void *)&v11 + 1) + 8 * v6) filter],
              id v8 = objc_claimAutoreleasedReturnValue(),
              int v9 = [v8 matchesMessage:*(void *)(a1 + 40)],
              v8,
              v9))
        {
          id v10 = [v7 block];
          v10[2]();
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (AMSDaemonConnection)connection
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

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_proxyObject, 0);
}

@end