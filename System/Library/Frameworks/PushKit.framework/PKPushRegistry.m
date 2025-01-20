@interface PKPushRegistry
+ (id)_pushTypeToMachServiceName;
+ (void)_assertIfCallKitNotLinked;
- (BOOL)_selfTaskHasEntitlement:(__CFString *)a3;
- (NSData)pushTokenForType:(PKPushType)type;
- (NSMutableDictionary)pushTypeToConnection;
- (NSMutableDictionary)pushTypeToToken;
- (NSSet)desiredPushTypes;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)ivarQueue;
- (PKPushRegistry)initWithQueue:(dispatch_queue_t)queue;
- (double)lastReportedCallTime;
- (id)_createConnectionForPushType:(id)a3;
- (id)delegate;
- (int)complicationToken;
- (int)fileProviderToken;
- (int)outstandingVoIPPushes;
- (int)voipToken;
- (void)_noteIncomingCallReported;
- (void)_registerForPushType:(id)a3;
- (void)_renewConnectionForPushTypeIfRegistered:(id)a3;
- (void)_terminateAppIfThereAreUnhandledVoIPPushes;
- (void)_unregisterForPushType:(id)a3;
- (void)complicationPayloadReceived:(id)a3;
- (void)complicationRegistrationFailed;
- (void)complicationRegistrationSucceededWithDeviceToken:(id)a3;
- (void)dealloc;
- (void)fileProviderPayloadReceived:(id)a3;
- (void)fileProviderRegistrationFailed;
- (void)fileProviderRegistrationSucceededWithDeviceToken:(id)a3;
- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4;
- (void)remoteUserNotificationRegistrationSucceededWithDeviceToken:(id)a3;
- (void)setComplicationToken:(int)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(id)a3;
- (void)setDesiredPushTypes:(NSSet *)desiredPushTypes;
- (void)setFileProviderToken:(int)a3;
- (void)setIvarQueue:(id)a3;
- (void)setLastReportedCallTime:(double)a3;
- (void)setOutstandingVoIPPushes:(int)a3;
- (void)setPushTypeToConnection:(id)a3;
- (void)setPushTypeToToken:(id)a3;
- (void)setVoipToken:(int)a3;
- (void)voipPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)voipRegistrationFailed;
- (void)voipRegistrationSucceededWithDeviceToken:(id)a3;
@end

@implementation PKPushRegistry

- (void)setDelegate:(id)delegate
{
}

void __39__PKPushRegistry__registerForPushType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__PKPushRegistry__registerForPushType___block_invoke_2;
    v9[3] = &unk_26418E808;
    v9[4] = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

- (NSData)pushTokenForType:(PKPushType)type
{
  v4 = type;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    ivarQueue = self->_ivarQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PKPushRegistry_pushTokenForType___block_invoke;
    block[3] = &unk_26418E9E0;
    v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(ivarQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return (NSData *)v7;
}

- (PKPushRegistry)initWithQueue:(dispatch_queue_t)queue
{
  v4 = queue;
  v27.receiver = self;
  v27.super_class = (Class)PKPushRegistry;
  id v5 = [(PKPushRegistry *)&v27 init];
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
      delegateQueue = v5->_delegateQueue;
      v5->_delegateQueue = (OS_dispatch_queue *)v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      delegateQueue = v5->_delegateQueue;
      v5->_delegateQueue = v8;
    }

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.pushkit.ivarqueue", 0);
    ivarQueue = v5->_ivarQueue;
    v5->_ivarQueue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v5);
    uint64_t v12 = v5->_ivarQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __32__PKPushRegistry_initWithQueue___block_invoke;
    handler[3] = &unk_26418E940;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch("com.apple.pushkit.launch.voip", &v5->_voipToken, v12, handler);
    v13 = v5->_ivarQueue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __32__PKPushRegistry_initWithQueue___block_invoke_2;
    v22[3] = &unk_26418E940;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch("com.apple.pushkit.launch.complication", &v5->_complicationToken, v13, v22);
    uint64_t v14 = v5->_ivarQueue;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __32__PKPushRegistry_initWithQueue___block_invoke_3;
    v20 = &unk_26418E940;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch("com.apple.pushkit.launch.fileprovider", &v5->_fileProviderToken, v14, &v17);
    v15 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17, v18, v19, v20);
    [v15 addObserver:v5 selector:sel__noteIncomingCallReported name:@"PKPushIncomingCallReportedNotification" object:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setDesiredPushTypes:(NSSet *)desiredPushTypes
{
  v4 = desiredPushTypes;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__PKPushRegistry_setDesiredPushTypes___block_invoke;
  v7[3] = &unk_26418E808;
  v8 = v4;
  id v9 = self;
  v6 = v4;
  dispatch_sync(ivarQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTypeToConnection, 0);
  objc_storeStrong((id *)&self->_pushTypeToToken, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_desiredPushTypes, 0);
}

void __39__PKPushRegistry__registerForPushType___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    [v2 pushRegistry:*(void *)(a1 + 32) didInvalidatePushTokenForType:@"PKPushTypeUserNotifications" error:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 pushRegistry:*(void *)(a1 + 32) didInvalidatePushTokenForType:@"PKPushTypeUserNotifications"];
  }
}

void __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  v3 = objc_alloc_init(PKPushCredentials);
  [(PKPushCredentials *)v3 setType:@"PKPushTypeUserNotifications"];
  [(PKPushCredentials *)v3 setToken:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 pushRegistry:*(void *)(a1 + 40) didUpdatePushCredentials:v3 forType:@"PKPushTypeUserNotifications"];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)_unregisterForPushType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
    id v5 = [(PKPushRegistry *)self pushTypeToConnection];
    v6 = [v5 objectForKeyedSubscript:v13];

    id v7 = v13;
    if (!v6)
    {
      if ([v13 isEqualToString:@"PKPushTypeUserNotifications"])
      {
        v6 = 0;
      }
      else
      {
        v6 = [(PKPushRegistry *)self _createConnectionForPushType:v13];
        v8 = [(PKPushRegistry *)self pushTypeToConnection];
        [v8 setObject:v6 forKeyedSubscript:v13];
      }
      id v7 = v13;
    }
    if ([v7 isEqualToString:@"PKPushTypeVoIP"])
    {
      id v9 = [v6 remoteObjectProxy];
      [v9 voipUnregister];
    }
    else if ([v13 isEqualToString:@"PKPushTypeComplication"])
    {
      id v9 = [v6 remoteObjectProxy];
      [v9 complicationUnregister];
    }
    else if ([v13 isEqualToString:@"PKPushTypeFileProvider"])
    {
      id v9 = [v6 remoteObjectProxy];
      [v9 fileProviderUnregister];
    }
    else
    {
      if (![v13 isEqualToString:@"PKPushTypeUserNotifications"])
      {
LABEL_16:
        dispatch_queue_t v10 = [(PKPushRegistry *)self pushTypeToConnection];
        v11 = [v10 objectForKeyedSubscript:v13];
        [v11 invalidate];

        uint64_t v12 = [(PKPushRegistry *)self pushTypeToConnection];
        [v12 removeObjectForKey:v13];

        id v4 = v13;
        goto LABEL_17;
      }
      id v9 = +[PKUserNotificationsRemoteNotificationServiceConnection sharedInstance];
      [v9 unregisterPushRegistry:self];
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (NSMutableDictionary)pushTypeToConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  pushTypeToConnection = self->_pushTypeToConnection;
  if (!pushTypeToConnection)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = self->_pushTypeToConnection;
    self->_pushTypeToConnection = v4;

    pushTypeToConnection = self->_pushTypeToConnection;
  }

  return pushTypeToConnection;
}

- (void)_registerForPushType:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  id v5 = [(PKPushRegistry *)self pushTypeToConnection];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    if ([v4 isEqualToString:@"PKPushTypeUserNotifications"])
    {
      v6 = 0;
    }
    else
    {
      v6 = [(PKPushRegistry *)self _createConnectionForPushType:v4];
      id v7 = [(PKPushRegistry *)self pushTypeToConnection];
      [v7 setObject:v6 forKeyedSubscript:v4];
    }
  }
  if ([v4 isEqualToString:@"PKPushTypeVoIP"])
  {
    +[PKPushRegistry _assertIfCallKitNotLinked];
    v8 = [v6 remoteObjectProxy];
    [v8 voipRegister];
LABEL_11:

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"PKPushTypeComplication"])
  {
    v8 = [v6 remoteObjectProxy];
    [v8 complicationRegister];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PKPushTypeFileProvider"])
  {
    v8 = [v6 remoteObjectProxy];
    [v8 fileProviderRegister];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"PKPushTypeUserNotifications"])
  {
    id v9 = +[PKUserNotificationsRemoteNotificationServiceConnection sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__PKPushRegistry__registerForPushType___block_invoke;
    v10[3] = &unk_26418E990;
    v10[4] = self;
    [v9 registerPushRegistry:self completionHandler:v10];
  }
LABEL_12:
}

void __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  v3 = [*(id *)(a1 + 32) pushTypeToToken];
  [v3 setObject:v2 forKeyedSubscript:@"PKPushTypeUserNotifications"];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke_2;
  v7[3] = &unk_26418E808;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

void __35__PKPushRegistry_pushTokenForType___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) pushTypeToToken];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSMutableDictionary)pushTypeToToken
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  pushTypeToToken = self->_pushTypeToToken;
  if (!pushTypeToToken)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = self->_pushTypeToToken;
    self->_pushTypeToToken = v4;

    pushTypeToToken = self->_pushTypeToToken;
  }

  return pushTypeToToken;
}

void __38__PKPushRegistry_setDesiredPushTypes___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v2 minusSet:*(void *)(*(void *)(a1 + 40) + 24)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 40) _registerForPushType:*(void *)(*((void *)&v21 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  id v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 24) mutableCopy];
  [v8 minusSet:*(void *)(a1 + 32)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(a1 + 40), "_unregisterForPushType:", *(void *)(*((void *)&v17 + 1) + 8 * v13++), (void)v17);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [*(id *)(a1 + 32) copy];
  uint64_t v15 = *(void *)(a1 + 40);
  v16 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;
}

- (void)remoteUserNotificationRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_26418E808;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

- (void)dealloc
{
  notify_cancel(self->_voipToken);
  notify_cancel(self->_complicationToken);
  notify_cancel(self->_fileProviderToken);
  v3.receiver = self;
  v3.super_class = (Class)PKPushRegistry;
  [(PKPushRegistry *)&v3 dealloc];
}

+ (id)_pushTypeToMachServiceName
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"PKPushTypeVoIP";
  v4[1] = @"PKPushTypeComplication";
  v5[0] = @"com.apple.telephonyutilities.callservicesdaemon.voip";
  v5[1] = @"com.apple.watchconnectivity.complication";
  v4[2] = @"PKPushTypeFileProvider";
  v5[2] = @"com.apple.fileprovider.pushkit";
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

void __32__PKPushRegistry_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renewConnectionForPushTypeIfRegistered:@"PKPushTypeVoIP"];
}

void __32__PKPushRegistry_initWithQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renewConnectionForPushTypeIfRegistered:@"PKPushTypeComplication"];
}

void __32__PKPushRegistry_initWithQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renewConnectionForPushTypeIfRegistered:@"PKPushTypeFileProvider"];
}

- (void)voipRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_26418E808;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  objc_super v3 = [*(id *)(a1 + 32) pushTypeToToken];
  [v3 setObject:v2 forKeyedSubscript:@"PKPushTypeVoIP"];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke_2;
  v7[3] = &unk_26418E808;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

void __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  objc_super v3 = objc_alloc_init(PKPushCredentials);
  [(PKPushCredentials *)v3 setType:@"PKPushTypeVoIP"];
  [(PKPushCredentials *)v3 setToken:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 pushRegistry:*(void *)(a1 + 40) didUpdatePushCredentials:v3 forType:@"PKPushTypeVoIP"];
}

- (void)voipPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke;
  v13[3] = &unk_26418E968;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(delegateQueue, v13);
}

void __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [*(id *)(a1 + 32) lastReportedCallTime];
  double v6 = v4 - v5;
  if (v2) {
    BOOL v7 = v6 < 7.0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_2;
    block[3] = &unk_26418E718;
    block[4] = v8;
    dispatch_sync(v9, block);
  }
  uint64_t v10 = objc_alloc_init(PKPushPayload);
  [(PKPushPayload *)v10 setType:@"PKPushTypeVoIP"];
  [(PKPushPayload *)v10 setDictionaryPayload:*(void *)(a1 + 40)];
  id v11 = [*(id *)(a1 + 32) delegate];
  char v12 = objc_opt_respondsToSelector();

  uint64_t v13 = [*(id *)(a1 + 32) delegate];
  id v14 = v13;
  if (v12)
  {
    [v13 pushRegistry:*(void *)(a1 + 32) didReceiveIncomingPushWithPayload:v10 forType:@"PKPushTypeVoIP" withCompletionHandler:*(void *)(a1 + 48)];
LABEL_10:

    goto LABEL_11;
  }
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v14 = [*(id *)(a1 + 32) delegate];
    [v14 pushRegistry:*(void *)(a1 + 32) didReceiveIncomingPushWithPayload:v10 forType:@"PKPushTypeVoIP"];
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v16 = *(void *)(a1 + 32);
  long long v17 = *(NSObject **)(v16 + 48);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_3;
  v18[3] = &unk_26418E718;
  v18[4] = v16;
  dispatch_sync(v17, v18);
}

uint64_t __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateAppIfThereAreUnhandledVoIPPushes];
}

- (void)voipRegistrationFailed
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PKPushRegistry_voipRegistrationFailed__block_invoke;
  block[3] = &unk_26418E718;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __40__PKPushRegistry_voipRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 pushRegistry:*(void *)(a1 + 32) didInvalidatePushTokenForType:@"PKPushTypeVoIP"];
  }
}

- (void)complicationRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_26418E808;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  double v3 = [*(id *)(a1 + 32) pushTypeToToken];
  [v3 setObject:v2 forKeyedSubscript:@"PKPushTypeComplication"];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke_2;
  v7[3] = &unk_26418E808;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

void __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  double v3 = objc_alloc_init(PKPushCredentials);
  [(PKPushCredentials *)v3 setType:@"PKPushTypeComplication"];
  [(PKPushCredentials *)v3 setToken:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 pushRegistry:*(void *)(a1 + 40) didUpdatePushCredentials:v3 forType:@"PKPushTypeComplication"];
}

- (void)complicationPayloadReceived:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PKPushRegistry_complicationPayloadReceived___block_invoke;
  v7[3] = &unk_26418E808;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

void __46__PKPushRegistry_complicationPayloadReceived___block_invoke(uint64_t a1)
{
  BOOL v7 = objc_alloc_init(PKPushPayload);
  [(PKPushPayload *)v7 setType:@"PKPushTypeComplication"];
  [(PKPushPayload *)v7 setDictionaryPayload:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 40) delegate];
  id v5 = v4;
  if (v3)
  {
    [v4 pushRegistry:*(void *)(a1 + 40) didReceiveIncomingPushWithPayload:v7 forType:@"PKPushTypeComplication" withCompletionHandler:&__block_literal_global_0];
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 pushRegistry:*(void *)(a1 + 40) didReceiveIncomingPushWithPayload:v7 forType:@"PKPushTypeComplication"];
  }

LABEL_6:
}

- (void)complicationRegistrationFailed
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PKPushRegistry_complicationRegistrationFailed__block_invoke;
  block[3] = &unk_26418E718;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __48__PKPushRegistry_complicationRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 pushRegistry:*(void *)(a1 + 32) didInvalidatePushTokenForType:@"PKPushTypeComplication"];
  }
}

- (void)fileProviderRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_26418E808;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  char v3 = [*(id *)(a1 + 32) pushTypeToToken];
  [v3 setObject:v2 forKeyedSubscript:@"PKPushTypeFileProvider"];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke_2;
  v7[3] = &unk_26418E808;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

void __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  char v3 = objc_alloc_init(PKPushCredentials);
  [(PKPushCredentials *)v3 setType:@"PKPushTypeFileProvider"];
  [(PKPushCredentials *)v3 setToken:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 pushRegistry:*(void *)(a1 + 40) didUpdatePushCredentials:v3 forType:@"PKPushTypeFileProvider"];
}

- (void)fileProviderPayloadReceived:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PKPushRegistry_fileProviderPayloadReceived___block_invoke;
  v7[3] = &unk_26418E808;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

void __46__PKPushRegistry_fileProviderPayloadReceived___block_invoke(uint64_t a1)
{
  BOOL v7 = objc_alloc_init(PKPushPayload);
  [(PKPushPayload *)v7 setType:@"PKPushTypeFileProvider"];
  [(PKPushPayload *)v7 setDictionaryPayload:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 40) delegate];
  id v5 = v4;
  if (v3)
  {
    [v4 pushRegistry:*(void *)(a1 + 40) didReceiveIncomingPushWithPayload:v7 forType:@"PKPushTypeFileProvider" withCompletionHandler:&__block_literal_global_44];
  }
  else
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    id v5 = [*(id *)(a1 + 40) delegate];
    [v5 pushRegistry:*(void *)(a1 + 40) didReceiveIncomingPushWithPayload:v7 forType:@"PKPushTypeFileProvider"];
  }

LABEL_6:
}

- (void)fileProviderRegistrationFailed
{
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PKPushRegistry_fileProviderRegistrationFailed__block_invoke;
  block[3] = &unk_26418E718;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __48__PKPushRegistry_fileProviderRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 pushRegistry:*(void *)(a1 + 32) didInvalidatePushTokenForType:@"PKPushTypeFileProvider"];
  }
}

- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__PKPushRegistry_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
  block[3] = &unk_26418E7E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(delegateQueue, block);
}

void __74__PKPushRegistry_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = objc_alloc_init(PKPushPayload);
  [(PKPushPayload *)v2 setType:@"PKPushTypeUserNotifications"];
  [(PKPushPayload *)v2 setDictionaryPayload:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector()) {
    [v3 pushRegistry:*(void *)(a1 + 32) didReceiveIncomingPushWithPayload:v2 forType:@"PKPushTypeUserNotifications" withCompletionHandler:*(void *)(a1 + 48)];
  }
}

+ (void)_assertIfCallKitNotLinked
{
  id v4 = dlopen("/System/Library/Frameworks/CallKit.framework/CallKit", 16);
  if (dyld_program_sdk_at_least() && !v4)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"PKPushRegistry.m" lineNumber:304 description:@"PushKit apps that use VoIP push must link the CallKit framework."];
  }
}

- (BOOL)_selfTaskHasEntitlement:(__CFString *)a3
{
  id v4 = SecTaskCreateFromSelf(0);
  id v5 = v4;
  if (v4)
  {
    CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a3, 0);
    CFRelease(v5);
    if (v6)
    {
      CFTypeID v7 = CFGetTypeID(v6);
      LOBYTE(v5) = v7 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
      CFRelease(v6);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)_terminateAppIfThereAreUnhandledVoIPPushes
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  if (self->_outstandingVoIPPushes >= 1)
  {
    int v4 = dyld_program_sdk_at_least();
    BOOL v5 = [(PKPushRegistry *)self _selfTaskHasEntitlement:@"com.apple.developer.pushkit.unrestricted-voip"];
    if (v4 && v5) {
      NSLog(&cfstr_TheComAppleDev.isa);
    }
    NSLog(&cfstr_AppsRecevingVo.isa);
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PKPushRegistry.m" lineNumber:349 description:@"Killing app because it never posted an incoming call to the system after receiving a PushKit VoIP push."];
  }
}

- (void)_noteIncomingCallReported
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PKPushRegistry__noteIncomingCallReported__block_invoke;
  block[3] = &unk_26418E718;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __43__PKPushRegistry__noteIncomingCallReported__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + ++*(_DWORD *)(*(void *)(result + 32) + 20) = 0;
  uint64_t result = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 72) = v3;
  return result;
}

- (id)_createConnectionForPushType:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() _pushTypeToMachServiceName];
  id v6 = v5;
  if (!v5)
  {
    id v8 = 0;
    goto LABEL_14;
  }
  CFTypeID v7 = [v5 objectForKeyedSubscript:v4];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v7 options:4096];
    if ([v4 isEqualToString:@"PKPushTypeVoIP"])
    {
      id v9 = &protocolRef_PKVoIPXPCClient;
      id v10 = &protocolRef_PKVoIPXPCServer;
    }
    else if ([v4 isEqualToString:@"PKPushTypeComplication"])
    {
      id v9 = &protocolRef_PKComplicationXPCClient;
      id v10 = &protocolRef_PKComplicationXPCServer;
    }
    else
    {
      if (![v4 isEqualToString:@"PKPushTypeFileProvider"])
      {
LABEL_12:
        [v8 setExportedObject:self];
        [v8 resume];
        goto LABEL_13;
      }
      id v9 = &protocolRef_PKFileProviderXPCClient;
      id v10 = &protocolRef_PKFileProviderXPCServer;
    }
    id v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:*v10];
    [v8 setRemoteObjectInterface:v11];

    id v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:*v9];
    [v8 setExportedInterface:v12];

    goto LABEL_12;
  }
  id v8 = 0;
LABEL_13:

LABEL_14:

  return v8;
}

- (void)_renewConnectionForPushTypeIfRegistered:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  id v4 = [(PKPushRegistry *)self pushTypeToConnection];
  BOOL v5 = [v4 objectForKeyedSubscript:v9];

  if (v5)
  {
    id v6 = [(PKPushRegistry *)self pushTypeToConnection];
    CFTypeID v7 = [v6 objectForKeyedSubscript:v9];
    [v7 invalidate];

    id v8 = [(PKPushRegistry *)self pushTypeToConnection];
    [v8 removeObjectForKey:v9];

    [(PKPushRegistry *)self _registerForPushType:v9];
  }
}

- (NSSet)desiredPushTypes
{
  uint64_t v6 = 0;
  CFTypeID v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__PKPushRegistry_desiredPushTypes__block_invoke;
  v5[3] = &unk_26418E9B8;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __34__PKPushRegistry_desiredPushTypes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (void)setPushTypeToToken:(id)a3
{
}

- (void)setPushTypeToConnection:(id)a3
{
}

- (int)voipToken
{
  return self->_voipToken;
}

- (void)setVoipToken:(int)a3
{
  self->_voipToken = a3;
}

- (int)complicationToken
{
  return self->_complicationToken;
}

- (void)setComplicationToken:(int)a3
{
  self->_complicationToken = a3;
}

- (int)fileProviderToken
{
  return self->_fileProviderToken;
}

- (void)setFileProviderToken:(int)a3
{
  self->_fileProviderToken = a3;
}

- (int)outstandingVoIPPushes
{
  return self->_outstandingVoIPPushes;
}

- (void)setOutstandingVoIPPushes:(int)a3
{
  self->_outstandingVoIPPushes = a3;
}

- (double)lastReportedCallTime
{
  return self->_lastReportedCallTime;
}

- (void)setLastReportedCallTime:(double)a3
{
  self->_lastReportedCallTime = a3;
}

@end