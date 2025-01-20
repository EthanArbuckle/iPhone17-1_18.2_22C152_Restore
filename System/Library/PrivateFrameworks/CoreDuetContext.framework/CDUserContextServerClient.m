@interface CDUserContextServerClient
@end

@implementation CDUserContextServerClient

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_135_0];
  v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_136;
  v6[3] = &unk_1E56097D8;
  v6[4] = &v7;
  [v2 handleContextualChange:v3 info:v4 handler:v6];

  if (*(void *)(a1 + 40) && *((unsigned char *)v8 + 24))
  {
    v5 = [*(id *)(*(void *)(a1 + 32) + 24) persistence];
    [v5 deleteRegistration:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) deregisterCallback:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v7, 8);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = (id)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performRegistrationCallbackWithRegistration:v6 info:v4];
}

void __52___CDUserContextServerClient__valueForPath_handler___block_invoke(uint64_t a1)
{
  v2 = +[_CDDevice localDevice];
  v3 = [v2 deviceID];
  id v4 = [*(id *)(a1 + 32) deviceID];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    +[_CDContextMonitorManager activateMonitorForKeyPath:*(void *)(a1 + 32)];
    id v9 = [*(id *)(*(void *)(a1 + 40) + 32) propertiesForContextualKeyPath:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    [v6 _valueForRemotePath:v7 handler:v8];
  }
}

void __56___CDUserContextServerClient__propertiesOfPath_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 value];
  id v4 = [v3 lastModifiedDate];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

uint64_t __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_136(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 ^ 1;
  return result;
}

void __45___CDUserContextServerClient_serverInterface__block_invoke()
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDE95F0];
  v1 = (void *)serverInterface_serverInterface_0;
  serverInterface_serverInterface_0 = v0;

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v33, "setWithObjects:", v32, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)serverInterface_serverInterface_0 setClasses:v12 forSelector:sel_addObjects_andRemoveObjects_forArrayAtPath_handler_ argumentIndex:0 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClasses:v12 forSelector:sel_addObjects_andRemoveObjects_forArrayAtPath_handler_ argumentIndex:1 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_ argumentIndex:0 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_ argumentIndex:1 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClasses:v12 forSelector:sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_ argumentIndex:0 ofReply:1];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
  [(id)serverInterface_serverInterface_0 setClasses:v18 forSelector:sel_activateDevices_remoteUserContextProxySourceDeviceUUID_ argumentIndex:0 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClasses:v18 forSelector:sel_deactivateDevices_remoteUserContextProxySourceDeviceUUID_ argumentIndex:0 ofReply:0];
  v19 = (void *)serverInterface_serverInterface_0;
  v20 = +[_CDContextValue supportedContextValueClasses];
  [v19 setClasses:v20 forSelector:sel_setObject_forPath_handler_ argumentIndex:0 ofReply:0];

  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_setObject_forPath_handler_ argumentIndex:1 ofReply:0];
  v21 = (void *)serverInterface_serverInterface_0;
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v21 setClasses:v24 forSelector:sel_valuesForPaths_handler_ argumentIndex:0 ofReply:0];

  v25 = +[_CDContextValue supportedContextValueClasses];
  v26 = (void *)[v25 mutableCopy];

  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v26 addObjectsFromArray:v27];

  [(id)serverInterface_serverInterface_0 setClasses:v26 forSelector:sel_valuesForPaths_handler_ argumentIndex:0 ofReply:1];
  v28 = (void *)serverInterface_serverInterface_0;
  v29 = +[_CDContextValue supportedContextValueClasses];
  [v28 setClasses:v29 forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:0 ofReply:0];

  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:1 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:2 ofReply:0];
  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_propertiesOfPath_handler_ argumentIndex:0 ofReply:0];
  v30 = (void *)serverInterface_serverInterface_0;
  v31 = +[_CDContextValue supportedContextValueClasses];
  [v30 setClasses:v31 forSelector:sel_propertiesOfPath_handler_ argumentIndex:0 ofReply:1];

  [(id)serverInterface_serverInterface_0 setClass:objc_opt_class() forSelector:sel_propertiesOfPath_handler_ argumentIndex:1 ofReply:1];
}

void __45___CDUserContextServerClient_clientInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDE87D8];
  v1 = (void *)clientInterface_clientInterface_0;
  clientInterface_clientInterface_0 = v0;

  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[_CDContextValue supportedContextValueClasses];
  [v5 unionSet:v4];

  [(id)clientInterface_clientInterface_0 setClass:objc_opt_class() forSelector:sel_handleContextualChange_info_handler_ argumentIndex:0 ofReply:0];
  [(id)clientInterface_clientInterface_0 setClasses:v5 forSelector:sel_handleContextualChange_info_handler_ argumentIndex:1 ofReply:0];
  [(id)clientInterface_clientInterface_0 setClass:objc_opt_class() forSelector:sel_handleRegistrationCompleted_handler_ argumentIndex:0 ofReply:0];
}

void __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)os_transaction_create();
  uint64_t v3 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5 && WeakRetained)
  {
    [v5 deregisterAllCallbacks:0];
    uint64_t v7 = [v6 wakingRegistrations];
    objc_sync_enter(v7);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(v6, "wakingRegistrations", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          [WeakRetained addOpenRegistration:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
    [WeakRetained clientWasInterrupted:v6];
  }
}

uint64_t __57___CDUserContextServerClient_hasKnowledgeOfPath_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hasKnowledgeOfPath:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_CDDevice localDevice];
  uint64_t v3 = [v2 deviceID];
  uint64_t v4 = [*(id *)(a1 + 32) deviceID];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    +[_CDContextMonitorManager activateMonitorForKeyPath:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 32) hasKnowledgeOfContextualKeyPath:*(void *)(a1 + 32)];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
    v8(v6, v7);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke_2;
    v11[3] = &unk_1E5609B78;
    id v12 = *(id *)(a1 + 48);
    [v9 _valueForRemotePath:v10 handler:v11];
  }
}

uint64_t __58___CDUserContextServerClient__hasKnowledgeOfPath_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

uint64_t __55___CDUserContextServerClient_propertiesOfPath_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _propertiesOfPath:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __61___CDUserContextServerClient_propertiesOfRemotePath_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _propertiesOfRemotePath:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __62___CDUserContextServerClient__propertiesOfRemotePath_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 value];
  uint64_t v4 = [v3 lastModifiedDate];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2;
  v7[3] = &unk_1E56092C0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_2(v2, v3, v4);
    }
  }
  id v5 = [*(id *)(*(void *)(a1 + 40) + 32) propertiesForContextualKeyPath:*(void *)(a1 + 48)];
  id v6 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_1((void **)(a1 + 48), v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_122];
  id v3 = [*(id *)(a1 + 40) identifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_123;
  v5[3] = &unk_1E5609C38;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  [v2 handleContextualChange:v3 info:v4 handler:v5];
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_cold_1();
  }
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_123(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 40) _queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_124;
  v9[3] = &unk_1E5609C10;
  char v11 = a2;
  id v5 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v6 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_1;
  block[3] = &unk_1E56095F0;
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  dispatch_async(v4, block);
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_124(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(id **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 registerCallback:v4];
  }
  else
  {
    id v5 = [v3[3] persistence];
    [v5 deleteRegistration:*(void *)(a1 + 40)];
  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  int v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) predicate];
  uint64_t v4 = [v3 keyPaths];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        +[_CDContextMonitorManager activateMonitorForKeyPath:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 24) persistence];
  [v9 saveRegistration:*(void *)(a1 + 32)];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [*(id *)(a1 + 32) predicate];
  char v11 = [v10 keyPaths];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 24) persistence];
        v18 = [*(id *)(*(void *)(a1 + 40) + 32) propertiesForContextualKeyPath:v16];
        [v17 saveValue:v18 forKeyPath:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }

  [*(id *)(*(void *)(a1 + 40) + 32) registerCallback:*(void *)(a1 + 32)];
  v19 = *(void **)(*(void *)(a1 + 40) + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47___CDUserContextServerClient_registerCallback___block_invoke_3;
  v22[3] = &unk_1E5609790;
  id v23 = *(id *)(a1 + 32);
  v20 = [v19 remoteObjectProxyWithErrorHandler:v22];
  if (v20)
  {
    v21 = [*v2 identifier];
    [v20 handleRegistrationCompleted:v21 handler:&__block_literal_global_130];
  }
  else
  {
    v21 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __47___CDUserContextServerClient_registerCallback___block_invoke_2_cold_1(v2);
    }
  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47___CDUserContextServerClient_registerCallback___block_invoke_3_cold_1();
  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_128(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __47___CDUserContextServerClient_registerCallback___block_invoke_128_cold_1();
    }
  }
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_131()
{
  uint64_t v0 = [MEMORY[0x1E4F5B418] mdcsChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __47___CDUserContextServerClient_registerCallback___block_invoke_131_cold_1();
  }
}

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2_cold_1();
  }
}

void __70___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 40) count];
  if (v3 == [*(id *)(a1 + 56) count])
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = [*(id *)(a1 + 32) anyObject];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F5B418] mdcsChannel];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [MEMORY[0x1E4F5B418] mdcsChannel];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v5) {
      __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1();
  }
}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [MEMORY[0x1E4F5B418] mdcsChannel];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v5) {
      __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1();
  }
}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F5B418] mdcsChannel];
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_1();
  }
}

uint64_t __53___CDUserContextServerClient_valuesForPaths_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _valuesForPaths:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 5);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v3 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_cold_1((uint64_t)a1, v2);
    }

    id v4 = (void *)[*(id *)(*(void *)(a1[5] + 8) + 40) copy];
    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v5 = *(void *)(a1[5] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  if (v8)
  {
    *(void *)(v7 + 40) = 0;
  }
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_2;
  block[3] = &unk_1E5609D70;
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v16 = v6;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v13 = v9;
  uint64_t v15 = *(void *)(a1 + 72);
  id v8 = v3;
  dispatch_sync(v4, block);
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v2 forKeyedSubscript:a1[5]];
  }
  if (++*(void *)(*(void *)(a1[8] + 8) + 24) == a1[10])
  {
    id v7 = (id)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v3 = *(void *)(a1[7] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1[9] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __71___CDUserContextServerClient_initForService_withConnection_andContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_18EC9B000, v0, v1, "CDUserContext: client connection interrupted or invalidated.", v2, v3, v4, v5, v6);
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_1(void **a1, void *a2)
{
  uint64_t v2 = _CDRedactedObjectForKeyPath(*a1, a2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v3, v4, "CDUserContext: GET %@ = %@", v5, v6, v7, v8, v9);
}

void __58___CDUserContextServerClient__valueForRemotePath_handler___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_7_0(&dword_18EC9B000, a2, a3, "Unable to fetch properties of remote key path: %@", (uint8_t *)&v4);
}

void __69___CDUserContextServerClient_handlePreviouslyFiredRegistration_info___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EC9B000, v0, v1, "Error communicating with client for handlePreviouslyFiredRegistration: %@", v2);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_2_cold_1(id *a1)
{
  uint64_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_18EC9B000, v2, v3, "Failed to get remote proxy to send registration completed for registration %@", v4, v5, v6, v7, v8);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = [*(id *)(v0 + 32) identifier];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_15(&dword_18EC9B000, v2, v3, "Failed to send registration completed for registration %@: %@", v4, v5, v6, v7, v8);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_128_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_0(&dword_18EC9B000, v0, v1, "Unable to receive client acknowledgement for completed registration", v2);
}

void __47___CDUserContextServerClient_registerCallback___block_invoke_131_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_18EC9B000, v0, v1, "Requested active devices", v2, v3, v4, v5, v6);
}

void __79___CDUserContextServerClient_performRegistrationCallbackWithRegistration_info___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EC9B000, v0, v1, "Error communicating with client for performRegistrationCallbackWithRegistration: %@", v2);
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v1, v2, "Fetched properties of remote key paths: %{public}@", v3, v4, v5, v6, v7);
}

void __109___CDUserContextServerClient_fetchPropertiesOfRemoteKeyPaths_remoteUserContextProxySourceDeviceUUID_handler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EC9B000, v0, v1, "Failed to fetch properties of remote key paths: %@", v2);
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v1, v2, "Subscribed to user context value notifications on remote devices: %{public}@", v3, v4, v5, v6, v7);
}

void __93___CDUserContextServerClient_subscribeToContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_18EC9B000, v1, v2, "Failed to subscribe to user context value notifications on remote devices: %{public}@", v3, v4, v5, v6, v7);
}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v1, v2, "Unsubscribed from user context value notifications on devices %{public}@ with registration %@", v3, v4, v5, v6, v7);
}

void __97___CDUserContextServerClient_unsubscribeFromContextValueNotificationsWithRegistration_deviceIDs___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v0 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_1(&dword_18EC9B000, v1, v2, "Failed to unsubscribe from user context value notifications on devices %{public}@ with registration: %@", v3, v4, v5, v6, v7);
}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_18EC9B000, v0, v1, "Subscribed to device status change notifications", v2, v3, v4, v5, v6);
}

void __87___CDUserContextServerClient_subscribeToDeviceStatusChangeNotificationsForDeviceTypes___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0(&dword_18EC9B000, v0, v1, "Failed to subscribe to device status change notifications: %@", v2);
}

void __54___CDUserContextServerClient__valuesForPaths_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 56) - objc_msgSend(*(id *)(*(void *)(*(void *)a2 + 8) + 40), "count"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_18EC9B000, v3, v4, "CDUserContext: Failed to get %@ values", v5, v6, v7, v8, v9);
}

@end