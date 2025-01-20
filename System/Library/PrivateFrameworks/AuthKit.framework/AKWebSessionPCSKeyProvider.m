@interface AKWebSessionPCSKeyProvider
+ (AKWebSessionPCSKeyProvider)sharedInstance;
- (AKWebSessionPCSKeyProvider)init;
- (AKWebSessionPCSKeyProvider)initWithKeychainManager:(id)a3;
- (id)_keychainItemForContext:(id)a3 error:(id *)a4;
- (void)_removeAllExpiredPCSCredentials;
- (void)_removeCredentialWithDescriptor:(id)a3;
- (void)fetchContextForWebSessionIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllPCSCredentials;
- (void)saveContext:(id)a3 completion:(id)a4;
- (void)updateContext:(id)a3 completion:(id)a4;
@end

@implementation AKWebSessionPCSKeyProvider

+ (AKWebSessionPCSKeyProvider)sharedInstance
{
  if (qword_100272438 != -1) {
    dispatch_once(&qword_100272438, &stru_100228570);
  }
  v2 = (void *)qword_100272430;

  return (AKWebSessionPCSKeyProvider *)v2;
}

- (AKWebSessionPCSKeyProvider)init
{
  v3 = +[AKKeychainManager sharedManager];
  v4 = [(AKWebSessionPCSKeyProvider *)self initWithKeychainManager:v3];

  return v4;
}

- (AKWebSessionPCSKeyProvider)initWithKeychainManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKWebSessionPCSKeyProvider;
  v6 = [(AKWebSessionPCSKeyProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keychainManager, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.authkit.PCSKeyProvider", v8);
    keychainQueue = v7->_keychainQueue;
    v7->_keychainQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)saveContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v9 = [v6 description];
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving PCS auth context %@.", buf, 0xCu);
  }
  [(AKWebSessionPCSKeyProvider *)self _removeAllExpiredPCSCredentials];
  id v15 = 0;
  v10 = [(AKWebSessionPCSKeyProvider *)self _keychainItemForContext:v6 error:&v15];
  id v11 = v15;
  if (v11)
  {
    v7[2](v7, v11);
  }
  else
  {
    keychainManager = self->_keychainManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100048F34;
    v13[3] = &unk_1002270A8;
    v14 = v7;
    [(AKKeychainManager *)keychainManager addOrUpdateKeychainItem:v10 completion:v13];
  }
}

- (void)updateContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v9 = [v6 description];
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating PCS auth context %@.", buf, 0xCu);
  }
  id v15 = 0;
  v10 = [(AKWebSessionPCSKeyProvider *)self _keychainItemForContext:v6 error:&v15];
  id v11 = v15;
  if (v11)
  {
    v7[2](v7, v11);
  }
  else
  {
    keychainManager = self->_keychainManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100049188;
    v13[3] = &unk_1002270A8;
    v14 = v7;
    [(AKKeychainManager *)keychainManager updateKeychainItem:v10 completion:v13];
  }
}

- (void)fetchContextForWebSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching PCS auth context with ID %@.", buf, 0xCu);
  }

  dispatch_queue_t v9 = +[AKKeychainItemDescriptor pcsAuthDescriptor];
  [v9 setAccount:v6];
  keychainManager = self->_keychainManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000493A0;
  v12[3] = &unk_100228598;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(AKKeychainManager *)keychainManager fetchKeychainItemWithDescriptor:v9 completion:v12];
}

- (void)removeAllPCSCredentials
{
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049648;
  block[3] = &unk_100226FB8;
  block[4] = self;
  dispatch_async(keychainQueue, block);
}

- (id)_keychainItemForContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[AKKeychainItemDescriptor pcsAuthDescriptor];
  id v7 = [v5 webSessionIdentifier];
  [v6 setAccount:v7];

  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:a4];

  if (*a4)
  {
    dispatch_queue_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100182FD8(a4);
    }

    v10 = 0;
  }
  else
  {
    v10 = [[AKKeychainItem alloc] initWithDescriptor:v6 value:v8];
  }

  return v10;
}

- (void)_removeAllExpiredPCSCredentials
{
  v3 = +[AKKeychainItemDescriptor pcsAuthDescriptor];
  keychainQueue = self->_keychainQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100049848;
  v6[3] = &unk_100226C00;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(keychainQueue, v6);
}

- (void)_removeCredentialWithDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);

  objc_storeStrong((id *)&self->_keychainManager, 0);
}

@end