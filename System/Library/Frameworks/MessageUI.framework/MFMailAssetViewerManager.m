@interface MFMailAssetViewerManager
+ (id)log;
- (EFLocked)handlers;
- (MFMailAssetViewerManager)initWithDelegate:(id)a3;
- (MFMailAssetViewerManagerDelegate)delegate;
- (id)handlerForAttachmentContext:(id)a3;
- (void)assetViewer:(id)a3 editCompletedWithURL:(id)a4;
- (void)assetViewerEditCanceled:(id)a3;
- (void)assetViewerSceneClosed:(id)a3;
- (void)assetViewerSceneLaunched:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlers:(id)a3;
@end

@implementation MFMailAssetViewerManager

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MFMailAssetViewerManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;

  return v2;
}

void __31__MFMailAssetViewerManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

- (MFMailAssetViewerManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMailAssetViewerManager;
  v5 = [(MFMailAssetViewerManager *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = [v6 initWithObject:v7];
    handlers = v5->_handlers;
    v5->_handlers = (EFLocked *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (id)handlerForAttachmentContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[MFMailAssetViewerHandler alloc] initWithAttachmentContext:v4 delegate:self];
  id v6 = [(MFMailAssetViewerManager *)self handlers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__MFMailAssetViewerManager_handlerForAttachmentContext___block_invoke;
  v10[3] = &unk_1E5F7B208;
  id v7 = v5;
  objc_super v11 = v7;
  [v6 performWhileLocked:v10];

  uint64_t v8 = +[MFMailAssetViewerManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "Created and registered handler %@", buf, 0xCu);
  }

  return v7;
}

uint64_t __56__MFMailAssetViewerManager_handlerForAttachmentContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)assetViewerSceneLaunched:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[MFMailAssetViewerManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene launched for %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)assetViewerSceneClosed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[MFMailAssetViewerManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene closed for %@", buf, 0xCu);
  }

  id v6 = [(MFMailAssetViewerManager *)self handlers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MFMailAssetViewerManager_assetViewerSceneClosed___block_invoke;
  v9[3] = &unk_1E5F7B208;
  id v7 = v4;
  id v10 = v7;
  [v6 performWhileLocked:v9];

  uint64_t v8 = [(MFMailAssetViewerManager *)self delegate];
  [v8 assetViewerManager:self sceneClosedForHandler:v7];
}

uint64_t __51__MFMailAssetViewerManager_assetViewerSceneClosed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)assetViewer:(id)a3 editCompletedWithURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MFMailAssetViewerManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "Asset Viewerscene edit completed %@ for %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__MFMailAssetViewerManager_assetViewer_editCompletedWithURL___block_invoke;
  v12[3] = &unk_1E5F79770;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  objc_super v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v11 performBlock:v12];
}

void __61__MFMailAssetViewerManager_assetViewer_editCompletedWithURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 assetViewerManager:*(void *)(a1 + 32) editCompletedForHandler:*(void *)(a1 + 40) URL:*(void *)(a1 + 48)];
}

- (void)assetViewerEditCanceled:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[MFMailAssetViewerManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Asset Viewer scene edit canceled %@", (uint8_t *)&v5, 0xCu);
  }
}

- (MFMailAssetViewerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailAssetViewerManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EFLocked)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end