@interface MADServicePhotosVideoAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)trimTimeRange;
- (MADServicePhotosVideoAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5;
- (id)animatedStickerScore;
- (id)identifier;
- (id)isSensitive;
- (id)resources;
- (id)scoresForLabels;
- (id)url;
- (unint64_t)assetType;
@end

@implementation MADServicePhotosVideoAsset

- (MADServicePhotosVideoAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADServicePhotosVideoAsset;
  v10 = [(MADServiceVideoAsset *)&v13 initWithClientBundleID:a4 clientTeamID:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_photosAsset, a3);
  }

  return v11;
}

- (unint64_t)assetType
{
  return 6;
}

- (id)identifier
{
  return (id)[(PHAsset *)self->_photosAsset localIdentifier];
}

- (id)resources
{
  resources = self->_resources;
  if (!resources)
  {
    objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", self->_photosAsset);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resources;
    self->_resources = v4;

    resources = self->_resources;
  }
  return resources;
}

- (id)url
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [(PHAsset *)self->_photosAsset localIdentifier];
      v4 = [(PHAsset *)self->_photosAsset vcp_typeDescription];
      int v5 = [(PHAsset *)self->_photosAsset mediaType];
      int v6 = [(PHAsset *)self->_photosAsset mediaSubtypes];
      int v7 = [(PHAsset *)self->_photosAsset pixelWidth];
      int v8 = [(PHAsset *)self->_photosAsset pixelHeight];
      *(_DWORD *)buf = 138413570;
      v47 = v3;
      __int16 v48 = 2112;
      *(void *)v49 = v4;
      *(_WORD *)&v49[8] = 1024;
      *(_DWORD *)v50 = v5;
      *(_WORD *)&v50[4] = 1024;
      int v51 = v6;
      __int16 v52 = 1024;
      int v53 = v7;
      __int16 v54 = 1024;
      int v55 = v8;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);
    }
  }
  id v9 = [(MADServicePhotosVideoAsset *)self resources];
  v10 = objc_msgSend(v9, "vcp_movieResourcesSorted:", -[PHAsset vcp_hasAdjustments:](self->_photosAsset, "vcp_hasAdjustments:", v9));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [v10 reverseObjectEnumerator];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v11)
  {
    v30 = 0;
    goto LABEL_33;
  }
  uint64_t v12 = v11;
  v37 = v10;
  v38 = v9;
  uint64_t v13 = *(void *)v42;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(PHAsset *)self->_photosAsset localIdentifier];
          int v18 = [v15 type];
          int v19 = [v15 pixelWidth];
          int v20 = [v15 pixelHeight];
          *(_DWORD *)buf = 138413058;
          v47 = v17;
          __int16 v48 = 1024;
          *(_DWORD *)v49 = v18;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = v19;
          *(_WORD *)v50 = 1024;
          *(_DWORD *)&v50[2] = v20;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating movie resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);
        }
      }
      if ((objc_msgSend(v15, "vcp_isLocallyAvailable", v37) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 5) {
          continue;
        }
        v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(PHAsset *)self->_photosAsset localIdentifier];
          *(_DWORD *)buf = 138412290;
          v47 = v27;
          v28 = v26;
          v29 = "[%@] Resource not locally available; skipping resource";
LABEL_22:
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
        }
LABEL_23:

        continue;
      }
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      v22 = [v15 privateFileURL];
      v23 = [v22 path];
      char v24 = [v21 fileExistsAtPath:v23];

      int v25 = MediaAnalysisLogLevel();
      if (v24)
      {
        v10 = v37;
        if (v25 >= 5)
        {
          v31 = VCPLogInstance();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [(PHAsset *)self->_photosAsset localIdentifier];
            int v33 = [v15 type];
            int v34 = [v15 pixelWidth];
            int v35 = [v15 pixelHeight];
            *(_DWORD *)buf = 138413058;
            v47 = v32;
            __int16 v48 = 1024;
            *(_DWORD *)v49 = v33;
            *(_WORD *)&v49[4] = 1024;
            *(_DWORD *)&v49[6] = v34;
            *(_WORD *)v50 = 1024;
            *(_DWORD *)&v50[2] = v35;
            _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "[%@] Selected resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);
          }
        }
        v30 = [v15 privateFileURL];
        id v9 = v38;
        goto LABEL_33;
      }
      if (v25 >= 5)
      {
        v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(PHAsset *)self->_photosAsset localIdentifier];
          *(_DWORD *)buf = 138412290;
          v47 = v27;
          v28 = v26;
          v29 = "[%@] Resource marked available, but file does not exist; skipping resource";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  v30 = 0;
  v10 = v37;
  id v9 = v38;
LABEL_33:

  return v30;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  v4 = [(PHAsset *)self->_photosAsset photoIrisProperties];
  if (v4)
  {
    int v6 = v4;
    [v4 photoIrisStillDisplayTime];
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)trimTimeRange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [(PHAsset *)self->_photosAsset mediaAnalysisProperties];
  int v6 = [v5 mediaAnalysisTimeStamp];
  int v7 = [(PHAsset *)self->_photosAsset adjustmentVersion];
  if (![v6 isEqual:v7])
  {

    goto LABEL_11;
  }
  uint64_t v8 = [v5 mediaAnalysisVersion];

  if (!v8)
  {
LABEL_11:
    uint64_t v10 = MEMORY[0x1E4F1FA20];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.var3 = v11;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v10 + 32);
    goto LABEL_12;
  }
  if ([v5 mediaAnalysisVersion] != 70 && (int)MediaAnalysisLogLevel() >= 5)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = [v5 mediaAnalysisVersion];
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "Using trim range from older analysis version (%d)", (uint8_t *)v13, 8u);
    }
  }
  if (v5)
  {
    [v5 bestVideoTimeRange];
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }
LABEL_12:

  return result;
}

- (id)isSensitive
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(PHAsset *)self->_photosAsset vcp_needsFullAnalysisProcessing:0])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v4 = [(PHAsset *)self->_photosAsset localIdentifier];
        int v9 = 138412290;
        uint64_t v10 = v4;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[%@] Asset not processed or outdated for full analysis", (uint8_t *)&v9, 0xCu);
      }
    }
    return 0;
  }
  else
  {
    int v6 = [(PHAsset *)self->_photosAsset mediaAnalysisProperties];
    int v7 = [v6 screenTimeDeviceImageSensitivity];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CC28];
    if (v7) {
      uint64_t v8 = 0;
    }
    if (v7 == 1) {
      return (id)MEMORY[0x1E4F1CC38];
    }
    else {
      return v8;
    }
  }
}

- (id)scoresForLabels
{
  v3 = [(PHAsset *)self->_photosAsset photoLibrary];
  v4 = +[VCPDatabaseReader databaseForPhotoLibrary:v3];

  int v5 = [(PHAsset *)self->_photosAsset localIdentifier];
  int v6 = [v4 queryAnalysisForAsset:v5];

  if ([v6 count])
  {
    int v7 = objc_msgSend(v6, "vcp_results");
    uint64_t v8 = [v7 objectForKeyedSubscript:@"SafetyResults"];

    if ([v8 count])
    {
      int v9 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v10 = [v8 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"attributes"];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"SensitivitySceneResults"];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__MADServicePhotosVideoAsset_scoresForLabels__block_invoke;
      v17[3] = &unk_1E629B248;
      id v18 = v9;
      id v13 = v9;
      [v12 enumerateKeysAndObjectsUsingBlock:v17];
      if ([v13 count]) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __45__MADServicePhotosVideoAsset_scoresForLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  int v5 = VCPSpecialLabelFromExtendedSceneClassificationID([a2 longLongValue]);
  if (v5) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)animatedStickerScore
{
  return [(PHAsset *)self->_photosAsset vcp_animatedStickerScore];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_photosAsset, 0);
}

@end