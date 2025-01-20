@interface DTOKVStore
- (DTOKVStore)initWithWorkQueue:(id)a3;
- (int64_t)_storageKeyForKVSKey:(int64_t)a3;
- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 storage:(id)a7 completion:(id)a8;
- (void)_valueForKey:(int64_t)a3 connection:(id)a4 storage:(id)a5 completion:(id)a6;
- (void)processReadRequest:(id)a3 completion:(id)a4;
- (void)processWriteRequest:(id)a3 completion:(id)a4;
- (void)setValue:(id)a3 forKey:(int64_t)a4 completion:(id)a5;
- (void)setValue:(id)a3 forKey:(int64_t)a4 connection:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7;
- (void)valueForKey:(int64_t)a3 completion:(id)a4;
- (void)valueForKey:(int64_t)a3 connection:(id)a4 completion:(id)a5;
@end

@implementation DTOKVStore

- (DTOKVStore)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTOKVStore;
  v6 = [(DTOKVStore *)&v15 init];
  if (v6)
  {
    v7 = +[SecureStorageProvider sharedInstance];
    uint64_t v8 = [v7 secureStorage];
    storage = v6->_storage;
    v6->_storage = (LASecureStorageService *)v8;

    v10 = +[SecureStorageProvider sharedInstance];
    id v11 = [objc_alloc((Class)LACSecureStorageConfiguration) initWithBypassEntitlementChecks:1];
    uint64_t v12 = [v10 secureStorageWithConfig:v11];
    uncheckedStorage = v6->_uncheckedStorage;
    v6->_uncheckedStorage = (LASecureStorageService *)v12;

    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v6;
}

- (void)valueForKey:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)LACDTOMutableKVStoreReadRequest) initWithKey:a3];
  [(DTOKVStore *)self processReadRequest:v6 completion:v5];
}

- (void)valueForKey:(int64_t)a3 connection:(id)a4 completion:(id)a5
{
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10000884C;
  v14 = &unk_100038898;
  id v15 = a4;
  int64_t v16 = a3;
  id v8 = v15;
  id v9 = a5;
  v10 = sub_10000884C((uint64_t)&v11);
  -[DTOKVStore processReadRequest:completion:](self, "processReadRequest:completion:", v10, v9, v11, v12, v13, v14);
}

- (void)processReadRequest:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 key];
  id v8 = [v12 connection];
  id v9 = v8;
  if (!v8)
  {
    id v9 = +[NSXPCConnection currentConnection];
  }
  unsigned int v10 = [v12 bypassEntitlements];
  uint64_t v11 = 8;
  if (v10) {
    uint64_t v11 = 16;
  }
  [(DTOKVStore *)self _valueForKey:v7 connection:v9 storage:*(Class *)((char *)&self->super.isa + v11) completion:v6];

  if (!v8) {
}
  }

- (void)setValue:(id)a3 forKey:(int64_t)a4 completion:(id)a5
{
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100008A4C;
  v14 = &unk_1000388C0;
  id v15 = a3;
  int64_t v16 = a4;
  id v8 = v15;
  id v9 = a5;
  unsigned int v10 = sub_100008A4C((uint64_t)&v11);
  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v10, v9, v11, v12, v13, v14);
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008B90;
  v15[3] = &unk_1000388E8;
  id v17 = a5;
  int64_t v18 = a4;
  id v16 = v10;
  id v11 = v17;
  id v12 = v10;
  id v13 = a6;
  v14 = sub_100008B90(v15);
  [(DTOKVStore *)self processWriteRequest:v14 completion:v13];
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008CE8;
  v15[3] = &unk_1000388E8;
  id v17 = a5;
  int64_t v18 = a4;
  id v16 = v10;
  id v11 = v17;
  id v12 = v10;
  id v13 = a6;
  v14 = sub_100008CE8(v15);
  [(DTOKVStore *)self processWriteRequest:v14 completion:v13];
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100008E60;
  v20 = &unk_100038910;
  id v21 = a3;
  id v22 = a5;
  id v23 = a6;
  int64_t v24 = a4;
  id v12 = v23;
  id v13 = v22;
  id v14 = v21;
  id v15 = a7;
  id v16 = sub_100008E60(&v17);
  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v16, v15, v17, v18, v19, v20);
}

- (void)processWriteRequest:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 value];
  id v8 = [v14 key];
  id v9 = [v14 contextUUID];
  id v10 = [v14 connection];
  id v11 = v10;
  if (!v10)
  {
    id v11 = +[NSXPCConnection currentConnection];
  }
  unsigned int v12 = [v14 bypassEntitlements];
  uint64_t v13 = 8;
  if (v12) {
    uint64_t v13 = 16;
  }
  [(DTOKVStore *)self _setValue:v7 forKey:v8 contextUUID:v9 connection:v11 storage:*(Class *)((char *)&self->super.isa + v13) completion:v6];

  if (!v10) {
}
  }

- (void)_valueForKey:(int64_t)a3 connection:(id)a4 storage:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(DTOKVStore *)self _storageKeyForKVSKey:a3];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009114;
  v15[3] = &unk_100038938;
  v17[1] = v13;
  objc_copyWeak(v17, &location);
  id v14 = v12;
  id v16 = v14;
  v17[2] = (id)a3;
  [v11 objectForKey:v13 contextUUID:0 connection:v10 completionHandler:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 storage:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [(DTOKVStore *)self _storageKeyForKVSKey:a4];
  objc_initWeak(&location, self);
  v20 = [v14 data];
  id v21 = objc_opt_new();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100009560;
  v23[3] = &unk_100038960;
  v25[1] = v19;
  objc_copyWeak(v25, &location);
  id v22 = v18;
  id v24 = v22;
  [v17 setObject:v20 acl:v21 forKey:v19 contextUUID:v15 connection:v16 completionHandler:v23];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (int64_t)_storageKeyForKVSKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 7;
  }
  else {
    return qword_10002C830[a3 - 1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uncheckedStorage, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end