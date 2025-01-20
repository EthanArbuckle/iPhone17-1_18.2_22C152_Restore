@interface BCCloudCollectionsManager
+ (id)sharedClientXPCProxy;
+ (id)sharedManager;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudCollectionDetailManager)collectionDetailManager;
- (BCCloudCollectionMemberManager)collectionMemberManager;
- (BCCloudDataSource)collectionDataSource;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (BDSServiceProxy)serviceProxy;
- (BOOL)proxyMode;
- (NSManagedObjectModel)objectModel;
- (id)initClientXPCProxy;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)setChangeTokenController:(id)a3;
- (void)setCollectionDataSource:(id)a3;
- (void)setCollectionDetailManager:(id)a3;
- (void)setCollectionMemberManager:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setObjectModel:(id)a3;
- (void)setProxyMode:(BOOL)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation BCCloudCollectionsManager

+ (id)sharedManager
{
  uint64_t v2 = objc_opt_class();
  return (id)MEMORY[0x270F9A6D0](v2, sel_sharedClientXPCProxy, v3, v4, v5, v6, v7, v8);
}

+ (id)sharedClientXPCProxy
{
  if (qword_26AD775D0 != -1) {
    dispatch_once(&qword_26AD775D0, &unk_26E971DF0);
  }
  uint64_t v2 = (void *)qword_26AD775F8;
  return v2;
}

- (id)initClientXPCProxy
{
  v6.receiver = self;
  v6.super_class = (Class)BCCloudCollectionsManager;
  uint64_t v2 = [(BCCloudCollectionsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

    objc_storeStrong((id *)&v2->_collectionDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_collectionMemberManager, v2->_serviceProxy);
    v2->_proxyMode = 1;
  }
  return v2;
}

- (NSManagedObjectModel)objectModel
{
  objectModel = self->_objectModel;
  if (!objectModel)
  {
    uint64_t v4 = (void *)MEMORY[0x263F086E0];
    uint64_t v5 = objc_opt_class();
    v12 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8, v9, v10, v11);
    v18 = objc_msgSend_pathForResource_ofType_(v12, v13, @"BCCloudCollections", @"momd", v14, v15, v16, v17);

    v24 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v19, (uint64_t)v18, 1, v20, v21, v22, v23);
    id v25 = objc_alloc(MEMORY[0x263EFF298]);
    v32 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v25, v26, (uint64_t)v24, v27, v28, v29, v30, v31);
    v33 = self->_objectModel;
    self->_objectModel = v32;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = @"NO";
    if (v3) {
      objc_super v6 = @"YES";
    }
    int v21 = 138412290;
    uint64_t v22 = v6;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager #enableCloudSync setEnableCloudSync %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v14 = objc_msgSend_serviceProxy(self, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend_setEnableCollectionSync_(v14, v15, v3, v16, v17, v18, v19, v20);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BDSCloudKitSyncLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudCollectionsManager dissociateCloudDataFromSyncWithCompletion", v20, 2u);
  }

  uint64_t v13 = objc_msgSend_serviceProxy(self, v6, v7, v8, v9, v10, v11, v12);
  objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v13, v14, (uint64_t)v4, v15, v16, v17, v18, v19);
}

- (void)setObjectModel:(id)a3
{
}

- (BCCloudDataSource)collectionDataSource
{
  return self->_collectionDataSource;
}

- (void)setCollectionDataSource:(id)a3
{
}

- (BCCloudCollectionDetailManager)collectionDetailManager
{
  return self->_collectionDetailManager;
}

- (void)setCollectionDetailManager:(id)a3
{
}

- (BCCloudCollectionMemberManager)collectionMemberManager
{
  return self->_collectionMemberManager;
}

- (void)setCollectionMemberManager:(id)a3
{
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
}

- (BOOL)proxyMode
{
  return self->_proxyMode;
}

- (void)setProxyMode:(BOOL)a3
{
  self->_proxyMode = a3;
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
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_collectionMemberManager, 0);
  objc_storeStrong((id *)&self->_collectionDetailManager, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end