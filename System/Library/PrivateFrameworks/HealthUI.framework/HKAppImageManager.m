@interface HKAppImageManager
+ (id)defaultAppIcon;
+ (id)defaultAppIconTableUI;
+ (id)defaultDeviceIconTableUIForSource:(id)a3;
+ (id)sharedImageManager;
- (HKAppImageManager)init;
- (NSMutableDictionary)iconCacheByProductType;
- (NSMutableDictionary)outstandingRequests;
- (id)MindfulnessAppIconForVisionPro:(id)a3;
- (id)_queue_fetchIconFromLaunchServicesWithIdentifier:(id)a3;
- (id)_queue_researchStudyIconForSource:(id)a3;
- (id)_queue_synchronousLoadIconForSource:(id)a3 productType:(id)a4;
- (id)iconForDevice:(id)a3;
- (id)iconForSource:(id)a3 productType:(id)a4;
- (id)researchStudyIconForSource:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_dispatchResponsesForAppIconForIdentifier:(id)a3 appImage:(id)a4;
- (void)_enqueueRequestForAppIconForIdentifier:(id)a3 productType:(id)a4;
- (void)_queue_cacheAppIcon:(id)a3 forIdentifier:(id)a4 productType:(id)a5;
- (void)_queue_loadAppIconForSource:(id)a3 productType:(id)a4 onCompletion:(id)a5;
- (void)cacheAppIcon:(id)a3 forIdentifier:(id)a4;
- (void)clearImageCache;
- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4;
- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 completionHandler:(id)a5;
- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 crop:(int64_t)a5 completionHandler:(id)a6;
- (void)loadIconForSource:(id)a3 productType:(id)a4 completionHandler:(id)a5;
- (void)loadIconForSource:(id)a3 productType:(id)a4 syncHandler:(id)a5 asyncHandler:(id)a6;
- (void)loadIconForSource:(id)a3 syncHandler:(id)a4 asyncHandler:(id)a5;
- (void)setIconCacheByProductType:(id)a3;
- (void)setOutstandingRequests:(id)a3;
@end

@implementation HKAppImageManager

+ (id)sharedImageManager
{
  if (sharedImageManager_onceToken != -1) {
    dispatch_once(&sharedImageManager_onceToken, &__block_literal_global_85);
  }
  v2 = (void *)sharedImageManager___appImageManager;
  return v2;
}

uint64_t __39__HKAppImageManager_sharedImageManager__block_invoke()
{
  v0 = objc_alloc_init(HKAppImageManager);
  uint64_t v1 = sharedImageManager___appImageManager;
  sharedImageManager___appImageManager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (HKAppImageManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)HKAppImageManager;
  v2 = [(HKAppImageManager *)&v21 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F290E0];
    v4 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v5 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v6 = [v3 sessionWithConfiguration:v4 delegate:v2 delegateQueue:v5];
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iconCacheByProductType = v2->_iconCacheByProductType;
    v2->_iconCacheByProductType = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = v10;

    uint64_t v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    containers = v2->_containers;
    v2->_containers = (NSMapTable *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    urlConnections = v2->_urlConnections;
    v2->_urlConnections = v14;

    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    uint64_t v18 = HKCreateSerialDispatchQueue();
    managerQueue = v2->_managerQueue;
    v2->_managerQueue = (OS_dispatch_queue *)v18;
  }
  return v2;
}

+ (id)defaultAppIcon
{
  if (defaultAppIcon_onceToken != -1) {
    dispatch_once(&defaultAppIcon_onceToken, &__block_literal_global_319);
  }
  v2 = (void *)defaultAppIcon___defaultAppIcon;
  return v2;
}

void __35__HKAppImageManager_defaultAppIcon__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 scale];
  double v2 = v1;

  id v10 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  v3 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
  [v3 setScale:v2];
  v4 = [v10 prepareImageForDescriptor:v3];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = [v4 CGImage];
    [v5 scale];
    uint64_t v8 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
    v9 = (void *)defaultAppIcon___defaultAppIcon;
    defaultAppIcon___defaultAppIcon = v8;
  }
}

+ (id)defaultAppIconTableUI
{
  if (defaultAppIconTableUI_onceToken != -1) {
    dispatch_once(&defaultAppIconTableUI_onceToken, &__block_literal_global_325);
  }
  double v2 = (void *)defaultAppIconTableUI___defaultAppIconTableUI;
  return v2;
}

void __42__HKAppImageManager_defaultAppIconTableUI__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 scale];
  double v2 = v1;

  id v10 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
  v3 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
  [v3 setScale:v2];
  v4 = [v10 prepareImageForDescriptor:v3];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = [v4 CGImage];
    [v5 scale];
    uint64_t v8 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
    v9 = (void *)defaultAppIconTableUI___defaultAppIconTableUI;
    defaultAppIconTableUI___defaultAppIconTableUI = v8;
  }
}

+ (id)defaultDeviceIconTableUIForSource:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1830];
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  uint64_t v6 = [v4 systemBlueColor];
  v19[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v8 = [v3 _configurationWithHierarchicalColors:v7];

  LODWORD(v6) = [v5 _isAppleWatch];
  if (v6) {
    v9 = @"Watch1,2";
  }
  else {
    v9 = @"iPhone10,6";
  }
  id v10 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v9];
  v11 = (void *)MEMORY[0x1E4F6F260];
  uint64_t v12 = [v10 identifier];
  uint64_t v18 = 0;
  v13 = [v11 symbolForTypeIdentifier:v12 error:&v18];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4FB1818];
    v15 = [v13 name];
    v16 = [v14 _systemImageNamed:v15 withConfiguration:v8];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)clearImageCache
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HKAppImageManager_clearImageCache__block_invoke;
  block[3] = &unk_1E6D50ED8;
  block[4] = self;
  dispatch_sync(managerQueue, block);
}

uint64_t __36__HKAppImageManager_clearImageCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
}

- (void)cacheAppIcon:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKAppImageManager_cacheAppIcon_forIdentifier___block_invoke;
  block[3] = &unk_1E6D51318;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(managerQueue, block);
}

void __48__HKAppImageManager_cacheAppIcon_forIdentifier___block_invoke(void *a1)
{
  double v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  objc_msgSend(v1, "_queue_cacheAppIcon:forIdentifier:productType:", v2, v3, v4);
}

- (void)loadIconForSource:(id)a3 productType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  managerQueue = self->_managerQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HKAppImageManager_loadIconForSource_productType_completionHandler___block_invoke;
  v15[3] = &unk_1E6D56A78;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(managerQueue, v15);
}

void __69__HKAppImageManager_loadIconForSource_productType_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F2B568], "bundleIdentifierForIconForSource:");
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) bundleIdentifier];
    }
    id v14 = v4;

    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
    }
    id v8 = v7;
    if (!v14) {
      goto LABEL_22;
    }
    id v9 = [*(id *)(a1 + 48) iconCacheByProductType];
    id v10 = [v9 objectForKeyedSubscript:v8];
    v11 = [v10 objectForKeyedSubscript:v14];

    if (v11)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
LABEL_22:
      if ([*(id *)(a1 + 32) _isApplication])
      {
        objc_msgSend(*(id *)(a1 + 48), "_queue_loadAppIconForSource:productType:onCompletion:", *(void *)(a1 + 32), v8, *(void *)(a1 + 56));
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 56);
        id v13 = objc_msgSend(*(id *)(a1 + 48), "_queue_synchronousLoadIconForSource:productType:", *(void *)(a1 + 32), v8);
        (*(void (**)(uint64_t, void *, void, uint64_t, void))(v12 + 16))(v12, v13, 0, 1, 0);
      }
    }
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (id)iconForSource:(id)a3 productType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__26;
  objc_super v21 = __Block_byref_object_dispose__26;
  id v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  managerQueue = self->_managerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__HKAppImageManager_iconForSource_productType___block_invoke;
  v13[3] = &unk_1E6D56AA0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(managerQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __47__HKAppImageManager_iconForSource_productType___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_synchronousLoadIconForSource:productType:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)loadIconForSource:(id)a3 syncHandler:(id)a4 asyncHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F2B860];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 currentDeviceProductType];
  [(HKAppImageManager *)self loadIconForSource:v11 productType:v12 syncHandler:v10 asyncHandler:v9];
}

- (void)loadIconForSource:(id)a3 productType:(id)a4 syncHandler:(id)a5 asyncHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a5;
  id v13 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_managerQueue);
  if (v10)
  {
    id v14 = [(HKAppImageManager *)self iconForSource:v10 productType:v11];
    if (v14)
    {
      v12[2](v12, v14);
      managerQueue = self->_managerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_2;
      block[3] = &unk_1E6D52FB8;
      id v16 = &v22;
      id v22 = v13;
      dispatch_async(managerQueue, block);
    }
    else
    {
      uint64_t v18 = [(id)objc_opt_class() defaultAppIconTableUI];
      v12[2](v12, v18);

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_3;
      v19[3] = &unk_1E6D56AC8;
      id v16 = &v20;
      id v20 = v13;
      [(HKAppImageManager *)self loadIconForSource:v10 productType:v11 completionHandler:v19];
    }
  }
  else
  {
    v12[2](v12, 0);
    uint64_t v17 = self->_managerQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke;
    v23[3] = &unk_1E6D52FB8;
    id v24 = v13;
    dispatch_async(v17, v23);
    id v14 = v24;
  }
}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__HKAppImageManager_loadIconForSource_productType_syncHandler_asyncHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_queue_synchronousLoadIconForSource:(id)a3 productType:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_26;
  }
  id v8 = [MEMORY[0x1E4F2B568] bundleIdentifierForIconForSource:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 bundleIdentifier];
  }
  id v12 = v10;

  if (v7)
  {
    if (!v12)
    {
LABEL_11:
      if (![v6 _isBTLEServer])
      {
        if ([v6 _isConnectedGymSource])
        {
          _HKInitializeLogging();
          id v15 = *MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
            -[HKAppImageManager _queue_synchronousLoadIconForSource:productType:](v15);
          }
          id v16 = [v6 _productType];
          uint64_t v17 = +[HKUIIconUtilties appleDeviceIconForHardwareVersion:v16];

          if (v17)
          {
            id v18 = v17;
          }
          else
          {
            HKDeviceImage(@"watch");
            id v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v11 = v18;

          goto LABEL_25;
        }
        if ([v6 _isResearchStudy])
        {
          uint64_t v14 = [(HKAppImageManager *)self _queue_researchStudyIconForSource:v6];
          goto LABEL_13;
        }
        if ([v6 _isApplication])
        {
          uint64_t v14 = [(HKAppImageManager *)self _queue_fetchIconFromLaunchServicesWithIdentifier:v12];
          goto LABEL_13;
        }
        if ([v6 _isPreferredSource] && (objc_msgSend(v6, "_isApplication") & 1) == 0)
        {
          id v20 = (void *)MEMORY[0x1E4F442D8];
          objc_super v21 = [v6 _productType];
          id v22 = [v20 _typeWithDeviceModelCode:v21];

          v23 = (void *)MEMORY[0x1E4F6F260];
          v33 = v22;
          id v24 = [v22 identifier];
          id v34 = 0;
          v25 = [v23 symbolForTypeIdentifier:v24 error:&v34];
          id v26 = v34;

          v27 = (void *)MEMORY[0x1E4FB1830];
          v28 = [MEMORY[0x1E4FB1618] systemBlueColor];
          v35[0] = v28;
          v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
          v30 = [v27 _configurationWithHierarchicalColors:v29];

          if (!v25
            || (v31 = (void *)MEMORY[0x1E4FB1818],
                [v25 name],
                v32 = objc_claimAutoreleasedReturnValue(),
                [v31 _systemImageNamed:v32 withConfiguration:v30],
                id v11 = objc_claimAutoreleasedReturnValue(),
                v32,
                !v11))
          {
            id v11 = [(id)objc_opt_class() defaultDeviceIconTableUIForSource:v6];
          }

          goto LABEL_25;
        }
      }
      uint64_t v14 = HKBluetoothIcon();
LABEL_13:
      id v11 = (void *)v14;
      goto LABEL_25;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
    if (!v12) {
      goto LABEL_11;
    }
  }
  id v13 = [(NSMutableDictionary *)self->_iconCacheByProductType objectForKeyedSubscript:v7];
  id v11 = [v13 objectForKeyedSubscript:v12];

  if (!v11) {
    goto LABEL_11;
  }
LABEL_25:

LABEL_26:
  return v11;
}

- (void)loadAppImageAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 completionHandler:(id)a5
{
}

- (void)loadAppImageAtURL:(id)a3 productType:(id)a4 crop:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke;
  block[3] = &unk_1E6D56B18;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int64_t v21 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(managerQueue, block);
}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  uint64_t v3 = [*(id *)(a1 + 32) iconCacheByProductType];
  uint64_t v4 = [v3 objectForKeyedSubscript:v2];
  id v5 = [*(id *)(a1 + 40) absoluteString];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v7 = objc_alloc_init(_HKAppImageManagerContainer);
    id v8 = v7;
    if (*(void *)(a1 + 48))
    {
      -[_HKAppImageManagerContainer setProductType:](v7, "setProductType:");
    }
    else
    {
      id v9 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
      [(_HKAppImageManagerContainer *)v8 setProductType:v9];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [(_HKAppImageManagerContainer *)v8 setData:v10];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6D56AF0;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 64);
    v22[4] = v11;
    id v23 = v2;
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 56);
    [(_HKAppImageManagerContainer *)v8 setCompletionHandler:v22];
    id v12 = [*(id *)(a1 + 40) absoluteString];
    [(_HKAppImageManagerContainer *)v8 setUrlString:v12];

    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_3;
    block[3] = &unk_1E6D518B0;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v18 = v14;
    uint64_t v19 = v15;
    id v20 = v8;
    id v21 = *(id *)(a1 + 56);
    id v16 = v8;
    dispatch_async(v13, block);
  }
}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v44 = a2;
  id v7 = a5;
  if (!v44)
  {
    id v8 = 0;
    goto LABEL_20;
  }
  if (*(void *)(a1 + 64) == 1)
  {
    id v8 = objc_msgSend(v44, "hk_watchIconImage");
    if (!v8) {
      goto LABEL_20;
    }
LABEL_19:
    v41 = [*(id *)(a1 + 32) iconCacheByProductType];
    v42 = [v41 objectForKeyedSubscript:*(void *)(a1 + 40)];
    v43 = [*(id *)(a1 + 48) absoluteString];
    [v42 setObject:v8 forKeyedSubscript:v43];

    goto LABEL_20;
  }
  id v9 = (void *)MEMORY[0x1E4FB1818];
  id v10 = v44;
  uint64_t v11 = [v10 CGImage];
  id v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  id v14 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v10, "imageOrientation"), v13);

  [v14 size];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  uint64_t v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 scale];
  CGFloat v21 = v20;
  v46.width = v16;
  v46.height = v18;
  UIGraphicsBeginImageContextWithOptions(v46, 0, v21);

  [v14 size];
  double v23 = v22;
  [v14 size];
  double v25 = v24;
  uint64_t v26 = (void *)MEMORY[0x1E4FB14C0];
  [v14 size];
  if (v28 >= v27) {
    double v27 = v28;
  }
  v29 = objc_msgSend(v26, "_bezierPathWithPillRect:cornerRadius:", 0.0, 0.0, v23, v25, v27 / 57.0 * 13.5);
  [v14 size];
  if (v31 >= v30) {
    double v32 = v31;
  }
  else {
    double v32 = v30;
  }
  v33 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v33 scale];
  if (v32 <= 29.0) {
    double v35 = v34 * 0.100000001;
  }
  else {
    double v35 = v34;
  }

  [v29 setLineWidth:v35];
  [v29 addClip];
  objc_msgSend(v14, "drawInRect:", 0.0, 0.0, v23, v25);
  v36 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
  [v36 set];

  [v14 size];
  if (v38 >= v37) {
    double v37 = v38;
  }
  BOOL v39 = v37 > 29.0;
  double v40 = 0.600000024;
  if (v39) {
    double v40 = 1.0;
  }
  [v29 strokeWithBlendMode:0 alpha:v40];
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  if (v8) {
    goto LABEL_19;
  }
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __74__HKAppImageManager_loadAppImageAtURL_productType_crop_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4E40740]();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:*(void *)(a1 + 32) cachePolicy:0 timeoutInterval:5.0];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) dataTaskWithRequest:v3];
  if (v4
    && ([*(id *)(a1 + 32) absoluteString],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:*(void *)(a1 + 48) forKey:v4];
    id v6 = *(void **)(*(void *)(a1 + 40) + 24);
    id v7 = [*(id *)(a1 + 32) absoluteString];
    [v6 setObject:v4 forKey:v7];

    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_DEFAULT, "Begining data task for url %@.", (uint8_t *)&v12, 0xCu);
    }
    [v4 resume];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HKAppImageManager" code:1001 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, v11);
  }
}

- (id)iconForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 _isConnectedGymDevice])
  {
    uint64_t v4 = +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:v3 preferredIconWidth:29.0];

    if (v4)
    {
      id v5 = v4;
LABEL_6:
      id v8 = v5;
      goto LABEL_10;
    }
    uint64_t v9 = HKDeviceImage(@"watch");
  }
  else
  {
    id v6 = [v3 hardwareVersion];

    id v7 = +[HKUIIconUtilties appleDeviceIconForHardwareVersion:v6];

    if (v7)
    {
      id v5 = v7;
      goto LABEL_6;
    }
    uint64_t v9 = HKBluetoothIcon();
  }
  id v8 = (void *)v9;
  id v5 = 0;
LABEL_10:

  return v8;
}

- (id)researchStudyIconForSource:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__26;
  CGFloat v16 = __Block_byref_object_dispose__26;
  id v17 = 0;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKAppImageManager_researchStudyIconForSource___block_invoke;
  block[3] = &unk_1E6D56B40;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(managerQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __48__HKAppImageManager_researchStudyIconForSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_researchStudyIconForSource:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_queue_researchStudyIconForSource:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  id v6 = [(HKAppImageManager *)self iconCacheByProductType];
  id v7 = [v6 objectForKeyedSubscript:v5];
  id v8 = [v4 bundleIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v18 = 0;
    uint64_t v11 = [v4 _fetchBundleWithError:&v18];
    id v12 = v18;
    if (v12)
    {
      _HKInitializeLogging();
      uint64_t v13 = *MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
        -[HKAppImageManager _queue_researchStudyIconForSource:]((uint64_t)v12, v13);
      }
      id v10 = [(id)objc_opt_class() defaultAppIconTableUI];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4FB1818] imageNamed:@"Icon" inBundle:v11];
      double v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        CGFloat v16 = [v4 bundleIdentifier];
        [(HKAppImageManager *)self _queue_cacheAppIcon:v10 forIdentifier:v16 productType:v5];
      }
      else
      {
        id v10 = [(id)objc_opt_class() defaultAppIconTableUI];
      }
    }
  }

  return v10;
}

- (void)_queue_cacheAppIcon:(id)a3 forIdentifier:(id)a4 productType:(id)a5
{
  id v14 = a5;
  iconCacheByProductType = self->_iconCacheByProductType;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(NSMutableDictionary *)iconCacheByProductType objectForKeyedSubscript:v14];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(NSMutableDictionary *)self->_iconCacheByProductType setObject:v12 forKeyedSubscript:v14];
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_iconCacheByProductType objectForKeyedSubscript:v14];
  [v13 setObject:v10 forKeyedSubscript:v9];
}

- (void)_queue_loadAppIconForSource:(id)a3 productType:(id)a4 onCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 bundleIdentifier];
  id v12 = [(HKAppImageManager *)self _queue_fetchIconFromLaunchServicesWithIdentifier:v11];

  if (v12)
  {
    (*((void (**)(id, void *, void, uint64_t, void))v10 + 2))(v10, v12, 0, 1, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke;
    v13[3] = &unk_1E6D56B90;
    v13[4] = self;
    id v14 = v9;
    id v16 = v10;
    id v15 = v8;
    +[HKSourceListDataSource fetchIconForSource:v15 completion:v13];
  }
}

void __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke_2;
  block[3] = &unk_1E6D56B68;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v13 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __74__HKAppImageManager__queue_loadAppIconForSource_productType_onCompletion___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4E40740]();
  char v3 = [*(id *)(a1 + 32) hasPrefix:*MEMORY[0x1E4F2A580]];
  if (!*(void *)(a1 + 40) || (v3 & 1) != 0)
  {
    id v4 = [MEMORY[0x1E4F2B568] bundleIdentifierForIconForSource:*(void *)(a1 + 48)];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [*(id *)(a1 + 48) bundleIdentifier];
    }
    id v7 = v6;

    id v8 = [*(id *)(a1 + 56) outstandingRequests];
    id v9 = [v8 objectForKeyedSubscript:v7];

    id v10 = (void *)[*(id *)(a1 + 64) copy];
    id v11 = v10;
    if (v9)
    {
      uint64_t v12 = _Block_copy(v10);
      [v9 addObject:v12];
    }
    else
    {
      v16[0] = v10;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      id v14 = (void *)[v13 mutableCopy];
      id v15 = [*(id *)(a1 + 56) outstandingRequests];
      [v15 setObject:v14 forKeyedSubscript:v7];

      [*(id *)(a1 + 56) _enqueueRequestForAppIconForIdentifier:v7 productType:*(void *)(a1 + 32)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)_queue_fetchIconFromLaunchServicesWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4FB1818];
    id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    id v8 = objc_msgSend(v6, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 0);

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
      [(HKAppImageManager *)self _queue_cacheAppIcon:v8 forIdentifier:v4 productType:v9];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_dispatchResponsesForAppIconForIdentifier:(id)a3 appImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    managerQueue = self->_managerQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HKAppImageManager__dispatchResponsesForAppIconForIdentifier_appImage___block_invoke;
    block[3] = &unk_1E6D51318;
    id v12 = v7;
    id v13 = self;
    id v14 = v6;
    dispatch_async(managerQueue, block);
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F70], OS_LOG_TYPE_ERROR)) {
      -[HKAppImageManager _dispatchResponsesForAppIconForIdentifier:appImage:]((uint64_t)v6, (uint64_t)v8, v10);
    }
  }
}

void __72__HKAppImageManager__dispatchResponsesForAppIconForIdentifier_appImage___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
    objc_msgSend(*(id *)(a1 + 40), "_queue_cacheAppIcon:forIdentifier:productType:", *(void *)(a1 + 32), *(void *)(a1 + 48), v2);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v3 = objc_msgSend(*(id *)(a1 + 40), "outstandingRequests", 0);
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [*(id *)(a1 + 40) outstandingRequests];
  [v9 removeObjectForKey:*(void *)(a1 + 48)];
}

- (void)_enqueueRequestForAppIconForIdentifier:(id)a3 productType:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  uint64_t v9 = *MEMORY[0x1E4F2A580];
  char v10 = [v8 hasPrefix:*MEMORY[0x1E4F2A580]];
  uint64_t v11 = *MEMORY[0x1E4F2BFD8];
  if ([v6 isEqualToString:*MEMORY[0x1E4F2BFD8]])
  {
    long long v12 = [(HKAppImageManager *)self MindfulnessAppIconForVisionPro:v8];
    id v13 = v12;
    if (v12)
    {
      managerQueue = self->_managerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke;
      block[3] = &unk_1E6D55518;
      void block[4] = self;
      id v13 = v12;
      id v34 = v13;
      id v15 = v6;
      id v35 = v15;
      id v36 = v7;
      dispatch_async(managerQueue, block);
      [(HKAppImageManager *)self _dispatchResponsesForAppIconForIdentifier:v15 appImage:v13];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v26 = *MEMORY[0x1E4F29F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F70], OS_LOG_TYPE_ERROR)) {
        -[HKAppImageManager _enqueueRequestForAppIconForIdentifier:productType:](v11, v26);
      }
    }
  }
  else
  {
    int v16 = [v7 hasPrefix:v9];
    id v17 = (void *)MEMORY[0x1E4F4DBD8];
    id v18 = [MEMORY[0x1E4F4DD40] bagSubProfile];
    uint64_t v19 = [MEMORY[0x1E4F4DD40] bagSubProfileVersion];
    id v13 = [v17 bagForProfile:v18 profileVersion:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F4DD40]);
    CGFloat v21 = (void *)[v20 initWithType:0 clientIdentifier:*MEMORY[0x1E4F2BDC0] clientVersion:@"1" bag:v13];
    v40[0] = v6;
    double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v21 setBundleIdentifiers:v22];

    if (v16)
    {
      uint64_t v39 = *MEMORY[0x1E4F4DAF8];
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      [v21 setAdditionalPlatforms:v23];
    }
    double v24 = [v21 perform];
    _HKInitializeLogging();
    double v25 = *MEMORY[0x1E4F29F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl(&dword_1E0B26000, v25, OS_LOG_TYPE_DEFAULT, "Enqueuing request to download App information for identifier %@", buf, 0xCu);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_357;
    v27[3] = &unk_1E6D56BE0;
    id v28 = v6;
    v29 = self;
    char v31 = v16;
    char v32 = v10;
    id v30 = v7;
    [v24 addFinishBlock:v27];
  }
}

uint64_t __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cacheAppIcon:forIdentifier:productType:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_357(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F70], OS_LOG_TYPE_ERROR)) {
      __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_357_cold_1();
    }
    uint64_t v34 = a1 + 32;
    uint64_t v32 = *(void *)(a1 + 32);
    v33 = *(void **)(v34 + 8);
    id v18 = [(id)objc_opt_class() defaultAppIcon];
    [v33 _dispatchResponsesForAppIconForIdentifier:v32 appImage:v18];
  }
  else
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v8 = @"xros";
    }
    else {
      uint64_t v8 = @"ios";
    }
    uint64_t v9 = (objc_class *)MEMORY[0x1E4F4DD20];
    char v10 = v8;
    id v11 = [v9 alloc];
    long long v12 = [v5 responseDataItems];
    id v13 = [v12 firstObject];
    id v14 = [v13 objectForKeyedSubscript:@"attributes"];
    id v15 = [v14 objectForKeyedSubscript:@"platformAttributes"];
    int v16 = [v15 objectForKeyedSubscript:v10];

    id v17 = [v16 objectForKeyedSubscript:@"artwork"];
    id v18 = (void *)[v11 initWithDictionary:v17];

    if (*(unsigned char *)(a1 + 57)) {
      double v19 = 32.0;
    }
    else {
      double v19 = 29.0;
    }
    id v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v20 scale];
    double v22 = v19 * v21;
    double v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v23 scale];
    double v25 = objc_msgSend(v18, "URLWithSize:cropStyle:format:", *MEMORY[0x1E4F4DA70], *MEMORY[0x1E4F4DA80], v22, v19 * v24);

    uint64_t v26 = [*(id *)(a1 + 32) hasPrefix:@"com.apple.Nano"];
    double v27 = *(void **)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 48);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_377;
    v35[3] = &unk_1E6D56BB8;
    id v29 = *(id *)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    char v31 = *(void **)(a1 + 48);
    id v36 = v29;
    uint64_t v37 = v30;
    id v38 = v31;
    [v27 loadAppImageAtURL:v25 productType:v28 crop:v26 completionHandler:v35];
  }
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_377(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  _HKInitializeLogging();
  uint64_t v9 = (void *)*MEMORY[0x1E4F29F70];
  char v10 = *MEMORY[0x1E4F29F70];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_377_cold_1();
    }
    id v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v9;
      [v7 size];
      uint64_t v14 = v13;
      [v7 size];
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v14;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_DEFAULT, "app image size from loadAppImage: %f %f", buf, 0x16u);
    }
    id v11 = v7;
    if (v7)
    {
      id v16 = a1[5];
      id v17 = *((void *)v16 + 4);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_378;
      double v21 = &unk_1E6D55518;
      id v22 = v16;
      id v11 = v7;
      id v23 = v11;
      id v24 = a1[4];
      id v25 = a1[6];
      dispatch_async(v17, &v18);
    }
  }
  objc_msgSend(a1[5], "_dispatchResponsesForAppIconForIdentifier:appImage:", a1[4], v11, v18, v19, v20, v21, v22);
}

uint64_t __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_378(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cacheAppIcon:forIdentifier:productType:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HKAppImageManager_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E6D51318;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(managerQueue, block);
}

void __56__HKAppImageManager_URLSession_dataTask_didReceiveData___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  if (v2)
  {
    id v4 = v2;
    char v3 = [v2 data];
    [v3 appendData:a1[6]];

    uint64_t v2 = v4;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  managerQueue = self->_managerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HKAppImageManager_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E6D51318;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(managerQueue, block);
}

void __58__HKAppImageManager_URLSession_task_didCompleteWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4E40740]();
  char v3 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  id v4 = v3;
  if (a1[6])
  {
    if (!v3) {
      goto LABEL_14;
    }
    id v5 = *(void **)(a1[4] + 40);
    id v6 = [v3 productType];
    id v7 = [v5 objectForKeyedSubscript:v6];
    id v8 = [v4 urlString];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    uint64_t v10 = [v4 completionHandler];
    id v11 = (void (**)(void, void, void, void, void))v10;
    if (v9)
    {
      long long v12 = v9;
      uint64_t v13 = 1;
      uint64_t v14 = 1;
    }
    else
    {
      long long v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t, void))(v10 + 16))(v10, v12, v13, v14, a1[6]);
  }
  else
  {
    if (!v3) {
      goto LABEL_14;
    }
    uint64_t v9 = [v3 data];
    if ([v9 length]
      && ([MEMORY[0x1E4FB1818] imageWithData:v9], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = (void (**)(void, void, void, void, void))v15;
      id v16 = [v4 completionHandler];
      v16[2](v16, v11, 0, 1, 0);
    }
    else
    {
      id v11 = [v4 completionHandler];
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HKAppImageManager" code:1002 userInfo:0];
      v11[2](v11, 0, 0, 0, v16);
    }
  }
  id v17 = *(void **)(a1[4] + 24);
  uint64_t v18 = [v4 urlString];
  [v17 removeObjectForKey:v18];

  [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
LABEL_14:
}

- (id)MindfulnessAppIconForVisionPro:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = HKHealthUIFrameworkBundle();
  id v5 = [v3 imageNamed:@"mindfulness_app_icon" inBundle:v4];

  return v5;
}

- (NSMutableDictionary)iconCacheByProductType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIconCacheByProductType:(id)a3
{
}

- (NSMutableDictionary)outstandingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutstandingRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_iconCacheByProductType, 0);
  objc_storeStrong((id *)&self->_managerQueue, 0);
  objc_storeStrong((id *)&self->_urlConnections, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_queue_synchronousLoadIconForSource:(os_log_t)log productType:.cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "GymKit icons should be derived from the device", v1, 2u);
}

- (void)_queue_researchStudyIconForSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to load bundle with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)_dispatchResponsesForAppIconForIdentifier:(NSObject *)a3 appImage:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "_dispatchResponsesForAppIconForIdentifier identifier: %@ appImage: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_enqueueRequestForAppIconForIdentifier:(uint64_t)a1 productType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to create app image for %@ identifier", (uint8_t *)&v2, 0xCu);
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_357_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "AMS Promise failed for: %@ error: %{public}@");
}

void __72__HKAppImageManager__enqueueRequestForAppIconForIdentifier_productType___block_invoke_377_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Couldn't load app image failed for: %@ error: %{public}@");
}

@end