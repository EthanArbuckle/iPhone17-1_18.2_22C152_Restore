@interface SQLiteDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (SQLiteDatabase)database;
- (SQLiteDatabaseStore)initWithDatabase:(id)a3;
- (void)asyncModifyUsingTransaction:(id)a3 completion:(id)a4;
- (void)asyncReadUsingSession:(id)a3 completion:(id)a4;
- (void)modifyUsingTransaction:(id)a3;
- (void)readUsingSession:(id)a3;
@end

@implementation SQLiteDatabaseStore

- (void)readUsingSession:(id)a3
{
}

- (SQLiteDatabaseStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteDatabaseStore;
  v6 = [(SQLiteDatabaseStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
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

- (void)asyncReadUsingSession:(id)a3 completion:(id)a4
{
}

- (SQLiteDatabase)database
{
  return (SQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end