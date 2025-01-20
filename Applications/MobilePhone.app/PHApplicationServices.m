@interface PHApplicationServices
+ (id)getFTVoiceMailOnVoicemailsChanged:(id)a3;
+ (id)sharedInstance;
- (BOOL)isInitializationBlockQueued;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (CNGeminiManager)contactGeminiManager;
- (OS_dispatch_queue)dispatchQueue;
- (PHApplicationServices)init;
- (TUCallProviderManager)callProviderManager;
- (TUMetadataCache)metadataCache;
- (os_unfair_lock_s)accessorLock;
- (void)setCallProviderManager:(id)a3;
- (void)setContactGeminiManager:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInitializationBlockQueued:(BOOL)a3;
- (void)setMetadataCache:(id)a3;
- (void)setSuggestedContactStore:(id)a3;
@end

@implementation PHApplicationServices

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__PHApplicationServices_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sApplicationServices;

  return v2;
}

uint64_t __37__PHApplicationServices_contactStore__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

uint64_t __39__PHApplicationServices_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sApplicationServices;
  sharedInstance_sApplicationServices = (uint64_t)v1;

  return _objc_release_x1(v1, v2);
}

- (PHApplicationServices)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHApplicationServices;
  uint64_t v2 = [(PHApplicationServices *)&v11 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    dispatch_queue_t v5 = dispatch_queue_create("PHApplicationServices.serialQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    [(PHApplicationServices *)v3 setInitializationBlockQueued:1];
    v7 = [(PHApplicationServices *)v3 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __29__PHApplicationServices_init__block_invoke;
    block[3] = &unk_10027C670;
    v10 = v3;
    dispatch_async(v7, block);
  }
  return v3;
}

void __29__PHApplicationServices_init__block_invoke(uint64_t a1)
{
  +[TUCallCapabilities initializeCachedValues];
  id v2 = objc_alloc_init((Class)TUCallProviderManager);
  [*(id *)(a1 + 32) setCallProviderManager:v2];
  uint64_t v3 = +[CNContactStore contactStore];
  [*(id *)(a1 + 32) setContactStore:v3];

  uint64_t v4 = +[CNContactStore suggestedContactStore];
  [*(id *)(a1 + 32) setSuggestedContactStore:v4];

  id v5 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v14[0] = v5;
  id v6 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v14[1] = v6;
  id v7 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v14[2] = v7;
  id v8 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v14[3] = v8;
  v9 = +[NSArray arrayWithObjects:v14 count:4];

  id v10 = [objc_alloc((Class)TUMetadataCache) initWithDataProviders:v9];
  [*(id *)(a1 + 32) setMetadataCache:v10];

  if (+[PHDevice isGeminiCapable])
  {
    objc_super v11 = [v2 telephonyProvider];
    v12 = [v11 identifier];
    id v13 = [v2 providerWithIdentifier:v12];
  }
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];
}

- (void)setInitializationBlockQueued:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3) {
    self->_initializationBlockQueued = v3;
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (CNContactStore)contactStore
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __37__PHApplicationServices_contactStore__block_invoke;
  v19[3] = &unk_10027C710;
  v19[4] = self;
  BOOL v3 = objc_retainBlock(v19);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  ((void (*)(void))v3[2])();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    uint64_t v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __37__PHApplicationServices_contactStore__block_invoke_2;
    block[3] = &unk_10027C6E8;
    v12 = &v13;
    id v5 = v3;
    id v11 = v5;
    dispatch_sync(v4, block);

    uint64_t v6 = ((void (*)(id))v3[2])(v5);
    id v7 = (void *)v14[5];
    v14[5] = v6;
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNContactStore *)v8;
}

id __37__PHApplicationServices_contactStore__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setSuggestedContactStore:(id)a3
{
  id v8 = (CNContactStore *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  suggestedContactStore = self->_suggestedContactStore;
  p_suggestedContactStore = &self->_suggestedContactStore;
  if (suggestedContactStore != v8) {
    objc_storeStrong((id *)p_suggestedContactStore, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setMetadataCache:(id)a3
{
  id v8 = (TUMetadataCache *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  metadataCache = self->_metadataCache;
  p_metadataCache = &self->_metadataCache;
  if (metadataCache != v8) {
    objc_storeStrong((id *)p_metadataCache, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setContactStore:(id)a3
{
  id v8 = (CNContactStore *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactStore = self->_contactStore;
  p_contactStore = &self->_contactStore;
  if (contactStore != v8) {
    objc_storeStrong((id *)p_contactStore, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setCallProviderManager:(id)a3
{
  id v8 = (TUCallProviderManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  callProviderManager = self->_callProviderManager;
  p_callProviderManager = &self->_callProviderManager;
  if (callProviderManager != v8) {
    objc_storeStrong((id *)p_callProviderManager, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isInitializationBlockQueued
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (CNContactStore)suggestedContactStore
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __46__PHApplicationServices_suggestedContactStore__block_invoke;
  v16[3] = &unk_10027C710;
  v16[4] = self;
  BOOL v3 = objc_retainBlock(v16);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  ((void (*)(void))v3[2])();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    uint64_t v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__PHApplicationServices_suggestedContactStore__block_invoke_2;
    block[3] = &unk_10027C6E8;
    v9 = &v10;
    id v8 = v3;
    dispatch_sync(v4, block);
  }
  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNContactStore *)v5;
}

id __46__PHApplicationServices_suggestedContactStore__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

- (TUMetadataCache)metadataCache
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __38__PHApplicationServices_metadataCache__block_invoke;
  v17[3] = &unk_10027C738;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __38__PHApplicationServices_metadataCache__block_invoke_2;
    block[3] = &unk_10027C6E8;
    uint64_t v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

    uint64_t v4 = (void *)v12[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v11, 8);

  return (TUMetadataCache *)v6;
}

id __38__PHApplicationServices_metadataCache__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

- (TUCallProviderManager)callProviderManager
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __44__PHApplicationServices_callProviderManager__block_invoke;
  v17[3] = &unk_10027C6C0;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __44__PHApplicationServices_callProviderManager__block_invoke_70;
    block[3] = &unk_10027C6E8;
    uint64_t v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

    uint64_t v4 = (void *)v12[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v11, 8);

  return (TUCallProviderManager *)v6;
}

id __44__PHApplicationServices_callProviderManager__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t __44__PHApplicationServices_callProviderManager__block_invoke_70(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

- (CNGeminiManager)contactGeminiManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  if (!contactGeminiManager)
  {
    id v5 = (CNGeminiManager *)[objc_alloc((Class)CNGeminiManager) initWithCallProviderManager:self->_callProviderManager];
    id v6 = self->_contactGeminiManager;
    self->_contactGeminiManager = v5;

    contactGeminiManager = self->_contactGeminiManager;
  }
  id v7 = contactGeminiManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (void)setContactGeminiManager:(id)a3
{
  id v8 = (CNGeminiManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  p_contactGeminiManager = &self->_contactGeminiManager;
  if (contactGeminiManager != v8) {
    objc_storeStrong((id *)p_contactGeminiManager, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

uint64_t __46__PHApplicationServices_suggestedContactStore__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

uint64_t __38__PHApplicationServices_metadataCache__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_contactGeminiManager, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

+ (id)getFTVoiceMailOnVoicemailsChanged:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  type metadata accessor for MessageStoreController();
  swift_retain();
  uint64_t v5 = static MessageStoreController.shared.getter();
  type metadata accessor for FaceTimeVoicemailManager(0);
  uint64_t v6 = swift_allocObject();
  id v7 = (void *)specialized FaceTimeVoicemailManager.init(onVoicemailsChanged:messageStoreController:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v4, v5, v6);
  swift_release();

  return v7;
}

@end