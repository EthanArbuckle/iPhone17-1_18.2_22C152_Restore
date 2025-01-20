@interface PHAssetResource(MediaAnalysis)
+ (id)vcp_allAcceptableResourcesForAsset:()MediaAnalysis;
+ (id)vcp_allResourcesForAsset:()MediaAnalysis;
+ (id)vcp_allowedBundlesForSyndicationLibrary;
+ (uint64_t)mad_disableComputeSyncDownload;
+ (void)vcp_ascendingSizeComparator;
+ (void)vcp_descendingSizeComparator;
- (BOOL)vcp_hasExtremeAbnormalDimensionForScene;
- (BOOL)vcp_isDecodable;
- (BOOL)vcp_isPhotoResourceUsable:()MediaAnalysis;
- (BOOL)vcp_isVideoResourceUsable:()MediaAnalysis;
- (NSObject)mad_existingAnalysisFromComputeSyncForAsset:()MediaAnalysis allowDownload:cancel:;
- (double)vcp_size;
- (id)vcp_uniformTypeIdentifier;
- (uint64_t)mad_isAnalysisCompleteFromComputeSyncForAsset:()MediaAnalysis taskID:allowDownload:cancel:;
- (uint64_t)vcp_fileSize;
- (uint64_t)vcp_isLocallyAvailable;
- (uint64_t)vcp_isMovie;
- (uint64_t)vcp_isPhoto;
@end

@implementation PHAssetResource(MediaAnalysis)

+ (id)vcp_allowedBundlesForSyndicationLibrary
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CA80];
  v4[0] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  v4[1] = @"com.apple.FileProvider.LocalStorage";
  v4[2] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  v4[3] = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  v4[4] = @"com.apple.photos.filesPlaceholder";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  v2 = [v0 setWithArray:v1];

  [v2 addObject:@"com.apple.mobilenotes"];
  return v2;
}

+ (id)vcp_allResourcesForAsset:()MediaAnalysis
{
  v3 = [MEMORY[0x1E4F38F68] assetResourcesForAsset:a3 includeDerivatives:1];
  return v3;
}

+ (id)vcp_allAcceptableResourcesForAsset:()MediaAnalysis
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allResourcesForAsset:", v3);
  if ([v3 isGuestAsset])
  {
    v5 = [v3 photoLibrary];
    int v6 = [v5 isSystemPhotoLibrary];
  }
  else
  {
    int v6 = 0;
  }
  v7 = [v3 photoLibrary];
  int v8 = objc_msgSend(v7, "vcp_isSyndicationLibrary");

  if (!v8)
  {
    if (v6) {
      goto LABEL_16;
    }
LABEL_10:
    v13 = v4;
    goto LABEL_28;
  }
  [v3 fetchPropertySetsIfNeeded];
  v9 = [v3 curationProperties];
  v10 = [v9 importedByBundleIdentifier];

  if (!v10
    || (objc_msgSend((id)objc_opt_class(), "vcp_allowedBundlesForSyndicationLibrary"),
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 containsObject:v10],
        v11,
        (v12 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [v3 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v28 = v15;
        __int16 v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "[%@][%@] Syndication library asset not from Notes / Files; skipping original resource",
          buf,
          0x16u);
      }
    }

    goto LABEL_16;
  }

  if ((v6 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_16:
  v13 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v20, "type", (void)v22) != 2
          && [v20 type] != 1
          && [v20 type] != 9)
        {
          [v13 addObject:v20];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

LABEL_28:
  return v13;
}

- (id)vcp_uniformTypeIdentifier
{
  v1 = (void *)MEMORY[0x1E4F442D8];
  v2 = [a1 uniformTypeIdentifier];
  id v3 = [v1 typeWithIdentifier:v2];

  return v3;
}

- (uint64_t)vcp_isMovie
{
  v2 = objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  if ([v2 conformsToType:*MEMORY[0x1E4F44448]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(a1, "vcp_uniformTypeIdentifier");
    uint64_t v3 = [v4 conformsToType:*MEMORY[0x1E4F44520]];
  }
  return v3;
}

- (uint64_t)vcp_isPhoto
{
  v1 = objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F44400]];

  return v2;
}

- (BOOL)vcp_isVideoResourceUsable:()MediaAnalysis
{
  return [a1 type] != 14
      && [a1 type] != 15
      && (!a3
       || [a1 type] != 9
       && [a1 type] != 2
       && [a1 type] != 11
       && [a1 type] != 12);
}

- (BOOL)vcp_isPhotoResourceUsable:()MediaAnalysis
{
  return [a1 type] != 13
      && [a1 type] != 101
      && (!a3 || [a1 type] != 1 && objc_msgSend(a1, "type") != 8);
}

- (BOOL)vcp_isDecodable
{
  v1 = objc_msgSend(a1, "vcp_uniformTypeIdentifier");
  BOOL v2 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:v1];

  return v2;
}

- (uint64_t)vcp_isLocallyAvailable
{
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_isLocallyAvailable])
  {
    return [a1 isLocallyAvailable];
  }
  else
  {
    uint64_t v3 = [a1 privateFileURL];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F28CB8] defaultManager];
      v5 = [v3 path];
      uint64_t v6 = [v4 fileExistsAtPath:v5];
    }
    else
    {
      uint64_t v6 = 0;
    }

    return v6;
  }
}

- (BOOL)vcp_hasExtremeAbnormalDimensionForScene
{
  if ([a1 pixelHeight] < 1)
  {
    double v3 = 1.0;
  }
  else
  {
    double v2 = (double)[a1 pixelWidth];
    double v3 = v2 / (double)[a1 pixelHeight];
  }
  uint64_t v4 = [a1 pixelWidth];
  uint64_t v5 = [a1 pixelHeight];
  if (v3 <= 10.0 && v3 >= 0.1) {
    return 0;
  }
  if (v4 >= v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v4;
  }
  return v7 < 0x32;
}

- (uint64_t)vcp_fileSize
{
  v1 = [a1 privateFileURL];
  double v2 = [v1 path];

  if (v2)
  {
    double v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = [v3 attributesOfItemAtPath:v2 error:0];
    uint64_t v5 = [v4 fileSize];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (double)vcp_size
{
  double v2 = (double)(uint64_t)(([a1 pixelWidth] + 1) & 0xFFFFFFFFFFFFFFFELL);
  [a1 pixelHeight];
  return v2;
}

+ (void)vcp_ascendingSizeComparator
{
  return &__block_literal_global_49;
}

+ (void)vcp_descendingSizeComparator
{
  return &__block_literal_global_252_0;
}

+ (uint64_t)mad_disableComputeSyncDownload
{
  return 0;
}

- (NSObject)mad_existingAnalysisFromComputeSyncForAsset:()MediaAnalysis allowDownload:cancel:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "mad_isEligibleForComputeSync") & 1) == 0
    || !objc_msgSend(v8, "mad_isEligibleForComputeSyncIngestion"))
  {
    goto LABEL_12;
  }
  if ([a1 type] != 112)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v12 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v48 = v12;
        __int16 v49 = 1024;
        LODWORD(v50) = [a1 type];
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[%@] Invalid resource type (%d), unable to extract analysis results from compute sync", buf, 0x12u);
      }
      goto LABEL_52;
    }
    goto LABEL_12;
  }
  if (v9 && v9[2](v9))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v48 = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[%@] Analysis extraction from compute sync resource cancelled", buf, 0xCu);
      }
      goto LABEL_52;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v10 = [a1 privateFileURL];
  if (!a4 || (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSyncDownload") & 1) != 0)
  {
    if (!v10) {
      goto LABEL_48;
    }
LABEL_19:
    if ([a1 isLocallyAvailable])
    {
      v15 = [MEMORY[0x1E4F38F68] computeSyncMediaAnalysisPayloadDataForResourceURL:v10];
      if (v15)
      {
        id v16 = [[VCPProtoAssetAnalysis alloc] initWithData:v15];
        p_super = &v16->super.super;
        if (v16)
        {
          uint64_t v18 = [(VCPProtoAssetAnalysis *)v16 exportToLegacyDictionary];
          v19 = v18;
          if (v18)
          {
            v20 = [v18 vcp_dateModified];
            v21 = objc_msgSend(v8, "vcp_modificationDate");
            char v22 = [v20 isEqualToDate:v21];

            if (v22)
            {
              v19 = v19;
              v13 = v19;
LABEL_63:

              goto LABEL_64;
            }
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v39 = VCPLogInstance();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                v44 = [v8 localIdentifier];
                v45 = [v19 vcp_dateModified];
                v43 = objc_msgSend(v8, "vcp_modificationDate");
                *(_DWORD *)buf = 138412802;
                v48 = v44;
                __int16 v49 = 2112;
                v50 = v45;
                __int16 v51 = 2112;
                v52 = v43;
                _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_DEBUG, "[%@] Analysis results from compute sync is outdated (modification date in analysis: %@ vs asset: %@)", buf, 0x20u);
              }
LABEL_61:
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v39 = VCPLogInstance();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = [v8 localIdentifier];
              v41 = [v10 path];
              int v42 = [v15 length];
              *(_DWORD *)buf = 138412802;
              v48 = v40;
              __int16 v49 = 2112;
              v50 = v41;
              __int16 v51 = 1024;
              LODWORD(v52) = v42;
              _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "[%@] Failed to deserialize analysis results from proto (compute sync resource: %@, MediaAnalysis payload: %d bytes)", buf, 0x1Cu);
            }
            goto LABEL_61;
          }
LABEL_62:
          v13 = 0;
          goto LABEL_63;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v35 = [v8 localIdentifier];
            v36 = [v10 path];
            int v37 = [v15 length];
            *(_DWORD *)buf = 138412802;
            v48 = v35;
            __int16 v49 = 2112;
            v50 = v36;
            __int16 v51 = 1024;
            LODWORD(v52) = v37;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[%@] Failed to recover proto from payload data (compute sync resource: %@, MediaAnalysis payload: %d bytes)", buf, 0x1Cu);
          }
          goto LABEL_62;
        }
LABEL_46:
        v13 = 0;
LABEL_64:

        goto LABEL_65;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        p_super = VCPLogInstance();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        {
          v33 = [v8 localIdentifier];
          v34 = [v10 path];
          *(_DWORD *)buf = 138412546;
          v48 = v33;
          __int16 v49 = 2112;
          v50 = v34;
          _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "[%@] No MediaAnalysis payload data in compute sync resource at %@", buf, 0x16u);
        }
        goto LABEL_46;
      }
      goto LABEL_51;
    }
LABEL_48:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v38 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v48 = v38;
        __int16 v49 = 1024;
        LODWORD(v50) = a4;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[%@] Compute sync resource not locally available (allowDownload: %d)", buf, 0x12u);
      }
LABEL_51:
      v13 = 0;
      goto LABEL_65;
    }
    goto LABEL_52;
  }
  if (objc_msgSend(v8, "mad_isEligibleForComputeSyncDownloadWithAnalysisTask:", 1))
  {
    long long v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    long long v25 = VCPSignPostLog();
    v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "MADDownloadComputeSyncResource", "", buf, 2u);
    }

    v46 = v10;
    int v27 = objc_msgSend(MEMORY[0x1E4F38F80], "vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:", a1, 1, &v46, v9);
    v28 = v46;

    __int16 v29 = VCPSignPostLog();
    v30 = v29;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v24, "MADDownloadComputeSyncResource", "", buf, 2u);
    }

    if (v27)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v13 = 0;
        v10 = v28;
        goto LABEL_66;
      }
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412546;
        v48 = v31;
        __int16 v49 = 1024;
        LODWORD(v50) = v27;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[%@] Failed to download compute sync resource (%d)", buf, 0x12u);
      }
      v13 = 0;
      v10 = v28;
LABEL_65:

      goto LABEL_66;
    }
    v10 = v28;
    if (!v28) {
      goto LABEL_48;
    }
    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v32 = [v8 localIdentifier];
      *(_DWORD *)buf = 138412546;
      v48 = v32;
      __int16 v49 = 1024;
      LODWORD(v50) = 1;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "[%@] Ineligible for compute sync downalod with taskID %d", buf, 0x12u);
    }
    goto LABEL_51;
  }
LABEL_52:
  v13 = 0;
LABEL_66:

LABEL_13:
  return v13;
}

- (uint64_t)mad_isAnalysisCompleteFromComputeSyncForAsset:()MediaAnalysis taskID:allowDownload:cancel:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "mad_isEligibleForComputeSync") & 1) == 0) {
    goto LABEL_12;
  }
  if ([a1 type] != 112)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      char v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = [v10 localIdentifier];
        *(_DWORD *)buf = 138412546;
        int v37 = v14;
        __int16 v38 = 1024;
        LODWORD(v39) = [a1 type];
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[%@] Invalid resource type (%d), unable to extract analysis results from compute sync", buf, 0x12u);
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v11 || !v11[2](v11))
  {
    char v12 = [a1 privateFileURL];
    if (!a5 || (objc_msgSend((id)objc_opt_class(), "mad_disableComputeSyncDownload") & 1) != 0) {
      goto LABEL_15;
    }
    if (objc_msgSend(v10, "mad_isEligibleForComputeSyncDownloadWithAnalysisTask:", a4))
    {
      char v22 = VCPSignPostLog();
      os_signpost_id_t v23 = os_signpost_id_generate(v22);

      os_signpost_id_t v24 = VCPSignPostLog();
      long long v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADDownloadComputeSyncResource", "", buf, 2u);
      }

      v35 = v12;
      int v26 = objc_msgSend(MEMORY[0x1E4F38F80], "vcp_requestFileURLForAssetResource:withTaskID:toResourceURL:cancel:", a1, a4, &v35, v11);
      int v27 = v35;

      char v12 = v27;
      v28 = VCPSignPostLog();
      __int16 v29 = v28;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_END, v23, "MADDownloadComputeSyncResource", "", buf, 2u);
      }

      if (!v26 && v12 && ([a1 isLocallyAvailable] & 1) != 0)
      {
        uint64_t v30 = objc_msgSend(v10, "mad_refetchAsset");
        if (v30)
        {

          id v10 = (id)v30;
LABEL_15:
          int v16 = objc_msgSend(v10, "vcp_needsProcessingForTask:", a4);
          uint64_t v15 = v16 ^ 1u;
          if ((int)MediaAnalysisLogLevel() < 6) {
            goto LABEL_40;
          }
          uint64_t v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = [v10 localIdentifier];
            uint64_t v19 = VCPTaskIDDescription(a4);
            v20 = (void *)v19;
            v21 = @"complete";
            *(_DWORD *)buf = 138413314;
            int v37 = v18;
            __int16 v38 = 2112;
            if (v16) {
              v21 = @"incomplete";
            }
            uint64_t v39 = v19;
            __int16 v40 = 2112;
            v41 = v21;
            __int16 v42 = 2112;
            v43 = v12;
            __int16 v44 = 1024;
            int v45 = a5;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[%@] %@ %@ with compute sync resource at %@ (allowDownload: %d)", buf, 0x30u);
          }
LABEL_39:

          goto LABEL_40;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v34 = [v10 localIdentifier];
            *(_DWORD *)buf = 138412290;
            int v37 = v34;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[%@] Failed to re-fetch asset after compute sync download attempt", buf, 0xCu);
          }
LABEL_38:
          uint64_t v15 = 0;
          goto LABEL_39;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v32 = [v10 localIdentifier];
          *(_DWORD *)buf = 138412546;
          int v37 = v32;
          __int16 v38 = 1024;
          LODWORD(v39) = v26;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[%@] Failed to download compute sync resource (%d)", buf, 0x12u);
        }
        goto LABEL_38;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = [v10 localIdentifier];
        *(_DWORD *)buf = 138412546;
        int v37 = v31;
        __int16 v38 = 1024;
        LODWORD(v39) = a4;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[%@] Ineligible for compute sync downalod with taskID %d", buf, 0x12u);
      }
      goto LABEL_38;
    }
LABEL_11:
    uint64_t v15 = 0;
LABEL_40:

    goto LABEL_41;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    char v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [v10 localIdentifier];
      *(_DWORD *)buf = 138412290;
      int v37 = v13;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[%@] Analysis extraction from compute sync resource cancelled", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v15 = 0;
LABEL_41:

  return v15;
}

@end