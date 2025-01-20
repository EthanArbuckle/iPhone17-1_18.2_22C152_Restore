@interface CDClientContext
@end

@implementation CDClientContext

uint64_t __56___CDClientContext_handleContextualChange_info_handler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) informativeCallback];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) informativeCallback];
    v3[2](v3, *(void *)(a1 + 40), *(void *)(a1 + 48));

    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v4();
  }
  else
  {
    uint64_t v6 = (*(unsigned __int8 (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
    if ((v6 & 1) == 0)
    {
      v7 = *(void **)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 32);
      return [v7 cleanupInternalReferencesToRegistration:v8];
    }
  }
  return result;
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_alloc_init(_CDContextValue);
  uint64_t v8 = v7;
  if (v5)
  {
    [(_CDContextValue *)v7 setValue:v5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = v5;
    v11 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
    [(_CDContextValue *)v8 setValue:v12];

    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    v11 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }

  [(_CDContextValue *)v8 setLastModifiedDate:v6];
  [*(id *)(a1 + 32) setCachedValueIfClientHasRegistrations:v8 forKeyPath:*(void *)(a1 + 40)];
  v14 = *(void **)(a1 + 56);
  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15)
    {
      v16 = *(NSObject **)(a1 + 48);
    }
    else
    {
      v16 = [*(id *)(a1 + 32) defaultCallbackQueue];
      v14 = *(void **)(a1 + 56);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2_133;
    v19[3] = &unk_1E5609850;
    id v17 = v14;
    uint64_t v18 = *(void *)(a1 + 64);
    id v20 = v17;
    uint64_t v21 = v18;
    dispatch_async(v16, v19);
    if (!v15) {
  }
    }
}

void __37___CDClientContext_currentConnection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unprotectedSetUpXPCConnectionWithEndpoint:*(void *)(*(void *)(a1 + 32) + 48)];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_143(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = *(NSObject **)(a1 + 32);
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) defaultCallbackQueue];
      v2 = *(void **)(a1 + 56);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    v9[3] = &unk_1E5609968;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 64);
    id v11 = v6;
    uint64_t v12 = v7;
    uint64_t v8 = *(void **)(a1 + 48);
    v9[4] = *(void *)(a1 + 40);
    id v10 = v8;
    dispatch_async(v5, v9);
    if (!v4) {
  }
    }
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 48);
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v4 = *(void **)(a1 + 56);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_130;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

void __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18EC9B000, v0, v1, "error getting value for %@ : %@");
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_145(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(NSObject **)(a1 + 32);
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 40) defaultCallbackQueue];
      v2 = *(void **)(a1 + 56);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2;
    v9[3] = &unk_1E5609968;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 64);
    id v11 = v6;
    uint64_t v12 = v7;
    id v8 = *(void **)(a1 + 48);
    v9[4] = *(void *)(a1 + 40);
    id v10 = v8;
    dispatch_async(v5, v9);
    if (!v4) {
  }
    }
}

void __62___CDClientContext_unprotectedSetUpXPCConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (__CFString *)*((void *)WeakRetained + 6);
      if (!v4) {
        uint64_t v4 = @"com.apple.coreduetd.context";
      }
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_18EC9B000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v5, 0xCu);
    }
    *((unsigned char *)WeakRetained + 8) = 1;
  }
}

void __35___CDClientContext_serverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDE95F0];
  os_log_t v1 = (void *)serverInterface_serverInterface;
  serverInterface_serverInterface = v0;

  v2 = (void *)serverInterface_serverInterface;
  id v3 = +[_CDContextValue supportedContextValueClasses];
  [v2 setClasses:v3 forSelector:sel_setObject_forPath_handler_ argumentIndex:0 ofReply:0];

  [(id)serverInterface_serverInterface setClass:objc_opt_class() forSelector:sel_setObject_forPath_handler_ argumentIndex:1 ofReply:0];
  id v15 = [MEMORY[0x1E4F1CA80] setWithObject:objc_opt_class()];
  uint64_t v4 = +[_CDContextValue supportedContextValueClasses];
  [v15 unionSet:v4];

  [v15 addObject:objc_opt_class()];
  [(id)serverInterface_serverInterface setClasses:v15 forSelector:sel_valuesForPaths_handler_ argumentIndex:0 ofReply:1];
  int v5 = (void *)serverInterface_serverInterface;
  id v6 = +[_CDContextValue supportedContextValueClasses];
  [v5 setClasses:v6 forSelector:sel_addObjects_andRemoveObjects_forArrayAtPath_handler_ argumentIndex:0 ofReply:0];

  uint64_t v7 = (void *)serverInterface_serverInterface;
  id v8 = +[_CDContextValue supportedContextValueClasses];
  [v7 setClasses:v8 forSelector:sel_addObjects_andRemoveObjects_forArrayAtPath_handler_ argumentIndex:1 ofReply:0];

  uint64_t v9 = (void *)serverInterface_serverInterface;
  id v10 = +[_CDContextValue supportedContextValueClasses];
  [v9 setClasses:v10 forSelector:sel_removeObjectsMatchingPredicate_fromArrayAtPath_handler_ argumentIndex:0 ofReply:1];

  [(id)serverInterface_serverInterface setClass:objc_opt_class() forSelector:sel_propertiesOfPath_handler_ argumentIndex:0 ofReply:0];
  id v11 = (void *)serverInterface_serverInterface;
  uint64_t v12 = +[_CDContextValue supportedContextValueClasses];
  [v11 setClasses:v12 forSelector:sel_propertiesOfPath_handler_ argumentIndex:0 ofReply:1];

  [(id)serverInterface_serverInterface setClass:objc_opt_class() forSelector:sel_propertiesOfPath_handler_ argumentIndex:1 ofReply:1];
  uint64_t v13 = (void *)serverInterface_serverInterface;
  v14 = +[_CDContextValue supportedContextValueClasses];
  [v13 setClasses:v14 forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:0 ofReply:0];

  [(id)serverInterface_serverInterface setClass:objc_opt_class() forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:1 ofReply:0];
  [(id)serverInterface_serverInterface setClass:objc_opt_class() forSelector:sel_setObject_lastModifiedDate_forContextualKeyPath_handler_ argumentIndex:2 ofReply:0];
}

void __35___CDClientContext_clientInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDE87D8];
  os_log_t v1 = (void *)clientInterface_clientInterface;
  clientInterface_clientInterface = v0;

  v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[_CDContextValue supportedContextValueClasses];
  [v5 unionSet:v4];

  [(id)clientInterface_clientInterface setClass:objc_opt_class() forSelector:sel_handleContextualChange_info_handler_ argumentIndex:0 ofReply:0];
  [(id)clientInterface_clientInterface setClasses:v5 forSelector:sel_handleContextualChange_info_handler_ argumentIndex:1 ofReply:0];
  [(id)clientInterface_clientInterface setClass:objc_opt_class() forSelector:sel_handleRegistrationCompleted_handler_ argumentIndex:0 ofReply:0];
}

void __40___CDClientContext_defaultCallbackQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cdclientcontext.callbackQueue", v2);
  os_log_t v1 = (void *)defaultCallbackQueue_callbackQueue;
  defaultCallbackQueue_callbackQueue = (uint64_t)v0;
}

uint64_t __37___CDClientContext_initWithEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedSetUpXPCConnectionWithEndpoint:*(void *)(a1 + 40)];
}

uint64_t __31___CDClientContext_userContext__block_invoke()
{
  userContext_context = [objc_alloc((Class)objc_opt_class()) initWithEndpoint:0];
  return MEMORY[0x1F41817F8]();
}

void __43___CDClientContext_subscribeToEventStreams__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1();
  }
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke_117;
  handler[3] = &unk_1E5609740;
  objc_copyWeak(&v7, &location);
  xpc_set_event_stream_handler("com.apple.coreduetcontext.mdcs_events", v2, handler);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1();
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43___CDClientContext_subscribeToEventStreams__block_invoke_119;
  v4[3] = &unk_1E5609740;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.coreduetcontext.client_event_stream", v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_117(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleMDCSEvent:v3];
}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_119(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleNotificationEvent:v3];
}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 96);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 96), OS_LOG_TYPE_ERROR)) {
      __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 96), OS_LOG_TYPE_DEBUG))
  {
    __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_1(v5);
  }
  id v6 = +[_CDXPCCodecs fetchPropertiesReplyWithEvent:*(void *)(a1 + 40) error:v3];
  if (v6) {
    xpc_dictionary_send_reply();
  }
}

void __68___CDClientContext_handleSubscribeToContextValueNotificationsEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[_CDXPCContextCodecs subscribeToContextValueNotificationsReplyWithEvent:*(void *)(a1 + 32) error:a2];
  if (v2)
  {
    id v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }
}

void __72___CDClientContext_handleUnsubscribeFromContextValueNotificationsEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[_CDXPCContextCodecs unsubscribeFromContextValueNotificationsReplyWithEvent:*(void *)(a1 + 32) error:a2];
  if (v2)
  {
    id v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }
}

void __41___CDClientContext_handleKeepAliveEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[_CDXPCCodecs keepAliveReplyWithEvent:*(void *)(a1 + 32) error:a2];
  if (v2)
  {
    id v3 = v2;
    xpc_dictionary_send_reply();
    v2 = v3;
  }
}

void __54___CDClientContext_handleRequestActivateDevicesEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[_CDXPCCodecs requestActivateDevicesReplyWithEvent:*(void *)(a1 + 32) error:a2];
  xpc_dictionary_send_reply();
}

void __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_cold_1();
  }
}

uint64_t __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_129(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __76___CDClientContext_objectForContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88___CDClientContext_objectForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2_133(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __86___CDClientContext_lastModifiedDateForContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = *(NSObject **)(a1 + 48);
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v4 = *(void **)(a1 + 56);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_135;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) lastModifiedDate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(_CDContextValue);
  [(_CDContextValue *)v8 setValue:v7];

  [(_CDContextValue *)v8 setLastModifiedDate:v6];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  [*(id *)(a1 + 32) setCachedValueIfClientHasRegistrations:v8 forKeyPath:*(void *)(a1 + 40)];
  uint64_t v9 = *(void **)(a1 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      id v11 = *(NSObject **)(a1 + 48);
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v9 = *(void **)(a1 + 56);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_5;
    v14[3] = &unk_1E5609850;
    id v12 = v9;
    uint64_t v13 = *(void *)(a1 + 64);
    id v15 = v12;
    uint64_t v16 = v13;
    dispatch_async(v11, v14);
    if (!v10) {
  }
    }
}

uint64_t __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __37___CDClientContext_registerCallback___block_invoke(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_18EC9B000, "Duet: ClientContext re-register", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37___CDClientContext_registerCallback___block_invoke_2;
    v6[3] = &unk_1E56098C8;
    v6[4] = v5;
    id v7 = WeakRetained;
    [v5 retryTimes:3 block:v6];
  }
}

uint64_t __37___CDClientContext_registerCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v2 = [*(id *)(a1 + 32) currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37___CDClientContext_registerCallback___block_invoke_3;
  v8[3] = &unk_1E56098A0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v10 = &v11;
  v8[4] = v3;
  id v9 = v4;
  uint64_t v5 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v5 registerCallback:*(void *)(a1 + 40)];

  uint64_t v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37___CDClientContext_registerCallback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___CDClientContext_registerCallback___block_invoke_3_cold_1(a1, v4);
    }
  }
}

uint64_t __37___CDClientContext_registerCallback___block_invoke_139(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v2 = [*(id *)(a1 + 32) currentConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37___CDClientContext_registerCallback___block_invoke_2_140;
  v8[3] = &unk_1E56098A0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v10 = &v11;
  v8[4] = v3;
  id v9 = v4;
  uint64_t v5 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v5 registerCallback:*(void *)(a1 + 40)];

  uint64_t v6 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37___CDClientContext_registerCallback___block_invoke_2_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___CDClientContext_registerCallback___block_invoke_2_140_cold_1(a1, v4);
    }
  }
}

void __38___CDClientContext_evaluatePredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __38___CDClientContext_evaluatePredicate___block_invoke_cold_1();
  }
}

uint64_t __38___CDClientContext_evaluatePredicate___block_invoke_141(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __80___CDClientContext_setObject_forContextualKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  uint64_t v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_142;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after setting object for key path: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __77___CDClientContext_addObjects_toArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  int v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      int v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_144;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after adding objects to key path: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __82___CDClientContext_removeObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  int v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      int v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_146;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_147(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v4;
    _os_log_impl(&dword_18EC9B000, v3, OS_LOG_TYPE_INFO, "Done removing object from keypath: %@", buf, 0xCu);
  }
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(NSObject **)(a1 + 48);
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_148;
    v11[3] = &unk_1E5609968;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 64);
    id v13 = v8;
    uint64_t v14 = v9;
    uint64_t v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    dispatch_async(v7, v11);
    if (!v6) {
  }
    }
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_148(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after removing object from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __99___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  int v4 = *(void **)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 56);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      int v4 = *(void **)(a1 + 64);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_149;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl(&dword_18EC9B000, v5, OS_LOG_TYPE_INFO, "Done removing objects matching predicate from keypath: %@", buf, 0xCu);
  }
  id v7 = *(void **)(a1 + 56);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      uint64_t v9 = *(NSObject **)(a1 + 48);
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) defaultCallbackQueue];
      id v7 = *(void **)(a1 + 56);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_151;
    v13[3] = &unk_1E56099E0;
    id v17 = v7;
    id v10 = v4;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    dispatch_async(v9, v13);
    if (!v8) {
  }
    }
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_151(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[7] + 16))();
  id v2 = *(NSObject **)(a1[5] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[6];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after removing objects matching predicate from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __96___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  int v4 = *(void **)(a1 + 72);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 64);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      int v4 = *(void **)(a1 + 72);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_153;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_154(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v4;
    _os_log_impl(&dword_18EC9B000, v3, OS_LOG_TYPE_INFO, "Done adding to and removing from keypath: %@", buf, 0xCu);
  }
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(NSObject **)(a1 + 48);
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) defaultCallbackQueue];
      uint64_t v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_155;
    v11[3] = &unk_1E5609968;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 64);
    id v13 = v8;
    uint64_t v14 = v9;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    dispatch_async(v7, v11);
    if (!v6) {
  }
    }
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_155(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after adding to and removing from keypath: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_cold_1();
  }
}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_156(uint64_t a1, void *a2)
{
}

uint64_t __67___CDClientContext_valuesForKeyPaths_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
  }
  int v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(NSObject **)(a1 + 40);
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 32) defaultCallbackQueue];
      int v4 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_157;
    block[3] = &unk_1E5609800;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = *(NSObject **)(a1 + 32);
    }
    else
    {
      id v7 = [*(id *)(a1 + 40) defaultCallbackQueue];
      uint64_t v5 = *(void **)(a1 + 56);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_3;
    v11[3] = &unk_1E5609968;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 64);
    id v13 = v8;
    uint64_t v14 = v9;
    id v10 = *(void **)(a1 + 48);
    v11[4] = *(void *)(a1 + 40);
    id v12 = v10;
    dispatch_async(v7, v11);
    if (!v6) {
  }
    }
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_3(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = *(NSObject **)(a1[4] + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[5];
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18EC9B000, v2, OS_LOG_TYPE_INFO, "Finished completion handler after getting values for key paths: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_cold_1();
  }
}

uint64_t __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_159(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1();
  }
}

void __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 96), OS_LOG_TYPE_ERROR)) {
    __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1();
  }
}

void __43___CDClientContext_subscribeToEventStreams__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_18EC9B000, MEMORY[0x1E4F14500], v0, "Registering xpc_set_event_stream_handler(\"%s\"", v1, v2, v3, v4, v5);
}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEBUG, "Fetched properties", v1, 2u);
}

void __47___CDClientContext_handleFetchPropertiesEvent___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "Failed to fetch properties: %@", v2, v3, v4, v5, v6);
}

void __52___CDClientContext_hasKnowledgeOfContextualKeyPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18EC9B000, v0, v1, "error checking knowledge of key path %@ : %@");
}

void __98___CDClientContext_lastModifiedDateForContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18EC9B000, v0, v1, "error getting last modified date for key %@ : %@");
}

void __37___CDClientContext_registerCallback___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_18EC9B000, v5, v6, "Error re-registering %@ (%@)", v7, v8, v9, v10, v11);
}

void __37___CDClientContext_registerCallback___block_invoke_2_140_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_18EC9B000, v5, v6, "Error registering %@ (%@)", v7, v8, v9, v10, v11);
}

void __38___CDClientContext_evaluatePredicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_18EC9B000, v0, v1, "error evaluating predicate %@ : %@");
}

void __92___CDClientContext_setObject_forContextualKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5(&dword_18EC9B000, v0, v1, "error in setObject %@ for keyPath %@ : %@");
}

void __89___CDClientContext_addObjects_toArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5(&dword_18EC9B000, v0, v1, "error in addObjects %@ for keyPath %@ : %@");
}

void __94___CDClientContext_removeObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5(&dword_18EC9B000, v0, v1, "error in removeObjects %@ for keyPath %@ : %@");
}

void __111___CDClientContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5(&dword_18EC9B000, v0, v1, "error in removeObjectsMatchingPredicate %@ for keyPath %@ : %@");
}

void __108___CDClientContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9_0(&dword_18EC9B000, v0, v1, "error in adding: %@ removing: %@ for keyPath %@ : %@");
}

void __66___CDClientContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "error getting values for key paths: %@", v2, v3, v4, v5, v6);
}

void __79___CDClientContext_valuesForKeyPaths_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "error getting values for key paths : %@", v2, v3, v4, v5, v6);
}

void __68___CDClientContext_setObject_lastModifiedDate_forContextualKeyPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9_0(&dword_18EC9B000, v0, v1, "error in setObject %@ lastModifiedDate %@ for keyPath %@ : %@");
}

void __75___CDClientContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "error activating devices: %@", v2, v3, v4, v5, v6);
}

void __77___CDClientContext_deactivateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18EC9B000, v0, v1, "error deactivating devices: %@", v2, v3, v4, v5, v6);
}

@end