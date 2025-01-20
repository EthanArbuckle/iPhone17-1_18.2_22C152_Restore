@interface MPMediaLibraryArtworkDataSource
+ (MPMediaLibraryArtworkDataSource)artworkDataSourceWithIdentifier:(id)a3;
+ (NSString)artworkDataSourceShortDescription;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)hasExistingRepresentationOnDiskForArtworkCatalog:(id)a3;
- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (BOOL)usesFallbackCache;
- (MPArtworkColorAnalysisUtility)artworkColorAnalysisUtility;
- (MPArtworkResizeUtility)artworkResizeUtility;
- (MPMediaLibraryArtworkDataSource)init;
- (NSCache)fallbackCache;
- (NSString)mediaLibraryUniqueIdentifier;
- (id)_cachedRepresentationForCatalog:(id)a3;
- (id)_existingRepresentationForArtworkCatalog:(id)a3 fromCacheOnly:(BOOL)a4;
- (id)_representationAtSize:(CGSize)a3 forCatalog:(id)a4;
- (id)_resizeArtwork:(id)a3 forCatalog:(id)a4 toSize:(CGSize)a5 completionHandler:(id)a6;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)_cacheRepresentation:(id)a3 forCatalog:(id)a4;
- (void)_createColorAnalysisForArtwork:(id)a3 catalog:(id)a4 withCompletion:(id)a5;
- (void)_resizeOriginalArtworkForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)_updateCachedColorAnalysis:(id)a3 forArtwork:(id)a4;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)setArtworkColorAnalysisUtility:(id)a3;
- (void)setArtworkResizeUtility:(id)a3;
- (void)setFallbackCache:(id)a3;
- (void)setMediaLibraryUniqueIdentifier:(id)a3;
- (void)setUsesFallbackCache:(BOOL)a3;
@end

@implementation MPMediaLibraryArtworkDataSource

- (void)setMediaLibraryUniqueIdentifier:(id)a3
{
}

- (MPMediaLibraryArtworkDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)MPMediaLibraryArtworkDataSource;
  v2 = [(MPMediaLibraryArtworkDataSource *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_usesFallbackCache = 1;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    fallbackCache = v3->_fallbackCache;
    v3->_fallbackCache = v4;

    [(NSCache *)v3->_fallbackCache setCountLimit:500];
    v6 = [[MPArtworkResizeUtility alloc] initWithQualityOfService:17];
    artworkResizeUtility = v3->_artworkResizeUtility;
    v3->_artworkResizeUtility = v6;

    v8 = [[MPArtworkColorAnalysisUtility alloc] initWithQualityOfService:17];
    artworkColorAnalysisUtility = v3->_artworkColorAnalysisUtility;
    v3->_artworkColorAnalysisUtility = v8;
  }
  return v3;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 token];
  BOOL v4 = +[MPMediaLibraryArtwork artworkExistsForRequest:v3];

  return v4;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = [a3 token];
  BOOL v4 = [_MPMediaLibraryArtworkVisualIdenticalityIdentifier alloc];
  uint64_t v5 = [v3 artworkType];
  v6 = [v3 availableArtworkToken];
  v7 = [v3 fetchableArtworkToken];
  v8 = [(_MPMediaLibraryArtworkVisualIdenticalityIdentifier *)v4 initWithArtworkType:v5 availableArtworkToken:v6 fetchableArtworkToken:v7];

  return v8;
}

void __67__MPMediaLibraryArtworkDataSource__cacheRepresentation_forCatalog___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) representationWithPreparedImage:a2];
    [*(id *)(a1 + 40) setObject:v3 forKey:*(void *)(a1 + 48)];
  }
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5
    && ([v6 token],
        v8 = objc_claimAutoreleasedReturnValue(),
        BOOL v9 = +[MPMediaLibraryArtwork needsToFetchArtworkForRequest:v8], v8, !v9))
  {
    objc_super v11 = [v5 representationToken];
    v12 = [v11 validSizes];
    [v7 scaledFittingSize];
    double v15 = MPArtworkRepresentationBestSizeMatchingSize(v12, v13, v14);
    double v17 = v16;

    [v5 representationSize];
    BOOL v10 = v19 == v17 && v18 == v15;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = -[MPMediaLibraryArtworkDataSource _existingRepresentationForArtworkCatalog:fromCacheOnly:](self, "_existingRepresentationForArtworkCatalog:fromCacheOnly:", v4, ((unint64_t)[v4 renderHint] >> 3) & 1);

  return v5;
}

- (void)setUsesFallbackCache:(BOOL)a3
{
  self->_usesFallbackCache = a3;
}

- (id)_existingRepresentationForArtworkCatalog:(id)a3 fromCacheOnly:(BOOL)a4
{
  id v6 = a3;
  v7 = [(MPMediaLibraryArtworkDataSource *)self _cachedRepresentationForCatalog:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
    goto LABEL_22;
  }
  if (a4)
  {
    id v9 = 0;
    goto LABEL_22;
  }
  BOOL v10 = [v6 token];
  objc_super v11 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v10];

  if (!v11) {
    goto LABEL_20;
  }
  [v6 scaledFittingSize];
  if (v13 != *(double *)&MPArtworkCatalogOriginalSize || v12 != *((double *)&MPArtworkCatalogOriginalSize + 1))
  {
    double v15 = [v11 validSizes];
    [v6 scaledFittingSize];
    double v18 = MPArtworkRepresentationBestSizeMatchingSize(v15, v16, v17);
    double v20 = v19;

    uint64_t v21 = -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v18, v20);
    if (v21)
    {
      id v9 = (id)v21;
LABEL_19:
      [(MPMediaLibraryArtworkDataSource *)self _cacheRepresentation:v9 forCatalog:v6];
      goto LABEL_21;
    }
    v22 = [v11 validSizes];
    v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v18, v20);
    uint64_t v24 = [v22 indexOfObject:v23];

    unint64_t v25 = v24 + 1;
    while (v25 < [v22 count])
    {
      v26 = [v22 objectAtIndexedSubscript:v25];
      [v26 CGSizeValue];
      double v28 = v27;
      double v30 = v29;

      uint64_t v31 = -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v28, v30);
      ++v25;
      if (v31)
      {
        id v9 = (id)v31;
        [(MPMediaLibraryArtworkDataSource *)self _cacheRepresentation:v31 forCatalog:v6];

        goto LABEL_21;
      }
    }
  }
  if (([v6 renderHint] & 4) != 0)
  {
LABEL_20:
    id v9 = 0;
    goto LABEL_21;
  }
  id v9 = [(MPMediaLibraryArtworkDataSource *)self _representationAtSize:v6 forCatalog:MPArtworkCatalogOriginalSize];
  if (v9) {
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:

  return v9;
}

- (id)_representationAtSize:(CGSize)a3 forCatalog:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = [v6 token];
  v8 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v7];

  id v9 = objc_msgSend(v8, "imageFileURLForSize:", width, height);
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
    objc_super v11 = [v9 path];
    double v12 = (void *)[v10 initWithContentsOfExactFilePath:v11];

    if (v12) {
      objc_setAssociatedObject(v12, "MPArtworkRepresentationBackingFileURLAssociatedKey", v9, (void *)3);
    }
  }
  else
  {
    double v12 = 0;
  }
  double v13 = [v6 visualIdenticalityIdentifier];
  double v14 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v13, v12, width, height);

  [v14 setRepresentationToken:v8];

  return v14;
}

- (void)_cacheRepresentation:(id)a3 forCatalog:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    v8 = [v7 cache];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(MPMediaLibraryArtworkDataSource *)self fallbackCache];
    }
    objc_super v11 = v10;

    double v12 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
    [v7 scaledFittingSize];
    double v13 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v12, "initWithArtworkCatalog:representativeSize:", v7);

    [v11 setObject:v6 forKey:v13];
    if (![v6 kind])
    {
      double v14 = [v6 image];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__MPMediaLibraryArtworkDataSource__cacheRepresentation_forCatalog___block_invoke;
      v15[3] = &unk_1E57F8140;
      id v16 = v6;
      id v17 = v11;
      double v18 = v13;
      [v14 prepareForDisplayWithCompletionHandler:v15];
    }
  }
}

- (id)_cachedRepresentationForCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cache];
  id v6 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
  [v4 scaledFittingSize];
  id v7 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v6, "initWithArtworkCatalog:representativeSize:", v4);
  v8 = [v4 token];

  id v9 = [v8 fetchableArtworkToken];
  if ([v9 length])
  {
  }
  else
  {
    id v10 = [v8 availableArtworkToken];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      double v12 = 0;
      goto LABEL_7;
    }
  }
  double v12 = [v5 objectForKey:v7];
  if (!v12)
  {
    double v13 = [(MPMediaLibraryArtworkDataSource *)self fallbackCache];
    double v12 = [v13 objectForKey:v7];
  }
LABEL_7:

  return v12;
}

- (NSCache)fallbackCache
{
  if ([(MPMediaLibraryArtworkDataSource *)self usesFallbackCache]) {
    id v3 = self->_fallbackCache;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)usesFallbackCache
{
  return self->_usesFallbackCache;
}

- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3
{
  id v3 = [a3 token];
  BOOL v4 = +[MPMediaLibraryArtwork fetchableArtworkExistsForRequest:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisUtility, 0);
  objc_storeStrong((id *)&self->_artworkResizeUtility, 0);
  objc_storeStrong((id *)&self->_fallbackCache, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUniqueIdentifier, 0);
}

- (void)setArtworkColorAnalysisUtility:(id)a3
{
}

- (MPArtworkColorAnalysisUtility)artworkColorAnalysisUtility
{
  return self->_artworkColorAnalysisUtility;
}

- (void)setArtworkResizeUtility:(id)a3
{
}

- (MPArtworkResizeUtility)artworkResizeUtility
{
  return self->_artworkResizeUtility;
}

- (void)setFallbackCache:(id)a3
{
}

- (NSString)mediaLibraryUniqueIdentifier
{
  return self->_mediaLibraryUniqueIdentifier;
}

- (void)_updateCachedColorAnalysis:(id)a3 forArtwork:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v13 = @"ColorAnalysis";
    id v5 = a4;
    id v6 = a3;
    id v7 = [&unk_1EE6ED460 stringValue];
    uint64_t v11 = v7;
    v8 = [v6 dictRepresentation];

    double v12 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v5 setEffectsMetadata:v10];
  }
}

- (void)_createColorAnalysisForArtwork:(id)a3 catalog:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 autogeneratedSizes];
  double v12 = [v11 lastObject];

  if (v12)
  {
    double v13 = [v8 autogeneratedSizes];
    double v14 = [v13 lastObject];
    [v14 CGSizeValue];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke;
  v33[3] = &unk_1E57F81D8;
  id v19 = v8;
  id v34 = v19;
  id v20 = v9;
  id v35 = v20;
  uint64_t v21 = (void *)MEMORY[0x19971E0F0](v33);
  char v22 = [v10 renderHint];

  v23 = objc_msgSend(v19, "imageFileURLForSize:", v16, v18);
  if ((v22 & 2) != 0 && [MEMORY[0x1E4F77948] canConnectToMediaArtworkService])
  {
    id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F77930]), "initWithSourceURL:preferredImageSize:", v23, v16, v18);
    unint64_t v25 = [MEMORY[0x1E4F77928] sharedService];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_52;
    v31[3] = &unk_1E57F8200;
    id v32 = v21;
    id v26 = v21;
    [v25 sendRequest:v24 completion:v31];
  }
  else
  {
    double v27 = [(MPMediaLibraryArtworkDataSource *)self artworkColorAnalysisUtility];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_2;
    v29[3] = &unk_1E57F8200;
    double v30 = v21;
    id v24 = v21;
    id v28 = (id)objc_msgSend(v27, "performColorAnalysisForImageAtUrl:preferredImageSize:completionHandler:", v23, v29, v16, v18);

    id v26 = v30;
  }
}

void __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F79A80]) initWithColorAnalysis:v5];
    id v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v17 = 138477827;
        uint64_t v18 = v12;
        double v13 = "Created color analysis for artwork: %{private}@";
        double v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_10:
        _os_log_impl(&dword_1952E8000, v14, v15, v13, (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138477827;
      uint64_t v18 = v16;
      double v13 = "Failed to create color analysis for artwork: %{private}@";
      double v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }

    (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9);
    goto LABEL_12;
  }
  id v7 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v17 = 138478083;
    uint64_t v18 = v8;
    __int16 v19 = 2113;
    id v20 = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@ with error; %{private}@",
      (uint8_t *)&v17,
      0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_12:
}

uint64_t __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_resizeArtwork:(id)a3 forCatalog:(id)a4 toSize:(CGSize)a5 completionHandler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  double v14 = [v13 originalFileURL];
  os_log_type_t v15 = objc_msgSend(v13, "imageFileURLForSize:", width, height);

  if (([v11 renderHint] & 2) != 0
    && [MEMORY[0x1E4F77948] canConnectToMediaArtworkService])
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F77948]) initWithSourceURL:v14];
    uint64_t v17 = [MEMORY[0x1E4F79AF8] devicePreferredImageFormat];
    if (v17) {
      objc_msgSend(v16, "addDestinationWithFormat:size:url:", v17, v15, width, height);
    }
    else {
      objc_msgSend(v16, "addJPEGDestinationWithSize:compressionQuality:url:", v15, width, height, 0.9);
    }
    id v28 = [MEMORY[0x1E4F77928] sharedService];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke;
    v36[3] = &unk_1E57F8188;
    id v37 = v15;
    id v38 = v16;
    id v39 = v11;
    double v41 = width;
    double v42 = height;
    id v40 = v12;
    id v20 = v16;
    [v28 sendRequest:v20 completionHandler:v36];
  }
  else
  {
    if (v14)
    {
      id v18 = objc_alloc(MEMORY[0x1E4FB1818]);
      __int16 v19 = [v14 path];
      id v20 = (id)[v18 initWithContentsOfExactFilePath:v19];

      if (v20)
      {
        objc_setAssociatedObject(v20, "MPArtworkRepresentationBackingFileURLAssociatedKey", v14, (void *)3);
        if ([MEMORY[0x1E4F77940] hasWriteAccessToPath:v15]) {
          uint64_t v21 = v15;
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = v21;
        v23 = [(MPMediaLibraryArtworkDataSource *)self artworkResizeUtility];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_3;
        v30[3] = &unk_1E57F81B0;
        id v33 = v12;
        id v31 = v15;
        id v32 = v11;
        double v34 = width;
        double v35 = height;
        id v24 = objc_msgSend(v23, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v20, 0, v22, v30, width, height);

        goto LABEL_16;
      }
    }
    unint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28228];
    id v26 = [NSString stringWithFormat:@"Image did not exist at URL: %@", v14];
    v44[0] = v26;
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    id v20 = [v25 errorWithDomain:@"MPArtworkResizeDomain" code:0 userInfo:v27];

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v20);
    }
  }
  id v24 = 0;
LABEL_16:

  return v24;
}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || !*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (!v4) {
      goto LABEL_7;
    }
    id v10 = v3;
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else
  {
    id v10 = 0;
    [*(id *)(a1 + 40) enumerateDestinationsUsingBlock:&__block_literal_global_46_49028];
    id v5 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v6 = [*(id *)(a1 + 32) path];
    id v7 = (void *)[v5 initWithContentsOfExactFilePath:v6];

    uint64_t v8 = [*(id *)(a1 + 48) visualIdenticalityIdentifier];
    id v9 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v8, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v3 = v10;
LABEL_7:
}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id object = a2;
  id v5 = a3;
  if (*(void *)(a1 + 48))
  {
    if (object) {
      objc_setAssociatedObject(object, "MPArtworkRepresentationBackingFileURLAssociatedKey", *(id *)(a1 + 32), (void *)3);
    }
    id v6 = [*(id *)(a1 + 40) visualIdenticalityIdentifier];
    id v7 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v6, object, *(double *)(a1 + 56), *(double *)(a1 + 64));

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F79AF8];
  id v3 = a2;
  id v6 = [v2 autoupdatingSharedLibrary];
  uint64_t v4 = [v3 destinationURL];

  id v5 = [v4 path];
  [v6 markSystemPurgeableMusicPath:v5 forUrgency:ML3ArtworkPurgeabilityLevelCache()];
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __126__MPMediaLibraryArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E57F8118;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  int64_t v22 = a3;
  double v14 = (void (*)(id, void *))*((void *)a6 + 2);
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  v14(a6, v18);
}

void __126__MPMediaLibraryArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v46 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6 != 3)
  {
    if (v6 != 1) {
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (objc_class *)MEMORY[0x1E4F779B0];
      id v8 = v46;
      id v9 = (UIImage *)objc_alloc_init(v7);
      id v10 = NSString;
      id v11 = [v8 backgroundColor];
      id v12 = objc_msgSend(v10, "MP_hexStringFromColor:", v11);
      [(UIImage *)v9 setBackgroundColorHex:v12];

      -[UIImage setBackgroundColorLight:](v9, "setBackgroundColorLight:", [v8 isBackgroundColorLight]);
      id v13 = NSString;
      double v14 = [v8 primaryTextColor];
      id v15 = objc_msgSend(v13, "MP_hexStringFromColor:", v14);
      [(UIImage *)v9 setPrimaryTextColorHex:v15];

      -[UIImage setPrimaryTextColorLight:](v9, "setPrimaryTextColorLight:", [v8 isPrimaryTextColorLight]);
      id v16 = NSString;
      id v17 = [v8 secondaryTextColor];
      id v18 = objc_msgSend(v16, "MP_hexStringFromColor:", v17);
      [(UIImage *)v9 setSecondaryTextColorHex:v18];

      -[UIImage setSecondaryTextColorLight:](v9, "setSecondaryTextColorLight:", [v8 isSecondaryTextColorLight]);
      id v19 = NSString;
      id v20 = [v8 tertiaryTextColor];
      id v21 = objc_msgSend(v19, "MP_hexStringFromColor:", v20);
      [(UIImage *)v9 setTertiaryTextColorHex:v21];

      uint64_t v22 = [v8 isTertiaryTextColorLight];
      [(UIImage *)v9 setTertiaryTextColorLight:v22];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = (UIImage *)v46;
      }
      else {
        id v9 = 0;
      }
    }
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4F79A80]) initWithColorAnalysis:v9];
    id v33 = [v24 dictRepresentation];
    double v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      id v35 = [MEMORY[0x1E4F1CA98] null];
    }
    unint64_t v25 = v35;

    v36 = [*(id *)(a1 + 32) token];
    id v32 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v36];

    if (v32)
    {
      id v37 = [v32 effectsMetadata];
      id v38 = (void *)[v37 mutableCopy];

      id v39 = [v38 objectForKey:@"ColorAnalysis"];
      id v40 = (void *)[v39 mutableCopy];

      if (!v40) {
        id v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      double v41 = [*(id *)(a1 + 40) objectForKey:@"MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm"];
      uint64_t v42 = [v41 integerValue];

      uint64_t v43 = [NSNumber numberWithInteger:v42];
      v44 = [v43 stringValue];
      [v40 setObject:v25 forKey:v44];

      [v38 setObject:v40 forKey:@"ColorAnalysis"];
      [v32 setEffectsMetadata:v38];
    }
    goto LABEL_19;
  }
  id v9 = (UIImage *)v46;
  v23 = [*(id *)(a1 + 32) token];
  id v24 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v23];

  if (!v9 || !v24) {
    goto LABEL_21;
  }
  unint64_t v25 = [v24 imageFileURLForEffect:@"Radiosity"];
  id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v27 = [v25 path];
  char v28 = [v26 fileExistsAtPath:v27];

  if ((v28 & 1) == 0)
  {
    double v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v30 = [v25 path];
    id v31 = [v30 stringByDeletingLastPathComponent];
    [v29 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:0];

    id v32 = UIImagePNGRepresentation(v9);
    [v32 writeToURL:v25 atomically:1];
LABEL_19:
  }
LABEL_21:

LABEL_22:
  uint64_t v45 = *(void *)(a1 + 48);
  if (v45) {
    (*(void (**)(uint64_t, id, id))(v45 + 16))(v45, v46, v5);
  }
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 != 3)
  {
    if (a3 != 1)
    {
      id v18 = 0;
      goto LABEL_17;
    }
    id v9 = [v7 token];
    id v10 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v9];

    id v11 = [v8 objectForKey:@"MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm"];
    id v12 = [v11 stringValue];

    id v13 = [v10 effectsMetadata];
    double v14 = [v13 objectForKeyedSubscript:@"ColorAnalysis"];
    id v15 = [v14 objectForKeyedSubscript:v12];

    if (_NSIsNSDictionary()
      && (uint64_t v16 = [objc_alloc(MEMORY[0x1E4F79A80]) initWithColorAnalysisDictionary:v15]) != 0)
    {
      id v17 = (void *)v16;
      id v18 = +[MPArtworkColorAnalyzer translateFromMLColorAnalysis:v16];
    }
    else
    {
      id v18 = 0;
    }

    goto LABEL_12;
  }
  id v19 = [v7 token];
  id v10 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v19];

  if (v10)
  {
    id v12 = [v10 imageFileURLForEffect:@"Radiosity"];
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = [v12 path];
    int v22 = [v20 fileExistsAtPath:v21];

    if (!v22)
    {
      id v18 = 0;
      goto LABEL_15;
    }
    id v23 = objc_alloc(MEMORY[0x1E4FB1818]);
    id v13 = [v12 path];
    id v18 = (void *)[v23 initWithContentsOfFile:v13];
LABEL_12:

LABEL_15:
    goto LABEL_16;
  }
  id v18 = 0;
LABEL_16:

LABEL_17:

  return v18;
}

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  id v7 = [v5 cache];
  id v8 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
  id v9 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v8, "initWithArtworkCatalog:representativeSize:", v5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v10 = [v7 objectForKey:v9];
  if (v10)
  {
    v6[2](v6, v10, 0);
  }
  else
  {
    id v11 = [v5 token];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__MPMediaLibraryArtworkDataSource_getExportableArtworkPropertiesForCatalog_completionHandler___block_invoke;
    v12[3] = &unk_1E57F80E8;
    id v13 = v7;
    double v14 = v9;
    id v15 = v6;
    +[MPMediaLibraryArtwork fetchArtworkInfoForRequest:v11 completionHandler:v12];
  }
}

void __94__MPMediaLibraryArtworkDataSource_getExportableArtworkPropertiesForCatalog_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    uint64_t v6 = (void *)a1[4];
    if (v6) {
      [v6 setObject:v7 forKey:a1[5]];
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)hasExistingRepresentationOnDiskForArtworkCatalog:(id)a3
{
  id v3 = [a3 token];
  BOOL v4 = !+[MPMediaLibraryArtwork needsToFetchArtworkForRequest:v3];

  return v4;
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v3 = [a3 token];
  +[MPMediaLibraryArtwork cancelFetchingArtworkForRequest:v3];
}

- (void)_resizeOriginalArtworkForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 token];
  id v9 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v8];

  id v10 = [v9 validSizes];
  [v6 scaledFittingSize];
  double v13 = MPArtworkRepresentationBestSizeMatchingSize(v10, v11, v12);
  double v15 = v14;

  uint64_t v16 = -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v13, v15);
  if (v16)
  {
    [(MPMediaLibraryArtworkDataSource *)self _cacheRepresentation:v16 forCatalog:v6];
    v7[2](v7, v16, 0);
  }
  else
  {
    id v17 = [v9 originalFileURL];
    objc_initWeak(&location, v6);
    if (v17
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          id v18 = objc_claimAutoreleasedReturnValue(),
          [v17 path],
          id v19 = objc_claimAutoreleasedReturnValue(),
          int v20 = [v18 fileExistsAtPath:v19],
          v19,
          v18,
          v20))
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke;
      v30[3] = &unk_1E57F8098;
      objc_copyWeak(&v32, &location);
      void v30[4] = self;
      id v31 = v7;
      id v21 = -[MPMediaLibraryArtworkDataSource _resizeArtwork:forCatalog:toSize:completionHandler:](self, "_resizeArtwork:forCatalog:toSize:completionHandler:", v9, v6, v30, v13, v15);
      int v22 = [v6 existingColorAnalysisWithAlgorithm:1];
      BOOL v23 = v22 == 0;

      if (v23)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke_2;
        v28[3] = &unk_1E57F80C0;
        v28[4] = self;
        id v29 = v9;
        [(MPMediaLibraryArtworkDataSource *)self _createColorAnalysisForArtwork:v29 catalog:v6 withCompletion:v28];
      }
      objc_destroyWeak(&v32);
    }
    else
    {
      id v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28228];
      unint64_t v25 = [NSString stringWithFormat:@"Image did not exist at URL: %@", v17];
      v35[0] = v25;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      double v27 = [v24 errorWithDomain:@"MPArtworkResizeDomain" code:0 userInfo:v26];

      ((void (**)(id, void *, void *))v7)[2](v7, 0, v27);
    }
    objc_destroyWeak(&location);
  }
}

void __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    [*(id *)(a1 + 32) _cacheRepresentation:v7 forCatalog:WeakRetained];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) originalFileURL];
      int v8 = 138477827;
      id v9 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    [v6 _updateCachedColorAnalysis:a2 forArtwork:v7];
  }
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = &__block_literal_global_49159;
  }
  int v8 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v7);
  if (([v6 renderHint] & 8) != 0
    && ([(MPMediaLibraryArtworkDataSource *)self _existingRepresentationForArtworkCatalog:v6 fromCacheOnly:0], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = (void *)v9;
    v8[2](v8, v9, 0);
  }
  else
  {
    objc_initWeak(&location, v6);
    double v11 = [v6 token];
    BOOL v12 = +[MPMediaLibraryArtwork needsToFetchArtworkForRequest:v11];

    if (v12)
    {
      double v13 = [v6 token];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
      v14[3] = &unk_1E57F8070;
      objc_copyWeak(&v16, &location);
      v14[4] = self;
      double v15 = v8;
      +[MPMediaLibraryArtwork fetchArtworkForRequest:v13 completionHandler:v14];

      objc_destroyWeak(&v16);
    }
    else
    {
      [(MPMediaLibraryArtworkDataSource *)self _resizeOriginalArtworkForArtworkCatalog:v6 completionHandler:v8];
    }
    objc_destroyWeak(&location);
  }
}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v8 = WeakRetained;
  if (v6)
  {
    if (WeakRetained) {
      [*(id *)(a1 + 32) _resizeOriginalArtworkForArtworkCatalog:WeakRetained completionHandler:*(void *)(a1 + 40)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v9 = [v5 validSizes];
    [v8 scaledFittingSize];
    double v12 = MPArtworkRepresentationBestSizeMatchingSize(v9, v10, v11);
    double v14 = v13;

    double v15 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
    v26[3] = &unk_1E57F8020;
    objc_copyWeak(&v30, (id *)(a1 + 48));
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(a1 + 40);
    id v27 = v16;
    uint64_t v28 = v17;
    id v29 = v18;
    id v19 = (id)objc_msgSend(v15, "_resizeArtwork:forCatalog:toSize:completionHandler:", v16, v8, v26, v12, v14);
    int v20 = [v8 existingColorAnalysisWithAlgorithm:1];

    if (!v20)
    {
      id v21 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4;
      v22[3] = &unk_1E57F8048;
      id v23 = 0;
      id v24 = v21;
      id v25 = v16;
      [v21 _createColorAnalysisForArtwork:v25 catalog:v8 withCompletion:v22];
    }
    objc_destroyWeak(&v30);
  }
}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v7 setRepresentationToken:*(void *)(a1 + 32)];
  if (!v5 && WeakRetained) {
    [*(id *)(a1 + 40) _cacheRepresentation:v7 forCatalog:WeakRetained];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = [*(id *)(a1 + 48) originalFileURL];
      int v7 = 138477827;
      int v8 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 _updateCachedColorAnalysis:a2 forArtwork:v6];
  }
}

+ (MPMediaLibraryArtworkDataSource)artworkDataSourceWithIdentifier:(id)a3
{
  id v3 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:a3 allowsLoadingFromDisk:1];
  BOOL v4 = [v3 libraryDataProvider];
  id v5 = [v4 artworkDataSource];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (MPMediaLibraryArtworkDataSource *)v6;
}

+ (NSString)artworkDataSourceShortDescription
{
  return (NSString *)@"library";
}

@end