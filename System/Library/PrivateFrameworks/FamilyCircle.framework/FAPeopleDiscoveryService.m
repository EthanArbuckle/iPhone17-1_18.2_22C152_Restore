@interface FAPeopleDiscoveryService
+ (id)sharedInstance;
- (FAPeopleDiscoveryService)init;
- (id)getNearbyPeople;
- (void)dealloc;
- (void)startMonitoringProximity;
- (void)stopMonitoringProximity;
@end

@implementation FAPeopleDiscoveryService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __42__FAPeopleDiscoveryService_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(FAPeopleDiscoveryService);
  return MEMORY[0x1F41817F8]();
}

- (FAPeopleDiscoveryService)init
{
  v8.receiver = self;
  v8.super_class = (Class)FAPeopleDiscoveryService;
  v2 = [(FAPeopleDiscoveryService *)&v8 init];
  if (v2)
  {
    v3 = (RPPeopleDiscovery *)objc_alloc_init(MEMORY[0x1E4F94728]);
    peopleDiscovery = v2->_peopleDiscovery;
    v2->_peopleDiscovery = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.family.peoplediscovery", v5);
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDispatchQueue:v6];

    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDiscoveryMode:400];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setDiscoveryFlags:88];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setScanRate:20];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setChangeFlags:0xFFFFFFFFLL];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonFoundHandler:&__block_literal_global_5];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonLostHandler:&__block_literal_global_8];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setPersonChangedHandler:&__block_literal_global_12];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setInvalidationHandler:&__block_literal_global_16];
    [(RPPeopleDiscovery *)v2->_peopleDiscovery setInterruptionHandler:&__block_literal_global_19];
  }
  return v2;
}

void __32__FAPeopleDiscoveryService_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "Found new person: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__FAPeopleDiscoveryService_init__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "Lost person: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__FAPeopleDiscoveryService_init__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInt:a3];
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "Changed person: %@, changes: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __32__FAPeopleDiscoveryService_init__block_invoke_14()
{
  v0 = _FALogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D252C000, v0, OS_LOG_TYPE_DEFAULT, "People discovery session invalidated", v1, 2u);
  }
}

void __32__FAPeopleDiscoveryService_init__block_invoke_17()
{
  v0 = _FALogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D252C000, v0, OS_LOG_TYPE_DEFAULT, "People discovery session interrupted", v1, 2u);
  }
}

- (void)dealloc
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "dealloc people discovery", buf, 2u);
  }

  [(RPPeopleDiscovery *)self->_peopleDiscovery invalidate];
  v4.receiver = self;
  v4.super_class = (Class)FAPeopleDiscoveryService;
  [(FAPeopleDiscoveryService *)&v4 dealloc];
}

- (void)startMonitoringProximity
{
}

void __52__FAPeopleDiscoveryService_startMonitoringProximity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _FALogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "Error activating people discovery: %@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "Activated people discovery";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (void)stopMonitoringProximity
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D252C000, v3, OS_LOG_TYPE_DEFAULT, "invalidating people discovery", v4, 2u);
  }

  [(RPPeopleDiscovery *)self->_peopleDiscovery invalidate];
}

- (id)getNearbyPeople
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(RPPeopleDiscovery *)self->_peopleDiscovery dispatchQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__FAPeopleDiscoveryService_getNearbyPeople__block_invoke;
  v9[3] = &unk_1E69253B0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, v9);

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __43__FAPeopleDiscoveryService_getNearbyPeople__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) discoveredPeople];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v15 + 1) + 8 * i) contactID];
        if (v7) {
          [*(id *)(a1 + 40) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }
  uint64_t v8 = [v2 count];
  id v9 = _FALogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      v12 = "Found nearby people: %@, nearbyContactIDs: %@";
      v13 = v9;
      uint32_t v14 = 22;
LABEL_15:
      _os_log_impl(&dword_1D252C000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    v12 = "No nearby people to boost family suggestions";
    v13 = v9;
    uint32_t v14 = 2;
    goto LABEL_15;
  }
}

- (void).cxx_destruct
{
}

@end