@interface ASVInlinePreviewFactory
+ (id)shared;
- (ARQLInlineService3)sharedInlineService;
- (ASVInlinePreviewFactory)init;
- (NSExtension)extension;
- (void)_getSharedInlineServiceWithCompletionHandler:(id)a3;
- (void)createFullscreenInstanceWithUUID:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 completionHandler:(id)a6;
- (void)getSharedInlineServiceWithCompletionHandler:(id)a3;
- (void)handleInterruptionOrInvalidation;
@end

@implementation ASVInlinePreviewFactory

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)shared__shared;
  return v2;
}

uint64_t __33__ASVInlinePreviewFactory_shared__block_invoke()
{
  v0 = objc_alloc_init(ASVInlinePreviewFactory);
  uint64_t v1 = shared__shared;
  shared__shared = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ASVInlinePreviewFactory)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASVInlinePreviewFactory;
  v2 = [(ASVInlinePreviewFactory *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AssetViewer.ASVInlinePreviewFactory.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)getSharedInlineServiceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ASVInlinePreviewFactory_getSharedInlineServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6DD7AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __71__ASVInlinePreviewFactory_getSharedInlineServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSharedInlineServiceWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_getSharedInlineServiceWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_extension) {
    goto LABEL_2;
  }
  id v6 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v6 = _asvLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v6, OS_LOG_TYPE_INFO, "#Inline: Retrieving extension", buf, 2u);
  }
  id v17 = 0;
  objc_super v7 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.AssetViewer.ASVAssetViewer" error:&v17];
  id v8 = v17;
  if (!v8)
  {
    extension = self->_extension;
    self->_extension = v7;

LABEL_2:
    if (self->_sharedInlineService)
    {
      v5[2](v5, 0);
    }
    else
    {
      v12 = self->_extension;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E6DD7B50;
      SEL v16 = a2;
      v14[4] = self;
      v15 = v5;
      [(NSExtension *)v12 instantiateViewControllerWithInputItems:0 connectionHandler:v14];
    }
    goto LABEL_15;
  }
  v9 = v8;
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AssetViewer.ASVInlinePreview" code:2 userInfo:0];
  v11 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v11 = _asvLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_1E2840000, v11, OS_LOG_TYPE_ERROR, "#Inline: Couldn't retrieve extension, error: %@", buf, 0xCu);
  }
  ((void (**)(id, void *))v5)[2](v5, v10);

LABEL_15:
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v10 = _asvLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v9;
      _os_log_impl(&dword_1E2840000, v10, OS_LOG_TYPE_ERROR, "#Inline: Error instantiating view controller: %@", buf, 0xCu);
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"ASVInlinePreviewFactory.m", 95, @"Error instantiating view controller: %@", v9 object file lineNumber description];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a3);
    v11 = [*(id *)(*(void *)(a1 + 32) + 16) _extensionContextForUUID:v7];
    v12 = [v11 _auxiliaryConnection];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_12;
    v24[3] = &unk_1E6DD7AD8;
    v24[4] = *(void *)(a1 + 32);
    long long v18 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v18;
    long long v25 = v18;
    v14 = [v12 remoteObjectProxyWithErrorHandler:v24];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_17;
    v23[3] = &unk_1E6DD7810;
    v23[4] = *(void *)(a1 + 32);
    v15 = [v11 _auxiliaryConnection];
    [v15 setInterruptionHandler:v23];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_18;
    v22[3] = &unk_1E6DD7810;
    v22[4] = *(void *)(a1 + 32);
    SEL v16 = [v11 _auxiliaryConnection];
    [v16 setInvalidationHandler:v22];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_19;
    v20[3] = &unk_1E6DD7B28;
    v20[4] = *(void *)(a1 + 32);
    long long v19 = *(_OWORD *)(a1 + 40);
    id v17 = (id)v19;
    long long v21 = v19;
    [v14 getARQLInlineProxy3WithCompletionHandler:v20];
  }
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_12(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    id v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_ERROR, "#Inline: Failed to get protocol service, error: %@", buf, 0xCu);
  }
  v5 = [MEMORY[0x1E4F28B00] currentHandler];
  [v5 handleFailureInMethod:a1[6], a1[4], @"ASVInlinePreviewFactory.m", 105, @"Failed to get protocol service, error: %@", v3 object file lineNumber description];

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2840000, v2, OS_LOG_TYPE_ERROR, "#Inline: Connection interrupted @@@", v4, 2u);
  }
  return [*(id *)(a1 + 32) handleInterruptionOrInvalidation];
}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_18(uint64_t a1)
{
  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2840000, v2, OS_LOG_TYPE_ERROR, "#Inline: Connection invalidated @@@", v4, 2u);
  }
  return [*(id *)(a1 + 32) handleInterruptionOrInvalidation];
}

void __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6DD7B00;
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__ASVInlinePreviewFactory__getSharedInlineServiceWithCompletionHandler___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (!v2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];

    v2 = (void *)a1[4];
  }
  objc_storeStrong((id *)(a1[5] + 32), v2);
  id v3 = *(uint64_t (**)(void))(a1[6] + 16);
  return v3();
}

- (void)createFullscreenInstanceWithUUID:(id)a3 initialFrame:(CGRect)a4 previewOptions:(id)a5 completionHandler:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  extension = self->_extension;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke;
  v21[3] = &unk_1E6DD7BC8;
  id v24 = v16;
  SEL v25 = a2;
  v21[4] = self;
  id v22 = v14;
  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;
  id v23 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  [(NSExtension *)extension instantiateViewControllerWithInputItems:0 connectionHandler:v21];
}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"ASVInlinePreviewFactory.m", 138, @"Error instantiating view controller: %@", v8 object file lineNumber description];
  }
  else
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 16) _extensionContextForUUID:a2];
    uint64_t v10 = [v9 _auxiliaryConnection];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6DD7AD8;
    v22[4] = *(void *)(a1 + 32);
    long long v14 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v14;
    long long v23 = v14;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v22];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_28;
    v15[3] = &unk_1E6DD7BA0;
    id v16 = *(id *)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 88);
    long long v20 = *(_OWORD *)(a1 + 72);
    long long v21 = v13;
    id v17 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v18 = v7;
    [v12 getARQLInlineProxy3WithCompletionHandler:v15];
  }
}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    uint64_t v4 = _asvLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1E2840000, v4, OS_LOG_TYPE_ERROR, "#Inline: Failed to get protocol service, error: %@", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28B00] currentHandler];
  [v5 handleFailureInMethod:a1[6], a1[4], @"ASVInlinePreviewFactory.m", 146, @"Failed to get protocol service: %@", v3 object file lineNumber description];

  (*(void (**)(void))(a1[5] + 16))();
}

void __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2_29;
  v11[3] = &unk_1E6DD7B78;
  id v14 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  double v9 = *(double *)(a1 + 88);
  id v10 = v3;
  objc_msgSend(v10, "prepareFullscreenPreview:initialFrame:previewOptions:fenceHandleCompletion:", v4, v5, v11, v6, v7, v8, v9);
}

uint64_t __106__ASVInlinePreviewFactory_createFullscreenInstanceWithUUID_initialFrame_previewOptions_completionHandler___block_invoke_2_29(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a3, a4);
}

- (void)handleInterruptionOrInvalidation
{
  extension = self->_extension;
  self->_extension = 0;

  sharedInlineService = self->_sharedInlineService;
  self->_sharedInlineService = 0;

  id v6 = [MEMORY[0x1E4F28EA0] notificationWithName:@"ASVConnectionInterrupted" object:0];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotification:v6];
}

- (NSExtension)extension
{
  return self->_extension;
}

- (ARQLInlineService3)sharedInlineService
{
  return self->_sharedInlineService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedInlineService, 0);
  objc_storeStrong((id *)&self->_sharedRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end