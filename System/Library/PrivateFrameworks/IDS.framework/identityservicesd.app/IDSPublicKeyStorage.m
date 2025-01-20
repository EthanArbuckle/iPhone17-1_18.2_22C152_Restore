@interface IDSPublicKeyStorage
+ (IDSPublicKeyStorage)sharedInstance;
- (IDSDAccountController)accountController;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicKeyStorage)init;
- (IDSPublicKeyStorage)initWithPeerIDManager:(id)a3 accountController:(id)a4;
- (IDSPublicKeyStorageCache)cache;
- (_opaque_pthread_mutex_t)lock;
- (id)publicDeviceIdentityContainerForDeviceID:(id)a3;
- (void)_removeOldPersistence;
- (void)clearCache;
- (void)dealloc;
- (void)logState;
- (void)setAccountController:(id)a3;
- (void)setCache:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setPeerIDManager:(id)a3;
@end

@implementation IDSPublicKeyStorage

+ (IDSPublicKeyStorage)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100224A04;
  block[3] = &unk_10097EA18;
  block[4] = a1;
  if (qword_100A4C2C0 != -1) {
    dispatch_once(&qword_100A4C2C0, block);
  }
  v2 = (void *)qword_100A4C2B8;

  return (IDSPublicKeyStorage *)v2;
}

- (IDSPublicKeyStorage)init
{
  v3 = +[IDSPeerIDManager sharedInstance];
  v4 = +[IDSDAccountController sharedInstance];
  v5 = [(IDSPublicKeyStorage *)self initWithPeerIDManager:v3 accountController:v4];

  return v5;
}

- (IDSPublicKeyStorage)initWithPeerIDManager:(id)a3 accountController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IDSPublicKeyStorage;
  v9 = [(IDSPublicKeyStorage *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerIDManager, a3);
    objc_storeStrong((id *)&v10->_accountController, a4);
    v11 = objc_alloc_init(IDSPublicKeyStorageCache);
    cache = v10->_cache;
    v10->_cache = v11;

    pthread_mutex_init(&v10->_lock, 0);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100224C1C;
    v17 = &unk_100986718;
    objc_copyWeak(&v18, &location);
    [v7 addPurgeClientDataBlock:&v14 forToken:@"kIDSPublicKeyStorageToken"];
    [(IDSPublicKeyStorage *)v10 _removeOldPersistence];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_removeOldPersistence
{
  v2 = objc_alloc_init(IDSKeychainWrapper);
  [(IDSKeychainWrapper *)v2 removeDataForIdentifier:@"personal-public-key-cache" dataProtectionClass:2 error:0];
  [(IDSKeychainWrapper *)v2 removeDataForIdentifier:@"personal-public-key-cache-v1" dataProtectionClass:2 error:0];
  [(IDSKeychainWrapper *)v2 removeDataForIdentifier:@"personal-public-key-cache-v2" dataProtectionClass:2 error:0];
  [(IDSKeychainWrapper *)v2 removeDataForIdentifier:@"personal-public-key-cache-v3" dataProtectionClass:2 error:0];
  [(IDSKeychainWrapper *)v2 removeDataForIdentifier:@"personal-public-key-cache-v4" dataProtectionClass:2 error:0];
}

- (void)dealloc
{
  [(IDSPeerIDManager *)self->_peerIDManager removePurgeClientDataBlockForToken:@"kIDSPublicKeyStorageToken"];
  v3.receiver = self;
  v3.super_class = (Class)IDSPublicKeyStorage;
  [(IDSPublicKeyStorage *)&v3 dealloc];
}

- (void)clearCache
{
  objc_super v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing public and personal keys", v4, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  [(IDSPublicKeyStorageCache *)self->_cache clearCache];
  pthread_mutex_unlock(&self->_lock);
}

- (id)publicDeviceIdentityContainerForDeviceID:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  v5 = [(IDSPublicKeyStorageCache *)self->_cache cachedIdentityForDeviceID:v4];
  if (!v5)
  {
    v6 = [(IDSDAccountController *)self->_accountController pushTokenForDeviceID:v4];
    peerIDManager = self->_peerIDManager;
    id v8 = +[IDSPushToken pushTokenWithData:v6];
    v5 = [(IDSPeerIDManager *)peerIDManager publicDeviceIdentityContainerForPushToken:v8];

    if (v5) {
      [(IDSPublicKeyStorageCache *)self->_cache cacheIdentity:v5 forDeviceID:v4 andPushToken:v6];
    }
  }
  pthread_mutex_unlock(&self->_lock);

  return v5;
}

- (void)logState
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(IDSPublicKeyStorageCache *)self->_cache logState];

  pthread_mutex_unlock(p_lock);
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (_opaque_pthread_mutex_t)lock
{
  long long v3 = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = v5;
  *(_OWORD *)&self->_lock.__sig = v3;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
}

- (IDSPublicKeyStorageCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_accountController, 0);

  objc_storeStrong((id *)&self->_peerIDManager, 0);
}

@end