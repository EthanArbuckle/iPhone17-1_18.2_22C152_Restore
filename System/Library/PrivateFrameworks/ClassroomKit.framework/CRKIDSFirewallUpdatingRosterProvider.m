@interface CRKIDSFirewallUpdatingRosterProvider
+ (id)keyPathsForValuesAffectingRoster;
+ (id)observedKeyPaths;
+ (id)trustedUserAppleIDsFromRoster:(id)a3;
- (BOOL)areRosterProvidersPopulated;
- (BOOL)isObservingRosters;
- (CATOperation)lastWorkOperation;
- (CATOperationQueue)operationQueue;
- (CRKASMRoster)publishedRoster;
- (CRKASMRosterProviding)secondaryRosterProvider;
- (CRKIDSFirewallUpdatingRosterProvider)initWithPrimaryRosterProvider:(id)a3 secondaryRosterProvider:(id)a4 IDSPrimitives:(id)a5;
- (CRKIDSFirewallUpdatingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4;
- (CRKIDSPrimitives)IDSPrimitives;
- (NSSet)allowedAppleIDs;
- (id)makeTrustedAppleIDs;
- (id)rosterProviders;
- (void)beginObservingRosters;
- (void)dealloc;
- (void)endObservingRosters;
- (void)enqueueWorkOperation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)rosterDidChange;
- (void)setAllowedAppleIDs:(id)a3;
- (void)setLastWorkOperation:(id)a3;
- (void)setObservingRosters:(BOOL)a3;
- (void)setPublishedRoster:(id)a3;
- (void)synchronizeFirewallOperationDidFail:(id)a3;
@end

@implementation CRKIDSFirewallUpdatingRosterProvider

- (void)dealloc
{
  [(CRKIDSFirewallUpdatingRosterProvider *)self endObservingRosters];
  v3 = [(CRKIDSFirewallUpdatingRosterProvider *)self operationQueue];
  [v3 cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
  [(CRKIDSFirewallUpdatingRosterProvider *)&v4 dealloc];
}

- (CRKIDSFirewallUpdatingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4
{
  return [(CRKIDSFirewallUpdatingRosterProvider *)self initWithPrimaryRosterProvider:a3 secondaryRosterProvider:0 IDSPrimitives:a4];
}

- (CRKIDSFirewallUpdatingRosterProvider)initWithPrimaryRosterProvider:(id)a3 secondaryRosterProvider:(id)a4 IDSPrimitives:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
  v11 = [(CRKASMRosterProviderDecoratorBase *)&v16 initWithRosterProvider:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_secondaryRosterProvider, a4);
    objc_storeStrong((id *)&v12->_IDSPrimitives, a5);
    uint64_t v13 = objc_opt_new();
    operationQueue = v12->_operationQueue;
    v12->_operationQueue = (CATOperationQueue *)v13;

    [(CRKIDSFirewallUpdatingRosterProvider *)v12 beginObservingRosters];
    [(CRKIDSFirewallUpdatingRosterProvider *)v12 performSelectorOnMainThread:sel_rosterDidChange withObject:0 waitUntilDone:0];
  }

  return v12;
}

- (void)rosterDidChange
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"CRKIDSFirewallUpdatingRosterProvider.m", 76, @"%@ must be called from the main thread", v13 object file lineNumber description];
  }
  if ([(CRKIDSFirewallUpdatingRosterProvider *)self areRosterProvidersPopulated])
  {
    objc_super v4 = [(CRKIDSFirewallUpdatingRosterProvider *)self primaryRosterProvider];
    v5 = [v4 roster];

    v6 = [(CRKIDSFirewallUpdatingRosterProvider *)self makeTrustedAppleIDs];
    v7 = [CRKSynchronizeIDSFirewallOperation alloc];
    v8 = [(CRKIDSFirewallUpdatingRosterProvider *)self IDSPrimitives];
    id v9 = [(CRKSynchronizeIDSFirewallOperation *)v7 initWithIDSPrimitives:v8 localStorage:self trustedRosterAppleIDs:v6];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke;
    v14[3] = &unk_2646F3660;
    v14[4] = self;
    id v15 = v5;
    id v10 = v5;
    v11 = +[CRKBlockOperation blockOperationWithBlock:v14];
    [(CRKSynchronizeIDSFirewallOperation *)v9 addTarget:self selector:sel_synchronizeFirewallOperationDidFail_ forOperationEvents:4];
    [(CRKIDSFirewallUpdatingRosterProvider *)self enqueueWorkOperation:v9];
    [(CRKIDSFirewallUpdatingRosterProvider *)self enqueueWorkOperation:v11];
  }
}

void __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke_2;
  block[3] = &unk_2646F3CB8;
  objc_super v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__CRKIDSFirewallUpdatingRosterProvider_rosterDidChange__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) publishedRoster];
  if (v2 || *(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) publishedRoster];
    char v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if ((v4 & 1) == 0) {
      [*(id *)(a1 + 32) setPublishedRoster:*(void *)(a1 + 40)];
    }
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

- (void)enqueueWorkOperation:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v5 = [(CRKIDSFirewallUpdatingRosterProvider *)self lastWorkOperation];

    if (v5)
    {
      v6 = [(CRKIDSFirewallUpdatingRosterProvider *)self lastWorkOperation];
      [v8 addDependency:v6];
    }
    [(CRKIDSFirewallUpdatingRosterProvider *)self setLastWorkOperation:v8];
    id v7 = [(CRKIDSFirewallUpdatingRosterProvider *)self operationQueue];
    [v7 addOperation:v8];
  }
  else
  {
    [(CRKIDSFirewallUpdatingRosterProvider *)self performSelectorOnMainThread:a2 withObject:v8 waitUntilDone:0];
  }
}

- (void)synchronizeFirewallOperationDidFail:(id)a3
{
  id v3 = a3;
  char v4 = [v3 error];
  id v5 = [v4 domain];
  if ([v5 isEqual:*MEMORY[0x263F399F0]])
  {
    v6 = [v3 error];
    uint64_t v7 = [v6 code];

    if (v7 == 404) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (_CRKLogASM_onceToken_9 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_9, &__block_literal_global_104);
  }
  id v8 = (void *)_CRKLogASM_logObj_9;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_9, OS_LOG_TYPE_ERROR)) {
    -[CRKIDSFirewallUpdatingRosterProvider synchronizeFirewallOperationDidFail:](v8, v3);
  }
LABEL_9:
}

+ (id)keyPathsForValuesAffectingRoster
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"publishedRoster"];
}

+ (id)observedKeyPaths
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"roster";
  v4[1] = @"populated";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)beginObservingRosters
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![(CRKIDSFirewallUpdatingRosterProvider *)self isObservingRosters])
  {
    [(CRKIDSFirewallUpdatingRosterProvider *)self setObservingRosters:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(id)objc_opt_class() observedKeyPaths];
    uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v19;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v8 = [(CRKIDSFirewallUpdatingRosterProvider *)self rosterProviders];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v15;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v15 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v14 + 1) + 8 * v12++) addObserver:self forKeyPath:v7 options:0 context:@"ObservationContext"];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }
  }
}

- (void)endObservingRosters
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(CRKIDSFirewallUpdatingRosterProvider *)self isObservingRosters])
  {
    [(CRKIDSFirewallUpdatingRosterProvider *)self setObservingRosters:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(id)objc_opt_class() observedKeyPaths];
    uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v19;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v8 = [(CRKIDSFirewallUpdatingRosterProvider *)self rosterProviders];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v15;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v15 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v14 + 1) + 8 * v12++) removeObserver:self forKeyPath:v7 context:@"ObservationContext"];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"ObservationContext")
  {
    [(CRKIDSFirewallUpdatingRosterProvider *)self rosterDidChange];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKIDSFirewallUpdatingRosterProvider;
    -[CRKIDSFirewallUpdatingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)rosterProviders
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CRKIDSFirewallUpdatingRosterProvider *)self secondaryRosterProvider];

  uint64_t v4 = [(CRKIDSFirewallUpdatingRosterProvider *)self primaryRosterProvider];
  uint64_t v5 = (void *)v4;
  if (v3)
  {
    uint64_t v6 = [(CRKIDSFirewallUpdatingRosterProvider *)self secondaryRosterProvider];
    v9[1] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  }
  else
  {
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }

  return v7;
}

- (BOOL)areRosterProvidersPopulated
{
  v2 = [(CRKIDSFirewallUpdatingRosterProvider *)self rosterProviders];
  char v3 = objc_msgSend(v2, "crk_allObjectsMatchPredicate:", &__block_literal_global_18);

  return v3;
}

uint64_t __67__CRKIDSFirewallUpdatingRosterProvider_areRosterProvidersPopulated__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPopulated];
}

- (id)makeTrustedAppleIDs
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(CRKIDSFirewallUpdatingRosterProvider *)self rosterProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = [v9 roster];
        uint64_t v12 = [v10 trustedUserAppleIDsFromRoster:v11];
        [v3 unionSet:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v13 = (void *)[v3 copy];

  return v13;
}

+ (id)trustedUserAppleIDsFromRoster:(id)a3
{
  char v3 = (void *)MEMORY[0x263EFFA08];
  if (a3)
  {
    uint64_t v4 = [a3 courses];
    uint64_t v5 = objc_msgSend(v4, "crk_flatMapUsingBlock:", &__block_literal_global_33);
    uint64_t v6 = [v3 setWithArray:v5];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }

  return v6;
}

id __70__CRKIDSFirewallUpdatingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 trustedUsers];
  char v3 = objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_36);

  return v3;
}

uint64_t __70__CRKIDSFirewallUpdatingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appleID];
}

- (NSSet)allowedAppleIDs
{
  return self->_allowedAppleIDs;
}

- (void)setAllowedAppleIDs:(id)a3
{
}

- (CRKASMRosterProviding)secondaryRosterProvider
{
  return self->_secondaryRosterProvider;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (BOOL)isObservingRosters
{
  return self->_observingRosters;
}

- (void)setObservingRosters:(BOOL)a3
{
  self->_observingRosters = a3;
}

- (CRKASMRoster)publishedRoster
{
  return self->_publishedRoster;
}

- (void)setPublishedRoster:(id)a3
{
}

- (CATOperation)lastWorkOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastWorkOperation);

  return (CATOperation *)WeakRetained;
}

- (void)setLastWorkOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastWorkOperation);
  objc_storeStrong((id *)&self->_publishedRoster, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
  objc_storeStrong((id *)&self->_secondaryRosterProvider, 0);

  objc_storeStrong((id *)&self->_allowedAppleIDs, 0);
}

- (void)synchronizeFirewallOperationDidFail:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v3 = a1;
  uint64_t v4 = [a2 error];
  uint64_t v5 = [v4 localizedDescription];
  int v6 = 138543362;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Failed to synchronize IDS firewall. Error: %{public}@", (uint8_t *)&v6, 0xCu);
}

@end