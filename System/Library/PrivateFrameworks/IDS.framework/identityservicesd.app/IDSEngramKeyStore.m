@interface IDSEngramKeyStore
+ (id)_keychainIdentifier;
- (BOOL)isEngramEnabled;
- (CUTPromiseSeal)seal;
- (IDSCloudKitContainer)ckContainer;
- (IDSEngramKeyStore)initWithQueue:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (NSData)deviceKey;
- (NSHashTable)listeners;
- (OS_dispatch_queue)queue;
- (id)accountIdentityElector;
- (id)rollFullDeviceIdentityWithCluster:(id)a3 error:(id *)a4;
- (void)accountIdentityClusterForRegistrationWithCompletion:(id)a3;
- (void)addListener:(id)a3;
- (void)existingAccountIdentityClusterWithCompletion:(id)a3;
- (void)existingFullDeviceIdentityWithCompletion:(id)a3;
- (void)notifyListenersEngramKeyStoreDidUpdateIdentities;
- (void)removeListener:(id)a3;
- (void)rollAccountIdentityWithCompletion:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSeal:(id)a3;
@end

@implementation IDSEngramKeyStore

- (IDSEngramKeyStore)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSEngramKeyStore;
  v6 = [(IDSEngramKeyStore *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    if (+[IMUserDefaults isEngramEnabled])
    {
      v8 = (IDSCloudKitContainer *)[objc_alloc((Class)IDSCloudKitContainer) initWithIdentifier:@"iCloud.com.apple.Engram.Development" queue:v5];
      ckContainer = v7->_ckContainer;
      v7->_ckContainer = v8;
    }
    v10 = objc_alloc_init(IDSKeychainWrapper);
    keychainWrapper = v7->_keychainWrapper;
    v7->_keychainWrapper = v10;

    uint64_t v12 = +[NSHashTable weakObjectsHashTable];
    listeners = v7->_listeners;
    v7->_listeners = (NSHashTable *)v12;
  }
  return v7;
}

- (BOOL)isEngramEnabled
{
  return +[IMUserDefaults isEngramEnabled];
}

- (id)accountIdentityElector
{
  v3 = [IDSKeychainKeyElectionStore alloc];
  v4 = [(IDSEngramKeyStore *)self keychainWrapper];
  id v5 = [(IDSKeychainKeyElectionStore *)v3 initWithKeychainWrapper:v4];

  v6 = [(IDSEngramKeyStore *)self ckContainer];
  v7 = [v6 keyElectionStore];

  v8 = objc_alloc_init(IDSGroupServerKeyElectionStore);
  v9 = [[IDSAccountIdentityElector alloc] initWithKeychainElectionStore:v5 cloudKitElectionStore:v7 groupServerElectionStore:v8];

  return v9;
}

- (void)accountIdentityClusterForRegistrationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSEngramKeyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[IMRGLog engram];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountIdentitiesClusterForRegistration -- start", buf, 2u);
  }

  id v7 = objc_alloc((Class)CUTPromiseSeal);
  v8 = [(IDSEngramKeyStore *)self queue];
  id v9 = [v7 initWithQueue:v8];
  [(IDSEngramKeyStore *)self setSeal:v9];

  if ([(IDSEngramKeyStore *)self isEngramEnabled])
  {
    v10 = [(IDSEngramKeyStore *)self accountIdentityElector];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10013F174;
    v19[3] = &unk_1009836E8;
    v19[4] = self;
    [v10 getKeysForServiceTypeName:IDSMPServiceIdentityTypeNameA completion:v19];
  }
  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Engram is disabled on this device";
    v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v10 = +[NSError errorWithDomain:@"IDSEngramKeyStoreErrorDomain" code:-2000 userInfo:v11];

    uint64_t v12 = +[IMRGLog engram];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Engram inactive -- not fetching {error: %{public}@}", buf, 0xCu);
    }

    v13 = [(IDSEngramKeyStore *)self seal];
    [v13 failWithError:v10];
  }
  v14 = [(IDSEngramKeyStore *)self seal];
  objc_super v15 = [v14 promise];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10013F31C;
  v17[3] = &unk_100980C70;
  id v18 = v4;
  id v16 = v4;
  [v15 registerResultBlock:v17];
}

- (void)existingAccountIdentityClusterWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSEngramKeyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(IDSEngramKeyStore *)self seal];

  if (!v6)
  {
    id v7 = objc_alloc((Class)CUTPromiseSeal);
    v8 = [(IDSEngramKeyStore *)self queue];
    id v9 = [v7 initWithQueue:v8];
    [(IDSEngramKeyStore *)self setSeal:v9];

    if ([(IDSEngramKeyStore *)self isEngramEnabled])
    {
      v10 = [(IDSEngramKeyStore *)self seal];
      v11 = [(IDSEngramKeyStore *)self accountIdentityElector];
      uint64_t v12 = IDSMPServiceIdentityTypeNameA;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10013F6B4;
      v21[3] = &unk_100983710;
      v21[4] = self;
      id v22 = v10;
      id v13 = v10;
      [v11 getKeysForServiceTypeName:v12 completion:v21];
    }
    else
    {
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Engram is disabled on this device. Update UserDefaults as described in IMUserDefaults";
      v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v11 = +[NSError errorWithDomain:@"IDSEngramKeyStoreErrorDomain" code:-2000 userInfo:v14];

      objc_super v15 = +[IMRGLog engram];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tried to get account identity cluster with Engram disabled {error: %{public}@}", buf, 0xCu);
      }

      id v13 = [(IDSEngramKeyStore *)self seal];
      [v13 failWithError:v11];
    }
  }
  id v16 = [(IDSEngramKeyStore *)self seal];
  v17 = [v16 promise];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10013F84C;
  v19[3] = &unk_100980C70;
  id v20 = v4;
  id v18 = v4;
  [v17 registerResultBlock:v19];
}

- (id)rollFullDeviceIdentityWithCluster:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(IDSEngramKeyStore *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = [v6 adminServiceIdentityWithType:1];

  id v9 = +[IDSMPFullDeviceIdentity deviceIdentityWithFullAdminServiceIdentity:v8 error:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 dataRepresentationWithError:a4];
    if (v11
      && ([(IDSEngramKeyStore *)self keychainWrapper],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [(id)objc_opt_class() _keychainIdentifier],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v12 saveData:v11 forIdentifier:v13 allowSync:0 dataProtectionClass:2 error:a4], v13, v12, v14))
    {
      id v15 = v10;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)existingFullDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSEngramKeyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[IMRGLog engram];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "existingFullDeviceIdentity -- start", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10013FB2C;
  v8[3] = &unk_100983738;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(IDSEngramKeyStore *)self existingAccountIdentityClusterWithCompletion:v8];
}

- (void)rollAccountIdentityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(IDSEngramKeyStore *)self queue];
  dispatch_assert_queue_V2(v5);

  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  CFStringRef v9 = @"Account key rolling not implemented";
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v7 = +[NSError errorWithDomain:@"IDSEngramKeyStoreErrorDomain" code:-2000 userInfo:v6];

  v4[2](v4, 0, v7);
}

+ (id)_keychainIdentifier
{
  v2 = _IDSEngramKeyElectorVersion();
  v3 = +[NSString stringWithFormat:@"%@-%@", @"kIDSEngramKeyStoreFullDeviceIdentity", v2];

  return v3;
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSEngramKeyStore *)self listeners];
  [v5 addObject:v4];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSEngramKeyStore *)self listeners];
  [v5 removeObject:v4];
}

- (void)notifyListenersEngramKeyStoreDidUpdateIdentities
{
  v3 = +[IMRGLog engram];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(IDSEngramKeyStore *)self listeners];
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Notifying Engram key store that identities did update {listeners: %@}", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(IDSEngramKeyStore *)self listeners];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      CFStringRef v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 engramKeyStoreDidUpdateIdentities:self];
        }
        CFStringRef v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSCloudKitContainer)ckContainer
{
  return self->_ckContainer;
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSData)deviceKey
{
  return self->_deviceKey;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainWrapper, 0);
  objc_storeStrong((id *)&self->_deviceKey, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_seal, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end