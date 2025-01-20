@interface CDPDCircleStateObserver
- (CDPDCircleStateObserver)init;
- (const)_notificationName;
- (void)_sendCircleStatusChangedForContext:(id)a3;
- (void)_sendCircleViewStatusChangedForContext:(id)a3;
- (void)dealloc;
- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4;
- (void)init;
- (void)observeChangeToState:(unint64_t)a3 circleProxy:(id)a4 handler:(id)a5;
- (void)observeCircleStateWithCircleProxy:(id)a3 changeHandler:(id)a4;
- (void)registerListener:(id)a3;
- (void)stopObservingCircleStatusChange;
@end

@implementation CDPDCircleStateObserver

- (CDPDCircleStateObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)CDPDCircleStateObserver;
  v2 = [(CDPDCircleStateObserver *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    circleObservers = v2->_circleObservers;
    v2->_circleObservers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("CDPDCircleStateObserver Event Queue", v5);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v6;

    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDCircleStateObserver init]();
    }
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Deallocated %@", v2, v3, v4, v5, v6);
}

- (const)_notificationName
{
  return (const char *)*MEMORY[0x263F16E00];
}

- (void)observeCircleStateWithCircleProxy:(id)a3 changeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_isObserving = 1;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPDCircleStateObserver observeCircleStateWithCircleProxy:changeHandler:]();
  }

  v9 = [(CDPDCircleStateObserver *)self _notificationName];
  p_circleChangeToken = &self->_circleChangeToken;
  eventQueue = self->_eventQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke;
  handler[3] = &unk_26432F040;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  notify_register_dispatch(v9, p_circleChangeToken, eventQueue, handler);
}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v8 = 0;
  uint64_t v3 = [v2 combinedCircleStatus:&v8];
  id v4 = v8;
  uint64_t v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6) {
      __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_2(v3);
    }
  }
  else if (v6)
  {
    __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_1(v3);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v3);
  }
}

- (void)observeChangeToState:(unint64_t)a3 circleProxy:(id)a4 handler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CDPDCircleStateObserver_observeChangeToState_circleProxy_handler___block_invoke;
  v10[3] = &unk_26432F068;
  id v11 = v8;
  unint64_t v12 = a3;
  id v9 = v8;
  [(CDPDCircleStateObserver *)self observeCircleStateWithCircleProxy:a4 changeHandler:v10];
}

uint64_t __68__CDPDCircleStateObserver_observeChangeToState_circleProxy_handler___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 40) == a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)stopObservingCircleStatusChange
{
  self->_isObserving = 0;
}

- (void)registerListener:(id)a3
{
}

- (void)_sendCircleStatusChangedForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 altDSID];
    *(_DWORD *)buf = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "_sendCircleStatusChangedForContext: calling circleStatusChangedForAccountContext for altDSID (%{mask.hash}@", buf, 0x16u);
  }
  circleObservers = self->_circleObservers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CDPDCircleStateObserver__sendCircleStatusChangedForContext___block_invoke;
  v9[3] = &unk_26432F090;
  id v10 = v4;
  id v8 = v4;
  [(NSMutableArray *)circleObservers enumerateObjectsUsingBlock:v9];
}

uint64_t __62__CDPDCircleStateObserver__sendCircleStatusChangedForContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 circleStatusChangedForAccountContext:*(void *)(a1 + 32)];
}

- (void)_sendCircleViewStatusChangedForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 altDSID];
    *(_DWORD *)buf = 141558274;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "_sendCircleStatusChangedForContext: calling circleStatusChangedForAccountContext for altDSID (%{mask.hash}@", buf, 0x16u);
  }
  circleObservers = self->_circleObservers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__CDPDCircleStateObserver__sendCircleViewStatusChangedForContext___block_invoke;
  v9[3] = &unk_26432F090;
  id v10 = v4;
  id v8 = v4;
  [(NSMutableArray *)circleObservers enumerateObjectsUsingBlock:v9];
}

uint64_t __66__CDPDCircleStateObserver__sendCircleViewStatusChangedForContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 circleViewStatusChangedForAccountContext:*(void *)(a1 + 32)];
}

- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!strcmp((const char *)*MEMORY[0x263F16DA0], a3) || !strcmp((const char *)*MEMORY[0x263F16E00], a3))
  {
    id v8 = _CDPLogSystem();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      id v8 = [MEMORY[0x263F34350] contextForPrimaryAccount];
      [(CDPDCircleStateObserver *)self _sendCircleViewStatusChangedForContext:v8];
      goto LABEL_10;
    }
    int v9 = 136315138;
    id v10 = a3;
LABEL_8:
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Processing circle status changed event for event %s", (uint8_t *)&v9, 0xCu);
    goto LABEL_9;
  }
  int v6 = strcmp((const char *)*MEMORY[0x263F16E10], a3);
  uint64_t v7 = _CDPLogSystem();
  id v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v9 = 136315138;
    id v10 = a3;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPDCircleStateObserver eventReceived:eventValue:]();
  }
LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleObservers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Initialized %@", v2, v3, v4, v5, v6);
}

- (void)observeCircleStateWithCircleProxy:changeHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "%@ started observing state", v2, v3, v4, v5, v6);
}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_218640000, v2, v3, "Circle state is %@ after observing kSOSCCCircleChangedNotification (observer %p)", v4, v5, v6, v7, v8);
}

void __75__CDPDCircleStateObserver_observeCircleStateWithCircleProxy_changeHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_218640000, v2, v3, "Error checking circle status (%@) after observing kSOSCCCircleChangedNotification - %@", v4, v5, v6, v7, v8);
}

- (void)eventReceived:eventValue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Circle observer ignoring: %s", v2, v3, v4, v5, v6);
}

@end