@interface MPArtworkCatalog
+ (MPArtworkCatalog)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5;
+ (id)_artworkCacheForIdentifier:(id)a3 requestingContext:(id)a4 representationKind:(int64_t)a5;
+ (id)_artworkLoadQueue;
+ (id)_registeredIdentifiableDataSourceAndTokenClasses;
+ (id)placeholderCatalogWithSymbolName:(id)a3;
+ (id)staticArtworkCatalogWithImage:(id)a3;
+ (id)staticArtworkCatalogWithRepresentationCollection:(id)a3;
+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5;
+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6;
+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5;
+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6;
- (BOOL)allowsVideoConstrainedNetworkAccess;
- (BOOL)hasExportableArtworkProperties;
- (BOOL)hasImageOnDisk;
- (BOOL)isArtworkVisuallyIdenticalToCatalog:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoadingRepresentation;
- (BOOL)isMainThreadBound;
- (CGSize)fittingSize;
- (CGSize)scaledFittingSize;
- (MPArtworkCatalog)initWithToken:(id)a3 dataSource:(id)a4;
- (MPArtworkDataSource)dataSource;
- (MPArtworkDataSourceVisualIdenticality)visualIdenticalityIdentifier;
- (MPArtworkImageAttachments)imageAttachments;
- (MPArtworkRepresentationCollection)bestAvailableRepresentationCollection;
- (NSCache)cache;
- (NSCache)videoCache;
- (NSCopying)loadingKey;
- (NSString)cacheIdentifier;
- (NSUUID)UUID;
- (_MPArtworkCatalogOverlayDelegate)overlayDelegate;
- (double)destinationScale;
- (id)_existingRepresentationOfKind:(int64_t)a3;
- (id)bestImageFromDisk;
- (id)configurationBlock;
- (id)description;
- (id)destination;
- (id)existingColorAnalysisWithAlgorithm:(int64_t)a3;
- (id)overlayStorage;
- (id)overlayToken;
- (id)requestingContext;
- (id)token;
- (int64_t)MP_artworkType;
- (int64_t)preferredVideoFormat;
- (unint64_t)hash;
- (unint64_t)renderHint;
- (unint64_t)representationKinds;
- (unint64_t)videoCacheStoragePolicy;
- (void)_callConfigurationWithRevisionID:(int64_t)a3;
- (void)_clearDestination;
- (void)_loadBestRepresentationIfNeededOfKind:(int64_t)a3;
- (void)_loadRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4;
- (void)_requestBestRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4;
- (void)_setCacheIdentifier:(id)a3 forRequestingContext:(id)a4;
- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4;
- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4 forRepresentationKinds:(unint64_t)a5 configurationBlock:(id)a6;
- (void)_updateRepresentationOfKind:(int64_t)a3;
- (void)_updateRepresentations;
- (void)_updateWithRepresentation:(id)a3 isBestRepresentation:(BOOL)a4 modelRevisionID:(int64_t)a5;
- (void)dealloc;
- (void)requestColorAnalysisWithAlgorithm:(int64_t)a3 completion:(id)a4;
- (void)requestExportableArtworkPropertiesWithCompletion:(id)a3;
- (void)requestImageWithCompletion:(id)a3;
- (void)requestImageWithCompletionHandler:(id)a3;
- (void)requestRadiosityImageWithCompletionHandler:(id)a3;
- (void)requestVideoWithCompletionHandler:(id)a3;
- (void)setAllowsVideoConstrainedNetworkAccess:(BOOL)a3;
- (void)setBestAvailableRepresentationCollection:(id)a3;
- (void)setCacheIdentifier:(id)a3;
- (void)setConfigurationBlock:(id)a3;
- (void)setDestination:(id)a3 configurationBlock:(id)a4;
- (void)setDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5;
- (void)setDestination:(id)a3 progressiveConfigurationBlock:(id)a4;
- (void)setDestinationScale:(double)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)setLoadingKey:(id)a3;
- (void)setLoadingRepresentation:(BOOL)a3;
- (void)setMainThreadBoundDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5;
- (void)setOverlayDelegate:(id)a3;
- (void)setOverlayStorage:(id)a3;
- (void)setOverlayToken:(id)a3;
- (void)setPreferredVideoFormat:(int64_t)a3;
- (void)setPreferredVideoKind:(int64_t)a3;
- (void)setRenderHint:(unint64_t)a3;
- (void)setRepresentationKinds:(unint64_t)a3;
- (void)setRequestingContext:(id)a3;
- (void)setVideoCacheStoragePolicy:(unint64_t)a3;
@end

@implementation MPArtworkCatalog

+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5
{
}

- (void)setDestinationScale:(double)a3
{
  double v3 = a3;
  if (a3 == 0.0)
  {
    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    double v3 = v6;
  }
  if (self->_destinationScale != v3)
  {
    id v10 = [(MPArtworkCatalog *)self token];
    if (objc_opt_respondsToSelector()) {
      [v10 setDestinationScale:v3];
    }
    if ([(MPArtworkCatalog *)self isLoadingRepresentation])
    {
      v7 = [(MPArtworkCatalog *)self dataSource];
      [v7 cancelLoadingRepresentationForArtworkCatalog:self];

      [(MPArtworkCatalog *)self setLoadingRepresentation:0];
    }
    self->_destinationScale = v3;
    ++self->_modelRevisionID;
    v8 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
    [v8 resetForRepresentationKinds:3];

    os_unfair_lock_lock(&self->_lock);
    id configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock) {
      [(MPArtworkCatalog *)self _updateRepresentations];
    }
  }
}

- (MPArtworkCatalog)initWithToken:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPArtworkCatalog;
  v9 = [(MPArtworkCatalog *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_token, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    v10->_destinationScale = 1.0;
    v10->_fittingSize = (CGSize)MPArtworkCatalogOriginalSize;
    v10->_representationKinds = 1;
    uint64_t v11 = +[MPArtworkRepresentationCollection collectionWithImageRepresentation:0 videoRepresentation:0 bestRepresentationKinds:2];
    bestAvailableRepresentationCollection = v10->_bestAvailableRepresentationCollection;
    v10->_bestAvailableRepresentationCollection = (MPArtworkRepresentationCollection *)v11;
  }
  return v10;
}

- (MPArtworkDataSourceVisualIdenticality)visualIdenticalityIdentifier
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(MPArtworkCatalog *)self dataSource];
  v4 = [v3 visualIdenticalityIdentifierForCatalog:self];

  v5 = [(MPArtworkCatalog *)self overlayDelegate];
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 overlayVisualIdenticalityForCatalog:self];
    id v8 = [v4 stringRepresentation];
    v13[0] = v8;
    v9 = [v7 stringRepresentation];
    v13[1] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v11 = [v10 componentsJoinedByString:@"/"];
  }
  else
  {
    id v11 = v4;
  }

  return (MPArtworkDataSourceVisualIdenticality *)v11;
}

- (id)token
{
  return self->_token;
}

- (MPArtworkDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MPArtworkDataSource *)WeakRetained;
}

- (_MPArtworkCatalogOverlayDelegate)overlayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);

  return (_MPArtworkCatalogOverlayDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overlayStorage, 0);
  objc_storeStrong(&self->_overlayToken, 0);
  objc_destroyWeak((id *)&self->_overlayDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_loadingKey, 0);
  objc_destroyWeak(&self->_requestingContext);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_bestAvailableRepresentationCollection, 0);
  objc_storeStrong(&self->_configurationBlock, 0);
  objc_destroyWeak(&self->_destination);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  [(MPArtworkCatalog *)self _setDestination:v9 isMainThreadBound:objc_opt_isKindOfClass() & 1 forRepresentationKinds:a4 configurationBlock:v8];
}

void __53__MPArtworkCatalog__callConfigurationWithRevisionID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artworkCatalog];
  if (v2 == *(void **)(a1 + 40))
  {
    uint64_t v3 = v2[3];
    uint64_t v4 = *(void *)(a1 + 56);

    if (v3 == v4) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 152));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained artworkCatalog:*(void *)(a1 + 40) didConfigureView:*(void *)(a1 + 32) withRepresentation:*(void *)(*(void *)(a1 + 40) + 88)];
  }
}

void __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke_2;
  v4[3] = &unk_1E57F00B8;
  objc_copyWeak(&v5, &location);
  long long v6 = *(_OWORD *)(a1 + 40);
  [v2 _loadRepresentationOfKind:v3 completionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_loadRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v6 = (void (**)(id, void, void *))a4;
  id v7 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    [v7 loadRepresentationOfKind:a3 forArtworkCatalog:self completionHandler:v6];
  }
  else if (a3)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPArtworkCatalogErrorDomain" code:0 userInfo:0];
    id v9 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543874;
      id v11 = self;
      __int16 v12 = 2048;
      int64_t v13 = a3;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "[MPArtwork] Loaded nil representation -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v10, 0x20u);
    }

    v6[2](v6, 0, v8);
  }
  else
  {
    [v7 loadRepresentationForArtworkCatalog:self completionHandler:v6];
  }
}

- (BOOL)isArtworkVisuallyIdenticalToCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(MPArtworkCatalog *)self dataSource];
  long long v6 = [v4 dataSource];

  if (v5 == v6)
  {
    id v8 = [(MPArtworkCatalog *)self visualIdenticalityIdentifier];
    id v9 = [v4 visualIdenticalityIdentifier];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      int v10 = [v8 stringRepresentation];
      id v11 = [v9 stringRepresentation];
      char v7 = [v10 isEqual:v11];
    }
    else
    {
      char v7 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6
{
  id v7 = [a1 _artworkCacheForIdentifier:a4 requestingContext:a5 representationKind:a6];
  [v7 setCountLimit:a3];
}

- (NSCache)cache
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MPArtworkCatalog *)self cacheIdentifier];
  id v5 = [(MPArtworkCatalog *)self requestingContext];
  long long v6 = [v3 _artworkCacheForIdentifier:v4 requestingContext:v5 representationKind:0];

  return (NSCache *)v6;
}

+ (id)_artworkCacheForIdentifier:(id)a3 requestingContext:(id)a4 representationKind:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v8)
  {
    id v12 = 0;
    goto LABEL_15;
  }
  id v10 = v8;
  objc_sync_enter(v10);
  if (a5 == 1)
  {
    id v11 = objc_getAssociatedObject(v10, (const void *)MPArtworkVideoCachesAssociatedObjectKey);
    if (v11) {
      goto LABEL_10;
    }
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setAssociatedObject(v10, (const void *)MPArtworkVideoCachesAssociatedObjectKey, v11, (void *)1);
  }
  else
  {
    if (a5)
    {
      id v11 = 0;
      goto LABEL_13;
    }
    id v11 = objc_getAssociatedObject(v10, (const void *)MPArtworkImageCachesAssociatedObjectKey);
    if (v11) {
      goto LABEL_10;
    }
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setAssociatedObject(v10, (const void *)MPArtworkImageCachesAssociatedObjectKey, v11, (void *)1);
  }
  if (v11)
  {
LABEL_10:
    id v12 = [v11 objectForKeyedSubscript:v7];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      [v11 setObject:v12 forKeyedSubscript:v7];
    }
    goto LABEL_14;
  }
LABEL_13:
  id v12 = 0;
LABEL_14:

  objc_sync_exit(v10);
LABEL_15:

  return v12;
}

- (id)requestingContext
{
  id WeakRetained = objc_loadWeakRetained(&self->_requestingContext);

  return WeakRetained;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (CGSize)scaledFittingSize
{
  double width = self->_fittingSize.width;
  double height = self->_fittingSize.height;
  double destinationScale = self->_destinationScale;
  if (destinationScale > 0.00000011920929
    && (width != *(double *)&MPArtworkCatalogOriginalSize || height != *((double *)&MPArtworkCatalogOriginalSize + 1)))
  {
    CGAffineTransformMakeScale(&v13, destinationScale, self->_destinationScale);
    double v7 = height * v13.c;
    double height = height * v13.d + v13.b * width;
    double width = v7 + v13.a * width;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "overlayScaledFittingSizeForCatalog:scaledFittingSize:", self, width, height);
    double width = v9;
    double height = v10;
  }

  double v11 = width;
  double v12 = height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_loadBestRepresentationIfNeededOfKind:(int64_t)a3
{
  if (![(MPArtworkCatalog *)self isLoadingRepresentation])
  {
    [(MPArtworkCatalog *)self setLoadingRepresentation:1];
    int64_t modelRevisionID = self->_modelRevisionID;
    long long v6 = [(id)objc_opt_class() _artworkLoadQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke;
    v7[3] = &unk_1E57F00E0;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = modelRevisionID;
    [v6 addOperationWithBlock:v7];
  }
}

void __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (v6)
  {
    id v9 = [WeakRetained _existingRepresentationOfKind:*(void *)(a1 + 40)];
    double v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543874;
      CGAffineTransform v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "[MPArtwork] HALTING -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    id v9 = v5;
  }
  [v8 _updateWithRepresentation:v9 isBestRepresentation:1 modelRevisionID:*(void *)(a1 + 48)];
  [v8 setLoadingRepresentation:0];
}

- (void)setLoadingRepresentation:(BOOL)a3
{
  self->_loadingRepresentation = a3;
}

- (void)setFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_fittingSize.width != a3.width || self->_fittingSize.height != a3.height)
  {
    id v10 = [(MPArtworkCatalog *)self token];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v10, "setFittingSize:", width, height);
    }
    if ([(MPArtworkCatalog *)self isLoadingRepresentation])
    {
      double v7 = [(MPArtworkCatalog *)self dataSource];
      [v7 cancelLoadingRepresentationForArtworkCatalog:self];

      [(MPArtworkCatalog *)self setLoadingRepresentation:0];
    }
    self->_fittingSize.double width = width;
    self->_fittingSize.double height = height;
    ++self->_modelRevisionID;
    id v8 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
    [v8 resetForRepresentationKinds:3];

    os_unfair_lock_lock(&self->_lock);
    id configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock) {
      [(MPArtworkCatalog *)self _updateRepresentations];
    }
  }
}

- (void)dealloc
{
  if ([(MPArtworkCatalog *)self isLoadingRepresentation])
  {
    uint64_t v3 = [(MPArtworkCatalog *)self dataSource];
    [v3 cancelLoadingRepresentationForArtworkCatalog:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPArtworkCatalog;
  [(MPArtworkCatalog *)&v4 dealloc];
}

- (BOOL)isLoadingRepresentation
{
  return self->_loadingRepresentation;
}

- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4 forRepresentationKinds:(unint64_t)a5 configurationBlock:(id)a6
{
  BOOL v7 = a4;
  id v17 = a6;
  [(MPArtworkCatalog *)self _setDestination:a3 isMainThreadBound:v7];
  [(MPArtworkCatalog *)self setRepresentationKinds:a5];
  id v10 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
  uint64_t v11 = v10;
  if (a5) {
    objc_msgSend(v10, "setBestRepresentationKinds:", objc_msgSend(v10, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFELL);
  }
  else {
    [v10 setImageRepresentation:0];
  }

  int v12 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
  CGAffineTransform v13 = v12;
  if ((a5 & 2) != 0) {
    objc_msgSend(v12, "setBestRepresentationKinds:", objc_msgSend(v12, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFDLL);
  }
  else {
    [v12 setVideoRepresentation:0];
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_configurationBlock == v17)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    __int16 v14 = (void *)[v17 copy];
    id configurationBlock = self->_configurationBlock;
    self->_id configurationBlock = v14;

    os_unfair_lock_unlock(&self->_lock);
    double v16 = *MEMORY[0x1E4F1DB30];
    if (*MEMORY[0x1E4F1DB30] == self->_fittingSize.width
      && (double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v16 == self->_fittingSize.height))
    {
      [(MPArtworkCatalog *)self _callConfigurationWithRevisionID:self->_modelRevisionID];
    }
    else
    {
      [(MPArtworkCatalog *)self _updateRepresentations];
    }
  }
}

- (void)_updateWithRepresentation:(id)a3 isBestRepresentation:(BOOL)a4 modelRevisionID:(int64_t)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  uint64_t v8 = [v13 kind];
  if (v8 == 1)
  {
    id v9 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
    [v9 setVideoRepresentation:v13];
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    id v9 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
    [v9 setImageRepresentation:v13];
  }

LABEL_6:
  id v10 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
  int v11 = 1 << [v13 kind];
  if (v6) {
    uint64_t v12 = [v10 bestRepresentationKinds] | v11;
  }
  else {
    uint64_t v12 = [v10 bestRepresentationKinds] & ~v11;
  }
  [v10 setBestRepresentationKinds:v12];

  [(MPArtworkCatalog *)self _callConfigurationWithRevisionID:a5];
}

- (MPArtworkRepresentationCollection)bestAvailableRepresentationCollection
{
  return self->_bestAvailableRepresentationCollection;
}

- (void)_callConfigurationWithRevisionID:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void (**)(void, void, void))MEMORY[0x19971E0F0](self->_configurationBlock);
  id WeakRetained = objc_loadWeakRetained(&self->_destination);
  BOOL mainThreadBound = self->_mainThreadBound;
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    BOOL v8 = WeakRetained == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = WeakRetained;
      id v13 = v5;
      msv_dispatch_on_main_queue();

      id v9 = v12;
    }
    else
    {
      if (!mainThreadBound)
      {
        ((void (**)(void, id, MPArtworkRepresentationCollection *))v5)[2](v5, WeakRetained, self->_bestAvailableRepresentationCollection);
        goto LABEL_11;
      }
      int v11 = v5;
      id v10 = WeakRetained;
      msv_dispatch_on_main_queue();

      id v9 = v11;
    }
  }
LABEL_11:
}

- (void)setRepresentationKinds:(unint64_t)a3
{
  self->_representationKinds = a3;
}

- (void)_updateRepresentations
{
  unint64_t representationKinds = self->_representationKinds;
  if (representationKinds)
  {
    [(MPArtworkCatalog *)self _updateRepresentationOfKind:0];
    unint64_t representationKinds = self->_representationKinds;
  }
  if ((representationKinds & 2) != 0)
  {
    [(MPArtworkCatalog *)self _updateRepresentationOfKind:1];
  }
}

- (void)_updateRepresentationOfKind:(int64_t)a3
{
  -[MPArtworkCatalog _existingRepresentationOfKind:](self, "_existingRepresentationOfKind:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7
    || ([(MPArtworkCatalog *)self dataSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 isRepresentation:v7 bestRepresentationForArtworkCatalog:self],
        v5,
        [(MPArtworkCatalog *)self _updateWithRepresentation:v7 isBestRepresentation:v6 modelRevisionID:self->_modelRevisionID], (v6 & 1) == 0))
  {
    [(MPArtworkCatalog *)self _loadBestRepresentationIfNeededOfKind:a3];
  }
}

- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_destination);

  if (WeakRetained != v6)
  {
    id v8 = objc_loadWeakRetained(&self->_destination);
    objc_storeWeak(&self->_destination, v6);
    self->_BOOL mainThreadBound = a4;
    id v9 = objc_loadWeakRetained((id *)&self->_overlayDelegate);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_respondsToSelector()) {
        [v9 artworkCatalog:self willConfigureView:v6];
      }
      id v10 = [v6 artworkCatalog];
      objc_setAssociatedObject(v6, (const void *)MPArtworkCatalogAssociatedObjectKey, self, (void *)1);
      if (v10 && v10 != self)
      {
        [(MPArtworkCatalog *)v10 _clearDestination];
        id v11 = objc_loadWeakRetained((id *)&v10->_overlayDelegate);
        if (objc_opt_respondsToSelector()) {
          [v11 artworkCatalog:v10 didClearFromView:v6];
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MPArtworkCatalog__setDestination_isMainThreadBound___block_invoke;
      block[3] = &unk_1E57FA038;
      id v13 = v8;
      __int16 v14 = self;
      id v15 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      objc_setAssociatedObject(v8, (const void *)MPArtworkCatalogAssociatedObjectKey, 0, 0);
    }
  }
}

- (id)_existingRepresentationOfKind:(int64_t)a3
{
  id v5 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 existingRepresentationOfKind:a3 forArtworkCatalog:self];
  }
  else
  {
    if (a3)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = [v5 existingRepresentationForArtworkCatalog:self];
  }
  id v7 = (void *)v6;
LABEL_7:

  return v7;
}

+ (id)_artworkLoadQueue
{
  if (_artworkLoadQueue_onceToken != -1) {
    dispatch_once(&_artworkLoadQueue_onceToken, &__block_literal_global_82);
  }
  v2 = (void *)_artworkLoadQueue___artworkLoadQueue;

  return v2;
}

- (unint64_t)renderHint
{
  return self->_renderHint;
}

- (void)setMainThreadBoundDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5
{
}

- (void)_setCacheIdentifier:(id)a3 forRequestingContext:(id)a4
{
  id v6 = a4;
  [(MPArtworkCatalog *)self setCacheIdentifier:a3];
  [(MPArtworkCatalog *)self setRequestingContext:v6];
}

- (void)setRequestingContext:(id)a3
{
}

- (void)setCacheIdentifier:(id)a3
{
}

- (void)setRenderHint:(unint64_t)a3
{
  self->_renderHint = a3;
}

- (id)description
{
  uint64_t v3 = [(MPArtworkCatalog *)self destination];
  if ([(MPArtworkCatalog *)self isMainThreadBound]
    && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"<%@: %p [redacted description due to non-main thread]>", objc_opt_class(), v3];
  }
  else
  {
    uint64_t v4 = [v3 description];
  }
  id v5 = (void *)v4;
  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  id v8 = [(MPArtworkCatalog *)self token];
  [(MPArtworkCatalog *)self fittingSize];
  id v9 = NSStringFromCGSize(v14);
  [(MPArtworkCatalog *)self destinationScale];
  id v11 = [v6 stringWithFormat:@"<%@: %p token=%@ fittingSize=%@ destinationScale=%lf destination=%@>", v7, self, v8, v9, v10, v5];

  return v11;
}

- (double)destinationScale
{
  return self->_destinationScale;
}

- (CGSize)fittingSize
{
  double width = self->_fittingSize.width;
  double height = self->_fittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isMainThreadBound
{
  return self->_mainThreadBound;
}

- (id)destination
{
  id WeakRetained = objc_loadWeakRetained(&self->_destination);

  return WeakRetained;
}

- (BOOL)hasExportableArtworkProperties
{
  uint64_t v3 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 hasExportableArtworkPropertiesForCatalog:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

void *__53__MPArtworkCatalog__callConfigurationWithRevisionID___block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 24) == result[7]) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[6] + 16))(result[6], result[5], *(void *)(v1 + 88));
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (MPArtworkCatalog *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(MPArtworkCatalog *)self isArtworkVisuallyIdenticalToCatalog:v4];
  }

  return v5;
}

uint64_t __37__MPArtworkCatalog__artworkLoadQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)_artworkLoadQueue___artworkLoadQueue;
  _artworkLoadQueue___artworkLoadQueue = (uint64_t)v0;

  v2 = (void *)_artworkLoadQueue___artworkLoadQueue;

  return [v2 setMaxConcurrentOperationCount:20];
}

- (void)setOverlayStorage:(id)a3
{
}

- (id)overlayStorage
{
  return self->_overlayStorage;
}

- (void)setOverlayToken:(id)a3
{
}

- (id)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayDelegate:(id)a3
{
}

- (void)setVideoCacheStoragePolicy:(unint64_t)a3
{
  self->_videoCacheStoragePolicy = a3;
}

- (unint64_t)videoCacheStoragePolicy
{
  return self->_videoCacheStoragePolicy;
}

- (void)setLoadingKey:(id)a3
{
}

- (NSCopying)loadingKey
{
  return self->_loadingKey;
}

- (void)setBestAvailableRepresentationCollection:(id)a3
{
}

- (unint64_t)representationKinds
{
  return self->_representationKinds;
}

- (void)setConfigurationBlock:(id)a3
{
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void)setPreferredVideoFormat:(int64_t)a3
{
  self->_preferredVideoFormat = a3;
}

- (int64_t)preferredVideoFormat
{
  return self->_preferredVideoFormat;
}

- (BOOL)allowsVideoConstrainedNetworkAccess
{
  return self->_allowsVideoConstrainedNetworkAccess;
}

- (void)setDestination:(id)a3 progressiveConfigurationBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__MPArtworkCatalog_setDestination_progressiveConfigurationBlock___block_invoke;
  v8[3] = &unk_1E57EFFC8;
  id v9 = v6;
  id v7 = v6;
  [(MPArtworkCatalog *)self setDestination:a3 forRepresentationKinds:1 configurationBlock:v8];
}

void __65__MPArtworkCatalog_setDestination_progressiveConfigurationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 imageRepresentation];

  if (v6)
  {
    id v7 = [v5 imageRepresentation];
    id v8 = [v7 image];

    [v5 isBestRepresentationForKind:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_requestBestRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(MPArtworkCatalog *)self _existingRepresentationOfKind:a3];
  if (v7
    && ([(MPArtworkCatalog *)self dataSource],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isRepresentation:v7 bestRepresentationForArtworkCatalog:self],
        v8,
        (v9 & 1) != 0))
  {
    if (v6) {
      v6[2](v6, v7, 0);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__MPArtworkCatalog__requestBestRepresentationOfKind_completionHandler___block_invoke;
    v10[3] = &unk_1E57F0108;
    v10[4] = self;
    int64_t v12 = a3;
    id v11 = v6;
    [(MPArtworkCatalog *)self _loadRepresentationOfKind:a3 completionHandler:v10];
  }
}

void __71__MPArtworkCatalog__requestBestRepresentationOfKind_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[6];
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "[MPArtwork] HALTING -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v10 = a1[5];
  if (v10 && a1[4]) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (NSUUID)UUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_UUID)
  {
    char v4 = [MEMORY[0x1E4F29128] UUID];
    UUID = self->_UUID;
    self->_UUID = v4;
  }
  os_unfair_lock_unlock(p_lock);
  id v6 = self->_UUID;

  return v6;
}

- (NSCache)videoCache
{
  uint64_t v3 = objc_opt_class();
  char v4 = [(MPArtworkCatalog *)self cacheIdentifier];
  id v5 = [(MPArtworkCatalog *)self requestingContext];
  id v6 = [v3 _artworkCacheForIdentifier:v4 requestingContext:v5 representationKind:1];

  return (NSCache *)v6;
}

- (void)requestExportableArtworkPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__MPArtworkCatalog_requestExportableArtworkPropertiesWithCompletion___block_invoke;
    v7[3] = &unk_1E57F5180;
    id v8 = v4;
    [v5 getExportableArtworkPropertiesForCatalog:self completionHandler:v7];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPArtworkCatalogErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

uint64_t __69__MPArtworkCatalog_requestExportableArtworkPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MPArtworkImageAttachments)imageAttachments
{
  uint64_t v3 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 existingArtworkEffectResultForEffectType:4 catalog:self options:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    id v4 = 0;
  }

  return (MPArtworkImageAttachments *)v4;
}

- (void)requestRadiosityImageWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(MPArtworkCatalog *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v5 existingArtworkEffectResultForEffectType:3 catalog:self options:MEMORY[0x1E4F1CC08]],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    if (v4) {
      v4[2](v4, v6);
    }
  }
  else
  {
    id v8 = [(MPArtworkCatalog *)self token];
    uint64_t v9 = [(id)objc_opt_class() _artworkLoadQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E57F4E70;
    id v12 = v8;
    id v13 = v5;
    uint64_t v14 = self;
    __int16 v15 = v4;
    id v10 = v8;
    [v9 addOperationWithBlock:v11];

    id v7 = 0;
  }
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E57F0090;
  id v13 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v14 = v2;
  uint64_t v15 = v3;
  id v4 = (void (**)(void, void))MEMORY[0x19971E0F0](v12);
  if (objc_opt_respondsToSelector())
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_7;
    v10[3] = &unk_1E57F0040;
    id v7 = &v11;
    id v11 = *(id *)(a1 + 56);
    [v5 loadArtworkEffectResultForEffectType:3 catalog:v6 options:MEMORY[0x1E4F1CC08] systemEffectHandler:v4 completionHandler:v10];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E57F0040;
    id v7 = &v9;
    id v9 = *(id *)(a1 + 56);
    ((void (**)(void, void *))v4)[2](v4, v8);
  }
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MPArtworkCatalog alloc] initWithToken:a1[4] dataSource:a1[5]];
  -[MPArtworkCatalog setFittingSize:](v4, "setFittingSize:", 300.0, 300.0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E57F4858;
  uint64_t v5 = a1[6];
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = v4;
  [(MPArtworkCatalog *)v7 requestImageWithCompletion:v8];
}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MPArtworkResizeUtility);
    [*(id *)(a1 + 32) fittingSize];
    double v6 = v5;
    double v8 = v7;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_4;
    v12[3] = &unk_1E57F4858;
    id v9 = *(id *)(a1 + 48);
    id v13 = v4;
    id v14 = v9;
    void v12[4] = *(void *)(a1 + 40);
    uint64_t v10 = v4;
    id v11 = -[MPArtworkResizeUtility resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:](v10, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v3, 1, 0, v12, v6, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_4(id *a1, id a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
  else
  {
    uint64_t v5 = [a2 CGImage];
    double v6 = (void *)MEMORY[0x1E4F5E068];
    [a1[4] destinationScale];
    uint64_t v8 = (uint64_t)v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_5;
    v9[3] = &unk_1E57F0068;
    id v11 = a1[6];
    id v10 = a1[5];
    [v6 radiosityImageWithImage:v5 displayScale:v8 completionHandler:v9];
  }
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a2];
  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_6;
  block[3] = &unk_1E57F8408;
  id v9 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), 0);
}

- (void)requestColorAnalysisWithAlgorithm:(int64_t)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, uint64_t))a4;
  v21 = @"MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm";
  id v7 = [NSNumber numberWithInteger:a3];
  v22[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  id v9 = [(MPArtworkCatalog *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v9 existingArtworkEffectResultForEffectType:1 catalog:self options:v8],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    if (v6) {
      v6[2](v6, v10);
    }
  }
  else
  {
    id v12 = [(MPArtworkCatalog *)self token];
    id v13 = [(id)objc_opt_class() _artworkLoadQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke;
    v15[3] = &unk_1E57F8550;
    id v16 = v12;
    id v17 = v9;
    uint64_t v18 = self;
    id v19 = v8;
    v20 = v6;
    id v14 = v12;
    [v13 addOperationWithBlock:v15];

    id v11 = 0;
  }
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_2;
  v11[3] = &unk_1E57F0018;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v2 = (void (**)(void, void))MEMORY[0x19971E0F0](v11);
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_5;
    v9[3] = &unk_1E57F0040;
    id v5 = &v10;
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v3 loadArtworkEffectResultForEffectType:1 catalog:v4 options:v6 systemEffectHandler:v2 completionHandler:v9];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_6;
    v7[3] = &unk_1E57F0040;
    id v5 = &v8;
    id v8 = *(id *)(a1 + 64);
    ((void (**)(void, void *))v2)[2](v2, v7);
  }
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[MPArtworkCatalog alloc] initWithToken:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_3;
  v6[3] = &unk_1E57EFF78;
  id v7 = v3;
  id v5 = v3;
  [(MPArtworkCatalog *)v4 requestImageWithCompletion:v6];
}

uint64_t __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F77920]), "initWithSourceImage:", objc_msgSend(v5, "CGImage"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_4;
    v9[3] = &unk_1E57EFFF0;
    id v10 = *(id *)(a1 + 32);
    [v7 analyzeWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[MPArtworkColorAnalysis translateFromMSVColorAnalysis:](MPArtworkColorAnalysis, "translateFromMSVColorAnalysis:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)existingColorAnalysisWithAlgorithm:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = @"MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm";
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v6 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 existingArtworkEffectResultForEffectType:1 catalog:self options:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setPreferredVideoKind:(int64_t)a3
{
  if (self->_preferredVideoFormat != a3)
  {
    if ([(MPArtworkCatalog *)self isLoadingRepresentation])
    {
      id v5 = [(MPArtworkCatalog *)self dataSource];
      [v5 cancelLoadingRepresentationForArtworkCatalog:self];

      [(MPArtworkCatalog *)self setLoadingRepresentation:0];
    }
    self->_preferredVideoFormat = a3;
    ++self->_modelRevisionID;
    os_unfair_lock_lock(&self->_lock);
    id configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
    {
      [(MPArtworkCatalog *)self _updateRepresentations];
    }
  }
}

- (void)setAllowsVideoConstrainedNetworkAccess:(BOOL)a3
{
  if (self->_allowsVideoConstrainedNetworkAccess != a3)
  {
    if ([(MPArtworkCatalog *)self isLoadingRepresentation])
    {
      id v5 = [(MPArtworkCatalog *)self dataSource];
      [v5 cancelLoadingRepresentationForArtworkCatalog:self];

      [(MPArtworkCatalog *)self setLoadingRepresentation:0];
    }
    self->_allowsVideoConstrainedNetworkAccess = a3;
    ++self->_modelRevisionID;
    id v6 = [(MPArtworkCatalog *)self bestAvailableRepresentationCollection];
    [v6 resetForRepresentationKinds:2];

    os_unfair_lock_lock(&self->_lock);
    id configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
    {
      [(MPArtworkCatalog *)self _updateRepresentations];
    }
  }
}

- (void)requestVideoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MPArtworkCatalog_requestVideoWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E57EFFA0;
  id v7 = v4;
  id v5 = v4;
  [(MPArtworkCatalog *)self _requestBestRepresentationOfKind:1 completionHandler:v6];
}

void __54__MPArtworkCatalog_requestVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 video];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)setDestination:(id)a3 configurationBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MPArtworkCatalog_setDestination_configurationBlock___block_invoke;
  v8[3] = &unk_1E57EFFC8;
  id v9 = v6;
  id v7 = v6;
  [(MPArtworkCatalog *)self setDestination:a3 forRepresentationKinds:1 configurationBlock:v8];
}

void __54__MPArtworkCatalog_setDestination_configurationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a2;
    id v6 = [a3 imageRepresentation];
    id v7 = [v6 image];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __54__MPArtworkCatalog__setDestination_isMainThreadBound___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));

  if (v2 != WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 48) artworkCatalog:*(void *)(a1 + 40) didClearFromView:*(void *)(a1 + 32)];
    }
    id v4 = [*(id *)(a1 + 32) artworkCatalog];
    id v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = (const void *)MPArtworkCatalogAssociatedObjectKey;
      objc_setAssociatedObject(v6, v7, 0, 0);
    }
  }
}

- (void)_clearDestination
{
}

- (BOOL)hasImageOnDisk
{
  id v3 = [(MPArtworkCatalog *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 hasExistingRepresentationOnDiskForArtworkCatalog:self];
  }
  else
  {
    id v5 = [(MPArtworkCatalog *)self bestImageFromDisk];
    char v4 = v5 != 0;
  }
  return v4;
}

- (id)bestImageFromDisk
{
  id v3 = [(MPArtworkCatalog *)self dataSource];
  char v4 = [v3 existingRepresentationForArtworkCatalog:self];

  id v5 = [v4 image];

  return v5;
}

- (void)requestImageWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MPArtworkCatalog_requestImageWithCompletion___block_invoke;
  v6[3] = &unk_1E57EFFA0;
  id v7 = v4;
  id v5 = v4;
  [(MPArtworkCatalog *)self _requestBestRepresentationOfKind:0 completionHandler:v6];
}

void __47__MPArtworkCatalog_requestImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 image];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)requestImageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MPArtworkCatalog_requestImageWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E57EFF78;
  id v7 = v4;
  id v5 = v4;
  [(MPArtworkCatalog *)self requestImageWithCompletion:v6];
}

uint64_t __54__MPArtworkCatalog_requestImageWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_token hash];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v5 = [WeakRetained hash] ^ v3;

  return v5;
}

+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6
{
  BOOL v6 = a3;
  id v7 = [a1 _artworkCacheForIdentifier:a4 requestingContext:a5 representationKind:a6];
  [v7 setEvictsObjectsWhenApplicationEntersBackground:v6];
}

+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5
{
}

+ (MPArtworkCatalog)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 _registeredIdentifiableDataSourceAndTokenClasses];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v12)
  {
    uint64_t v15 = 0;
    id v14 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  id v27 = a1;
  id v28 = v10;
  id v29 = v9;
  id v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(v11);
      }
      uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      id v19 = [v18 artworkDataSourceShortDescription];
      if (v19 == v8)
      {

LABEL_10:
        id v14 = (void *)[v11 objectForKey:v18];
        uint64_t v15 = v18;
        continue;
      }
      v20 = v19;
      int v21 = [v19 isEqual:v8];

      if (v21) {
        goto LABEL_10;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v13);
  if (!v15)
  {
    id v10 = v28;
    id v9 = v29;
    a1 = v27;
    goto LABEL_18;
  }
  id v10 = v28;
  id v9 = v29;
  a1 = v27;
  if (!v14) {
LABEL_18:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Identifiable data source with short description \"%@\" is not properly registered.", v8 format];
  v22 = [v15 artworkDataSourceWithIdentifier:v9];
  uint64_t v23 = [v14 artworkTokenWithParameters:v10];
  v24 = (void *)v23;
  v25 = 0;
  if (v22 && v23) {
    v25 = (void *)[objc_alloc((Class)a1) initWithToken:v23 dataSource:v22];
  }

  return (MPArtworkCatalog *)v25;
}

+ (id)_registeredIdentifiableDataSourceAndTokenClasses
{
  if (_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClassesOnceToken != -1) {
    dispatch_once(&_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClassesOnceToken, &__block_literal_global_13759);
  }
  id v2 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;

  return v2;
}

uint64_t __68__MPArtworkCatalog__registeredIdentifiableDataSourceAndTokenClasses__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v1 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  _registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses = v0;

  id v2 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  uint64_t v3 = objc_opt_class();
  [v2 setObject:v3 forKey:objc_opt_class()];
  id v4 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();

  return [v4 setObject:v5 forKey:v6];
}

+ (id)placeholderCatalogWithSymbolName:(id)a3
{
  id v3 = a3;
  id v4 = [MPArtworkCatalog alloc];
  uint64_t v5 = +[_MPArtworkCatalogPlaceholderDataSource sharedDataSource];
  uint64_t v6 = [(MPArtworkCatalog *)v4 initWithToken:v3 dataSource:v5];

  return v6;
}

+ (id)staticArtworkCatalogWithRepresentationCollection:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [MPArtworkCatalog alloc];
    uint64_t v5 = +[_MPArtworkCatalogStaticDataSource sharedDataSource];
    uint64_t v6 = [(MPArtworkCatalog *)v4 initWithToken:v3 dataSource:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)staticArtworkCatalogWithImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(_MPStaticArtworkVisualIdenticalityIdentifier);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lx", v4);
  [(_MPStaticArtworkVisualIdenticalityIdentifier *)v5 setImageArtworkIdentifier:v6];

  id v7 = +[MPArtworkRepresentation representationForVisualIdentity:v5 withSize:v4 image:MPArtworkCatalogOriginalSize];

  id v8 = +[MPArtworkRepresentationCollection collectionWithImageRepresentation:v7 videoRepresentation:0];
  id v9 = [a1 staticArtworkCatalogWithRepresentationCollection:v8];

  return v9;
}

- (int64_t)MP_artworkType
{
  id v2 = [(MPArtworkCatalog *)self token];
  int64_t v3 = [v2 artworkType];

  return v3;
}

@end