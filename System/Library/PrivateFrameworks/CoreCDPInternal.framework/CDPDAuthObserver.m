@interface CDPDAuthObserver
- (CDPDAuthObserver)init;
- (void)eventReceived:(const char *)a3 eventInfo:(id)a4;
- (void)registerListener:(id)a3;
@end

@implementation CDPDAuthObserver

- (CDPDAuthObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDAuthObserver;
  v2 = [(CDPDAuthObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    authListeners = v2->_authListeners;
    v2->_authListeners = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)registerListener:(id)a3
{
}

- (void)eventReceived:(const char *)a3 eventInfo:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v6 = a4;
  v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = (uint64_t)a3;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Received Auth Notification %s, with userInfo %@", buf, 0x16u);
  }

  if (!strcmp((const char *)[(id)*MEMORY[0x263F290E0] UTF8String], a3))
  {
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F290D8]];
    v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F290E8]];
    v10 = _CDPLogSystem();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558274;
        uint64_t v17 = 1752392040;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Detected security level change for %{mask.hash}@", buf, 0x16u);
      }

      v12 = [MEMORY[0x263F34350] contextForAccountWithAltDSID:v8];
      authListeners = self->_authListeners;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __44__CDPDAuthObserver_eventReceived_eventInfo___block_invoke;
      v14[3] = &unk_26432FFA8;
      id v15 = v12;
      v11 = v12;
      [(NSMutableArray *)authListeners enumerateObjectsUsingBlock:v14];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CDPDAuthObserver eventReceived:eventInfo:]((uint64_t)a3, v11);
    }
  }
  else
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDAuthObserver eventReceived:eventInfo:]((uint64_t)a3, v8);
    }
  }
}

uint64_t __44__CDPDAuthObserver_eventReceived_eventInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 securityLevelChangedForAccountContext:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

- (void)eventReceived:(uint64_t)a1 eventInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Auth observer ignoring %s, securityLevel %@", (uint8_t *)&v2, 0x16u);
}

- (void)eventReceived:(uint64_t)a1 eventInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Auth observer ignoring: %s", (uint8_t *)&v2, 0xCu);
}

@end