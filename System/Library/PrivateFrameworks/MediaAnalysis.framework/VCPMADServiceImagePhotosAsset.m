@interface VCPMADServiceImagePhotosAsset
- (BOOL)fromGenerativePlayground;
- (BOOL)hasCachedParseData;
- (BOOL)hasValidSceneProcessing;
- (BOOL)isHighResDecoded;
- (BOOL)isScreenshot;
- (CGSize)resolution;
- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5;
- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7;
- (id).cxx_construct;
- (id)animatedStickerScore;
- (id)asset;
- (id)barcodeObservations;
- (id)cachedParseData;
- (id)documentObservations;
- (id)faces;
- (id)identifier;
- (id)isSensitive;
- (id)location;
- (id)nsfwClassifications;
- (id)photoLibrary;
- (id)resources;
- (id)scenenetClassifications;
- (id)thumbnailResource;
- (int)loadHighResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4;
- (int)loadLowResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4;
- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4;
- (unint64_t)assetType;
- (unsigned)orientation;
- (void)persistOCRMRC;
- (void)setBarcodeObservations:(id)a3;
- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4;
- (void)setDocumentObservations:(id)a3;
@end

@implementation VCPMADServiceImagePhotosAsset

- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPMADServiceImagePhotosAsset;
  v10 = [(VCPMADServiceImageAsset *)&v13 initWithClientBundleID:a4 clientTeamID:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_asset, a3);
  }

  return v11;
}

- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPMADServiceImagePhotosAsset;
  v14 = [(VCPMADServiceImageAsset *)&v19 initWithClientBundleID:a6 clientTeamID:a7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    if (a4) {
      CFTypeRef v16 = CFRetain(a4);
    }
    else {
      CFTypeRef v16 = 0;
    }
    v18 = v16;
    CF<__CVBuffer *>::operator=((const void **)&v15->_pixelBuffer.value_, &v18);
    CF<opaqueCMSampleBuffer *>::~CF(&v18);
    v15->_orientation = a5;
  }

  return v15;
}

- (unint64_t)assetType
{
  return 4;
}

- (id)identifier
{
  return (id)[(PHAsset *)self->_asset localIdentifier];
}

- (id)location
{
  return [(PHAsset *)self->_asset location];
}

- (BOOL)isScreenshot
{
  return ([(PHAsset *)self->_asset mediaSubtypes] >> 2) & 1;
}

- (id)faces
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(PHAsset *)self->_asset faceAnalysisVersion]
    || ([(PHAsset *)self->_asset localIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    if ([(PHAsset *)self->_asset vcp_needsFaceProcessing])
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
        v17 = 0;
        goto LABEL_30;
      }
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[Faces][%@] Asset not processed or outdated", buf, 0xCu);
      }
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[Faces][%@] Re-fetching asset ...", buf, 0xCu);
    }
  }
  v8 = (void *)MEMORY[0x1E4F38EC0];
  id v9 = [(PHAsset *)self->_asset photoLibrary];
  v3 = objc_msgSend(v8, "vcp_fetchOptionsForLibrary:forTaskID:", v9, 3);

  v10 = (void *)MEMORY[0x1E4F38EC0];
  v11 = [(PHAsset *)self->_asset localIdentifier];
  v24 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v13 = [v10 fetchAssetsWithLocalIdentifiers:v12 options:v3];
  v14 = [v13 firstObject];

  if (v14)
  {
    if (objc_msgSend(v14, "vcp_needsFaceProcessing"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          CFTypeRef v16 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[Faces][%@] Asset (re-fetched) not processed or outdated", buf, 0xCu);
        }
LABEL_20:

        goto LABEL_21;
      }
      goto LABEL_21;
    }

LABEL_24:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[Faces][%@] Loading existing results from Photos", buf, 0xCu);
      }
    }
    v21 = [(PHAsset *)self->_asset photoLibrary];
    v3 = [v21 librarySpecificFetchOptions];

    v22 = [MEMORY[0x1E4F39048] fetchFacesInAsset:self->_asset options:v3];
    v17 = [v22 fetchedObjects];

    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[Faces][%@] Failed to fetch asset to check faceAnalysisVersion", buf, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  v17 = 0;
LABEL_29:

LABEL_30:
  return v17;
}

- (id)nsfwClassifications
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  BOOL v3 = [(PHAsset *)self->_asset vcp_needSceneProcessing];
  int v4 = MediaAnalysisLogLevel();
  if (!v3)
  {
    if (v4 >= 7)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[NSFW][%@] Loading existing results from Photos", buf, 0xCu);
      }
    }
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(PHAsset *)self->_asset sceneClassifications];
    uint64_t v10 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v5);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((unint64_t)[v13 extendedSceneIdentifier] > 0x7FFFF8F5
            && (unint64_t)[v13 extendedSceneIdentifier] < 0x7FFFF900)
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    goto LABEL_20;
  }
  if (v4 >= 7)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[NSFW][%@] Asset not processed or outdated", buf, 0xCu);
    }
    v7 = 0;
LABEL_20:

    goto LABEL_22;
  }
  v7 = 0;
LABEL_22:
  return v7;
}

- (id)scenenetClassifications
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PHAsset *)self->_asset vcp_needSceneProcessing];
  int v4 = MediaAnalysisLogLevel();
  if (!v3)
  {
    if (v4 >= 7)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "[SceneNet][%@] Loading existing results from Photos", buf, 0xCu);
      }
    }
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = [(PHAsset *)self->_asset sceneClassifications];
    uint64_t v10 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v24;
      *(void *)&long long v11 = 134217984;
      long long v22 = v11;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v5);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v15 = objc_msgSend(MEMORY[0x1E4F8CD58], "vcp_sharedTaxonomy", v22);
          long long v16 = objc_msgSend(v15, "nodeForExtendedSceneClassId:", objc_msgSend(v14, "extendedSceneIdentifier"));

          if (!v16
            || ([v16 name],
                long long v17 = objc_claimAutoreleasedReturnValue(),
                BOOL v18 = v17 == 0,
                v17,
                v18))
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              objc_super v19 = VCPLogInstance();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = [v14 extendedSceneIdentifier];
                *(_DWORD *)buf = v22;
                uint64_t v29 = v20;
                _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[SceneNet] No scene label name for scene id %llu", buf, 0xCu);
              }
            }
          }
          else
          {
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
    goto LABEL_24;
  }
  if (v4 >= 7)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v6;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[SceneNet][%@] Asset not processed or outdated", buf, 0xCu);
    }
    v7 = 0;
LABEL_24:

    goto LABEL_26;
  }
  v7 = 0;
LABEL_26:
  return v7;
}

- (id)resources
{
  resources = self->_resources;
  if (!resources)
  {
    objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", self->_asset);
    int v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resources;
    self->_resources = v4;

    resources = self->_resources;
  }
  return resources;
}

- (CGSize)resolution
{
  double v3 = (double)[(PHAsset *)self->_asset pixelWidth];
  double v4 = (double)[(PHAsset *)self->_asset pixelHeight];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_highResPixelBuffer.value_ != 0;
}

- (id)isSensitive
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v3 = [(VCPMADServiceImagePhotosAsset *)self nsfwClassifications];
  double v4 = v3;
  if (v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v9, "extendedSceneIdentifier", (void)v20) == 2147481854)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v12 = VCPLogInstance();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                id v13 = [(PHAsset *)self->_asset localIdentifier];
                [v9 confidence];
                *(_DWORD *)buf = 138412546;
                long long v25 = v13;
                __int16 v26 = 2048;
                uint64_t v27 = v14;
                _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: %0.3f", buf, 0x16u);
              }
            }
            long long v15 = NSNumber;
            long long v16 = (void *)MEMORY[0x1E4F9A610];
            long long v17 = VCPSpecialLabelFromExtendedSceneClassificationID([v9 extendedSceneIdentifier]);
            [v9 confidence];
            long long v11 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isImageSensitiveForLabel:confidenceScore:classificationMode:", v17, 2));

            goto LABEL_23;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v25 = v10;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: 0.0", buf, 0xCu);
      }
      long long v11 = (void *)MEMORY[0x1E4F1CC28];
LABEL_23:

      goto LABEL_26;
    }
    long long v11 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BOOL v18 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v25 = v18;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: Unknown", buf, 0xCu);
      }
      long long v11 = 0;
      goto LABEL_23;
    }
    long long v11 = 0;
  }
LABEL_26:

  return v11;
}

- (id)animatedStickerScore
{
  return [(PHAsset *)self->_asset vcp_animatedStickerScore];
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  p_pixelBuffer = &self->_pixelBuffer;
  value = self->_pixelBuffer.value_;
  if (value) {
    goto LABEL_2;
  }
  p_value = (const void **)&p_pixelBuffer->value_;
  id v9 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v9);

  uint64_t v10 = VCPSignPostLog();
  long long v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v12 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(PHAsset *)self->_asset localIdentifier];
      id v15 = [(PHAsset *)self->_asset vcp_typeDescription];
      int v16 = [(PHAsset *)self->_asset mediaType];
      int v17 = [(PHAsset *)self->_asset mediaSubtypes];
      int v18 = [(PHAsset *)self->_asset pixelWidth];
      int v19 = [(PHAsset *)self->_asset pixelHeight];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v78 = 2112;
      *(void *)v79 = v15;
      *(_WORD *)&v79[8] = 1024;
      *(_DWORD *)v80 = v16;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)v81 = v17;
      *(_WORD *)&v81[4] = 1024;
      int v82 = v18;
      __int16 v83 = 1024;
      int v84 = v19;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);
    }
  }
  long long v20 = [(VCPMADServiceImagePhotosAsset *)self resources];
  long long v21 = objc_msgSend(v20, "vcp_highResImageResourcesForAsset:", self->_asset);

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (!v22) {
    goto LABEL_63;
  }
  uint64_t v69 = *(void *)v73;
  uint64_t v67 = *MEMORY[0x1E4F44410];
  uint64_t v66 = *MEMORY[0x1E4F443E0];
  uint64_t v65 = *MEMORY[0x1E4F443E8];
  uint64_t v62 = *MEMORY[0x1E4F44460];
  while (2)
  {
    uint64_t v70 = v22;
    for (uint64_t i = 0; i != v70; ++i)
    {
      if (*(void *)v73 != v69) {
        objc_enumerationMutation(obj);
      }
      long long v24 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        long long v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = [(PHAsset *)self->_asset localIdentifier];
          int v27 = [v24 type];
          int v28 = [v24 pixelWidth];
          int v29 = [v24 pixelHeight];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v26;
          __int16 v78 = 1024;
          *(_DWORD *)v79 = v27;
          *(_WORD *)&v79[4] = 1024;
          *(_DWORD *)&v79[6] = v28;
          *(_WORD *)v80 = 1024;
          *(_DWORD *)&v80[2] = v29;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);
        }
      }
      if (objc_msgSend(v24, "vcp_isLocallyAvailable"))
      {
        uint64_t v30 = objc_msgSend(v24, "vcp_uniformTypeIdentifier");
        if (([v30 conformsToType:v67] & 1) != 0
          || ([v30 conformsToType:v66] & 1) != 0
          || ([v30 conformsToType:v65] & 1) != 0
          || ([v30 conformsToType:v62] & 1) != 0)
        {
          uint64_t v31 = [v24 pixelWidth];
          if ((unint64_t)([v24 pixelHeight] * v31) < 0xCCA6CD)
          {
LABEL_31:
            unint64_t v37 = [(PHAsset *)self->_asset vcp_ocrMajorDimensionForResource:v24];
            v38 = +[VCPImageManager sharedImageManager];
            v39 = [v24 privateFileURL];
            if (v37) {
              *(void *)buf = [v38 pixelBufferWithFormat:875704422 andMaxDimension:v37 fromImageURL:v39 orientation:&self->_orientation];
            }
            else {
              *(void *)buf = [v38 pixelBufferWithFormat:875704422 fromImageURL:v39 flushCache:1 orientation:&self->_orientation];
            }
            CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
            CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

            if (!self->_orientation)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v41 = VCPLogInstance();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = [(PHAsset *)self->_asset localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v42;
                  _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);
                }
              }
              self->_unsigned int orientation = 1;
            }
            if (*p_value)
            {
              if ((int)MediaAnalysisLogLevel() >= 5)
              {
                v49 = VCPLogInstance();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  v50 = [(PHAsset *)self->_asset localIdentifier];
                  int v51 = [v24 type];
                  int Width = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
                  int Height = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
                  unsigned int orientation = self->_orientation;
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v50;
                  __int16 v78 = 1024;
                  *(_DWORD *)v79 = v51;
                  *(_WORD *)&v79[4] = 1024;
                  *(_DWORD *)&v79[6] = Width;
                  *(_WORD *)v80 = 1024;
                  *(_DWORD *)&v80[2] = Height;
                  *(_WORD *)v81 = 1024;
                  *(_DWORD *)&v81[2] = orientation;
                  _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);
                }
              }

              goto LABEL_63;
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v43 = VCPLogInstance();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = [(PHAsset *)self->_asset localIdentifier];
                int v45 = [v24 type];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v44;
                __int16 v78 = 1024;
                *(_DWORD *)v79 = v45;
                _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);
              }
            }
            goto LABEL_48;
          }
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v32 = VCPLogInstance();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = [(PHAsset *)self->_asset localIdentifier];
              int v34 = [v24 pixelWidth];
              int v35 = [v24 pixelHeight];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v33;
              __int16 v78 = 1024;
              *(_DWORD *)v79 = v34;
              *(_WORD *)&v79[4] = 1024;
              *(_DWORD *)&v79[6] = v35;
              _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEFAULT, "[%@] Purging resource cache to load large resource (%dx%d)", buf, 0x18u);
            }
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v46 = VCPLogInstance();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = [(PHAsset *)self->_asset localIdentifier];
            v48 = [v30 identifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v47;
            __int16 v78 = 2112;
            *(void *)v79 = v48;
            _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEFAULT, "[%@] Purging resource cache to load uncommon resource (%@)", buf, 0x16u);
          }
        }
        v36 = +[VCPMADResourceManager sharedManager];
        [v36 purgeInactiveResources];

        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() < 5) {
        continue;
      }
      uint64_t v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v40;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
          buf,
          0xCu);
      }
LABEL_48:
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_63:

  v55 = VCPSignPostLog();
  v56 = v55;
  if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
  {
    v57 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v57;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if (!*p_value)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v58 = VCPLogInstance();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode high-res image resource", buf, 0xCu);
      }
    }

    return -18;
  }

  value = (__CVBuffer *)*p_value;
  if (*p_value)
  {
LABEL_2:
    uint64_t v7 = (__CVBuffer *)CFRetain(value);
    goto LABEL_3;
  }
  uint64_t v7 = 0;
LABEL_3:
  int result = 0;
  *a3 = v7;
  *a4 = self->_orientation;
  return result;
}

- (int)loadLowResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  p_lowResPixelBuffer = &self->_lowResPixelBuffer;
  value = self->_lowResPixelBuffer.value_;
  v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
  if (value) {
    goto LABEL_37;
  }
  id v9 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v9);

  uint64_t v10 = VCPSignPostLog();
  long long v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v12 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v47 = [(PHAsset *)self->_asset localIdentifier];
      id v14 = [(PHAsset *)self->_asset vcp_typeDescription];
      int v15 = [(PHAsset *)self->_asset mediaType];
      int v16 = [(PHAsset *)self->_asset mediaSubtypes];
      int v17 = [(PHAsset *)self->_asset pixelWidth];
      int v18 = [(PHAsset *)self->_asset pixelHeight];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v47;
      __int16 v51 = 2112;
      *(void *)v52 = v14;
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = v15;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)v54 = v16;
      *(_WORD *)&v54[4] = 1024;
      int v55 = v17;
      __int16 v56 = 1024;
      int v57 = v18;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);

      v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
    }
  }
  int v19 = [(VCPMADServiceImagePhotosAsset *)self resources];
  long long v20 = objc_msgSend(v19, "vcp_thumbnailResource");

  if (objc_msgSend(v20, "vcp_isLocallyAvailable"))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      long long v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [(PHAsset *)self->_asset localIdentifier];
        int v23 = [v20 type];
        int v24 = [v20 pixelWidth];
        int v25 = [v20 pixelHeight];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v22;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v23;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v24;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v25;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

        v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
      }
    }
    __int16 v26 = +[VCPImageManager sharedImageManager];
    int v27 = [v20 privateFileURL];
    int v28 = (int *)((char *)self + v8[976]);
    *(void *)buf = [v26 pixelBufferWithFormat:875704422 fromImageURL:v27 flushCache:1 orientation:v28];
    CF<__CVBuffer *>::operator=((const void **)&p_lowResPixelBuffer->value_, (const void **)buf);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

    if (!*v28)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        int v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);
        }
      }
      *int v28 = 1;
    }
    if (p_lowResPixelBuffer->value_)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        uint64_t v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [(PHAsset *)self->_asset localIdentifier];
          int v33 = [v20 type];
          int Width = CVPixelBufferGetWidth(p_lowResPixelBuffer->value_);
          int Height = CVPixelBufferGetHeight(p_lowResPixelBuffer->value_);
          int v36 = *v28;
          *(_DWORD *)buf = 138413314;
          *(void *)&uint8_t buf[4] = v32;
          __int16 v51 = 1024;
          *(_DWORD *)v52 = v33;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = Width;
          *(_WORD *)v53 = 1024;
          *(_DWORD *)&v53[2] = Height;
          *(_WORD *)v54 = 1024;
          *(_DWORD *)&v54[2] = v36;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);

          v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
        }
LABEL_30:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v38 = [(PHAsset *)self->_asset localIdentifier];
        int v39 = [v20 type];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v38;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = v39;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);
      }
      goto LABEL_30;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v31 = VCPLogInstance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v37 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
        buf,
        0xCu);
    }
    goto LABEL_30;
  }
  v40 = VCPSignPostLog();
  v41 = v40;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    v42 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v42;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if (p_lowResPixelBuffer->value_
    || ([(VCPMADServiceImagePhotosAsset *)self loadPixelBuffer:p_lowResPixelBuffer orientation:(char *)self + v8[976]], p_lowResPixelBuffer->value_))
  {

    value = p_lowResPixelBuffer->value_;
    if (!p_lowResPixelBuffer->value_)
    {
      v43 = 0;
      goto LABEL_38;
    }
LABEL_37:
    v43 = (__CVBuffer *)CFRetain(value);
LABEL_38:
    int result = 0;
    *a3 = v43;
    *a4 = *(_DWORD *)((char *)&self->super.super.isa + v8[976]);
    return result;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v45 = VCPLogInstance();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode thumbnail resource", buf, 0xCu);
    }
  }

  return -18;
}

- (int)loadHighResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  p_highResPixelBuffer = &self->_highResPixelBuffer;
  value = self->_highResPixelBuffer.value_;
  if (value) {
    goto LABEL_2;
  }
  p_value = (const void **)&p_highResPixelBuffer->value_;
  v8 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v8);

  id v9 = VCPSignPostLog();
  uint64_t v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    long long v11 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PHAsset *)self->_asset localIdentifier];
      id v14 = [(PHAsset *)self->_asset vcp_typeDescription];
      int v15 = [(PHAsset *)self->_asset mediaType];
      int v16 = [(PHAsset *)self->_asset mediaSubtypes];
      int v17 = [(PHAsset *)self->_asset pixelWidth];
      int v18 = [(PHAsset *)self->_asset pixelHeight];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v96 = 2112;
      *(void *)v97 = v14;
      *(_WORD *)&v97[8] = 1024;
      *(_DWORD *)v98 = v15;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)v99 = v16;
      *(_WORD *)&v99[4] = 1024;
      int v100 = v17;
      __int16 v101 = 1024;
      int v102 = v18;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);
    }
  }
  int v19 = [(VCPMADServiceImagePhotosAsset *)self resources];
  v76 = objc_msgSend(v19, "vcp_highResImageResourcesForAsset:", self->_asset);

  v81 = [MEMORY[0x1E4F1CA48] array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v76;
  uint64_t v20 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (!v20) {
    goto LABEL_47;
  }
  uint64_t v21 = *(void *)v90;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v90 != v21) {
        objc_enumerationMutation(obj);
      }
      int v23 = *(void **)(*((void *)&v89 + 1) + 8 * i);
      uint64_t v24 = [v23 pixelWidth];
      if ([v23 pixelHeight] * v24 <= 10973491)
      {
        [v81 insertObject:v23 atIndex:0];
        continue;
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        int v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = [(PHAsset *)self->_asset localIdentifier];
          int v27 = [v23 type];
          int v28 = [v23 pixelWidth];
          int v29 = [v23 pixelHeight];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v26;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v27;
          *(_WORD *)&v97[4] = 1024;
          *(_DWORD *)&v97[6] = v28;
          *(_WORD *)v98 = 1024;
          *(_DWORD *)&v98[2] = v29;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating high-resolution resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);
        }
      }
      if ((objc_msgSend(v23, "vcp_isLocallyAvailable") & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 5) {
          continue;
        }
        int v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v34;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
            buf,
            0xCu);
        }
        goto LABEL_39;
      }
      unint64_t v30 = [(PHAsset *)self->_asset vcp_majorDimensionForResource:v23 withTargetResolution:12192768];
      uint64_t v31 = +[VCPImageManager sharedImageManager];
      v32 = [v23 privateFileURL];
      if (v30) {
        *(void *)buf = [v31 pixelBufferWithFormat:875704422 andMaxDimension:v30 fromImageURL:v32 orientation:&self->_highResOrientation];
      }
      else {
        *(void *)buf = [v31 pixelBufferWithFormat:875704422 fromImageURL:v32 flushCache:1 orientation:&self->_highResOrientation];
      }
      CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

      if (!self->_highResOrientation)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          int v35 = VCPLogInstance();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int v36 = [(PHAsset *)self->_asset localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v36;
            _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);
          }
        }
        self->_unsigned int highResOrientation = 1;
      }
      if (*p_value)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          int v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [(PHAsset *)self->_asset localIdentifier];
            int v41 = [v23 type];
            int Width = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
            int Height = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
            unsigned int highResOrientation = self->_highResOrientation;
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = v40;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v41;
            *(_WORD *)&v97[4] = 1024;
            *(_DWORD *)&v97[6] = Width;
            *(_WORD *)v98 = 1024;
            *(_DWORD *)&v98[2] = Height;
            *(_WORD *)v99 = 1024;
            *(_DWORD *)&v99[2] = highResOrientation;
            _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);
          }
        }
        goto LABEL_47;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          unint64_t v37 = [(PHAsset *)self->_asset localIdentifier];
          int v38 = [v23 type];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v37;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v38;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);
        }
LABEL_39:

        continue;
      }
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_47:

  if (*p_value) {
    goto LABEL_80;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v80 = v81;
  uint64_t v45 = [v80 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (!v45) {
    goto LABEL_79;
  }
  uint64_t v47 = *(void *)v86;
  *(void *)&long long v46 = 138412546;
  long long v75 = v46;
  while (2)
  {
    uint64_t v48 = 0;
    while (2)
    {
      if (*(void *)v86 != v47) {
        objc_enumerationMutation(v80);
      }
      v49 = *(void **)(*((void *)&v85 + 1) + 8 * v48);
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v50 = VCPLogInstance();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v51 = [(PHAsset *)self->_asset localIdentifier];
          int v52 = [v49 type];
          int v53 = [v49 pixelWidth];
          int v54 = [v49 pixelHeight];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v51;
          __int16 v96 = 1024;
          *(_DWORD *)v97 = v52;
          *(_WORD *)&v97[4] = 1024;
          *(_DWORD *)&v97[6] = v53;
          *(_WORD *)v98 = 1024;
          *(_DWORD *)&v98[2] = v54;
          _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating fall-back resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);
        }
      }
      if (objc_msgSend(v49, "vcp_isLocallyAvailable", v75))
      {
        int v55 = +[VCPImageManager sharedImageManager];
        __int16 v56 = [v49 privateFileURL];
        p_unsigned int highResOrientation = &self->_highResOrientation;
        *(void *)buf = [v55 pixelBufferWithFormat:875704422 fromImageURL:v56 flushCache:1 orientation:&self->_highResOrientation];
        CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

        if (!self->_highResOrientation)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            uint64_t v58 = VCPLogInstance();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              v59 = [(PHAsset *)self->_asset localIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v59;
              _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);
            }
          }
          *p_unsigned int highResOrientation = 1;
        }
        if (*p_value)
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v64 = VCPLogInstance();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v65 = [(PHAsset *)self->_asset localIdentifier];
              int v66 = [v49 type];
              int v67 = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
              int v68 = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
              unsigned int v69 = *p_highResOrientation;
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v65;
              __int16 v96 = 1024;
              *(_DWORD *)v97 = v66;
              *(_WORD *)&v97[4] = 1024;
              *(_DWORD *)&v97[6] = v67;
              *(_WORD *)v98 = 1024;
              *(_DWORD *)&v98[2] = v68;
              *(_WORD *)v99 = 1024;
              *(_DWORD *)&v99[2] = v69;
              _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);
            }
          }
          goto LABEL_79;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          unint64_t v60 = VCPLogInstance();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = [(PHAsset *)self->_asset localIdentifier];
            int v62 = [v49 type];
            *(_DWORD *)buf = v75;
            *(void *)&uint8_t buf[4] = v61;
            __int16 v96 = 1024;
            *(_DWORD *)v97 = v62;
            _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);
          }
          goto LABEL_71;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 5)
      {
        unint64_t v60 = VCPLogInstance();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v63 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v63;
          _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
            buf,
            0xCu);
        }
LABEL_71:
      }
      if (v45 != ++v48) {
        continue;
      }
      break;
    }
    uint64_t v45 = [v80 countByEnumeratingWithState:&v85 objects:v93 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_79:

LABEL_80:
  uint64_t v70 = VCPSignPostLog();
  v71 = v70;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    long long v72 = [(VCPMADServiceImageAsset *)self signpostPayload];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v72;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v71, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);
  }
  if (!*p_value)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v73 = VCPLogInstance();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        long long v74 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v74;
        _os_log_impl(&dword_1BBEDA000, v73, OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode high-res image resource", buf, 0xCu);
      }
    }

    return -18;
  }

  value = (__CVBuffer *)*p_value;
  if (*p_value)
  {
LABEL_2:
    uint64_t v6 = (__CVBuffer *)CFRetain(value);
    goto LABEL_3;
  }
  uint64_t v6 = 0;
LABEL_3:
  int result = 0;
  *a3 = v6;
  *a4 = self->_highResOrientation;
  return result;
}

- (void)persistOCRMRC
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if ([(PHAsset *)self->_asset vcp_needsOCRProcessing])
  {
    int v3 = VCPPhotosMRCCachingEnabled();
    double v4 = @"OCR";
    if (v3) {
      double v4 = @"OCR/MRC";
    }
    double v5 = v4;
    if (self->_documentObservations)
    {
      if (!v3 || self->_barcodeObservations)
      {
        uint64_t v6 = [(PHAsset *)self->_asset adjustmentVersion];

        if (!v6)
        {
          id v9 = VCPLogInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            uint64_t v22 = [(PHAsset *)self->_asset localIdentifier];
            int v23 = [(PHAsset *)self->_asset adjustmentVersion];
            *(_DWORD *)buf = 138412802;
            v50 = v5;
            __int16 v51 = 2112;
            int v52 = v22;
            __int16 v53 = 2112;
            int v54 = v23;
            _os_log_fault_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_FAULT, "[%@][%@] Asset has invalid adjustment version (%@); cannot persist results to Photos",
              buf,
              0x20u);
          }
          goto LABEL_60;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v7 = VCPLogInstance();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v8 = [(PHAsset *)self->_asset localIdentifier];
            *(_DWORD *)buf = 138412546;
            v50 = v5;
            __int16 v51 = 2112;
            int v52 = v8;
            _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "[%@][%@] Persisting results to Photos", buf, 0x16u);
          }
        }
        id v9 = [(NSArray *)self->_documentObservations firstObject];
        uint64_t v10 = [v9 getTranscript];
        BOOL v11 = [v10 length] == 0;

        if (v11)
        {
          if ((int)MediaAnalysisLogLevel() < 7)
          {
            int v17 = 0;
            if (!v3) {
              goto LABEL_56;
            }
LABEL_31:
            if ([(NSArray *)self->_barcodeObservations count])
            {
              int v25 = VCPSignPostLog();
              os_signpost_id_t v26 = os_signpost_id_generate(v25);

              int v27 = VCPSignPostLog();
              int v28 = v27;
              if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VNBarcodeObservation_archive", "", buf, 2u);
              }

              barcodeObservations = self->_barcodeObservations;
              id v47 = 0;
              unint64_t v30 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:barcodeObservations requiringSecureCoding:1 error:&v47];
              uint64_t v31 = v47;
              v32 = VCPSignPostLog();
              int v33 = v32;
              if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_END, v26, "VNBarcodeObservation_archive", "", buf, 2u);
              }

              if (!v30)
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  int v34 = VCPLogInstance();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = [(PHAsset *)self->_asset localIdentifier];
                    *(_DWORD *)buf = 138412546;
                    v50 = @"OCR/MRC";
                    __int16 v51 = 2112;
                    int v52 = v35;
                    _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "[%@][%@] Failed to archive MRC observations", buf, 0x16u);
                  }
                }
                goto LABEL_58;
              }
              goto LABEL_55;
            }
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              uint64_t v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                int v38 = [(PHAsset *)self->_asset localIdentifier];
                *(_DWORD *)buf = 138412546;
                v50 = @"OCR/MRC";
                __int16 v51 = 2112;
                int v52 = v38;
                _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "[%@][%@] No MR Codes recognized; skipping archive/persistence",
                  buf,
                  0x16u);
              }
              unint64_t v30 = 0;
LABEL_55:

LABEL_57:
              int v39 = [(PHAsset *)self->_asset photoLibrary];
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke;
              v44[3] = &unk_1E6299338;
              v44[4] = self;
              v40 = v17;
              uint64_t v45 = v40;
              id v46 = v30;
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke_2;
              v41[3] = &unk_1E629AD18;
              v42 = v5;
              v43 = self;
              uint64_t v31 = v30;
              [v39 performChanges:v44 completionHandler:v41];

              int v17 = v40;
              goto LABEL_58;
            }
LABEL_56:
            unint64_t v30 = 0;
            goto LABEL_57;
          }
          uint64_t v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v24 = [(PHAsset *)self->_asset localIdentifier];
            *(_DWORD *)buf = 138412546;
            v50 = v5;
            __int16 v51 = 2112;
            int v52 = v24;
            _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "[%@][%@] No text recognized; skipping archive/persistence",
              buf,
              0x16u);
          }
          int v17 = 0;
        }
        else
        {
          uint64_t v12 = VCPSignPostLog();
          os_signpost_id_t v13 = os_signpost_id_generate(v12);

          id v14 = VCPSignPostLog();
          int v15 = v14;
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VNDocumentObservation_archive", "", buf, 2u);
          }

          id v48 = 0;
          uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v48];
          int v17 = v48;
          int v18 = VCPSignPostLog();
          int v19 = v18;
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_END, v13, "VNDocumentObservation_archive", "", buf, 2u);
          }

          if (!v16)
          {
            if ((int)MediaAnalysisLogLevel() < 4)
            {
LABEL_59:

LABEL_60:
              goto LABEL_61;
            }
            uint64_t v31 = VCPLogInstance();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v37 = [(PHAsset *)self->_asset localIdentifier];
              *(_DWORD *)buf = 138412546;
              v50 = v5;
              __int16 v51 = 2112;
              int v52 = v37;
              _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[%@][%@] Failed to archive OCR observation", buf, 0x16u);
            }
LABEL_58:

            goto LABEL_59;
          }
          uint64_t v20 = v17;
          int v17 = v16;
        }

        if (!v3) {
          goto LABEL_56;
        }
        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v36 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412546;
          v50 = @"OCR/MRC";
          __int16 v51 = 2112;
          int v52 = v36;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[%@][%@] Deferring persistence until MRC available", buf, 0x16u);
        }
        goto LABEL_60;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412546;
        v50 = v5;
        __int16 v51 = 2112;
        int v52 = v21;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[%@][%@] Deferring persistence until OCR available", buf, 0x16u);
      }
      goto LABEL_60;
    }
LABEL_61:
  }
}

void __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke(void *a1)
{
  id v5 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:*(void *)(a1[4] + 96)];
  uint64_t v3 = a1[5];
  uint64_t v2 = a1[6];
  double v4 = [*(id *)(a1[4] + 96) adjustmentVersion];
  [v5 setCharacterRecognitionData:v3 machineReadableCodeData:v2 algorithmVersion:8 adjustmentVersion:v4];

  if (objc_msgSend(*(id *)(a1[4] + 96), "mad_isEligibleForComputeSync")) {
    objc_msgSend(v5, "setLocalAnalysisStage:", objc_msgSend(*(id *)(a1[4] + 96), "mad_analysisStageAfterCompletingAnalysis:", 10));
  }
}

void __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = [*(id *)(*(void *)(a1 + 40) + 96) localIdentifier];
        int v11 = 138412546;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[%@][%@] Successfully persisted results to Photos", (uint8_t *)&v11, 0x16u);
      }
LABEL_8:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 96) localIdentifier];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Failed to persist results to Photos", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_8;
  }
}

- (id)documentObservations
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_documentObservations)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        double v4 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v4;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[OCR][%@] Checking for existing results from Photos", buf, 0xCu);
      }
    }
    id v5 = [(PHAsset *)self->_asset characterRecognitionProperties];
    if ([v5 algorithmVersion] != 8
      || ([v5 adjustmentVersion],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [(PHAsset *)self->_asset adjustmentVersion],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v6 isEqualToDate:v7],
          v7,
          v6,
          !v8))
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_26;
      }
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v20;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "[OCR][%@] Asset does not have existing results", buf, 0xCu);
      }
LABEL_25:

LABEL_26:
      if (!self->_documentObservations) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v10;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[OCR][%@] Loading existing results from Photos", buf, 0xCu);
      }
    }
    int v11 = [v5 data];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v22;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "[OCR][%@] Photos results exist, but no text was recognized", buf, 0xCu);
        }
      }
      p_super = &self->_documentObservations->super;
      self->_documentObservations = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_25;
    }
    __int16 v13 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v5 data];
    id v28 = 0;
    uint64_t v16 = [v13 unarchivedObjectOfClass:v14 fromData:v15 error:&v28];
    p_super = v28;

    if (v16)
    {
      int v29 = v16;
      int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      int v19 = &self->_documentObservations->super;
      self->_documentObservations = v18;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_16;
      }
      int v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v27;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[OCR][%@] Failed to unarchive existing Photos results", buf, 0xCu);
      }
    }

LABEL_16:
    goto LABEL_25;
  }
LABEL_27:
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v24;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "[OCR][%@] Successfully reused existing results", buf, 0xCu);
    }
  }
LABEL_31:
  documentObservations = self->_documentObservations;
  return documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
  id v7 = a3;
  double v4 = [v7 firstObject];
  if (v4)
  {
    id v5 = (NSArray *)[v7 copy];
    documentObservations = self->_documentObservations;
    self->_documentObservations = v5;

    [(VCPMADServiceImagePhotosAsset *)self persistOCRMRC];
  }
}

- (id)barcodeObservations
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_barcodeObservations)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        double v4 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        int v33 = v4;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[MRC][%@] Checking for existing results from Photos", buf, 0xCu);
      }
    }
    id v5 = [(PHAsset *)self->_asset characterRecognitionProperties];
    if ([v5 algorithmVersion] != 8
      || ([v5 adjustmentVersion],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [(PHAsset *)self->_asset adjustmentVersion],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v6 isEqualToDate:v7],
          v7,
          v6,
          !v8))
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_26;
      }
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        int v33 = v22;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "[MRC][%@] Asset does not have existing results", buf, 0xCu);
      }
LABEL_25:

LABEL_26:
      if (!self->_barcodeObservations) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        int v33 = v10;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[MRC][%@] Loading existing results from Photos", buf, 0xCu);
      }
    }
    int v11 = [v5 machineReadableCodeData];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          int v33 = v24;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[MRC][%@] Photos results exist, but no text was recognized", buf, 0xCu);
        }
      }
      p_super = &self->_barcodeObservations->super;
      self->_barcodeObservations = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_25;
    }
    __int16 v13 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v15 = [v13 setWithArray:v14];

    uint64_t v16 = (void *)MEMORY[0x1E4F28DC0];
    int v17 = [v5 machineReadableCodeData];
    id v30 = 0;
    int v18 = [v16 unarchivedObjectOfClasses:v15 fromData:v17 error:&v30];
    p_super = v30;

    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = &self->_barcodeObservations->super;
      self->_barcodeObservations = v20;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_16;
      }
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = [(PHAsset *)self->_asset localIdentifier];
        *(_DWORD *)buf = 138412290;
        int v33 = v29;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "[MRC][%@] Failed to unarchive existing Photos results", buf, 0xCu);
      }
    }

LABEL_16:
    goto LABEL_25;
  }
LABEL_27:
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      os_signpost_id_t v26 = [(PHAsset *)self->_asset localIdentifier];
      *(_DWORD *)buf = 138412290;
      int v33 = v26;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "[MRC][%@] Successfully reused existing results", buf, 0xCu);
    }
  }
LABEL_31:
  barcodeObservations = self->_barcodeObservations;
  return barcodeObservations;
}

- (void)setBarcodeObservations:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    double v4 = (NSArray *)[v6 copy];
    barcodeObservations = self->_barcodeObservations;
    self->_barcodeObservations = v4;

    [(VCPMADServiceImagePhotosAsset *)self persistOCRMRC];
  }
}

- (BOOL)hasCachedParseData
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  hasCachedParseData = self->_hasCachedParseData;
  if (!hasCachedParseData)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v5 = [(PHAsset *)self->_asset localIdentifier];
        int v24 = 138412290;
        int v25 = v5;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[VS][%@] Checking for existing results from Photos", (uint8_t *)&v24, 0xCu);
      }
    }
    id v6 = [(PHAsset *)self->_asset visualSearchProperties];
    uint64_t v7 = [v6 algorithmVersion];
    if (v7 == (int)VCPPhotosVisualSearchAlgorithmVersion()
      && ([v6 adjustmentVersion],
          int v8 = objc_claimAutoreleasedReturnValue(),
          [(PHAsset *)self->_asset adjustmentVersion],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v8 isEqualToDate:v9],
          v9,
          v8,
          v10))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          BOOL v12 = [(PHAsset *)self->_asset localIdentifier];
          int v24 = 138412290;
          int v25 = v12;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[VS][%@] Loading existing results from Photos", (uint8_t *)&v24, 0xCu);
        }
      }
      __int16 v13 = [v6 visualSearchData];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          int v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [(PHAsset *)self->_asset localIdentifier];
            int v24 = 138412290;
            int v25 = v20;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "[VS][%@] Photos results exist, but empty", (uint8_t *)&v24, 0xCu);
          }
        }
        p_super = &self->_cachedParseData->super;
        self->_cachedParseData = 0;
      }
      else
      {
        uint64_t v15 = [v6 visualSearchData];
        p_super = &self->_cachedParseData->super;
        self->_cachedParseData = v15;
      }
      int v18 = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
        int v18 = (NSNumber *)MEMORY[0x1E4F1CC28];
LABEL_26:
        p_hasCachedParseData = &self->_hasCachedParseData;
        uint64_t v22 = *p_hasCachedParseData;
        *p_hasCachedParseData = v18;

        hasCachedParseData = *p_hasCachedParseData;
        return [(NSNumber *)hasCachedParseData BOOLValue];
      }
      p_super = VCPLogInstance();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        int v17 = [(PHAsset *)self->_asset localIdentifier];
        int v24 = 138412290;
        int v25 = v17;
        _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "[VS][%@] Asset does not have existing results", (uint8_t *)&v24, 0xCu);
      }
      int v18 = (NSNumber *)MEMORY[0x1E4F1CC28];
    }

    goto LABEL_26;
  }
  return [(NSNumber *)hasCachedParseData BOOLValue];
}

- (id)cachedParseData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(VCPMADServiceImagePhotosAsset *)self hasCachedParseData])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        double v4 = [(PHAsset *)self->_asset localIdentifier];
        int v7 = 138412290;
        int v8 = v4;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[VS][%@] Successfully reused existing results", (uint8_t *)&v7, 0xCu);
      }
    }
    id v5 = self->_cachedParseData;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (NSData *)[v6 copy];
  cachedParseData = self->_cachedParseData;
  self->_cachedParseData = v7;

  hasCachedParseData = self->_hasCachedParseData;
  self->_hasCachedParseData = (NSNumber *)MEMORY[0x1E4F1CC38];

  if ([(PHAsset *)self->_asset vcp_needsVisualSearchProcessing] || v4)
  {
    int v10 = [(PHAsset *)self->_asset adjustmentVersion];

    if (v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          BOOL v12 = [(PHAsset *)self->_asset localIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v12;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "[VS][%@] Persisting results to Photos", buf, 0xCu);
        }
      }
      __int16 v13 = [(PHAsset *)self->_asset photoLibrary];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke;
      v18[3] = &unk_1E62982E8;
      v18[4] = self;
      id v19 = v6;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke_2;
      v17[3] = &unk_1E629AD40;
      v17[4] = self;
      [v13 performChanges:v18 completionHandler:v17];
    }
    else
    {
      BOOL v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        uint64_t v15 = [(PHAsset *)self->_asset localIdentifier];
        uint64_t v16 = [(PHAsset *)self->_asset adjustmentVersion];
        [(VCPMADServiceImagePhotosAsset *)v15 setCachedParseData:buf overwriteExisting:v14];
      }
    }
  }
}

void __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:*(void *)(*(void *)(a1 + 32) + 96)];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = VCPPhotosVisualSearchAlgorithmVersion();
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 96) adjustmentVersion];
  [v5 setVisualSearchData:v2 algorithmVersion:v3 adjustmentVersion:v4];

  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "vcp_needsStickerGatingProcessing") & 1) == 0
    && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "mad_isEligibleForComputeSync"))
  {
    objc_msgSend(v5, "setLocalAnalysisStage:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "mad_analysisStageAfterCompletingAnalysis:", 12));
  }
}

void __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = [*(id *)(*(void *)(a1 + 32) + 96) localIdentifier];
        int v9 = 138412290;
        int v10 = v7;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[VS][%@] Successfully persisted results to Photos", (uint8_t *)&v9, 0xCu);
      }
LABEL_8:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(*(void *)(a1 + 32) + 96) localIdentifier];
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[VS][%@] Failed to persist results to Photos", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_8;
  }
}

- (id)thumbnailResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(VCPMADServiceImagePhotosAsset *)self resources];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 type] == 102)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)asset
{
  return self->_asset;
}

- (id)photoLibrary
{
  return (id)[(PHAsset *)self->_asset photoLibrary];
}

- (BOOL)hasValidSceneProcessing
{
  uint64_t v2 = [(VCPMADServiceImagePhotosAsset *)self asset];
  char v3 = objc_msgSend(v2, "vcp_needSceneProcessing") ^ 1;

  return v3;
}

- (BOOL)fromGenerativePlayground
{
  uint64_t v2 = [(PHAsset *)self->_asset photosInfoPanelExtendedProperties];
  char v3 = [v2 generativeAIType];
  BOOL v4 = [v3 integerValue] == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_hasCachedParseData, 0);
  objc_storeStrong((id *)&self->_barcodeObservations, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_highResPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lowResPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 18) = 0;
  return self;
}

- (void)setCachedParseData:(uint8_t *)buf overwriteExisting:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "[VS][%@] Asset has invalid adjustment version (%@); cannot persist results to Photos",
    buf,
    0x16u);
}

@end