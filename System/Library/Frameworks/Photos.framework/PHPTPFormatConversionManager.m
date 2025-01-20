@interface PHPTPFormatConversionManager
- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6;
- (BOOL)initialized;
- (BOOL)peerSupportsAdjustmentBaseResources;
- (BOOL)peerSupportsTranscodeChoice;
- (BOOL)penultimateIsPublic;
- (BOOL)setupTemporaryDirectory;
- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers;
- (NSURL)temporaryDirectoryURL;
- (PFMediaCapabilities)peerMediaCapabilities;
- (PHMediaFormatConversionManager)mediaFormatConversionManager;
- (PHPTPFormatConversionManager)init;
- (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6;
- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3;
- (id)effectivePeerMediaCapabilites;
- (id)ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6;
- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6;
- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5;
- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5;
- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4;
- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setMediaFormatConversionManager:(id)a3;
- (void)setPeerMediaCapabilities:(id)a3;
- (void)setPenultimateIsPublic:(BOOL)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
@end

@implementation PHPTPFormatConversionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedLivePhotoPairingIdentifiersByOriginalIdentifiers, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);

  objc_storeStrong((id *)&self->_legacyCapabilities, 0);
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3
{
}

- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaFormatConversionManager:(id)a3
{
}

- (PHMediaFormatConversionManager)mediaFormatConversionManager
{
  return (PHMediaFormatConversionManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerMediaCapabilities:(id)a3
{
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPenultimateIsPublic:(BOOL)a3
{
  self->_penultimateIsPublic = a3;
}

- (id)effectivePeerMediaCapabilites
{
  BOOL v3 = [(PHPTPFormatConversionManager *)self peerSupportsTranscodeChoice];
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 8;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);

  return v5;
}

- (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    v13 = self->_legacyCapabilities;
  }
  else
  {
    v13 = [(PHPTPFormatConversionManager *)self effectivePeerMediaCapabilites];
  }
  v14 = v13;
  v15 = +[PHPTPConversionHelper conversionResultForPTPAsset:v10 sourceHints:v11 withConversionManager:self->_mediaFormatConversionManager peerCapabilities:v13];
  v16 = PLPTPGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v10 resourceHandle];
    v18 = [v17 localIdentifier];
    int v20 = 138543874;
    v21 = v18;
    __int16 v22 = 2114;
    id v23 = v12;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "Media conversion result for asset %{public}@ (%{public}@): %{public}@", (uint8_t *)&v20, 0x20u);
  }

  return v15;
}

- (BOOL)penultimateIsPublic
{
  return self->_penultimateIsPublic;
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportForAdjustmentBaseResources] == 1;
}

- (BOOL)peerSupportsTranscodeChoice
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportsTranscodeChoice];
}

- (void)invalidate
{
  id v2 = [(PHPTPFormatConversionManager *)self mediaFormatConversionManager];
  [v2 invalidate];
}

- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = (void *)MEMORY[0x1E4F748C0];
  id v11 = (void *)*MEMORY[0x1E4F44410];
  id v12 = a3;
  v13 = [v11 identifier];
  LOBYTE(a6) = objc_msgSend(v10, "generatePosterFrameExportForVideoURL:outputData:maximumSize:outputFileType:error:", v12, a4, v13, a6, width, height);

  return (char)a6;
}

- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHPTPFormatConversionManager *)self convertedLivePhotoPairingIdentifiersByOriginalIdentifiers];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    BOOL v7 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v7 UUIDString];

    v8 = [(PHPTPFormatConversionManager *)self convertedLivePhotoPairingIdentifiersByOriginalIdentifiers];
    [v8 setObject:v6 forKeyedSubscript:v4];

    v9 = PLPTPGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "Cached converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "Using converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  if (v7) {
    [MEMORY[0x1E4F74900] videoSourceForFileURL:v8];
  }
  else {
  v9 = objc_msgSend(MEMORY[0x1E4F74900], "imageSourceForFileURL:dimensions:", v8, width, height);
  }

  return v9;
}

- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = -[PHPTPFormatConversionManager sourceForPath:isVideo:imageDimensions:](self, "sourceForPath:isVideo:imageDimensions:", v9, v7, width, height);
  id v11 = (void *)MEMORY[0x1E4F748F8];
  int v12 = [(PHPTPFormatConversionManager *)self effectivePeerMediaCapabilites];
  id v17 = 0;
  id v13 = [v11 requestForSource:v10 destinationCapabilities:v12 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    v15 = PLPTPGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v14;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
    }
  }

  return v13;
}

- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4
{
  id v6 = a4;
  BOOL v7 = -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  v8 = v7;
  if (v7)
  {
    [v7 setOutputFilename:v6];
    [v8 setLivePhotoPairingIdentifierBehavior:1];
    [v8 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v8;
}

- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 0, width, height);
  id v11 = v10;
  if (v10)
  {
    [v10 setOutputFilename:v9];
    [v11 setLivePhotoPairingIdentifierBehavior:1];
    [v11 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v11;
}

- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  BOOL v8 = a4;
  id v11 = a6;
  int v12 = -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, v8, width, height);
  if (v12)
  {
    if (v11)
    {
      id v13 = [(PHPTPFormatConversionManager *)self convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:v11];
      [v12 setLivePhotoPairingIdentifier:v13];
      [v12 setLivePhotoPairingIdentifierBehavior:4];
    }
    [v12 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v12;
}

- (id)ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(PHPTPFormatConversionManager *)self initialized])
  {
    uint64_t v15 = [v11 isMovie];
    uint64_t v16 = [v12 ptpProperties];
    id v17 = [v16 livePhotoPairingIdentifier];

    v18 = [v12 ptpProperties];
    double v19 = (double)(unint64_t)[v18 originalWidth];
    __int16 v20 = [v12 ptpProperties];
    double v21 = (double)(unint64_t)[v20 originalHeight];

    uint64_t v22 = [v11 resourceHandle];
    uint64_t v23 = [v22 resourceType];

    uint64_t v24 = v15;
    switch(v23)
    {
      case 3:
      case 4:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 16:
      case 17:
        goto LABEL_6;
      case 5:
        v30 = -[PHPTPFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v14, 0, v17, v19, v21);
        [v11 imagePixSize];
        double v32 = v31;
        double v34 = v33;
        v35 = [v11 filename];
        v36 = -[PHPTPFormatConversionManager requestForRenderImagePath:imageDimensions:outputFilename:](self, "requestForRenderImagePath:imageDimensions:outputFilename:", v13, v35, v32, v34);

        id v55 = 0;
        uint64_t v37 = [MEMORY[0x1E4F748E8] chainedRequestForAdjustmentRenderRequest:v36 dependingOnRequest:v30 error:&v55];
        id v38 = v55;
        v51 = (void *)v37;
        if (!v37)
        {
          id v50 = v38;
          v39 = PLPTPGetLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = (uint64_t)v13;
            __int16 v58 = 2114;
            uint64_t v59 = (uint64_t)v50;
            _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
          }

          id v38 = v50;
        }

        v40 = v51;
        if (!v51) {
          break;
        }
        goto LABEL_34;
      case 6:
        v41 = [v11 filename];
        v40 = [(PHPTPFormatConversionManager *)self requestForRenderVideoPath:v13 outputFilename:v41];

        if (!v40) {
          break;
        }
        goto LABEL_34;
      case 9:
        uint64_t v24 = 1;
        goto LABEL_28;
      case 13:
      case 14:
      case 15:
      case 19:
      case 20:
        v25 = PLPTPGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v57 = v23;
          _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
        }

        goto LABEL_6;
      case 18:
        goto LABEL_28;
      default:
        if (v23 == 108 || (uint64_t v24 = v15, v23 == 113))
        {
LABEL_6:
          uint64_t v26 = PLPTPGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v57 = 0;
            __int16 v58 = 2048;
            uint64_t v59 = v23;
            _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Ignoring conversion request %{public}@ for unknown asset type %ld", buf, 0x16u);
          }
          v27 = 0;
LABEL_9:

          goto LABEL_13;
        }
LABEL_28:
        v52 = -[PHPTPFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v13, v24, v17, v19, v21);
        v42 = [v11 resourceHandle];
        int v43 = [v42 requiresConversion];

        v40 = v52;
        if (v43)
        {
          [v52 setForceFormatConversion:1];
          if (!v15)
          {
LABEL_30:
            if (!v52) {
              break;
            }
            goto LABEL_34;
          }
        }
        else if (!v15)
        {
          goto LABEL_30;
        }
        v44 = [(PHPTPFormatConversionManager *)self mediaFormatConversionManager];
        [v44 preflightConversionRequest:v52];

        [v52 enableSinglePassVideoEncodingWithUpdateHandler:&__block_literal_global_3565];
        if (v52)
        {
LABEL_34:
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __121__PHPTPFormatConversionManager_ptpAssetReaderForFormatConvertedPTPAsset_ofPhotosAsset_resourcePath_originalResourcePath___block_invoke_64;
          block[3] = &unk_1E5848578;
          uint64_t v26 = v40;
          v54 = v26;
          dispatch_block_t v45 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          v46 = [(PHPTPFormatConversionManager *)self mediaFormatConversionManager];
          [v46 enqueueConversionRequest:v26 completionHandler:v45];

          if (([v26 requiresSinglePassVideoConversion] & 1) != 0
            || (dispatch_block_wait(v45, 0xFFFFFFFFFFFFFFFFLL), [v26 status] == 4))
          {
            v47 = [PHPTPConversionDestinationAssetReader alloc];
            v48 = [v26 destination];
            v27 = [(PHPTPConversionDestinationAssetReader *)v47 initWithDestination:v48];
          }
          else
          {
            v48 = PLPTPGetLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v49 = [v26 error];
              *(_DWORD *)buf = 138543874;
              uint64_t v57 = (uint64_t)v26;
              __int16 v58 = 2048;
              uint64_t v59 = v23;
              __int16 v60 = 2114;
              v61 = v49;
              _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_ERROR, "Conversion request %{public}@ for asset type %ld failed: %{public}@", buf, 0x20u);
            }
            v27 = 0;
          }

          goto LABEL_9;
        }
        break;
    }
  }
  else
  {
    id v17 = PLPTPGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = (uint64_t)v28;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Ignoring request %{public}@ to conversion manager in failed state", buf, 0xCu);
    }
  }
  v27 = 0;
LABEL_13:

  return v27;
}

void __121__PHPTPFormatConversionManager_ptpAssetReaderForFormatConvertedPTPAsset_ofPhotosAsset_resourcePath_originalResourcePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  BOOL v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Single pass video conversion update, status: %ld, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
  id v10 = 0;
  char v5 = [v3 removeItemAtURL:v4 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    BOOL v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to remove temporary directory %@: %{public}@", buf, 0x16u);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)PHPTPFormatConversionManager;
  [(PHPTPFormatConversionManager *)&v9 dealloc];
}

- (BOOL)setupTemporaryDirectory
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@-%d", v5, getpid()];

  BOOL v7 = NSTemporaryDirectory();
  int v8 = [v7 stringByAppendingPathComponent:v6];

  objc_super v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  [(PHPTPFormatConversionManager *)self setTemporaryDirectoryURL:v9];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v29 = 0;
  id v11 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
  uint64_t v12 = [v11 path];
  int v13 = [v10 fileExistsAtPath:v12 isDirectory:&v29];

  if (v13)
  {
    int v14 = v29;
    uint64_t v15 = PLPTPGetLog();
    uint64_t v16 = v15;
    if (v14)
    {
      BOOL v17 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v18 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
        *(_DWORD *)buf = 138412290;
        double v31 = v18;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_INFO, "Conversion manager temporary directory path already exists: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412290;
      double v31 = v26;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Conversion manager temporary directory path exists but is not directory %@", buf, 0xCu);
    }
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  double v19 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
  id v28 = 0;
  int v20 = [v10 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v28];
  uint64_t v16 = v28;

  double v21 = PLPTPGetLog();
  uint64_t v22 = v21;
  if (!v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412546;
      double v31 = v25;
      __int16 v32 = 2112;
      double v33 = v16;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Unable to create conversion manager temporary directory %@: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = [(PHPTPFormatConversionManager *)self temporaryDirectoryURL];
    uint64_t v24 = [v23 path];
    *(_DWORD *)buf = 138412290;
    double v31 = v24;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_INFO, "Created conversion manager temporary directory %@", buf, 0xCu);
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (PHPTPFormatConversionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PHPTPFormatConversionManager;
  id v2 = [(PHPTPFormatConversionManager *)&v10 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PHPTPFormatConversionManager *)v2 setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:v3];

    id v4 = objc_opt_new();
    [(PHPTPFormatConversionManager *)v2 setMediaFormatConversionManager:v4];

    if ([(PHPTPFormatConversionManager *)v2 setupTemporaryDirectory])
    {
      temporaryDirectoryURL = v2->_temporaryDirectoryURL;
      id v6 = [(PHPTPFormatConversionManager *)v2 mediaFormatConversionManager];
      [v6 setDirectoryForTemporaryFiles:temporaryDirectoryURL];

      [(PHPTPFormatConversionManager *)v2 setInitialized:1];
      v2->_penultimateIsPublic = 0;
    }
    uint64_t v7 = [MEMORY[0x1E4F8CC30] legacyCapabilities];
    legacyCapabilities = v2->_legacyCapabilities;
    v2->_legacyCapabilities = (PFMediaCapabilities *)v7;
  }
  return v2;
}

@end