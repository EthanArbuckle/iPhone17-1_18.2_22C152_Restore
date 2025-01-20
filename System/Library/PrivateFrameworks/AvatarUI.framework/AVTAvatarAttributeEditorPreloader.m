@interface AVTAvatarAttributeEditorPreloader
- (AVTAvatarAttributeEditorPreloader)initWithResourceLoader:(id)a3 logger:(id)a4;
- (AVTPresetResourceLoader)resourceLoader;
- (AVTUILogger)logger;
- (NSMutableDictionary)cancelationTokens;
- (void)cancelAllPreloading;
- (void)cancelPreloadForSectionItemIndexPath:(id)a3;
- (void)dealloc;
- (void)preloadCategory:(id)a3;
- (void)preloadSectionItem:(id)a3 atIndexPath:(id)a4;
- (void)setCancelationTokens:(id)a3;
- (void)setLogger:(id)a3;
- (void)setResourceLoader:(id)a3;
@end

@implementation AVTAvatarAttributeEditorPreloader

- (AVTAvatarAttributeEditorPreloader)initWithResourceLoader:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorPreloader;
  v9 = [(AVTAvatarAttributeEditorPreloader *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceLoader, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    cancelationTokens = v10->_cancelationTokens;
    v10->_cancelationTokens = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (void)cancelAllPreloading
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
  v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        v10 = [(AVTAvatarAttributeEditorPreloader *)self logger];
        uint64_t v11 = [v9 description];
        [v10 logCancelingPreLoadingTask:v11];

        [v9 cancel];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
  [v12 removeAllObjects];
}

- (void)dealloc
{
  [(AVTAvatarAttributeEditorPreloader *)self cancelAllPreloading];
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorPreloader;
  [(AVTAvatarAttributeEditorPreloader *)&v3 dealloc];
}

- (void)preloadSectionItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVTAvatarAttributeEditorPreloader *)self logger];
  objc_msgSend(v8, "logPreLoadingNeededForIndex:section:", objc_msgSend(v7, "item"), objc_msgSend(v7, "section"));

  v9 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
  v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = [(AVTAvatarAttributeEditorPreloader *)self resourceLoader];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__AVTAvatarAttributeEditorPreloader_preloadSectionItem_atIndexPath___block_invoke;
    v16[3] = &unk_263FF0278;
    objc_copyWeak(&v18, &location);
    id v12 = v7;
    id v17 = v12;
    v10 = [v11 preLoadResourcesForSectionItem:v6 completionHandler:v16];

    long long v13 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
    [v13 setObject:v10 forKeyedSubscript:v12];

    long long v14 = [(AVTAvatarAttributeEditorPreloader *)self logger];
    long long v15 = [v10 description];
    objc_msgSend(v14, "logRequestingPreLoadingTask:forIndex:section:", v15, objc_msgSend(v12, "item"), objc_msgSend(v12, "section"));

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __68__AVTAvatarAttributeEditorPreloader_preloadSectionItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained cancelationTokens];
  id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v6 == v4)
  {
    id v7 = [WeakRetained cancelationTokens];
    [v7 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)cancelPreloadForSectionItemIndexPath:(id)a3
{
  id v9 = a3;
  id v4 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
  uint64_t v5 = [v4 objectForKeyedSubscript:v9];

  if (v5)
  {
    id v6 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
    [v6 setObject:0 forKeyedSubscript:v9];

    id v7 = [(AVTAvatarAttributeEditorPreloader *)self logger];
    uint64_t v8 = [v5 description];
    [v7 logCancelingPreLoadingTask:v8];

    [v5 cancel];
  }
}

- (void)preloadCategory:(id)a3
{
  id v4 = a3;
  [(AVTAvatarAttributeEditorPreloader *)self cancelAllPreloading];
  objc_initWeak(&location, self);
  uint64_t v5 = [(AVTAvatarAttributeEditorPreloader *)self resourceLoader];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __53__AVTAvatarAttributeEditorPreloader_preloadCategory___block_invoke;
  uint64_t v11 = &unk_263FF02A0;
  objc_copyWeak(&v12, &location);
  id v6 = [v5 preLoadResourcesForPresetResourcesProvider:v4 completionHandler:&v8];

  id v7 = [(AVTAvatarAttributeEditorPreloader *)self cancelationTokens];
  [v7 setObject:v6 forKeyedSubscript:@"categoryPreload"];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__AVTAvatarAttributeEditorPreloader_preloadCategory___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained cancelationTokens];
  id v5 = [v4 objectForKeyedSubscript:@"categoryPreload"];

  if (v5 == v3)
  {
    id v6 = [WeakRetained cancelationTokens];
    [v6 setObject:0 forKeyedSubscript:@"categoryPreload"];
  }
}

- (AVTPresetResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (NSMutableDictionary)cancelationTokens
{
  return self->_cancelationTokens;
}

- (void)setCancelationTokens:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cancelationTokens, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
}

@end