@interface IRRapportProvider
- (IRCompanionLinkClient)companionLinkClient;
- (IRRapportProvider)init;
- (IRRapportProvider)initWithQueue:(id)a3 companionLinkClient:(id)a4;
- (void)_logActiveDevices;
- (void)_startRapportDiscovery;
- (void)_stopDiscoveryAndResetKnownDevicesIfNeeded;
- (void)_stopRapportDiscovery;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didUpdateRapportDevices:(id)a3;
- (void)logActiveDevices;
- (void)removeObserver:(id)a3;
- (void)setCompanionLinkClient:(id)a3;
@end

@implementation IRRapportProvider

- (IRRapportProvider)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.intelligentroutingd.rapport", v3);

  v5 = [[IRCompanionLinkClient alloc] initWithRapportProvider:self targetQueue:v4];
  v6 = [(IRRapportProvider *)self initWithQueue:v4 companionLinkClient:v5];

  return v6;
}

- (IRRapportProvider)initWithQueue:(id)a3 companionLinkClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IRRapportProvider;
  v9 = [(IRRapportProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_internalQueue, a3);
    objc_storeStrong((id *)&v10->_companionLinkClient, a4);
    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x263EFFA08] set];
    knownDevices = v10->_knownDevices;
    v10->_knownDevices = (NSSet *)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(IRCompanionLinkClient *)self->_companionLinkClient stopDiscovery];
  v3.receiver = self;
  v3.super_class = (Class)IRRapportProvider;
  [(IRRapportProvider *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_observers containsObject:v4])
  {
    [(NSHashTable *)self->_observers addObject:v4];
    v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 count];

    if (v6 == 1)
    {
      id v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      id v8 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
      {
        int v10 = 136315394;
        uint64_t v11 = "#rapport-provider, ";
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_DEBUG, "%s[%@], Registering for rapport discovery notifications", (uint8_t *)&v10, 0x16u);
      }

      [(IRRapportProvider *)self _startRapportDiscovery];
    }
    v9 = (void *)[(NSSet *)self->_knownDevices copy];
    [v4 provider:self didUpdateRapportDevices:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(IRRapportProvider *)self _stopDiscoveryAndResetKnownDevicesIfNeeded];
  if ([(NSHashTable *)self->_observers containsObject:v4])
  {
    [(NSHashTable *)self->_observers removeObject:v4];
    [(IRRapportProvider *)self _stopDiscoveryAndResetKnownDevicesIfNeeded];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)didUpdateRapportDevices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (([(NSSet *)self->_knownDevices isEqual:v4] & 1) == 0)
  {
    v5 = (NSSet *)[v4 copy];
    knownDevices = self->_knownDevices;
    self->_knownDevices = v5;

    id v7 = (void *)[(NSSet *)self->_knownDevices copy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = self->_observers;
    uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "provider:didUpdateRapportDevices:", self, v7, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(IRRapportProvider *)self _logActiveDevices];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)logActiveDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(IRRapportProvider *)self _logActiveDevices];

  os_unfair_lock_unlock(p_lock);
}

- (void)_logActiveDevices
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  id v4 = (void *)[(NSSet *)self->_knownDevices copy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__IRRapportProvider__logActiveDevices__block_invoke;
  v9[3] = &unk_2653A0490;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = (void *)*MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v5 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138412290;
    long long v12 = v8;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#rapport-provider, Rapport Active Devices:\n%@", buf, 0xCu);
  }
}

void __38__IRRapportProvider__logActiveDevices__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = NSString;
  id v4 = a2;
  id v12 = [v4 name];
  id v5 = [v4 rapportEffectiveID];
  uint64_t v6 = [v4 mediaRemoteIdentifier];
  id v7 = [v4 mediaRouteIdentifier];
  id v8 = [v4 idsID];
  uint64_t v9 = [v4 iCloudId];
  id v10 = [v4 deviceModel];

  uint64_t v11 = [v3 stringWithFormat:@"name: %@, rpId: %@, mrID: %@, mediaRouteID: %@, idsID: %@, icloudID: %@, model: %@", v12, v5, v6, v7, v8, v9, v10];
  [v2 addObject:v11];
}

- (void)_startRapportDiscovery
{
}

- (void)_stopRapportDiscovery
{
}

- (void)_stopDiscoveryAndResetKnownDevicesIfNeeded
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v6 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      id v10 = "#rapport-provider, ";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], unregistering for rapport discovery notifications and reset knownDevices", (uint8_t *)&v9, 0x16u);
    }

    [(IRRapportProvider *)self _stopRapportDiscovery];
    id v7 = [MEMORY[0x263EFFA08] set];
    knownDevices = self->_knownDevices;
    self->_knownDevices = v7;
  }
}

- (IRCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDevices, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end