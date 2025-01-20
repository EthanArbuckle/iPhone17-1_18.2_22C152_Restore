@interface BDSReadingDataMigrationManagerClient
- (BDSReadingDataMigrationManagerClient)init;
- (BDSServiceProxy)serviceProxy;
- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation BDSReadingDataMigrationManagerClient

- (BDSReadingDataMigrationManagerClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BDSReadingDataMigrationManagerClient;
  v2 = [(BDSReadingDataMigrationManagerClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;
  }
  return v2;
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeMovedReadingHistoryDataWithCompletionHandler_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end