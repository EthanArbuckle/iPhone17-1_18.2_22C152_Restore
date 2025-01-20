@interface AVTArchiverBasedStoreMigratableSource
- (AVTArchiverBasedStoreMigratableSource)initWithStoreLocation:(id)a3 environment:(id)a4;
- (AVTCoreEnvironment)environment;
- (BOOL)finalizeMigration:(id *)a3;
- (BOOL)migrationNeeded;
- (NSURL)storeLocation;
- (id)createSourceBackend;
- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5;
@end

@implementation AVTArchiverBasedStoreMigratableSource

- (AVTArchiverBasedStoreMigratableSource)initWithStoreLocation:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTArchiverBasedStoreMigratableSource;
  v9 = [(AVTArchiverBasedStoreMigratableSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeLocation, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (BOOL)migrationNeeded
{
  v2 = [(AVTArchiverBasedStoreMigratableSource *)self storeLocation];
  BOOL v3 = +[AVTArchiverBasedStorePersistence contentExistsAtLocation:v2];

  return v3;
}

- (id)createSourceBackend
{
  BOOL v3 = [AVTArchiverBasedStoreBackend alloc];
  v4 = [(AVTArchiverBasedStoreMigratableSource *)self storeLocation];
  v5 = [(AVTArchiverBasedStoreMigratableSource *)self environment];
  v6 = [(AVTArchiverBasedStoreBackend *)v3 initWithStoreLocation:v4 domainIdentifier:&stru_26DA8D880 environment:v5];

  return v6;
}

- (id)migratedRecordFromRecord:(id)a3 index:(unint64_t)a4 totalCount:(unint64_t)a5
{
  v6 = (void *)MEMORY[0x263EFF910];
  double v7 = -(double)a5;
  id v8 = a3;
  v9 = [v6 dateWithTimeIntervalSinceNow:v7];
  v10 = [v9 dateByAddingTimeInterval:(double)a4];
  v11 = [AVTAvatarRecord alloc];
  objc_super v12 = [v8 avatarData];
  v13 = [v8 identifier];

  v14 = [(AVTAvatarRecord *)v11 initWithAvatarData:v12 identifier:v13 orderDate:v10];

  return v14;
}

- (BOOL)finalizeMigration:(id *)a3
{
  v4 = [(AVTArchiverBasedStoreMigratableSource *)self storeLocation];
  LOBYTE(a3) = +[AVTArchiverBasedStorePersistence removeFilesAtLocation:v4 error:a3];

  return (char)a3;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end