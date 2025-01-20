@interface SecureStorage
- (LACSecureStorage)coreStorage;
- (LACSecureStorageConfiguration)config;
- (SecureStorage)init;
- (SecureStorage)initWithConfig:(id)a3;
- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4;
- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4 acl:(id)a5;
- (id)acmContextForUUID:(id)a3 error:(id *)a4;
- (id)bundleIDForRequest:(id)a3;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8;
@end

@implementation SecureStorage

- (SecureStorage)initWithConfig:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SecureStorage;
  v6 = [(SecureStorage *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = (LACSecureStorage *)[objc_alloc((Class)LACSecureStorage) initWithConfig:v5];
    coreStorage = v7->_coreStorage;
    v7->_coreStorage = v8;

    [(LACSecureStorage *)v7->_coreStorage setDelegate:v7];
  }

  return v7;
}

- (SecureStorage)init
{
  id v3 = objc_alloc_init((Class)LACSecureStorageConfiguration);
  v4 = [(SecureStorage *)self initWithConfig:v3];

  return v4;
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[NSXPCConnection currentConnection];
  [(SecureStorage *)self setObject:v15 acl:v14 forKey:a5 contextUUID:v13 connection:v16 completionHandler:v12];
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = [(SecureStorage *)self _makeStorageRequestWithKey:a5 contextUUID:a6 acl:a4];
  [(LACSecureStorage *)self->_coreStorage setObject:v16 forRequest:v17 connection:v15 completionHandler:v14];
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorage *)self objectForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(SecureStorage *)self _makeStorageRequestWithKey:a3 contextUUID:a4];
  [(LACSecureStorage *)self->_coreStorage objectForRequest:v12 connection:v11 completionHandler:v10];
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorage *)self removeObjectForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(SecureStorage *)self _makeStorageRequestWithKey:a3 contextUUID:a4];
  [(LACSecureStorage *)self->_coreStorage removeObjectForRequest:v12 connection:v11 completionHandler:v10];
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorage *)self aclForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(SecureStorage *)self _makeStorageRequestWithKey:a3 contextUUID:a4];
  [(LACSecureStorage *)self->_coreStorage aclForRequest:v12 connection:v11 completionHandler:v10];
}

- (id)acmContextForUUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[ContextManager sharedInstance];
  v7 = [v6 contextForUUID:v5];

  if (v7)
  {
    id v8 = [v7 plugin];
    id v9 = [v8 module];
    id v10 = [v9 type];

    if (v10 == (id)1)
    {
      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000;
      id v17 = sub_10000C620;
      v18 = sub_10000C630;
      id v19 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000C638;
      v13[3] = &unk_100038CC0;
      v13[4] = &v14;
      ACMContextGetExternalForm([v8 underlyingPtr], (uint64_t)v13);
      id v11 = (id)v15[5];
      _Block_object_dispose(&v14, 8);
    }
    else if (a4)
    {
      +[LAErrorHelper storageErrorWithCode:2 message:@"No ACM plugin."];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a4)
  {
    +[LAErrorHelper storageErrorWithCode:2 message:@"Context not found."];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)bundleIDForRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 client];
  id v5 = [v4 processId];
  v6 = [v3 client];

  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  id v10 = 0;
  id v7 = +[DaemonUtils callerDisplayNameWithPid:v5 auditToken:v11 bundleId:&v10];
  id v8 = v10;

  return v8;
}

- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4
{
  return [(SecureStorage *)self _makeStorageRequestWithKey:a3 contextUUID:a4 acl:0];
}

- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4 acl:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)StorageRequest) initWithStorageDomain:0 key:a3 contextID:v8 acl:v7];

  return v9;
}

- (LACSecureStorage)coreStorage
{
  return self->_coreStorage;
}

- (LACSecureStorageConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_coreStorage, 0);
}

@end