@interface _ICLexiconManager
+ (unint64_t)countWords:(id)a3;
- (OS_dispatch_queue)serialQueue;
- (_ICLexiconManager)initWithLexiconSources:(id)a3;
- (_ICNamedEntityStore)namedEntityStore;
- (id)addContactObserver:(id)a3;
- (id)addNamedEntitiesUpdateObserver:(id)a3;
- (id)loadLexicons;
- (id)loadLexicons:(id)a3;
- (id)stateName:(int)a3;
- (int)contactLoadState;
- (int)debugEntityLoadState;
- (int)namedEntityLoadState;
- (unint64_t)getContactCount;
- (void)_actuallyLoadLexicons;
- (void)_notifyNamedEntitiesUpdateObservers;
- (void)addContact:(id)a3;
- (void)changeContactLoadingState:(int)a3;
- (void)changeNamedEntityLoadingState:(int)a3;
- (void)completeContacts;
- (void)completeNamedEntities;
- (void)completeRecentContacts;
- (void)completeRecentNamedEntities;
- (void)dealloc;
- (void)doLoadLexicon;
- (void)handleContact:(id)a3;
- (void)handleNamedEntity:(id)a3;
- (void)handleRecentContact:(id)a3;
- (void)handleRecentNamedEntity:(id)a3;
- (void)hibernate;
- (void)printLexiconToNSLog:(_LXLexicon *)a3;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)removeContact:(id)a3;
- (void)removeContactObserver:(id)a3;
- (void)removeNamedEntitiesUpdateObserver:(id)a3;
- (void)resetNamedEntities;
- (void)setContactLoadState:(int)a3;
- (void)setNamedEntityLoadState:(int)a3;
- (void)setNamedEntityStore:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setupContacts;
- (void)setupNamedEntities;
- (void)setupRecentContacts;
- (void)setupRecentNamedEntities;
- (void)unloadLexicons;
- (void)warmUp;
@end

@implementation _ICLexiconManager

- (_ICLexiconManager)initWithLexiconSources:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_ICLexiconManager;
  v6 = [(_ICLexiconManager *)&v27 init];
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_contactsCallbackLock, 0);
    pthread_mutex_init(&v7->_namedEntityCallbackLock, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    v10 = [MEMORY[0x263F08C38] UUID];
    v11 = [v10 UUIDString];
    v12 = [@"com.apple.inputcontext.lexiconmanager." stringByAppendingString:v11];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], v9);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v7->_sources, a3);
    uint64_t v16 = objc_opt_new();
    contacts = v7->_contacts;
    v7->_contacts = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    contactObservers = v7->_contactObservers;
    v7->_contactObservers = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    namedEntitiesUpdateObservers = v7->_namedEntitiesUpdateObservers;
    v7->_namedEntitiesUpdateObservers = (NSMutableArray *)v20;

    *(void *)&v7->_contactChangeCount = 0;
    v7->_namedEntityLoadState = 0;
    v22 = [[_ICNamedEntityStore alloc] initWithName:@"InputContext-NamedEntity"];
    namedEntityStore = v7->_namedEntityStore;
    v7->_namedEntityStore = v22;

    v24 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v5 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v25;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_235496000, v24, OS_LOG_TYPE_DEFAULT, "initialized lexicon manager with %lu sources and serial queue %@", buf, 0x16u);
    }
  }
  return v7;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_contactsCallbackLock);
  pthread_mutex_destroy(&self->_namedEntityCallbackLock);
  v3.receiver = self;
  v3.super_class = (Class)_ICLexiconManager;
  [(_ICLexiconManager *)&v3 dealloc];
}

- (void)doLoadLexicon
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_DEFAULT, "_ICLexiconManager loading lexicons", buf, 2u);
  }

  [(_ICLexiconManager *)self changeContactLoadingState:1];
  [(_ICLexiconManager *)self changeNamedEntityLoadingState:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = self->_sources;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "startLoadingWithManager:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)stateName:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"Unloaded";
  }
  else {
    return off_264C56308[a3 - 1];
  }
}

- (void)changeContactLoadingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ICPersContactOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(_ICLexiconManager *)self stateName:self->_contactLoadState];
    uint64_t v7 = [(_ICLexiconManager *)self stateName:v3];
    int v8 = 138412546;
    long long v9 = v6;
    __int16 v10 = 2112;
    long long v11 = v7;
    _os_log_impl(&dword_235496000, v5, OS_LOG_TYPE_INFO, "Contacts: State Change: %@ to %@", (uint8_t *)&v8, 0x16u);
  }
  self->_contactLoadState = v3;
}

- (void)changeNamedEntityLoadingState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(_ICLexiconManager *)self stateName:self->_namedEntityLoadState];
    uint64_t v7 = [(_ICLexiconManager *)self stateName:v3];
    int v8 = 138412546;
    long long v9 = v6;
    __int16 v10 = 2112;
    long long v11 = v7;
    _os_log_impl(&dword_235496000, v5, OS_LOG_TYPE_INFO, "Named Entities: State Change: %@ to %@", (uint8_t *)&v8, 0x16u);
  }
  self->_namedEntityLoadState = v3;
}

- (void)_actuallyLoadLexicons
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42___ICLexiconManager__actuallyLoadLexicons__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)loadLexicons:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  id v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34___ICLexiconManager_loadLexicons___block_invoke;
  v8[3] = &unk_264C56228;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(serialQueue, v8);
  [(_ICLexiconManager *)self _actuallyLoadLexicons];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)loadLexicons
{
  v7[2] = *MEMORY[0x263EF8340];
  [(_ICLexiconManager *)self _actuallyLoadLexicons];
  uint64_t v3 = [(_ICNamedEntityStore *)self->_namedEntityStore wordLexicon];
  v7[0] = v3;
  id v4 = [(_ICNamedEntityStore *)self->_namedEntityStore phraseLexicon];
  v7[1] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)unloadLexicons
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(_ICLexiconManager *)self stateName:self->_contactLoadState];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_INFO, " Unloading, state = %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35___ICLexiconManager_unloadLexicons__block_invoke;
  v6[3] = &unk_264C56070;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  dispatch_async(serialQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___ICLexiconManager_addContactObserver___block_invoke;
  block[3] = &unk_264C56250;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(serialQueue, block);
  uint64_t v9 = (void *)MEMORY[0x237DDFA40](v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

- (void)removeContactObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___ICLexiconManager_removeContactObserver___block_invoke;
  block[3] = &unk_264C56278;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  id v4 = (void *)[a3 copy];
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52___ICLexiconManager_addNamedEntitiesUpdateObserver___block_invoke;
  block[3] = &unk_264C56278;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);
  id v7 = (void *)MEMORY[0x237DDFA40](v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (void)removeNamedEntitiesUpdateObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55___ICLexiconManager_removeNamedEntitiesUpdateObserver___block_invoke;
  block[3] = &unk_264C56278;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyNamedEntitiesUpdateObservers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSMutableArray *)self->_namedEntitiesUpdateObservers count];
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = self;
    __int16 v17 = 2048;
    uint64_t v18 = v4;
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_DEFAULT, "%p Calling %ld named entities update observers", buf, 0x16u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_namedEntitiesUpdateObservers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addContact:(id)a3
{
  id v4 = a3;
  int v5 = [v4 source];
  uint64_t v6 = _ICPersNamedEntityOSLogFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 1)
  {
    if (v7) {
      -[_ICLexiconManager addContact:]((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v6 = [v4 contact];
    contacts = self->_contacts;
    uint64_t v15 = [v4 identifier];
    [(NSMutableDictionary *)contacts setObject:v6 forKeyedSubscript:v15];
  }
  else if (v7)
  {
    -[_ICLexiconManager addContact:]((uint64_t)v4, v6, v8, v9, v10, v11, v12, v13);
  }
}

- (void)removeContact:(id)a3
{
  id v4 = a3;
  int v5 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_ICLexiconManager removeContact:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

  contacts = self->_contacts;
  uint64_t v13 = [v4 identifier];
  [(NSMutableDictionary *)contacts removeObjectForKey:v13];
}

- (void)resetNamedEntities
{
  p_namedEntityCallbackLock = &self->_namedEntityCallbackLock;
  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39___ICLexiconManager_resetNamedEntities__block_invoke;
  v5[3] = &unk_264C561D8;
  objc_copyWeak(&v6, &location);
  dispatch_async(serialQueue, v5);
  pthread_mutex_unlock(p_namedEntityCallbackLock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setupNamedEntities
{
  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___ICLexiconManager_setupNamedEntities__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleNamedEntity:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___ICLexiconManager_handleNamedEntity___block_invoke;
  block[3] = &unk_264C562A0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeNamedEntities
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42___ICLexiconManager_completeNamedEntities__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  pthread_mutex_unlock(&self->_namedEntityCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupRecentNamedEntities
{
  pthread_mutex_lock(&self->_namedEntityCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45___ICLexiconManager_setupRecentNamedEntities__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleRecentNamedEntity:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___ICLexiconManager_handleRecentNamedEntity___block_invoke;
  block[3] = &unk_264C562A0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeRecentNamedEntities
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48___ICLexiconManager_completeRecentNamedEntities__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  pthread_mutex_unlock(&self->_namedEntityCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupContacts
{
  pthread_mutex_lock(&self->_contactsCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34___ICLexiconManager_setupContacts__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35___ICLexiconManager_handleContact___block_invoke;
  block[3] = &unk_264C562A0;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(serialQueue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)completeContacts
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37___ICLexiconManager_completeContacts__block_invoke;
  block[3] = &unk_264C562A0;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, block);
  pthread_mutex_unlock(&self->_contactsCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setupRecentContacts
{
  pthread_mutex_lock(&self->_contactsCallbackLock);
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40___ICLexiconManager_setupRecentContacts__block_invoke;
  v4[3] = &unk_264C561D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleRecentContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41___ICLexiconManager_handleRecentContact___block_invoke;
  void v7[3] = &unk_264C560C0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)completeRecentContacts
{
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___ICLexiconManager_completeRecentContacts__block_invoke;
  block[3] = &unk_264C562A0;
  void block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, block);
  pthread_mutex_unlock(&self->_contactsCallbackLock);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)warmUp
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "warmUp", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)hibernate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "hibernate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)printLexiconToNSLog:(_LXLexicon *)a3
{
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1;
  void v5[4] = __Block_byref_object_dispose__1;
  uint64_t v6 = @"IC-DICT: ";
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);
  uint64_t v4 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ICLexiconManager printLexiconToNSLog:]();
  }

  _Block_object_dispose(v5, 8);
}

+ (unint64_t)countWords:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceAndNewlineCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  long long v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_2];
  uint64_t v8 = [v6 count];
  unint64_t v9 = v8 - [v7 count];

  return v9;
}

- (unint64_t)getContactCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36___ICLexiconManager_getContactCount__block_invoke;
  v5[3] = &unk_264C56228;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)debugEntityLoadState
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41___ICLexiconManager_debugEntityLoadState__block_invoke;
  v5[3] = &unk_264C56228;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v9 = self->_sources;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "provideFeedbackForString:type:style:", v8, v6, v5, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (int)contactLoadState
{
  return self->_contactLoadState;
}

- (void)setContactLoadState:(int)a3
{
  self->_contactLoadState = a3;
}

- (int)namedEntityLoadState
{
  return self->_namedEntityLoadState;
}

- (void)setNamedEntityLoadState:(int)a3
{
  self->_namedEntityLoadState = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (_ICNamedEntityStore)namedEntityStore
{
  return self->_namedEntityStore;
}

- (void)setNamedEntityStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_namedEntitiesUpdateObservers, 0);
  objc_storeStrong((id *)&self->_contactObservers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)addContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addContact:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeContact:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)printLexiconToNSLog:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235496000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end