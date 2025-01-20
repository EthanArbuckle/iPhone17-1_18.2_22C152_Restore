@interface PHApplicationServices
+ (id)sharedInstance;
- (BOOL)isInitializationBlockQueued;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (CNGeminiManager)contactGeminiManager;
- (OS_dispatch_queue)dispatchQueue;
- (PHApplicationServices)init;
- (TUCallProviderManager)callProviderManager;
- (TUMetadataCache)metadataCache;
- (VMVoicemailManager)accountManager;
- (os_unfair_lock_s)accessorLock;
- (void)setAccountManager:(id)a3;
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
  block[2] = sub_100093570;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_1003261D0 != -1) {
    dispatch_once(&qword_1003261D0, block);
  }
  v2 = (void *)qword_1003261C8;

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
    block[2] = sub_1000936B8;
    block[3] = &unk_1002CD518;
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
  v17[2] = sub_100093AF0;
  v17[3] = &unk_1002CF850;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100093B4C;
  v15 = sub_100093B5C;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (!v4)
  {
    dispatch_queue_t v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093B64;
    block[3] = &unk_1002CF878;
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
  v19[2] = sub_100093F14;
  v19[3] = &unk_1002CF8A0;
  v19[4] = self;
  BOOL v3 = objc_retainBlock(v19);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100093B4C;
  v17 = sub_100093B5C;
  ((void (*)(void))v3[2])();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100093F70;
    block[3] = &unk_1002CF878;
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
  v16[2] = sub_1000941F8;
  v16[3] = &unk_1002CF8A0;
  v16[4] = self;
  BOOL v3 = objc_retainBlock(v16);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100093B4C;
  v14 = sub_100093B5C;
  ((void (*)(void))v3[2])();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11[5] && [(PHApplicationServices *)self isInitializationBlockQueued])
  {
    v4 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100094254;
    block[3] = &unk_1002CF878;
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
  v17[2] = sub_1000944D0;
  v17[3] = &unk_1002CF8C8;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100093B4C;
  id v15 = sub_100093B5C;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009452C;
    block[3] = &unk_1002CF878;
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

- (VMVoicemailManager)accountManager
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000947A8;
  v17[3] = &unk_1002CF8F0;
  v17[4] = self;
  BOOL v3 = objc_retainBlock(v17);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100093B4C;
  id v15 = sub_100093B5C;
  ((void (*)(void))v3[2])();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (!v4)
  {
    id v5 = [(PHApplicationServices *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100094804;
    block[3] = &unk_1002CF878;
    uint64_t v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

    v4 = (void *)v12[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v11, 8);

  return (VMVoicemailManager *)v6;
}

- (void)setAccountManager:(id)a3
{
  id v8 = (VMVoicemailManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  accountManager = self->_accountManager;
  p_accountManager = &self->_accountManager;
  if (accountManager != v8) {
    objc_storeStrong((id *)p_accountManager, a3);
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
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_contactGeminiManager, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

@end