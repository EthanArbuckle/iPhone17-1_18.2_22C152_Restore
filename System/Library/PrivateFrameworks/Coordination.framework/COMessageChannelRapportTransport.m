@interface COMessageChannelRapportTransport
- (BOOL)_onqueue_devicePresentInGroup:(id)a3;
- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 companionLink:(id)a5 dispatchQueue:(id)a6;
- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (COMessageChannelRapportTransportDelegate)delegate;
- (Class)_payloadClassFromType:(id)a3;
- (NSArray)activeMembers;
- (NSMutableDictionary)activeMemberDevices;
- (NSSet)groupHKIdentifiers;
- (NSString)identifier;
- (NSString)requestIdentifier;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)companionLinkClient;
- (id)_onqueue_activeMemberWithIDSIdentifier:(id)a3;
- (id)_onqueue_memberFromRPCompanionLinkDevice:(id)a3;
- (id)_payloadTypeFromClass:(Class)a3;
- (id)_serializeDataForResponse:(id)a3;
- (id)_serializedDataForRequest:(id)a3;
- (void)_onqueue_handleDeviceFound:(id)a3;
- (void)_onqueue_handleDeviceLost:(id)a3;
- (void)_onqueue_handleDeviceUpdated:(id)a3;
- (void)_onqueue_handleIncomingRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_withLock:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addHomeKitGroupIdentifiers:(id)a3;
- (void)dealloc;
- (void)removeHomeKitGroupIdentifiers:(id)a3;
- (void)sendRequest:(id)a3 to:(id)a4 withCompletionHandler:(id)a5;
- (void)setActiveMemberDevices:(id)a3;
- (void)setCompanionLinkClient:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation COMessageChannelRapportTransport

- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  v8 = (objc_class *)MEMORY[0x263F62B70];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  [v12 setControlFlags:2052];
  [v12 setDispatchQueue:v9];
  v13 = [(COMessageChannelRapportTransport *)self initWithIdentifier:v11 delegate:v10 companionLink:v12 dispatchQueue:v9];

  return v13;
}

- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 companionLink:(id)a5 dispatchQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)COMessageChannelRapportTransport;
  v15 = [(COMessageChannelRapportTransport *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    uint64_t v17 = [NSString stringWithFormat:@"%@-messageChannel-request", v11];
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_queue, a6);
    objc_storeStrong((id *)&v16->_companionLinkClient, a5);
    objc_storeWeak((id *)&v16->_delegate, v12);
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    activeMemberDevices = v16->_activeMemberDevices;
    v16->_activeMemberDevices = (NSMutableDictionary *)v19;
  }
  return v16;
}

- (void)dealloc
{
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)COMessageChannelRapportTransport;
  [(COMessageChannelRapportTransport *)&v3 dealloc];
}

- (NSArray)activeMembers
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__COMessageChannelRapportTransport_activeMembers__block_invoke;
  v4[3] = &unk_264444468;
  v4[4] = self;
  v4[5] = &v5;
  [(COMessageChannelRapportTransport *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __49__COMessageChannelRapportTransport_activeMembers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) activeMemberDevices];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addHomeKitGroupIdentifiers:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__0;
  v18[4] = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke;
  v10[3] = &unk_264444490;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v12 = &v14;
  id v13 = v18;
  [(COMessageChannelRapportTransport *)self _withLock:v10];
  if (*((unsigned char *)v15 + 24))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_22;
    block[3] = &unk_2644444B8;
    block[4] = self;
    id v9 = v18;
    id v8 = v5;
    dispatch_async(queue, block);
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) groupHKIdentifiers];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) groupHKIdentifiers];
    uint64_t v4 = [v3 setByAddingObjectsFromSet:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;
  }

  if (*(unsigned char *)(*(void *)(a1 + 32) + 12))
  {
    id v9 = COLogForCategory(9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v19 = 134218242;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p Adding HomeKit identifiers %@ after activation", (uint8_t *)&v19, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v12 = [*(id *)(a1 + 32) companionLinkClient];
    id v13 = [v12 activeDevices];
    uint64_t v14 = [v13 mutableCopy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    char v17 = [*(id *)(a1 + 32) companionLinkClient];
    v18 = [v17 localDevice];

    if (v18) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v18];
    }
  }
}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_22(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = COLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_22_cold_1(a1, v2);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = objc_msgSend(v8, "homeKitIdentifier", (void)v11);
        LODWORD(v9) = [v9 containsObject:v10];

        if (v9) {
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)removeHomeKitGroupIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = COLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p Removing HomeKit identifiers %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke;
  v8[3] = &unk_2644444E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) activeMemberDevices];
  uint64_t v22 = (void *)[v2 copy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        id v4 = *(void **)(*((void *)&v31 + 1) + 8 * v3);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v5 = v22;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v28 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              long long v11 = [v10 homeKitIdentifier];
              __int16 v12 = [v4 UUIDString];
              int v13 = [v11 isEqualToString:v12];

              if (v13)
              {
                uint64_t v14 = COLogForCategory(9);
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v15 = *(void *)(a1 + 32);
                  *(_DWORD *)buf = 134218242;
                  uint64_t v36 = v15;
                  __int16 v37 = 2112;
                  v38 = v10;
                  _os_log_impl(&dword_21D3E0000, v14, OS_LOG_TYPE_DEFAULT, "%p Removing member %@ from active member list", buf, 0x16u);
                }

                uint64_t v16 = *(void **)(a1 + 32);
                char v17 = [v16 activeMemberDevices];
                v18 = [v17 objectForKey:v10];
                objc_msgSend(v16, "_onqueue_handleDeviceLost:", v18);
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v23);
  }

  int v19 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke_23;
  v25[3] = &unk_2644444E0;
  v25[4] = v19;
  id v26 = *(id *)(a1 + 40);
  [v19 _withLock:v25];
}

void __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke_23(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) groupHKIdentifiers];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) groupHKIdentifiers];
    id v4 = (void *)[v3 mutableCopy];

    [v4 minusSet:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = COLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(COMessageChannelRapportTransport *)self requestIdentifier];
    *(_DWORD *)buf = 134218242;
    long long v30 = self;
    __int16 v31 = 2112;
    long long v32 = v6;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p Going to register handler for %@", buf, 0x16u);
  }
  companionLinkClient = self->_companionLinkClient;
  uint64_t v8 = [(COMessageChannelRapportTransport *)self requestIdentifier];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke;
  v26[3] = &unk_264444530;
  objc_copyWeak(&v27, &location);
  [(RPCompanionLinkClient *)companionLinkClient registerRequestID:v8 options:0 handler:v26];

  id v9 = self->_companionLinkClient;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3;
  v24[3] = &unk_264444558;
  objc_copyWeak(&v25, &location);
  [(RPCompanionLinkClient *)v9 setDeviceChangedHandler:v24];
  uint64_t v10 = self->_companionLinkClient;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_27;
  v22[3] = &unk_264444580;
  objc_copyWeak(&v23, &location);
  [(RPCompanionLinkClient *)v10 setLocalDeviceUpdatedHandler:v22];
  long long v11 = self->_companionLinkClient;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_30;
  v20[3] = &unk_264444580;
  objc_copyWeak(&v21, &location);
  [(RPCompanionLinkClient *)v11 setDeviceFoundHandler:v20];
  __int16 v12 = self->_companionLinkClient;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_32;
  v18[3] = &unk_264444580;
  objc_copyWeak(&v19, &location);
  [(RPCompanionLinkClient *)v12 setDeviceLostHandler:v18];
  int v13 = self->_companionLinkClient;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_34;
  v15[3] = &unk_2644445D0;
  objc_copyWeak(&v17, &location);
  id v14 = v4;
  id v16 = v14;
  [(RPCompanionLinkClient *)v13 activateWithCompletion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  long long v11 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v12 = WeakRetained[7];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2;
    v13[3] = &unk_264444508;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleIncomingRequest:options:responseHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = COLogForCategory(9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p device changed %@", buf, 0x16u);
    }

    uint64_t v6 = WeakRetained[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_25;
    v7[3] = &unk_2644444E0;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(void *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_27(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = COLogForCategory(9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p local device updated %@", buf, 0x16u);
    }

    uint64_t v6 = WeakRetained[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_28;
    v7[3] = &unk_2644444E0;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(void *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_30(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = COLogForCategory(9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p device found %@", buf, 0x16u);
    }

    uint64_t v6 = WeakRetained[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_31;
    v7[3] = &unk_2644444E0;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(void *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_32(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = COLogForCategory(9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p device lost %@", buf, 0x16u);
    }

    uint64_t v6 = WeakRetained[7];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_33;
    v7[3] = &unk_2644444E0;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceLost:", *(void *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *((unsigned char *)WeakRetained + 12) = 1;
    uint64_t v5 = *((void *)WeakRetained + 7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3_35;
    block[3] = &unk_2644445A8;
    block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3_35(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 companionLinkClient];
  uint64_t v2 = [v3 localDevice];
  objc_msgSend(v1, "_onqueue_handleDeviceFound:", v2);
}

- (void)sendRequest:(id)a3 to:(id)a4 withCompletionHandler:(id)a5
{
  v32[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
  id v12 = [v11 objectForKey:v9];

  if (v12)
  {
    v31[0] = @"data";
    uint64_t v13 = [(COMessageChannelRapportTransport *)self _serializedDataForRequest:v8];
    v32[0] = v13;
    v31[1] = @"className";
    id v14 = [(COMessageChannelRapportTransport *)self _payloadTypeFromClass:objc_opt_class()];
    v32[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

    id v16 = [(COMessageChannelRapportTransport *)self requestIdentifier];
    id v17 = COLogForCategory(9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v26 = self;
      __int16 v27 = 2112;
      long long v28 = v16;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_21D3E0000, v17, OS_LOG_TYPE_DEFAULT, "%p sending message %@ to member %@", buf, 0x20u);
    }

    v18 = [(COMessageChannelRapportTransport *)self companionLinkClient];
    id v19 = [v12 effectiveIdentifier];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __73__COMessageChannelRapportTransport_sendRequest_to_withCompletionHandler___block_invoke;
    v22[3] = &unk_2644445F8;
    void v22[4] = self;
    id v23 = v16;
    id v24 = v10;
    id v20 = v16;
    [v18 sendRequestID:v20 request:v15 destinationID:v19 options:0 responseHandler:v22];
  }
  else
  {
    id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1111 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v21);
  }
}

void __73__COMessageChannelRapportTransport_sendRequest_to_withCompletionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 objectForKey:*MEMORY[0x263F62CA8]];
  uint64_t v10 = [v9 unsignedIntegerValue];

  __int16 v11 = COLogForCategory(9);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = a1[5];
    *(_DWORD *)buf = 134218754;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v10;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_21D3E0000, v11, OS_LOG_TYPE_DEFAULT, "%p received callback for request %@. XID = 0x%llX. Error = %{public}@", buf, 0x2Au);
  }

  if (v8)
  {
    uint64_t v19 = *MEMORY[0x263F08608];
    id v20 = v8;
    id v14 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1204 userInfo:v14];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else if (v7)
  {
    id v16 = [v7 objectForKey:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v7 objectForKey:@"className"];
      v18 = [MEMORY[0x263F08928] unarchivedObjectOfClass:NSClassFromString(v17) fromData:v16 error:0];
    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)_onqueue_handleIncomingRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [v9 objectForKey:*MEMORY[0x263F62C88]];
  if (!v11)
  {
    __int16 v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F62C80]];
    uint64_t v12 = [(COMessageChannelRapportTransport *)self companionLinkClient];
    uint64_t v13 = [v12 localDevice];
    id v14 = [v13 identifier];

    if (![v14 isEqual:v11])
    {
      uint64_t v33 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1117 userInfo:0];
      long long v34 = COLogForCategory(9);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannelRapportTransport _onqueue_handleIncomingRequest:options:responseHandler:]((uint64_t)self, (uint64_t)v8, v34);
      }

      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v33);
      goto LABEL_47;
    }
    id v15 = [(COMessageChannelRapportTransport *)self companionLinkClient];
    id v16 = [v15 localDevice];
    [v16 idsDeviceIdentifier];
    v18 = id v17 = v10;

    __int16 v11 = (void *)v18;
    id v10 = v17;
  }
  uint64_t v19 = [v9 objectForKey:*MEMORY[0x263F62CA8]];
  uint64_t v20 = [v19 unsignedIntegerValue];

  id v21 = COLogForCategory(9);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v66 = self;
    __int16 v67 = 2114;
    uint64_t v68 = (uint64_t)v11;
    __int16 v69 = 2048;
    uint64_t v70 = v20;
    _os_log_impl(&dword_21D3E0000, v21, OS_LOG_TYPE_DEFAULT, "%p incoming request from IDS=%{public}@. XID = 0x%llX", buf, 0x20u);
  }

  id v14 = [(COMessageChannelRapportTransport *)self _onqueue_activeMemberWithIDSIdentifier:v11];
  if (v14) {
    goto LABEL_7;
  }
  __int16 v31 = [(COMessageChannelRapportTransport *)self groupHKIdentifiers];
  uint64_t v32 = [v31 count];

  if (!v32)
  {
    v35 = [(COMessageChannelRapportTransport *)self companionLinkClient];
    uint64_t v36 = [v35 activeDevices];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      id v55 = v8;
      uint64_t v57 = v20;
      id v40 = v10;
      uint64_t v41 = *(void *)v62;
      while (2)
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v62 != v41) {
            objc_enumerationMutation(v37);
          }
          v43 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          v44 = [v43 idsDeviceIdentifier];
          if ([v44 isEqualToString:v11])
          {
            id v14 = [(COMessageChannelRapportTransport *)self _onqueue_memberFromRPCompanionLinkDevice:v43];
            if (v14)
            {
              v45 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
              [v45 setObject:v43 forKey:v14];

              v46 = COLogForCategory(9);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v66 = self;
                __int16 v67 = 2114;
                uint64_t v68 = (uint64_t)v11;
                _os_log_impl(&dword_21D3E0000, v46, OS_LOG_TYPE_DEFAULT, "%p did not find an active member for IDS=%{public}@ so creating one on demand", buf, 0x16u);
              }

              v47 = [(COMessageChannelRapportTransport *)self delegate];
              id v10 = v40;
              if (objc_opt_respondsToSelector()) {
                [v47 didFindMember:v14];
              }
            }
            else
            {
              v47 = COLogForCategory(9);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                -[COMessageChannelRapportTransport _onqueue_handleIncomingRequest:options:responseHandler:]();
              }
              id v10 = v40;
            }
            uint64_t v20 = v57;

            id v8 = v55;
            goto LABEL_52;
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v61 objects:v77 count:16];
        if (v39) {
          continue;
        }
        break;
      }
      id v14 = 0;
      id v10 = v40;
      id v8 = v55;
      uint64_t v20 = v57;
    }
    else
    {
      id v14 = 0;
    }
LABEL_52:

LABEL_7:
    uint64_t v22 = [(COMessageChannelRapportTransport *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_46:

      goto LABEL_47;
    }
    uint64_t v56 = v20;
    __int16 v23 = [v8 objectForKey:@"data"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    v53 = (void (**)(void, void, void, void))v10;
    id v54 = v8;
    uint64_t v24 = [v8 objectForKey:@"className"];
    Class v25 = NSClassFromString(v24);
    if (v25)
    {
      id v60 = 0;
      uint64_t v26 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v25 fromData:v23 error:&v60];
      id v27 = v60;
      if (!v27)
      {

LABEL_40:
        id v10 = v53;
        if (v26)
        {
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __91__COMessageChannelRapportTransport__onqueue_handleIncomingRequest_options_responseHandler___block_invoke;
          v58[3] = &unk_264444620;
          v58[4] = self;
          v59 = v53;
          [v22 didReceiveRequest:v26 from:v14 withCompletionHandler:v58];

LABEL_45:
          goto LABEL_46;
        }
LABEL_42:
        uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:@"COMessageChannelErrorDomain" code:-1104 userInfo:0];
        v50 = COLogForCategory(9);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          v66 = self;
          __int16 v67 = 2114;
          uint64_t v68 = 0;
          __int16 v69 = 2048;
          uint64_t v70 = v56;
          __int16 v71 = 2114;
          v72 = v26;
          _os_log_error_impl(&dword_21D3E0000, v50, OS_LOG_TYPE_ERROR, "%p failed to encode incoming request %{public}@ XID=0x%llX. error = %{public}@", buf, 0x2Au);
        }

        (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v26);
        goto LABEL_45;
      }
      id v28 = v27;
      v51 = (void *)MEMORY[0x263F087E8];
      v52 = v23;
      uint64_t v75 = *MEMORY[0x263F08608];
      id v76 = v27;
      uint64_t v29 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      id v30 = [v51 errorWithDomain:@"COMessageChannelErrorDomain" code:-1104 userInfo:v29];
    }
    else
    {
      v52 = v23;
      v48 = (void *)MEMORY[0x263F087E8];
      v73 = @"COMessageChannelUnknownClassErrorKey";
      v74 = v24;
      uint64_t v29 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v30 = [v48 errorWithDomain:@"COMessageChannelErrorDomain" code:-1104 userInfo:v29];
      uint64_t v26 = 0;
      id v28 = 0;
    }

    if (v30)
    {
      v49 = COLogForCategory(9);
      id v8 = v54;
      __int16 v23 = v52;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v66 = self;
        __int16 v67 = 2114;
        uint64_t v68 = (uint64_t)v26;
        __int16 v69 = 2048;
        uint64_t v70 = v56;
        __int16 v71 = 2114;
        v72 = v30;
        _os_log_error_impl(&dword_21D3E0000, v49, OS_LOG_TYPE_ERROR, "%p failed to encode incoming request %{public}@ XID=0x%llX. error = %{public}@", buf, 0x2Au);
      }

      id v10 = v53;
      ((void (**)(void, void, void, void *))v53)[2](v53, 0, 0, v30);

      goto LABEL_45;
    }
    id v8 = v54;
    __int16 v23 = v52;
    goto LABEL_40;
  }
  id v14 = COLogForCategory(9);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v66 = self;
    __int16 v67 = 2048;
    uint64_t v68 = v20;
    _os_log_impl(&dword_21D3E0000, v14, OS_LOG_TYPE_DEFAULT, "%p incoming request (XID = 0x%llX) from device not in our group, not creating one on demand", buf, 0x16u);
  }
LABEL_47:
}

void __91__COMessageChannelRapportTransport__onqueue_handleIncomingRequest_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      id v8 = [*(id *)(a1 + 32) _serializeDataForResponse:v5];
      v11[0] = @"data";
      v11[1] = @"className";
      v12[0] = v8;
      id v9 = [*(id *)(a1 + 32) _payloadTypeFromClass:objc_opt_class()];
      v12[1] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
LABEL_6:
}

- (void)_onqueue_handleDeviceFound:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p handling device found %@", (uint8_t *)&v11, 0x16u);
  }

  if ([(COMessageChannelRapportTransport *)self _onqueue_devicePresentInGroup:v4])
  {
    id v6 = COLogForCategory(9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_21D3E0000, v6, OS_LOG_TYPE_DEFAULT, "%p found device is in our group %@", (uint8_t *)&v11, 0x16u);
    }

    id v7 = [(COMessageChannelRapportTransport *)self delegate];
    id v8 = [(COMessageChannelRapportTransport *)self _onqueue_memberFromRPCompanionLinkDevice:v4];
    if (v8)
    {
      id v9 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
      [v9 setObject:v4 forKey:v8];

      if (objc_opt_respondsToSelector()) {
        [v7 didFindMember:v8];
      }
    }
    else
    {
      id v10 = COLogForCategory(9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[COMessageChannelRapportTransport _onqueue_handleDeviceFound:]();
      }
    }
  }
}

- (void)_onqueue_handleDeviceLost:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    int v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p device lost %@", (uint8_t *)&v10, 0x16u);
  }

  if ([(COMessageChannelRapportTransport *)self _onqueue_devicePresentInGroup:v4])
  {
    id v6 = COLogForCategory(9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      int v11 = self;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21D3E0000, v6, OS_LOG_TYPE_DEFAULT, "%p lost device is in our group %@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = [(COMessageChannelRapportTransport *)self delegate];
    id v8 = [(COMessageChannelRapportTransport *)self _onqueue_memberFromRPCompanionLinkDevice:v4];
    id v9 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
    [v9 removeObjectForKey:v8];

    if (objc_opt_respondsToSelector()) {
      [v7 didLoseMember:v8];
    }
  }
}

- (void)_onqueue_handleDeviceUpdated:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = COLogForCategory(9);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p device updated %@", buf, 0x16u);
  }

  id v6 = [v4 homeKitIdentifier];
  if (v6)
  {
    id v7 = [(COMessageChannelRapportTransport *)self groupHKIdentifiers];
    int v8 = [v7 containsObject:v6];

    if (v8)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
      int v10 = [v9 allKeys];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) homeKitIdentifier];
            id v16 = [v6 UUIDString];
            char v17 = [v15 isEqualToString:v16];

            if (v17)
            {

              goto LABEL_15;
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      [(COMessageChannelRapportTransport *)self _onqueue_handleDeviceFound:v4];
    }
  }
LABEL_15:
}

- (BOOL)_onqueue_devicePresentInGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 homeKitIdentifier];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__COMessageChannelRapportTransport__onqueue_devicePresentInGroup___block_invoke;
  v8[3] = &unk_264444648;
  int v10 = &v11;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  [(COMessageChannelRapportTransport *)self _withLock:v8];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __66__COMessageChannelRapportTransport__onqueue_devicePresentInGroup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupHKIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (id)_onqueue_activeMemberWithIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(COMessageChannelRapportTransport *)self activeMemberDevices];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__COMessageChannelRapportTransport__onqueue_activeMemberWithIDSIdentifier___block_invoke;
  v9[3] = &unk_264444670;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __75__COMessageChannelRapportTransport__onqueue_activeMemberWithIDSIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v4 = [v6 IDSIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)_onqueue_memberFromRPCompanionLinkDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 homeKitIdentifier];
  id v6 = [v4 idsDeviceIdentifier];
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    if (v5)
    {
      int v8 = [v5 UUIDString];
      [v7 setObject:v8 forKey:@"accessory"];
    }
    [v7 setObject:v6 forKey:@"IDS"];
    if (([v4 flags] & 0x40) != 0) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 3;
    }
    id v10 = [[COClusterMember alloc] initWithType:v9 deviceMetadata:v7];
    [(COClusterMember *)v10 setDevice:v4];
  }
  else
  {
    uint64_t v11 = COLogForCategory(9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[COMessageChannelRapportTransport _onqueue_memberFromRPCompanionLinkDevice:]((uint64_t)self, v11);
    }

    id v10 = 0;
  }

  return v10;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_serializeDataForResponse:(id)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)_serializedDataForRequest:(id)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (a3)
  {
    id v4 = NSStringFromClass(a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (COMessageChannelRapportTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COMessageChannelRapportTransportDelegate *)WeakRetained;
}

- (NSSet)groupHKIdentifiers
{
  return self->_groupHKIdentifiers;
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)activeMemberDevices
{
  return self->_activeMemberDevices;
}

- (void)setActiveMemberDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMemberDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_groupHKIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_DEBUG, "%p checking active rapport devices %@", (uint8_t *)&v4, 0x16u);
}

- (void)_onqueue_handleIncomingRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p unable to produce an on-demand member from device %@");
}

- (void)_onqueue_handleIncomingRequest:(uint64_t)a1 options:(uint64_t)a2 responseHandler:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, a2, a3, "%p incoming request %{public}@ does not have an IDS identifier field", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_onqueue_handleDeviceFound:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p Unable to produce a member for device %@");
}

- (void)_onqueue_memberFromRPCompanionLinkDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_ERROR, "%p failed to create a member for device. IDS identifier = %@", (uint8_t *)&v2, 0x16u);
}

@end