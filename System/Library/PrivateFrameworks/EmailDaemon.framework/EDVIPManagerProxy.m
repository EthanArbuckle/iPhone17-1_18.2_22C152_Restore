@interface EDVIPManagerProxy
- (EDVIPManager)vipManager;
- (EDVIPManagerProxy)initWithVIPManager:(id)a3;
- (NSSet)allVIPWaitForResult;
- (void)_vipsDidChange:(id)a3;
- (void)cancelObservation:(id)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3 observationIdentifier:(id)a4;
- (void)removeVIPsWithEmailAddresses:(id)a3;
- (void)removeVIPsWithIdentifiers:(id)a3;
- (void)saveVIPs:(id)a3;
@end

@implementation EDVIPManagerProxy

- (EDVIPManagerProxy)initWithVIPManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EDVIPManagerProxy;
  v6 = [(EDVIPManagerProxy *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    observersByIdentifier = v7->_observersByIdentifier;
    v7->_observersByIdentifier = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_vipManager, a3);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__vipsDidChange_ name:*MEMORY[0x1E4F601C8] object:v5];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EDVIPManagerProxy;
  [(EDVIPManagerProxy *)&v4 dealloc];
}

- (void)registerObserver:(id)a3 observationIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_observersLock);
  [(NSMapTable *)self->_observersByIdentifier setObject:v9 forKey:v6];
  os_unfair_lock_unlock(&self->_observersLock);
  v7 = [(EDVIPManagerProxy *)self vipManager];
  uint64_t v8 = [v7 allVIPs];
  [v9 observer:v6 gotVIPs:v8];
}

- (void)cancelObservation:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSMapTable *)self->_observersByIdentifier removeObjectForKey:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)saveVIPs:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(EDVIPManagerProxy *)self vipManager];
  [v4 saveVIPs:v5];
}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(EDVIPManagerProxy *)self vipManager];
  [v4 removeVIPsWithIdentifiers:v5];
}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(EDVIPManagerProxy *)self vipManager];
  [v4 removeVIPsWithEmailAddresses:v5];
}

- (void)_vipsDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v12 = [a3 userInfo];
  objc_super v4 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F601D8]];
  id v5 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F601D0]];
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_observersByIdentifier;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [(NSMapTable *)self->_observersByIdentifier objectForKey:v10];
        [v11 observer:v10 updatedVIPs:v4 removedVIPs:v5];
      }
      uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_observersLock);
}

- (NSSet)allVIPWaitForResult
{
  return self->allVIPWaitForResult;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->allVIPWaitForResult, 0);

  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
}

@end