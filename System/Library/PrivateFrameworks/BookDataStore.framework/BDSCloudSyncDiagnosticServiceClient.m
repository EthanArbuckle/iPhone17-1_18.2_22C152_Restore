@interface BDSCloudSyncDiagnosticServiceClient
+ (id)sharedServiceProxy;
- (BDSCloudSyncDiagnosticServiceClient)init;
- (BDSServiceProtocol)serviceProxy;
- (void)clearSyncMetadata:(id)a3;
- (void)detachWithCompletionHandler:(id)a3;
- (void)diagnosticInfoWithCompletionHandler:(id)a3;
- (void)findLocalIdDupesWithCompletionHandler:(id)a3;
- (void)forceFetchRemoteChanges:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticServiceClient

+ (id)sharedServiceProxy
{
  if (qword_26AD776C0 != -1) {
    dispatch_once(&qword_26AD776C0, &unk_26E971BD0);
  }
  v2 = (void *)qword_26AD77690;
  return v2;
}

- (BDSCloudSyncDiagnosticServiceClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)BDSCloudSyncDiagnosticServiceClient;
  v2 = [(BDSCloudSyncDiagnosticServiceClient *)&v14 init];
  v10 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = objc_msgSend_sharedServiceProxy(BDSCloudSyncDiagnosticServiceClient, v3, v4, v5, v6, v7, v8, v9);
    serviceProxy = v10->_serviceProxy;
    v10->_serviceProxy = (BDSServiceProtocol *)v11;
  }
  return v10;
}

- (void)clearSyncMetadata:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearSyncMetadata_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)forceFetchRemoteChanges:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_forceFetchRemoteChanges_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)detachWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudSyncDiagnosticDetachWithCompletionHandler_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)findLocalIdDupesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudSyncDiagnosticFindLocalIdDupesWithCompletionHandler_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)diagnosticInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudSyncDiagnosticInfoWithCompletionHandler_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end