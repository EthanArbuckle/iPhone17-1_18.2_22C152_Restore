@interface BMStorePublisherManagerProtectedState
- (BMStorePublisherManagerProtectedState)init;
- (BMStreamDatastoreReader)localDatastore;
- (NSMutableDictionary)remoteDatastores;
- (void)setLocalDatastore:(id)a3;
- (void)setRemoteDatastores:(id)a3;
@end

@implementation BMStorePublisherManagerProtectedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDatastores, 0);

  objc_storeStrong((id *)&self->_localDatastore, 0);
}

- (BMStreamDatastoreReader)localDatastore
{
  return self->_localDatastore;
}

- (void)setLocalDatastore:(id)a3
{
}

- (BMStorePublisherManagerProtectedState)init
{
  v8.receiver = self;
  v8.super_class = (Class)BMStorePublisherManagerProtectedState;
  v2 = [(BMStorePublisherManagerProtectedState *)&v8 init];
  v3 = v2;
  if (v2)
  {
    localDatastore = v2->_localDatastore;
    v2->_localDatastore = 0;

    uint64_t v5 = objc_opt_new();
    remoteDatastores = v3->_remoteDatastores;
    v3->_remoteDatastores = (NSMutableDictionary *)v5;
  }
  return v3;
}

- (NSMutableDictionary)remoteDatastores
{
  return self->_remoteDatastores;
}

- (void)setRemoteDatastores:(id)a3
{
}

@end