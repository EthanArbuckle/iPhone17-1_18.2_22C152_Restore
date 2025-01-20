@interface PHAssetBundleExportSession
- (NSDictionary)fileURLs;
- (NSString)customFilenameBase;
- (NSString)sessionUUID;
- (PHAsset)asset;
- (PHAssetBundleExportSession)initWithAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4;
- (id)_createAssetBundleFromAsset:(id)a3 withFileURLs:(id)a4 atURL:(id)a5 withError:(id *)a6;
- (id)_filenameBaseForAsset:(id)a3;
- (void)setCustomFilenameBase:(id)a3;
- (void)writeToDirectoryURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PHAssetBundleExportSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_customFilenameBase, 0);
}

- (NSDictionary)fileURLs
{
  return self->_fileURLs;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setCustomFilenameBase:(id)a3
{
}

- (NSString)customFilenameBase
{
  return self->_customFilenameBase;
}

- (id)_createAssetBundleFromAsset:(id)a3 withFileURLs:(id)a4 atURL:(id)a5 withError:(id *)a6
{
  v134[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v108 = a5;
  v102 = self;
  v106 = [(PHAssetBundleExportSession *)self _filenameBaseForAsset:v10];
  [v10 fetchPropertySetsIfNeeded];
  v105 = [NSString stringWithFormat:@"%@.%@", v106, *MEMORY[0x1E4F8CEB8]];
  id v12 = [v108 URLByAppendingPathComponent:v105];
  v107 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v120 = 0;
  v13 = [v108 path];
  char v14 = [v107 fileExistsAtPath:v13 isDirectory:&v120];

  if (v120) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"The output directory URL (%@) is missing or is not a directory.", v108];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v133 = *MEMORY[0x1E4F28568];
    v134[0] = v16;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:&v133 count:1];
    v19 = [v17 errorWithDomain:@"com.apple.mobileslideshow.sharing" code:1 userInfo:v18];

    if (a6)
    {
      id v20 = v19;
      *a6 = v20;

      v21 = 0;
      goto LABEL_70;
    }
  }
  if (!v12)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, v102, @"PHAssetBundleExportSession.m", 212, @"Invalid parameter not satisfying: %@", @"bundleURL" object file lineNumber description];
  }
  char v119 = 0;
  v22 = [v12 path];
  int v23 = [v107 fileExistsAtPath:v22 isDirectory:&v119];

  if (v119) {
    int v24 = 1;
  }
  else {
    int v24 = v23;
  }
  if (v24 == 1) {
    [v107 removeItemAtURL:v12 error:0];
  }
  v25 = [v10 photoIrisProperties];
  char v26 = [v25 photoIrisVisibilityState];

  unint64_t v27 = [v10 mediaType];
  if (v27 >= 4) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v27;
  }
  uint64_t v29 = [v10 playbackStyle];
  if ((unint64_t)(v29 - 1) >= 5) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v29;
  }
  uint64_t v100 = v30;
  int v31 = [v10 playbackVariation];
  if ((v31 - 1) < 3) {
    uint64_t v32 = (unsigned __int16)(v31 - 1) + 1;
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v99 = v32;
  unint64_t v33 = [v10 mediaSubtypes];
  uint64_t v34 = (v33 >> 1) & 0x20 | v33 & 0x3F031F | (((v33 >> 10) & 1) << 22);
  if (v28 != 2)
  {
    if (v28 != 1) {
      goto LABEL_69;
    }
    v103 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
    if (v103)
    {
      id v92 = objc_alloc(MEMORY[0x1E4F8CBC0]);
      v101 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAlternatePhotoURLKey"];
      v97 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestFullSizePhotoURLKey"];
      v96 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentBaseFullSizePhotoURLKey"];
      v94 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestSpatialOvercapturePhotoURLKey"];
      v95 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
      v93 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestFullSizeVideoURLKey"];
      v35 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentBasePairedVideoURLKey"];
      v36 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestSpatialOvercapturePairedVideoURLKey"];
      v37 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
      v38 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestOriginalAdjustmentDataFileURLKey"];
      v39 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentSecondaryDataFileURLKey"];
      LOWORD(v91) = v26 & 0xF;
      v40 = objc_msgSend(v92, "initWithOriginalPhotoURL:alternatePhotoURL:fullSizePhotoURL:adjustmentBaseFullSizePhotoURL:spatialOvercapturePhotoURL:originalPairedVideoURL:fullSizePairedVideoURL:adjustmentBaseFullSizePairedVideoURL:spatialOvercapturePairedVideoURL:fullSizeVideoURL:adjustmentsURL:originalAdjustmentsURL:adjustmentsSecondaryDataURL:mediaSubtypes:playbackStyle:playbackVariation:videoComplementVisibilityState:", v103, v101, v97, v96, v94, v95, v93, v35, v36, 0, v37, v38, v39, v34,
                      v100,
                      v99,
                      v91);

      goto LABEL_39;
    }
    v50 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      sessionUUID = v102->_sessionUUID;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = sessionUUID;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = 0;
      _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Unable to initialize asset bundle. Original Photo URL is: '%{public}@'. Need original photo URL to be non-nil to properly create an asset bundle.", buf, 0x16u);
    }

    if (a6)
    {
      v101 = [NSString stringWithFormat:@"The photo URL (%@) was empty.", 0];
      v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v131 = *MEMORY[0x1E4F28568];
      v132 = v101;
      v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
      v54 = [v52 errorWithDomain:@"com.apple.mobileslideshow.sharing" code:2 userInfo:v53];

      id v98 = v54;
      v40 = 0;
      *a6 = v98;

      goto LABEL_39;
    }
LABEL_73:
    v40 = 0;
    goto LABEL_68;
  }
  v103 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
  if (!v103)
  {
    v76 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = v102->_sessionUUID;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v77;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = 0;
      _os_log_impl(&dword_19B043000, v76, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Unable to initialize asset bundle. Original Video URL is: '%{public}@'. Need original video URL to be non-nil to properly create an asset bundle.", buf, 0x16u);
    }

    if (a6)
    {
      id v69 = [NSString stringWithFormat:@"The video URL (%@) was empty.", 0];
      v78 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v129 = *MEMORY[0x1E4F28568];
      id v130 = v69;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
      v80 = [v78 errorWithDomain:@"com.apple.mobileslideshow.sharing" code:3 userInfo:v79];

      id v81 = v80;
      v40 = 0;
      *a6 = v81;
LABEL_67:

LABEL_68:
      goto LABEL_69;
    }
    goto LABEL_73;
  }
  v101 = [MEMORY[0x1E4F28CB8] defaultManager];
  buf[0] = 0;
  v41 = [v12 path];
  int v42 = [v101 fileExistsAtPath:v41 isDirectory:buf];

  if (buf[0]) {
    int v43 = 1;
  }
  else {
    int v43 = v42;
  }
  if (v43 == 1) {
    [v101 removeItemAtURL:v12 error:0];
  }
  id v44 = objc_alloc(MEMORY[0x1E4F8CBC0]);
  v45 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestFullSizeVideoURLKey"];
  v46 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentBaseVideoURLKey"];
  v47 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestSpatialOvercaptureVideoURLKey"];
  v48 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
  v49 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestOriginalAdjustmentDataFileURLKey"];
  v40 = (void *)[v44 initWithOriginalVideoURL:v103 fullSizeRenderedVideoURL:v45 adjustmentBaseVideoURL:v46 spatialOvercaptureVideoURL:v47 adjustmentsURL:v48 originalAdjustmentsURL:v49 mediaSubtypes:v34 playbackStyle:v100 playbackVariation:v99];

LABEL_39:
  if (v40)
  {
    v55 = [v10 keywordProperties];
    v56 = [v55 keywordTitles];
    [v40 setKeywordTitles:v56];

    v57 = [v10 descriptionProperties];
    v58 = [v57 assetDescription];
    [v40 setAssetDescription:v58];

    v59 = [v10 descriptionProperties];
    v60 = [v59 accessibilityDescription];
    [v40 setAccessibilityDescription:v60];

    v61 = [v10 title];
    [v40 setAssetTitle:v61];

    v62 = [v10 originalMetadataProperties];
    v63 = [v62 originalFilename];
    [v40 setOriginalFilename:v63];

    v64 = [v10 creationDate];
    v65 = [v10 originalMetadataProperties];
    v66 = [v65 timeZone];
    [v40 setLibraryCreationDate:v64 inTimeZone:v66];

    v67 = [v10 location];
    [v40 setLibraryLocation:v67];

    v128[0] = @"PHAssetExportRequestSpatialOvercapturePhotoURLKey";
    v128[1] = @"PHAssetExportRequestSpatialOvercapturePairedVideoURLKey";
    v128[2] = @"PHAssetExportRequestSpatialOvercaptureVideoURLKey";
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:3];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v69 = v68;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v115 objects:v127 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v116;
      while (2)
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v116 != v71) {
            objc_enumerationMutation(v69);
          }
          v73 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v115 + 1) + 8 * i)];
          BOOL v74 = v73 == 0;

          if (!v74)
          {

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            LOBYTE(v126) = 0;
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke;
            aBlock[3] = &unk_1E5848D28;
            id v113 = v10;
            v114 = buf;
            v75 = (void (**)(void))_Block_copy(aBlock);
            if ([MEMORY[0x1E4F29060] isMainThread])
            {
              v75[2](v75);
            }
            else
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke_68;
              block[3] = &unk_1E5848D50;
              v111 = v75;
              dispatch_sync(MEMORY[0x1E4F14428], block);
            }
            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              v82 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                v83 = v102->_sessionUUID;
                *(_DWORD *)v123 = 138543362;
                v124 = v83;
                _os_log_impl(&dword_19B043000, v82, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Marking SOC resource(s) as purgeable in asset bundle.", v123, 0xCu);
              }

              [v40 setSpatialOvercaptureResourcesPurgeable:1];
            }

            _Block_object_dispose(buf, 8);
            goto LABEL_61;
          }
        }
        uint64_t v70 = [v69 countByEnumeratingWithState:&v115 objects:v127 count:16];
        if (v70) {
          continue;
        }
        break;
      }
    }

LABEL_61:
    id v109 = 0;
    [v40 writeToBundleAtURL:v12 error:&v109];
    id v81 = v109;
    if (v81)
    {
      v84 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v85 = v102->_sessionUUID;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        id v126 = v81;
        _os_log_impl(&dword_19B043000, v84, OS_LOG_TYPE_ERROR, "[AssetBundleExport: %{public}@] Unable to create '%@' bundle due to following error '%@'", buf, 0x20u);
      }

      v86 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v121 = *MEMORY[0x1E4F28A50];
      id v122 = v81;
      v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
      v88 = [v86 errorWithDomain:@"com.apple.mobileslideshow.sharing" code:4 userInfo:v87];

      if (a6) {
        *a6 = v88;
      }

      id v12 = 0;
    }
    goto LABEL_67;
  }
LABEL_69:
  id v12 = v12;
  v21 = v12;
LABEL_70:

  return v21;
}

void __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pl_managedAsset");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 modernResources];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"resourceType IN %@ AND trashedState = 1", &unk_1EEB26E08];
  v4 = [v2 filteredSetUsingPredicate:v3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count] != 0;
}

uint64_t __87__PHAssetBundleExportSession__createAssetBundleFromAsset_withFileURLs_atURL_withError___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_filenameBaseForAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHAssetBundleExportSession *)self customFilenameBase];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = [(PHAssetBundleExportSession *)self customFilenameBase];
  }
  else
  {
    [v4 fetchPropertySetsIfNeeded];
    v8 = [v4 originalMetadataProperties];
    v9 = [v8 originalFilename];

    if ([v9 length])
    {
      uint64_t v10 = [v9 stringByDeletingPathExtension];
    }
    else
    {
      id v11 = [v4 filename];
      uint64_t v12 = [v11 length];

      v13 = PLPhotoKitGetLog();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          sessionUUID = self->_sessionUUID;
          v16 = [v4 filename];
          int v20 = 138543618;
          v21 = sessionUUID;
          __int16 v22 = 2114;
          int v23 = v16;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Asset does not have valid originalFilename, going with library filename: %{public}@", (uint8_t *)&v20, 0x16u);
        }
        uint64_t v10 = [v4 filename];
      }
      else
      {
        if (v14)
        {
          v17 = self->_sessionUUID;
          v18 = [v4 uuid];
          int v20 = 138543618;
          v21 = v17;
          __int16 v22 = 2114;
          int v23 = v18;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "[AssetBundleExport: %{public}@] Asset does not have valid originalFilename, going with UUID: %{public}@", (uint8_t *)&v20, 0x16u);
        }
        uint64_t v10 = [v4 uuid];
      }
    }
    v7 = (void *)v10;
  }

  return v7;
}

- (void)writeToDirectoryURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(PHAssetBundleExportSession *)self asset];
  v9 = [(PHAssetBundleExportSession *)self fileURLs];
  id v12 = 0;
  uint64_t v10 = [(PHAssetBundleExportSession *)self _createAssetBundleFromAsset:v8 withFileURLs:v9 atURL:v7 withError:&v12];

  id v11 = v12;
  if (v6) {
    v6[2](v6, v10, v11);
  }
}

- (PHAssetBundleExportSession)initWithAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetBundleExportSession;
  v9 = [(PHAssetBundleExportSession *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    sessionUUID = v9->_sessionUUID;
    v9->_sessionUUID = (NSString *)v11;

    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v9->_fileURLs, a4);
  }

  return v9;
}

@end