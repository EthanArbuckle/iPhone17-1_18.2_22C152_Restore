@interface DEDImageResourceManager
+ (id)sharedInstance;
- (NSMutableDictionary)imageCache;
- (ResourceLoader)loader;
- (id)cachedImageFromKey:(id)a3;
- (void)asynchronousDataFromURL:(id)a3 key:(id)a4 completionBlock:(id)a5;
- (void)setImageCache:(id)a3;
- (void)setLoader:(id)a3;
@end

@implementation DEDImageResourceManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DEDImageResourceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, block);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __41__DEDImageResourceManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

  v2 = objc_alloc_init(ResourceLoader);
  v3 = *(void **)(sharedInstance__sharedInstance + 8);
  *(void *)(sharedInstance__sharedInstance + 8) = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  *(void *)(sharedInstance__sharedInstance + 16) = v4;
  return MEMORY[0x270F9A758]();
}

- (void)asynchronousDataFromURL:(id)a3 key:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(DEDImageResourceManager *)self loader];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__DEDImageResourceManager_asynchronousDataFromURL_key_completionBlock___block_invoke;
  v14[3] = &unk_26453ADB8;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 asynchronousDataFromURL:v10 completionBlock:v14];
}

void __71__DEDImageResourceManager_asynchronousDataFromURL_key_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"data"];
  id v6 = (id)v3;
  if (*(void *)(a1 + 32)) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    v5 = [*(id *)(a1 + 40) imageCache];
    [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)cachedImageFromKey:(id)a3
{
  id v4 = a3;
  v5 = [(DEDImageResourceManager *)self imageCache];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (ResourceLoader)loader
{
  return (ResourceLoader *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoader:(id)a3
{
}

- (NSMutableDictionary)imageCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_loader, 0);
}

@end