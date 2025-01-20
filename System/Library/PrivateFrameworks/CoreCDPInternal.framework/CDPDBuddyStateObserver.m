@interface CDPDBuddyStateObserver
- (CDPDBuddyStateObserver)init;
- (NSMutableOrderedSet)listeners;
- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4;
- (void)registerListener:(id)a3;
- (void)setListeners:(id)a3;
@end

@implementation CDPDBuddyStateObserver

- (CDPDBuddyStateObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDBuddyStateObserver;
  v2 = [(CDPDBuddyStateObserver *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    listeners = v2->_listeners;
    v2->_listeners = v3;
  }
  return v2;
}

- (void)registerListener:(id)a3
{
  id v4 = a3;
  -[NSMutableOrderedSet addObject:](self->_listeners, "addObject:");
  if ([MEMORY[0x263F34400] isBuddyFinished]) {
    [v4 buddyFinished];
  }
}

- (void)eventReceived:(const char *)a3 eventValue:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_super v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CDPDBuddyStateObserver eventReceived:eventValue:]((uint64_t)a3, v6);
  }

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v7 = (id *)getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  uint64_t v27 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke;
    v22 = &unk_2643305C0;
    v23 = &v24;
    __getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke((uint64_t)buf);
    v7 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v7)
  {
    -[CDPDBuddyStateObserver eventReceived:eventValue:]();
    __break(1u);
  }
  id v8 = *v7;
  int v9 = strcmp((const char *)[v8 UTF8String], a3);

  if (!v9)
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "CDPDBuddyStateObserver: Buddy Completed. Calling listeners.", buf, 2u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v11 = self->_listeners;
    uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "buddyFinished", (void)v15);
        }
        uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
      }
      while (v12);
    }
  }
}

- (NSMutableOrderedSet)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)eventReceived:eventValue:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[CDPDBuddyStateObserver eventReceived:eventValue:](v0);
}

- (void)eventReceived:(uint64_t)a1 eventValue:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "CDPDBuddyStateObserver Received event %s", (uint8_t *)&v2, 0xCu);
}

@end