@interface AVTSideCoreDataStoreMigratableSource
- (AVTCoreDataPersistentStoreLocalConfiguration)configuration;
- (AVTCoreEnvironment)environment;
- (AVTSideCoreDataStoreMigratableSource)initWithConfiguration:(id)a3 environment:(id)a4;
- (BOOL)finalizeMigration:(id *)a3;
- (BOOL)migrationNeeded;
- (id)createSourceBackend;
- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5;
@end

@implementation AVTSideCoreDataStoreMigratableSource

- (AVTSideCoreDataStoreMigratableSource)initWithConfiguration:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTSideCoreDataStoreMigratableSource;
  v9 = [(AVTSideCoreDataStoreMigratableSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (id)createSourceBackend
{
  v3 = [AVTCoreDataStoreBackend alloc];
  v4 = [(AVTSideCoreDataStoreMigratableSource *)self configuration];
  v5 = [(AVTSideCoreDataStoreMigratableSource *)self environment];
  v6 = [(AVTCoreDataStoreBackend *)v3 initWithConfiguration:v4 environment:v5];

  return v6;
}

- (BOOL)finalizeMigration:(id *)a3
{
  v4 = [(AVTSideCoreDataStoreMigratableSource *)self configuration];
  LOBYTE(a3) = [v4 tearDownAndEraseAllContent:a3];

  return (char)a3;
}

- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5
{
  id v5 = a3;

  return v5;
}

- (BOOL)migrationNeeded
{
  v2 = [(AVTSideCoreDataStoreMigratableSource *)self configuration];
  char v3 = [v2 contentExists];

  return v3;
}

- (AVTCoreDataPersistentStoreLocalConfiguration)configuration
{
  return self->_configuration;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end