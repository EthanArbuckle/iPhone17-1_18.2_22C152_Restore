@interface VCPPhotosAsset
+ (id)assetWithPHAsset:(id)a3;
+ (id)assetWithPHAsset:(id)a3 downloadedData:(id)a4;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)slomoRange;
- (BOOL)isMovieResourceLocalAvailable;
- (BOOL)isShortMovie;
- (CGSize)originalMovieSize;
- (NSArray)resources;
- (VCPPhotosAsset)initWithPHAsset:(id)a3 downloadedData:(id)a4;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3;
- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4;
- (double)duration;
- (float)originalPhotoOffsetSeconds;
- (float)photoOffsetSeconds;
- (float)slowmoRate;
- (id)allScenes;
- (id)exif;
- (id)faces;
- (id)localIdentifier;
- (id)mainFileURL;
- (id)modificationDate;
- (id)movie;
- (id)originalMovie;
- (id)scenes;
- (id)streamedMovie:(BOOL)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
@end

@implementation VCPPhotosAsset

- (VCPPhotosAsset)initWithPHAsset:(id)a3 downloadedData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPPhotosAsset;
  v9 = [(VCPPhotosAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_downloadedData, a4);
  }

  return v10;
}

+ (id)assetWithPHAsset:(id)a3 downloadedData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPHAsset:v5 downloadedData:v6];

  return v7;
}

+ (id)assetWithPHAsset:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() assetWithPHAsset:v3 downloadedData:0];

  return v4;
}

- (int64_t)mediaType
{
  return [(PHAsset *)self->_asset mediaType];
}

- (unint64_t)mediaSubtypes
{
  return [(PHAsset *)self->_asset mediaSubtypes];
}

- (unint64_t)pixelWidth
{
  return [(PHAsset *)self->_asset pixelWidth];
}

- (unint64_t)pixelHeight
{
  return [(PHAsset *)self->_asset pixelHeight];
}

- (id)modificationDate
{
  return [(PHAsset *)self->_asset vcp_modificationDate];
}

- (NSArray)resources
{
  cachedResources = self->_cachedResources;
  if (!cachedResources)
  {
    objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", self->_asset);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_cachedResources;
    self->_cachedResources = v4;

    cachedResources = self->_cachedResources;
  }
  return cachedResources;
}

- (id)localIdentifier
{
  return (id)[(PHAsset *)self->_asset localIdentifier];
}

- (id)mainFileURL
{
  v2 = [(VCPPhotosAsset *)self resources];
  id v3 = objc_msgSend(v2, "vcp_originalResource");
  v4 = [v3 privateFileURL];

  return v4;
}

- (id)allScenes
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PHAsset *)self->_asset localIdentifier];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F39288];
    v10[0] = self->_asset;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v6 = [v4 fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v5];

    id v7 = [(PHAsset *)self->_asset localIdentifier];
    id v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)scenes
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceScenes)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedScenes = v2->_cachedScenes;
    v2->_cachedScenes = (NSMutableDictionary *)v3;

    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [(PHAsset *)v2->_asset localIdentifier];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F39288];
      v35[0] = v2->_asset;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      v9 = [v7 fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v8];

      v10 = [(PHAsset *)v2->_asset localIdentifier];
      v11 = [v9 objectForKeyedSubscript:v10];
      [v5 addObjectsFromArray:v11];
    }
    if (v5)
    {
      if ((unint64_t)[v5 count] >= 0xB)
      {
        [v5 sortUsingComparator:&__block_literal_global_40];
        objc_super v12 = objc_msgSend(v5, "subarrayWithRange:", 0, 10);
        uint64_t v13 = [v12 mutableCopy];

        id v5 = (void *)v13;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v14 = v5;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v29;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
            v19 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy");
            v20 = objc_msgSend(v19, "mad_sceneNameFromExtendedSceneId:", objc_msgSend(v18, "extendedSceneIdentifier"));

            if (v20)
            {
              v21 = NSNumber;
              [v18 confidence];
              v22 = objc_msgSend(v21, "numberWithDouble:");
              [(NSMutableDictionary *)v2->_cachedScenes setObject:v22 forKeyedSubscript:v20];
LABEL_14:

              goto LABEL_15;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = [v18 extendedSceneIdentifier];
                *(_DWORD *)buf = 134217984;
                uint64_t v34 = v23;
                _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "Scene identifier %llu has no name; ignoring",
                  buf,
                  0xCu);
              }
              goto LABEL_14;
            }
LABEL_15:

            ++v17;
          }
          while (v15 != v17);
          uint64_t v24 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
          uint64_t v15 = v24;
        }
        while (v24);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_23;
      }
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v27 = [(PHAsset *)v2->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = (uint64_t)v27;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "  [%@] No scene classification result fetched from pre analysis", buf, 0xCu);
      }
    }

LABEL_23:
    v2->_onceScenes = 1;
  }
  objc_sync_exit(v2);

  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v2->_cachedScenes];
  return v25;
}

uint64_t __24__VCPPhotosAsset_scenes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  double v7 = v6;
  [v5 confidence];
  if (v7 <= v8)
  {
    [v4 confidence];
    double v11 = v10;
    [v5 confidence];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)faces
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PHAsset *)self->_asset photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  [v4 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v4 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  uint64_t v5 = *MEMORY[0x1E4F39620];
  v10[0] = *MEMORY[0x1E4F39630];
  v10[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F39638];
  void v10[2] = *MEMORY[0x1E4F39610];
  v10[3] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  [v4 setFetchPropertySets:v7];

  double v8 = [MEMORY[0x1E4F39048] fetchFacesInAsset:self->_asset options:v4];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedData, 0);
  objc_storeStrong((id *)&self->_cachedScenes, 0);
  objc_storeStrong((id *)&self->_cachedExif, 0);
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)exif
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_onceExif)
  {
    uint64_t v3 = [(VCPPhotosAsset *)v2 resources];
    id v4 = objc_msgSend(v3, "vcp_localPhotoResourcesSorted:", -[PHAsset hasAdjustments](v2->_asset, "hasAdjustments"));

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v16 = v4;
    uint64_t v5 = [v4 reverseObjectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        if (objc_msgSend(v9, "vcp_isDecodable"))
        {
          double v10 = (void *)MEMORY[0x1E4F1C9E8];
          double v11 = [v9 privateFileURL];
          uint64_t v12 = objc_msgSend(v10, "vcp_exifFromImageURL:", v11);
          cachedExif = v2->_cachedExif;
          v2->_cachedExif = (NSDictionary *)v12;

          if (v2->_cachedExif) {
            break;
          }
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v2->_onceExif = 1;
  }
  objc_sync_exit(v2);

  v14 = v2->_cachedExif;
  return v14;
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3
{
  return [(VCPPhotosAsset *)self imageWithPreferredDimension:a3 orientation:0];
}

- (__CVBuffer)imageWithPreferredDimension:(unint64_t)a3 orientation:(unsigned int *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v9 = [(VCPPhotosAsset *)self resources];
  double v10 = objc_msgSend(v9, "vcp_localPhotoResourcesSorted:", -[PHAsset hasAdjustments](self->_asset, "hasAdjustments"));

  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v14, "vcp_fileSize") <= 0x800000
          && objc_msgSend(v14, "vcp_isDecodable"))
        {
          objc_msgSend(v14, "vcp_size");
          if (v15 < v16) {
            double v15 = v16;
          }
          if (v15 >= (double)a3) {
            long long v17 = v8;
          }
          else {
            long long v17 = v7;
          }
          [v17 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  long long v18 = +[VCPImageManager sharedImageManager];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (__CVBuffer *)[v18 imageForResource:*(void *)(*((void *)&v34 + 1) + 8 * j) pixelFormat:875704422 maxDimension:a3 orientation:a4];
        if (v23)
        {
          uint64_t v24 = v19;
          goto LABEL_35;
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v24 = [v7 reverseObjectEnumerator];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    obuint64_t j = v24;
    uint64_t v26 = *(void *)v31;
LABEL_26:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v31 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = (__CVBuffer *)[v18 imageForResource:*(void *)(*((void *)&v30 + 1) + 8 * v27) pixelFormat:875704422 maxDimension:a3 orientation:a4];
      if (v23) {
        break;
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v25) {
          goto LABEL_26;
        }
        uint64_t v23 = 0;
        break;
      }
    }
    uint64_t v24 = obj;
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_35:

  return v23;
}

- (float)photoOffsetSeconds
{
  float v3 = 0.0;
  if ([(VCPAsset *)self isLivePhoto])
  {
    id v4 = [(PHAsset *)self->_asset photoIrisProperties];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 photoIrisStillDisplayTime];
      double Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)VCPPhotosAsset;
      [(VCPAsset *)&v9 photoOffsetSeconds];
      double Seconds = v7;
    }
    float v3 = Seconds;
  }
  return v3;
}

- (float)originalPhotoOffsetSeconds
{
  float v3 = 0.0;
  if (![(VCPAsset *)self isLivePhoto]) {
    return v3;
  }
  if ([(PHAsset *)self->_asset hasAdjustments])
  {
    id v4 = [(VCPPhotosAsset *)self resources];
    uint64_t v5 = objc_msgSend(v4, "vcp_originalVideoResource");

    if (v5 && [v5 isLocallyAvailable])
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F166C8];
      float v7 = [v5 privateFileURL];
      uint64_t v8 = [v6 assetWithURL:v7];

      if (v8) {
        [v8 duration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      double Seconds = CMTimeGetSeconds(&time);
      uint64_t v11 = [(VCPPhotosAsset *)self movie];
      uint64_t v12 = v11;
      if (v11) {
        [v11 duration];
      }
      else {
        memset(&v16, 0, sizeof(v16));
      }
      double v13 = vabdd_f64(Seconds, CMTimeGetSeconds(&v16));

      if (v13 < 0.00999999978)
      {
        memset(&v15[1], 0, sizeof(CMTime));
        if (v8)
        {
          objc_msgSend(v8, "vcp_livePhotoStillDisplayTime");
          if (v15[1].flags)
          {
            v15[0] = v15[1];
            float v3 = CMTimeGetSeconds(v15);

            goto LABEL_19;
          }
        }
      }
    }
    [(VCPPhotosAsset *)self photoOffsetSeconds];
    float v3 = v14;
LABEL_19:

    return v3;
  }
  [(VCPPhotosAsset *)self photoOffsetSeconds];
  return result;
}

- (BOOL)isShortMovie
{
  return [(PHAsset *)self->_asset vcp_isShortMovie];
}

- (double)duration
{
  [(PHAsset *)self->_asset duration];
  return result;
}

- (float)slowmoRate
{
  v2 = [(VCPPhotosAsset *)self resources];
  objc_msgSend(v2, "vcp_getFpsRate");
  float v4 = v3;

  return v4;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)slomoRange
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double result = ($D854FC4CDD8DDEA9B2859E823A7C8A75 *)[(VCPAsset *)self isSlowmo];
  if (result)
  {
    uint64_t v6 = [(VCPPhotosAsset *)self resources];
    float v7 = objc_msgSend(v6, "vcp_adjustmentsResource");
    uint64_t v8 = [v7 privateFileURL];

    if (v8)
    {
      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CE10]) initWithURL:v8];
      double v10 = v9;
      if (v9 && ([v9 hasSlowMotionAdjustments] & 1) != 0)
      {
        [v10 slowMotionTimeRange];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          double v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            float v14 = [(VCPPhotosAsset *)self localIdentifier];
            int v21 = 138412290;
            uint64_t v22 = v14;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No slow-mo timestamp mapping file found", (uint8_t *)&v21, 0xCu);
          }
        }
        uint64_t v15 = MEMORY[0x1E4F1FA20];
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
        *(_OWORD *)&retstr->var0.var3 = v16;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v15 + 32);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = [(VCPPhotosAsset *)self localIdentifier];
          int v21 = 138412290;
          uint64_t v22 = v18;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[MediaAnalysis][%@] No slow-mo timestamp mapping file URL found", (uint8_t *)&v21, 0xCu);
        }
      }
      uint64_t v19 = MEMORY[0x1E4F1FA20];
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&retstr->var0.var3 = v20;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v19 + 32);
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F1FA20];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v11 + 32);
  }
  return result;
}

- (id)movie
{
  float v3 = [(VCPPhotosAsset *)self resources];
  if ([(PHAsset *)self->_asset vcp_isVideoSlowmo])
  {
    float v4 = objc_msgSend(v3, "vcp_originalResource");
    if ([(PHAsset *)self->_asset vcp_hasAdjustments:v3]
      || !objc_msgSend(v4, "vcp_isLocallyAvailable")
      || (objc_msgSend(v4, "vcp_avAsset"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v6 = [(PHAsset *)self->_asset vcp_hasAdjustments:v3];
      if (objc_msgSend(v3, "vcp_hasLocalSlowmo:", v6)
        && (objc_msgSend(v3, "vcp_avAsset:", v6), (float v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v8 = objc_msgSend(v3, "vcp_adjustmentsResource");
        [(PHAsset *)self->_asset duration];
        uint64_t v5 = objc_msgSend(v7, "vcp_assetWithoutAdjustments:duration:", v8);
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(v3, "vcp_avAsset:", -[PHAsset hasAdjustments](self->_asset, "hasAdjustments"));
  }

  return v5;
}

- (BOOL)isMovieResourceLocalAvailable
{
  asset = self->_asset;
  float v4 = [(VCPPhotosAsset *)self resources];
  uint64_t v5 = [(PHAsset *)asset vcp_hasAdjustments:v4];

  BOOL v6 = [(VCPPhotosAsset *)self resources];
  float v7 = objc_msgSend(v6, "vcp_localMovieResourcesSorted:", v5);
  LOBYTE(v5) = [v7 count] != 0;

  return v5;
}

- (id)streamedMovie:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCPPhotosAsset *)self resources];
  BOOL v6 = objc_msgSend(v5, "vcp_smallMovieDerivativeResource");

  if (v6)
  {
    if (a3 || !_os_feature_enabled_impl())
    {
      double v10 = +[VCPDownloadManager sharedManager];
      objc_super v9 = [v10 requestDownloadOfResource:v6];

      if (!v9)
      {
LABEL_16:
        uint64_t v11 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (!self->_downloadedData && (int)MediaAnalysisLogLevel() >= 3)
      {
        float v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = [(PHAsset *)self->_asset localIdentifier];
          int v14 = 138412290;
          uint64_t v15 = v8;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[%@] Asset has not been downloaded.", (uint8_t *)&v14, 0xCu);
        }
      }
      objc_super v9 = self->_downloadedData;
      if (!v9) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = +[VCPInMemoryAVAsset assetWithData:v9];
LABEL_17:

    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    VCPLogInstance();
    objc_super v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [(PHAsset *)self->_asset localIdentifier];
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1BBEDA000, &v9->super, OS_LOG_TYPE_DEFAULT, "[%@] Asset has no small video derivative; cannot download",
        (uint8_t *)&v14,
        0xCu);
    }
    goto LABEL_16;
  }
  uint64_t v11 = 0;
LABEL_18:

  return v11;
}

- (id)originalMovie
{
  v2 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allResourcesForAsset:", self->_asset);
  float v3 = objc_msgSend(v2, "vcp_originalVideoResource");

  if (objc_msgSend(v3, "vcp_isLocallyAvailable"))
  {
    float v4 = objc_msgSend(v3, "vcp_avAsset");
  }
  else
  {
    float v4 = 0;
  }

  return v4;
}

- (CGSize)originalMovieSize
{
  v2 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allResourcesForAsset:", self->_asset);
  float v3 = objc_msgSend(v2, "vcp_originalVideoResource");

  objc_msgSend(v3, "vcp_size");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end