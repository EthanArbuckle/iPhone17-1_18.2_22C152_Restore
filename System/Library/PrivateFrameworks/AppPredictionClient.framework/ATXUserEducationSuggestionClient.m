@interface ATXUserEducationSuggestionClient
+ (id)sharedInstance;
- (ATXUserEducationSuggestionClient)init;
- (void)logUserEducationSuggestionFeedback:(id)a3;
- (void)notifyObserversOfSuggestionEvent:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXUserEducationSuggestionClient

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATXUserEducationSuggestionClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_3, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_14;

  return v2;
}

void __50__ATXUserEducationSuggestionClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_14;
  sharedInstance__pasExprOnceResult_14 = v1;
}

- (ATXUserEducationSuggestionClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXUserEducationSuggestionClient;
  v2 = [(ATXUserEducationSuggestionClient *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = [ATXUserEducationSuggestionConnector alloc];
    v6 = [[ATXUserEducationSuggestionClientRequestHandler alloc] initWithClient:v2];
    uint64_t v7 = [(ATXUserEducationSuggestionConnector *)v5 initWithOurInterfaceFactory:ATXUserEducationSuggestionClientXPCInterface theirInterfaceFactory:ATXUserEducationSuggestionServerXPCInterface ourServiceName:@"com.apple.proactive.UserEducationSuggestion.client-listener.xpc" theirServiceName:@"com.apple.proactive.UserEducationSuggestion.server-listener.xpc" requestHandler:v6];
    connector = v2->_connector;
    v2->_connector = (ATXUserEducationSuggestionConnector *)v7;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)logUserEducationSuggestionFeedback:(id)a3
{
  connector = self->_connector;
  id v4 = a3;
  id v5 = [(ATXUserEducationSuggestionConnector *)connector remoteObjectProxy];
  [v5 logUserEducationSuggestionFeedback:v4];
}

- (void)notifyObserversOfSuggestionEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_observers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didReceiveUserEducationSuggestionEvent:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end