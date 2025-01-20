@interface PHPhotoLibrary(MediaAnalysis)
+ (id)vcp_defaultMediaAnalysisDatabaseFilepath;
+ (id)vcp_defaultPhotoLibrary;
+ (id)vcp_defaultURL;
+ (uint64_t)mad_clusterVideoFaces;
+ (uint64_t)mad_isProcessingNeededOnAsset:()MediaAnalysis forTaskID:;
+ (uint64_t)mad_maxIgnoredAssetsToMarkAsProcessed;
- (BOOL)mad_calculateProgressPercentage:()MediaAnalysis totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:;
- (BOOL)mad_performChangesAndWait:()MediaAnalysis cancelBlock:extendTimeoutBlock:error:;
- (BOOL)mad_useVUGallery;
- (BOOL)vcp_anyAssetsForTaskID:()MediaAnalysis;
- (BOOL)vcp_isSyndicationLibrary;
- (__CFString)vcp_description;
- (__CFString)vcp_libraryScaleShortDescription;
- (__CFString)vcp_mediaAnalysisDirectory;
- (id)_analysisPreferencesURL;
- (id)mad_allFacesFetchOptions;
- (id)mad_allPersonsFetchOptions;
- (id)mad_allPersonsFetchOptionsWithDetectionTypes:()MediaAnalysis andVerifiedTypes:;
- (id)mad_cloudIdentifierForLocalIdentifier:()MediaAnalysis error:;
- (id)mad_clusteredAndUnidentifiedFacesFetchOptions;
- (id)mad_clusteredFacesFetchOptions;
- (id)mad_localIdentifierForCloudIdentifier:()MediaAnalysis error:;
- (id)mad_unclusteredFacesFetchOptions;
- (id)vcp_analysisPreferences;
- (id)vcp_faceAnalysisStateFilepath;
- (id)vcp_mediaAnalysisDatabaseFilepath;
- (id)vcp_vipModelFilepathForVIPType:()MediaAnalysis;
- (id)vcp_vipModelLastGenerationDateForVIPType:()MediaAnalysis;
- (id)vcp_visionCacheStorageDirectoryURL;
- (uint64_t)mad_countOfUnclusteredFaces;
- (uint64_t)mad_faceProcessingInternalVersion;
- (uint64_t)mad_pauseFCPeopleFurtherProcessing;
- (uint64_t)vcp_allowInMemoryDownload;
- (uint64_t)vcp_assetCountForTaskID:()MediaAnalysis;
- (uint64_t)vcp_assetCountForTaskID:()MediaAnalysis withPriority:;
- (uint64_t)vcp_assetCountWithInternalPredicate:()MediaAnalysis forTaskID:;
- (uint64_t)vcp_assetCountWithMediaType:()MediaAnalysis forTaskID:;
- (uint64_t)vcp_eligibleForStreaming:()MediaAnalysis;
- (uint64_t)vcp_isCPLDownloadComplete;
- (uint64_t)vcp_isCPLSyncComplete;
- (uint64_t)vcp_libraryScale;
- (uint64_t)vcp_processedAssetCountForTaskID:()MediaAnalysis;
- (uint64_t)vcp_processedAssetCountForTaskID:()MediaAnalysis withPriority:;
- (uint64_t)vcp_requiredFaceLibraryProcessingSubTasks;
- (uint64_t)vcp_requiresDownloadForTask:()MediaAnalysis;
- (uint64_t)vcp_requiresProcessingForTask:()MediaAnalysis;
- (uint64_t)vcp_supportsInMemoryDownload;
- (void)_mad_markAsProcessedByTask:()MediaAnalysis forAsset:;
- (void)_updateAnalysisPreferencesWithEntries:()MediaAnalysis keysToRemove:;
- (void)mad_markAsProcessedByTask:()MediaAnalysis forAssets:;
- (void)vcp_setAnalysisPreferencesValue:()MediaAnalysis forKey:;
@end

@implementation PHPhotoLibrary(MediaAnalysis)

+ (id)vcp_defaultPhotoLibrary
{
  v0 = +[VCPDefaultPhotoLibraryManager sharedManager];
  v1 = [v0 defaultPhotoLibrary];

  return v1;
}

+ (id)vcp_defaultURL
{
  v0 = objc_msgSend((id)objc_opt_class(), "vcp_defaultPhotoLibrary");
  v1 = [v0 photoLibraryURL];

  return v1;
}

+ (id)vcp_defaultMediaAnalysisDatabaseFilepath
{
  v0 = objc_msgSend((id)objc_opt_class(), "vcp_defaultPhotoLibrary");
  v1 = objc_msgSend(v0, "vcp_mediaAnalysisDatabaseFilepath");

  return v1;
}

+ (uint64_t)mad_maxIgnoredAssetsToMarkAsProcessed
{
  return 100;
}

+ (uint64_t)mad_isProcessingNeededOnAsset:()MediaAnalysis forTaskID:
{
  id v5 = a3;
  if (a4 <= 0x10 && ((1 << a4) & 0x1140E) != 0 || a4 == 255) {
    uint64_t v6 = [MEMORY[0x1E4F39220] additionalCheckForProcessingNeededForAsset:v5 taskID:PHMediaProcessingTaskIDForVCPTaskID(a4) priority:0];
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

- (__CFString)vcp_mediaAnalysisDirectory
{
  v2 = [a1 photoLibraryURL];
  if (v2)
  {
    if ([a1 isSystemPhotoLibrary])
    {
      v3 = @"/var/mobile/Media/MediaAnalysis";
    }
    else
    {
      v4 = [v2 path];
      v3 = [v4 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/MediaAnalysis"];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vcp_mediaAnalysisDatabaseFilepath
{
  v1 = objc_msgSend(a1, "vcp_mediaAnalysisDirectory");
  v2 = v1;
  if (v1)
  {
    v3 = [v1 stringByAppendingPathComponent:@"mediaanalysis.db"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)vcp_anyAssetsForTaskID:()MediaAnalysis
{
  v3 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", a1, a3);
  [v3 setShouldPrefetchCount:1];
  [v3 setFetchLimit:1];
  v4 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (uint64_t)vcp_assetCountForTaskID:()MediaAnalysis withPriority:
{
  if (a3 == 10)
  {
    objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
    float v7 = v9;
  }
  else
  {
    float v7 = 0.0;
    if (a3 == 3)
    {
      objc_msgSend(MEMORY[0x1E4F38EC0], "mad_peopleThreshold");
      float v7 = v8;
    }
  }
  uint64_t v10 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  uint64_t v13 = 0;
  *(float *)&double v11 = v7;
  return [a1 countOfAllAssetsForMediaProcessingTaskID:v10 priority:a4 sceneConfidenceThreshold:&v13 error:v11];
}

- (uint64_t)vcp_assetCountForTaskID:()MediaAnalysis
{
  return objc_msgSend(a1, "vcp_assetCountForTaskID:withPriority:", a3, 0);
}

- (uint64_t)vcp_processedAssetCountForTaskID:()MediaAnalysis withPriority:
{
  if (a3 == 10)
  {
    objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_ocrGatingThreshold");
    float v7 = v9;
  }
  else
  {
    float v7 = 0.0;
    if (a3 == 3)
    {
      objc_msgSend(MEMORY[0x1E4F38EC0], "mad_peopleThreshold");
      float v7 = v8;
    }
  }
  uint64_t v10 = PHMediaProcessingTaskIDForVCPTaskID(a3);
  double v11 = objc_msgSend(MEMORY[0x1E4F39158], "mad_sharedVersionProviderWithPhotoLibrary:", a1);
  uint64_t v15 = 0;
  *(float *)&double v12 = v7;
  uint64_t v13 = [a1 countOfProcessedAssetsForMediaProcessingTaskID:v10 priority:a4 algorithmVersion:v11 sceneConfidenceThreshold:&v15 error:v12];

  return v13;
}

- (uint64_t)vcp_processedAssetCountForTaskID:()MediaAnalysis
{
  return objc_msgSend(a1, "vcp_processedAssetCountForTaskID:withPriority:", a3, 0);
}

- (uint64_t)vcp_assetCountWithMediaType:()MediaAnalysis forTaskID:
{
  v4 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", a1);
  [v4 setShouldPrefetchCount:1];
  BOOL v5 = [MEMORY[0x1E4F38EC0] fetchAssetsWithMediaType:a3 options:v4];
  uint64_t v6 = [v5 count];

  return v6;
}

- (uint64_t)vcp_assetCountWithInternalPredicate:()MediaAnalysis forTaskID:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", a1, a4);
  [v7 setShouldPrefetchCount:1];
  if (a4 == 16 || a4 == 12)
  {
    [v7 setPredicate:0];
    float v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
    [v7 setInternalPredicate:v8];
  }
  else
  {
    if (a4 != 10) {
      goto LABEL_7;
    }
    [v7 setPredicate:0];
    float v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype != %d", 1);
    [v7 setInternalPredicate:v8];
  }

LABEL_7:
  uint64_t v9 = [v7 internalPredicate];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    v16[0] = v6;
    v16[1] = v9;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    double v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v11];
    [v7 setInternalPredicate:v12];
  }
  else
  {
    [v7 setInternalPredicate:v6];
  }
  uint64_t v13 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v7];
  uint64_t v14 = [v13 count];

  return v14;
}

- (BOOL)mad_calculateProgressPercentage:()MediaAnalysis totalAssetCount:progressPercentageWithFailure:taskID:phTaskID:priority:failedAssetCount:error:
{
  int v12 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F38EC0], "mad_sceneConfidenceThresholdForTask:", a6);
  int v18 = v17;
  id v36 = 0;
  unint64_t v19 = objc_msgSend(a1, "countOfAllAssetsForMediaProcessingTaskID:priority:sceneConfidenceThreshold:error:", a7, a8, &v36);
  id v20 = v36;
  if (v20)
  {
    v21 = v20;
    if (a10) {
      *a10 = (id)[v20 copy];
    }
    if (a3) {
      *a3 = 0;
    }
    BOOL v22 = 0;
    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    v34 = objc_msgSend(MEMORY[0x1E4F39158], "mad_sharedVersionProviderWithPhotoLibrary:", a1);
    id v35 = 0;
    LODWORD(v23) = v18;
    uint64_t v33 = [a1 countOfProcessedAssetsForMediaProcessingTaskID:a7 priority:a8 algorithmVersion:v34 sceneConfidenceThreshold:&v35 error:v23];
    id v24 = v35;
    v21 = v24;
    BOOL v22 = v24 == 0;
    if (v24)
    {
      if (a10) {
        *a10 = (id)[v24 copy];
      }
      if (a3) {
        *a3 = 0;
      }
      if (a5) {
        *a5 = 0;
      }
    }
    else
    {
      if (a4) {
        *a4 = v19;
      }
      if (a3)
      {
        unint64_t v25 = v19 ? 100 * v33 / v19 : 0;
        *a3 = v25;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v26 = VCPLogInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v27 = *a3;
            *(_DWORD *)buf = 67109888;
            int v38 = v27;
            __int16 v39 = 1024;
            int v40 = v12;
            __int16 v41 = 1024;
            int v42 = a7;
            __int16 v43 = 1024;
            int v44 = a8;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "Progress percentage %d for task-%d, phTask-%d, priority-%d", buf, 0x1Au);
          }
        }
      }
      if (a5)
      {
        if (v19)
        {
          unint64_t v28 = v33 + a9;
          if (v19 < v33 + a9) {
            unint64_t v28 = v19;
          }
          unint64_t v29 = 100 * v28 / v19;
        }
        else
        {
          unint64_t v29 = 0;
        }
        *a5 = v29;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v31 = *a5;
            *(_DWORD *)buf = 67109888;
            int v38 = v31;
            __int16 v39 = 1024;
            int v40 = v12;
            __int16 v41 = 1024;
            int v42 = a7;
            __int16 v43 = 1024;
            int v44 = a8;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "Progress percentage with failure %d for task-%d, phTask-%d, priority-%d", buf, 0x1Au);
          }
        }
      }
    }
  }
  return v22;
}

- (uint64_t)vcp_isCPLSyncComplete
{
  v2 = [a1 cplStatus];
  v3 = [v2 lastSuccessfulSyncDate];
  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    BOOL v5 = [a1 cplStatus];
    uint64_t v4 = [v5 isExceedingQuota];
  }
  return v4;
}

- (uint64_t)vcp_isCPLDownloadComplete
{
  v2 = [a1 cplStatus];
  v3 = [v2 lastCompletePrefetchDate];
  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    BOOL v5 = [a1 cplStatus];
    uint64_t v4 = [v5 isExceedingQuota];
  }
  return v4;
}

- (uint64_t)vcp_eligibleForStreaming:()MediaAnalysis
{
  uint64_t result = objc_msgSend(a1, "vcp_isCPLEnabled");
  if (result)
  {
    if (!a3) {
      return 1;
    }
    uint64_t result = objc_msgSend(a1, "vcp_isCPLDownloadComplete");
    if (result) {
      return 1;
    }
  }
  return result;
}

- (uint64_t)vcp_supportsInMemoryDownload
{
  if ([a1 isCloudPhotoLibraryEnabled]) {
    return 1;
  }
  return objc_msgSend(a1, "vcp_isSyndicationLibrary");
}

- (uint64_t)vcp_allowInMemoryDownload
{
  if (!objc_msgSend(a1, "vcp_supportsInMemoryDownload")) {
    return 0;
  }
  v1 = +[VCPInternetReachability sharedInstance];
  uint64_t v2 = [v1 hasWifiOrEthernetConnection];

  return v2;
}

- (uint64_t)vcp_libraryScale
{
  unint64_t v2 = objc_msgSend(a1, "vcp_assetCountWithMediaType:forTaskID:", 1, 1);
  unint64_t v3 = objc_msgSend(a1, "vcp_assetCountWithMediaType:forTaskID:", 2, 1);
  if (v3 >= 0x7D0 || v2 >= 0x7D0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  if (v3 >> 3 >= 0x271 || v2 >> 3 >= 0x271) {
    return v5;
  }
  else {
    return 1;
  }
}

- (__CFString)vcp_libraryScaleShortDescription
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "vcp_libraryScale");
  if ((unint64_t)(v1 - 1) < 3) {
    return off_1E62987D0[v1 - 1];
  }
  uint64_t v3 = v1;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "Unknown library scale %lu", (uint8_t *)&v5, 0xCu);
    }
  }
  return @"L";
}

- (id)mad_cloudIdentifierForLocalIdentifier:()MediaAnalysis error:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  float v8 = [a1 cloudIdentifierMappingsForLocalIdentifiers:v7];

  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 cloudIdentifier];
  double v11 = [v10 stringValue];

  if (a4 && !v11)
  {
    int v12 = [v9 error];
    *a4 = (id)[v12 copy];
  }
  return v11;
}

- (id)mad_localIdentifierForCloudIdentifier:()MediaAnalysis error:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F38FD8]) initWithStringValue:v6];
  v15[0] = v7;
  float v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v9 = [a1 localIdentifierMappingsForCloudIdentifiers:v8];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];
  uint64_t v11 = [v10 localIdentifier];
  int v12 = (void *)v11;
  if (a4 && !v11)
  {
    uint64_t v13 = [v10 error];
    *a4 = (id)[v13 copy];
  }
  return v12;
}

- (void)_mad_markAsProcessedByTask:()MediaAnalysis forAsset:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    float v8 = [v6 adjustmentVersion];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:v7];
      switch(a3)
      {
        case 1:
          if (+[VCPVideoCaptionAnalyzer mode] == 1) {
            [v9 setGeneratedAssetDescription:&stru_1F15A0D70 analysisVersion:70 sourceType:2];
          }
          [v9 setMediaAnalysisVersion:70];
          if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
            [v9 setVideoEmbeddingVersion:70];
          }
          break;
        case 2:
          __int16 v15 = VCPPhotosSceneProcessingVersionInternal();
          v16 = [v7 adjustmentVersion];
          [v9 setSceneClassifications:0 ofType:0 version:v15 timestamp:v16];

          if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]) {
            [v9 setImageEmbeddingVersion:70];
          }
          break;
        case 3:
          -[NSObject setFaceAnalysisVersion:](v9, "setFaceAnalysisVersion:", (__int16)objc_msgSend(a1, "mad_faceProcessingInternalVersion"));
          int v17 = [v7 faceAdjustmentVersion];
          [v9 setFaceAdjustmentVersion:v17];
          goto LABEL_28;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 11:
          goto LABEL_18;
        case 10:
          int v17 = [v7 adjustmentVersion];
          [v9 setCharacterRecognitionData:0 machineReadableCodeData:0 algorithmVersion:8 adjustmentVersion:v17];
          goto LABEL_28;
        case 12:
          int v18 = VCPPhotosVisualSearchAlgorithmVersion();
          unint64_t v19 = [v7 adjustmentVersion];
          [v9 setVisualSearchData:0 algorithmVersion:v18 adjustmentVersion:v19];

          [v9 setStickerConfidenceScore:1 stickerAlgorithmVersion:0.0];
          break;
        default:
          if (a3 == 16)
          {
            int v17 = [v7 adjustmentVersion];
            [v9 setSceneClassifications:0 ofType:5 version:5 timestamp:v17];
LABEL_28:
          }
          else if (a3 == 255)
          {
            if (+[VCPVideoCaptionAnalyzer mode] == 1) {
              [v9 setGeneratedAssetDescription:&stru_1F15A0D70 analysisVersion:70 sourceType:1];
            }
            [v9 setMediaAnalysisImageVersion:70];
            if (objc_msgSend(v7, "mad_isNonLivePhotoImage")) {
              [v9 setMediaAnalysisVersion:70];
            }
          }
          else
          {
LABEL_18:
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              int v12 = VCPLogInstance();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                id v13 = (id)objc_opt_class();
                uint64_t v14 = [v7 localIdentifier];
                int v20 = 138412802;
                id v21 = v13;
                __int16 v22 = 2112;
                double v23 = v14;
                __int16 v24 = 2048;
                uint64_t v25 = a3;
                _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[%@][%@] Unsupported taskID %lu", (uint8_t *)&v20, 0x20u);
              }
            }
          }
          break;
      }
    }
    else
    {
      uint64_t v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v10 = [v7 localIdentifier];
        uint64_t v11 = [v7 creationDate];
        [(PHPhotoLibrary(MediaAnalysis) *)v10 _mad_markAsProcessedByTask:(uint8_t *)&v20 forAsset:v9];
      }
    }
  }
  else
  {
    uint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[PHPhotoLibrary(MediaAnalysis) _mad_markAsProcessedByTask:forAsset:](v9);
    }
  }
}

- (void)mad_markAsProcessedByTask:()MediaAnalysis forAssets:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = [v6 count];
      __int16 v25 = 2048;
      uint64_t v26 = a3;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "Started marking %lu assets as processed for taskID %lu", buf, 0x16u);
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PHPhotoLibrary_MediaAnalysis__mad_markAsProcessedByTask_forAssets___block_invoke;
  v19[3] = &unk_1E6298650;
  id v8 = v6;
  id v20 = v8;
  id v21 = a1;
  uint64_t v22 = a3;
  id v18 = 0;
  int v9 = [a1 performChangesAndWait:v19 error:&v18];
  id v10 = v18;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v8 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v24 = v12;
        __int16 v25 = 2048;
        uint64_t v26 = a3;
        id v13 = "Successfully marked %lu assets as processed for taskID %lu";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
LABEL_12:
        _os_log_impl(&dword_1BBEDA000, v14, v15, v13, buf, v16);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v8 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v24 = v17;
      __int16 v25 = 2048;
      uint64_t v26 = a3;
      __int16 v27 = 2112;
      id v28 = v10;
      id v13 = "Failed to mark %lu assets as processed for taskID %lu :%@";
      uint64_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
      goto LABEL_12;
    }
LABEL_13:
  }
}

- (BOOL)mad_performChangesAndWait:()MediaAnalysis cancelBlock:extendTimeoutBlock:error:
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v10 = a4;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PHPhotoLibrary_MediaAnalysis__mad_performChangesAndWait_cancelBlock_extendTimeoutBlock_error___block_invoke;
  aBlock[3] = &unk_1E6298760;
  id v46 = v10;
  id v66 = v46;
  id v12 = v11;
  id v67 = v12;
  id v13 = (unsigned int (**)(void))_Block_copy(aBlock);
  uint64_t v14 = v13;
  if (!v13 || !v13[2](v13))
  {
    uint64_t v45 = [MEMORY[0x1E4F1C9C8] now];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_INFO, "[PhotosDBPersistence] Starting ...", buf, 2u);
      }
    }
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    *(void *)buf = 0;
    v56 = buf;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__17;
    v59 = __Block_byref_object_dispose__17;
    id v60 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __96__PHPhotoLibrary_MediaAnalysis__mad_performChangesAndWait_cancelBlock_extendTimeoutBlock_error___block_invoke_540;
    v53[3] = &unk_1E6298788;
    id v54 = v47;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __96__PHPhotoLibrary_MediaAnalysis__mad_performChangesAndWait_cancelBlock_extendTimeoutBlock_error___block_invoke_541;
    v48[3] = &unk_1E62987B0;
    id v17 = v45;
    id v49 = v17;
    v51 = &v61;
    v52 = buf;
    uint64_t v22 = v21;
    v50 = v22;
    [a1 performChanges:v53 completionHandler:v48];
    while (1)
    {
      dispatch_time_t v23 = dispatch_time(0, 5000000000);
      if (!dispatch_semaphore_wait(v22, v23)) {
        break;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[PhotosDBPersistence][Thread] Waiting ...", v68, 2u);
        }
      }
      if (v14 && v14[2](v14))
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          unint64_t v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v68 = 0;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[PhotosDBPersistence][Thread] Canceled while waiting", v68, 2u);
          }
        }
        v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        id v28 = objc_msgSend(NSString, "stringWithFormat:", @"[PhotosDBPersistence][Thread] Canceled while waiting", v45, v46);
        v75 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        uint64_t v30 = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v29];
        goto LABEL_32;
      }
      objc_msgSend(v17, "timeIntervalSinceNow", v45, v46);
      if (v25 < -300.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          uint64_t v26 = VCPLogInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v68 = 0;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "[PhotosDBPersistence][Thread] Timeout while waiting", v68, 2u);
          }
        }
        __int16 v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        id v28 = [NSString stringWithFormat:@"[PhotosDBPersistence][Thread] Timeout while waiting"];
        v73 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v30 = [v27 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v29];
LABEL_32:
        uint64_t v33 = (void *)*((void *)v56 + 5);
        *((void *)v56 + 5) = v30;

        break;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v34 = VCPLogInstance();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "[PhotosDBPersistence][Thread] Returning ...", v68, 2u);
      }
    }
    if (a6)
    {
      id v35 = (void *)*((void *)v56 + 5);
      if (v35) {
        *a6 = (id)[v35 copy];
      }
    }
    objc_msgSend(v17, "timeIntervalSinceNow", v45);
    double v37 = -v36;
    if (*((unsigned char *)v62 + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        int v38 = VCPLogInstance();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v68 = 134217984;
          double v69 = v37;
          __int16 v39 = "[PhotosDBPersistence] Finished with success after %.2f seconds";
          int v40 = v38;
          os_log_type_t v41 = OS_LOG_TYPE_INFO;
          uint32_t v42 = 12;
LABEL_47:
          _os_log_impl(&dword_1BBEDA000, v40, v41, v39, v68, v42);
          goto LABEL_48;
        }
        goto LABEL_48;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v38 = VCPLogInstance();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = *((void *)v56 + 5);
        *(_DWORD *)v68 = 134218242;
        double v69 = v37;
        __int16 v70 = 2112;
        uint64_t v71 = v43;
        __int16 v39 = "[PhotosDBPersistence] Finished with failures after %.2f seconds - %@";
        int v40 = v38;
        os_log_type_t v41 = OS_LOG_TYPE_ERROR;
        uint32_t v42 = 22;
        goto LABEL_47;
      }
LABEL_48:
    }
    BOOL v19 = *((unsigned char *)v62 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v61, 8);
    goto LABEL_50;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[PhotosDBPersistence] Canceled before start", buf, 2u);
    }
  }
  if (!a6)
  {
    BOOL v19 = 0;
    goto LABEL_51;
  }
  uint32_t v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v76 = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithFormat:@"[PhotosDBPersistence] Canceled before start"];
  v77[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
  *a6 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v18];

  BOOL v19 = 0;
LABEL_50:

LABEL_51:
  return v19;
}

- (id)vcp_visionCacheStorageDirectoryURL
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_sync_enter(v1);
  unint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 processName];

  if ([v3 isEqualToString:@"mediaanalysisd"])
  {
    uint64_t v4 = [v1 urlForApplicationDataFolderIdentifier:2];
    if (v4)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v4;
          __int16 v21 = 2112;
          id v22 = v1;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "Retrieving Vision cache storage directory URL %@ for photoLibrary %@", buf, 0x16u);
        }
      }
      id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = 0;
      char v7 = [v6 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v18];
      id v8 = v18;

      if ((v7 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        int v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v20 = v4;
          __int16 v21 = 2112;
          id v22 = v1;
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Failed to create Vision cache storage directory URL %@ for photoLibrary %@ - %@", buf, 0x20u);
        }
      }
      id v10 = (void *)v4;
      goto LABEL_29;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = (uint64_t)v1;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "No Vision cache storage directory URL for photoLibrary %@", buf, 0xCu);
      }
    }
    id v10 = 0;
LABEL_28:
    id v8 = 0;
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"mediaanalysisd-service"])
  {
    if ([v1 isSystemPhotoLibrary])
    {
      id v10 = [v1 urlForApplicationDataFolderIdentifier:2];
      id v8 = 0;
      goto LABEL_29;
    }
    os_log_type_t v15 = [v1 photoLibraryURL];
    id v10 = [v15 URLByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision"];

    goto LABEL_28;
  }
  id v11 = [MEMORY[0x1E4F74680] service];
  id v12 = [v1 photoLibraryURL];
  id v17 = 0;
  id v10 = [v11 requestApplicationDataFolderIdentifierVisionServiceWithPhotosLibraryURL:v12 error:&v17];
  id v8 = v17;

  if (!v10 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = (uint64_t)v1;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to query Vision cache storage directory URL for photoLibrary %@ - %@", buf, 0x16u);
    }
  }
LABEL_29:

  objc_sync_exit(v1);
  return v10;
}

- (id)_analysisPreferencesURL
{
  id v1 = objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
  unint64_t v2 = [v1 URLByAppendingPathComponent:@"PhotoAnalysisServicePreferences.plist"];

  return v2;
}

- (id)vcp_analysisPreferences
{
  unint64_t v2 = [a1 _analysisPreferencesURL];
  id v3 = a1;
  objc_sync_enter(v3);
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2];
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_updateAnalysisPreferencesWithEntries:()MediaAnalysis keysToRemove:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _analysisPreferencesURL];
  if (v8)
  {
    id v9 = a1;
    objc_sync_enter(v9);
    id v10 = objc_msgSend(v9, "vcp_analysisPreferences");
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v10 count]) {
      [v11 addEntriesFromDictionary:v10];
    }
    if ([v6 count]) {
      [v11 addEntriesFromDictionary:v6];
    }
    if ([v7 count]) {
      [v11 removeObjectsForKeys:v7];
    }
    if ([v11 isEqual:v10]) {
      goto LABEL_21;
    }
    id v19 = 0;
    id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:&v19];
    id v13 = v19;
    uint64_t v14 = v13;
    if (v12)
    {
      id v18 = v13;
      char v15 = [v12 writeToURL:v8 options:1073741825 error:&v18];
      id v16 = v18;

      if ((v15 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v9;
          __int16 v22 = 2112;
          id v23 = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Unable to write library analysis preferences for %@: %@", buf, 0x16u);
        }
        uint64_t v14 = v16;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v14 = v16;
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Unable to serialize library analysis preferences for %@: %@", buf, 0x16u);
      }
      goto LABEL_19;
    }
LABEL_20:

LABEL_21:
    objc_sync_exit(v9);
  }
}

- (void)vcp_setAnalysisPreferencesValue:()MediaAnalysis forKey:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      id v12 = v7;
      v13[0] = v6;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [a1 _updateAnalysisPreferencesWithEntries:v9 keysToRemove:0];
    }
    else
    {
      id v11 = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      [a1 _updateAnalysisPreferencesWithEntries:0 keysToRemove:v9];
    }
LABEL_8:

    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Key for setLibraryAnalysisPreferencesValue is nil", v10, 2u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)vcp_vipModelFilepathForVIPType:()MediaAnalysis
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "vcp_isSyndicationLibrary"))
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
    id v6 = objc_msgSend(v5, "vcp_visionCacheStorageDirectoryURL");
    id v7 = [v6 absoluteURL];
  }
  else
  {
    int v5 = objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
    id v7 = [v5 absoluteURL];
  }

  if (a3 == 1)
  {
    id v8 = [v7 path];
    id v9 = +[VCPFaceIDModel petVIPModelFileName];
    uint64_t v10 = [v8 stringByAppendingPathComponent:v9];
    goto LABEL_8;
  }
  if (!a3)
  {
    id v8 = [v7 path];
    id v9 = +[VCPFaceIDModel personVIPModelFileName];
    uint64_t v10 = [v8 stringByAppendingPathComponent:v9];
LABEL_8:
    id v11 = (void *)v10;

    goto LABEL_14;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134217984;
      uint64_t v15 = a3;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch VIP model file path with unknown VCPMAVIPType (%lu)", (uint8_t *)&v14, 0xCu);
    }
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (id)vcp_vipModelLastGenerationDateForVIPType:()MediaAnalysis
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "vcp_analysisPreferences");
  int v5 = v4;
  if (a3 == 1)
  {
    id v6 = [v4 objectForKeyedSubscript:@"PetIDModelLastGenerationKey"];
    if (!v6)
    {
LABEL_12:
      id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
      goto LABEL_13;
    }
LABEL_6:
    id v7 = v6;
LABEL_13:
    id v9 = v7;

    goto LABEL_14;
  }
  if (!a3)
  {
    id v6 = [v4 objectForKeyedSubscript:@"FaceIDModelLastGenerationKey"];
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      uint64_t v12 = a3;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch VIP model last generation date with unknown VCPMAVIPType (%lu)", (uint8_t *)&v11, 0xCu);
    }
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

- (id)vcp_faceAnalysisStateFilepath
{
  id v1 = objc_msgSend(a1, "vcp_visionCacheStorageDirectoryURL");
  unint64_t v2 = [v1 absoluteURL];

  id v3 = [v2 path];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"faceWorkerState.plist"];

  return v4;
}

+ (uint64_t)mad_clusterVideoFaces
{
  return 1;
}

- (uint64_t)mad_faceProcessingInternalVersion
{
  id v1 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:a1];
  uint64_t v2 = [v1 currentProcessingVersion];

  return v2;
}

- (BOOL)mad_useVUGallery
{
  return (_os_feature_enabled_impl() & 1) != 0
      || objc_msgSend(a1, "mad_faceProcessingInternalVersion") == 15;
}

- (uint64_t)mad_pauseFCPeopleFurtherProcessing
{
  return 0;
}

- (id)mad_unclusteredFacesFetchOptions
{
  uint64_t v2 = [a1 librarySpecificFetchOptions];
  [v2 setIncludeNonvisibleFaces:1];
  [v2 setIncludeTorsoOnlyDetectionData:1];
  [v2 setIncludeOnlyFacesWithFaceprints:1];
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    [v2 setIncludedDetectionTypes:&unk_1F15EE010];
  }
  uint64_t v3 = objc_msgSend(a1, "mad_faceProcessingInternalVersion");
  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl()) {
      int v4 = 14;
    }
    else {
      int v4 = 11;
    }
    if ((int)v3 >= v4) {
      uint64_t v3 = v4;
    }
    else {
      uint64_t v3 = v3;
    }
  }
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion >= %d) AND (vuObservationID = 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", v3, 0, 1, 2, 5);
  }
  else {
  int v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (clusterSequenceNumber = 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", v3, 0, 1, 2, 5);
  }
  [v2 setInternalPredicate:v5];

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces")) {
    [v2 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  return v2;
}

- (id)mad_clusteredFacesFetchOptions
{
  uint64_t v2 = [a1 librarySpecificFetchOptions];
  [v2 setIncludeNonvisibleFaces:1];
  [v2 setIncludeTorsoOnlyDetectionData:1];
  [v2 setIncludeOnlyFacesWithFaceprints:1];
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    [v2 setIncludedDetectionTypes:&unk_1F15EE028];
  }
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (vuObservationID != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  }
  else {
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (clusterSequenceNumber != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d)))", objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  }
  [v2 setInternalPredicate:v3];

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces")) {
    [v2 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  return v2;
}

- (id)mad_clusteredAndUnidentifiedFacesFetchOptions
{
  uint64_t v2 = [a1 librarySpecificFetchOptions];
  [v2 setIncludeNonvisibleFaces:1];
  [v2 setIncludeTorsoOnlyDetectionData:1];
  [v2 setIncludeOnlyFacesWithFaceprints:1];
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    [v2 setIncludedDetectionTypes:&unk_1F15EE040];
  }
  if (objc_msgSend(a1, "mad_useVUGallery")) {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (vuObservationID != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d))) AND (personForFace = nil AND personForTorso = nil AND personForTemporalDetectedFaces = nil)", objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  }
  else {
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(faceAlgorithmVersion = %d) AND (clusterSequenceNumber != 0) AND (((hidden = 0) AND (manual = 0) AND ((trainingType = %d) OR (trainingType = nil))) OR ((trainingType = %d) OR (trainingType = %d) OR (trainingType = %d))) AND (personForFace = nil AND personForTorso = nil AND personForTemporalDetectedFaces = nil)", objc_msgSend(a1, "mad_faceProcessingInternalVersion"), 0, 1, 2, 5);
  }
  [v2 setInternalPredicate:v3];

  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces")) {
    [v2 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  return v2;
}

- (uint64_t)mad_countOfUnclusteredFaces
{
  id v1 = objc_msgSend(a1, "mad_unclusteredFacesFetchOptions");
  [v1 setShouldPrefetchCount:1];
  uint64_t v2 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v1];
  uint64_t v3 = [v2 count];

  return v3;
}

- (id)mad_allFacesFetchOptions
{
  id v1 = [a1 librarySpecificFetchOptions];
  [v1 setIncludeNonvisibleFaces:1];
  [v1 setIncludeTorsoOnlyDetectionData:1];
  [v1 setIncludedDetectionTypes:&unk_1F15EE058];
  if (objc_msgSend((id)objc_opt_class(), "mad_clusterVideoFaces")) {
    [v1 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  return v1;
}

- (id)mad_allPersonsFetchOptions
{
  id v1 = [a1 librarySpecificFetchOptions];
  [v1 setMinimumUnverifiedFaceCount:0];
  [v1 setMinimumVerifiedFaceCount:0];
  [v1 setIncludeTorsoOnlyPerson:1];
  [v1 setIncludedDetectionTypes:&unk_1F15EE070];
  return v1;
}

- (id)mad_allPersonsFetchOptionsWithDetectionTypes:()MediaAnalysis andVerifiedTypes:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v18 = a4;
  id v7 = [a1 librarySpecificFetchOptions];
  [v7 setMinimumUnverifiedFaceCount:0];
  [v7 setMinimumVerifiedFaceCount:0];
  [v7 setIncludeTorsoOnlyPerson:1];
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = &unk_1F15EE088;
  }
  [v7 setIncludedDetectionTypes:v8];
  if (v18)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v18;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = [NSString stringWithFormat:@"verifiedType = %@", *(void *)(*((void *)&v19 + 1) + 8 * i)];
          [v9 addObject:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [v9 componentsJoinedByString:@" OR "];
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:v15];
    [v7 setPredicate:v16];
  }
  return v7;
}

- (BOOL)vcp_isSyndicationLibrary
{
  return [a1 wellKnownPhotoLibraryIdentifier] == 3;
}

- (uint64_t)vcp_requiresProcessingForTask:()MediaAnalysis
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x10) {
    goto LABEL_10;
  }
  if (((1 << a3) & 0x140E) != 0) {
    return 1;
  }
  if (a3 == 16)
  {
    uint64_t result = _os_feature_enabled_impl();
    if (result)
    {
      return MADIsPECProcessingEnabled();
    }
  }
  else
  {
LABEL_10:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 134217984;
        unint64_t v7 = a3;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Not requiring processing for unknown taskID %lu", (uint8_t *)&v6, 0xCu);
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)vcp_requiredFaceLibraryProcessingSubTasks
{
  if (objc_msgSend(a1, "vcp_isSyndicationLibrary")) {
    return 51;
  }
  else {
    return -1;
  }
}

- (__CFString)vcp_description
{
  if ([a1 isSystemPhotoLibrary]) {
    return @"SPL";
  }
  if ([a1 wellKnownPhotoLibraryIdentifier] == 3) {
    return @"SyndPL";
  }
  return @"PL";
}

- (uint64_t)vcp_requiresDownloadForTask:()MediaAnalysis
{
  if (_os_feature_enabled_impl() && objc_msgSend(a1, "mad_pauseFCPeopleFurtherProcessing"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "[FaceProcessing] Pause streaming for FC people processing", v9, 2u);
      }
    }
    LODWORD(result) = objc_msgSend(a1, "vcp_supportsInMemoryDownload");
    if (a3 == 10) {
      return result;
    }
    else {
      return 0;
    }
  }
  else
  {
    int v7 = objc_msgSend(a1, "vcp_supportsInMemoryDownload");
    unsigned int v8 = (0x40Au >> a3) & 1;
    if (a3 > 0xA) {
      unsigned int v8 = 0;
    }
    if (v7) {
      return v8;
    }
    else {
      return 0;
    }
  }
}

- (void)_mad_markAsProcessedByTask:()MediaAnalysis forAsset:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "[markAsProcessedByTask] Nil asset provided", v1, 2u);
}

- (void)_mad_markAsProcessedByTask:()MediaAnalysis forAsset:.cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "[markAsProcessedByTask][%@] Asset has no adjustment version, creation date is [%@]", buf, 0x16u);
}

@end