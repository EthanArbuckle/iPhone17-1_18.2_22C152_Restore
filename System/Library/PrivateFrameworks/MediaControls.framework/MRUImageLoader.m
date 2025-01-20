@interface MRUImageLoader
- (BOOL)cacheImages;
- (BOOL)fittingSizeUpdateScheduled;
- (BOOL)formatImages;
- (BOOL)runningSynchronously;
- (BOOL)vendCachedImageIfPossible;
- (BOOL)wouldLoadNewImageForCatalog:(id)a3;
- (CGSize)deferredFittingSize;
- (CGSize)fittingSize;
- (CGSize)lastVendedScaledFittingSize;
- (CGSize)scaledFittingSize;
- (CGSize)targetFittingSizeForCurrentCatalogConfiguration;
- (MPArtworkCatalog)catalog;
- (MPArtworkDataSourceVisualIdenticality)lastFailedArtworkIdentifier;
- (MPArtworkDataSourceVisualIdenticality)lastVendedArtworkIdentifier;
- (MRUImageLoader)initWithDestination:(id)a3 imageHandler:(id)a4;
- (UIView)destination;
- (double)deferredScale;
- (double)scale;
- (id)imageHandler;
- (int64_t)failedLoadingCount;
- (int64_t)state;
- (void)configureCatalog;
- (void)dealloc;
- (void)deferredUpdateFittingSize;
- (void)setCacheImages:(BOOL)a3;
- (void)setCatalog:(id)a3;
- (void)setDeferredFittingSize:(CGSize)a3;
- (void)setDeferredScale:(double)a3;
- (void)setFailedLoadingCount:(int64_t)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)setFittingSizeUpdateScheduled:(BOOL)a3;
- (void)setFormatImages:(BOOL)a3;
- (void)setLastFailedArtworkIdentifier:(id)a3;
- (void)setLastVendedArtworkIdentifier:(id)a3;
- (void)setLastVendedScaledFittingSize:(CGSize)a3;
- (void)setRunningSynchronously:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetFittingSizeForCurrentCatalogConfiguration:(CGSize)a3;
- (void)updateCatalog:(id)a3;
- (void)updateFittingSize:(CGSize)a3 scale:(double)a4;
- (void)withNoEscapeCheck:(id)a3;
@end

@implementation MRUImageLoader

- (MRUImageLoader)initWithDestination:(id)a3 imageHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MRUImageLoader;
  v8 = [(MRUImageLoader *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_destination, v6);
    uint64_t v10 = [v7 copy];
    id imageHandler = v9->_imageHandler;
    v9->_id imageHandler = (id)v10;

    v9->_cacheImages = +[MRUFeatureFlagProvider isImageCachingEnabled];
    v9->_formatImages = 1;
    v9->_state = 1;
    CGSize v12 = (CGSize)*MEMORY[0x1E4F1DB30];
    v9->_lastVendedScaledFittingSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v9->_fittingSize = v12;
    v9->_failedLoadingCount = 0;
    v9->_scale = 1.0;
    if (+[MRUFeatureFlagProvider isImageCachingEnabled])
    {
      v13 = +[MRUImageLoaderCoordinator sharedCoordinator];
      [v13 registerLoader:v9];
    }
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F770F0] currentSettings];
  int v4 = [v3 verboseImageLoadingLogging];

  if (v4)
  {
    v5 = MCLogCategoryImageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = objc_opt_class();
      __int16 v10 = 2048;
      v11 = self;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> deallocating.", buf, 0x16u);
    }
  }
  id v6 = +[MRUImageLoaderCoordinator sharedCoordinator];
  [v6 unregisterLoader:self];

  v7.receiver = self;
  v7.super_class = (Class)MRUImageLoader;
  [(MRUImageLoader *)&v7 dealloc];
}

- (BOOL)wouldLoadNewImageForCatalog:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [(MRUImageLoader *)self destination];
  if (v5)
  {
    if ([(MRUImageLoader *)self state] == 2)
    {
      if (NSClassFromString(&cfstr_Mpcmrcontentit.isa)
        && ((objc_opt_isKindOfClass() & 1) != 0
         || ([v5 artworkCatalog],
             id v6 = objc_claimAutoreleasedReturnValue(),
             char isKindOfClass = objc_opt_isKindOfClass(),
             v6,
             (isKindOfClass & 1) != 0)))
      {
        v8 = [v5 artworkCatalog];
        if ([v4 isArtworkVisuallyIdenticalToCatalog:v8])
        {
          uint64_t v9 = [v4 visualIdenticalityIdentifier];
          __int16 v10 = [v5 artworkCatalog];
          v11 = [v10 visualIdenticalityIdentifier];
          if (v9 == v11) {
            char v12 = 1;
          }
          else {
            char v12 = [v9 isEqual:v11];
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        v8 = [v5 artworkCatalog];
        char v12 = [v8 isArtworkVisuallyIdenticalToCatalog:v4];
      }

      [(MRUImageLoader *)self scaledFittingSize];
      double v25 = v24;
      double v27 = v26;
      [(MRUImageLoader *)self targetFittingSizeForCurrentCatalogConfiguration];
      char v29 = v12 ^ 1;
      if (v25 != v30) {
        char v29 = 1;
      }
      if (v27 == v28) {
        LOBYTE(v13) = v29;
      }
      else {
        LOBYTE(v13) = 1;
      }
    }
    else
    {
      [(MRUImageLoader *)self scaledFittingSize];
      double v15 = v14;
      double v17 = v16;
      [(MRUImageLoader *)self lastVendedScaledFittingSize];
      LOBYTE(v13) = 1;
      if (v15 == v19 && v17 == v18)
      {
        v20 = [v4 visualIdenticalityIdentifier];
        v21 = [v20 stringRepresentation];
        v22 = [(MRUImageLoader *)self lastVendedArtworkIdentifier];
        v23 = [v22 stringRepresentation];
        if (v21 == v23) {
          LOBYTE(v13) = 0;
        }
        else {
          int v13 = [v21 isEqual:v23] ^ 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)updateCatalog:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(MRUImageLoader *)self catalog];

  if (v5 != v4)
  {
    [(MRUImageLoader *)self setCatalog:v4];
    if ([(MRUImageLoader *)self wouldLoadNewImageForCatalog:v4])
    {
      id v6 = [(MRUImageLoader *)self destination];
      if (v6)
      {
        if (v4)
        {
          if (![(MRUImageLoader *)self vendCachedImageIfPossible]) {
            [(MRUImageLoader *)self configureCatalog];
          }
        }
        else
        {
          objc_super v7 = [MEMORY[0x1E4F770F0] currentSettings];
          int v8 = [v7 verboseImageLoadingLogging];

          if (v8)
          {
            uint64_t v9 = MCLogCategoryImageLoading();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              int v12 = 138412546;
              uint64_t v13 = objc_opt_class();
              __int16 v14 = 2048;
              double v15 = self;
              _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update with nil catalog.", (uint8_t *)&v12, 0x16u);
            }
          }
          __int16 v10 = [(MRUImageLoader *)self destination];
          [v10 clearArtworkCatalogs];

          [(MRUImageLoader *)self setState:1];
          [(MRUImageLoader *)self setFailedLoadingCount:0];
          [(MRUImageLoader *)self setLastFailedArtworkIdentifier:0];
          -[MRUImageLoader setLastVendedScaledFittingSize:](self, "setLastVendedScaledFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          [(MRUImageLoader *)self setLastVendedArtworkIdentifier:0];
          v11 = [(MRUImageLoader *)self imageHandler];
          v11[2](v11, 0, 0);
        }
      }
    }
  }
}

- (void)updateFittingSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(MRUImageLoader *)self deferredFittingSize];
  BOOL v10 = v9 == width && v8 == height;
  if (!v10 || ([(MRUImageLoader *)self deferredScale], v11 != a4))
  {
    int v12 = [MEMORY[0x1E4F770F0] currentSettings];
    int v13 = [v12 verboseImageLoadingLogging];

    if (v13)
    {
      __int16 v14 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_opt_class();
        v28.double width = width;
        v28.double height = height;
        uint64_t v16 = NSStringFromCGSize(v28);
        *(_DWORD *)buf = 138413058;
        uint64_t v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2112;
        double v24 = v16;
        __int16 v25 = 2048;
        double v26 = a4;
        _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update deferred fitting size: %@, scale: %lf.", buf, 0x2Au);
      }
    }
    -[MRUImageLoader setDeferredFittingSize:](self, "setDeferredFittingSize:", width, height);
    [(MRUImageLoader *)self setDeferredScale:a4];
    if (![(MRUImageLoader *)self fittingSizeUpdateScheduled])
    {
      [(MRUImageLoader *)self setFittingSizeUpdateScheduled:1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__MRUImageLoader_updateFittingSize_scale___block_invoke;
      block[3] = &unk_1E5F0D7F8;
      block[4] = self;
      double v17 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __42__MRUImageLoader_updateFittingSize_scale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deferredUpdateFittingSize];
}

- (void)deferredUpdateFittingSize
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [(MRUImageLoader *)self deferredFittingSize];
  double v4 = v3;
  double v6 = v5;
  [(MRUImageLoader *)self deferredScale];
  double v8 = v7;
  [(MRUImageLoader *)self setFittingSizeUpdateScheduled:0];
  double v9 = floor(v4);
  double v10 = floor(v6);
  [(MRUImageLoader *)self fittingSize];
  BOOL v13 = v12 == v9 && v11 == v10;
  if (!v13 || ([(MRUImageLoader *)self scale], v14 != v8))
  {
    -[MRUImageLoader setFittingSize:](self, "setFittingSize:", v9, v10);
    [(MRUImageLoader *)self setScale:v8];
    uint64_t v15 = [MEMORY[0x1E4F770F0] currentSettings];
    int v16 = [v15 verboseImageLoadingLogging];

    if (v16)
    {
      double v17 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_opt_class();
        [(MRUImageLoader *)self fittingSize];
        double v19 = NSStringFromCGSize(v50);
        [(MRUImageLoader *)self scale];
        *(_DWORD *)buf = 138413058;
        uint64_t v42 = v18;
        __int16 v43 = 2048;
        v44 = self;
        __int16 v45 = 2112;
        v46 = v19;
        __int16 v47 = 2048;
        v48 = v20;
        _os_log_impl(&dword_1AE7DF000, v17, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update fitting size: %@, scale: %lf.", buf, 0x2Au);
      }
    }
    __int16 v21 = [(MRUImageLoader *)self destination];
    v22 = +[MRUImageLoaderCoordinator sharedCoordinator];
    [v22 registeredLoaderFittingSizeDidChange:self];

    if (v21 && ![(MRUImageLoader *)self vendCachedImageIfPossible])
    {
      __int16 v23 = [v21 artworkCatalog];
      double v24 = [(MRUImageLoader *)self catalog];

      if (v24 == v23)
      {
        if (v23)
        {
          if (+[MRUFeatureFlagProvider isImageCachingEnabled])
          {
            __int16 v25 = +[MRUImageLoaderCoordinator sharedCoordinator];
            [v25 requestSize];
            CGFloat v27 = v26;
            CGFloat v29 = v28;
          }
          else
          {
            [(MRUImageLoader *)self scaledFittingSize];
            CGFloat v27 = v30;
            CGFloat v29 = v31;
          }
          v32 = [MEMORY[0x1E4F770F0] currentSettings];
          int v33 = [v32 verboseImageLoadingLogging];

          if (v33)
          {
            v34 = MCLogCategoryImageLoading();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v35 = objc_opt_class();
              v51.double width = v27;
              v51.double height = v29;
              v36 = NSStringFromCGSize(v51);
              *(_DWORD *)buf = 138413058;
              uint64_t v42 = v35;
              __int16 v43 = 2048;
              v44 = self;
              __int16 v45 = 2112;
              v46 = v36;
              __int16 v47 = 2048;
              v48 = v23;
              _os_log_impl(&dword_1AE7DF000, v34, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> update fitting size: %@ on associated catalog: %p", buf, 0x2Au);
            }
          }
          [(MRUImageLoader *)self scaledFittingSize];
          -[MRUImageLoader setTargetFittingSizeForCurrentCatalogConfiguration:](self, "setTargetFittingSizeForCurrentCatalogConfiguration:");
          [(MRUImageLoader *)self setState:2];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __43__MRUImageLoader_deferredUpdateFittingSize__block_invoke;
          v37[3] = &unk_1E5F0F9F0;
          id v38 = v23;
          CGFloat v39 = v27;
          CGFloat v40 = v29;
          [(MRUImageLoader *)self withNoEscapeCheck:v37];
        }
      }
      else
      {
        [(MRUImageLoader *)self configureCatalog];
      }
    }
  }
}

uint64_t __43__MRUImageLoader_deferredUpdateFittingSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFittingSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)vendCachedImageIfPossible
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v3 = [(MRUImageLoader *)self catalog];
  double v4 = [v3 overlayDelegate];

  if (v4)
  {
    +[MRUImageUtilities clearCache];
    LOBYTE(v5) = 0;
  }
  else
  {
    double v6 = [(MRUImageLoader *)self destination];
    double v5 = [(MRUImageLoader *)self catalog];
    double v7 = [v5 visualIdenticalityIdentifier];
    double v8 = [v7 stringRepresentation];

    LOBYTE(v5) = 0;
    if (v6)
    {
      if (v8)
      {
        [(MRUImageLoader *)self scaledFittingSize];
        double v10 = v9;
        double v12 = v11;
        double v5 = +[MRUImageUtilities formattedImageForIdentifier:size:](MRUImageUtilities, "formattedImageForIdentifier:size:", v8);
        if (v5)
        {
          [v6 clearArtworkCatalogs];
          BOOL v13 = [MEMORY[0x1E4F770F0] currentSettings];
          int v14 = [v13 verboseImageLoadingLogging];

          if (v14)
          {
            uint64_t v15 = MCLogCategoryImageLoading();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = 138413058;
              uint64_t v21 = objc_opt_class();
              __int16 v22 = 2048;
              __int16 v23 = self;
              __int16 v24 = 2112;
              __int16 v25 = v5;
              __int16 v26 = 2112;
              CGFloat v27 = v6;
              _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> Vending cached image %@ to destination %@.", (uint8_t *)&v20, 0x2Au);
            }
          }
          [(MRUImageLoader *)self setState:6];
          [(MRUImageLoader *)self setFailedLoadingCount:0];
          [(MRUImageLoader *)self setLastFailedArtworkIdentifier:0];
          int v16 = [(MRUImageLoader *)self catalog];
          double v17 = [v16 visualIdenticalityIdentifier];
          [(MRUImageLoader *)self setLastVendedArtworkIdentifier:v17];

          -[MRUImageLoader setLastVendedScaledFittingSize:](self, "setLastVendedScaledFittingSize:", v10, v12);
          uint64_t v18 = [(MRUImageLoader *)self imageHandler];
          ((void (**)(void, void *, void))v18)[2](v18, v5, 0);

          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return (char)v5;
}

- (CGSize)scaledFittingSize
{
  [(MRUImageLoader *)self fittingSize];
  double v4 = v3;
  double v6 = v5;
  [(MRUImageLoader *)self scale];
  CGFloat v8 = v7;
  [(MRUImageLoader *)self scale];
  CGAffineTransformMakeScale(&v12, v8, v9);
  double v10 = v6 * v12.c + v12.a * v4;
  double v11 = v6 * v12.d + v12.b * v4;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setState:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F770F0] currentSettings];
  int v6 = [v5 verboseImageLoadingLogging];

  if (v6)
  {
    double v7 = MCLogCategoryImageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      unint64_t v9 = self->_state - 2;
      if (v9 > 4) {
        double v10 = @"initial";
      }
      else {
        double v10 = off_1E5F0FD20[v9];
      }
      if ((unint64_t)(a3 - 2) > 4) {
        double v11 = @"initial";
      }
      else {
        double v11 = off_1E5F0FD20[a3 - 2];
      }
      int v12 = 138413058;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      double v17 = v10;
      __int16 v18 = 2112;
      double v19 = v11;
      _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> transition %@ -> %@.", (uint8_t *)&v12, 0x2Au);
    }
  }
  self->_state = a3;
}

- (void)setLastVendedArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastVendedArtworkIdentifier, a3);
  id v5 = a3;
  id v6 = +[MRUImageLoaderCoordinator sharedCoordinator];

  [v6 registeredLoaderArtworkIdentifierDidChange:self];
}

- (void)configureCatalog
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  double v4 = [(MRUImageLoader *)self destination];
  id v5 = [(MRUImageLoader *)self catalog];
  id v6 = [v5 visualIdenticalityIdentifier];
  if ([(MRUImageLoader *)self state] == 4)
  {
    id v7 = [v6 stringRepresentation];
    uint64_t v2 = [(MRUImageLoader *)self lastFailedArtworkIdentifier];
    id v8 = [(id)v2 stringRepresentation];
    if (v7 == v8)
    {
    }
    else
    {
      unint64_t v9 = v8;
      char v10 = [v7 isEqual:v8];

      if ((v10 & 1) == 0) {
        goto LABEL_4;
      }
    }
    double v17 = [MEMORY[0x1E4F770F0] currentSettings];
    int v18 = [v17 verboseImageLoadingLogging];

    if (!v18) {
      goto LABEL_31;
    }
    uint64_t v15 = MCLogCategoryImageLoading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = objc_opt_class();
      __int16 v34 = 2048;
      uint64_t v35 = self;
      __int16 v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> will not configure catalog %p vending oversized artwork.", buf, 0x20u);
    }
    goto LABEL_13;
  }
LABEL_4:
  id v11 = [(MRUImageLoader *)self lastFailedArtworkIdentifier];
  if (v6 == v11)
  {
  }
  else
  {
    int v12 = v11;
    uint64_t v2 = [v6 isEqual:v11];

    if ((v2 & 1) == 0)
    {
      [(MRUImageLoader *)self setFailedLoadingCount:0];
      goto LABEL_14;
    }
  }
  if ([(MRUImageLoader *)self state] == 3
    && [(MRUImageLoader *)self failedLoadingCount] >= 3)
  {
    uint64_t v13 = [MEMORY[0x1E4F770F0] currentSettings];
    int v14 = [v13 verboseImageLoadingLogging];

    if (!v14) {
      goto LABEL_31;
    }
    uint64_t v15 = MCLogCategoryImageLoading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = objc_opt_class();
      __int16 v34 = 2048;
      uint64_t v35 = self;
      __int16 v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_1AE7DF000, v15, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> exhausted retries, will not configure catalog %p.", buf, 0x20u);
    }
LABEL_13:

    goto LABEL_31;
  }
LABEL_14:
  if (v4 && v5)
  {
    objc_initWeak(&location, self);
    [(MRUImageLoader *)self setState:2];
    [(MRUImageLoader *)self scaledFittingSize];
    -[MRUImageLoader setTargetFittingSizeForCurrentCatalogConfiguration:](self, "setTargetFittingSizeForCurrentCatalogConfiguration:");
    BOOL v16 = +[MRUFeatureFlagProvider isImageCachingEnabled];
    if (v16)
    {
      uint64_t v2 = +[MRUImageLoaderCoordinator sharedCoordinator];
      [(id)v2 requestSize];
    }
    else
    {
      [(MRUImageLoader *)self scaledFittingSize];
    }
    objc_msgSend(v5, "setFittingSize:");
    if (v16) {

    }
    double v19 = [MEMORY[0x1E4F770F0] currentSettings];
    int v20 = [v19 verboseImageLoadingLogging];

    if (v20)
    {
      uint64_t v21 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        __int16 v23 = [v5 visualIdenticalityIdentifier];
        __int16 v24 = [v23 stringRepresentation];
        [v5 fittingSize];
        NSStringFromCGSize(v45);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        [(MRUImageLoader *)self scaledFittingSize];
        __int16 v26 = NSStringFromCGSize(v46);
        *(_DWORD *)buf = 138413570;
        uint64_t v33 = v22;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v36 = 2048;
        v37 = v5;
        __int16 v38 = 2112;
        CGFloat v39 = v24;
        __int16 v40 = 2112;
        id v41 = v25;
        __int16 v42 = 2112;
        __int16 v43 = v26;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> configuring catalog %p, with identifier: %@, request size: %@, scaled fitting size: %@.", buf, 0x3Eu);
      }
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __34__MRUImageLoader_configureCatalog__block_invoke;
    v27[3] = &unk_1E5F0FD00;
    id v28 = v5;
    id v29 = v4;
    objc_copyWeak(&v30, &location);
    [(MRUImageLoader *)self withNoEscapeCheck:v27];
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
  }
LABEL_31:
}

void __34__MRUImageLoader_configureCatalog__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__MRUImageLoader_configureCatalog__block_invoke_2;
  v3[3] = &unk_1E5F0FCD8;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 setDestination:v2 configurationBlock:v3];
  objc_destroyWeak(&v4);
}

void __34__MRUImageLoader_configureCatalog__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = [v5 artworkCatalog];
    if (v6)
    {
      [v6 size];
      double v10 = v9;
      [v6 scale];
      double v12 = v10 * v11;
      [v6 size];
      double v14 = v13;
      [v6 scale];
      if (v12 <= 3000.0 && v14 * v15 <= 3000.0)
      {
        [WeakRetained scaledFittingSize];
        double v17 = v16;
        double v19 = v18;
        int v20 = [v8 dataSource];
        NSClassFromString(&cfstr_Mpartworkcatal.isa);
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v22 = [v8 overlayDelegate];
        if (v22 || (isKindOfClass & 1) != 0)
        {
        }
        else if ([WeakRetained cacheImages])
        {
          if (![WeakRetained runningSynchronously])
          {
            uint64_t v35 = 1;
LABEL_24:
            if ([WeakRetained formatImages])
            {
              __int16 v36 = [v8 visualIdenticalityIdentifier];
              v37 = [v36 stringRepresentation];
              +[MRUImageUtilities formatImage:withIdentifier:forDisplayAtSize:useCache:](MRUImageUtilities, "formatImage:withIdentifier:forDisplayAtSize:useCache:", v6, v37, v35, v17, v19);
              id v28 = (id)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
LABEL_30:
                __int16 v40 = [MEMORY[0x1E4F770F0] currentSettings];
                int v41 = [v40 verboseImageLoadingLogging];

                if (v41)
                {
                  __int16 v42 = MCLogCategoryImageLoading();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v43 = objc_opt_class();
                    int v45 = 138413058;
                    uint64_t v46 = v43;
                    __int16 v47 = 2048;
                    id v48 = WeakRetained;
                    __int16 v49 = 2112;
                    id v50 = v28;
                    __int16 v51 = 2112;
                    id v52 = v5;
                    _os_log_impl(&dword_1AE7DF000, v42, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> Vending formatted image %@ to destination %@.", (uint8_t *)&v45, 0x2Au);
                  }
                }
                [WeakRetained setState:5];
                [WeakRetained setFailedLoadingCount:0];
                [WeakRetained setLastFailedArtworkIdentifier:0];
                uint64_t v44 = [v8 visualIdenticalityIdentifier];
                [WeakRetained setLastVendedArtworkIdentifier:v44];

                objc_msgSend(WeakRetained, "setLastVendedScaledFittingSize:", v17, v19);
                __int16 v34 = [WeakRetained imageHandler];
                ((void (**)(void, id, void))v34)[2](v34, v28, 0);
                goto LABEL_35;
              }
              __int16 v38 = MCLogCategoryImageLoading();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                uint64_t v39 = objc_opt_class();
                int v45 = 138412546;
                uint64_t v46 = v39;
                __int16 v47 = 2048;
                id v48 = WeakRetained;
                _os_log_impl(&dword_1AE7DF000, v38, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Failed to format image. Will use original.", (uint8_t *)&v45, 0x16u);
              }
            }
            id v28 = v6;
            goto LABEL_30;
          }
          __int16 v23 = [MEMORY[0x1E4F770F0] currentSettings];
          int v24 = [v23 verboseImageLoadingLogging];

          if (v24)
          {
            id v25 = MCLogCategoryImageLoading();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              int v45 = 138412802;
              uint64_t v46 = objc_opt_class();
              __int16 v47 = 2048;
              id v48 = WeakRetained;
              __int16 v49 = 2112;
              id v50 = v6;
              _os_log_impl(&dword_1AE7DF000, v25, OS_LOG_TYPE_DEFAULT, "[MRUImageLoader] %@<%p> skip caching for image that is already cached in catalog: %@.", (uint8_t *)&v45, 0x20u);
            }
          }
        }
        uint64_t v35 = 0;
        goto LABEL_24;
      }
      [WeakRetained setLastVendedArtworkIdentifier:0];
      v32 = [v8 visualIdenticalityIdentifier];
      [WeakRetained setLastFailedArtworkIdentifier:v32];

      [WeakRetained setState:4];
      uint64_t v33 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        int v45 = 138412802;
        uint64_t v46 = objc_opt_class();
        __int16 v47 = 2048;
        id v48 = WeakRetained;
        __int16 v49 = 2048;
        id v50 = v8;
        _os_log_impl(&dword_1AE7DF000, v33, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Disassociating catalog %p due to oversized artwork.", (uint8_t *)&v45, 0x20u);
      }

      [v5 clearArtworkCatalogs];
      id v28 = [WeakRetained imageHandler];
      id v29 = (void *)MEMORY[0x1E4F28C58];
      id v30 = @"Image exceeds max allowed size.";
      uint64_t v31 = 200;
    }
    else
    {
      [WeakRetained setLastVendedArtworkIdentifier:0];
      __int16 v26 = [v8 visualIdenticalityIdentifier];
      [WeakRetained setLastFailedArtworkIdentifier:v26];

      [WeakRetained setState:3];
      objc_msgSend(WeakRetained, "setFailedLoadingCount:", objc_msgSend(WeakRetained, "failedLoadingCount") + 1);
      if ([WeakRetained failedLoadingCount] >= 3)
      {
        CGFloat v27 = MCLogCategoryImageLoading();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v45 = 138412802;
          uint64_t v46 = objc_opt_class();
          __int16 v47 = 2048;
          id v48 = WeakRetained;
          __int16 v49 = 2048;
          id v50 = v8;
          _os_log_impl(&dword_1AE7DF000, v27, OS_LOG_TYPE_ERROR, "[MRUImageLoader] %@<%p> Disassociating catalog %p due to repeated failures.", (uint8_t *)&v45, 0x20u);
        }

        [v5 clearArtworkCatalogs];
      }
      id v28 = [WeakRetained imageHandler];
      id v29 = (void *)MEMORY[0x1E4F28C58];
      id v30 = @"Catalog returned nil image.";
      uint64_t v31 = 100;
    }
    objc_msgSend(v29, "msv_errorWithDomain:code:debugDescription:", @"MRUImageLoaderError", v31, v30);
    __int16 v34 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void))v28 + 2))(v28, 0, v34);
LABEL_35:
  }
}

- (void)withNoEscapeCheck:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(MRUImageLoader *)self setRunningSynchronously:1];
  v4[2](v4);

  [(MRUImageLoader *)self setRunningSynchronously:0];
}

- (UIView)destination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destination);

  return (UIView *)WeakRetained;
}

- (id)imageHandler
{
  return self->_imageHandler;
}

- (BOOL)cacheImages
{
  return self->_cacheImages;
}

- (void)setCacheImages:(BOOL)a3
{
  self->_cacheImages = a3;
}

- (BOOL)formatImages
{
  return self->_formatImages;
}

- (void)setFormatImages:(BOOL)a3
{
  self->_formatImages = a3;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (MPArtworkDataSourceVisualIdenticality)lastVendedArtworkIdentifier
{
  return self->_lastVendedArtworkIdentifier;
}

- (CGSize)targetFittingSizeForCurrentCatalogConfiguration
{
  double width = self->_targetFittingSizeForCurrentCatalogConfiguration.width;
  double height = self->_targetFittingSizeForCurrentCatalogConfiguration.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTargetFittingSizeForCurrentCatalogConfiguration:(CGSize)a3
{
  self->_targetFittingSizeForCurrentCatalogConfiguration = a3;
}

- (CGSize)lastVendedScaledFittingSize
{
  double width = self->_lastVendedScaledFittingSize.width;
  double height = self->_lastVendedScaledFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastVendedScaledFittingSize:(CGSize)a3
{
  self->_lastVendedScaledFittingSize = a3;
}

- (MPArtworkDataSourceVisualIdenticality)lastFailedArtworkIdentifier
{
  return self->_lastFailedArtworkIdentifier;
}

- (void)setLastFailedArtworkIdentifier:(id)a3
{
}

- (int64_t)failedLoadingCount
{
  return self->_failedLoadingCount;
}

- (void)setFailedLoadingCount:(int64_t)a3
{
  self->_failedLoadingCount = a3;
}

- (CGSize)fittingSize
{
  double width = self->_fittingSize.width;
  double height = self->_fittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFittingSize:(CGSize)a3
{
  self->_fittingSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)deferredFittingSize
{
  double width = self->_deferredFittingSize.width;
  double height = self->_deferredFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDeferredFittingSize:(CGSize)a3
{
  self->_deferredFittingSize = a3;
}

- (double)deferredScale
{
  return self->_deferredScale;
}

- (void)setDeferredScale:(double)a3
{
  self->_deferredScale = a3;
}

- (BOOL)fittingSizeUpdateScheduled
{
  return self->_fittingSizeUpdateScheduled;
}

- (void)setFittingSizeUpdateScheduled:(BOOL)a3
{
  self->_fittingSizeUpdateScheduled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)runningSynchronously
{
  return self->_runningSynchronously;
}

- (void)setRunningSynchronously:(BOOL)a3
{
  self->_runningSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailedArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_lastVendedArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong(&self->_imageHandler, 0);

  objc_destroyWeak((id *)&self->_destination);
}

@end