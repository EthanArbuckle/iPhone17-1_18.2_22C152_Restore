@interface MusicMonogramArtworkDataSource
+ (MusicMonogramArtworkDataSource)sharedMonogramArtworkDataSource;
+ (OS_dispatch_queue)loadingQueue;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (CNAvatarImageRenderer)renderer;
- (CNCancelable)cancelableRenderer;
- (MusicMonogramArtworkDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)_monogramImageForToken:(id)a3 fittingSize:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)setCancelableRenderer:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation MusicMonogramArtworkDataSource

- (MusicMonogramArtworkDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicMonogramArtworkDataSource;
  v2 = [(MusicMonogramArtworkDataSource *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

+ (MusicMonogramArtworkDataSource)sharedMonogramArtworkDataSource
{
  if (sharedMonogramArtworkDataSource_sMonogramArtworkDataSourceOnceToken != -1) {
    dispatch_once(&sharedMonogramArtworkDataSource_sMonogramArtworkDataSourceOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource;

  return (MusicMonogramArtworkDataSource *)v2;
}

void __65__MusicMonogramArtworkDataSource_sharedMonogramArtworkDataSource__block_invoke(id a1)
{
  v1 = objc_alloc_init(MusicMonogramArtworkDataSource);
  v2 = (void *)sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource;
  sharedMonogramArtworkDataSource_sSharedMonogramArtworkDataSource = (uint64_t)v1;
}

+ (OS_dispatch_queue)loadingQueue
{
  if (loadingQueue_onceToken != -1) {
    dispatch_once(&loadingQueue_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)loadingQueue_loadingQueue;

  return (OS_dispatch_queue *)v2;
}

void __46__MusicMonogramArtworkDataSource_loadingQueue__block_invoke(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.Music.MusicMonogramArtworkDataSource.loadingQueue", v3);
  v2 = (void *)loadingQueue_loadingQueue;
  loadingQueue_loadingQueue = (uint64_t)v1;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() loadingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  block[3] = &unk_10053EE68;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) token];
  [*(id *)(a1 + 32) fittingSize];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 32) destinationScale];
  double v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v10[3] = &unk_10053EE40;
  id v9 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  double v13 = v4;
  double v14 = v6;
  id v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_monogramImageForToken:fittingSize:scale:completionHandler:", v2, v10, v4, v6, v8);
}

void __88__MusicMonogramArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 visualIdenticalityIdentifier];
  +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v5, v4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  [(CNCancelable *)self->_cancelableRenderer cancel];
  cancelableRenderer = self->_cancelableRenderer;
  self->_cancelableRenderer = 0;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return [a3 token];
}

- (void)_monogramImageForToken:(id)a3 fittingSize:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = (void (**)(id, void *))a6;
  if (width < height) {
    double height = width;
  }
  if (a5 <= 0.0)
  {
    double v13 = +[UIScreen mainScreen];
    [v13 scale];
    a5 = v14;
  }
  v15 = [v11 fullName];
  if (!self->_renderer)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v16 = (void *)getCNAvatarImageRendererClass_softClass;
    uint64_t v41 = getCNAvatarImageRendererClass_softClass;
    if (!getCNAvatarImageRendererClass_softClass)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = __getCNAvatarImageRendererClass_block_invoke;
      v36 = &unk_10053EE90;
      v37 = &v38;
      __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v33);
      v16 = (void *)v39[3];
    }
    v17 = v16;
    _Block_object_dispose(&v38, 8);
    id v18 = [v17 alloc];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v19 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
    uint64_t v41 = getCNAvatarImageRendererSettingsClass_softClass;
    if (!getCNAvatarImageRendererSettingsClass_softClass)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = __getCNAvatarImageRendererSettingsClass_block_invoke;
      v36 = &unk_10053EE90;
      v37 = &v38;
      __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v33);
      v19 = (void *)v39[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v38, 8);
    v21 = [v20 defaultSettings];
    v22 = (CNAvatarImageRenderer *)[v18 initWithSettings:v21];
    renderer = self->_renderer;
    self->_renderer = v22;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v24 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  uint64_t v41 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v36 = &unk_10053EE90;
    v37 = &v38;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v33);
    v24 = (void *)v39[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v38, 8);
  v26 = objc_msgSend(v25, "scopeWithPointSize:scale:rightToLeft:style:", objc_msgSend(v11, "rightToLeft"), 0, height, height, a5);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v27 = (void *)getCNContactClass_softClass;
  uint64_t v41 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = __getCNContactClass_block_invoke;
    v36 = &unk_10053EE90;
    v37 = &v38;
    __getCNContactClass_block_invoke((uint64_t)&v33);
    v27 = (void *)v39[3];
  }
  id v28 = v27;
  _Block_object_dispose(&v38, 8);
  v29 = [v28 contactWithDisplayName:v15 emailOrPhoneNumber:0];
  v30 = self->_renderer;
  v42 = v29;
  v31 = +[NSArray arrayWithObjects:&v42 count:1];
  v32 = [(CNAvatarImageRenderer *)v30 avatarImageForContacts:v31 scope:v26];

  v12[2](v12, v32);
}

- (CNCancelable)cancelableRenderer
{
  return self->_cancelableRenderer;
}

- (void)setCancelableRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_cancelableRenderer, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end