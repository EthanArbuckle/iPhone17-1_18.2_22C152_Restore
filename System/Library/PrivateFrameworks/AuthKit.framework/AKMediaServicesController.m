@interface AKMediaServicesController
+ (id)sharedInstance;
- (AKMediaServicesController)init;
- (BOOL)_isRequestCancelledForBundleID:(id)a3;
- (void)_appMetadataForBundleID:(id)a3 completion:(id)a4;
- (void)appIconForBundleID:(id)a3 size:(id)a4 completion:(id)a5;
- (void)appMetadataForBundleIDs:(id)a3 completion:(id)a4;
- (void)cancelAppIconRequestForBundleID:(id)a3 completion:(id)a4;
@end

@implementation AKMediaServicesController

- (AKMediaServicesController)init
{
  v13.receiver = self;
  v13.super_class = (Class)AKMediaServicesController;
  v2 = [(AKMediaServicesController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_activeLockupGroupLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    activeLockupGroupForBundleID = v3->_activeLockupGroupForBundleID;
    v3->_activeLockupGroupForBundleID = (NSMutableDictionary *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.authkit.AKMediaServicesController.imagedownloadqueue", v6);
    imageDownloadQueue = v3->_imageDownloadQueue;
    v3->_imageDownloadQueue = (OS_dispatch_queue *)v7;

    ASCLockupViewGroupClass = (objc_class *)AppStoreComponentsLibraryCore();
    if (ASCLockupViewGroupClass) {
      ASCLockupViewGroupClass = (objc_class *)getASCLockupViewGroupClass();
    }
    uint64_t v10 = [[ASCLockupViewGroupClass alloc] initWithName:@"AKMediaServicesController Lockup Group"];
    group = v3->_group;
    v3->_group = (ASCLockupViewGroup *)v10;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __43__AKMediaServicesController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(AKMediaServicesController);

  return MEMORY[0x1F41817F8]();
}

- (void)appIconForBundleID:(id)a3 size:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Fetching Icon for bundleID: %@", buf, 0xCu);
  }

  v12 = self->_group;
  if (v9)
  {
    [v9 CGSizeValue];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0x4052000000000000;
    uint64_t v16 = 0x4052000000000000;
  }
  os_unfair_lock_lock(&self->_activeLockupGroupLock);
  [(NSMutableDictionary *)self->_activeLockupGroupForBundleID setObject:v12 forKey:v8];
  os_unfair_lock_unlock(&self->_activeLockupGroupLock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke;
  v19[3] = &unk_1E5760A60;
  v19[4] = v12;
  id v20 = v8;
  v21 = self;
  id v22 = v10;
  uint64_t v23 = v14;
  uint64_t v24 = v16;
  id v17 = v10;
  id v18 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = AppStoreComponentsLibraryCore();
  if (v4)
  {
    v5 = getASCLockupContextSignInWithApple();
  }
  else
  {
    v5 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2;
  v9[3] = &unk_1E5760A38;
  int8x16_t v8 = *(int8x16_t *)(a1 + 40);
  id v6 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v7 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v7;
  long long v13 = *(_OWORD *)(a1 + 64);
  [v2 _lockupRequestForBundleID:v3 withContext:v5 enableAppDistribution:1 completionBlock:v9];
  if (v4) {
}
  }

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _isRequestCancelledForBundleID:*(void *)(a1 + 40)])
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1();
    }
LABEL_4:

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17001 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    goto LABEL_13;
  }
  if (!v6)
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_33;
      block[3] = &unk_1E5760A10;
      block[4] = *(void *)(a1 + 48);
      id v12 = v5;
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 40);
      id v16 = v12;
      uint64_t v17 = v13;
      id v18 = v14;
      id v19 = *(id *)(a1 + 56);
      long long v20 = *(_OWORD *)(a1 + 64);
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_13;
    }
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_2();
    }
    goto LABEL_4;
  }
  int8x16_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_3();
  }

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
  }
LABEL_13:
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_33(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = AppStoreComponentsLibraryCore();
  if (v3)
  {
    uint64_t v4 = get_ASCLockupKeyIcon();
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (!AppStoreComponentsLibraryCore())
  {
    id v6 = objc_msgSend(v2, "initWithObjects:", v4, 0, 0);
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v5 = get_ASCLockupKeyTitle();
  id v6 = objc_msgSend(v2, "initWithObjects:", v4, v5, 0);

  if (v3) {
LABEL_6:
  }

LABEL_7:
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35;
  v10[3] = &unk_1E575EE80;
  id v9 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v11 = v9;
  id v12 = *(id *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 72);
  [v7 _lockupDictionaryForRequest:v8 includingKeys:v6 withCompletionBlock:v10];
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35(uint64_t a1, void *a2, void *a3)
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _isRequestCancelledForBundleID:*(void *)(a1 + 40)])
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1();
    }
LABEL_4:

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17001 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
    }
    goto LABEL_53;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (!v6)
  {
    id v12 = _AKLogSystem();
    id v7 = v12;
    if (!v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_2();
      }
      goto LABEL_4;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_4();
    }

    if (AppStoreComponentsLibraryCore())
    {
      long long v13 = get_ASCLockupKeyIcon();
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];

      if (v14)
      {
LABEL_16:
        uint64_t v15 = AppStoreComponentsLibraryCore();
        uint64_t v36 = v15;
        if (v15)
        {
          uint64_t v15 = getASCArtworkTemplateKeyWidth();
        }
        v31 = (void *)v15;
        v42[0] = v15;
        v35 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)(a1 + 56));
        v43[0] = v35;
        uint64_t v16 = AppStoreComponentsLibraryCore();
        uint64_t v34 = v16;
        if (v16)
        {
          uint64_t v16 = getASCArtworkTemplateKeyHeight();
        }
        v30 = (void *)v16;
        v42[1] = v16;
        v33 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)(a1 + 64));
        v43[1] = v33;
        uint64_t v17 = AppStoreComponentsLibraryCore();
        uint64_t v32 = v17;
        v37 = v14;
        if (v17)
        {
          uint64_t v17 = getASCArtworkTemplateKeyCrop();
        }
        v29 = (void *)v17;
        v42[2] = v17;
        uint64_t v18 = AppStoreComponentsLibraryCore();
        if (v18)
        {
          id v19 = getASCArtworkCropBoundingBox();
        }
        else
        {
          id v19 = 0;
        }
        v43[2] = v19;
        uint64_t v23 = AppStoreComponentsLibraryCore();
        if (v23)
        {
          uint64_t v24 = getASCArtworkTemplateKeyFormat();
        }
        else
        {
          uint64_t v24 = 0;
        }
        v42[3] = v24;
        uint64_t v25 = AppStoreComponentsLibraryCore();
        if (v25)
        {
          id v26 = getASCArtworkFormatPNG();
        }
        else
        {
          id v26 = 0;
        }
        v43[3] = v26;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
        if (v25) {

        }
        if (v23) {
        if (v18)
        }

        if (v32) {
        uint64_t v14 = v37;
        }
        if (v34) {

        }
        if (v36) {
        uint64_t v27 = [v37 makeURLWithSubstitutions:v22];
        }
        v28 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41;
        block[3] = &unk_1E575F420;
        block[4] = v27;
        id v39 = v5;
        v40 = v37;
        id v41 = *(id *)(a1 + 48);
        dispatch_async(v28, block);

        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v14 = [v5 objectForKeyedSubscript:0];
      if (v14) {
        goto LABEL_16;
      }
    }
    long long v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_3();
    }

    uint64_t v21 = *(void *)(a1 + 48);
    if (!v21) {
      goto LABEL_52;
    }
    id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17001 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);
LABEL_51:

LABEL_52:
    goto LABEL_53;
  }
  int8x16_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_5();
  }

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
  }
LABEL_53:
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v27 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:1 error:&v27];
  id v4 = v27;
  id v5 = _AKLogSystem();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_5((uint64_t *)(a1 + 32), v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_4();
  }

  id v7 = objc_alloc_init(AKIconContext);
  [(AKIconContext *)v7 setData:v3];
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = AppStoreComponentsLibraryCore();
  if (v9)
  {
    int8x16_t v10 = get_ASCLockupKeyTitle();
  }
  else
  {
    int8x16_t v10 = 0;
  }
  uint64_t v11 = [v8 objectForKeyedSubscript:v10];
  [(AKIconContext *)v7 setAppName:v11];

  if (v9) {
  id v12 = [*(id *)(a1 + 48) decoration];
  }
  if (AppStoreComponentsLibraryCore())
  {
    long long v13 = getASCArtworkDecorationNone();
    char v14 = [v12 isEqualToString:v13];

    if (v14) {
      goto LABEL_13;
    }
  }
  else
  {
    int v17 = [v12 isEqualToString:0];

    if (v17)
    {
LABEL_13:
      uint64_t v15 = _AKLogSystem();
      uint64_t v16 = 2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_1(v15);
        uint64_t v16 = 2;
      }
      goto LABEL_25;
    }
  }
  uint64_t v18 = [*(id *)(a1 + 48) decoration];
  if (AppStoreComponentsLibraryCore())
  {
    id v19 = getASCArtworkDecorationRoundedRect();
    char v20 = [v18 isEqualToString:v19];

    if (v20)
    {
LABEL_18:
      uint64_t v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_2(v15);
      }
      uint64_t v16 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    int v21 = [v18 isEqualToString:0];

    if (v21) {
      goto LABEL_18;
    }
  }
  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_3((id *)(a1 + 48), v15);
  }
  uint64_t v16 = 0;
LABEL_25:

  [(AKIconContext *)v7 setMaskingStyle:v16];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_44;
  v24[3] = &unk_1E57609E8;
  id v22 = *(id *)(a1 + 56);
  id v25 = v4;
  id v26 = v22;
  v24[4] = v7;
  id v23 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v24);
}

uint64_t __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_44(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)cancelAppIconRequestForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([(AKMediaServicesController *)self _isRequestCancelledForBundleID:v6])
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKMediaServicesController cancelAppIconRequestForBundleID:completion:]();
    }

    if (v7)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKSignInWithAppleError" code:-16007 userInfo:0];
      v7[2](v7, 0, v9);
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_activeLockupGroupLock);
    [(NSMutableDictionary *)self->_activeLockupGroupForBundleID removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_activeLockupGroupLock);
    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
}

- (BOOL)_isRequestCancelledForBundleID:(id)a3
{
  p_activeLockupGroupLock = &self->_activeLockupGroupLock;
  id v5 = a3;
  os_unfair_lock_lock(p_activeLockupGroupLock);
  id v6 = [(NSMutableDictionary *)self->_activeLockupGroupForBundleID objectForKey:v5];

  os_unfair_lock_unlock(p_activeLockupGroupLock);
  return v6 == 0;
}

- (void)appMetadataForBundleIDs:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2810000000;
  v33[3] = "";
  int v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  id v32 = (id)objc_opt_new();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  id v30 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke;
        v20[3] = &unk_1E5760A88;
        id v22 = v33;
        id v23 = v31;
        uint64_t v24 = v29;
        int v21 = v8;
        [(AKMediaServicesController *)self _appMetadataForBundleID:v12 completion:v20];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }

  long long v13 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke_2;
  block[3] = &unk_1E5760AB0;
  uint64_t v18 = v31;
  id v19 = v29;
  id v17 = v7;
  id v14 = v7;
  dispatch_group_notify(v8, v13, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
}

void __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  if (v9)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addEntriesFromDictionary:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __64__AKMediaServicesController_appMetadataForBundleIDs_completion___block_invoke_2(void *a1)
{
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) count] || !*(void *)(*(void *)(a1[6] + 8) + 40)) {
    uint64_t v2 = *(uint64_t (**)(void))(a1[4] + 16);
  }
  else {
    uint64_t v2 = *(uint64_t (**)(void))(a1[4] + 16);
  }

  return v2();
}

- (void)_appMetadataForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke;
  block[3] = &unk_1E5760B00;
  void block[4] = group;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = group;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = AppStoreComponentsLibraryCore();
  if (v4)
  {
    id v5 = getASCLockupContextSignInWithApple();
  }
  else
  {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2;
  v7[3] = &unk_1E5760AD8;
  id v8 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v6;
  [v2 _lockupRequestForBundleID:v3 withContext:v5 enableAppDistribution:1 completionBlock:v7];
  if (v4) {
}
  }

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_48;
    v12[3] = &unk_1E575F420;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v5;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17001 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_48(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = AppStoreComponentsLibraryCore();
  if (v3)
  {
    uint64_t v4 = get_ASCLockupKeyDeveloperName();
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = AppStoreComponentsLibraryCore();
  if (v5)
  {
    id v6 = get_ASCLockupKeyTitle();
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = AppStoreComponentsLibraryCore();
  if (v7)
  {
    uint64_t v8 = get_ASCLockupKeyShortName();
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (AppStoreComponentsLibraryCore())
  {
    uint64_t v9 = get_ASCLockupKeyAdamID();
    uint64_t v10 = objc_msgSend(v2, "initWithObjects:", v4, v6, v8, v9, 0);

    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v10 = objc_msgSend(v2, "initWithObjects:", v4, v6, v8, 0, 0);
  if (v7) {
LABEL_12:
  }

LABEL_13:
  if (v5) {

  }
  if (v3) {
  uint64_t v11 = *(void **)(a1 + 32);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49;
  v13[3] = &unk_1E575F898;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  [v11 _lockupDictionaryForRequest:v12 includingKeys:v10 withCompletionBlock:v13];
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49_cold_2();
    }

    if (AppStoreComponentsLibraryCore())
    {
      uint64_t v9 = get_ASCLockupKeyAdamID();
      uint64_t v10 = [v5 objectForKeyedSubscript:v9];
    }
    else
    {
      uint64_t v10 = [v5 objectForKeyedSubscript:0];
    }
    uint64_t v11 = [AKAppiTunesMetadata alloc];
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = AppStoreComponentsLibraryCore();
    if (v26)
    {
      uint64_t v12 = get_ASCLockupKeyShortName();
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v24 = (void *)v12;
    v29 = [v5 objectForKeyedSubscript:v12];
    uint64_t v13 = AppStoreComponentsLibraryCore();
    uint64_t v27 = a1;
    if (v13)
    {
      id v14 = get_ASCLockupKeyTitle();
    }
    else
    {
      id v14 = 0;
    }
    id v15 = [v5 objectForKeyedSubscript:v14];
    uint64_t v16 = AppStoreComponentsLibraryCore();
    id v28 = v6;
    if (v16)
    {
      id v17 = get_ASCLockupKeyDeveloperName();
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v18 = [v5 objectForKeyedSubscript:v17];
    id v19 = v10;
    char v20 = [v10 stringValue];
    int v21 = [(AKAppiTunesMetadata *)v11 initWithBundleId:v25 shortName:v29 appName:v15 appDeveloperName:v18 adamID:v20];

    if (v16) {
    if (v13)
    }

    if (v26) {
    uint64_t v22 = *(void *)(v27 + 40);
    }
    uint64_t v30 = *(void *)(v27 + 32);
    v31[0] = v21;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);

    id v6 = v28;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_imageDownloadQueue, 0);

  objc_storeStrong((id *)&self->_activeLockupGroupForBundleID, 0);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "App icon request for bundleID %@ was cancelled", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Lockup request for bundleID %@ is nil", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Failed to fetch lockup request for bundleID %@ with error %@");
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_2()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Lockup dictionary for bundleID %@ is nil", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_3()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Lockup dictionary does not contain artwork for bundleID: %@", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "Lockup dictionary result: %@", v1, 0xCu);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_2_35_cold_5()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Failed to fetch lockup dictionary for bundleID %@ with error %@");
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Setting masking style to AKIconMaskingStyleUnmasked for artwork decoration style ASCArtworkDecorationNone", v1, 2u);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Setting masking style to AKIconMaskingStyleMasked for artwork decoration style ASCArtworkDecorationRoundedRect", v1, 2u);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_3(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 decoration];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Setting masking style to AKIconMaskingStyleUnknown for artwork decoration style %@", v4, 0xCu);
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_4()
{
  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Request for %@ failed %@");
}

void __64__AKMediaServicesController_appIconForBundleID_size_completion___block_invoke_41_cold_5(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a2 length];
  _os_log_debug_impl(&dword_193494000, a3, OS_LOG_TYPE_DEBUG, "Request for %@ received data of length %lu", (uint8_t *)&v5, 0x16u);
}

- (void)cancelAppIconRequestForBundleID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "No active lockup group found for bundleID: %@", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Lockup request for bundleID %@ is nil", v2, v3, v4, v5, v6);
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Failed to fetch lockup request for bundleID %@ with error %@");
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Error fetching app metadata for %@: %@");
}

void __64__AKMediaServicesController__appMetadataForBundleID_completion___block_invoke_2_49_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_193494000, v0, OS_LOG_TYPE_DEBUG, "App metadata results: %@", v1, 0xCu);
}

@end