@interface ASUSQLiteDatabaseStore
+ (ASUSQLiteDatabaseStoreDescriptor)storeDescriptor;
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
- (ASUSQLiteDatabase)database;
- (ASUSQLiteDatabaseStore)initWithDatabase:(id)a3;
- (void)asyncModifyUsingTransaction:(id)a3 completion:(id)a4;
- (void)asyncReadUsingSession:(id)a3 completion:(id)a4;
- (void)modifyUsingTransaction:(id)a3;
- (void)readUsingSession:(id)a3;
@end

@implementation ASUSQLiteDatabaseStore

- (ASUSQLiteDatabaseStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteDatabaseStore;
  v6 = [(ASUSQLiteDatabaseStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

+ (ASUSQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return 0;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return 1;
}

- (void)modifyUsingTransaction:(id)a3
{
}

- (void)asyncModifyUsingTransaction:(id)a3 completion:(id)a4
{
}

- (void)readUsingSession:(id)a3
{
}

- (void)asyncReadUsingSession:(id)a3 completion:(id)a4
{
}

- (ASUSQLiteDatabase)database
{
  return (ASUSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end