@interface BCCloudAssetManager
+ (id)sharedClientXPCProxy;
+ (id)sharedManager;
- (BCCloudAssetAnnotationManager)assetAnnotationManager;
- (BCCloudAssetDetailManager)assetDetailManager;
- (BCCloudAssetReviewManager)assetReviewManager;
- (BCCloudChangeTokenController)changeTokenController;
- (BCCloudDataSource)assetDataSource;
- (BCCloudReadingNowDetailManager)readingNowDetailManager;
- (BCCloudStoreAssetManager)storeAssetManager;
- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager;
- (BDSServiceProxy)serviceProxy;
- (BOOL)proxyMode;
- (NSManagedObjectModel)objectModel;
- (id)initClientXPCProxy;
- (void)dealloc;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)setAssetAnnotationManager:(id)a3;
- (void)setAssetDataSource:(id)a3;
- (void)setAssetDetailManager:(id)a3;
- (void)setAssetReviewManager:(id)a3;
- (void)setChangeTokenController:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4;
- (void)setObjectModel:(id)a3;
- (void)setProxyMode:(BOOL)a3;
- (void)setReadingNowDetailManager:(id)a3;
- (void)setSaltVersionIdentifierManager:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setStoreAssetManager:(id)a3;
@end

@implementation BCCloudAssetManager

+ (id)sharedManager
{
  uint64_t v2 = objc_opt_class();
  return (id)MEMORY[0x270F9A6D0](v2, sel_sharedClientXPCProxy, v3, v4, v5, v6, v7, v8);
}

+ (id)sharedClientXPCProxy
{
  if (qword_26AD775D8 != -1) {
    dispatch_once(&qword_26AD775D8, &unk_26E971E10);
  }
  uint64_t v2 = (void *)qword_26AD77600;
  return v2;
}

- (id)initClientXPCProxy
{
  v64.receiver = self;
  v64.super_class = (Class)BCCloudAssetManager;
  uint64_t v2 = [(BCCloudAssetManager *)&v64 init];
  if (v2)
  {
    uint64_t v3 = BDSCloudKitLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_DEFAULT, "Initializing BCCloudAssetManager - Proxy Build", v63, 2u);
    }

    uint64_t v4 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v4;

    objc_storeStrong((id *)&v2->_assetDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_readingNowDetailManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_assetReviewManager, v2->_serviceProxy);
    objc_storeStrong((id *)&v2->_storeAssetManager, v2->_serviceProxy);
    uint64_t v6 = [BCCloudDataSource alloc];
    v14 = objc_msgSend_objectModel(v2, v7, v8, v9, v10, v11, v12, v13);
    uint64_t v20 = objc_msgSend_initWithManagedObjectModel_nameOnDisk_(v6, v15, (uint64_t)v14, @"BCAssetData", v16, v17, v18, v19);
    assetDataSource = v2->_assetDataSource;
    v2->_assetDataSource = (BCCloudDataSource *)v20;

    v22 = [BCCloudAssetAnnotationManager alloc];
    uint64_t v23 = (uint64_t)v2->_assetDataSource;
    v31 = objc_msgSend_sharedInstance(BCCloudKitController, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v37 = objc_msgSend_initWithCloudDataSource_cloudKitController_(v22, v32, v23, (uint64_t)v31, v33, v34, v35, v36);
    assetAnnotationManager = v2->_assetAnnotationManager;
    v2->_assetAnnotationManager = (BCCloudAssetAnnotationManager *)v37;

    v46 = objc_msgSend_sharedInstance(BCCloudKitController, v39, v40, v41, v42, v43, v44, v45);
    v47 = [BCCloudChangeTokenController alloc];
    v55 = objc_msgSend_managedObjectContext(v2->_assetDataSource, v48, v49, v50, v51, v52, v53, v54);
    uint64_t v60 = objc_msgSend_initWithMOC_zoneName_cloudKitController_(v47, v56, (uint64_t)v55, @"AssetZone", (uint64_t)v46, v57, v58, v59);
    changeTokenController = v2->_changeTokenController;
    v2->_changeTokenController = (BCCloudChangeTokenController *)v60;

    v2->_proxyMode = 1;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_INFO, "Dealloc BCCloudAssetManager", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)BCCloudAssetManager;
  [(BCCloudAssetManager *)&v4 dealloc];
}

- (NSManagedObjectModel)objectModel
{
  objectModel = self->_objectModel;
  if (!objectModel)
  {
    objc_super v4 = (void *)MEMORY[0x263F086E0];
    uint64_t v5 = objc_opt_class();
    uint64_t v12 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8, v9, v10, v11);
    uint64_t v18 = objc_msgSend_pathForResource_ofType_(v12, v13, @"BCAssetData", @"momd", v14, v15, v16, v17);

    v24 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v19, (uint64_t)v18, 1, v20, v21, v22, v23);
    id v25 = objc_alloc(MEMORY[0x263EFF298]);
    v32 = (NSManagedObjectModel *)objc_msgSend_initWithContentsOfURL_(v25, v26, (uint64_t)v24, v27, v28, v29, v30, v31);
    uint64_t v33 = self->_objectModel;
    self->_objectModel = v32;

    objectModel = self->_objectModel;
  }
  return objectModel;
}

- (void)setEnableCloudSync:(BOOL)a3 enableReadingNowSync:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v7 = BDSCloudKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    if (v4) {
      uint64_t v8 = @"YES";
    }
    int v43 = 138412546;
    uint64_t v44 = v9;
    __int16 v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager - Proxy build -  #enableCloudSync setEnableCloudSync %@ enableReadingNowSync %@", (uint8_t *)&v43, 0x16u);
  }

  uint64_t v17 = objc_msgSend_serviceProxy(self, v10, v11, v12, v13, v14, v15, v16);
  objc_msgSend_setEnableCloudSync_enableReadingNowSync_(v17, v18, v5, v4, v19, v20, v21, v22);

  objc_msgSend_setEnableCloudSync_(self->_assetAnnotationManager, v23, v5, v24, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_changeTokenController(self, v29, v30, v31, v32, v33, v34, v35);
  objc_msgSend_setEnableCloudSync_(v36, v37, v5, v38, v39, v40, v41, v42);
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = BDSCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_2360BC000, v5, OS_LOG_TYPE_DEFAULT, "BCCloudAssetManager dissociateCloudDataFromSyncWithCompletion - Proxy modee", v41, 2u);
  }

  uint64_t v13 = objc_msgSend_serviceProxy(self, v6, v7, v8, v9, v10, v11, v12);
  v42[0] = v13;
  uint64_t v21 = objc_msgSend_assetAnnotationManager(self, v14, v15, v16, v17, v18, v19, v20);
  v42[1] = v21;
  uint64_t v29 = objc_msgSend_changeTokenController(self, v22, v23, v24, v25, v26, v27, v28);
  v42[2] = v29;
  uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, (uint64_t)v42, 3, v31, v32, v33, v34);
  objc_msgSend_bds_chainSuccessAndErrorCompletionSelectorCallsForSelector_completion_(v35, v36, (uint64_t)sel_dissociateCloudDataFromSyncWithCompletion_, (uint64_t)v4, v37, v38, v39, v40);
}

- (void)setObjectModel:(id)a3
{
}

- (BCCloudDataSource)assetDataSource
{
  return self->_assetDataSource;
}

- (void)setAssetDataSource:(id)a3
{
}

- (BCCloudAssetAnnotationManager)assetAnnotationManager
{
  return self->_assetAnnotationManager;
}

- (void)setAssetAnnotationManager:(id)a3
{
}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

- (void)setAssetDetailManager:(id)a3
{
}

- (BCCloudReadingNowDetailManager)readingNowDetailManager
{
  return self->_readingNowDetailManager;
}

- (void)setReadingNowDetailManager:(id)a3
{
}

- (BCCloudAssetReviewManager)assetReviewManager
{
  return self->_assetReviewManager;
}

- (void)setAssetReviewManager:(id)a3
{
}

- (BCCloudStoreAssetManager)storeAssetManager
{
  return self->_storeAssetManager;
}

- (void)setStoreAssetManager:(id)a3
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

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_storeAssetManager, 0);
  objc_storeStrong((id *)&self->_assetReviewManager, 0);
  objc_storeStrong((id *)&self->_readingNowDetailManager, 0);
  objc_storeStrong((id *)&self->_assetDetailManager, 0);
  objc_storeStrong((id *)&self->_assetAnnotationManager, 0);
  objc_storeStrong((id *)&self->_assetDataSource, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
}

@end