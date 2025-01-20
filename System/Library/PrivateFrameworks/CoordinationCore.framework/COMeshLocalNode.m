@interface COMeshLocalNode
- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory;
- (COMeshLocalNode)initWithCompanionLinkClient:(id)a3 source:(id)a4;
- (NSArray)nodes;
- (NSArray)pendingActivation;
- (NSDictionary)commands;
- (NSSet)acceptableCommands;
- (NSSet)ignoredIDSIdentifiers;
- (id)IDSIdentifier;
- (id)_createNodeForDevice:(id)a3 IDSIdentifier:(id)a4 configure:(id)a5;
- (id)_handleDiscoveryRecord:(id)a3;
- (id)_nodeForIDSIdentifier:(id)a3;
- (unsigned)listeningPort;
- (void)_handleActivation:(id)a3;
- (void)_handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 fromNode:(id)a6;
- (void)_handleFoundDevice:(id)a3;
- (void)_handleLostDevice:(id)a3;
- (void)_handleLostNode:(id)a3;
- (void)_handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 fromNode:(id)a7 at:(unint64_t)a8;
- (void)_invalidateAndReintroduceNode:(id)a3;
- (void)_updateListeningPort:(id)a3;
- (void)activate;
- (void)setAcceptableCommands:(id)a3;
- (void)setCommands:(id)a3;
- (void)setCompanionLinkClientFactory:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation COMeshLocalNode

- (COMeshLocalNode)initWithCompanionLinkClient:(id)a3 source:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)COMeshLocalNode;
  v7 = [(COMeshNode *)&v18 initWithCompanionLinkClient:v6 source:a4];
  if (v7)
  {
    v8 = (NSDictionary *)objc_alloc_init(NSDictionary);
    commands = v7->_commands;
    v7->_commands = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    nodes = v7->_nodes;
    v7->_nodes = v10;

    v12 = [v6 localDevice];
    [(COMeshLocalNode *)v7 _updateListeningPort:v12];

    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v14 = [v13 stringArrayForKey:@"IgnoredIDSIdentifiers"];

    if ([v14 count])
    {
      uint64_t v15 = [MEMORY[0x263EFFA08] setWithArray:v14];
      ignoredIDSIdentifiers = v7->_ignoredIDSIdentifiers;
      v7->_ignoredIDSIdentifiers = (NSSet *)v15;
    }
  }

  return v7;
}

- (void)_updateListeningPort:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int v6 = [v4 listeningPort];
    if (v6 >= 1)
    {
      unsigned __int16 v7 = v6;
      if (v6 != [(COMeshLocalNode *)self listeningPort])
      {
        self->_listeningPort = v7;
        v8 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412546;
          v10 = self;
          __int16 v11 = 1024;
          int v12 = [(COMeshLocalNode *)self listeningPort];
          _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%@ listening port updated to %hu", (uint8_t *)&v9, 0x12u);
        }

        [(COMeshLocalNode *)self _handleActivation:0];
      }
    }
  }
}

- (void)setCommands:(id)a3
{
  id v4 = a3;
  v5 = [(COMeshLocalNode *)self commands];
  if (([v5 isEqualToDictionary:v4] & 1) == 0)
  {
    int v6 = [(COMeshNode *)self client];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __31__COMeshLocalNode_setCommands___block_invoke;
    v16[3] = &unk_2645CD1C0;
    id v7 = v6;
    id v17 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v16];
    v8 = (NSDictionary *)[v4 copy];
    commands = self->_commands;
    self->_commands = v8;

    objc_initWeak(&location, self);
    v10 = self->_commands;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __31__COMeshLocalNode_setCommands___block_invoke_2;
    v12[3] = &unk_2645CD210;
    id v11 = v7;
    id v13 = v11;
    objc_copyWeak(&v14, &location);
    [(NSDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

void __31__COMeshLocalNode_setCommands___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [a3 isSubclassOfClass:objc_opt_class()];
  int v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 deregisterRequestID:v7];
  }
  else {
    [v6 deregisterEventID:v7];
  }
}

void __31__COMeshLocalNode_setCommands___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = [a3 isSubclassOfClass:objc_opt_class()];
  id v7 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 40);
  if (v6)
  {
    int v9 = v14;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __31__COMeshLocalNode_setCommands___block_invoke_3;
    v14[3] = &unk_2645CB430;
    v10 = &v16;
    objc_copyWeak(&v16, v8);
    id v15 = v5;
    [v7 registerRequestID:v15 options:0 handler:v14];
  }
  else
  {
    int v9 = v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __31__COMeshLocalNode_setCommands___block_invoke_254;
    v11[3] = &unk_2645CB480;
    v10 = &v13;
    objc_copyWeak(&v13, v8);
    id v12 = v5;
    [v7 registerEventID:v12 options:0 handler:v11];
  }

  objc_destroyWeak(v10);
}

void __31__COMeshLocalNode_setCommands___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __31__COMeshLocalNode_setCommands___block_invoke_4;
  v26 = &unk_2645CD1E8;
  id v11 = (id *)(a1 + 40);
  objc_copyWeak(v31, (id *)(a1 + 40));
  id v12 = v8;
  id v27 = v12;
  id v28 = *(id *)(a1 + 32);
  id v13 = v7;
  id v29 = v13;
  id v14 = v9;
  id v30 = v14;
  v31[1] = v10;
  id v15 = (void (**)(void))MEMORY[0x223C8B4A0](&v23);
  WeakRetained = objc_loadWeakRetained(v11);
  id v17 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "nodeActivated", v23, v24, v25, v26, v27, v28, v29) & 1) == 0)
  {
    objc_super v18 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%@ deferring request %@ with options %@, not fully activated", buf, 0x20u);
    }

    v19 = [v17 pendingActivation];
    id v20 = (id)[v19 mutableCopy];

    if (!v20) {
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v21 = (void *)MEMORY[0x223C8B4A0](v15);
    [v20 addObject:v21];

    v22 = (void *)v17[24];
    v17[24] = v20;
  }
  else
  {
    v15[2](v15);
  }

  objc_destroyWeak(v31);
}

void __31__COMeshLocalNode_setCommands___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F62C88]];
    if ([v3 length])
    {
      id v4 = [v5 _nodeForIDSIdentifier:v3];
    }
    else
    {
      id v4 = 0;
    }
    [v5 _handleRequestIdentifier:*(void *)(a1 + 40) rapportRepresentation:*(void *)(a1 + 48) options:*(void *)(a1 + 32) responseHandler:*(void *)(a1 + 56) fromNode:v4 at:*(void *)(a1 + 72)];

    id WeakRetained = v5;
  }
}

void __31__COMeshLocalNode_setCommands___block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __31__COMeshLocalNode_setCommands___block_invoke_2_255;
  v21 = &unk_2645CCFB0;
  id v7 = (id *)(a1 + 40);
  objc_copyWeak(&v25, (id *)(a1 + 40));
  id v8 = v6;
  id v22 = v8;
  id v23 = *(id *)(a1 + 32);
  id v9 = v5;
  id v24 = v9;
  v10 = (void (**)(void))MEMORY[0x223C8B4A0](&v18);
  id WeakRetained = objc_loadWeakRetained(v7);
  id v12 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "nodeActivated", v18, v19, v20, v21, v22, v23) & 1) == 0)
  {
    id v13 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%@ deferring command %@ with options %@, not fully activated", buf, 0x20u);
    }

    id v14 = [v12 pendingActivation];
    id v15 = (id)[v14 mutableCopy];

    if (!v15) {
      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v16 = (void *)MEMORY[0x223C8B4A0](v10);
    [v15 addObject:v16];

    id v17 = (void *)v12[24];
    v12[24] = v15;
  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v25);
}

void __31__COMeshLocalNode_setCommands___block_invoke_2_255(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F62C88]];
    if ([v3 length])
    {
      id v4 = [v5 _nodeForIDSIdentifier:v3];
    }
    else
    {
      id v4 = 0;
    }
    [v5 _handleEventIdentifier:*(void *)(a1 + 40) rapportRepresentation:*(void *)(a1 + 48) options:*(void *)(a1 + 32) fromNode:v4];

    id WeakRetained = v5;
  }
}

- (id)IDSIdentifier
{
  v2 = [(COMeshNode *)self client];
  v3 = [v2 localDevice];
  id v4 = [v3 idsDeviceIdentifier];

  return v4;
}

- (COCompanionLinkClientFactoryProtocol)companionLinkClientFactory
{
  companionLinkClientFactory = self->_companionLinkClientFactory;
  if (!companionLinkClientFactory)
  {
    id v4 = objc_alloc_init(COCompanionLinkClientFactory);
    id v5 = self->_companionLinkClientFactory;
    self->_companionLinkClientFactory = (COCompanionLinkClientFactoryProtocol *)v4;

    companionLinkClientFactory = self->_companionLinkClientFactory;
  }
  return companionLinkClientFactory;
}

- (void)setAcceptableCommands:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshLocalNode *)self acceptableCommands];
  char v6 = [v5 isEqualToSet:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    id v8 = (NSSet *)[v4 copy];
    acceptableCommands = self->_acceptableCommands;
    self->_acceptableCommands = v8;

    v10 = self->_acceptableCommands;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __41__COMeshLocalNode_setAcceptableCommands___block_invoke;
    id v15 = &unk_2645CD238;
    id v16 = v7;
    id v17 = self;
    id v11 = v7;
    [(NSSet *)v10 enumerateObjectsUsingBlock:&v12];
    -[COMeshLocalNode setCommands:](self, "setCommands:", v11, v12, v13, v14, v15);
  }
}

void __41__COMeshLocalNode_setAcceptableCommands___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) _eventIDForClass:a2];
  [v3 setObject:a2 forKey:v4];
}

- (void)activate
{
  v3 = [(COMeshNode *)self client];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__COMeshLocalNode_activate__block_invoke;
  v9[3] = &unk_2645CB0A8;
  objc_copyWeak(&v10, &location);
  [v3 setDeviceFoundHandler:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__COMeshLocalNode_activate__block_invoke_2;
  v7[3] = &unk_2645CB0A8;
  objc_copyWeak(&v8, &location);
  [v3 setDeviceLostHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__COMeshLocalNode_activate__block_invoke_3;
  v5[3] = &unk_2645CB0A8;
  objc_copyWeak(&v6, &location);
  [v3 setLocalDeviceUpdatedHandler:v5];
  v4.receiver = self;
  v4.super_class = (Class)COMeshLocalNode;
  [(COMeshNode *)&v4 activate];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __27__COMeshLocalNode_activate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleFoundDevice:v5];
  }
}

void __27__COMeshLocalNode_activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleLostDevice:v5];
  }
}

void __27__COMeshLocalNode_activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateListeningPort:v5];
  }
}

- (void)_handleActivation:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)COMeshLocalNode;
  [(COMeshNode *)&v30 _handleActivation:a3];
  objc_super v4 = [(COMeshNode *)self client];
  id v5 = [v4 activeDevices];

  id v6 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 138412546;
    __int16 v34 = self;
    __int16 v35 = 2048;
    uint64_t v36 = v7;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%@ triggering found events for %lu devices post-activation", buf, 0x16u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        [(COMeshLocalNode *)self _handleFoundDevice:*(void *)(*((void *)&v26 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(COMeshLocalNode *)self pendingActivation];
  pendingActivation = self->_pendingActivation;
  self->_pendingActivation = 0;

  id v15 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v13 count];
    *(_DWORD *)buf = 138412546;
    __int16 v34 = self;
    __int16 v35 = 2048;
    uint64_t v36 = v16;
    _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%@ triggering %lu pending actions post-activation", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v21) + 16))(*(void *)(*((void *)&v22 + 1) + 8 * v21));
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v19);
  }
}

- (id)_nodeForIDSIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__15;
  long long v25 = __Block_byref_object_dispose__15;
  id v26 = 0;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    id v8 = [(COMeshLocalNode *)self nodes];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke;
    v18[3] = &unk_2645CD260;
    id v9 = v4;
    id v19 = v9;
    uint64_t v20 = &v21;
    [v8 enumerateObjectsUsingBlock:v18];
    if (v22[5]) {
      break;
    }
    uint64_t v10 = [(COMeshNode *)self client];
    uint64_t v11 = [v10 activeDevices];

    if (![v11 count]) {
      goto LABEL_7;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke_2;
    v15[3] = &unk_2645CD288;
    id v16 = v9;
    id v17 = self;
    uint64_t v12 = [v11 indexOfObjectPassingTest:v15];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_7:

      break;
    }

    char v6 = 0;
    id v5 = v8;
    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
  }

LABEL_9:
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v10 = a2;
  char v7 = [v10 IDSIdentifier];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 compare:*(void *)(a1 + 32) options:1];
    *a4 = v9 == 0;
    if (!v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

BOOL __41__COMeshLocalNode__nodeForIDSIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  char v7 = [v6 idsDeviceIdentifier];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 compare:*(void *)(a1 + 32) options:1];
    *a4 = v9 == 0;
    if (!v9) {
      [*(id *)(a1 + 40) _handleFoundDevice:v6];
    }
  }
  BOOL v10 = *a4;

  return v10;
}

- (void)_handleFoundDevice:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 idsDeviceIdentifier];
  BOOL v6 = [(COMeshNode *)self nodeActivated];
  uint64_t v7 = [v5 length];
  if (v6)
  {
    if (v7)
    {
      id v8 = [(COMeshLocalNode *)self ignoredIDSIdentifiers];
      int v9 = [v8 containsObject:v5];

      if (v9)
      {
        BOOL v10 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[COMeshLocalNode _handleFoundDevice:]();
        }
      }
      else
      {
        BOOL v10 = [(COMeshLocalNode *)self nodes];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v28 = __Block_byref_object_copy__15;
        long long v29 = __Block_byref_object_dispose__15;
        id v30 = 0;
        uint64_t v17 = MEMORY[0x263EF8330];
        uint64_t v18 = 3221225472;
        id v19 = __38__COMeshLocalNode__handleFoundDevice___block_invoke;
        uint64_t v20 = &unk_2645CD260;
        id v11 = v5;
        id v21 = v11;
        long long v22 = buf;
        [v10 enumerateObjectsUsingBlock:&v17];
        uint64_t v12 = *(void **)(*(void *)&buf[8] + 40);
        if (v12)
        {
          uint64_t v13 = objc_msgSend(v12, "discoveryType", v17, v18, v19, v20);
          [*(id *)(*(void *)&buf[8] + 40) setDiscoveryType:v13 | 1];
          if (![*(id *)(*(void *)&buf[8] + 40) connectionType])
          {
            id v14 = COCoreLogForCategory(0);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v23 = 138412546;
              long long v24 = self;
              __int16 v25 = 2112;
              id v26 = v11;
              _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%@ updating unknown connection type for %@", v23, 0x16u);
            }

            [*(id *)(*(void *)&buf[8] + 40) setConnectionType:1];
          }
        }
        else
        {
          id v15 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v23 = 138412546;
            long long v24 = self;
            __int16 v25 = 2112;
            id v26 = v11;
            _os_log_impl(&dword_2217C1000, v15, OS_LOG_TYPE_DEFAULT, "%@ found %@", v23, 0x16u);
          }

          id v16 = -[COMeshLocalNode _createNodeForDevice:IDSIdentifier:configure:](self, "_createNodeForDevice:IDSIdentifier:configure:", v4, v11, &__block_literal_global_267, v17, v18, v19, v20);
        }

        _Block_object_dispose(buf, 8);
      }
LABEL_18:
    }
  }
  else if (v7)
  {
    BOOL v10 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%@ ignore found %@, not fully activated", buf, 0x16u);
    }
    goto LABEL_18;
  }
}

void __38__COMeshLocalNode__handleFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 IDSIdentifier];
  uint64_t v8 = [v7 compare:*(void *)(a1 + 32) options:1];
  *a4 = v8 == 0;

  if (!v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __38__COMeshLocalNode__handleFoundDevice___block_invoke_264(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDiscoveryType:1];
  [v2 setConnectionType:1];
}

- (void)_handleLostDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [a3 idsDeviceIdentifier];
  BOOL v5 = [(COMeshNode *)self nodeActivated];
  uint64_t v6 = [v4 length];
  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = [(COMeshLocalNode *)self _nodeForIDSIdentifier:v4];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 connectionType];
        uint64_t v10 = [v8 discoveryType];
        if (v9 == 1)
        {
          [(COMeshLocalNode *)self _handleLostNode:v8];
        }
        else
        {
          uint64_t v11 = v10;
          uint64_t v12 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412546;
            id v14 = self;
            __int16 v15 = 2112;
            id v16 = v4;
            _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%@ ignoring loss %@", (uint8_t *)&v13, 0x16u);
          }

          [v8 setDiscoveryType:v11 & 0xFFFFFFFFFFFFFFFELL];
        }
      }
LABEL_12:
    }
  }
  else if (v6)
  {
    uint64_t v8 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%@ ignore lost %@, not fully activated", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_12;
  }
}

- (void)_handleLostNode:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 IDSIdentifier];
  uint64_t v6 = [(COMeshLocalNode *)self nodes];
  uint64_t v7 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    int v13 = v5;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%@ lost %@", (uint8_t *)&v10, 0x16u);
  }

  [v4 setParent:0];
  uint64_t v8 = (void *)[v6 mutableCopy];
  [v8 removeObject:v4];
  [(COMeshLocalNode *)self setNodes:v8];
  uint64_t v9 = [(COMeshNode *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v9 didRemoveNode:v4];
  }
  else
  {
    [v4 invalidate];
    if (objc_opt_respondsToSelector()) {
      [v9 didInvalidateNode:v4];
    }
  }
}

- (id)_handleDiscoveryRecord:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 IDSIdentifier];
  if ([v5 length])
  {
    uint64_t v6 = [(COMeshLocalNode *)self nodes];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__15;
    uint64_t v23 = __Block_byref_object_dispose__15;
    id v24 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke;
    v16[3] = &unk_2645CD260;
    id v7 = v5;
    id v17 = v7;
    uint64_t v18 = &v19;
    [v6 enumerateObjectsUsingBlock:v16];
    uint64_t v8 = (void *)v20[5];
    if (v8)
    {
      uint64_t v9 = [v8 discoveryType];
      [(id)v20[5] setDiscoveryType:v9 | 2];
      id v10 = (id)v20[5];
    }
    else
    {
      uint64_t v11 = [v4 companionLinkDevice];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke_2;
      v14[3] = &unk_2645CD2D0;
      id v15 = v4;
      id v10 = [(COMeshLocalNode *)self _createNodeForDevice:v11 IDSIdentifier:v7 configure:v14];
      __int16 v12 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = self;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%@ discovered (IP) %@, created %@", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  id v7 = [v9 IDSIdentifier];
  uint64_t v8 = [v7 compare:*(void *)(a1 + 32) options:1];
  *a4 = v8 == 0;

  if (!v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __42__COMeshLocalNode__handleDiscoveryRecord___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setDiscoveryRecord:v2];
  [v3 setDiscoveryType:2];
  [v3 setConnectionType:0];
}

- (id)_createNodeForDevice:(id)a3 IDSIdentifier:(id)a4 configure:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(COMeshNode *)self client];
  __int16 v12 = [(COMeshLocalNode *)self companionLinkClientFactory];
  int v13 = [v12 companionLinkClientForDevice:v10 withIDSIdentifier:v9];

  uint64_t v14 = [v11 dispatchQueue];
  [v13 setDispatchQueue:v14];

  id v15 = [COMeshNode alloc];
  id v16 = [(COMeshNode *)self source];
  id v17 = [(COMeshNode *)v15 initWithCompanionLinkClient:v13 source:v16];

  [(COMeshNode *)v17 setParent:self];
  uint64_t v18 = [(COMeshNode *)self meshName];
  [(COMeshNode *)v17 setMeshName:v18];

  uint64_t v19 = [(COMeshNode *)self label];
  [(COMeshNode *)v17 setLabel:v19];

  uint64_t v20 = [(COMeshNode *)self recorder];
  [(COMeshNode *)v17 setRecorder:v20];

  [(COMeshNode *)v17 _setIDSIdentifier:v9];
  v8[2](v8, v17);

  uint64_t v21 = [(COMeshLocalNode *)self nodes];
  long long v22 = [v21 arrayByAddingObject:v17];
  [(COMeshLocalNode *)self setNodes:v22];

  uint64_t v23 = [(COMeshNode *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v23 didAddNode:v17];
  }
  else {
    [(COMeshNode *)v17 activate];
  }

  return v17;
}

- (void)_handleEventIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 fromNode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__15;
  v82 = __Block_byref_object_dispose__15;
  id v13 = a6;
  id v83 = v13;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__15;
  v76 = __Block_byref_object_dispose__15;
  id v77 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__15;
  v70 = __Block_byref_object_dispose__15;
  id v71 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__15;
  v60 = __Block_byref_object_dispose__15;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__15;
  v54 = __Block_byref_object_dispose__15;
  id v55 = 0;
  uint64_t v14 = objc_opt_class();
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke;
  v49[3] = &unk_2645CB5C0;
  v49[4] = &v56;
  v49[5] = &v50;
  [v14 _commandPayloadFromRapportRepresentation:v11 result:v49];
  if (v51[5])
  {
    id v15 = [(COMeshLocalNode *)self commands];
    uint64_t v16 = [v15 objectForKey:v10];

    if (v16)
    {
      uint64_t v17 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v16 fromData:v51[5] error:0];
      uint64_t v18 = v67;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      uint64_t v18 = v73;
    }
    long long v22 = (void *)v18[5];
    v18[5] = v17;
  }
  else
  {
    uint64_t v19 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[COMeshLocalNode _handleEventIdentifier:rapportRepresentation:options:fromNode:]();
    }

    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    uint64_t v21 = (void *)v73[5];
    v73[5] = v20;

    *((unsigned char *)v63 + 24) = 1;
  }
  uint64_t v23 = v67;
  id v24 = (void *)v67[5];
  if (v24)
  {
    if (v57[5])
    {
      objc_msgSend(v24, "_setSendingConstituent:");
      uint64_t v23 = v67;
    }
    if (v79[5])
    {
      objc_msgSend((id)v23[5], "_setSender:");
      uint64_t v23 = v67;
    }
    [(id)v23[5] _setRapportOptions:v12];
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__15;
  v47 = __Block_byref_object_dispose__15;
  __int16 v25 = (void *)v79[5];
  if (v25) {
    [v25 delegate];
  }
  else {
  id v48 = [(COMeshNode *)self delegate];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273;
  v34[3] = &unk_2645CD2F8;
  uint64_t v36 = &v78;
  v34[4] = self;
  id v26 = v10;
  id v35 = v26;
  uint64_t v37 = &v43;
  uint64_t v38 = &v56;
  v39 = &v72;
  v40 = &v62;
  v41 = &v66;
  v42 = &v50;
  __int16 v27 = (void (**)(void))MEMORY[0x223C8B4A0](v34);
  if (!v79[5] && v57[5] && v67[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v28 = (void *)v44[5];
    uint64_t v29 = v67[5];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_278;
    v30[3] = &unk_2645CD320;
    v33 = &v78;
    v30[4] = self;
    id v31 = v26;
    uint64_t v32 = v27;
    [v28 unknownNodeForCommand:v29 result:v30];
  }
  else
  {
    v27[2](v27);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = COCoreLogForCategory(0);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_4();
    }

    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) delegate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _validateSource:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)] & 1) == 0)
    {
      uint64_t v8 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_3();
      }

      uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0;

      uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
    uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (v16)
    {
      [v16 _setSender:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      if (objc_opt_respondsToSelector()) {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) node:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didReceiveCommand:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (!v17)
      {
        uint64_t v18 = COCoreLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_2(a1, v18, v19, v20, v21, v22, v23, v24);
        }

        uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
        uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
        __int16 v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) node:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) didReceiveError:v17 forCommand:0];
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      [*(id *)(a1 + 32) _invalidateAndReintroduceNode:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_1();
    }
  }
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_278(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  uint64_t v5 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%@ received node %@ from delegate for command %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_handleRequestIdentifier:(id)a3 rapportRepresentation:(id)a4 options:(id)a5 responseHandler:(id)a6 fromNode:(id)a7 at:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__15;
  v92 = __Block_byref_object_dispose__15;
  id v18 = a7;
  id v93 = v18;
  uint64_t v82 = 0;
  id v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__15;
  v86 = __Block_byref_object_dispose__15;
  id v87 = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__15;
  uint64_t v80 = __Block_byref_object_dispose__15;
  id v81 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__15;
  v70 = __Block_byref_object_dispose__15;
  id v71 = 0;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__15;
  uint64_t v64 = __Block_byref_object_dispose__15;
  id v65 = 0;
  uint64_t v19 = objc_opt_class();
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke;
  v59[3] = &unk_2645CB5C0;
  v59[4] = &v66;
  v59[5] = &v60;
  [v19 _commandPayloadFromRapportRepresentation:v15 result:v59];
  if (v61[5])
  {
    uint64_t v20 = [(COMeshLocalNode *)self commands];
    uint64_t v21 = [v20 objectForKey:v14];

    if (!v21)
    {
      uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
      goto LABEL_10;
    }
    uint64_t v22 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v21 fromData:v61[5] error:0];
    uint64_t v23 = (void *)v77[5];
    v77[5] = v22;

    if (v77[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = (void *)v77[5];
        v77[5] = 0;

        uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
LABEL_10:
        uint64_t v29 = (void *)v83[5];
        v83[5] = v25;
      }
    }
  }
  else
  {
    uint64_t v26 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[COMeshLocalNode _handleRequestIdentifier:rapportRepresentation:options:responseHandler:fromNode:at:]();
    }

    uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    id v28 = (void *)v83[5];
    v83[5] = v27;

    *((unsigned char *)v73 + 24) = 1;
  }
  id v30 = v77;
  id v31 = (void *)v77[5];
  if (v31)
  {
    if (v67[5])
    {
      objc_msgSend(v31, "_setSendingConstituent:");
      id v30 = v77;
    }
    if (v89[5])
    {
      objc_msgSend((id)v30[5], "_setSender:");
      id v30 = v77;
    }
    [(id)v30[5] _setRapportOptions:v16];
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy__15;
  v57 = __Block_byref_object_dispose__15;
  uint64_t v32 = (void *)v89[5];
  if (v32) {
    [v32 delegate];
  }
  else {
  id v58 = [(COMeshNode *)self delegate];
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279;
  v42[3] = &unk_2645CD370;
  uint64_t v45 = &v88;
  v42[4] = self;
  id v33 = v14;
  id v43 = v33;
  v46 = &v82;
  id v34 = v17;
  id v44 = v34;
  v47 = &v53;
  id v48 = &v66;
  v49 = &v72;
  uint64_t v50 = &v76;
  v51 = &v60;
  unint64_t v52 = a8;
  id v35 = (void (**)(void))MEMORY[0x223C8B4A0](v42);
  if (!v89[5] && v67[5] && v77[5] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v36 = (void *)v54[5];
    uint64_t v37 = v77[5];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_285;
    v38[3] = &unk_2645CD320;
    v41 = &v88;
    v38[4] = self;
    id v39 = v33;
    v40 = v35;
    [v36 unknownNodeForRequest:v37 result:v38];
  }
  else
  {
    v35[2](v35);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = COCoreLogForCategory(0);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_4();
    }

    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) delegate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _validateSource:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)] & 1) == 0)
    {
      uint64_t v8 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_3();
      }

      uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8);
      __int16 v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = 0;

      uint64_t v14 = *(void *)(*(void *)(a1 + 104) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
    id v16 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v16)
    {
      [v16 _setSender:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      if (objc_opt_respondsToSelector())
      {
        id v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v18 = *(void *)(a1 + 56);
        uint64_t v19 = *(void *)(*(void *)(v18 + 8) + 40);
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_282;
        v30[3] = &unk_2645CD348;
        v30[4] = *(void *)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 112);
        uint64_t v32 = v18;
        uint64_t v33 = v21;
        id v31 = *(id *)(a1 + 48);
        [v17 node:v19 didReceiveRequest:v20 responseCallBack:v30];
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (!v25)
        {
          uint64_t v26 = COCoreLogForCategory(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_2();
          }

          uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
          uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v29 = *(void **)(v28 + 40);
          *(void *)(v28 + 40) = v27;

          uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) node:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) didReceiveError:v25 forCommand:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        [*(id *)(a1 + 32) _invalidateAndReintroduceNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_1();
    }

    uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4001 userInfo:0];
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_282(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_282_cold_1(a1, (uint64_t)v6, v7);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _serializedDataForCommand:v5];
    uint64_t v9 = [*(id *)(a1 + 32) _eventIDForClass:objc_opt_class()];
    uint64_t v10 = COCoreLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_debug_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEBUG, "%@ responding with %@ to %@", buf, 0x20u);
    }

    id v11 = (void *)MEMORY[0x263F08910];
    uint64_t v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "source", @"source");
    __int16 v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    v18[0] = v13;
    v18[1] = v7;
    v17[1] = @"command";
    v17[2] = @"response";
    v18[2] = v9;
    v17[3] = @"overhead";
    uint64_t v14 = [NSNumber numberWithDouble:(double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a1 + 56))];
    v18[3] = v14;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_285(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  id v5 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%@ received node %@ from delegate for request %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_invalidateAndReintroduceNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 IDSIdentifier];
  uint64_t v6 = [v4 discoveryRecord];
  [v4 invalidate];
  if ([v5 length])
  {
    uint64_t v7 = [(COMeshLocalNode *)self _nodeForIDSIdentifier:v5];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412802;
        __int16 v13 = self;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        id v17 = v4;
        uint64_t v10 = "%@ reintroduced node %@ for %@";
LABEL_9:
        _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x20u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  if (v6)
  {
    uint64_t v11 = [(COMeshLocalNode *)self _handleDiscoveryRecord:v6];
    if (v11)
    {
      uint64_t v8 = v11;
      int v9 = COCoreLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412802;
        __int16 v13 = self;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        id v17 = v4;
        uint64_t v10 = "%@ reintroduced (IP) node %@ for %@";
        goto LABEL_9;
      }
LABEL_10:

      goto LABEL_13;
    }
  }
  uint64_t v8 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[COMeshLocalNode _invalidateAndReintroduceNode:]();
  }
LABEL_13:
}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (unsigned)listeningPort
{
  return self->_listeningPort;
}

- (NSArray)pendingActivation
{
  return self->_pendingActivation;
}

- (NSSet)ignoredIDSIdentifiers
{
  return self->_ignoredIDSIdentifiers;
}

- (void)setCompanionLinkClientFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_ignoredIDSIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingActivation, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
}

- (void)_handleFoundDevice:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ default set, IGNORING found device %@");
}

- (void)_handleEventIdentifier:rapportRepresentation:options:fromNode:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ no event payload from %@");
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "%@ disregarding %@ from unknown node", v1, 0x16u);
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_3()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ command failed source validation from %@");
}

void __81__COMeshLocalNode__handleEventIdentifier_rapportRepresentation_options_fromNode___block_invoke_273_cold_4()
{
  OUTLINED_FUNCTION_10_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_1(&dword_2217C1000, v0, v1, "%@ received %@ from %@");
}

- (void)_handleRequestIdentifier:rapportRepresentation:options:responseHandler:fromNode:at:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%{public}@ no request payload from %{public}@");
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_2()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ no command from %@");
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_3()
{
  OUTLINED_FUNCTION_6_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ request failed source validation from %@");
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_279_cold_4()
{
  OUTLINED_FUNCTION_10_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11_1(&dword_2217C1000, v0, v1, "%@ received request %@ from %@");
}

void __102__COMeshLocalNode__handleRequestIdentifier_rapportRepresentation_options_responseHandler_fromNode_at___block_invoke_282_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%@ response error (%@) to %@", (uint8_t *)&v5, 0x20u);
}

- (void)_invalidateAndReintroduceNode:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_2217C1000, v0, v1, "%@ failed to reintroduce node for %@");
}

@end