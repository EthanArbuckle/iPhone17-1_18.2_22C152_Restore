@interface EMVIPManager
+ (NSXPCInterface)remoteInterface;
+ (OS_os_log)log;
+ (id)_plistURL;
- (BOOL)hasVIPs;
- (BOOL)isUsingRemoteConnection;
- (BOOL)isVIPAddress:(id)a3;
- (EAEmailAddressSet)allVIPEmailAddresses;
- (EFPromise)vipsByIdentifierPromise;
- (EMRemoteConnection)connection;
- (EMVIPManager)init;
- (EMVIPManager)initWithRemoteConnection:(id)a3;
- (NSSet)allVIPWaitForResult;
- (NSSet)allVIPs;
- (id)_vipsByIdentifier;
- (id)_vipsByIdentifierFuture;
- (id)_vipsDictionaryFromPlist;
- (id)vipWithIdentifier:(id)a3;
- (void)_loadVIPs;
- (void)_reset;
- (void)_startObservingVIPChangesIfNecessary;
- (void)dealloc;
- (void)didFinishBlockingMainThreadForFuture:(id)a3;
- (void)didStartBlockingMainThreadForFuture:(id)a3;
- (void)getAllVIPsWithCompletion:(id)a3;
- (void)observer:(id)a3 gotVIPs:(id)a4;
- (void)observer:(id)a3 updatedVIPs:(id)a4 removedVIPs:(id)a5;
- (void)removeVIPsWithEmailAddresses:(id)a3;
- (void)removeVIPsWithIdentifiers:(id)a3;
- (void)saveVIPs:(id)a3;
- (void)setConnection:(id)a3;
- (void)setVipsByIdentifierPromise:(id)a3;
@end

@implementation EMVIPManager

+ (NSXPCInterface)remoteInterface
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A7C3F8];
  [v10 setClasses:v2 forSelector:sel_observer_gotVIPs_ argumentIndex:0 ofReply:0];
  [v10 setClasses:v5 forSelector:sel_observer_gotVIPs_ argumentIndex:1 ofReply:0];
  [v10 setClasses:v2 forSelector:sel_observer_updatedVIPs_removedVIPs_ argumentIndex:0 ofReply:0];
  [v10 setClasses:v5 forSelector:sel_observer_updatedVIPs_removedVIPs_ argumentIndex:1 ofReply:0];
  [v10 setClasses:v5 forSelector:sel_observer_updatedVIPs_removedVIPs_ argumentIndex:2 ofReply:0];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A869D8];
  [v11 setInterface:v10 forSelector:sel_registerObserver_observationIdentifier_ argumentIndex:0 ofReply:0];
  [v11 setClasses:v2 forSelector:sel_registerObserver_observationIdentifier_ argumentIndex:1 ofReply:0];
  [v11 setClasses:v2 forSelector:sel_cancelObservation_ argumentIndex:0 ofReply:0];
  [v11 setClasses:v5 forSelector:sel_saveVIPs_ argumentIndex:0 ofReply:0];
  [v11 setClasses:v8 forSelector:sel_removeVIPsWithIdentifiers_ argumentIndex:0 ofReply:0];
  [v11 setClasses:v9 forSelector:sel_removeVIPsWithEmailAddresses_ argumentIndex:0 ofReply:0];

  return (NSXPCInterface *)v11;
}

- (EMVIPManager)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMVIPManager;
  v6 = [(EMVIPManager *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_vipsLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F60E18] promise];
    vipsByIdentifierPromise = v7->_vipsByIdentifierPromise;
    v7->_vipsByIdentifierPromise = (EFPromise *)v8;

    v10 = [(EFPromise *)v7->_vipsByIdentifierPromise future];
    [v10 setDelegate:v7];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__EMVIPManager_initWithRemoteConnection___block_invoke;
    v13[3] = &unk_1E63E2688;
    objc_copyWeak(&v14, &location);
    [(EMRemoteConnection *)connection addResetHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__EMVIPManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_43 != -1) {
    dispatch_once(&log_onceToken_43, block);
  }
  v2 = (void *)log_log_43;
  return (OS_os_log *)v2;
}

void __19__EMVIPManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_43;
  log_log_43 = (uint64_t)v1;
}

- (EMVIPManager)init
{
  if (sharedClientVIPManager_onceToken != -1) {
    dispatch_once(&sharedClientVIPManager_onceToken, &__block_literal_global_192);
  }
  id v3 = (EMVIPManager *)(id)sharedClientVIPManager_vipManager;

  return v3;
}

void __41__EMVIPManager_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reset];
}

- (void)dealloc
{
  [(EFCancelationToken *)self->_observerCancelationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)EMVIPManager;
  [(EMVIPManager *)&v3 dealloc];
}

- (BOOL)isUsingRemoteConnection
{
  v2 = [(EMVIPManager *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_startObservingVIPChangesIfNecessary
{
  if ([(EMVIPManager *)self isUsingRemoteConnection])
  {
    os_unfair_lock_lock(&self->_vipsLock);
    if (!self->_observerCancelationToken)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, self);
      BOOL v3 = [(EMVIPManager *)self connection];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke;
      v15[3] = &unk_1E63E6188;
      objc_copyWeak(&v16, location);
      uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v15];

      id v5 = [[EMObjectID alloc] initAsEphemeralID:1];
      [v4 registerObserver:self observationIdentifier:v5];
      v6 = (void *)MEMORY[0x1E4F60D40];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_95;
      v12[3] = &unk_1E63E2760;
      id v7 = v4;
      id v13 = v7;
      id v8 = v5;
      id v14 = v8;
      v9 = [v6 tokenWithCancelationBlock:v12];
      observerCancelationToken = self->_observerCancelationToken;
      self->_observerCancelationToken = v9;

      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(&self->_vipsLock);
  }
  else
  {
    v11 = +[EMVIPManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "Not setting up VIP observer because a remote connection is not setup.", (uint8_t *)location, 2u);
    }
  }
}

void __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[EMVIPManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(v3, "ef_publicDescription");
    __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_cold_1(v6, v7, v5);
  }

  [WeakRetained _reset];
}

uint64_t __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_95(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelObservation:*(void *)(a1 + 40)];
}

- (void)_reset
{
  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(&self->_vipsLock);
  if (self->_observerCancelationToken)
  {
    id v9 = [(EMVIPManager *)self vipsByIdentifierPromise];
    uint64_t v4 = [MEMORY[0x1E4F60E18] promise];
    [(EMVIPManager *)self setVipsByIdentifierPromise:v4];

    id v5 = [(EMVIPManager *)self vipsByIdentifierPromise];
    v6 = [v5 future];
    [v6 setDelegate:self];

    [(EAEmailAddressSet *)self->_cachedEmailAddresses removeAllObjects];
    [(EFCancelationToken *)self->_observerCancelationToken removeAllCancelationBlocks];
    observerCancelationToken = self->_observerCancelationToken;
    self->_observerCancelationToken = 0;

    os_unfair_lock_unlock(p_vipsLock);
    if (v9)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
      [v9 finishWithError:v8];
    }
  }
  else
  {
    os_unfair_lock_unlock(p_vipsLock);
  }
}

- (BOOL)hasVIPs
{
  v2 = (os_unfair_lock_s *)self;
  id v3 = [(EMVIPManager *)self _vipsByIdentifier];
  v2 += 2;
  os_unfair_lock_lock(v2);
  BOOL v4 = [v3 count] != 0;
  os_unfair_lock_unlock(v2);

  return v4;
}

- (BOOL)isVIPAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(EMVIPManager *)self allVIPEmailAddresses];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)allVIPWaitForResult
{
  if (![(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:199 description:@"This can only be called when using a remote connection."];
  }
  id v4 = [(EMVIPManager *)self vipsByIdentifierPromise];
  [(EMVIPManager *)self _startObservingVIPChangesIfNecessary];
  id v5 = [v4 future];
  char v6 = [v5 result:0];

  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(p_vipsLock);
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v9 = [v6 allValues];
  v10 = (void *)[v8 initWithArray:v9];

  os_unfair_lock_unlock(p_vipsLock);
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v12 = v11;

  return (NSSet *)v12;
}

- (NSSet)allVIPs
{
  v2 = (os_unfair_lock_s *)self;
  id v3 = [(EMVIPManager *)self _vipsByIdentifier];
  v2 += 2;
  os_unfair_lock_lock(v2);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v3 allValues];
  char v6 = (void *)[v4 initWithArray:v5];

  os_unfair_lock_unlock(v2);
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  id v8 = v7;

  return (NSSet *)v8;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  id v3 = [(EMVIPManager *)self _vipsByIdentifier];
  p_vipsLock = &self->_vipsLock;
  os_unfair_lock_lock(&self->_vipsLock);
  cachedEmailAddresses = self->_cachedEmailAddresses;
  if (!cachedEmailAddresses)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F605B8]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__EMVIPManager_allVIPEmailAddresses__block_invoke;
    v14[3] = &unk_1E63E6D10;
    id v7 = v6;
    id v15 = v7;
    [v3 enumerateKeysAndObjectsUsingBlock:v14];
    id v8 = (EAEmailAddressSet *)[v7 copy];
    id v9 = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = v8;

    cachedEmailAddresses = self->_cachedEmailAddresses;
  }
  v10 = cachedEmailAddresses;
  os_unfair_lock_unlock(p_vipsLock);
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = (EAEmailAddressSet *)objc_alloc_init(MEMORY[0x1E4F605B8]);
  }
  v12 = v11;

  return v12;
}

void __36__EMVIPManager_allVIPEmailAddresses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 emailAddresses];
  objc_msgSend(v3, "unionSet:");
}

- (id)vipWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(EMVIPManager *)self _vipsByIdentifier];
  self = (EMVIPManager *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  id v6 = [v5 objectForKeyedSubscript:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)self);

  return v6;
}

- (void)getAllVIPsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v5 = [(EMVIPManager *)self _vipsByIdentifierFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke;
    v9[3] = &unk_1E63E6D38;
    id v6 = v4;
    id v10 = v6;
    [v5 addSuccessBlock:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke_2;
    v7[3] = &unk_1E63E2C40;
    id v8 = v6;
    [v5 addFailureBlock:v7];
  }
  else
  {
    id v5 = [(EMVIPManager *)self allVIPs];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v5, 0);
  }
}

void __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v7 allValues];
  id v6 = (void *)[v4 initWithArray:v5];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
}

uint64_t __41__EMVIPManager_getAllVIPsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveVIPs:(id)a3
{
  id v8 = a3;
  if (![(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:275 description:@"Not supported when not using a remote connection."];
  }
  [(EMVIPManager *)self _startObservingVIPChangesIfNecessary];
  id v5 = [(EMVIPManager *)self connection];
  id v6 = [v5 reattemptingRemoteObjectProxy];
  [v6 saveVIPs:v8];
}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  id v8 = a3;
  if (![(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:281 description:@"Not supported when not using a remote connection."];
  }
  [(EMVIPManager *)self _startObservingVIPChangesIfNecessary];
  id v5 = [(EMVIPManager *)self connection];
  id v6 = [v5 reattemptingRemoteObjectProxy];
  [v6 removeVIPsWithIdentifiers:v8];
}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  id v8 = a3;
  if (![(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:287 description:@"Not supported when not using a remote connection."];
  }
  [(EMVIPManager *)self _startObservingVIPChangesIfNecessary];
  id v5 = [(EMVIPManager *)self connection];
  id v6 = [v5 reattemptingRemoteObjectProxy];
  [v6 removeVIPsWithEmailAddresses:v8];
}

- (id)_vipsByIdentifierFuture
{
  if (![(EMVIPManager *)self isUsingRemoteConnection])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:295 description:@"This can only be called when using a remote connection."];
  }
  id v4 = [(EMVIPManager *)self vipsByIdentifierPromise];
  [(EMVIPManager *)self _startObservingVIPChangesIfNecessary];
  id v5 = [v4 future];

  return v5;
}

- (id)_vipsByIdentifier
{
  if ([(EMVIPManager *)self isUsingRemoteConnection])
  {
    uint64_t v3 = [(EMVIPManager *)self _vipsByIdentifierFuture];
    id v4 = [v3 resultIfAvailable];

    id v5 = (void *)MEMORY[0x1E4F1CC08];
    if (v4) {
      id v5 = v4;
    }
    id v6 = v5;
  }
  else
  {
    vipsByIdentifier = self->_vipsByIdentifier;
    if (!vipsByIdentifier)
    {
      [(EMVIPManager *)self _loadVIPs];
      vipsByIdentifier = self->_vipsByIdentifier;
    }
    id v6 = vipsByIdentifier;
  }
  return v6;
}

- (void)_loadVIPs
{
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  vipsByIdentifier = self->_vipsByIdentifier;
  self->_vipsByIdentifier = v3;

  id v5 = [(EMVIPManager *)self _vipsDictionaryFromPlist];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__EMVIPManager__loadVIPs__block_invoke;
  v6[3] = &unk_1E63E6838;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __25__EMVIPManager__loadVIPs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"Name"];
  id v7 = [v5 objectForKeyedSubscript:@"EmailAddresses"];
  id v8 = [EMVIP alloc];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F605B8]) initWithArray:v7];
  id v10 = [(EMVIP *)v8 initWithIdentifier:v11 name:v6 emailAddresses:v9];

  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v10 forKeyedSubscript:v11];
}

- (id)_vipsDictionaryFromPlist
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = [(id)objc_opt_class() _plistURL];
  id v4 = (void *)[v2 initWithContentsOfURL:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_plistURL
{
  if (_plistURL_onceToken != -1) {
    dispatch_once(&_plistURL_onceToken, &__block_literal_global_60);
  }
  id v2 = (void *)_plistURL_url;
  return v2;
}

void __25__EMVIPManager__plistURL__block_invoke()
{
  id v2 = +[EMPersistenceLayoutManager mailDataDirectory];
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"VIPs.plist" isDirectory:0];
  os_log_t v1 = (void *)_plistURL_url;
  _plistURL_url = v0;
}

- (void)observer:(id)a3 gotVIPs:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[EMVIPManager log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [v5 count];
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "got VIPs with count %lu", buf, 0xCu);
  }

  id v7 = +[EMVIPManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[EMVIPManager observer:gotVIPs:]((uint64_t)v5, v7);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "identifier", (void)v21);
        [v8 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }

  id v15 = [(EMVIPManager *)self vipsByIdentifierPromise];
  [v15 finishWithResult:v8];

  if ([v8 count])
  {
    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    v17 = [v8 allValues];
    v18 = [v16 setWithArray:v17];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v25 = @"VIPsUpdated";
    v26 = v18;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v19 postNotificationName:@"VIPsDidChange" object:self userInfo:v20];
  }
}

- (void)observer:(id)a3 updatedVIPs:(id)a4 removedVIPs:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[EMVIPManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v53 = [v8 count];
    __int16 v54 = 2048;
    uint64_t v55 = [v9 count];
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "updated VIPs with count %lu and removed VIPs with count %lu", buf, 0x16u);
  }

  uint64_t v11 = +[EMVIPManager log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v53 = (uint64_t)v8;
    __int16 v54 = 2112;
    uint64_t v55 = (uint64_t)v9;
    _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "updated VIPs: %@ and removed VIPs: %@", buf, 0x16u);
  }

  uint64_t v12 = [v8 count];
  uint64_t v35 = [v9 count];
  id v13 = [(EMVIPManager *)self vipsByIdentifierPromise];
  id v14 = [v13 future];
  if (![v14 isFinished]) {
    goto LABEL_30;
  }
  uint64_t v34 = v12;

  if (__PAIR128__(v35, v12) != 0)
  {
    id v15 = [(EMVIPManager *)self vipsByIdentifierPromise];
    id v16 = [v15 future];
    id v13 = [v16 resultIfAvailable:0];

    if (!v13)
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2 object:self file:@"EMVIPManager.m" lineNumber:375 description:@"unexpected call to observer:updatedVIPs:removedVIPs: called before observer:gotVIPs:"];
    }
    os_unfair_lock_lock(&self->_vipsLock);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v22 = [v21 identifier];
          [v13 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v18);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v9;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = [*(id *)(*((void *)&v36 + 1) + 8 * j) identifier];
          [v13 setObject:0 forKeyedSubscript:v27];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v24);
    }

    cachedEmailAddresses = self->_cachedEmailAddresses;
    self->_cachedEmailAddresses = 0;

    os_unfair_lock_unlock(&self->_vipsLock);
    if (v34 == 0 || v35 == 0)
    {
      if (v34)
      {
        v46 = @"VIPsUpdated";
        id v47 = v17;
        uint64_t v29 = &v46;
        uint64_t v30 = &v47;
      }
      else
      {
        v44 = @"VIPsRemoved";
        id v45 = v23;
        uint64_t v29 = &v44;
        uint64_t v30 = &v45;
      }
      uint64_t v31 = 1;
    }
    else
    {
      v48[0] = @"VIPsUpdated";
      v48[1] = @"VIPsRemoved";
      v49[0] = v17;
      v49[1] = v23;
      uint64_t v29 = (__CFString **)v48;
      uint64_t v30 = (id *)v49;
      uint64_t v31 = 2;
    }
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:v31];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 postNotificationName:@"VIPsDidChange" object:self userInfo:v14];

LABEL_30:
  }
}

- (void)didStartBlockingMainThreadForFuture:(id)a3
{
  id v6 = [(EMVIPManager *)self connection];
  id v4 = [v6 requestRecoveryAssertion];
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = v4;
}

- (void)didFinishBlockingMainThreadForFuture:(id)a3
{
  [(EMRemoteConnectionRecoveryAssertion *)self->_connectionRecoveryAssertion invalidate];
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = 0;
}

- (EMRemoteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (EFPromise)vipsByIdentifierPromise
{
  return (EFPromise *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVipsByIdentifierPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipsByIdentifierPromise, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_vipsByIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionRecoveryAssertion, 0);
  objc_storeStrong((id *)&self->_observerCancelationToken, 0);
  objc_storeStrong((id *)&self->_cachedEmailAddresses, 0);
}

void __52__EMVIPManager__startObservingVIPChangesIfNecessary__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "EMVIPManagerInterface failed with error: %{public}@", buf, 0xCu);
}

- (void)observer:(uint64_t)a1 gotVIPs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_DEBUG, "got VIPs: %@", (uint8_t *)&v2, 0xCu);
}

@end