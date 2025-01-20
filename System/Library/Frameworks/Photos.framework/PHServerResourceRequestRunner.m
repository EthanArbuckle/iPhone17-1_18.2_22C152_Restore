@interface PHServerResourceRequestRunner
- (BOOL)_resourceQualifiesForCacheMetricsCollection:(id)a3 isLivePhoto:(BOOL)a4;
- (BOOL)currentSystemSupportsProMotionDisplay;
- (NSString)taskIdentifier;
- (PHServerResourceRequestRunner)initWithTaskIdentifier:(id)a3;
- (id)_applyCorrectionsToAssetObjectIDURL:(id)a3 resourceIdentity:(id)a4 errorCodes:(id)a5 clientBundleID:(id)a6 library:(id)a7 reply:(id)a8;
- (id)_assetAndRelatedObjectsFromAssetObjectIDURL:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (id)_avAssetProxyForOutOfBandHintsAboutAssetForResource:(id)a3;
- (id)_urlByAttachingOutOfBandHintsToVideoURL:(id)a3 assetProxy:(id)a4 signpostId:(unint64_t)a5 hintsBase64String:(id *)a6;
- (id)applyAssetScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7;
- (id)applyResourceScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7;
- (id)chooseVideoWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6;
- (id)makeResourceAvailableWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6;
- (id)mutableStreamingHintsForAVAssetProxy:(id)a3;
- (id)startDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 needsDownload:(BOOL)a7 shouldApplyTimeRange:(BOOL)a8 reply:(id)a9;
- (id)videoResourceChoiceForAsset:(id)a3 context:(id)a4 loadingMode:(int64_t *)a5 request:(id)a6 shouldReturnAdjustmentInfo:(BOOL *)a7 error:(id *)a8;
- (int64_t)state;
- (void)_cancelWithReply:(id)a3;
- (void)_handleProgress:(id)a3;
- (void)_replyToVideoRequestWithURL:(id)a3 mediaItemMakerData:(id)a4 mutableInfo:(id)a5 internalInfo:(id)a6 error:(id)a7 pathForAdjustmentFileIfNeeded:(id)a8 reply:(id)a9;
- (void)_safeReply:(id)a3;
- (void)addClientSystemInformationToMutableStreamingHints:(id)a3;
- (void)dealloc;
- (void)makeResourceUnavailableWithRequest:(id)a3 library:(id)a4;
- (void)setState:(int64_t)a3;
- (void)startWalrusTimeRangeDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 partialVideoURL:(id)a7 reply:(id)a8;
@end

@implementation PHServerResourceRequestRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_dataStoreFollower, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (id)_urlByAttachingOutOfBandHintsToVideoURL:(id)a3 assetProxy:(id)a4 signpostId:(unint64_t)a5 hintsBase64String:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = PLImageManagerGetLog();
  v12 = v11;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_BEGIN, a5, "com.apple.photos.backend.chooseVideo.outOfBandHints", (const char *)&unk_19B30018E, buf, 2u);
  }

  id v13 = v9;
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v15 = v13;
    if (v10)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v10 timeZoneLookup:0];
      v17 = [v16 outOfBandHintsBase64String];
      v18 = v17;
      if (a6) {
        *a6 = v17;
      }
      v15 = [MEMORY[0x1E4F8CC38] urlByAttachingOutOfBandHintsBase64String:v18 toVideoURL:v14];
    }
  }
  v19 = PLImageManagerGetLog();
  v20 = v19;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_END, a5, "com.apple.photos.backend.chooseVideo.outOfBandHints", (const char *)&unk_19B30018E, v22, 2u);
  }

  return v15;
}

- (id)_avAssetProxyForOutOfBandHintsAboutAssetForResource:(id)a3
{
  v3 = [a3 asset];
  if ([v3 hasAdjustments]) {
    [v3 avAssetProxyForFullSizeAllowReadFromFile:1];
  }
  else {
  v4 = [v3 avAssetProxyForOriginalAllowReadFromFile:1];
  }

  return v4;
}

- (id)mutableStreamingHintsForAVAssetProxy:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PHServerResourceRequestRunner *)self addClientSystemInformationToMutableStreamingHints:v5];
  if (v4)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v4 timeZoneLookup:0];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F597E0]];
      if ([v6 isSpatialMedia])
      {
        v8 = [NSNumber numberWithInteger:*MEMORY[0x1E4F597D8]];
        [v7 addObject:v8];
      }
      if ([v6 isHDR])
      {
        id v9 = [NSNumber numberWithInteger:*MEMORY[0x1E4F597D0]];
        [v7 addObject:v9];
      }
      id v10 = [v6 hevcProfileInfo];
      v11 = v10;
      if (v10)
      {
        v12 = [v10 profile];
        [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F59808]];

        id v13 = [v11 tier];
        [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F59810]];

        v14 = [v11 level];
        [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F597F0]];
      }
      v15 = [v6 cameraMake];

      if (v15)
      {
        v16 = [v6 cameraMake];
        [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F597F8]];
      }
      v17 = [v6 cameraModel];

      if (v17)
      {
        v18 = [v6 cameraModel];
        [v5 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F59800]];
      }
    }
    v19 = [v6 apacAudioTrackChannelCount];

    if (v19)
    {
      v20 = [v6 apacAudioTrackChannelCount];
      [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F597B0]];
    }
    v21 = [v6 apacAudioTrackHoaChannelCount];

    if (v21)
    {
      v22 = [v6 apacAudioTrackHoaChannelCount];
      [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F597C0]];

      v23 = [v6 apacAudioTrackBedChannelCount];
      [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F597A8]];
    }
    v24 = [v6 apacAudioTrackCodecProfileLevelDescription];

    if (v24)
    {
      v25 = [v6 apacAudioTrackCodecProfileLevelDescription];
      [v5 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F597B8]];
    }
  }

  return v5;
}

- (void)startWalrusTimeRangeDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 partialVideoURL:(id)a7 reply:(id)a8
{
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v46 = a5;
  id v43 = a7;
  id v15 = a8;
  v16 = PLImageManagerGetLog();
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v13);

  v18 = PLImageManagerGetLog();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload", (const char *)&unk_19B30018E, buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke;
  aBlock[3] = &unk_1E5843320;
  id v62 = v15;
  os_signpost_id_t v63 = v17;
  id v45 = v15;
  v39 = _Block_copy(aBlock);
  v20 = [v14 asset];
  v38 = [v20 uuid];
  v44 = v20;
  v21 = [v20 photoLibrary];
  v42 = [v21 managedObjectContext];
  v22 = [v14 uniformTypeIdentifier];
  v37 = [v22 identifier];

  if (v10)
  {
    v23 = [v14 asset];
    v24 = [v23 pathForAdjustmentFile];
  }
  else
  {
    v24 = 0;
  }
  v47 = v13;
  v25 = [v13 behaviorSpec];
  v41 = [(PHServerResourceRequestRunner *)self _avAssetProxyForOutOfBandHintsAboutAssetForResource:v14];
  v40 = -[PHServerResourceRequestRunner mutableStreamingHintsForAVAssetProxy:](self, "mutableStreamingHintsForAVAssetProxy:");
  [v40 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F597E8]];
  v26 = PLImageManagerGetLog();
  v27 = v26;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v17, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload.streamingUrl", (const char *)&unk_19B30018E, buf, 2u);
  }

  v28 = [v14 dataStore];
  uint64_t v34 = [v25 streamingVideoIntent];
  if (v25) {
    [v25 timeRange];
  }
  else {
    memset(v60, 0, sizeof(v60));
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_147;
  v50[3] = &unk_1E58433E8;
  os_signpost_id_t v59 = v17;
  id v57 = v24;
  id v58 = v39;
  v50[4] = self;
  id v51 = v43;
  id v52 = v25;
  id v53 = v38;
  id v54 = v37;
  id v55 = v21;
  id v56 = v14;
  id v36 = v24;
  id v29 = v14;
  id v35 = v21;
  id v30 = v37;
  id v31 = v38;
  id v32 = v25;
  id v49 = v43;
  id v33 = v39;
  [v28 requestStreamingURLForResource:v29 asset:v44 intent:v34 timeRange:v60 streamingHints:v40 inContext:v42 clientBundleID:v46 completion:v50];
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  os_signpost_id_t v17 = PLImageManagerGetLog();
  v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 40);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v19, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload", (const char *)&unk_19B30018E, v20, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_147(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = PLImageManagerGetLog();
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 104);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_END, v14, "com.apple.photos.backend.chooseVideo.adpVideoTimeRangeDownload.streamingUrl", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (v9)
  {
    id v15 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
    id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v36 = 0;
    char v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v18 = v36;

    if (v17)
    {
      os_signpost_id_t v19 = *(void **)(a1 + 48);
      if (v19) {
        [v19 timeRange];
      }
      else {
        memset(v35, 0, sizeof(v35));
      }
      uint64_t v22 = *(void *)(a1 + 56);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_150;
      v27[3] = &unk_1E58433C0;
      uint64_t v23 = *(void *)(a1 + 40);
      v27[4] = *(void *)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 104);
      id v33 = *(id *)(a1 + 96);
      id v28 = *(id *)(a1 + 40);
      id v29 = *(id *)(a1 + 64);
      id v30 = *(id *)(a1 + 72);
      id v25 = *(id *)(a1 + 80);
      uint64_t v26 = *(void *)(a1 + 104);
      id v31 = v25;
      uint64_t v34 = v26;
      id v32 = *(id *)(a1 + 88);
      +[PHImageManager exportVideoFileForTimeRange:v35 fromVideoMediaItemMakerData:v9 forAssetUuid:v22 toOutputFileURL:v23 fingerPrint:v10 signpostId:v24 options:0 completion:v27];
    }
    else
    {
      v20 = PLImageManagerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v21;
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ ADP time range video export failed, unable to create parent directories: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) _replyToVideoRequestWithURL:0 mediaItemMakerData:0 mutableInfo:0 internalInfo:0 error:v18 pathForAdjustmentFileIfNeeded:0 reply:*(void *)(a1 + 96)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) _replyToVideoRequestWithURL:0 mediaItemMakerData:0 mutableInfo:0 internalInfo:0 error:v11 pathForAdjustmentFileIfNeeded:0 reply:*(void *)(a1 + 96)];
  }
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_150(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [MEMORY[0x1E4F8A6D8] markPurgeableForFileAtURL:*(void *)(a1 + 40) withUrgency:0 outInode:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = PLImageManagerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "[RM]: %{public}@ ADP time range video download complete with url: %@", buf, 0x16u);
    }

    [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"PHImageFileUTIKey"];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__9936;
    id v25 = __Block_byref_object_dispose__9937;
    id v26 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_151;
    os_signpost_id_t v19 = &unk_1E5848318;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v22 = buf;
    uint64_t v20 = v11;
    id v12 = *(void **)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    [v12 performBlockAndWait:&v16];
    id v13 = [*(id *)(a1 + 32) _urlByAttachingOutOfBandHintsToVideoURL:*(void *)(a1 + 40) assetProxy:*(void *)(*(void *)&buf[8] + 40) signpostId:*(void *)(a1 + 88) hintsBase64String:0];
    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v13, 0, v6, v7, v5, *(void *)(a1 + 72), *(void *)(a1 + 80), v16, v17, v18, v19, v20);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_signpost_id_t v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ ADP time range video export failed: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _replyToVideoRequestWithURL:0 mediaItemMakerData:0 mutableInfo:0 internalInfo:0 error:v5 pathForAdjustmentFileIfNeeded:0 reply:*(void *)(a1 + 80)];
  }
}

void __152__PHServerResourceRequestRunner_startWalrusTimeRangeDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_partialVideoURL_reply___block_invoke_151(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _avAssetProxyForOutOfBandHintsAboutAssetForResource:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)startDownloadForRequest:(id)a3 backingResource:(id)a4 clientBundleID:(id)a5 shouldReturnAdjustmentInfo:(BOOL)a6 needsDownload:(BOOL)a7 shouldApplyTimeRange:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v46 = a9;
  id v16 = a5;
  id v49 = [v15 asset];
  id v45 = [v49 photoLibrary];
  uint64_t v17 = [v15 uniformTypeIdentifier];
  v44 = [v17 identifier];

  id v18 = @"generation";
  if (v9) {
    id v18 = @"download";
  }
  id v43 = v18;
  os_signpost_id_t v19 = [v14 behaviorSpec];
  char v42 = [v19 isNetworkAccessAllowed];
  if (v10)
  {
    uint64_t v20 = [v15 asset];
    id v21 = [v20 pathForAdjustmentFile];
  }
  else
  {
    id v21 = 0;
  }
  uint64_t v22 = [v15 dataStore];
  int v23 = [v22 supportsTimeRange] & !v10;

  uint64_t v24 = PLImageManagerGetLog();
  os_signpost_id_t v41 = os_signpost_id_make_with_pointer(v24, v14);

  id v25 = objc_alloc_init(MEMORY[0x1E4F8AB48]);
  [v25 setTaskIdentifier:self->_taskIdentifier];
  objc_msgSend(v25, "setNetworkAccessAllowed:", objc_msgSend(v19, "isNetworkAccessAllowed"));
  objc_msgSend(v25, "setWantsProgress:", objc_msgSend(v14, "wantsProgress"));
  [v25 setClientBundleID:v16];

  uint64_t v26 = [v19 downloadIntent];
  uint64_t v27 = [v19 downloadPriority];
  if ((unint64_t)(v26 - 1) > 0xB) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = qword_19B2CC7A8[v26 - 1];
  }
  v48 = v14;
  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F59958]) initWithIntent:v28 priority:v27 == 1];
  [v25 setDownloadOptions:v29];

  if (v23)
  {
    if (v19)
    {
      [v19 timeRange];
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v63 = 0u;
    }
    id v30 = [v25 downloadOptions];
    v62[0] = v63;
    v62[1] = v64;
    v62[2] = v65;
    [v30 setTimeRange:v62];
  }
  BOOL v31 = -[PHServerResourceRequestRunner _resourceQualifiesForCacheMetricsCollection:isLivePhoto:](self, "_resourceQualifiesForCacheMetricsCollection:isLivePhoto:", v15, [v49 isPhotoIris]);
  id v32 = [v15 dataStore];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke;
  v50[3] = &unk_1E5843398;
  v50[4] = self;
  id v51 = v43;
  BOOL v58 = v31;
  BOOL v59 = a8;
  char v60 = v23;
  id v52 = v44;
  id v53 = v45;
  id v54 = v15;
  id v55 = v21;
  id v56 = v46;
  os_signpost_id_t v57 = v41;
  char v61 = v42;
  id v33 = v46;
  id v34 = v21;
  id v35 = v15;
  id v36 = v45;
  id v37 = v44;
  uint64_t v38 = v43;
  __int16 v39 = [v32 requestLocalAvailabilityChange:1 forResource:v35 options:v25 completion:v50];

  return v39;
}

void __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v10 = PLImageManagerGetLog();
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      id v33 = v7;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video %{public}@ complete with url: %@", buf, 0x20u);
    }

    [v9 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"PHImageFileUTIKey"];
    id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 96)];
    [v9 setObject:v14 forKeyedSubscript:@"PHImageRequestResultEligibleForCacheMetricsLogging"];

    if (*(unsigned char *)(a1 + 96)) {
      [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"];
    }
    if (*(unsigned char *)(a1 + 97))
    {
      if (*(unsigned char *)(a1 + 98)) {
        [MEMORY[0x1E4F8A6D8] markPurgeableForFileAtURL:v7 withUrgency:0 outInode:0];
      }
      else {
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHApplyTimeRangeKey"];
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v33 = __Block_byref_object_copy__9936;
    id v34 = __Block_byref_object_dispose__9937;
    id v35 = 0;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke_146;
    uint64_t v28 = &unk_1E5848318;
    uint64_t v22 = *(void *)(a1 + 32);
    BOOL v31 = buf;
    uint64_t v29 = v22;
    int v23 = *(void **)(a1 + 56);
    id v30 = *(id *)(a1 + 64);
    [v23 performBlockAndWait:&v25];
    uint64_t v24 = [*(id *)(a1 + 32) _urlByAttachingOutOfBandHintsToVideoURL:v7 assetProxy:*(void *)(*(void *)&buf[8] + 40) signpostId:*(void *)(a1 + 88) hintsBase64String:0];

    objc_msgSend(*(id *)(a1 + 32), "_replyToVideoRequestWithURL:mediaItemMakerData:mutableInfo:internalInfo:error:pathForAdjustmentFileIfNeeded:reply:", v24, 0, v8, v9, v6, *(void *)(a1 + 72), *(void *)(a1 + 80), v25, v26, v27, v28, v29);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      id v33 = v6;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ video %{public}@ failed with error: %@", buf, 0x20u);
    }

    uint64_t v17 = [v6 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F59778]]) {
      BOOL v18 = [v6 code] == 80 || objc_msgSend(v6, "code") == 81 || objc_msgSend(v6, "code") == 82;
    }
    else {
      BOOL v18 = 0;
    }

    os_signpost_id_t v19 = [v6 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F8C520]]) {
      BOOL v20 = [v6 code] == 6;
    }
    else {
      BOOL v20 = 0;
    }

    if ((v18 || v20)
      && ([v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsInCloudKey"], v20))
    {
      if (*(unsigned char *)(a1 + 99)) {
        PHStreamingDeniedError();
      }
      else {
      uint64_t v21 = PHNetworkAccessAllowedRequiredError();
      }
    }
    else
    {
      uint64_t v21 = (uint64_t)v6;
    }
    [*(id *)(a1 + 32) _replyToVideoRequestWithURL:0 mediaItemMakerData:0 mutableInfo:v8 internalInfo:v9 error:v21 pathForAdjustmentFileIfNeeded:*(void *)(a1 + 72) reply:*(void *)(a1 + 80)];
    id v6 = (uint64_t (*)(uint64_t, uint64_t))v21;
  }
}

void __156__PHServerResourceRequestRunner_startDownloadForRequest_backingResource_clientBundleID_shouldReturnAdjustmentInfo_needsDownload_shouldApplyTimeRange_reply___block_invoke_146(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _avAssetProxyForOutOfBandHintsAboutAssetForResource:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)currentSystemSupportsProMotionDisplay
{
  if (currentSystemSupportsProMotionDisplay_onceToken != -1) {
    dispatch_once(&currentSystemSupportsProMotionDisplay_onceToken, &__block_literal_global_141);
  }
  return currentSystemSupportsProMotionDisplay_currentSystemSupportsProMotionDisplay;
}

void __70__PHServerResourceRequestRunner_currentSystemSupportsProMotionDisplay__block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  currentSystemSupportsProMotionDisplay_currentSystemSupportsProMotionDisplay = [v0 BOOLValue];
}

- (void)addClientSystemInformationToMutableStreamingHints:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PHServerResourceRequestRunner.m", 961, @"Invalid parameter not satisfying: %@", @"mutableStreamingHints" object file lineNumber description];
  }
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PHServerResourceRequestRunner currentSystemSupportsProMotionDisplay](self, "currentSystemSupportsProMotionDisplay"));
  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F597C8]];
}

- (id)chooseVideoWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(PHServerResourceRequestRunner *)self state])
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PHServerResourceRequestRunner.m" lineNumber:707 description:@"Cannot run a video request twice"];
  }
  uint64_t v15 = PLImageManagerGetLog();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v11);

  uint64_t v17 = PLImageManagerGetLog();
  BOOL v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138543618;
    id v48 = v11;
    __int16 v49 = 2114;
    id v50 = v13;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "com.apple.photos.backend.chooseVideo", "Request %{public}@ for client %{public}@", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke;
  aBlock[3] = &unk_1E5843320;
  os_signpost_id_t v46 = v16;
  id v19 = v14;
  id v45 = v19;
  BOOL v20 = _Block_copy(aBlock);
  uint64_t v21 = [v11 behaviorSpec];
  [(PHServerResourceRequestRunner *)self setState:1];
  uint64_t v22 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v22;

  objc_initWeak((id *)buf, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_118;
  v41[3] = &unk_1E5847980;
  objc_copyWeak(&v43, (id *)buf);
  id v24 = v20;
  id v42 = v24;
  [(NSProgress *)self->_progress setCancellationHandler:v41];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_3;
  v33[3] = &unk_1E5843370;
  id v25 = v21;
  id v34 = v25;
  id v26 = v12;
  id v35 = v26;
  uint64_t v36 = self;
  id v27 = v11;
  id v37 = v27;
  id v28 = v13;
  id v38 = v28;
  os_signpost_id_t v40 = v16;
  id v29 = v24;
  id v39 = v29;
  [v26 performBlock:v33];
  id v30 = self->_progress;

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);

  return v30;
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = PLImageManagerGetLog();
  BOOL v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 40);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)BOOL v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v19, "com.apple.photos.backend.chooseVideo", (const char *)&unk_19B30018E, v20, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_118(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_2;
  v3[3] = &unk_1E5848D50;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _cancelWithReply:v3];
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  int v131 = [*(id *)(a1 + 32) isNetworkAccessAllowed];
  int v2 = [*(id *)(a1 + 32) isStreamingAllowed];
  if ([*(id *)(a1 + 40) isWalrusEnabled]) {
    int v133 = 1;
  }
  else {
    int v133 = [*(id *)(a1 + 32) restrictToEncryptedStream];
  }
  uint64_t v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id *)(a1 + 56);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 48);
    if ([*(id *)(a1 + 56) wantsProgress]) {
      id v6 = @"Y";
    }
    else {
      id v6 = @"N";
    }
    id v7 = [*v4 assetObjectIDURL];
    [*v4 size];
    id v9 = v8;
    [*v4 size];
    uint64_t v11 = v10;
    uint64_t v12 = [*(id *)(a1 + 32) shortDescription];
    id v13 = (void *)v12;
    if (v131) {
      id v14 = @"Y";
    }
    else {
      id v14 = @"N";
    }
    *(_DWORD *)buf = 138545410;
    if (v2) {
      id v15 = @"Y";
    }
    else {
      id v15 = @"N";
    }
    uint64_t v160 = v5;
    __int16 v161 = 2114;
    if (v133) {
      id v16 = @"Y";
    }
    else {
      id v16 = @"N";
    }
    uint64_t v162 = (uint64_t)v6;
    __int16 v163 = 2114;
    v164 = v7;
    __int16 v165 = 2048;
    v166 = v9;
    __int16 v167 = 2048;
    uint64_t v168 = v11;
    __int16 v169 = 2114;
    uint64_t v170 = v12;
    __int16 v171 = 2114;
    v172 = v14;
    __int16 v173 = 2114;
    v174 = v15;
    __int16 v175 = 2114;
    v176 = v16;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Starting request for video with progress: %{public}@, asset: %{public}@, size (%f, %f), behavior: %{public}@, net-initial: %{public}@, stream-initial: %{public}@, ADP: %{public}@", buf, 0x5Cu);
  }
  v138 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v17 = *(void **)(a1 + 48);
  BOOL v18 = [*(id *)(a1 + 56) assetObjectIDURL];
  id v156 = 0;
  os_signpost_id_t v19 = [v17 _assetAndRelatedObjectsFromAssetObjectIDURL:v18 inManagedObjectContext:v138 error:&v156];
  BOOL v20 = v156;

  uint64_t v21 = PLImageManagerGetLog();
  uint64_t v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 48);
      id v24 = [v19 uuid];
      if ([v19 hasAdjustments]) {
        id v25 = @"Y";
      }
      else {
        id v25 = @"N";
      }
      [v19 deferredProcessingNeeded];
      id v26 = PLManagedAssetDeferredProcessingNeededDescription();
      *(_DWORD *)buf = 138544130;
      uint64_t v160 = v23;
      __int16 v161 = 2114;
      uint64_t v162 = (uint64_t)v24;
      __int16 v163 = 2114;
      v164 = v25;
      __int16 v165 = 2114;
      v166 = v26;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ video request found asset: %{public}@, hasAdjustments: %{public}@, deferredProcessingNeeded: %{public}@", buf, 0x2Au);
    }
    v137 = (void *)[objc_alloc(MEMORY[0x1E4F8AC90]) initWithManagedObjectContext:v138 asset:v19];
    if ([v19 videoDeferredProcessingNeeded])
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 48);
      id v155 = 0;
      char v28 = [MEMORY[0x1E4F8AAD0] bailOutOfVideoFinalizationForAsset:v19 taskIdentifier:v27 error:&v155];
      id v29 = (__CFString *)v155;
      if ((v28 & 1) == 0)
      {
        id v30 = PLImageManagerGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 48);
          id v32 = [v19 uuid];
          *(_DWORD *)buf = 138543874;
          uint64_t v160 = v31;
          __int16 v161 = 2114;
          uint64_t v162 = (uint64_t)v32;
          __int16 v163 = 2112;
          v164 = v29;
          _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Failed to bail out of video finalization for asset with UUID: %{public}@ and error: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v160 = v33;
      __int16 v161 = 2112;
      uint64_t v162 = (uint64_t)v20;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 48) setState:3];
    v137 = 0;
  }
  uint64_t v154 = 0;
  char v153 = 0;
  [MEMORY[0x1E4F8BA10] maskForAssetsEligibleForCloudKitTransport];
  [v19 savedAssetType];
  int v34 = PLValidatedSavedAssetTypeApplies();
  id v35 = 0;
  int v36 = v2 ^ 1;
  if ([*(id *)(a1 + 48) state] == 3 || (v36 & 1) != 0 || ((v34 ^ 1) & 1) != 0 || ((v133 ^ 1) & 1) != 0)
  {
    v141 = 0;
    id v39 = v20;
  }
  else
  {
    id v37 = *(void **)(a1 + 48);
    uint64_t v38 = *(void *)(a1 + 56);
    v152 = v20;
    v141 = [v37 videoResourceChoiceForAsset:v19 context:v137 loadingMode:&v154 request:v38 shouldReturnAdjustmentInfo:&v153 error:&v152];
    id v39 = v152;

    if (v141)
    {
      objc_msgSend(v137, "backingResourceForVideoResource:");
      id v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v40 = [(__CFString *)v35 fingerprint];
      if (v40)
      {
        os_signpost_id_t v41 = [*(id *)(a1 + 40) fingerprintContext];
        id v42 = [v41 fingerprintSchemeForFingerprint:v40];

        if (v42 && ([v42 allowsStreaming] & 1) == 0)
        {
          [*(id *)(a1 + 32) setStreamingAllowed:0];
          id v43 = *(void **)(a1 + 32);
          long long v44 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
          v151[0] = *MEMORY[0x1E4F1FA20];
          v151[1] = v44;
          v151[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
          [v43 setTimeRange:v151];
          if (v131 && ([*(id *)(a1 + 32) streamingIntentAllowsFallbackToDownload] & 1) == 0) {
            [*(id *)(a1 + 32) setNetworkAccessAllowed:0];
          }
          id v45 = PLImageManagerGetLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            uint64_t v46 = *(void *)(*(void *)(a1 + 48) + 48);
            v139 = [v19 uuid];
            v47 = [v42 fingerprintSchemeDescription];
            *(_DWORD *)buf = 138544130;
            uint64_t v160 = v46;
            __int16 v161 = 2114;
            uint64_t v162 = (uint64_t)v139;
            __int16 v163 = 2114;
            v164 = v35;
            __int16 v165 = 2112;
            v166 = v47;
            _os_log_impl(&dword_19B043000, v45, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser overriding streaming with download for asset %{public}@ / resource %{public}@ because ADP+%@ are enabled", buf, 0x2Au);
          }
          id v35 = 0;
          v141 = 0;
          uint64_t v154 = 0;
          char v153 = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      else
      {
        id v42 = 0;
      }
      id v48 = PLImageManagerGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = *(void *)(*(void *)(a1 + 48) + 48);
        id v50 = PLVideoResourceDescription();
        *(_DWORD *)buf = 138543618;
        uint64_t v160 = v49;
        __int16 v161 = 2114;
        uint64_t v162 = (uint64_t)v50;
        _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser selected result: %{public}@", buf, 0x16u);
      }
      goto LABEL_54;
    }
    id v35 = 0;
    v141 = 0;
  }
LABEL_55:
  if ([*(id *)(a1 + 48) state] != 1 || v141)
  {
    v140 = v39;
  }
  else
  {
    uint64_t v51 = *(void **)(a1 + 48);
    uint64_t v52 = *(void *)(a1 + 56);
    v150 = v39;
    v141 = [v51 videoResourceChoiceForAsset:v19 context:v137 loadingMode:&v154 request:v52 shouldReturnAdjustmentInfo:&v153 error:&v150];
    v140 = v150;

    if (v141)
    {
      uint64_t v53 = objc_msgSend(v137, "backingResourceForVideoResource:");

      id v54 = PLImageManagerGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 48);
        id v56 = PLVideoResourceDescription();
        *(_DWORD *)buf = 138543618;
        uint64_t v160 = v55;
        __int16 v161 = 2114;
        uint64_t v162 = (uint64_t)v56;
        _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_INFO, "[RM]: %{public}@ video chooser selected result: %{public}@", buf, 0x16u);
      }
      id v35 = (__CFString *)v53;
    }
    else
    {
      v141 = 0;
    }
  }
  v132 = [v19 uuid];
  int v57 = [*(id *)(a1 + 32) hasValidTimeRange];
  BOOL v58 = [(__CFString *)v35 dataStore];
  int v59 = [v58 supportsTimeRange];
  BOOL v60 = v153 != 0;

  uint64_t v61 = [*(id *)(a1 + 48) state];
  unsigned int v130 = v57 & v36;
  int v62 = v57 & v36 ^ 1;
  if (v61 != 1) {
    int v62 = 1;
  }
  if (((v62 | v59 ^ 1 | v60) & 1) != 0
    || ([(__CFString *)v35 fingerprint],
        long long v63 = objc_claimAutoreleasedReturnValue(),
        BOOL v64 = v63 == 0,
        v63,
        v64))
  {
    id v68 = 0;
    v135 = 0;
    v136 = 0;
    int v69 = 0;
  }
  else
  {
    long long v65 = [*(id *)(a1 + 40) pathManager];
    v66 = [(__CFString *)v35 fingerprint];
    v67 = *(void **)(a1 + 32);
    if (v67) {
      [v67 timeRange];
    }
    else {
      memset(v149, 0, 48);
    }
    v135 = [v65 URLForPartialVideoWithResourceFingerprint:v66 assetUUID:v132 timeRange:v149];

    if ([v135 checkResourceIsReachableAndReturnError:0])
    {
      [*(id *)(a1 + 48) setState:4];
      id v68 = v135;
      v136 = [(id)*MEMORY[0x1E4F44438] identifier];

      unsigned int v130 = 0;
      int v69 = 0;
      v140 = 0;
      v135 = v68;
    }
    else
    {
      id v68 = 0;
      v136 = 0;
      if (v154 == 2) {
        int v69 = v133;
      }
      else {
        int v69 = 0;
      }
    }
  }
  if ([*(id *)(a1 + 48) state] == 1)
  {
    uint64_t v70 = v154;
    switch(v154)
    {
      case 0:
        [*(id *)(a1 + 48) setState:3];
        v80 = PLImageManagerGetLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = *(void *)(*(void *)(a1 + 48) + 48);
          v82 = [v19 uuid];
          *(_DWORD *)buf = 138543874;
          uint64_t v160 = v81;
          __int16 v161 = 2114;
          uint64_t v162 = (uint64_t)v82;
          __int16 v163 = 2112;
          v164 = (__CFString *)v140;
          _os_log_impl(&dword_19B043000, v80, OS_LOG_TYPE_ERROR, "[RM] %{public}@: Video request unable to find video resource for asset with uuid: %{public}@, error: %@", buf, 0x20u);
        }
        uint64_t v83 = PHErrorFromPLError(v140);
        int v79 = 0;
        goto LABEL_109;
      case 1:
        [*(id *)(a1 + 48) setState:3];
        v84 = PLImageManagerGetLog();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v85 = *(void *)(*(void *)(a1 + 48) + 48);
          *(_DWORD *)buf = 138543362;
          uint64_t v160 = v85;
          _os_log_impl(&dword_19B043000, v84, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ resource is in the cloud, but network access not allowed", buf, 0xCu);
        }

        if (v131) {
          PHStreamingDeniedError();
        }
        else {
        uint64_t v83 = PHNetworkAccessAllowedRequiredError();
        }
        int v79 = 1;
LABEL_109:
        v78 = v140;
        v96 = v68;
        uint64_t v97 = (uint64_t)v136;
        v140 = v83;
        break;
      case 2:
      case 4:
        v71 = PLImageManagerGetLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          uint64_t v72 = *(void *)(*(void *)(a1 + 48) + 48);
          v73 = @"generation";
          if (v70 == 2) {
            v73 = @"download";
          }
          *(_DWORD *)buf = 138543874;
          uint64_t v160 = v72;
          __int16 v161 = 2114;
          uint64_t v162 = (uint64_t)v73;
          __int16 v163 = 1024;
          LODWORD(v164) = v69;
          _os_log_impl(&dword_19B043000, v71, OS_LOG_TYPE_INFO, "[RM]: %{public}@ requesting video %{public}@, partial ADP download=%d", buf, 0x1Cu);
        }

        v74 = *(void **)(a1 + 48);
        uint64_t v75 = *(void *)(a1 + 56);
        uint64_t v76 = *(void *)(a1 + 64);
        BOOL v77 = v153 != 0;
        if (v69)
        {
          [v74 startWalrusTimeRangeDownloadForRequest:v75 backingResource:v35 clientBundleID:v76 shouldReturnAdjustmentInfo:v77 partialVideoURL:v135 reply:*(void *)(a1 + 72)];
          v78 = 0;
        }
        else
        {
          v78 = [v74 startDownloadForRequest:v75 backingResource:v35 clientBundleID:v76 shouldReturnAdjustmentInfo:v77 needsDownload:v70 == 2 shouldApplyTimeRange:v130 reply:*(void *)(a1 + 72)];
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
        uint64_t v100 = *(void *)(a1 + 48);
        if (*(void *)(v100 + 40) == 1)
        {
          objc_initWeak((id *)buf, (id)v100);
          if (v78)
          {
            id v101 = objc_alloc(MEMORY[0x1E4F8AAE8]);
            v142[0] = MEMORY[0x1E4F143A8];
            v142[1] = 3221225472;
            v142[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_130;
            v142[3] = &unk_1E5847C08;
            objc_copyWeak(&v143, (id *)buf);
            uint64_t v102 = [v101 initWithSourceProgress:v78 progressHandler:v142];
            uint64_t v103 = *(void *)(a1 + 48);
            v104 = *(void **)(v103 + 24);
            *(void *)(v103 + 24) = v102;

            objc_destroyWeak(&v143);
          }
          *(void *)(*(void *)(a1 + 48) + 40) = 2;
          uint64_t v105 = [(__CFString *)v35 dataStore];
          uint64_t v106 = *(void *)(a1 + 48);
          v107 = *(void **)(v106 + 32);
          *(void *)(v106 + 32) = v105;

          objc_destroyWeak((id *)buf);
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 16));
          [v78 cancel];
        }
        goto LABEL_114;
      case 3:
        v86 = PLImageManagerGetLog();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          uint64_t v87 = *(void *)(*(void *)(a1 + 48) + 48);
          uint64_t v88 = [*(id *)(a1 + 32) streamingVideoIntent];
          *(_DWORD *)buf = 138543618;
          uint64_t v160 = v87;
          __int16 v161 = 2048;
          uint64_t v162 = v88;
          _os_log_impl(&dword_19B043000, v86, OS_LOG_TYPE_INFO, "[RM]: %{public}@ requesting video streaming url with intent %ld", buf, 0x16u);
        }

        v89 = [*(id *)(a1 + 48) _avAssetProxyForOutOfBandHintsAboutAssetForResource:v35];
        v90 = [*(id *)(a1 + 48) mutableStreamingHintsForAVAssetProxy:v89];
        v91 = v90;
        if (v133) {
          [v90 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F597E8]];
        }
        v92 = [(__CFString *)v35 dataStore];
        uint64_t v93 = [*(id *)(a1 + 32) streamingVideoIntent];
        v94 = *(void **)(a1 + 32);
        uint64_t v134 = v93;
        if (v94)
        {
          [v94 timeRange];
          v95 = v91;
        }
        else
        {
          v95 = v91;
          memset(v148, 0, sizeof(v148));
        }
        uint64_t v108 = *(void *)(a1 + 48);
        uint64_t v109 = *(void *)(a1 + 64);
        v144[0] = MEMORY[0x1E4F143A8];
        v144[1] = 3221225472;
        v144[2] = __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_122;
        v144[3] = &unk_1E5843348;
        v144[4] = v108;
        v78 = v89;
        v111 = *(void **)(a1 + 72);
        uint64_t v110 = *(void *)(a1 + 80);
        v145 = v78;
        uint64_t v147 = v110;
        id v146 = v111;
        [v92 requestStreamingURLForResource:v35 asset:v19 intent:v134 timeRange:v148 streamingHints:v95 inContext:v138 clientBundleID:v109 completion:v144];

        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
        uint64_t v112 = *(void *)(a1 + 48);
        if (*(void *)(v112 + 40) == 1)
        {
          *(void *)(v112 + 40) = 2;
          uint64_t v112 = *(void *)(a1 + 48);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v112 + 16));

LABEL_114:
        int v79 = 0;
        v96 = v68;
        uint64_t v97 = (uint64_t)v136;
        break;
      case 5:
        [*(id *)(a1 + 48) setState:4];
        v96 = [v141 fileURLIfLocal];

        uint64_t v97 = [v141 uniformTypeIdentifier];

        v78 = PLImageManagerGetLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v98 = *(void *)(*(void *)(a1 + 48) + 48);
          v99 = [v96 path];
          *(_DWORD *)buf = 138543618;
          uint64_t v160 = v98;
          __int16 v161 = 2112;
          uint64_t v162 = (uint64_t)v99;
          _os_log_impl(&dword_19B043000, v78, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ returning locally available video at path: %@", buf, 0x16u);
        }
        int v79 = 0;
        break;
      default:
        goto LABEL_78;
    }

    id v68 = v96;
    v136 = (void *)v97;
  }
  else
  {
LABEL_78:
    int v79 = 0;
  }
  if ([*(id *)(a1 + 48) state] == 1)
  {
    v113 = PLImageManagerGetLog();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      uint64_t v114 = *(void *)(*(void *)(a1 + 48) + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v160 = v114;
      _os_log_impl(&dword_19B043000, v113, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request failed to complete", buf, 0xCu);
    }

    v115 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v157 = *MEMORY[0x1E4F28228];
    v116 = [NSString stringWithFormat:@"Video request failed to complete"];
    v158 = v116;
    v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
    uint64_t v118 = [v115 errorWithDomain:@"PHPhotosErrorDomain" code:4301 userInfo:v117];

    [*(id *)(a1 + 48) setState:3];
    v140 = v118;
  }
  if ([*(id *)(a1 + 48) state] == 2)
  {
    v119 = v68;
  }
  else
  {
    id v120 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v121 = v120;
    if (v79) {
      [v120 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsInCloudKey"];
    }
    id v122 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v122 setObject:v136 forKeyedSubscript:@"PHImageFileUTIKey"];
    if ((v79 & 1) == 0)
    {
      uint64_t v123 = objc_msgSend(*(id *)(a1 + 48), "_resourceQualifiesForCacheMetricsCollection:isLivePhoto:", v35, objc_msgSend(v19, "isPhotoIris"));
      v124 = [NSNumber numberWithBool:v123];
      [v122 setObject:v124 forKeyedSubscript:@"PHImageRequestResultEligibleForCacheMetricsLogging"];

      if (v123)
      {
        v125 = NSNumber;
        if (v35) {
          BOOL v126 = (int)[(__CFString *)v35 localAvailability] > 0;
        }
        else {
          BOOL v126 = 0;
        }
        v127 = [v125 numberWithInt:v126];
        [v122 setObject:v127 forKeyedSubscript:@"PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"];
      }
      if (v130) {
        [v121 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHApplyTimeRangeKey"];
      }
    }
    if (v153)
    {
      v128 = [v19 pathForAdjustmentFile];
    }
    else
    {
      v128 = 0;
    }
    v129 = [*(id *)(a1 + 48) _avAssetProxyForOutOfBandHintsAboutAssetForResource:v35];
    v119 = [*(id *)(a1 + 48) _urlByAttachingOutOfBandHintsToVideoURL:v68 assetProxy:v129 signpostId:*(void *)(a1 + 80) hintsBase64String:0];

    [*(id *)(a1 + 48) _replyToVideoRequestWithURL:v119 mediaItemMakerData:0 mutableInfo:v121 internalInfo:v122 error:v140 pathForAdjustmentFileIfNeeded:v128 reply:*(void *)(a1 + 72)];
  }
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_122(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  [v17 setObject:v15 forKeyedSubscript:@"PHImageResultExpirationKey"];

  [v17 setObject:v14 forKeyedSubscript:@"PHImageResultFingerPrintKey"];
  BOOL v18 = PLImageManagerGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ received streaming url: %@", buf, 0x16u);
  }

  BOOL v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 56);
  id v26 = 0;
  uint64_t v23 = [v20 _urlByAttachingOutOfBandHintsToVideoURL:v11 assetProxy:v21 signpostId:v22 hintsBase64String:&v26];
  id v24 = v26;

  id v25 = [MEMORY[0x1E4F1CA60] dictionary];
  [v25 setObject:v24 forKeyedSubscript:@"PHImageResultAVAssetOutOfBandPresentationHintsKey"];
  [*(id *)(a1 + 32) _replyToVideoRequestWithURL:v23 mediaItemMakerData:v16 mutableInfo:v25 internalInfo:v17 error:v13 pathForAdjustmentFileIfNeeded:0 reply:*(void *)(a1 + 48)];
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_130(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleProgress:v3];
}

void __85__PHServerResourceRequestRunner_chooseVideoWithRequest_library_clientBundleID_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3072 userInfo:0];
  (*(void (**)(uint64_t, void, void, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, 0, 0, v2);
}

- (id)videoResourceChoiceForAsset:(id)a3 context:(id)a4 loadingMode:(int64_t *)a5 request:(id)a6 shouldReturnAdjustmentInfo:(BOOL *)a7 error:(id *)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = objc_alloc(MEMORY[0x1E4F8AC80]);
  BOOL v18 = [v16 behaviorSpec];
  [v16 size];
  uint64_t v19 = objc_msgSend(v17, "initWithContext:assetInformation:options:size:", v15, v15, v18);

  id v39 = 0;
  BOOL v20 = [v19 chooseResourceWithLoadingMode:a5 needsAdjustmentData:a7 error:&v39];
  id v21 = v39;
  uint64_t v22 = v21;
  if (v20)
  {
    id v23 = v21;
    goto LABEL_12;
  }
  int v36 = a8;
  id v37 = v14;
  id v24 = [v21 userInfo];
  id v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F8B7B0]];
  char v26 = [v25 BOOLValue];

  if ((v26 & 1) == 0)
  {
    id v23 = v22;
    id v14 = v37;
LABEL_9:
    if (v36)
    {
      id v23 = v23;
      BOOL v20 = 0;
      *int v36 = v23;
    }
    else
    {
      BOOL v20 = 0;
    }
    goto LABEL_12;
  }
  uint64_t v27 = PLImageManagerGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    taskIdentifier = self->_taskIdentifier;
    __int16 v29 = [v37 uuid];
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v41 = taskIdentifier;
    __int16 v42 = 2112;
    id v43 = v29;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "%{public}@ video request found zero playable videos for asset: %@, retrying, returned video may not be playable", buf, 0x16u);
  }
  id v30 = [v16 behaviorSpec];
  uint64_t v31 = (void *)[v30 copy];

  [v31 setRestrictToPlayableOnCurrentDevice:0];
  id v32 = objc_alloc(MEMORY[0x1E4F8AC80]);
  [v16 size];
  uint64_t v33 = objc_msgSend(v32, "initWithContext:assetInformation:options:size:", v15, v15, v31);
  id v38 = v22;
  BOOL v20 = [v33 chooseResourceWithLoadingMode:a5 needsAdjustmentData:a7 error:&v38];
  id v34 = v38;

  id v23 = v34;
  id v14 = v37;
  if (!v20) {
    goto LABEL_9;
  }
LABEL_12:

  return v20;
}

- (void)_replyToVideoRequestWithURL:(id)a3 mediaItemMakerData:(id)a4 mutableInfo:(id)a5 internalInfo:(id)a6 error:(id)a7 pathForAdjustmentFileIfNeeded:(id)a8 reply:(id)a9
{
  uint64_t v15 = (uint64_t)a3;
  unint64_t v16 = (unint64_t)a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v15 | v16 && v20)
  {
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v20];
    if (v22)
    {
      os_signpost_id_t v40 = self;
      if (!v18) {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v23 = *MEMORY[0x1E4F8BA68];
      id v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
      [v18 setObject:v24 forKeyedSubscript:v23];

      uint64_t v25 = *MEMORY[0x1E4F8BA70];
      char v26 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
      [v18 setObject:v26 forKeyedSubscript:v25];

      uint64_t v27 = *MEMORY[0x1E4F8BA58];
      uint64_t v28 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
      [v18 setObject:v28 forKeyedSubscript:v27];

      self = v40;
    }
  }
  if (v15)
  {
    __int16 v29 = [(id)v15 scheme];
    int v30 = [v29 isEqualToString:@"file"];

    if (v30)
    {
      uint64_t v31 = [(id)v15 path];
      id v32 = PLGetSandboxExtensionToken();

      if (v32)
      {
        uint64_t v33 = [objc_alloc(MEMORY[0x1E4F8B9D0]) initWithURL:v15 sandboxExtensionToken:v32 consume:0];

        uint64_t v15 = v33;
      }
    }
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __147__PHServerResourceRequestRunner__replyToVideoRequestWithURL_mediaItemMakerData_mutableInfo_internalInfo_error_pathForAdjustmentFileIfNeeded_reply___block_invoke;
  v41[3] = &unk_1E58432F8;
  id v42 = (id)v15;
  id v43 = (id)v16;
  id v44 = v17;
  id v45 = v18;
  id v46 = v19;
  id v47 = v21;
  id v34 = v19;
  id v35 = v18;
  id v36 = v17;
  id v37 = (id)v16;
  id v38 = (id)v15;
  id v39 = v21;
  [(PHServerResourceRequestRunner *)self _safeReply:v41];
}

uint64_t __147__PHServerResourceRequestRunner__replyToVideoRequestWithURL_mediaItemMakerData_mutableInfo_internalInfo_error_pathForAdjustmentFileIfNeeded_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 48) count]) {
    uint64_t v5 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v5 = 0;
  }
  if ([*(id *)(a1 + 56) count]) {
    uint64_t v6 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = *(uint64_t (**)(uint64_t, BOOL, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v8(v2, v3 != 0, v3, v4, v5, v6, v7);
}

- (BOOL)_resourceQualifiesForCacheMetricsCollection:(id)a3 isLivePhoto:(BOOL)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    uint64_t v5 = [a3 cplType];
    return v5 == 6 || v5 == 18;
  }
  return result;
}

- (id)applyAssetScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  unint64_t v16 = [a3 assetObjectIDURL];
  id v17 = [(PHServerResourceRequestRunner *)self _applyCorrectionsToAssetObjectIDURL:v16 resourceIdentity:0 errorCodes:v15 clientBundleID:v14 library:v13 reply:v12];

  return v17;
}

- (id)applyResourceScopeCorrectionsWithRequest:(id)a3 errorCodes:(id)a4 clientBundleID:(id)a5 library:(id)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v16 assetObjectIDURL];
  id v18 = [v16 resourceIdentity];

  id v19 = [(PHServerResourceRequestRunner *)self _applyCorrectionsToAssetObjectIDURL:v17 resourceIdentity:v18 errorCodes:v15 clientBundleID:v14 library:v13 reply:v12];

  return v19;
}

- (id)_applyCorrectionsToAssetObjectIDURL:(id)a3 resourceIdentity:(id)a4 errorCodes:(id)a5 clientBundleID:(id)a6 library:(id)a7 reply:(id)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if ([(PHServerResourceRequestRunner *)self state])
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"PHServerResourceRequestRunner.m" lineNumber:547 description:@"Cannot run a repair request twice"];
  }
  id v21 = PLImageManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    taskIdentifier = self->_taskIdentifier;
    PLResourceIdentityShortDescription();
    uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = taskIdentifier;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v53 = v23;
    LOWORD(v54) = 2114;
    *(void *)((char *)&v54 + 2) = v17;
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_INFO, "[RM] %{public}@ Starting request to repair resource with asset: %{public}@, resource: %{public}@, error codes: %{public}@", buf, 0x2Au);
  }
  [(PHServerResourceRequestRunner *)self setState:1];
  id v24 = [MEMORY[0x1E4F8AC30] discreteProgressWithTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v24;

  objc_initWeak(&location, self);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke;
  v48[3] = &unk_1E5847980;
  objc_copyWeak(&v50, &location);
  id v26 = v20;
  id v49 = v26;
  [(NSProgress *)self->_progress setCancellationHandler:v48];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__9936;
  *(void *)&long long v54 = __Block_byref_object_dispose__9937;
  *((void *)&v54 + 1) = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3;
  v39[3] = &unk_1E5843280;
  id v27 = v19;
  id v40 = v27;
  os_signpost_id_t v41 = self;
  id v28 = v15;
  id v42 = v28;
  id v47 = buf;
  id v29 = v17;
  id v43 = v29;
  id v30 = v16;
  id v44 = v30;
  id v31 = v18;
  id v45 = v31;
  id v46 = v26;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3_107;
  v36[3] = &unk_1E58432D0;
  v36[4] = self;
  id v32 = v46;
  id v37 = v32;
  id v38 = buf;
  [v27 performTransaction:v39 completionHandler:v36 withPriority:1];
  uint64_t v33 = self->_progress;

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

  return v33;
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2;
  v3[3] = &unk_1E5848D50;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _cancelWithReply:v3];
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  if ([*(id *)(a1 + 40) state] != 1)
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 _assetAndRelatedObjectsFromAssetObjectIDURL:v4 inManagedObjectContext:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    [*(id *)(a1 + 40) setState:3];
    uint64_t v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48);
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
LABEL_7:
  [*(id *)(*(void *)(a1 + 40) + 8) setCompletedUnitCount:50];
  if ([*(id *)(a1 + 40) state] == 1 && (objc_msgSend(v6, "complete") & 1) == 0)
  {
    uint64_t v10 = PLImageManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 48);
      id v12 = [v6 objectID];
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v11;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2114;
      uint64_t v30 = v13;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "[RM]: %{public}@ Repair: ignoring correction request for incomplete asset: %{public}@ for error codes: %{public}@.", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setState:4];
  }
  if (v6 && [*(id *)(a1 + 40) state] == 1)
  {
    if ([*(id *)(a1 + 64) recipeID] == 65749)
    {
      id v14 = [MEMORY[0x1E4F8AB50] recipeFromID:65749];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_104;
      v22[3] = &unk_1E5843258;
      v22[4] = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 72);
      id v23 = *(id *)(a1 + 80);
      [v14 generateAndStoreForAsset:v6 networkAccessAllowed:0 clientBundleID:v15 progress:0 completion:v22];
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
      uint64_t v16 = *(void *)(a1 + 40);
      if (*(void *)(v16 + 40) == 1)
      {
        *(void *)(v16 + 40) = 2;
        uint64_t v16 = *(void *)(a1 + 40);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 16));
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 64);
      if (v17
        && ([v6 fetchResourceWithIdentity:v17 error:0],
            (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v19 = v18;
        int v20 = [v18 repairResourceValidationErrors:*(void *)(a1 + 56) managedObjectContext:v2];
      }
      else
      {
        int v20 = [v6 repairAssetScopeValidationErrors:*(void *)(a1 + 56)];
      }
      if (v20) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 3;
      }
      [*(id *)(a1 + 40) setState:v21];
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 8) setCompletedUnitCount:75];
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_3_107(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] != 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setCompletedUnitCount:100];
    BOOL v2 = [*(id *)(a1 + 32) state] == 4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_4;
    v6[3] = &unk_1E58432A8;
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    BOOL v9 = v2;
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v4;
    uint64_t v8 = v5;
    [v3 _safeReply:v6];
  }
}

uint64_t __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_104(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2_105;
  v12[3] = &unk_1E58487E0;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 _safeReply:v12];
}

uint64_t __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2_105(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = [*(id *)(a1 + 32) count] != 0;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(uint64_t (**)(uint64_t, BOOL, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

void __126__PHServerResourceRequestRunner__applyCorrectionsToAssetObjectIDURL_resourceIdentity_errorCodes_clientBundleID_library_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3072 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)makeResourceUnavailableWithRequest:(id)a3 library:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(PHServerResourceRequestRunner *)self state])
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PHServerResourceRequestRunner.m" lineNumber:516 description:@"Cannot run a resource make available request twice"];
  }
  id v9 = PLImageManagerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    taskIdentifier = self->_taskIdentifier;
    id v11 = [v7 assetObjectIDURL];
    id v12 = [v7 resourceIdentity];
    id v13 = PLResourceIdentityShortDescription();
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = taskIdentifier;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 2114;
    uint64_t v26 = v13;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Starting request to make resource unavailable with asset: %{public}@, resource: %{public}@", buf, 0x20u);
  }
  [(PHServerResourceRequestRunner *)self setState:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke;
  v17[3] = &unk_1E5848EC0;
  id v18 = v8;
  id v19 = self;
  id v20 = v7;
  id v14 = v7;
  id v15 = v8;
  [v15 performTransaction:v17];
}

void __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] managedObjectContext];
  id v3 = a1[5];
  uint64_t v4 = [a1[6] assetObjectIDURL];
  id v22 = 0;
  uint64_t v5 = [v3 _assetAndRelatedObjectsFromAssetObjectIDURL:v4 inManagedObjectContext:v2 error:&v22];
  id v6 = v22;

  if (!v5)
  {
    [a1[5] setState:3];
    id v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *((void *)a1[5] + 6);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }
  }
  if ([a1[5] state] == 1)
  {
    id v9 = [a1[6] resourceIdentity];
    id v21 = v6;
    id v10 = [v5 fetchResourceWithIdentity:v9 error:&v21];
    id v11 = v21;

    if (!v10)
    {
      [a1[5] setState:3];
      id v12 = PLImageManagerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *((void *)a1[5] + 6);
        id v14 = [a1[6] resourceIdentity];
        int v15 = [v14 recipeID];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v13;
        __int16 v25 = 1024;
        LODWORD(v26) = v15;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to fetch resource with recipe %u in database, request failed", buf, 0x12u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
    id v11 = v6;
  }
  if ([a1[5] state] == 1)
  {
    uint64_t v16 = [v10 dataStore];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke_99;
    v19[3] = &unk_1E5843230;
    id v17 = a1[6];
    v19[4] = a1[5];
    id v20 = v17;
    id v18 = (id)[v16 requestLocalAvailabilityChange:0xFFFFFFFFLL forResource:v10 options:0 completion:v19];
  }
}

void __76__PHServerResourceRequestRunner_makeResourceUnavailableWithRequest_library___block_invoke_99(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a4)
  {
    id v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
      id v9 = [*(id *)(a1 + 40) resourceIdentity];
      id v10 = PLResourceIdentityShortDescription();
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ failed to make resource unavailable: %{public}@, error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)makeResourceAvailableWithRequest:(id)a3 library:(id)a4 clientBundleID:(id)a5 reply:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v39 = a4;
  id v40 = a5;
  id v41 = a6;
  if ([(PHServerResourceRequestRunner *)self state])
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"PHServerResourceRequestRunner.m" lineNumber:255 description:@"Cannot run a resource make available request twice"];
  }
  uint64_t v12 = [v11 downloadIntent];
  uint64_t v13 = [v11 downloadPriority];
  if ((unint64_t)(v12 - 1) > 0xB) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = qword_19B2CC7A8[v12 - 1];
  }
  id v42 = (void *)[objc_alloc(MEMORY[0x1E4F59958]) initWithIntent:v14 priority:v13 == 1];
  __int16 v15 = [v11 resourceIdentity];
  [v15 recipeID];
  char v16 = PLShouldBoostLogLevelForResourceRecipeID();

  uint64_t v17 = PLImageManagerGetLog();
  os_log_type_t v18 = v16 ^ 1;
  if (os_log_type_enabled(v17, (os_log_type_t)(v16 ^ 1)))
  {
    taskIdentifier = self->_taskIdentifier;
    if ([v11 isNetworkAccessAllowed]) {
      id v19 = @"Y";
    }
    else {
      id v19 = @"N";
    }
    if (objc_msgSend(v11, "wantsProgress", v19)) {
      id v20 = @"Y";
    }
    else {
      id v20 = @"N";
    }
    if ([v11 isTransient]) {
      id v21 = @"Y";
    }
    else {
      id v21 = @"N";
    }
    id v22 = [v11 assetObjectIDURL];
    __int16 v23 = PLShortObjectIDFromURL();
    uint64_t v24 = [v11 resourceIdentity];
    __int16 v25 = PLResourceIdentityShortDescription();
    *(_DWORD *)buf = 138544898;
    long long v54 = taskIdentifier;
    __int16 v55 = 2114;
    uint64_t v56 = v37;
    __int16 v57 = 2114;
    BOOL v58 = v20;
    __int16 v59 = 2114;
    BOOL v60 = v21;
    __int16 v61 = 2114;
    int v62 = v42;
    __int16 v63 = 2114;
    BOOL v64 = v23;
    __int16 v65 = 2114;
    v66 = v25;
    _os_log_impl(&dword_19B043000, v17, v18, "[RM] %{public}@ Starting request to make resource available with network access: %{public}@, progress: %{public}@, transient: %{public}@, downloadOptions: %{public}@, asset: %{public}@, resource: %{public}@", buf, 0x48u);
  }
  [(PHServerResourceRequestRunner *)self setState:1];
  id v26 = [MEMORY[0x1E4F8AC30] discreteProgressWithTotalUnitCount:100];
  progress = self->_progress;
  self->_progress = v26;

  objc_initWeak((id *)buf, self);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke;
  v50[3] = &unk_1E5847980;
  objc_copyWeak(&v52, (id *)buf);
  id v28 = v41;
  id v51 = v28;
  [(NSProgress *)self->_progress setCancellationHandler:v50];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3;
  v43[3] = &unk_1E58432F8;
  id v29 = v39;
  id v44 = v29;
  id v45 = self;
  id v30 = v11;
  id v46 = v30;
  id v31 = v28;
  id v49 = v31;
  id v32 = v40;
  id v47 = v32;
  id v33 = v42;
  id v48 = v33;
  [v29 performBlock:v43];
  id v34 = self->_progress;

  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)buf);

  return v34;
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2;
  v3[3] = &unk_1E5848D50;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _cancelWithReply:v3];
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3(uint64_t a1)
{
  v142[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  uint64_t v103 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) assetObjectIDURL];
  id v130 = 0;
  v104 = [v3 _assetAndRelatedObjectsFromAssetObjectIDURL:v4 inManagedObjectContext:v103 error:&v130];
  id v5 = v130;

  id v101 = [*v2 libraryID];
  if (!v104)
  {
    [*(id *)(a1 + 40) setState:3];
    id v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "[RM] %{public}@ could not load asset with error: %@", buf, 0x16u);
    }
  }
  if ([*(id *)(a1 + 40) state] == 1)
  {
    id v8 = [*(id *)(a1 + 48) resourceIdentity];
    if ([v8 resourceType] == 9)
    {
      id v9 = [*(id *)(a1 + 48) resourceIdentity];
      BOOL v10 = [v9 recipeID] == 327685;

      if (!v10) {
        goto LABEL_15;
      }
      id v11 = [*(id *)(a1 + 48) resourceIdentity];
      id v129 = 0;
      uint64_t v12 = objc_msgSend(v104, "mediaMetadataForResourceVersion:mediaMetadataType:", objc_msgSend(v11, "version"), &v129);
      id v8 = v129;

      if (v12 && v8)
      {
        uint64_t v13 = PLImageManagerGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 48);
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ Found existing media metadata in database", buf, 0xCu);
        }

        __int16 v15 = *(void **)(a1 + 40);
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_70;
        v125[3] = &unk_1E58487E0;
        id v128 = *(id *)(a1 + 72);
        id v126 = v12;
        id v127 = v8;
        [v15 _safeReply:v125];
      }
    }
  }
LABEL_15:
  if ([*(id *)(a1 + 40) state] != 1)
  {
    uint64_t v17 = 0;
    id v102 = v5;
    goto LABEL_22;
  }
  char v16 = [*(id *)(a1 + 48) resourceIdentity];
  id v124 = v5;
  uint64_t v17 = [v104 fetchResourceWithIdentity:v16 error:&v124];
  id v102 = v124;

  if (v17) {
    goto LABEL_22;
  }
  os_log_type_t v18 = [*(id *)(a1 + 48) resourceIdentity];
  BOOL v19 = [v18 recipeID] == 65944;

  if (v19)
  {
    id v20 = PLImageManagerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ PLImageRecipeID_Pri_EditorColorSpace_DeferredProcessingFinalImage resource is no longer available, requesting original image", buf, 0xCu);
    }

    uint64_t v22 = [v104 persistedOriginalImageResource];
    goto LABEL_37;
  }
  id v34 = [*(id *)(a1 + 48) resourceIdentity];
  BOOL v35 = [v34 recipeID] == 131280;

  if (v35)
  {
    id v36 = PLImageManagerGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = *(void *)(*(void *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ PLVideoRecipeID_VidCmp_Pri_DeferredProcessingFinalVideo resource is no longer available, requesting original video", buf, 0xCu);
    }

    uint64_t v22 = [v104 persistedOriginalVideoComplementResource];
    goto LABEL_37;
  }
  BOOL v58 = [*(id *)(a1 + 48) resourceIdentity];
  [v58 recipeID];
  int v59 = PLResourceRecipeIDIsValidForFullSizeRenderVirtualResource();

  if (v59)
  {
    BOOL v60 = [v104 adjustmentsState] == 0;
    __int16 v61 = PLImageManagerGetLog();
    int v62 = v61;
    if (v60)
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        uint64_t v71 = *(void *)(*(void *)(a1 + 40) + 48);
        uint64_t v72 = [*(id *)(a1 + 48) resourceIdentity];
        [v72 recipeID];
        v73 = PLResourceRecipeIDDescription();
        v74 = [v104 uuid];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v71;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v73;
        *(_WORD *)&buf[22] = 2114;
        v136 = v74;
        _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_ERROR, "[RM] %{public}@ request for %{public}@ but no matching persisted resource found and asset %{public}@ is unadjusted", buf, 0x20u);
      }
      uint64_t v75 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v141 = *MEMORY[0x1E4F28228];
      uint64_t v76 = NSString;
      BOOL v77 = [v104 uuid];
      v78 = [*(id *)(a1 + 48) resourceIdentity];
      [v78 recipeID];
      int v79 = PLResourceRecipeIDDescription();
      v80 = [v76 stringWithFormat:@"Unadjusted asset %@ incompatible with resource recipeID %@", v77, v79];
      v142[0] = v80;
      uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:&v141 count:1];
      uint64_t v82 = [v75 errorWithDomain:@"PHPhotosErrorDomain" code:3307 userInfo:v81];

      id v102 = (id)v82;
    }
    else
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v63 = *(void *)(*(void *)(a1 + 40) + 48);
        BOOL v64 = [*(id *)(a1 + 48) resourceIdentity];
        [v64 recipeID];
        __int16 v65 = PLResourceRecipeIDDescription();
        v66 = [v104 uuid];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v63;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v65;
        *(_WORD *)&buf[22] = 2114;
        v136 = v66;
        _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ installing full size render %{public}@ resource because a persisted resource was not found for adjusted asset: %{public}@", buf, 0x20u);
      }
      uint64_t v67 = [*(id *)(a1 + 48) resourceIdentity];
      BOOL v68 = [v67 recipeID] == 65938;

      if (v68)
      {
        int v69 = (void *)MEMORY[0x1E4F8AB40];
        uint64_t v70 = [v104 pathForFullsizeRenderImageFile];
        uint64_t v17 = objc_msgSend(v69, "onDemand_installAdjustedFullSizeRenderResourceAtFilePath:forAsset:", v70, v104);

        goto LABEL_38;
      }
      v92 = [*(id *)(a1 + 48) resourceIdentity];
      BOOL v93 = [v92 recipeID] == 131272;

      if (v93)
      {
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F8AB40], "onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:", v104);
LABEL_37:
        uint64_t v17 = (void *)v22;
        goto LABEL_38;
      }
      v94 = [*(id *)(a1 + 48) resourceIdentity];
      BOOL v95 = [v94 recipeID] == 0x20000;

      if (v95)
      {
        v96 = (void *)MEMORY[0x1E4F8AB40];
        uint64_t v97 = [*(id *)(a1 + 48) resourceIdentity];
        uint64_t v17 = objc_msgSend(v96, "onDemand_installResourceWithResourceIdentity:forAsset:", v97, v104);

LABEL_38:
        if (v17) {
          goto LABEL_22;
        }
      }
    }
  }
  [*(id *)(a1 + 40) setState:3];
  uint64_t v83 = PLImageManagerGetLog();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    uint64_t v84 = *(void *)(*(void *)(a1 + 40) + 48);
    uint64_t v85 = [*(id *)(a1 + 48) resourceIdentity];
    int v86 = [v85 recipeID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v84;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v86;
    _os_log_impl(&dword_19B043000, v83, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to fetch resource with recipe %u in database, request failed", buf, 0x12u);
  }
  if (!v102)
  {
    uint64_t v87 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v139 = *MEMORY[0x1E4F28228];
    uint64_t v88 = NSString;
    v89 = [v104 uuid];
    v90 = [v88 stringWithFormat:@"Unable to find resource for asset: %@", v89];
    v140 = v90;
    v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
    id v102 = [v87 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v91];
  }
  uint64_t v17 = 0;
LABEL_22:
  if ([*(id *)(a1 + 40) state] == 1)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F8AB48]);
    [v23 setTaskIdentifier:*(void *)(*(void *)(a1 + 40) + 48)];
    objc_msgSend(v23, "setNetworkAccessAllowed:", objc_msgSend(*(id *)(a1 + 48), "isNetworkAccessAllowed"));
    objc_msgSend(v23, "setTransient:", objc_msgSend(*(id *)(a1 + 48), "isTransient"));
    objc_msgSend(v23, "setWantsProgress:", objc_msgSend(*(id *)(a1 + 48), "wantsProgress"));
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v136 = __Block_byref_object_copy__9936;
    v137 = __Block_byref_object_dispose__9937;
    id v138 = 0;
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_79;
    v123[3] = &unk_1E5843190;
    v123[4] = buf;
    [v23 setDataHandler:v123];
    [v23 setClientBundleID:*(void *)(a1 + 56)];
    [v23 setDownloadOptions:*(void *)(a1 + 64)];
    if ([v17 localAvailability] == -1)
    {
      [v104 deferredProcessingNeeded];
      if ((PLManagedAssetDeferredProcessingNeededRequiresImmediateProcessing() & 1) == 0
        && ([*(id *)(a1 + 48) isNetworkAccessAllowed] & 1) == 0)
      {
        uint64_t v24 = PLImageManagerGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 48);
          *(_DWORD *)int v131 = 138543362;
          uint64_t v132 = v25;
          _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_INFO, "[RM] %{public}@ Request for resource that is not locally available but network access is not allowed", v131, 0xCu);
        }
      }
    }
    int v100 = [v17 version];
    uint64_t v26 = [v17 cplType];
    int v27 = [v17 orientation];
    id v28 = [v17 uniformTypeIdentifier];
    id v29 = [v28 identifier];

    if (v26 == 5)
    {
      id v30 = PLDataStoreForClassIDAndLibraryID();
      id v31 = [v30 thumbnailManager];
      id v32 = [v31 thumbnailJPEGPathForPhoto:v104];
      if (v32)
      {
        id v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v32];
      }
      else
      {
        id v38 = PLImageManagerGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v98 = *(void *)(*(void *)(a1 + 40) + 48);
          uint64_t v39 = [v104 uuid];
          *(_DWORD *)int v131 = 138543618;
          uint64_t v132 = v98;
          __int16 v133 = 2114;
          uint64_t v134 = v39;
          v99 = (void *)v39;
          _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Unable to resolve thumbnail path for asset %{public}@", v131, 0x16u);
        }
        id v33 = 0;
      }
    }
    else
    {
      id v33 = 0;
    }
    if ([*(id *)(a1 + 48) isTransient])
    {
      BOOL v40 = 1;
    }
    else
    {
      id v41 = [v17 dataStore];
      BOOL v40 = [(id)objc_opt_class() storeClassID] == 3;
    }
    id v42 = [v17 dataStore];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_82;
    v110[3] = &unk_1E5843208;
    BOOL v122 = v40;
    uint64_t v118 = buf;
    id v43 = *(id *)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 40);
    id v111 = v43;
    uint64_t v112 = v44;
    id v45 = v17;
    id v113 = v45;
    uint64_t v119 = v26;
    id v46 = v33;
    id v114 = v46;
    id v115 = v104;
    int v120 = v100;
    id v47 = v29;
    id v116 = v47;
    int v121 = v27;
    id v117 = *(id *)(a1 + 72);
    id v48 = [v42 requestLocalAvailabilityChange:1 forResource:v45 options:v23 completion:v110];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    uint64_t v49 = *(void *)(a1 + 40);
    if (*(void *)(v49 + 40) == 1)
    {
      objc_initWeak((id *)v131, (id)v49);
      uint64_t v50 = [v45 dataStore];
      uint64_t v51 = *(void *)(a1 + 40);
      id v52 = *(void **)(v51 + 32);
      *(void *)(v51 + 32) = v50;

      if (v48)
      {
        id v53 = objc_alloc(MEMORY[0x1E4F8AAE8]);
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_4;
        v108[3] = &unk_1E5847C08;
        objc_copyWeak(&v109, (id *)v131);
        uint64_t v54 = [v53 initWithSourceProgress:v48 progressHandler:v108];
        uint64_t v55 = *(void *)(a1 + 40);
        uint64_t v56 = *(void **)(v55 + 24);
        *(void *)(v55 + 24) = v54;

        objc_destroyWeak(&v109);
      }
      *(void *)(*(void *)(a1 + 40) + 40) = 2;
      objc_destroyWeak((id *)v131);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v49 + 16));
      [v48 cancel];
    }

    _Block_object_dispose(buf, 8);
  }
  if ([*(id *)(a1 + 40) state] != 2)
  {
    __int16 v57 = *(void **)(a1 + 40);
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_5;
    v105[3] = &unk_1E5848790;
    id v107 = *(id *)(a1 + 72);
    id v106 = v102;
    [v57 _safeReply:v105];
  }
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_70(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v5 = @"PHMediaMetadataTypeKey";
  v6[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void *, void))(v3 + 16))(v3, 1, 0, v1, v4, 0);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_79(uint64_t a1, void *a2)
{
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_82(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = *(unsigned char *)(a1 + 112);
    if (v8) {
      char v8 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;
    }
  }
  char v82 = v8;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = __Block_byref_object_copy__9936;
  BOOL v77 = __Block_byref_object_dispose__9937;
  id v78 = 0;
  uint64_t v67 = 0;
  BOOL v68 = &v67;
  uint64_t v69 = 0x3032000000;
  uint64_t v70 = __Block_byref_object_copy__9936;
  uint64_t v71 = __Block_byref_object_dispose__9937;
  id v9 = v6;
  id v72 = v9;
  BOOL v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!*((unsigned char *)v80 + 24))
  {
    id v11 = [(id)v68[5] domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F8C520]])
    {
      BOOL v12 = [(id)v68[5] code] == 7;

      if (v12)
      {
        uint64_t v13 = [(id)v68[5] userInfo];
        uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8C528]];

        if (v14)
        {
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_84;
          v64[3] = &unk_1E5848EC0;
          __int16 v15 = *(void **)(a1 + 32);
          v64[4] = *(void *)(a1 + 40);
          id v7 = v14;
          id v65 = v7;
          id v66 = *(id *)(a1 + 48);
          [v15 performTransaction:v64];
          *((unsigned char *)v80 + 24) = 1;
          char v16 = (void *)v68[5];
          v68[5] = 0;
        }
        else
        {
          id v7 = 0;
        }
      }
    }
    else
    {
    }
  }
  if (*((unsigned char *)v80 + 24))
  {
    uint64_t v17 = PLImageManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 48);
      uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) length];
      *(_DWORD *)buf = 138543874;
      uint64_t v86 = v18;
      __int16 v87 = 2114;
      id v88 = v7;
      __int16 v89 = 2048;
      uint64_t v90 = v19;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Resource made available. (fileURL: %{public}@ / transientData len: %lu", buf, 0x20u);
    }

    uint64_t v20 = *(void *)(a1 + 96);
    if (v20 == 27 || v20 == 10)
    {
      int v27 = [*(id *)(a1 + 32) libraryServicesManager];
      id v28 = [v27 databaseContext];
      id v29 = [*(id *)(a1 + 32) name];
      id v30 = objc_msgSend(v28, "newShortLivedLibraryWithName:", objc_msgSend(v29, "UTF8String"));

      id v31 = [*(id *)(a1 + 64) objectID];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_90;
      v55[3] = &unk_1E58431B8;
      id v24 = v30;
      id v56 = v24;
      id v32 = v31;
      id v57 = v32;
      int v59 = &v67;
      BOOL v60 = &v73;
      int v63 = *(_DWORD *)(a1 + 104);
      id v58 = v10;
      __int16 v61 = &v79;
      uint64_t v62 = *(void *)(a1 + 96);
      [v24 performBlockAndWait:v55];
    }
    else if (v20 == 5)
    {
      uint64_t v21 = *(void **)(a1 + 56);
      if (v21)
      {
        id v22 = v21;

        id v23 = [(id)*MEMORY[0x1E4F44410] identifier];
        [v10 setObject:v23 forKeyedSubscript:@"PHImageFileUTIKey"];

        id v24 = [NSNumber numberWithInteger:PLImageOrientationFromExifOrientation()];
        [v10 setObject:v24 forKeyedSubscript:@"PHImageFileOrientationKey"];
        id v7 = v22;
      }
      else
      {
        *((unsigned char *)v80 + 24) = 0;
        id v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        uint64_t v37 = NSString;
        id v24 = [*(id *)(a1 + 64) objectID];
        id v38 = [v37 stringWithFormat:@"Cannot determine thumbnail path for asset: %@", v24];
        uint64_t v84 = v38;
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        uint64_t v40 = [v36 errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:v39];
        id v41 = (void *)v68[5];
        v68[5] = v40;
      }
    }
    else
    {
      [v10 setObject:*(void *)(a1 + 72) forKeyedSubscript:@"PHImageFileUTIKey"];
      id v24 = [NSNumber numberWithInteger:PLImageOrientationFromExifOrientation()];
      [v10 setObject:v24 forKeyedSubscript:@"PHImageFileOrientationKey"];
    }
    goto LABEL_33;
  }
  uint64_t v25 = [(id)v68[5] domain];
  if ([v25 isEqualToString:*MEMORY[0x1E4F59778]]) {
    BOOL v26 = [(id)v68[5] code] == 80
  }
       || [(id)v68[5] code] == 81
       || [(id)v68[5] code] == 82;
  else {
    BOOL v26 = 0;
  }

  id v33 = [(id)v68[5] domain];
  if ([v33 isEqualToString:*MEMORY[0x1E4F8C520]]) {
    BOOL v34 = [(id)v68[5] code] == 6;
  }
  else {
    BOOL v34 = 0;
  }

  if (v26 || v34)
  {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsInCloudKey"];
    if (v34)
    {
      uint64_t v35 = PHNetworkAccessAllowedRequiredError();
      id v24 = (id)v68[5];
      v68[5] = v35;
LABEL_33:
    }
  }
  id v42 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (!v42) {
    id v42 = (void *)v74[5];
  }
  id v43 = v42;
  uint64_t v44 = *(void **)(a1 + 40);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_94;
  v48[3] = &unk_1E58431E0;
  id v45 = v10;
  id v49 = v45;
  id v52 = *(id *)(a1 + 80);
  id v53 = &v79;
  id v46 = v7;
  id v50 = v46;
  id v47 = v43;
  id v51 = v47;
  uint64_t v54 = &v67;
  [v44 _safeReply:v48];

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleProgress:v3];
}

uint64_t __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, *(void *)(a1 + 32));
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_84(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "[RM] %@ Repairing inconsistent resource with fileURL: %@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8AAE0]), "initWithResourceType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
  id v6 = *(id *)(a1 + 48);
  id v7 = [v5 keyData];
  [v6 setDataStoreKeyData:v7];

  [v6 setLocalAvailability:1];
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_90(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 existingObjectWithID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (v5)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 88);
    id v17 = 0;
    uint64_t v7 = [v5 mediaMetadataForResourceVersion:v6 mediaMetadataType:&v17];
    id v8 = v17;
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    __int16 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:@"PHMediaMetadataTypeKey"];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"No media metadata present for CPL metadata download with cpl type %ld", *(void *)(a1 + 80));
      v20[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v14 = [v11 errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      char v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2_94(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3_95;
  v8[3] = &unk_1E58431E0;
  id v9 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v12 = v3;
  uint64_t v13 = v4;
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v11 = v5;
  uint64_t v14 = v6;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(v2, v7);
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_3_95(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F389B10]();
  [*(id *)(a1 + 32) count];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __95__PHServerResourceRequestRunner_makeResourceAvailableWithRequest_library_clientBundleID_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3072 userInfo:0];
  (*(void (**)(uint64_t, void, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, 0, v2);
}

- (void)_handleProgress:(id)a3
{
  progress = self->_progress;
  id v5 = a3;
  double v6 = (double)[(NSProgress *)progress totalUnitCount];
  [v5 fractionCompleted];
  double v8 = v7;

  id v9 = self->_progress;

  [(NSProgress *)v9 setCompletedUnitCount:(uint64_t)(v8 * v6)];
}

- (void)_cancelWithReply:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    taskIdentifier = self->_taskIdentifier;
    int v10 = 138543362;
    id v11 = taskIdentifier;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancellation handler called", (uint8_t *)&v10, 0xCu);
  }

  double v7 = [(PLProgressFollower *)self->_dataStoreFollower sourceProgress];
  if (self->_state == 5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else if ([(PLResourceDataStore *)self->_dataStore canMarkAsynchronousLocalRenderAsOptionalForProgress:v7])
  {
    os_unfair_lock_unlock(&self->_lock);
    double v8 = PLImageManagerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = self->_taskIdentifier;
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "[RM]: %{public}@ cancellation for async local render translated into deprioritization for progress %{public}@", (uint8_t *)&v10, 0x16u);
    }

    [(PLResourceDataStore *)self->_dataStore markAsynchronousLocalRenderAsOptionalForProgress:v7];
  }
  else
  {
    self->_state = 5;
    os_unfair_lock_unlock(&self->_lock);
    [v7 cancel];
    v4[2](v4);
  }
}

- (void)_safeReply:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_state = 5;
    os_unfair_lock_unlock(&self->_lock);
    v4[2]();
  }
}

- (id)_assetAndRelatedObjectsFromAssetObjectIDURL:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 persistentStoreCoordinator];
  int v10 = [v9 managedObjectIDForURIRepresentation:v7];

  if (!v10)
  {
    id v24 = [v8 persistentStoreCoordinator];
    uint64_t v25 = [v24 persistentStores];
    uint64_t v13 = objc_msgSend(v25, "_pl_map:", &__block_literal_global_10054);

    BOOL v26 = PLImageManagerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = [v13 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543618;
      id v49 = v7;
      __int16 v50 = 2114;
      id v51 = v27;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Cannot cannot create asset object id from url: %{public}@, persistent store IDs: %{public}@", buf, 0x16u);
    }
    id v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28228];
    id v29 = NSString;
    char v16 = [v13 componentsJoinedByString:@", "];
    uint64_t v19 = [v29 stringWithFormat:@"Cannot cannot create asset object id from url: %@, persistent store IDs: %@", v7, v16];
    id v47 = v19;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v17 = [v28 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v30];
LABEL_16:

    goto LABEL_17;
  }
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  __int16 v12 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v13 = [v11 fetchRequestWithEntityName:v12];

  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self = %@", v10];
  [v13 setPredicate:v14];

  v45[0] = @"modernResources";
  v45[1] = @"master";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v13 setRelationshipKeyPathsForPrefetching:v15];

  [v13 setReturnsObjectsAsFaults:0];
  id v40 = 0;
  char v16 = [v8 executeFetchRequest:v13 error:&v40];
  id v17 = v40;
  if (v16)
  {
    uint64_t v18 = [v16 firstObject];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v39 = a5;
      uint64_t v20 = [v18 uuid];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        id v22 = [v19 uuid];
        uint64_t v23 = [v22 length];

        if (v23)
        {
          a5 = v39;
          goto LABEL_18;
        }
      }
      id v31 = PLImageManagerGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "Asset has no uuid, object ID: %{public}@", buf, 0xCu);
      }

      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28228];
      id v30 = [NSString stringWithFormat:@"Asset has no uuid, object ID: %@", v10];
      id v42 = v30;
      id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v34 = [v32 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v33];

      id v17 = (id)v34;
      a5 = v39;
    }
    else
    {
      uint64_t v35 = PLImageManagerGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "Cannot find asset with object ID: %{public}@", buf, 0xCu);
      }

      id v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28228];
      uint64_t v19 = [NSString stringWithFormat:@"Cannot find asset with object ID: %@", v10];
      uint64_t v44 = v19;
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v37 = [v36 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v30];

      id v17 = (id)v37;
    }
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v19 = 0;
LABEL_18:

  if (a5) {
    *a5 = v17;
  }

  return v19;
}

uint64_t __106__PHServerResourceRequestRunner__assetAndRelatedObjectsFromAssetObjectIDURL_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)setState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state != 5) {
    self->_state = a3;
  }

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)dealloc
{
  [(PLProgressFollower *)self->_dataStoreFollower invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHServerResourceRequestRunner;
  [(PHServerResourceRequestRunner *)&v3 dealloc];
}

- (PHServerResourceRequestRunner)initWithTaskIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHServerResourceRequestRunner;
  id v5 = [(PHServerResourceRequestRunner *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;
  }
  return v5;
}

@end