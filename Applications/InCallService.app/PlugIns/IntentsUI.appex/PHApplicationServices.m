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
  block[2] = sub_100005360;
  block[3] = &unk_10008D730;
  block[4] = a1;
  if (qword_1000A20E8 != -1) {
    dispatch_once(&qword_1000A20E8, block);
  }
  v2 = (void *)qword_1000A20E0;

  return v2;
}

- (PHApplicationServices)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHApplicationServices;
  v2 = [(PHApplicationServices *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    dispatch_queue_t v5 = dispatch_queue_create("PHApplicationServices.serialQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    [(PHApplicationServices *)v3 setInitializationBlockQueued:1];
    v7 = [(PHApplicationServices *)v3 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000054A8;
    block[3] = &unk_10008D758;
    v10 = v3;
    dispatch_async(v7, block);
  }
  return v3;
}

- (BOOL)isInitializationBlockQueued
{
  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
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

- (TUCallProviderManager)callProviderManager
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000058C0;
  v17[3] = &unk_10008D780;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000591C;
  v15 = sub_10000592C;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (!v4)
  {
    dispatch_queue_t v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005934;
    block[3] = &unk_10008D7A8;
    v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

    v4 = (void *)v12[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v11, 8);

  return (TUCallProviderManager *)v6;
}

- (void)setCallProviderManager:(id)a3
{
  v8 = (TUCallProviderManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  callProviderManager = self->_callProviderManager;
  p_callProviderManager = &self->_callProviderManager;
  if (callProviderManager != v8) {
    objc_storeStrong((id *)p_callProviderManager, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (CNGeminiManager)contactGeminiManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  if (!contactGeminiManager)
  {
    dispatch_queue_t v5 = (CNGeminiManager *)[objc_alloc((Class)CNGeminiManager) initWithCallProviderManager:self->_callProviderManager];
    id v6 = self->_contactGeminiManager;
    self->_contactGeminiManager = v5;

    contactGeminiManager = self->_contactGeminiManager;
  }
  v7 = contactGeminiManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (void)setContactGeminiManager:(id)a3
{
  v8 = (CNGeminiManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  p_contactGeminiManager = &self->_contactGeminiManager;
  if (contactGeminiManager != v8) {
    objc_storeStrong((id *)p_contactGeminiManager, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (CNContactStore)contactStore
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005CE4;
  v19[3] = &unk_10008D7D0;
  v19[4] = self;
  BOOL v3 = objc_retainBlock(v19);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000591C;
  v17 = sub_10000592C;
  ((void (*)(void))v3[2])();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005D40;
    block[3] = &unk_10008D7A8;
    v12 = &v13;
    dispatch_queue_t v5 = v3;
    id v11 = v5;
    dispatch_sync(v4, block);

    uint64_t v6 = ((void (*)(id))v3[2])(v5);
    v7 = (void *)v14[5];
    v14[5] = v6;
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (CNContactStore *)v8;
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

- (CNContactStore)suggestedContactStore
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005FC8;
  v16[3] = &unk_10008D7D0;
  v16[4] = self;
  BOOL v3 = objc_retainBlock(v16);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_10000591C;
  v14 = sub_10000592C;
  ((void (*)(void))v3[2])();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006024;
    block[3] = &unk_10008D7A8;
    v9 = &v10;
    id v8 = v3;
    dispatch_sync(v4, block);
  }
  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (CNContactStore *)v5;
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

- (TUMetadataCache)metadataCache
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000062A0;
  v17[3] = &unk_10008D7F8;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000591C;
  id v15 = sub_10000592C;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000062FC;
    block[3] = &unk_10008D7A8;
    uint64_t v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

    v4 = (void *)v12[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v11, 8);

  return (TUMetadataCache *)v6;
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

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
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
  BOOL v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = sub_100062130();
  swift_retain();
  v15[3] = v5;
  v15[4] = &off_10008EA10;
  v15[0] = sub_100062120();
  type metadata accessor for FaceTimeVoicemailManager(0);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_100060EA4((uint64_t)v15, v5);
  __chkstk_darwin(v7);
  v9 = (void *)((char *)&v15[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = *v9;
  swift_retain();
  uint64_t v12 = (void *)sub_100060EF4((uint64_t)sub_100060E94, v4, v11, v6);
  sub_1000361FC((uint64_t)v15);
  swift_release();
  swift_release();

  return v12;
}

@end