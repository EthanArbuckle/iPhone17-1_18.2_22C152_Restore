@interface MGDaemon
+ (id)daemon;
+ (id)daemonWithTopologyRequestHandler:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MGClientService)serviceForIngestion;
- (MGDaemon)init;
- (MGDaemon)initWithServiceListenerProvider:(id)a3;
- (MGDaemon)initWithTopologyRequestHandler:(id)a3 serviceListenerProvider:(id)a4;
- (MGGroupsMediator)homekitGroupsMediator;
- (MGGroupsMediator)localGroupsMediator;
- (MGGroupsQueryAgent)queryAgent;
- (MGRemoteQueryClientManager)remoteQueryClient;
- (MGRemoteQueryServerManager)remoteQueryServer;
- (MGServiceClientSet)clients;
- (MGServiceListenerProvider)listenerProvider;
- (NSDictionary)internalQueries;
- (NSXPCListener)listener;
- (OS_dispatch_queue)dispatchQueue;
- (id)startInternalQueryWithPredicate:(id)a3 handler:(id)a4;
- (id)topologyRequestHandler;
- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9;
- (void)_addHomeKitAccessoryWithoutHomeIngestion:(id)a3 fromHome:(id)a4;
- (void)_fetchGroupInfo:(id)a3 completion:(id)a4;
- (void)_homeTheaterGroupIdentifierForAudioDestination:(id)a3 fromHome:(id)a4 completion:(id)a5;
- (void)_ingestHomeKitHome:(id)a3;
- (void)addHomeKitAccessory:(id)a3 fromHome:(id)a4;
- (void)addHomeKitHome:(id)a3;
- (void)addHomeKitMediaSystem:(id)a3;
- (void)addHomeKitMediaSystem:(id)a3 fromHome:(id)a4;
- (void)addHomeKitRoom:(id)a3 fromHome:(id)a4;
- (void)addHomeKitZone:(id)a3 fromHome:(id)a4;
- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5;
- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6;
- (void)deleteGroup:(id)a3 completion:(id)a4;
- (void)groupsQueryAgent:(id)a3 didFindResults:(id)a4 forQuery:(id)a5;
- (void)removeHomeKitAccessory:(id)a3 fromHome:(id)a4;
- (void)removeHomeKitHome:(id)a3;
- (void)removeHomeKitMediaSystem:(id)a3;
- (void)removeHomeKitMediaSystem:(id)a3 fromHome:(id)a4;
- (void)removeHomeKitRoom:(id)a3 fromHome:(id)a4;
- (void)removeHomeKitZone:(id)a3 fromHome:(id)a4;
- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5;
- (void)setInternalQueries:(id)a3;
- (void)setName:(id)a3 group:(id)a4 completion:(id)a5;
- (void)setServiceForIngestion:(id)a3;
- (void)setTopologyRequestHandler:(id)a3;
- (void)startOutstandingQueryWithPredicate:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)startQueryWithPredicate:(id)a3 completion:(id)a4;
- (void)stopInternalQuery:(id)a3;
- (void)stopOutstandingQuery:(id)a3;
- (void)stopQuery:(id)a3;
- (void)stopQuery:(id)a3 completion:(id)a4;
@end

@implementation MGDaemon

- (MGDaemon)initWithTopologyRequestHandler:(id)a3 serviceListenerProvider:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)MGDaemon;
  v8 = [(MGDaemon *)&v73 init];
  if (v8)
  {
    v9 = objc_alloc_init(MGServiceClientSet);
    clients = v8->_clients;
    v8->_clients = v9;

    uint64_t v11 = MEMORY[0x22A6B39E0](v6);
    id topologyRequestHandler = v8->_topologyRequestHandler;
    v8->_id topologyRequestHandler = (id)v11;

    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v14 = [MEMORY[0x263F08AB0] processInfo];
    v15 = [v14 arguments];

    uint64_t v16 = [v15 indexOfObject:@"--static"];
    v17 = &off_229280000;
    v61 = v15;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v18 = v16 + 1;
      if (v16 + 1 < (unint64_t)[v15 count])
      {
        v19 = [v15 objectAtIndex:v18];
        v60 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        objc_msgSend(v19, "stringByTrimmingCharactersInSet:");
        v20 = (MGDaemon *)objc_claimAutoreleasedReturnValue();

        if ([(MGDaemon *)v20 length])
        {
          v21 = MGLogForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v20;
            _os_log_impl(&dword_229257000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to use static groups file at %@", buf, 0xCu);
          }

          id v72 = 0;
          v58 = v20;
          uint64_t v22 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v20 options:0 error:&v72];
          v23 = (MGDaemon *)v72;
          v59 = (void *)v22;
          if (v22)
          {
            v24 = (void *)MEMORY[0x263F08928];
            v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
            v71 = v23;
            v26 = [v24 unarchivedObjectOfClasses:v25 fromData:v22 error:&v71];
            v57 = v71;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v26 enumerateObjectsUsingBlock:&__block_literal_global_4];
              v69[0] = MEMORY[0x263EF8330];
              v17 = &off_229280000;
              v69[1] = 3221225472;
              v69[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_2;
              v69[3] = &unk_26485EC08;
              v70 = v13;
              [v70 enumerateKeysAndObjectsUsingBlock:v69];
              v27 = v70;
              v20 = v58;
            }
            else
            {
              v27 = MGLogForCategory(0);
              v17 = &off_229280000;
              v20 = v58;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v75 = v57;
                _os_log_error_impl(&dword_229257000, v27, OS_LOG_TYPE_ERROR, "Failed to unarchive static groups file (%@)", buf, 0xCu);
              }
            }

            v23 = v57;
          }
          else
          {
            v26 = MGLogForCategory(0);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v23;
              _os_log_error_impl(&dword_229257000, v26, OS_LOG_TYPE_ERROR, "Failed to read static groups file (%@)", buf, 0xCu);
            }
            v20 = v58;
          }
        }
      }
    }
    v28 = [[MGGroupsQueryAgent alloc] initWithDelegate:v8];
    queryAgent = v8->_queryAgent;
    v8->_queryAgent = v28;

    v30 = [[MGGroupsMediator alloc] initWithGroupsQueryAgent:v8->_queryAgent];
    [(MGGroupsMediator *)v30 setAllowsClientEdits:1];
    objc_storeStrong((id *)&v8->_localGroupsMediator, v30);
    v31 = [[MGGroupsMediator alloc] initWithGroupsQueryAgent:v8->_queryAgent];
    homekitGroupsMediator = v8->_homekitGroupsMediator;
    v8->_homekitGroupsMediator = v31;

    v33 = (NSDictionary *)objc_alloc_init(NSDictionary);
    internalQueries = v8->_internalQueries;
    v8->_internalQueries = v33;

    objc_storeStrong((id *)&v8->_listenerProvider, a4);
    uint64_t v35 = [(MGServiceListenerProvider *)v8->_listenerProvider dispatchQueue];
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v35;

    uint64_t v37 = [(MGServiceListenerProvider *)v8->_listenerProvider serviceListener];
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v37;

    [(NSXPCListener *)v8->_listener _setQueue:v8->_dispatchQueue];
    [(NSXPCListener *)v8->_listener setDelegate:v8];
    v39 = v13;
    if ([v13 count])
    {
      v40 = [(MGGroupsMediator *)v30 startActivityWithName:@"Startup"];
      v67[0] = MEMORY[0x263EF8330];
      v41 = v17;
      v67[1] = *((void *)v17 + 17);
      v67[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_71;
      v67[3] = &unk_26485EC08;
      v68 = v30;
      v42 = v39;
      [v39 enumerateKeysAndObjectsUsingBlock:v67];
    }
    else
    {
      v42 = v13;
      v41 = v17;
      v40 = 0;
    }
    v43 = MGLogForCategory(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v8->_listener;
      *(_DWORD *)buf = 134218240;
      v75 = v8;
      __int16 v76 = 2048;
      v77 = v44;
      _os_log_impl(&dword_229257000, v43, OS_LOG_TYPE_DEFAULT, "%p created with listener %p", buf, 0x16u);
    }

    v45 = MGLogForCategory(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v8->_queryAgent;
      *(_DWORD *)buf = 134218240;
      v75 = v8;
      __int16 v76 = 2048;
      v77 = v46;
      _os_log_impl(&dword_229257000, v45, OS_LOG_TYPE_DEFAULT, "%p using %p for groups query", buf, 0x16u);
    }

    v47 = MGLogForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      localGroupsMediator = v8->_localGroupsMediator;
      *(_DWORD *)buf = 134218240;
      v75 = v8;
      __int16 v76 = 2048;
      v77 = localGroupsMediator;
      _os_log_impl(&dword_229257000, v47, OS_LOG_TYPE_DEFAULT, "%p using %p for local groups mediation", buf, 0x16u);
    }

    v49 = MGLogForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v8->_homekitGroupsMediator;
      *(_DWORD *)buf = 134218240;
      v75 = v8;
      __int16 v76 = 2048;
      v77 = v50;
      _os_log_impl(&dword_229257000, v49, OS_LOG_TYPE_DEFAULT, "%p using %p for HomeKit groups mediation", buf, 0x16u);
    }

    if (_os_feature_enabled_impl())
    {
      v51 = [[MGRemoteQueryClientManager alloc] initWithQueryRunner:v8 groupsQueryAgent:v8->_queryAgent];
      remoteQueryClient = v8->_remoteQueryClient;
      v8->_remoteQueryClient = v51;
    }
    v53 = v8->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = *((void *)v41 + 17);
    block[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_75;
    block[3] = &unk_26485EC30;
    v63 = v8;
    id v64 = v7;
    id v65 = v40;
    v66 = v30;
    v54 = v30;
    id v55 = v40;
    dispatch_async(v53, block);
  }
  return v8;
}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 memberIdentifiers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_3;
  v5[3] = &unk_26485EBE0;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3)
  {
    v4 = (objc_class *)MGClassForGroupIdentifier(v9);
    if (v4)
    {
      v5 = v4;
      id v6 = [v4 alloc];
      id v7 = [(objc_class *)v5 type];
      v8 = (void *)[v6 initWithConnectionProvider:0 type:v7 identifier:v9 name:&stru_26DD64658 properties:0 memberIdentifiers:MEMORY[0x263EFFA68]];

      [*(id *)(a1 + 32) setObject:v8 forKey:v9];
    }
  }
}

uint64_t __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_71(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGroup:");
}

void __67__MGDaemon_initWithTopologyRequestHandler_serviceListenerProvider___block_invoke_75(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) resume];
  v2 = [*(id *)(a1 + 40) serviceName];
  id v3 = [v2 stringByAppendingString:@".ready"];
  notify_post((const char *)[v3 UTF8String]);

  if (*(void *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 56);
    objc_msgSend(v4, "endActivity:");
  }
}

- (MGDaemon)initWithServiceListenerProvider:(id)a3
{
  return [(MGDaemon *)self initWithTopologyRequestHandler:0 serviceListenerProvider:a3];
}

- (MGDaemon)init
{
  id v3 = [[MGServiceListenerProvider alloc] initWithServiceName:@"com.apple.MediaGroups.daemon" entitlement:@"com.apple.MediaGroups.client"];
  v4 = [(MGDaemon *)self initWithTopologyRequestHandler:0 serviceListenerProvider:v3];

  return v4;
}

+ (id)daemonWithTopologyRequestHandler:(id)a3
{
  id v4 = a3;
  v5 = [[MGServiceListenerProvider alloc] initWithServiceName:@"com.apple.MediaGroups.daemon" entitlement:@"com.apple.MediaGroups.client"];
  id v6 = (void *)[objc_alloc((Class)a1) initWithTopologyRequestHandler:v4 serviceListenerProvider:v5];

  return v6;
}

+ (id)daemon
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)setTopologyRequestHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MGDaemon *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke;
  v7[3] = &unk_26485ECA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__MGDaemon_setTopologyRequestHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x22A6B39E0](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  if (*(void *)(a1 + 40))
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v5 = [*(id *)(a1 + 32) clients];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke_2;
    v17[3] = &unk_26485EC80;
    v19 = &v20;
    id v18 = *(id *)(a1 + 40);
    [v5 enumerateClientsUsingBlock:v17];

    if (!*((unsigned char *)v21 + 24))
    {
      [*(id *)(a1 + 32) internalQueries];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "queryAgent", (void)v13);
            v12 = [v11 outstandingQueryForIdentifier:v10];

            if ([v12 requiresTopology])
            {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

              goto LABEL_13;
            }
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    _Block_object_dispose(&v20, 8);
  }
}

void __38__MGDaemon_setTopologyRequestHandler___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__MGDaemon_setTopologyRequestHandler___block_invoke_3;
  v8[3] = &unk_26485EC58;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  [a2 enumerateQueriesUsingBlock:v8];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __38__MGDaemon_setTopologyRequestHandler___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 requiresTopology];
  *a3 = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
  return result;
}

- (MGClientService)serviceForIngestion
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_serviceForIngestion;
  if (!v3)
  {
    id v4 = [MEMORY[0x263F546D0] clientServiceWithConnectionProvider:0];
    serviceForIngestion = self->_serviceForIngestion;
    self->_serviceForIngestion = v4;

    uint64_t v3 = self->_serviceForIngestion;
    id v6 = MGLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      long long v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = v3;
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p created service %p for ingestion", (uint8_t *)&v8, 0x16u);
    }
  }
  return v3;
}

- (void)groupsQueryAgent:(id)a3 didFindResults:(id)a4 forQuery:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v25 + 1) + 8 * v14) group];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  long long v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  v17 = [(MGDaemon *)self dispatchQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke;
  v21[3] = &unk_26485EC30;
  v21[4] = self;
  id v22 = v8;
  id v23 = v16;
  id v24 = v10;
  id v18 = v10;
  id v19 = v16;
  id v20 = v8;
  dispatch_async(v17, v21);
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) clients];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_2;
  v20[3] = &unk_26485ED20;
  id v24 = &v30;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v21 = v3;
  uint64_t v22 = v4;
  long long v25 = &v26;
  id v23 = *(id *)(a1 + 48);
  [v2 enumerateClientsUsingBlock:v20];

  if (!*((unsigned char *)v31 + 24))
  {
    v5 = [*(id *)(a1 + 32) internalQueries];
    id v6 = [*(id *)(a1 + 40) identifier];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqual:", v6, (void)v16))
          {
            uint64_t v12 = [v7 objectForKey:v11];
            v12[2](v12, *(void *)(a1 + 56), 0);
            uint64_t v13 = MGLogForCategory(3);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 134218242;
              uint64_t v35 = v14;
              __int16 v36 = 2112;
              uint64_t v37 = v11;
              _os_log_impl(&dword_229257000, v13, OS_LOG_TYPE_DEFAULT, "%p sent update for internal query %@", buf, 0x16u);
            }

            *((unsigned char *)v31 + 24) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v38 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    if (!*((unsigned char *)v31 + 24)) {
      goto LABEL_16;
    }
  }
  if (*((unsigned char *)v27 + 24))
  {
LABEL_16:
    long long v15 = objc_msgSend(*(id *)(a1 + 32), "queryAgent", (void)v16);
    [v15 removeOutstandingQuery:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_3;
  v9[3] = &unk_26485ECF8;
  uint64_t v14 = *(void *)(a1 + 56);
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v15 = v6;
  id v13 = v7;
  id v8 = v5;
  [v8 enumerateQueriesUsingBlock:v9];
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  BOOL v6 = *(void *)(a1 + 32) == (void)v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) identifier];
    id v8 = [*(id *)(a1 + 40) connection];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_4;
    v23[3] = &unk_26485ECD0;
    v23[4] = *(void *)(a1 + 48);
    id v9 = v7;
    id v24 = v9;
    id v25 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 72);
    id v26 = v10;
    uint64_t v27 = v11;
    uint64_t v12 = [v8 remoteObjectProxyWithErrorHandler:v23];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_92;
    v18[3] = &unk_26485ECD0;
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 48);
    id v19 = v9;
    id v20 = v14;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 72);
    id v21 = v15;
    uint64_t v22 = v16;
    id v17 = v9;
    [v12 query:v17 didUpdate:v13 completion:v18];
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MGLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_229257000, v4, OS_LOG_TYPE_ERROR, "%p sending query %@ update unsuccessful (%@)", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(a1 + 48) removeQuery:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

void __53__MGDaemon_groupsQueryAgent_didFindResults_forQuery___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MGLogForCategory(3);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 134218498;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p sending query %@ update failed (%@)", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 48) removeQuery:*(void *)(a1 + 56)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 134218242;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_229257000, v5, OS_LOG_TYPE_DEFAULT, "%p sent update for query %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_ingestHomeKitHome:(id)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGDaemon *)self serviceForIngestion];
  uint64_t v6 = [(MGDaemon *)self homekitGroupsMediator];
  uint64_t v7 = [v4 accessories];
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke;
  v90[3] = &unk_26485ED48;
  v90[4] = self;
  id v8 = v4;
  id v91 = v8;
  [v7 enumerateObjectsUsingBlock:v90];

  uint64_t v9 = [v8 mediaSystems];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_2;
  v85[3] = &unk_26485ED70;
  id v10 = v5;
  id v86 = v10;
  id v11 = v8;
  id v87 = v11;
  v88 = self;
  id v12 = v6;
  id v89 = v12;
  [v9 enumerateObjectsUsingBlock:v85];

  uint64_t v13 = [v11 rooms];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_96;
  v80[3] = &unk_26485ED98;
  id v14 = v10;
  id v81 = v14;
  id v15 = v11;
  id v82 = v15;
  v83 = self;
  id v16 = v12;
  id v84 = v16;
  [v13 enumerateObjectsUsingBlock:v80];

  id v17 = [v15 zones];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __31__MGDaemon__ingestHomeKitHome___block_invoke_99;
  v75[3] = &unk_26485EDC0;
  id v18 = v14;
  id v76 = v18;
  id v19 = v15;
  id v77 = v19;
  uint64_t v78 = self;
  v63 = self;
  id v67 = v16;
  id v79 = v67;
  [v17 enumerateObjectsUsingBlock:v75];

  v60 = v18;
  uint64_t v20 = [objc_alloc(MEMORY[0x263F546F8]) initWithClientService:v18 home:v19];
  id v21 = MGLogForCategory(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v94 = self;
    __int16 v95 = 2112;
    uint64_t v96 = v20;
    _os_log_impl(&dword_229257000, v21, OS_LOG_TYPE_DEFAULT, "%p adding home %@", buf, 0x16u);
  }

  v59 = (void *)v20;
  [v67 addGroup:v20];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v22 = [v19 accessories];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v101 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v72;
    uint64_t v26 = *MEMORY[0x263F0B030];
    id v61 = v19;
    uint64_t v64 = *(void *)v72;
    id v65 = v22;
    uint64_t v69 = *MEMORY[0x263F0B030];
    do
    {
      uint64_t v27 = 0;
      uint64_t v66 = v24;
      do
      {
        if (*(void *)v72 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void **)(*((void *)&v71 + 1) + 8 * v27);
        char v29 = [v28 category];
        uint64_t v30 = [v29 categoryType];
        int v31 = [v30 isEqualToString:v26];

        if (v31)
        {
          uint64_t v32 = MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v28, v19);
          char v33 = [v28 audioDestinationController];
          uint64_t v34 = [v33 destination];
          uint64_t v35 = (void *)v34;
          if (v33) {
            BOOL v36 = v34 == 0;
          }
          else {
            BOOL v36 = 1;
          }
          if (v36)
          {
            uint64_t v37 = MGLogForCategory(1);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v94 = v63;
              __int16 v95 = 2112;
              uint64_t v96 = (uint64_t)v32;
              _os_log_impl(&dword_229257000, v37, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@", buf, 0x16u);
            }

            [v67 removeGroupWithIdentifier:v32];
          }
          else
          {
            v70 = MGGroupIdentifierForAccessory(v28, v19);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            v68 = v32;
            if (isKindOfClass)
            {
              id v39 = v35;
              v40 = [v39 home];
              v41 = [v40 uniqueIdentifier];
              v42 = [v19 uniqueIdentifier];
              v43 = v19;
              int v44 = [v41 isEqual:v42];

              if (v44)
              {
                uint64_t v45 = MGGroupIdentifierForAccessory(v39, v43);
                goto LABEL_23;
              }
              v57 = MGLogForCategory(1);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
LABEL_38:
                *(_DWORD *)buf = 134218754;
                v94 = v63;
                __int16 v95 = 2112;
                uint64_t v96 = (uint64_t)v40;
                __int16 v97 = 2112;
                id v98 = v39;
                __int16 v99 = 2112;
                id v19 = v61;
                id v100 = v61;
                _os_log_error_impl(&dword_229257000, v57, OS_LOG_TYPE_ERROR, "%p the home %@ from audioDestination %@ doesn't match current home %@", buf, 0x2Au);
LABEL_31:
                uint64_t v22 = v65;
                uint64_t v24 = v66;

                uint64_t v25 = v64;
                uint64_t v32 = v68;
LABEL_32:
                v49 = MGLogForCategory(1);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218498;
                  v94 = v63;
                  __int16 v95 = 2112;
                  uint64_t v96 = (uint64_t)v35;
                  __int16 v97 = 2112;
                  id v98 = v28;
                  _os_log_error_impl(&dword_229257000, v49, OS_LOG_TYPE_ERROR, "%p couldn't find accessory that the matched media destination %@ for %@. Can't add HomeTheater.", buf, 0x20u);
                }
                goto LABEL_34;
              }
LABEL_30:
              id v19 = v61;
              goto LABEL_31;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_32;
            }
            id v39 = v35;
            v40 = [v39 home];
            v46 = [v40 uniqueIdentifier];
            v47 = [v19 uniqueIdentifier];
            v43 = v19;
            int v48 = [v46 isEqual:v47];

            if (!v48)
            {
              v57 = MGLogForCategory(1);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                goto LABEL_38;
              }
              goto LABEL_30;
            }
            uint64_t v45 = MGGroupIdentifierForMediaSystemInHome(v39, v43);
LABEL_23:
            v49 = v45;
            id v19 = v43;

            uint64_t v22 = v65;
            uint64_t v24 = v66;
            uint64_t v25 = v64;
            uint64_t v32 = v68;
            if (!v49) {
              goto LABEL_32;
            }
            v92[0] = v70;
            v92[1] = v49;
            v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:2];
            id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v51 = [v33 identifier];
            v52 = [v51 UUIDString];
            [v50 setObject:v52 forKey:@"audioDestinationIdentifier"];

            id v53 = objc_alloc(MEMORY[0x263F54718]);
            v54 = [v28 name];
            id v55 = (void *)[v53 initWithClientService:v60 type:@"com.apple.media-group.home-theater" identifier:v68 name:v54 properties:v50 memberIdentifiers:v62];

            v56 = MGLogForCategory(1);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v94 = v63;
              __int16 v95 = 2112;
              uint64_t v96 = (uint64_t)v55;
              _os_log_impl(&dword_229257000, v56, OS_LOG_TYPE_DEFAULT, "%p adding home theater %@", buf, 0x16u);
            }

            [v67 addGroup:v55];
            uint64_t v22 = v65;
            uint64_t v24 = v66;
            uint64_t v25 = v64;
            uint64_t v32 = v68;
LABEL_34:
          }
          uint64_t v26 = v69;
        }
        ++v27;
      }
      while (v24 != v27);
      uint64_t v58 = [v22 countByEnumeratingWithState:&v71 objects:v101 count:16];
      uint64_t v24 = v58;
    }
    while (v58);
  }
}

uint64_t __31__MGDaemon__ingestHomeKitHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addHomeKitAccessoryWithoutHomeIngestion:a2 fromHome:*(void *)(a1 + 40)];
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F54728];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithClientService:*(void *)(a1 + 32) mediaSystem:v4 home:*(void *)(a1 + 40)];

  uint64_t v6 = MGLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 134218242;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p adding media system %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 56) addGroup:v5];
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F54730];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithClientService:*(void *)(a1 + 32) room:v4 home:*(void *)(a1 + 40)];

  uint64_t v6 = MGLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 134218242;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p adding room %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 56) addGroup:v5];
}

void __31__MGDaemon__ingestHomeKitHome___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F54750];
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithClientService:*(void *)(a1 + 32) zone:v4 home:*(void *)(a1 + 40)];

  uint64_t v6 = MGLogForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 134218242;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p adding zone %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 56) addGroup:v5];
}

- (void)addHomeKitHome:(id)a3
{
  id v4 = a3;
  id v6 = [(MGDaemon *)self homekitGroupsMediator];
  uint64_t v5 = [v6 startActivityWithName:@"Add HomeKit Home"];
  [(MGDaemon *)self _ingestHomeKitHome:v4];

  [v6 endActivity:v5];
}

- (void)removeHomeKitHome:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MGGroupIdentifierForHomeInHome(v4, v4);
  id v6 = MGLogForCategory(1);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218242;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_229257000, v7, OS_LOG_TYPE_DEFAULT, "%p removing home %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v7 = [(MGDaemon *)self homekitGroupsMediator];
    [v7 removeGroupWithIdentifier:v5];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p no home identifier for %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)addHomeKitZone:(id)a3 fromHome:(id)a4
{
  id v5 = a4;
  id v7 = [(MGDaemon *)self homekitGroupsMediator];
  id v6 = [v7 startActivityWithName:@"Add HomeKit Zone"];
  [(MGDaemon *)self _ingestHomeKitHome:v5];

  [v7 endActivity:v6];
}

- (void)removeHomeKitZone:(id)a3 fromHome:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = MGGroupIdentifierForZoneInHome(v6, a4);
  int v8 = MGLogForCategory(1);
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      id v11 = self;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p removing zone %@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = [(MGDaemon *)self homekitGroupsMediator];
    [v9 removeGroupWithIdentifier:v7];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134218242;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_error_impl(&dword_229257000, v9, OS_LOG_TYPE_ERROR, "%p no zone identifier for %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)addHomeKitRoom:(id)a3 fromHome:(id)a4
{
  id v5 = a4;
  id v7 = [(MGDaemon *)self homekitGroupsMediator];
  id v6 = [v7 startActivityWithName:@"Add HomeKit Room"];
  [(MGDaemon *)self _ingestHomeKitHome:v5];

  [v7 endActivity:v6];
}

- (void)removeHomeKitRoom:(id)a3 fromHome:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = MGGroupIdentifierForRoomInHome(v6, a4);
  int v8 = MGLogForCategory(1);
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      id v11 = self;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p removing room %@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = [(MGDaemon *)self homekitGroupsMediator];
    [v9 removeGroupWithIdentifier:v7];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134218242;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_error_impl(&dword_229257000, v9, OS_LOG_TYPE_ERROR, "%p no room identifier for %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)addHomeKitMediaSystem:(id)a3 fromHome:(id)a4
{
  id v5 = a4;
  id v7 = [(MGDaemon *)self homekitGroupsMediator];
  id v6 = [v7 startActivityWithName:@"Add HomeKit Media System"];
  [(MGDaemon *)self _ingestHomeKitHome:v5];

  [v7 endActivity:v6];
}

- (void)removeHomeKitMediaSystem:(id)a3 fromHome:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGDaemon *)self homekitGroupsMediator];
  uint64_t v9 = [v8 startActivityWithName:@"Remove HomeKit Media System"];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  if ([v6 supportsAudioDestination])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__MGDaemon_removeHomeKitMediaSystem_fromHome___block_invoke;
    v17[3] = &unk_26485EDE8;
    void v17[4] = &v18;
    [(MGDaemon *)self _homeTheaterGroupIdentifierForAudioDestination:v6 fromHome:v7 completion:v17];
  }
  uint64_t v10 = v19[5];
  id v11 = MGLogForCategory(1);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = (void *)v19[5];
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_229257000, v11, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@ since media system %@ was part of it", buf, 0x20u);
    }

    [v8 removeGroupWithIdentifier:v19[5]];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_229257000, v11, OS_LOG_TYPE_DEFAULT, "%p no home theater identifier for %@", buf, 0x16u);
    }
  }
  uint64_t v14 = MGGroupIdentifierForMediaSystemInHome(v6, v7);
  id v15 = MGLogForCategory(1);
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_229257000, v16, OS_LOG_TYPE_DEFAULT, "%p removing media system %@", buf, 0x16u);
    }

    [v8 removeGroupWithIdentifier:v14];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_229257000, v16, OS_LOG_TYPE_ERROR, "%p no media system identifier for %@", buf, 0x16u);
    }
  }
  [v8 endActivity:v9];

  _Block_object_dispose(&v18, 8);
}

void __46__MGDaemon_removeHomeKitMediaSystem_fromHome___block_invoke(uint64_t a1, void *a2)
{
}

- (void)addHomeKitMediaSystem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  [(MGDaemon *)self addHomeKitMediaSystem:v4 fromHome:v5];
}

- (void)removeHomeKitMediaSystem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  [(MGDaemon *)self removeHomeKitMediaSystem:v4 fromHome:v5];
}

- (void)addHomeKitAccessory:(id)a3 fromHome:(id)a4
{
  id v5 = a4;
  id v7 = [(MGDaemon *)self homekitGroupsMediator];
  id v6 = [v7 startActivityWithName:@"Add HomeKit Accessory"];
  [(MGDaemon *)self _ingestHomeKitHome:v5];

  [v7 endActivity:v6];
}

- (void)_addHomeKitAccessoryWithoutHomeIngestion:(id)a3 fromHome:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGDaemon *)self serviceForIngestion];
  uint64_t v9 = MGGroupIdentifierForAccessory(v6, v7);

  uint64_t v10 = (objc_class *)MGClassForGroupIdentifier(v9);
  if (v10)
  {
    id v11 = v10;
    BOOL v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v13 = [v6 deviceIdentifier];
    if (v13)
    {
      [v12 setObject:v13 forKey:@"deviceIdentifier"];
    }
    else
    {
      uint64_t v14 = [v6 uniqueIdentifier];
      id v15 = [v14 UUIDString];
      [v12 setObject:v15 forKey:@"deviceIdentifier"];
    }
    if ((objc_class *)objc_opt_class() == v11)
    {
      id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "homePodVariant"));
      [v12 setObject:v16 forKey:@"HomePodVariant"];

      id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "productColor"));
      [v12 setObject:v17 forKey:@"productColor"];
    }
    id v18 = [v11 alloc];
    id v19 = [(objc_class *)v11 type];
    uint64_t v20 = [v6 name];
    id v21 = (void *)[v18 initWithClientService:v8 type:v19 identifier:v9 name:v20 properties:v12 memberIdentifiers:MEMORY[0x263EFFA68]];

    uint64_t v22 = MGLogForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218242;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl(&dword_229257000, v22, OS_LOG_TYPE_DEFAULT, "%p adding accessory %@", (uint8_t *)&v26, 0x16u);
    }

    if ([v6 isCurrentAccessory])
    {
      id v23 = [(MGDaemon *)self queryAgent];
      uint64_t v24 = [v21 identifier];
      [v23 setCurrentDeviceIdentifier:v24];
    }
    uint64_t v25 = [(MGDaemon *)self homekitGroupsMediator];
    [v25 addGroup:v21];
  }
  else
  {
    BOOL v12 = MGLogForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218242;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_229257000, v12, OS_LOG_TYPE_DEFAULT, "%p no accessory class for %@", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (void)removeHomeKitAccessory:(id)a3 fromHome:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MGDaemon *)self homekitGroupsMediator];
  uint64_t v9 = [v8 startActivityWithName:@"Remove HomeKit Accessory"];
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__6;
  id v29 = __Block_byref_object_dispose__6;
  id v30 = 0;
  uint64_t v10 = [v6 audioDestinationController];
  if (v10
    && ([v6 category],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 categoryType],
        BOOL v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:*MEMORY[0x263F0B030]],
        v12,
        v11,
        v13))
  {
    uint64_t v14 = MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v6, v7);
    id v15 = (void *)v26[5];
    v26[5] = v14;
  }
  else if ([v6 supportsAudioDestination])
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __44__MGDaemon_removeHomeKitAccessory_fromHome___block_invoke;
    v24[3] = &unk_26485EDE8;
    v24[4] = &v25;
    [(MGDaemon *)self _homeTheaterGroupIdentifierForAudioDestination:v6 fromHome:v7 completion:v24];
  }
  uint64_t v16 = v26[5];
  id v17 = MGLogForCategory(1);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      id v19 = (void *)v26[5];
      *(_DWORD *)buf = 134218498;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v19;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_229257000, v17, OS_LOG_TYPE_DEFAULT, "%p removing home theater %@ since accessory %@ was part of it", buf, 0x20u);
    }

    [v8 removeGroupWithIdentifier:v26[5]];
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_229257000, v17, OS_LOG_TYPE_DEFAULT, "%p no home theater identifier for %@", buf, 0x16u);
    }
  }
  uint64_t v20 = MGGroupIdentifierForAccessory(v6, v7);
  id v21 = MGLogForCategory(1);
  uint64_t v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl(&dword_229257000, v22, OS_LOG_TYPE_DEFAULT, "%p removing accessory %@", buf, 0x16u);
    }

    if ([v6 isCurrentAccessory])
    {
      id v23 = [(MGDaemon *)self queryAgent];
      [v23 setCurrentDeviceIdentifier:0];
    }
    [v8 removeGroupWithIdentifier:v20];
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_error_impl(&dword_229257000, v22, OS_LOG_TYPE_ERROR, "%p no accessory identifier for %@", buf, 0x16u);
    }
  }
  [v8 endActivity:v9];

  _Block_object_dispose(&v25, 8);
}

void __44__MGDaemon_removeHomeKitAccessory_fromHome___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_homeTheaterGroupIdentifierForAudioDestination:(id)a3 fromHome:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  uint64_t v10 = [v7 audioDestinationIdentifier];
  if (v10)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__6;
    uint64_t v20 = __Block_byref_object_dispose__6;
    id v21 = 0;
    id v11 = [v8 accessories];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__MGDaemon__homeTheaterGroupIdentifierForAudioDestination_fromHome_completion___block_invoke;
    v12[3] = &unk_26485EE10;
    id v13 = v10;
    id v15 = &v16;
    id v14 = v8;
    [v11 enumerateObjectsUsingBlock:v12];

    v9[2](v9, v17[5]);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9[2](v9, 0);
  }
}

void __79__MGDaemon__homeTheaterGroupIdentifierForAudioDestination_fromHome_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [v15 audioDestinationController];
  id v7 = [v6 destination];
  id v8 = [v7 audioDestinationIdentifier];

  if (v6)
  {
    uint64_t v9 = [v15 category];
    uint64_t v10 = [v9 categoryType];
    if ([v10 isEqualToString:*MEMORY[0x263F0B030]])
    {
      int v11 = [v8 isEqualToString:*(void *)(a1 + 32)];

      if (v11)
      {
        uint64_t v12 = MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(v15, *(void **)(a1 + 40));
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        *a4 = 1;
      }
    }
    else
    {
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = MGLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v23 = self;
    __int16 v24 = 1024;
    int v25 = [v7 processIdentifier];
    _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p received new connection from %d", buf, 0x12u);
  }

  uint64_t v9 = [(MGDaemon *)self listenerProvider];
  int v10 = [v9 serviceShouldAcceptNewConnection:v7];
  if (v10)
  {
    MGSetServiceXPCInterfacesOnConnection(v7, 1);
    [v7 setExportedObject:self];
    int v11 = [(MGDaemon *)self dispatchQueue];
    [v7 _setQueue:v11];

    uint64_t v12 = [[MGServiceClient alloc] initWithConnection:v7];
    uint64_t v13 = [(MGDaemon *)self clients];
    [v13 addClientService:v12];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v12);
    objc_initWeak(&from, v7);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_26485EE60;
    objc_copyWeak(&v17, (id *)buf);
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    id v14 = (void *)MEMORY[0x22A6B39E0](v16);
    [v7 setInterruptionHandler:v14];
    [v7 setInvalidationHandler:v14];
    [v7 resume];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  return v10;
}

void __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = objc_loadWeakRetained(a1 + 5);
  id v4 = objc_loadWeakRetained(a1 + 6);
  id v5 = v4;
  if (WeakRetained && v3 && v4)
  {
    id v6 = MGLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      int v12 = [v5 processIdentifier];
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "Service %p lost connection from %d", buf, 0x12u);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke_131;
    v8[3] = &unk_26485EE38;
    void v8[4] = WeakRetained;
    [v3 enumerateQueriesUsingBlock:v8];
    id v7 = [WeakRetained clients];
    [v7 removeClientService:v3];
  }
}

uint64_t __47__MGDaemon_listener_shouldAcceptNewConnection___block_invoke_131(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopQuery:a2];
}

- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *, void *))a6;
  id v14 = [MEMORY[0x263F08D68] currentConnection];
  id v15 = v14;
  if (v14)
  {
    uint64_t v16 = objc_getAssociatedObject(v14, "com.apple.MediaGroups.ClientService");
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (qword_26830F550 != -1) {
    dispatch_once(&qword_26830F550, &__block_literal_global_134);
  }
  uint64_t v17 = [(id)_MergedGlobals_1 objectForKey:v10];
  if (v17)
  {
    id v18 = (void *)v17;
    id v51 = v10;
    id v19 = self;
    v46 = v16;
    v47 = v15;
    int v48 = v13;
    id v20 = v11;
    id v21 = (void *)MEMORY[0x263F546E0];
    uint64_t v22 = [MEMORY[0x263F08C38] UUID];
    uint64_t v50 = [v21 groupIdentifierWithUUID:v22];

    id v23 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v49 = v12;
    id v24 = v12;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        uint64_t v28 = 0;
        id v29 = v23;
        do
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v24);
          }
          id v30 = [*(id *)(*((void *)&v52 + 1) + 8 * v28) identifier];
          id v23 = [v29 arrayByAddingObject:v30];

          ++v28;
          id v29 = v23;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v26);
    }

    int v31 = (void *)v50;
    id v11 = v20;
    uint64_t v32 = [v18 validateGroupSpecificationWithType:v51 identifier:v50 name:v20 properties:0 members:v24];
    if (v32)
    {
      __int16 v33 = MGLogForCategory(3);
      uint64_t v16 = v46;
      id v15 = v47;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v57 = v19;
        __int16 v58 = 2112;
        v59 = v32;
        _os_log_error_impl(&dword_229257000, v33, OS_LOG_TYPE_ERROR, "%p group validation failed: %@", buf, 0x16u);
      }

      id v34 = v32;
      __int16 v35 = 0;
      id v12 = v49;
    }
    else
    {
      id v42 = objc_alloc((Class)v18);
      uint64_t v16 = v46;
      id v15 = v47;
      if (v46) {
        uint64_t v43 = [v42 initWithClientService:v46 type:v51 identifier:v50 name:v11 properties:0 memberIdentifiers:v23];
      }
      else {
        uint64_t v43 = [v42 initWithConnectionProvider:0 type:v51 identifier:v50 name:v11 properties:0 memberIdentifiers:v23];
      }
      __int16 v35 = (void *)v43;
      id v12 = v49;
      int v44 = [(MGDaemon *)v19 localGroupsMediator];
      [v44 addGroup:v35];

      uint64_t v45 = MGLogForCategory(3);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v57 = v19;
        __int16 v58 = 2048;
        v59 = v35;
        _os_log_impl(&dword_229257000, v45, OS_LOG_TYPE_DEFAULT, "%p creation complete for %p", buf, 0x16u);
      }

      int v31 = (void *)v50;
    }

    uint64_t v13 = v48;
    id v10 = v51;
  }
  else
  {
    uint64_t v36 = [(id)qword_26830F548 objectForKey:v10];
    uint64_t v37 = MGLogForCategory(3);
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        *(_DWORD *)buf = 134217984;
        v57 = self;
        _os_log_error_impl(&dword_229257000, v37, OS_LOG_TYPE_ERROR, "%p group type creation not allowed", buf, 0xCu);
      }

      id v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F546B8];
      uint64_t v41 = 1;
    }
    else
    {
      if (v38)
      {
        *(_DWORD *)buf = 134217984;
        v57 = self;
        _os_log_error_impl(&dword_229257000, v37, OS_LOG_TYPE_ERROR, "%p group type creation not supported", buf, 0xCu);
      }

      id v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F546B8];
      uint64_t v41 = 2;
    }
    uint64_t v32 = [v39 errorWithDomain:v40 code:v41 userInfo:0];
    __int16 v35 = 0;
  }
  v13[2](v13, v35, v32);
}

void __56__MGDaemon_createGroupWithType_name_members_completion___block_invoke()
{
  v15[11] = *MEMORY[0x263EF8340];
  v0 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = MEMORY[0x263EFFA78];

  uint64_t v13 = [MEMORY[0x263F54740] type];
  v14[0] = v13;
  v15[0] = objc_opt_class();
  id v12 = [MEMORY[0x263F54708] type];
  v14[1] = v12;
  v15[1] = objc_opt_class();
  v1 = [MEMORY[0x263F546C0] type];
  v14[2] = v1;
  v15[2] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x263F54748] type];
  v14[3] = v2;
  v15[3] = objc_opt_class();
  id v3 = [MEMORY[0x263F546C8] type];
  v14[4] = v3;
  v15[4] = objc_opt_class();
  id v4 = [MEMORY[0x263F54728] type];
  v14[5] = v4;
  v15[5] = objc_opt_class();
  id v5 = [MEMORY[0x263F54730] type];
  v14[6] = v5;
  v15[6] = objc_opt_class();
  id v6 = [MEMORY[0x263F54750] type];
  v14[7] = v6;
  v15[7] = objc_opt_class();
  id v7 = [MEMORY[0x263F546F8] type];
  v14[8] = v7;
  v15[8] = objc_opt_class();
  id v8 = [MEMORY[0x263F546D0] type];
  v14[9] = v8;
  v15[9] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x263F54718] type];
  v14[10] = v9;
  v15[10] = objc_opt_class();
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:11];
  id v11 = (void *)qword_26830F548;
  qword_26830F548 = v10;
}

- (void)deleteGroup:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = deleteGroup_completion__onceToken;
  id v8 = a3;
  if (v7 != -1) {
    dispatch_once(&deleteGroup_completion__onceToken, &__block_literal_global_143);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__MGDaemon_deleteGroup_completion___block_invoke_2;
  v10[3] = &unk_26485EE88;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(MGDaemon *)self _fetchGroupInfo:v8 completion:v10];
}

void __35__MGDaemon_deleteGroup_completion___block_invoke()
{
  v15[11] = *MEMORY[0x263EF8340];
  v0 = (void *)qword_26830F558;
  qword_26830F558 = MEMORY[0x263EFFA78];

  uint64_t v13 = [MEMORY[0x263F54740] type];
  v14[0] = v13;
  v15[0] = objc_opt_class();
  id v12 = [MEMORY[0x263F54708] type];
  v14[1] = v12;
  v15[1] = objc_opt_class();
  v1 = [MEMORY[0x263F546C0] type];
  v14[2] = v1;
  v15[2] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x263F54748] type];
  v14[3] = v2;
  v15[3] = objc_opt_class();
  id v3 = [MEMORY[0x263F546C8] type];
  v14[4] = v3;
  v15[4] = objc_opt_class();
  id v4 = [MEMORY[0x263F54728] type];
  v14[5] = v4;
  v15[5] = objc_opt_class();
  id v5 = [MEMORY[0x263F54730] type];
  v14[6] = v5;
  v15[6] = objc_opt_class();
  id v6 = [MEMORY[0x263F54750] type];
  v14[7] = v6;
  v15[7] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x263F546F8] type];
  v14[8] = v7;
  v15[8] = objc_opt_class();
  id v8 = [MEMORY[0x263F546D0] type];
  v14[9] = v8;
  v15[9] = objc_opt_class();
  id v9 = [MEMORY[0x263F54718] type];
  v14[10] = v9;
  v15[10] = objc_opt_class();
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:11];
  id v11 = (void *)qword_26830F560;
  qword_26830F560 = v10;
}

void __35__MGDaemon_deleteGroup_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  objc_initWeak(&location, a4);
  id v11 = a5;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = MGLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p failed to fetch group for deletion %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!v9)
  {
    id v14 = MGLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v18;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p failed to find group for deletion", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v16 = objc_loadWeakRetained(&location);
  id v14 = v16;
  if (!v16)
  {
    id v19 = MGLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v25;
      _os_log_error_impl(&dword_229257000, v19, OS_LOG_TYPE_ERROR, "%p failed to find source for deletion", buf, 0xCu);
    }

    id v14 = 0;
LABEL_14:
    id v13 = 0;
    goto LABEL_27;
  }
  if ([v16 allowsClientEdits])
  {
    uint64_t v17 = [(id)objc_opt_class() type];
    if ([(id)qword_26830F558 objectForKey:v17])
    {
      [v14 removeGroup:v9];
      id v13 = 0;
    }
    else
    {
      uint64_t v21 = [(id)qword_26830F560 objectForKey:v17];
      uint64_t v22 = MGLogForCategory(3);
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (v21)
      {
        if (v23)
        {
          uint64_t v27 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          uint64_t v31 = v27;
          _os_log_error_impl(&dword_229257000, v22, OS_LOG_TYPE_ERROR, "%p group type deletion not allowed", buf, 0xCu);
        }
        uint64_t v24 = 7;
      }
      else
      {
        if (v23)
        {
          uint64_t v28 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          uint64_t v31 = v28;
          _os_log_error_impl(&dword_229257000, v22, OS_LOG_TYPE_ERROR, "%p group type deletion not supported", buf, 0xCu);
        }
        uint64_t v24 = 2;
      }

      id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F546B8] code:v24 userInfo:0];
    }
  }
  else
  {
    id v20 = MGLogForCategory(3);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v26;
      _os_log_error_impl(&dword_229257000, v20, OS_LOG_TYPE_ERROR, "%p deletion not allowed by group source", buf, 0xCu);
    }

    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F546B8] code:9 userInfo:0];
  }
LABEL_27:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_destroyWeak(&location);
}

- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v36 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void *, void *))a9;
  if (qword_26830F578 != -1) {
    dispatch_once(&qword_26830F578, &__block_literal_global_146);
  }
  uint64_t v21 = [(id)qword_26830F568 objectForKey:v15];
  if (!v21)
  {
    uint64_t v31 = MGLogForCategory(3);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      BOOL v38 = self;
      __int16 v39 = 2112;
      id v40 = v15;
      _os_log_error_impl(&dword_229257000, v31, OS_LOG_TYPE_ERROR, "%p group type %@ not supported", buf, 0x16u);
    }

    __int16 v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F546B8];
    uint64_t v34 = 2;
    goto LABEL_14;
  }
  uint64_t v22 = (objc_class *)v21;
  BOOL v23 = [(id)qword_26830F570 objectForKey:v15];
  int v24 = [v23 isEqualToString:v17];

  if (!v24)
  {
    __int16 v35 = MGLogForCategory(3);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      BOOL v38 = self;
      __int16 v39 = 2112;
      id v40 = v17;
      _os_log_error_impl(&dword_229257000, v35, OS_LOG_TYPE_ERROR, "%p accessory category %@ is not supported", buf, 0x16u);
    }

    __int16 v32 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F546B8];
    uint64_t v34 = 3;
LABEL_14:
    id v30 = [v32 errorWithDomain:v33 code:v34 userInfo:0];
    uint64_t v27 = 0;
    goto LABEL_15;
  }
  uint64_t v25 = MGGroupIdentifierForAccessoryIdentifierInHome(v36, v16, v17);
  id v26 = [v22 alloc];
  uint64_t v27 = (void *)[v26 initWithConnectionProvider:0 type:v15 identifier:v25 name:v18 properties:v19 memberIdentifiers:MEMORY[0x263EFFA68]];
  uint64_t v28 = [(MGDaemon *)self localGroupsMediator];
  [v28 addGroup:v27];

  id v29 = MGLogForCategory(3);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    BOOL v38 = self;
    __int16 v39 = 2112;
    id v40 = v27;
    _os_log_impl(&dword_229257000, v29, OS_LOG_TYPE_DEFAULT, "%p completed accessory %@", buf, 0x16u);
  }

  id v30 = 0;
LABEL_15:
  v20[2](v20, v27, v30);
}

void __110__MGDaemon_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke()
{
  v13[3] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F54708] type];
  v12[0] = v0;
  v13[0] = objc_opt_class();
  v1 = [MEMORY[0x263F54748] type];
  v12[1] = v1;
  v13[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x263F546C8] type];
  v12[2] = v2;
  v13[2] = objc_opt_class();
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  id v4 = (void *)qword_26830F568;
  qword_26830F568 = v3;

  id v5 = [MEMORY[0x263F54708] type];
  v10[0] = v5;
  v11[0] = *MEMORY[0x263F0B0A0];
  id v6 = [MEMORY[0x263F54748] type];
  v10[1] = v6;
  v11[1] = *MEMORY[0x263F0B130];
  uint64_t v7 = [MEMORY[0x263F546C8] type];
  v10[2] = v7;
  v11[2] = *MEMORY[0x263F0B038];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v9 = (void *)qword_26830F570;
  qword_26830F570 = v8;
}

- (void)setName:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__MGDaemon_setName_group_completion___block_invoke;
  v14[3] = &unk_26485EEB0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(MGDaemon *)self _fetchGroupInfo:v13 completion:v14];
}

void __37__MGDaemon_setName_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    id v13 = MGLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v20 = 134218242;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for rename %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    id v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    id v14 = MGLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v20 = 134217984;
      uint64_t v21 = v18;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p rename not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F546B8] code:4 userInfo:0];
    goto LABEL_9;
  }
  id v15 = *(id *)(a1 + 40);
  id v16 = MGLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 134217984;
    uint64_t v21 = v19;
    _os_log_error_impl(&dword_229257000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for rename", (uint8_t *)&v20, 0xCu);
  }

  id v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__MGDaemon_addMember_group_completion___block_invoke;
  v14[3] = &unk_26485EEB0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(MGDaemon *)self _fetchGroupInfo:v13 completion:v14];
}

void __39__MGDaemon_addMember_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    id v13 = MGLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v20 = 134218242;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for adding member %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    id v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    id v14 = MGLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v20 = 134217984;
      uint64_t v21 = v18;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p adding members not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F546B8] code:6 userInfo:0];
    goto LABEL_9;
  }
  id v15 = *(id *)(a1 + 40);
  id v16 = MGLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 134217984;
    uint64_t v21 = v19;
    _os_log_error_impl(&dword_229257000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for adding member", (uint8_t *)&v20, 0xCu);
  }

  id v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__MGDaemon_removeMember_group_completion___block_invoke;
  v14[3] = &unk_26485EEB0;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(MGDaemon *)self _fetchGroupInfo:v13 completion:v14];
}

void __42__MGDaemon_removeMember_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    id v13 = MGLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v20 = 134218242;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p failed to fetch group for removing member %@", (uint8_t *)&v20, 0x16u);
    }

LABEL_9:
    id v15 = 0;
    goto LABEL_10;
  }
  if (v8)
  {
    id v14 = MGLogForCategory(3);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v20 = 134217984;
      uint64_t v21 = v18;
      _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p removing members not allowed by group type", (uint8_t *)&v20, 0xCu);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F546B8] code:6 userInfo:0];
    goto LABEL_9;
  }
  id v15 = *(id *)(a1 + 40);
  id v16 = MGLogForCategory(3);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 134217984;
    uint64_t v21 = v19;
    _os_log_error_impl(&dword_229257000, v16, OS_LOG_TYPE_ERROR, "%p failed to find group for removing member", (uint8_t *)&v20, 0xCu);
  }

  id v12 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)startQueryWithPredicate:(id)a3 completion:(id)a4
{
  v33[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = a4;
  uint64_t v7 = [MEMORY[0x263F08D68] currentConnection];
  id v8 = [(MGDaemon *)self clients];
  uint64_t v28 = [v8 serviceClientForXPCConnection:v7];

  [v6 allowEvaluation];
  id v9 = [v7 valueForEntitlement:@"com.apple.MediaGroups.groups"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v9 = (void *)MEMORY[0x263EFFA68];
    }
  }
  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    for (unint64_t i = 0; i < v11; ++i)
    {
      id v13 = [v9 objectAtIndex:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        id v15 = (void *)[v9 mutableCopy];
        [v15 removeObjectAtIndex:i];

        ++i;
        id v9 = v15;
      }
    }
  }
  id v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.type IN %@", v9];
  uint64_t v17 = (void *)MEMORY[0x263F08730];
  v33[0] = v16;
  v33[1] = v6;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  uint64_t v19 = [v17 andPredicateWithSubpredicates:v18];

  int v20 = [[MGOutstandingQuery alloc] initWithPredicate:v19];
  uint64_t v21 = [(MGOutstandingQuery *)v20 identifier];
  __int16 v22 = [(MGDaemon *)self topologyRequestHandler];
  if ([(MGOutstandingQuery *)v20 requiresTopology] && v22)
  {
    id v23 = MGLogForCategory(3);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v30 = self;
      __int16 v31 = 2112;
      __int16 v32 = v21;
      _os_log_debug_impl(&dword_229257000, v23, OS_LOG_TYPE_DEBUG, "%p requesting topology for query %@", buf, 0x16u);
    }

    v22[2](v22);
  }
  [v28 addQuery:v20];
  uint64_t v24 = MGLogForCategory(3);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v30 = self;
    __int16 v31 = 2112;
    __int16 v32 = v21;
    _os_log_impl(&dword_229257000, v24, OS_LOG_TYPE_DEFAULT, "%p starting query %@", buf, 0x16u);
  }

  (*((void (**)(id, void *, void, void))v27 + 2))(v27, v21, 0, 0);
  uint64_t v25 = [(MGDaemon *)self queryAgent];
  [v25 addOutstandingQuery:v20];

  id v26 = [(MGDaemon *)self remoteQueryClient];
  [v26 addOutstandingQuery:v20];
}

- (void)stopQuery:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08D68];
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = a3;
  id v12 = [v6 currentConnection];
  id v9 = [(MGDaemon *)self clients];
  uint64_t v10 = [v9 serviceClientForXPCConnection:v12];

  unint64_t v11 = [v10 outstandingQueryForIdentifier:v8];

  [(MGDaemon *)self stopQuery:v11];
  [v10 removeQuery:v11];
  v7[2](v7, 0);
}

- (void)stopQuery:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(MGDaemon *)self queryAgent];
  [v6 removeOutstandingQuery:v4];

  uint64_t v7 = [(MGDaemon *)self remoteQueryClient];
  [v7 removeOutstandingQuery:v4];

  id v8 = MGLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_229257000, v8, OS_LOG_TYPE_DEFAULT, "%p stopped query %@", (uint8_t *)&v9, 0x16u);
  }
}

- (id)startInternalQueryWithPredicate:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MGDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [[MGOutstandingQuery alloc] initWithPredicate:v7];
  uint64_t v10 = [(MGOutstandingQuery *)v9 identifier];
  __int16 v11 = [(MGDaemon *)self topologyRequestHandler];
  if ([(MGOutstandingQuery *)v9 requiresTopology]) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = MGLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134218242;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_debug_impl(&dword_229257000, v13, OS_LOG_TYPE_DEBUG, "%p requesting topology for local query %@", (uint8_t *)&v20, 0x16u);
    }

    v11[2](v11);
  }
  id v14 = MGLogForCategory(3);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218242;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_229257000, v14, OS_LOG_TYPE_DEFAULT, "%p starting internal query %@", (uint8_t *)&v20, 0x16u);
  }

  id v15 = [(MGDaemon *)self internalQueries];
  id v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = (void *)MEMORY[0x22A6B39E0](v6);
  [v16 setObject:v17 forKey:v10];

  [(MGDaemon *)self setInternalQueries:v16];
  uint64_t v18 = [(MGDaemon *)self queryAgent];
  [v18 addOutstandingQuery:v9];

  return v9;
}

- (void)stopInternalQuery:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 identifier];
  id v7 = [(MGDaemon *)self queryAgent];
  [v7 removeOutstandingQuery:v4];

  id v8 = [(MGDaemon *)self internalQueries];
  int v9 = (void *)[v8 mutableCopy];

  [v9 removeObjectForKey:v6];
  [(MGDaemon *)self setInternalQueries:v9];
  uint64_t v10 = MGLogForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    BOOL v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p stopped internal query %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_fetchGroupInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MGDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__6;
  uint64_t v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  int v9 = [MEMORY[0x263F546D0] predicateForGroup:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__MGDaemon__fetchGroupInfo_completion___block_invoke;
  v14[3] = &unk_26485EF00;
  objc_copyWeak(&v19, &location);
  uint64_t v18 = &v20;
  id v10 = v6;
  id v15 = v10;
  id v16 = self;
  id v11 = v7;
  id v17 = v11;
  uint64_t v12 = [(MGDaemon *)self startInternalQueryWithPredicate:v9 handler:v14];
  __int16 v13 = (void *)v21[5];
  void v21[5] = v12;

  objc_destroyWeak(&v19);
  _Block_object_dispose(&v20, 8);

  objc_destroyWeak(&location);
}

void __39__MGDaemon__fetchGroupInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained stopInternalQuery:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    id location = 0;
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__6;
    uint64_t v43 = __Block_byref_object_dispose__6;
    id v44 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__6;
    uint64_t v37 = __Block_byref_object_dispose__6;
    id v38 = 0;
    if (v6)
    {
      id v11 = v6;
      id v38 = v11;
      uint64_t v12 = MGLogForCategory(3);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      id v23 = "%p failed to internally fetch group %@";
    }
    else
    {
      if ([v5 count])
      {
        id v15 = [v5 firstObject];
        id v17 = [v15 group];
        uint64_t v18 = [v15 mediator];
        objc_storeWeak(&location, v18);

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v47 = __Block_byref_object_copy__6;
        int v48 = __Block_byref_object_dispose__6;
        id v49 = 0;
        uint64_t v24 = [v17 predicateForMembers];
        id v19 = *(void **)(a1 + 40);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __39__MGDaemon__fetchGroupInfo_completion___block_invoke_159;
        v25[3] = &unk_26485EED8;
        objc_copyWeak(&v31, (id *)(a1 + 64));
        uint64_t v28 = buf;
        id v29 = &v33;
        id v30 = &v39;
        id v27 = *(id *)(a1 + 48);
        id v16 = v17;
        id v26 = v16;
        objc_copyWeak(&v32, &location);
        uint64_t v20 = [v19 startInternalQueryWithPredicate:v24 handler:v25];
        uint64_t v21 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v20;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        _Block_object_dispose(buf, 8);

        goto LABEL_7;
      }
      uint64_t v12 = MGLogForCategory(3);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_4:

        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = v40[5];
        id v15 = objc_loadWeakRetained(&location);
        (*(void (**)(uint64_t, void, uint64_t, void *, uint64_t))(v13 + 16))(v13, 0, v14, v15, v34[5]);
        id v16 = 0;
LABEL_7:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v39, 8);

        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      id v23 = "%p failed to internally find group %@";
    }
    _os_log_error_impl(&dword_229257000, v12, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_4;
  }
LABEL_8:
}

void __39__MGDaemon__fetchGroupInfo_completion___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained stopInternalQuery:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
      id v11 = MGLogForCategory(3);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        id v30 = v8;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_error_impl(&dword_229257000, v11, OS_LOG_TYPE_ERROR, "%p failed to internally fetch group members %@", buf, 0x16u);
      }
    }
    else
    {
      id v11 = [MEMORY[0x263EFF980] array];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "group", (void)v24);
            [v11 addObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v14);
      }

      uint64_t v18 = [v11 count];
      if (v18)
      {
        id v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
      }
      else
      {
        id v19 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v19);
      if (v18) {
    }
      }
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v23 = objc_loadWeakRetained((id *)(a1 + 80));
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v20 + 16))(v20, v21, v22, v23, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
}

- (void)startOutstandingQueryWithPredicate:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke;
  v21[3] = &unk_26485EF28;
  id v22 = v9;
  id v11 = v9;
  id v12 = (void *)MEMORY[0x22A6B39E0](v21);
  uint64_t v13 = [(MGDaemon *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke_2;
  block[3] = &unk_26485EF50;
  void block[4] = self;
  id v18 = v8;
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v8;
  dispatch_async(v13, block);
}

void __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "group", (void)v15);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    id v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
  }
  else
  {
    id v14 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__MGDaemon_startOutstandingQueryWithPredicate_handler_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startInternalQueryWithPredicate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)stopOutstandingQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(MGDaemon *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__MGDaemon_stopOutstandingQuery___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __33__MGDaemon_stopOutstandingQuery___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopInternalQuery:*(void *)(a1 + 40)];
}

- (void)setServiceForIngestion:(id)a3
{
}

- (MGServiceListenerProvider)listenerProvider
{
  return self->_listenerProvider;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (MGServiceClientSet)clients
{
  return self->_clients;
}

- (MGGroupsMediator)localGroupsMediator
{
  return self->_localGroupsMediator;
}

- (MGGroupsMediator)homekitGroupsMediator
{
  return self->_homekitGroupsMediator;
}

- (NSDictionary)internalQueries
{
  return self->_internalQueries;
}

- (void)setInternalQueries:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)topologyRequestHandler
{
  return self->_topologyRequestHandler;
}

- (MGGroupsQueryAgent)queryAgent
{
  return self->_queryAgent;
}

- (MGRemoteQueryServerManager)remoteQueryServer
{
  return self->_remoteQueryServer;
}

- (MGRemoteQueryClientManager)remoteQueryClient
{
  return self->_remoteQueryClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteQueryClient, 0);
  objc_storeStrong((id *)&self->_remoteQueryServer, 0);
  objc_storeStrong((id *)&self->_queryAgent, 0);
  objc_storeStrong(&self->_topologyRequestHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_internalQueries, 0);
  objc_storeStrong((id *)&self->_homekitGroupsMediator, 0);
  objc_storeStrong((id *)&self->_localGroupsMediator, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listenerProvider, 0);
  objc_storeStrong((id *)&self->_serviceForIngestion, 0);
}

@end