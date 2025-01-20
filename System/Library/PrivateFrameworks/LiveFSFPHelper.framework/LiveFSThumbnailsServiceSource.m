@interface LiveFSThumbnailsServiceSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LiveFSThumbnailsServiceSource)initWithFileProviderExtension:(id)a3;
- (NSString)serviceName;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
- (id)thumbnailCache;
- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3;
- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4;
- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5;
- (void)thumbnailCache;
@end

@implementation LiveFSThumbnailsServiceSource

- (LiveFSThumbnailsServiceSource)initWithFileProviderExtension:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LiveFSThumbnailsServiceSource;
  v5 = [(LiveFSThumbnailsServiceSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->ex, v4);
  }

  return v6;
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F08D88], "anonymousListener", a3);
  [v4 setDelegate:self];
  [v4 resume];
  v5 = [v4 endpoint];

  return v5;
}

- (NSString)serviceName
{
  return (NSString *)@"com.apple.filesystems.LiveItemThumbnails";
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_26E04E480];
  objc_super v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v7 setClasses:v8 forSelector:sel_getThumbnailURLForItem_completion_ argumentIndex:0 ofReply:0];

  v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v7 setClasses:v9 forSelector:sel_storeThumbnailAtURL_forItem_completion_ argumentIndex:1 ofReply:0];

  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (id)thumbnailCache
{
  thumbnailCache = self->thumbnailCache;
  if (!thumbnailCache)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->ex);
    v5 = [WeakRetained URLForItemWithIdentifier:*MEMORY[0x263F053F0]];
    id v6 = [v5 URLByAppendingPathComponent:@".thumbnails"];

    if (([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      v7 = [MEMORY[0x263F08850] defaultManager];
      [v7 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:0];
    }
    id v13 = 0;
    objc_super v8 = (QLExternalThumbnailCache *)[objc_alloc(MEMORY[0x263F160B0]) initWithDirectoryURL:v6 maximumCacheSize:104857600 error:&v13];
    id v9 = v13;
    v10 = self->thumbnailCache;
    self->thumbnailCache = v8;

    if (!self->thumbnailCache)
    {
      v11 = livefs_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[LiveFSThumbnailsServiceSource thumbnailCache]();
      }
    }
    thumbnailCache = self->thumbnailCache;
  }
  return thumbnailCache;
}

- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5
{
  objc_super v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(LiveFSThumbnailsServiceSource *)self thumbnailCache];
  id v13 = 0;
  [v11 storeThumbnailAtURL:v10 forItem:v9 error:&v13];

  id v12 = v13;
  v8[2](v8, v12);
}

- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  objc_super v8 = [(LiveFSThumbnailsServiceSource *)self thumbnailCache];
  id v11 = 0;
  id v9 = [v8 thumbnailURLForItem:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v11 = [(LiveFSThumbnailsServiceSource *)self thumbnailCache];
  v5 = (void *)MEMORY[0x263F054E0];
  id v6 = [v11 inboxDirectoryURL];
  id v7 = [v5 wrapperWithURL:v6 readonly:0 error:0];
  objc_super v8 = (void *)MEMORY[0x263F054E0];
  id v9 = [v11 thumbnailsDirectoryURL];
  id v10 = [v8 wrapperWithURL:v9 readonly:1 error:0];
  v4[2](v4, v7, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->thumbnailCache, 0);
  objc_destroyWeak((id *)&self->ex);
}

- (void)thumbnailCache
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "Can't create external thumbnail cache: %@", v2, v3, v4, v5, v6);
}

@end