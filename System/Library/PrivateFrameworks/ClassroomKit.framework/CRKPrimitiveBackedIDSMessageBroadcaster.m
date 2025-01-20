@interface CRKPrimitiveBackedIDSMessageBroadcaster
+ (id)broadcasterWithIDSPrimitives:(id)a3;
- (CRKCancelable)messageSubscription;
- (CRKIDSPrimitives)IDSPrimitives;
- (CRKPrimitiveBackedIDSMessageBroadcaster)initWithIDSPrimitives:(id)a3;
- (NSHashTable)broadcastHandlers;
- (void)addBroadcastHandler:(id)a3;
- (void)beginListeningForMessagesWithCompletion:(id)a3;
- (void)broadcastMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5;
- (void)setMessageSubscription:(id)a3;
@end

@implementation CRKPrimitiveBackedIDSMessageBroadcaster

- (CRKPrimitiveBackedIDSMessageBroadcaster)initWithIDSPrimitives:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKPrimitiveBackedIDSMessageBroadcaster;
  v6 = [(CRKPrimitiveBackedIDSMessageBroadcaster *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSPrimitives, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    broadcastHandlers = v7->_broadcastHandlers;
    v7->_broadcastHandlers = (NSHashTable *)v8;
  }
  return v7;
}

+ (id)broadcasterWithIDSPrimitives:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIDSPrimitives:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  [v5 beginListeningForMessagesWithCompletion:v7];

  return v5;
}

void __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _CRKLogASM_15();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke_cold_1(a1, v3);
    }
  }
}

- (void)addBroadcastHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CRKLogASM_15();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138543874;
    v10 = v7;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Adding broadcast handler (%{public}@)", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v8 = [(CRKPrimitiveBackedIDSMessageBroadcaster *)self broadcastHandlers];
  [v8 addObject:v4];
}

- (void)beginListeningForMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CRKPrimitiveBackedIDSMessageBroadcaster *)self IDSPrimitives];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke;
  v10[3] = &unk_2646F5010;
  objc_copyWeak(&v11, &location);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2;
  v7[3] = &unk_2646F5038;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 subscribeToMessagesWithHandler:v10 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained broadcastMessage:v9 senderAppleID:v8 senderAddress:v7];
}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = _CRKLogASM_15();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, v6);
      }

      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        int v15 = 138543618;
        v16 = v14;
        __int16 v17 = 2048;
        id v18 = WeakRetained;
        _os_log_impl(&dword_224C00000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Established IDS message listener", (uint8_t *)&v15, 0x16u);
      }
      [WeakRetained setMessageSubscription:v5];
      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = CRKErrorWithCodeAndUserInfo(2, &unk_26D819F60);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

- (void)broadcastMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CRKLogASM_15();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_224C00000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - %p: Broadcasting IDS message. message=%{public}@, sender=%{public}@", buf, 0x2Au);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = [(CRKPrimitiveBackedIDSMessageBroadcaster *)self broadcastHandlers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) processMessage:v8 senderAppleID:v9 senderAddress:v10];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (NSHashTable)broadcastHandlers
{
  return self->_broadcastHandlers;
}

- (CRKCancelable)messageSubscription
{
  return self->_messageSubscription;
}

- (void)setMessageSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSubscription, 0);
  objc_storeStrong((id *)&self->_broadcastHandlers, 0);

  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_224C00000, v6, v7, "%{public}@ - %p: Failed to create message broadcaster. Error: %{public}@", v8, v9, v10, v11, v12);
}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_224C00000, v6, v7, "%{public}@ - %p: Failed to begin listening for IDS messages. Error = %{public}@", v8, v9, v10, v11, v12);
}

@end