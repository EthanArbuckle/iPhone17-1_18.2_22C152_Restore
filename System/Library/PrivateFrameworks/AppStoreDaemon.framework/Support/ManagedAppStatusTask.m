@interface ManagedAppStatusTask
- (ManagedAppStatusTask)init;
- (void)main;
@end

@implementation ManagedAppStatusTask

- (ManagedAppStatusTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)ManagedAppStatusTask;
  v2 = [(Task *)&v6 init];
  if (v2)
  {
    uint64_t v3 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v3;
  }
  return v2;
}

- (void)main
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100017ED8;
  v11 = sub_100017B28;
  id v12 = +[NSMutableArray array];
  databaseStore = self->_databaseStore;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100230D40;
  v6[3] = &unk_100522CF8;
  v6[4] = &v7;
  [(AppInstallsDatabaseStore *)databaseStore readUsingSession:v6];
  v4 = (NSArray *)[(id)v8[5] copy];
  statusItems = self->_statusItems;
  self->_statusItems = v4;

  [(Task *)self completeWithSuccess];
  _Block_object_dispose(&v7, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItems, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
}

@end