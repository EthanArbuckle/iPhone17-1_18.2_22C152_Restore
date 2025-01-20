@interface VCPSubsampledAnalysisTask
+ (BOOL)prioritizeWallpaperSuggestion;
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (BOOL)assetWouldBeSkipped:(id)a3 withAnalysis:(id)a4;
- (VCPSubsampledAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (id)memorySpecificFetchOptions;
- (int)checkAndMarkPriorityAssets;
- (int)collectHighlight:(id)a3 withAssetPredicate:(id)a4 andLimit:(BOOL)a5;
- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 andLimit:(BOOL)a5 andProgressReporter:(id)a6;
- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 assetPredicate:(id)a5 andLimit:(BOOL)a6 andProgressReporter:(id)a7;
- (int)collectMemoriesWithAssetPredicate:(id)a3 andProgressReporter:(id)a4;
- (int)collectMemorieswithProgressReporter:(id)a3;
- (int)collectMemory:(id)a3 withAssetPredicate:(id)a4 andAnalyzedAssetCount:(unint64_t *)a5;
- (int)collectWallpaperSuggestionWithAssetPredicate:(id)a3 andProgressReporter:(id)a4;
- (int)collectWallpaperSuggestionwithProgressReporter:(id)a3;
- (int)mainInternal;
- (int)markPrioritizedAsset:(id)a3 skipped:(BOOL *)a4;
- (int)processAsset:(id)a3 skipped:(BOOL *)a4;
- (int)processPendingBatch;
- (int)processPriorityAssets:(id)a3 progressReporter:(id)a4;
- (unint64_t)queryHighlightCount;
- (unint64_t)queryMemoryCount;
- (unint64_t)queryWallpaperSuggestionCount;
- (void)resetPendingBatch;
@end

@implementation VCPSubsampledAnalysisTask

+ (BOOL)prioritizeWallpaperSuggestion
{
  return 1;
}

- (VCPSubsampledAnalysisTask)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPSubsampledAnalysisTask;
  v6 = [(VCPTask *)&v16 initWithPhotoLibrary:v5];
  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v5];
  database = v6->_database;
  v6->_database = (VCPDatabaseWriter *)v7;

  uint64_t v9 = +[VCPPhotosAssetChangeManager managerForPhotoLibrary:v5];
  changeManager = v6->_changeManager;
  v6->_changeManager = (VCPPhotosAssetChangeManager *)v9;

  if (!v6->_changeManager)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to create VCPPhotosAssetChangeManager", v15, 2u);
      }
    }
    v11 = 0;
  }
  else
  {
LABEL_3:
    v11 = v6;
  }

  return v11;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v6 options:v5];

  return v7;
}

- (void)resetPendingBatch
{
  v3 = [(VCPTask *)self photoLibrary];
  v4 = +[VCPBatchAnalysisTask taskWithPhotoLibrary:v3];
  pendingBatch = self->_pendingBatch;
  self->_pendingBatch = v4;

  [(VCPBatchAnalysisTask *)self->_pendingBatch setPhotosChangeManager:self->_changeManager];
  id v6 = [(VCPTask *)self cancel];
  [(VCPTask *)self->_pendingBatch setCancel:v6];
}

- (int)processPendingBatch
{
  [(VCPBatchAnalysisTask *)self->_pendingBatch start];
  int v3 = [(VCPTask *)self->_pendingBatch error];
  if (!v3) {
    [(VCPSubsampledAnalysisTask *)self resetPendingBatch];
  }
  return v3;
}

- (BOOL)assetWouldBeSkipped:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypes");
  unint64_t v9 = v8 & ~(unint64_t)objc_msgSend(v7, "vcp_types");

  unint64_t v10 = v9 & 0xFFFFFFFFDFEFFFFFLL;
  if (!v10)
  {
    BOOL v14 = 0;
    goto LABEL_38;
  }
  if (!objc_msgSend(v6, "vcp_isShortMovie"))
  {
    v11 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v6];
    if ((v10 & ~(unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypesForResources:", v11)) == 0)
    {
LABEL_8:
      BOOL v14 = 0;
LABEL_37:

      goto LABEL_38;
    }
    if (!self->_networkAvailable)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v15, v16))
        {
          v17 = [v6 localIdentifier];
          int v25 = 138412290;
          v26 = v17;
          v18 = "[%@] Network unavailable; skipping";
          goto LABEL_29;
        }
LABEL_35:
      }
LABEL_36:
      BOOL v14 = 1;
      goto LABEL_37;
    }
    if (objc_msgSend(v6, "vcp_isLivePhoto")
      && (-[NSObject vcp_hasLocalPhoto:](v11, "vcp_hasLocalPhoto:", [v6 hasAdjustments]) & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v15, v16))
        {
          v17 = [v6 localIdentifier];
          int v25 = 138412290;
          v26 = v17;
          v18 = "[%@] Live Photo has no local image; skipping";
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (objc_msgSend(v6, "vcp_isVideoSlowmo"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v15, v16))
        {
          v17 = [v6 localIdentifier];
          int v25 = 138412290;
          v26 = v17;
          v18 = "[%@] Slowmo not supported for streaming analysis; skipping";
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v18, (uint8_t *)&v25, 0xCu);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    v15 = [v11 vcp_smallMovieDerivativeResource];
    if (v15)
    {
      if ([v6 isVideo])
      {
        id v19 = [v15 fileSize];
        if (v19 > +[VCPDownloadManager maxSizeBytes])
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_35;
          }
          v20 = VCPLogInstance();
          os_log_type_t v21 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v20, v21))
          {
            v22 = [v6 localIdentifier];
            int v25 = 138412290;
            v26 = v22;
            v23 = "[%@] File size exceeds streaming threshold; skipping";
LABEL_33:
            _os_log_impl((void *)&_mh_execute_header, v20, v21, v23, (uint8_t *)&v25, 0xCu);

            goto LABEL_34;
          }
          goto LABEL_34;
        }
        if (!v19 && objc_msgSend(v6, "vcp_isLongMovie"))
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_35;
          }
          v20 = VCPLogInstance();
          os_log_type_t v21 = VCPLogToOSLogType[7];
          if (!os_log_type_enabled(v20, v21)) {
            goto LABEL_34;
          }
          v22 = [v6 localIdentifier];
          int v25 = 138412290;
          v26 = v22;
          v23 = "[%@] Duration exceeds streaming threshold; skipping";
          goto LABEL_33;
        }
      }

      goto LABEL_8;
    }
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_35;
    }
    v20 = VCPLogInstance();
    os_log_type_t v21 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v20, v21))
    {
      v22 = [v6 localIdentifier];
      int v25 = 138412290;
      v26 = v22;
      v23 = "[%@] Asset has no small video derivative; skipping";
      goto LABEL_33;
    }
LABEL_34:

    goto LABEL_35;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = [v6 localIdentifier];
      int v25 = 138412290;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@] Short movie is not analyzed; skipping",
        (uint8_t *)&v25,
        0xCu);
    }
    goto LABEL_36;
  }
  BOOL v14 = 1;
LABEL_38:

  return v14;
}

- (int)processAsset:(id)a3 skipped:(BOOL *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 1;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = [v6 localIdentifier];
      unint64_t v10 = objc_msgSend(v6, "vcp_typeDescription");
      [v6 curationScore];
      *(_DWORD *)buf = 138412802;
      v51 = v9;
      __int16 v52 = 2112;
      v53 = v10;
      __int16 v54 = 2048;
      uint64_t v55 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Evaluating %@ asset (score: %f)", buf, 0x20u);
    }
  }
  if (objc_msgSend(v6, "vcp_eligibleForFullAnalysis")
    && ![(VCPBatchAnalysisTask *)self->_pendingBatch containsAsset:v6])
  {
    database = self->_database;
    BOOL v14 = [v6 localIdentifier];
    id v49 = 0;
    [(VCPDatabaseWriter *)database analysisForAsset:v14 analysis:&v49];
    id v15 = v49;

    os_log_type_t v16 = MediaAnalysisStripOutdatedAnalysis(v6, v15);

    unint64_t v17 = (unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypes") & 0xFFFFFFFFDFEFFFFFLL;
    unint64_t v18 = v17 & ~(unint64_t)objc_msgSend(v16, "vcp_types");
    if (!v18)
    {
      int v12 = 0;
LABEL_43:

      goto LABEL_44;
    }
    v48 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v6];
    unint64_t v19 = (unint64_t)objc_msgSend(v6, "vcp_fullAnalysisTypesForResources:");
    if ((v19 & v18) == v18)
    {
      unint64_t v43 = v19 & ~objc_msgSend(v16, "vcp_types") & 0x100000 | v18;
    }
    else
    {
      unint64_t v43 = v18;
      if ([(VCPSubsampledAnalysisTask *)self assetWouldBeSkipped:v6 withAnalysis:v16])
      {
        int v12 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    unint64_t v46 = v19 & v18;
    unint64_t v45 = v18;
    v20 = VCPSignPostLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    v22 = VCPSignPostLog();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPSubsampledAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v24 = objc_msgSend(v48, "mad_computeSyncResource");
    int v25 = [(VCPTask *)self cancel];
    v47 = v24;
    v26 = objc_msgSend(v24, "mad_existingAnalysisFromComputeSyncForAsset:allowDownload:cancel:", v6, 0, v25);

    v27 = VCPSignPostLog();
    v28 = v27;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, v21, "VCPSubsampledAnalysisTask_UnpackComputeSync", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v26)
    {
      v29 = MediaAnalysisStripOutdatedAnalysis(v6, v26);

      unint64_t v30 = v17 & ~(unint64_t)objc_msgSend(v29, "vcp_types");
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v31 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v31, v32))
        {
          v44 = [v6 localIdentifier];
          MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v29, "vcp_types"));
          v41 = os_log_type_t type = v32;
          uint64_t v33 = MediaAnalysisTypeShortDescription(v30);
          *(_DWORD *)buf = 138412802;
          v51 = v44;
          __int16 v52 = 2112;
          v53 = v41;
          __int16 v54 = 2112;
          uint64_t v55 = v33;
          v34 = (void *)v33;
          _os_log_impl((void *)&_mh_execute_header, v31, type, "[%@] Reusing analysis results from compute sync (existing: %@, missing: %@)", buf, 0x20u);
        }
      }
      if ((v30 & ~v19) != 0)
      {
        if ([(VCPSubsampledAnalysisTask *)self assetWouldBeSkipped:v6 withAnalysis:v29])
        {
          goto LABEL_40;
        }
      }
      else
      {
        v30 |= v19 & ~objc_msgSend(v29, "vcp_types") & 0x100000;
      }
    }
    else
    {
      v29 = v16;
      unint64_t v30 = v43;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v35 = VCPLogInstance();
      os_log_type_t v36 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v35, v36))
      {
        v37 = [v6 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v51 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] Queuing asset for analysis", buf, 0xCu);
      }
    }
    if (a4) {
      *a4 = 0;
    }
    [(VCPBatchAnalysisTask *)self->_pendingBatch addAnalysis:v30 withExistingAnalysis:v29 forAsset:v6 allowStreaming:v46 != v45];
    [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
    if (v38 >= 100.0)
    {
      unsigned int v39 = [(VCPSubsampledAnalysisTask *)self processPendingBatch];
      if (v39)
      {
        int v12 = v39;
LABEL_41:

        os_log_type_t v16 = v29;
        goto LABEL_42;
      }
    }
LABEL_40:
    int v12 = 0;
    goto LABEL_41;
  }
  int v12 = 0;
LABEL_44:

  return v12;
}

- (int)markPrioritizedAsset:(id)a3 skipped:(BOOL *)a4
{
  id v6 = a3;
  database = self->_database;
  os_log_type_t v8 = [v6 localIdentifier];
  if (a4)
  {
    id v16 = 0;
    [(VCPDatabaseWriter *)database analysisForAsset:v8 analysis:&v16];
    id v9 = v16;

    unint64_t v10 = MediaAnalysisStripOutdatedAnalysis(v6, v9);

    *a4 = [(VCPSubsampledAnalysisTask *)self assetWouldBeSkipped:v6 withAnalysis:v10];
  }
  else
  {
    uint64_t v11 = [(VCPDatabaseWriter *)database isPrioritizedLocalIdentifier:v8];

    if ((v11 & 1) == 0)
    {
      os_log_type_t v13 = self->_database;
      BOOL v14 = [v6 localIdentifier];
      int v12 = -[VCPDatabaseWriter setPrioritizedLocalIdentifier:mediaType:mediaSubtypes:](v13, "setPrioritizedLocalIdentifier:mediaType:mediaSubtypes:", v14, [v6 mediaType], objc_msgSend(v6, "mediaSubtypes"));

      goto LABEL_6;
    }
  }
  int v12 = 0;
LABEL_6:

  return v12;
}

- (int)collectHighlight:(id)a3 withAssetPredicate:(id)a4 andLimit:(BOOL)a5
{
  BOOL v38 = a5;
  id v7 = a3;
  id v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = [v7 localIdentifier];
      int v12 = [v7 startDate];
      *(_DWORD *)buf = 138412546;
      unint64_t v43 = v11;
      __int16 v44 = 2112;
      unint64_t v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] Evaluating Highlight (%@)", buf, 0x16u);
    }
  }
  os_log_type_t v13 = [(VCPTask *)self photoLibrary];
  BOOL v14 = +[PHAsset vcp_fetchOptionsForLibrary:v13 forTaskID:1];

  id v39 = v8;
  [v14 setPredicate:v8];
  id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"curationScore" ascending:0];
  v41 = v15;
  id v16 = +[NSArray arrayWithObjects:&v41 count:1];
  [v14 setInternalSortDescriptors:v16];

  id v40 = v7;
  unint64_t v17 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v7 referenceAsset:0 options:v14];
  uint64_t v18 = 0;
  if (![v17 count])
  {
LABEL_12:
    [v14 setHighlightCurationType:2];
    v37 = v14;
    int v25 = +[PHAsset fetchAssetsInAssetCollection:v40 options:v14];
    v26 = v25;
    if (v38)
    {
      unint64_t v27 = (unint64_t)[v25 count] / 5;
      if (v27 >= 0x1E) {
        unint64_t v27 = 30;
      }
      if (v27 <= 6) {
        unint64_t v28 = 6;
      }
      else {
        unint64_t v28 = v27;
      }
    }
    else
    {
      unint64_t v28 = -1;
    }
    if ([v26 count])
    {
      uint64_t v29 = 0;
      while (1)
      {
        if ([(VCPTask *)self isCancelled])
        {
          int v24 = -128;
          goto LABEL_33;
        }
        v31 = [v26 objectAtIndexedSubscript:v29];
        if (([v31 sourceType] & 0x10) == 0)
        {
          os_log_type_t v32 = +[VCPWatchdog sharedWatchdog];
          [v32 pet];

          int v24 = [(VCPSubsampledAnalysisTask *)self markPrioritizedAsset:v31 skipped:0];
          if (v24) {
            goto LABEL_32;
          }
          if (++v18 >= v28) {
            break;
          }
        }

        if (++v29 >= (unint64_t)[v26 count]) {
          goto LABEL_26;
        }
      }
      int v24 = 0;
LABEL_32:

LABEL_33:
      v35 = v39;
      v34 = v40;
      BOOL v14 = v37;
    }
    else
    {
LABEL_26:
      int v24 = 0;
      v35 = v39;
      v34 = v40;
      BOOL v14 = v37;
    }

    goto LABEL_35;
  }
  uint64_t v19 = 0;
  while (1)
  {
    if ([(VCPTask *)self isCancelled])
    {
      int v24 = -128;
      goto LABEL_30;
    }
    os_signpost_id_t v21 = [v17 objectAtIndexedSubscript:v19];
    if (([v21 sourceType] & 0x10) == 0) {
      break;
    }
LABEL_11:

    if (++v19 >= (unint64_t)[v17 count]) {
      goto LABEL_12;
    }
  }
  v22 = +[VCPWatchdog sharedWatchdog];
  [v22 pet];

  int v24 = [(VCPSubsampledAnalysisTask *)self markPrioritizedAsset:v21 skipped:0];
  if (!v24)
  {
    ++v18;
    goto LABEL_11;
  }

LABEL_30:
  v35 = v39;
  v34 = v40;
LABEL_35:

  return v24;
}

- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 assetPredicate:(id)a5 andLimit:(BOOL)a6 andProgressReporter:(id)a7
{
  BOOL v34 = a6;
  id v11 = a4;
  id v36 = a5;
  id v35 = a7;
  id v12 = objc_alloc_init((Class)PHFetchOptions);
  os_log_type_t v13 = [(VCPTask *)self photoLibrary];
  [v12 setPhotoLibrary:v13];

  BOOL v14 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  unint64_t v43 = v14;
  id v15 = +[NSArray arrayWithObjects:&v43 count:1];
  [v12 setSortDescriptors:v15];

  [v12 setPredicate:v11];
  id v16 = +[MADStateHandler sharedStateHandler];
  [v16 addBreadcrumb:@"[Subsampled] Fetching highlights with fetchOptions: %@", v12];

  unint64_t v17 = +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:a3 options:v12];
  uint64_t v18 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v18, "addBreadcrumb:", @"[Subsampled] Fetched %lu highlights", objc_msgSend(v17, "count"));

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v20)
  {
    int v29 = 0;
    goto LABEL_21;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v39;
  id v33 = v11;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v39 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * i);
      if ([(VCPTask *)self isCancelled])
      {
        int v29 = -128;
LABEL_20:
        id v11 = v33;
        goto LABEL_21;
      }
      v26 = +[VCPWatchdog sharedWatchdog];
      [v26 pet];

      unsigned int v27 = [(VCPSubsampledAnalysisTask *)self collectHighlight:v24 withAssetPredicate:v36 andLimit:v34];
      if (v27)
      {
        int v29 = v27;
        goto LABEL_20;
      }
      [v35 increaseProcessedJobCountByOne];
      unint64_t v28 = self->_highlightCount + 1;
      self->_highlightCount = v28;
      if (v28 >= 0x5DC)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unint64_t v30 = VCPLogInstance();
          os_log_type_t v31 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v30, v31))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "Hit highlight collection limit; skipping remaining highlights",
              buf,
              2u);
          }
        }
        int v29 = 0;
        goto LABEL_20;
      }
    }
    id v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    int v29 = 0;
    id v11 = v33;
    if (v21) {
      continue;
    }
    break;
  }
LABEL_21:

  return v29;
}

- (int)collectHighlightsOfTypes:(int64_t)a3 withHighlightPredicate:(id)a4 andLimit:(BOOL)a5 andProgressReporter:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = +[NSPredicate vcp_livePhotosPredicate:0];
  v30[0] = v12;
  os_log_type_t v13 = +[NSPredicate vcp_stillImagesPredicate:0];
  v30[1] = v13;
  BOOL v14 = +[NSPredicate vcp_moviesPredicate:0];
  v30[2] = v14;
  id v15 = +[NSArray arrayWithObjects:v30 count:3];

  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v16)
  {
    int v23 = 0;
    goto LABEL_15;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v27;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v27 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      if (self->_highlightCount > 0x5DB)
      {
        int v23 = 0;
LABEL_14:
        goto LABEL_15;
      }
      unsigned int v22 = [(VCPSubsampledAnalysisTask *)self collectHighlightsOfTypes:a3 withHighlightPredicate:v10 assetPredicate:v20 andLimit:v7 andProgressReporter:v11];
      if (v22)
      {
        int v23 = v22;
        goto LABEL_14;
      }
    }
    id v17 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    int v23 = 0;
    if (v17) {
      continue;
    }
    break;
  }
LABEL_15:

  return v23;
}

- (id)memorySpecificFetchOptions
{
  v2 = [(VCPTask *)self photoLibrary];
  int v3 = [v2 librarySpecificFetchOptions];

  [v3 setIncludePendingMemories:1];
  v4 = +[NSPredicate predicateWithFormat:@"featuredState == %d", 1];
  [v3 setPredicate:v4];

  return v3;
}

- (int)collectMemory:(id)a3 withAssetPredicate:(id)a4 andAnalyzedAssetCount:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  id v10 = [(VCPTask *)self photoLibrary];
  id v11 = +[PHAsset vcp_fetchOptionsForLibrary:v10 forTaskID:1];

  [v11 setPredicate:v9];
  id v12 = +[PHAsset fetchAssetsInAssetCollection:v8 options:v11];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v13 = v9;
    BOOL v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = [v12 count];
      id v17 = [v8 localIdentifier];
      *(_DWORD *)buf = 134218242;
      id v26 = v16;
      __int16 v27 = 2112;
      long long v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Collecting %lu assets for Memory %@", buf, 0x16u);
    }
    id v9 = v13;
  }
  if ([v12 count])
  {
    id v24 = v9;
    uint64_t v18 = 0;
    while (1)
    {
      if ([(VCPTask *)self isCancelled]) {
        break;
      }
      uint64_t v20 = +[VCPWatchdog sharedWatchdog];
      [v20 pet];

      buf[0] = 0;
      id v21 = [v12 objectAtIndexedSubscript:v18];
      int v22 = [(VCPSubsampledAnalysisTask *)self markPrioritizedAsset:v21 skipped:buf];

      if (v22) {
        goto LABEL_18;
      }
      if (a5 && !buf[0]) {
        ++*a5;
      }
      if (++v18 >= (unint64_t)[v12 count])
      {
        int v22 = 0;
        goto LABEL_19;
      }
    }
    int v22 = -128;
LABEL_18:
LABEL_19:
    id v9 = v24;
  }
  else
  {
    int v22 = 0;
  }

  return v22;
}

- (int)collectMemoriesWithAssetPredicate:(id)a3 andProgressReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MADStateHandler sharedStateHandler];
  [v8 addBreadcrumb:@"[Subsampled] Fetching Memories"];

  id v9 = [(VCPSubsampledAnalysisTask *)self memorySpecificFetchOptions];
  id v10 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];

  id v11 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v11, "addBreadcrumb:", @"[Subsampled] Fetched %lu Memories", objc_msgSend(v10, "count"));

  if ([v10 count])
  {
    uint64_t v12 = 0;
    while (1)
    {
      if ([(VCPTask *)self isCancelled])
      {
        int v16 = -128;
        goto LABEL_17;
      }
      BOOL v14 = +[VCPWatchdog sharedWatchdog];
      [v14 pet];

      uint64_t v22 = 0;
      os_log_type_t v15 = [v10 objectAtIndexedSubscript:v12];
      int v16 = [(VCPSubsampledAnalysisTask *)self collectMemory:v15 withAssetPredicate:v6 andAnalyzedAssetCount:&v22];

      if (v16) {
        goto LABEL_17;
      }
      if (v22)
      {
        [v7 increaseProcessedJobCountByOne];
        unint64_t memoryCountPerAssetType = self->_memoryCountPerAssetType + 1;
        self->_unint64_t memoryCountPerAssetType = memoryCountPerAssetType;
      }
      else
      {
        unint64_t memoryCountPerAssetType = self->_memoryCountPerAssetType;
      }
      if (memoryCountPerAssetType >= 0xA) {
        break;
      }
      if (++v12 >= (unint64_t)[v10 count]) {
        goto LABEL_10;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v19))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Hit Memory processing limit; skipping remaining Memories",
          buf,
          2u);
      }
    }
    int v16 = 0;
LABEL_17:
  }
  else
  {
LABEL_10:
    int v16 = 0;
  }

  return v16;
}

- (int)collectMemorieswithProgressReporter:(id)a3
{
  id v21 = a3;
  v31[0] = @"Live Photo";
  v4 = +[NSPredicate vcp_livePhotosPredicate:0];
  v32[0] = v4;
  v31[1] = @"Still Image";
  id v5 = +[NSPredicate vcp_stillImagesPredicate:0];
  v32[1] = v5;
  v31[2] = @"Movie";
  id v6 = +[NSPredicate vcp_moviesPredicate:0];
  v32[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    os_log_type_t type = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        self->_unint64_t memoryCountPerAssetType = 0;
        os_log_type_t v15 = [v8 objectForKeyedSubscript:v13];
        int v16 = [(VCPSubsampledAnalysisTask *)self collectMemoriesWithAssetPredicate:v15 andProgressReporter:v21];

        if (v16)
        {
          goto LABEL_15;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, type))
          {
            unint64_t memoryCountPerAssetType = self->_memoryCountPerAssetType;
            *(_DWORD *)buf = 134218242;
            unint64_t v27 = memoryCountPerAssetType;
            __int16 v28 = 2112;
            uint64_t v29 = v13;
            _os_log_impl((void *)&_mh_execute_header, v17, type, "Finished collecting %lu Memories for %@ asset type", buf, 0x16u);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  int v16 = 0;
LABEL_15:

  return v16;
}

- (int)collectWallpaperSuggestionWithAssetPredicate:(id)a3 andProgressReporter:(id)a4
{
  id v6 = a3;
  id v37 = a4;
  id v7 = [(VCPTask *)self photoLibrary];
  id v8 = [v7 librarySpecificFetchOptions];

  id v9 = +[NSPredicate predicateWithFormat:@"%K != %d", @"state", 4];
  v41[0] = v9;
  id v10 = +[PHSuggestion predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v41[1] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v41 count:2];
  uint64_t v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
  [v8 setPredicate:v12];

  uint64_t v13 = +[PHSuggestion fetchSuggestionsWithOptions:v8];
  BOOL v14 = +[MADStateHandler sharedStateHandler];
  [v14 addBreadcrumb:@"[Subsampled] Fetching wallpaper suggestions"];

  os_log_type_t v15 = [(VCPTask *)self photoLibrary];
  int v16 = +[PHAsset vcp_fetchOptionsForLibrary:v15 forTaskID:1];

  [v16 setPredicate:v6];
  id v17 = +[PHAsset fetchKeyAssetForEachSuggestion:v13 options:v16];
  uint64_t v18 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v18, "addBreadcrumb:", @"[Subsampled] Fetched %lu wallpaper suggestions", objc_msgSend(v17, "count"));

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    os_log_type_t v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v19, v20))
    {
      *(_DWORD *)buf = 134217984;
      id v40 = [v17 count];
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Collecting %lu assets for Wallpaper suggestion", buf, 0xCu);
    }
  }
  if ([v17 count])
  {
    BOOL v34 = v13;
    id v35 = v8;
    id v36 = v6;
    uint64_t v21 = 0;
    os_log_type_t v22 = VCPLogToOSLogType[7];
    while (1)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        long long v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, v22))
        {
          long long v25 = [v17 objectAtIndexedSubscript:v21];
          id v26 = [v25 localIdentifier];
          *(_DWORD *)buf = 138412290;
          id v40 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, v22, "%@", buf, 0xCu);
        }
      }
      if ([(VCPTask *)self isCancelled])
      {
        int v30 = -128;
        id v8 = v35;
        id v6 = v36;
        uint64_t v13 = v34;
        goto LABEL_25;
      }
      unint64_t v27 = +[VCPWatchdog sharedWatchdog];
      [v27 pet];

      char v38 = 0;
      __int16 v28 = [v17 objectAtIndexedSubscript:v21];
      [(VCPSubsampledAnalysisTask *)self markPrioritizedAsset:v28 skipped:&v38];

      if (v38)
      {
        unint64_t wallpaperSuggestionCount = self->_wallpaperSuggestionCount;
      }
      else
      {
        [v37 increaseProcessedJobCountByOne];
        unint64_t wallpaperSuggestionCount = self->_wallpaperSuggestionCount + 1;
        self->_unint64_t wallpaperSuggestionCount = wallpaperSuggestionCount;
      }
      if (wallpaperSuggestionCount >= 0x1F4) {
        break;
      }
      if (++v21 >= (unint64_t)[v17 count])
      {
        int v30 = 0;
        id v8 = v35;
        id v6 = v36;
        uint64_t v13 = v34;
        goto LABEL_26;
      }
    }
    id v8 = v35;
    id v6 = v36;
    uint64_t v13 = v34;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v31, v32))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Hit wallpaper suggestion collection limit; skipping remaining wallpaper suggestion",
          buf,
          2u);
      }
    }
    int v30 = 0;
LABEL_25:
  }
  else
  {
    int v30 = 0;
  }
LABEL_26:

  return v30;
}

- (int)collectWallpaperSuggestionwithProgressReporter:(id)a3
{
  id v19 = a3;
  CFStringRef v29 = @"Live Photo";
  v4 = +[NSPredicate vcp_livePhotosPredicate:0];
  int v30 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    os_log_type_t type = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        self->_unint64_t wallpaperSuggestionCount = 0;
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        int v14 = [(VCPSubsampledAnalysisTask *)self collectWallpaperSuggestionWithAssetPredicate:v13 andProgressReporter:v19];

        if (v14)
        {
          goto LABEL_15;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          os_log_type_t v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, type))
          {
            unint64_t wallpaperSuggestionCount = self->_wallpaperSuggestionCount;
            *(_DWORD *)buf = 134218242;
            unint64_t v25 = wallpaperSuggestionCount;
            __int16 v26 = 2112;
            uint64_t v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, type, "Finished collecting %lu Wallpaper suggestion for %@ asset type", buf, 0x16u);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)queryWallpaperSuggestionCount
{
  int v3 = [(VCPTask *)self photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  id v5 = +[NSPredicate predicateWithFormat:@"%K != %d", @"state", 4];
  v16[0] = v5;
  id v6 = +[PHSuggestion predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v16[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v16 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  uint64_t v9 = +[PHSuggestion fetchSuggestionsWithOptions:v4];
  id v10 = [(VCPTask *)self photoLibrary];
  uint64_t v11 = [v10 librarySpecificFetchOptions];

  [v11 setShouldPrefetchCount:1];
  uint64_t v12 = +[NSPredicate vcp_livePhotosPredicate:0];
  [v11 setPredicate:v12];

  uint64_t v13 = +[PHAsset fetchKeyAssetForEachSuggestion:v9 options:v11];
  id v14 = [v13 count];

  return (unint64_t)v14;
}

- (unint64_t)queryHighlightCount
{
  v2 = [(VCPTask *)self photoLibrary];
  int v3 = [v2 librarySpecificFetchOptions];

  [v3 setShouldPrefetchCount:1];
  v4 = +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)queryMemoryCount
{
  v2 = [(VCPSubsampledAnalysisTask *)self memorySpecificFetchOptions];
  [v2 setShouldPrefetchCount:1];
  int v3 = +[PHAssetCollection fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v2];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (int)checkAndMarkPriorityAssets
{
  double v3 = (double)[(VCPDatabaseWriter *)self->_database valueForKey:@"PrioritizedAssetCollectionFinishTimestamp"];
  id v4 = +[NSDate now];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  int v7 = MediaAnalysisLogLevel();
  if (v6 - v3 > 604800.0)
  {
    if (v7 >= 5)
    {
      id v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Last finish is beyond cutoff time. Collecting priority assets...", buf, 2u);
      }
    }
    [(VCPDatabaseWriter *)self->_database clearPrioritizedAssets];
    id v10 = [(VCPTask *)self progressHandler];

    if (v10)
    {
      unint64_t v11 = [(VCPSubsampledAnalysisTask *)self queryHighlightCount];
      if (3 * v11 >= 0x5DC) {
        uint64_t v12 = 1500;
      }
      else {
        uint64_t v12 = 3 * v11;
      }
      unint64_t v13 = [(VCPSubsampledAnalysisTask *)self queryMemoryCount];
      if (3 * v13 >= 0x1E) {
        uint64_t v14 = 30;
      }
      else {
        uint64_t v14 = 3 * v13;
      }
      unint64_t v15 = [(VCPSubsampledAnalysisTask *)self queryWallpaperSuggestionCount];
      if (v15 >= 0x1F4) {
        uint64_t v16 = 500;
      }
      else {
        uint64_t v16 = v15;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v82 = v12;
          __int16 v83 = 2048;
          uint64_t v84 = v14;
          __int16 v85 = 2048;
          uint64_t v86 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Fetched %lu Highlights and %lu Memories and %lu Wallpaper Suggestions", buf, 0x20u);
        }
      }
      if (v12 || v14 || v16)
      {
        uint64_t v21 = v14 + v12 + v16;
        long long v22 = [(VCPTask *)self progressHandler];
        id v10 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v21 andBlock:v22];
      }
      else
      {
        id v10 = 0;
      }
    }
    long long v23 = +[NSDate dateWithTimeIntervalSinceNow:-7776000.0];
    v74 = +[NSPredicate predicateWithFormat:@"startDate >= %@", v23];
    v75 = +[NSPredicate predicateWithFormat:@"startDate < %@", v23];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v24, v25))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Collecting all assets in Memories...", buf, 2u);
      }
    }
    __int16 v26 = VCPSignPostLog();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    __int16 v28 = VCPSignPostLog();
    CFStringRef v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VCPSubsampledAnalysisProcessMemories", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    unsigned int v30 = [(VCPSubsampledAnalysisTask *)self collectMemorieswithProgressReporter:v10];
    if (v30) {
      goto LABEL_87;
    }
    os_log_type_t v31 = VCPSignPostLog();
    os_log_type_t v32 = v31;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v27, "VCPSubsampledAnalysisProcessMemories", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v33 = VCPLogInstance();
      os_log_type_t v34 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Collecting all assets in Highlights after %@...", buf, 0xCu);
      }
    }
    id v35 = VCPSignPostLog();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    id v37 = VCPSignPostLog();
    char v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPSubsampledAnalysisProcessRecentHighlights", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    unsigned int v30 = [(VCPSubsampledAnalysisTask *)self collectHighlightsOfTypes:0x7FFFFFFFFFFFFFFFLL withHighlightPredicate:v74 andLimit:0 andProgressReporter:v10];
    if (v30) {
      goto LABEL_87;
    }
    long long v39 = VCPSignPostLog();
    id v40 = v39;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v36, "VCPSubsampledAnalysisProcessRecentHighlights", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v41 = VCPLogInstance();
      os_log_type_t v42 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v41, v42))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Collecting subsampled assets in Moments before %@", buf, 0xCu);
      }
    }
    unint64_t v43 = VCPSignPostLog();
    os_signpost_id_t v44 = os_signpost_id_generate(v43);

    unint64_t v45 = VCPSignPostLog();
    unint64_t v46 = v45;
    unint64_t v47 = v44 - 1;
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VCPSubsampledAnalysisProcessOlderHighlights", (const char *)&unk_1001F3BD3, buf, 2u);
    }
    os_signpost_id_t spid = v44;

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v48 = [&off_100230830 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v77;
      unint64_t v73 = v47;
      while (2)
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v77 != v50) {
            objc_enumerationMutation(&off_100230830);
          }
          __int16 v52 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          __int16 v54 = v53;
          if (self->_highlightCount >= 0x5DC)
          {
            unint64_t v47 = v73;
            goto LABEL_70;
          }
          unsigned int v30 = -[VCPSubsampledAnalysisTask collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:](self, "collectHighlightsOfTypes:withHighlightPredicate:andLimit:andProgressReporter:", [v52 unsignedIntegerValue], v75, 1, v10);
          if (v30) {
            goto LABEL_87;
          }
        }
        id v49 = [&off_100230830 countByEnumeratingWithState:&v76 objects:v80 count:16];
        unint64_t v47 = v73;
        if (v49) {
          continue;
        }
        break;
      }
    }
LABEL_70:
    uint64_t v55 = VCPSignPostLog();
    v56 = v55;
    if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_END, spid, "VCPSubsampledAnalysisProcessOlderHighlights", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ([(id)objc_opt_class() prioritizeWallpaperSuggestion])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v57 = VCPLogInstance();
        os_log_type_t v58 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v57, v58))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, v58, "Collecting all assets in wallpaper suggestions...", buf, 2u);
        }
      }
      v59 = VCPSignPostLog();
      os_signpost_id_t v60 = os_signpost_id_generate(v59);

      v61 = VCPSignPostLog();
      v62 = v61;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "VCPSubsampledAnalysisProcessWallpaperSuggestion", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      unsigned int v30 = [(VCPSubsampledAnalysisTask *)self collectWallpaperSuggestionwithProgressReporter:v10];
      if (v30) {
        goto LABEL_87;
      }
      v63 = VCPSignPostLog();
      v64 = v63;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, v60, "VCPSubsampledAnalysisProcessWallpaperSuggestion", (const char *)&unk_1001F3BD3, buf, 2u);
      }
    }
    v65 = +[NSDate now];
    [v65 timeIntervalSince1970];
    double v67 = v66;

    [(VCPDatabaseWriter *)self->_database setValue:(uint64_t)v67 forKey:@"PrioritizedAssetCollectionFinishTimestamp"];
    unsigned int v30 = 0;
LABEL_87:
    unsigned int v68 = [(VCPDatabaseWriter *)self->_database commit];
    if (v68 == -108 || v68 == -23 || v68 == -36) {
      int v20 = v68;
    }
    else {
      int v20 = v30;
    }

LABEL_97:
    return v20;
  }
  if (v7 >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v19, "Last finish is within cutoff time. Skipping priority asset collection", buf, 2u);
    }
    int v20 = 0;
    goto LABEL_97;
  }
  return 0;
}

- (int)processPriorityAssets:(id)a3 progressReporter:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        buf[0] = 0;
        unsigned int v14 = [(VCPSubsampledAnalysisTask *)self processAsset:v12 skipped:buf];
        if (v14)
        {
          unsigned int v19 = v14;

          if ((int)MediaAnalysisLogLevel() > 6)
          {
            int v20 = VCPLogInstance();
            os_log_type_t v21 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v20, v21))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, v21, "Priority assets analysis bailed", buf, 2u);
            }
          }
          long long v22 = +[VCPDownloadManager sharedManager];
          [v22 flush];

          if ([(VCPPhotosAssetChangeManager *)self->_changeManager publishPendingChanges]
            && (int)MediaAnalysisLogLevel() >= 4)
          {
            long long v23 = VCPLogInstance();
            os_log_type_t v24 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v23, v24))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to publish PHAssetPropertySetMediaAnalysis changes", buf, 2u);
            }
          }
          unsigned int v25 = [(VCPDatabaseWriter *)self->_database commit];
          int v17 = v25;
          if (v25 != -108 && v25 != -36 && v25 != -23) {
            int v17 = v19;
          }
          goto LABEL_29;
        }
        if (!buf[0]) {
          [v28 increaseProcessedJobCountByOne];
        }
        database = self->_database;
        uint64_t v16 = [v12 localIdentifier];
        int v17 = [(VCPDatabaseWriter *)database removePrioritizedLocalIdentifier:v16];

        if (v17)
        {

          goto LABEL_29;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  os_log_type_t v18 = +[VNSession globalSession];
  [v18 releaseCachedResources];

  int v17 = 0;
LABEL_29:

  return v17;
}

- (int)mainInternal
{
  double v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  double v5 = VCPSignPostLog();
  id v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPSubsampledAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Checking and processing prioritized assets...", buf, 2u);
    }
  }
  uint64_t v10 = [(VCPTask *)self photoLibrary];
  unsigned int v11 = [v10 isCloudPhotoLibraryEnabled];

  if (v11)
  {
    uint64_t v12 = +[VCPInternetReachability sharedInstance];
    self->_networkAvailable = [v12 hasWifiOrEthernetConnection];

    if (self->_networkAvailable)
    {
      unint64_t v13 = [(VCPTask *)self cancel];
      unsigned int v14 = +[VCPDownloadManager sharedManager];
      [v14 setCancel:v13];

LABEL_11:
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      unint64_t v13 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v13, v24))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v24, "Wifi/Ethernet connection unavailable; disabling streaming analysis",
          buf,
          2u);
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  [(VCPSubsampledAnalysisTask *)self checkAndMarkPriorityAssets];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(VCPSubsampledAnalysisTask *)self resetPendingBatch];
    unint64_t v15 = [(VCPDatabaseWriter *)self->_database queryPrioritizedLocalIdentifiersWithMediaType:1 mediaSubtypes:8 shouldNegateSubtypes:0 limit:2010];
    uint64_t v16 = [(VCPDatabaseWriter *)self->_database queryPrioritizedLocalIdentifiersWithMediaType:1 mediaSubtypes:8 shouldNegateSubtypes:1 limit:2010];
    int v17 = [(VCPDatabaseWriter *)self->_database queryPrioritizedLocalIdentifiersWithMediaType:2 mediaSubtypes:0 shouldNegateSubtypes:1 limit:2010];
    os_log_type_t v18 = (char *)[v15 count];
    unsigned int v19 = &v18[(void)[v16 count]];
    int v20 = (char *)[v17 count] + (void)v19;
    if (v20)
    {
      os_signpost_id_t v66 = v4;
      os_log_type_t v21 = [(VCPTask *)self progressHandler];

      if (v21)
      {
        long long v22 = [(VCPTask *)self progressHandler];
        long long v23 = +[VCPProgressReporter reporterWithIntervalSeconds:10 andTotalJobCount:v20 andBlock:v22];
      }
      else
      {
        long long v23 = 0;
      }
      id v28 = [(VCPTask *)self photoLibrary];
      CFStringRef v29 = +[PHAsset vcp_fetchOptionsForLibrary:v28 forTaskID:1];

      v69 = +[PHAsset fetchAssetsWithLocalIdentifiers:v15 options:v29];
      unsigned int v68 = +[PHAsset fetchAssetsWithLocalIdentifiers:v16 options:v29];
      double v67 = +[PHAsset fetchAssetsWithLocalIdentifiers:v17 options:v29];
      if ((int)MediaAnalysisLogLevel() > 6)
      {
        long long v30 = VCPLogInstance();
        os_log_type_t v31 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v30, v31))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Prioritized processing...", buf, 2u);
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v32 = VCPLogInstance();
        os_log_type_t v33 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v32, v33))
        {
          id v34 = [v69 count];
          *(_DWORD *)buf = 134217984;
          id v71 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Processing %lu prioritized Live Photos...", buf, 0xCu);
        }
      }
      id v35 = VCPSignPostLog();
      os_signpost_id_t v36 = os_signpost_id_generate(v35);

      id v37 = VCPSignPostLog();
      char v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPPrioritizedAnalysisProcessLivePhotos", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(VCPSubsampledAnalysisTask *)self processPriorityAssets:v69 progressReporter:v23];
      long long v39 = VCPSignPostLog();
      id v40 = v39;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v36, "VCPPrioritizedAnalysisProcessLivePhotos", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v41 = VCPLogInstance();
        os_log_type_t v42 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v41, v42))
        {
          id v43 = [v68 count];
          *(_DWORD *)buf = 134217984;
          id v71 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Processing %lu prioritized Still Photos...", buf, 0xCu);
        }
      }
      os_signpost_id_t v44 = VCPSignPostLog();
      os_signpost_id_t v45 = os_signpost_id_generate(v44);

      unint64_t v46 = VCPSignPostLog();
      unint64_t v47 = v46;
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "VCPPrioritizedAnalysisProcessStillPhotos", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(VCPSubsampledAnalysisTask *)self processPriorityAssets:v68 progressReporter:v23];
      id v48 = VCPSignPostLog();
      id v49 = v48;
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v45, "VCPPrioritizedAnalysisProcessStillPhotos", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v50 = VCPLogInstance();
        os_log_type_t v51 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v50, v51))
        {
          id v52 = [v67 count];
          *(_DWORD *)buf = 134217984;
          id v71 = v52;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Processing %lu prioritized Movies...", buf, 0xCu);
        }
      }
      v53 = VCPSignPostLog();
      os_signpost_id_t v54 = os_signpost_id_generate(v53);

      uint64_t v55 = VCPSignPostLog();
      v56 = v55;
      if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_BEGIN, v54, "VCPPrioritizedAnalysisProcessMovies", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(VCPSubsampledAnalysisTask *)self processPriorityAssets:v67 progressReporter:v23];
      v57 = VCPSignPostLog();
      os_log_type_t v58 = v57;
      if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v54, "VCPPrioritizedAnalysisProcessMovies", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(VCPBatchAnalysisTask *)self->_pendingBatch cost];
      if (v59 == 0.0 || (unsigned int v60 = [(VCPSubsampledAnalysisTask *)self processPendingBatch]) == 0)
      {
        int v27 = 0;
        int v26 = 0;
      }
      else
      {
        int v26 = v60;
        int v27 = 1;
      }

      os_signpost_id_t v4 = v66;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        int v26 = 0;
        int v27 = 1;
LABEL_64:

        if (v27) {
          return v26;
        }
        goto LABEL_65;
      }
      long long v23 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v23, v25))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v25, "No prioritized assets to analyze. Subsampled analysis complete", buf, 2u);
      }
      int v26 = 0;
      int v27 = 1;
    }

    goto LABEL_64;
  }
LABEL_65:
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v61 = VCPLogInstance();
    os_log_type_t v62 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v61, v62))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Finished subsampled analysis", buf, 2u);
    }
  }
  v63 = VCPSignPostLog();
  v64 = v63;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, v4, "VCPSubsampledAnalysisTask", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBatch, 0);
  objc_storeStrong((id *)&self->_changeManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end