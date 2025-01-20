@interface VCPParallaxAnalyzer
- (VCPParallaxAnalyzer)initWithOptions:(id)a3 andExistingResults:(id)a4;
- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5;
- (int)exportWallpaperForAsset:(id)a3 cancel:(id)a4 results:(id *)a5;
- (int)upgradeWallPaperAtURL:(id)a3 toURL:(id)a4 cancel:(id)a5 results:(id *)a6;
@end

@implementation VCPParallaxAnalyzer

- (VCPParallaxAnalyzer)initWithOptions:(id)a3 andExistingResults:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v42 = a4;
  v54.receiver = self;
  v54.super_class = (Class)VCPParallaxAnalyzer;
  v43 = [(VCPParallaxAnalyzer *)&v54 init];
  if (v43)
  {
    v41 = (void *)[v40 mutableCopy];
    v6 = [v42 objectForKeyedSubscript:@"PetsResults"];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v9 = [v42 objectForKeyedSubscript:@"PetsResults"];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v51;
        v12 = (CGRect *)MEMORY[0x1E4F1DB28];
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v51 != v11) {
              objc_enumerationMutation(v9);
            }
            v14 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * v13), "objectForKeyedSubscript:", @"attributes", v40);
            v15 = [v14 objectForKeyedSubscript:@"petsBounds"];
            NSRect v58 = NSRectFromString(v15);
            CGFloat x = v58.origin.x;
            CGFloat y = v58.origin.y;
            CGFloat width = v58.size.width;
            CGFloat height = v58.size.height;

            v59.origin.CGFloat x = x;
            v59.origin.CGFloat y = y;
            v59.size.CGFloat width = width;
            v59.size.CGFloat height = height;
            if (!CGRectEqualToRect(v59, *v12))
            {
              *(CGFloat *)v49 = x;
              *(CGFloat *)&v49[1] = y;
              *(CGFloat *)&v49[2] = width;
              *(CGFloat *)&v49[3] = height;
              v20 = [MEMORY[0x1E4F29238] valueWithBytes:v49 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
              [v8 addObject:v20];
            }
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v10);
      }

      if ([v8 count]) {
        [v41 setObject:v8 forKeyedSubscript:@"PetsRegions"];
      }
    }
    v21 = objc_msgSend(v42, "objectForKeyedSubscript:", @"PetsFaceResults", v40);
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      v23 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v24 = [v42 objectForKeyedSubscript:@"PetsFaceResults"];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v46;
        v27 = (CGRect *)MEMORY[0x1E4F1DB28];
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(v24);
            }
            v29 = [*(id *)(*((void *)&v45 + 1) + 8 * v28) objectForKeyedSubscript:@"attributes"];
            v30 = [v29 objectForKeyedSubscript:@"petsBounds"];
            NSRect v60 = NSRectFromString(v30);
            CGFloat v31 = v60.origin.x;
            CGFloat v32 = v60.origin.y;
            CGFloat v33 = v60.size.width;
            CGFloat v34 = v60.size.height;

            v61.origin.CGFloat x = v31;
            v61.origin.CGFloat y = v32;
            v61.size.CGFloat width = v33;
            v61.size.CGFloat height = v34;
            if (!CGRectEqualToRect(v61, *v27))
            {
              *(CGFloat *)v44 = v31;
              *(CGFloat *)&v44[1] = v32;
              *(CGFloat *)&v44[2] = v33;
              *(CGFloat *)&v44[3] = v34;
              v35 = [MEMORY[0x1E4F29238] valueWithBytes:v44 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
              [v23 addObject:v35];
            }
            ++v28;
          }
          while (v25 != v28);
          uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v25);
      }

      if ([v23 count]) {
        [v41 setObject:v23 forKeyedSubscript:@"PetsFaceRegions"];
      }
    }
    if ([v41 count])
    {
      uint64_t v36 = [v41 copy];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionary];
    }
    options = v43->_options;
    v43->_options = (NSDictionary *)v36;

    v38 = v43;
  }

  return v43;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (unsigned int (**)(void))a4;
  uint64_t v10 = v9;
  if (!v9 || (((uint64_t (*)(id))v9[2])(v9) & 1) == 0)
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__55;
    v39 = __Block_byref_object_dispose__55;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    CGFloat v32 = __Block_byref_object_copy__55;
    CGFloat v33 = __Block_byref_object_dispose__55;
    id v34 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __51__VCPParallaxAnalyzer_analyzeAsset_cancel_results___block_invoke;
    uint64_t v25 = &unk_1E629C658;
    v27 = &v29;
    uint64_t v28 = &v35;
    uint64_t v13 = v12;
    uint64_t v26 = v13;
    v14 = _Block_copy(&v22);
    id v15 = objc_alloc(MEMORY[0x1E4F39350]);
    v16 = objc_msgSend(v15, "initWithPhotoAsset:", v8, v22, v23, v24, v25);
    [getPISegmentationClass() computeSegmentationScoresForAsset:v16 options:self->_options completion:v14];
    dispatch_time_t v17 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v13, v17))
    {
      while (!v10 || !v10[2](v10))
      {
        dispatch_time_t v18 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v13, v18)) {
          goto LABEL_8;
        }
      }
      [getPISegmentationClass() cancelSegmentationForAsset:v16];
      int v11 = -128;
      goto LABEL_21;
    }
LABEL_8:
    if (v30[5])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [(id)v30[5] description];
          *(_DWORD *)buf = 138412290;
          long long v45 = v20;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Error running computeSegmentationScoresForAsset: %@", buf, 0xCu);
        }
LABEL_12:
        int v11 = -18;
LABEL_15:

LABEL_21:
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(&v35, 8);
        goto LABEL_22;
      }
    }
    else
    {
      if ([(id)v36[5] count])
      {
        uint64_t v41 = v36[5];
        id v42 = @"ParallaxResults";
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
        v43 = v19;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        int v11 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "No parallax results returned", buf, 2u);
        }
        goto LABEL_12;
      }
    }
    int v11 = -18;
    goto LABEL_21;
  }
  int v11 = -128;
LABEL_22:

  return v11;
}

void __51__VCPParallaxAnalyzer_analyzeAsset_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)exportWallpaperForAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v8 = (unsigned int (**)(void))a4;
  id v9 = v8;
  if (!v8 || (((uint64_t (*)(id))v8[2])(v8) & 1) == 0)
  {
    uint64_t v31 = a5;
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__55;
    v44 = __Block_byref_object_dispose__55;
    id v45 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__VCPParallaxAnalyzer_exportWallpaperForAsset_cancel_results___block_invoke;
    aBlock[3] = &unk_1E629C680;
    v39 = &v40;
    dispatch_semaphore_t v12 = v11;
    v38 = v12;
    CGFloat v33 = _Block_copy(aBlock);
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v13 fileExistsAtPath:@"/tmp/com.apple.mediaanalysisd/"])
    {
      id v14 = 0;
    }
    else
    {
      id v36 = 0;
      char v15 = [v13 createDirectoryAtPath:@"/tmp/com.apple.mediaanalysisd/" withIntermediateDirectories:1 attributes:0 error:&v36];
      id v14 = v36;
      if ((v15 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v10 = -18;
LABEL_34:

          _Block_object_dispose(&v40, 8);
          goto LABEL_35;
        }
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v14 description];
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = (uint64_t)v29;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", buf, 0xCu);
        }
        int v10 = -18;
LABEL_33:

        goto LABEL_34;
      }
    }
    v16 = NSString;
    dispatch_time_t v17 = [MEMORY[0x1E4F29128] UUID];
    dispatch_time_t v18 = [v17 UUIDString];
    v19 = [v16 stringWithFormat:@"%@wp-%@", @"/tmp/com.apple.mediaanalysisd/", v18];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v19 isDirectory:1];
    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v35 = 0;
    [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v22 = v35;

    if (v22)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v10 = -36;
LABEL_32:

        goto LABEL_33;
      }
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = v41[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v24;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "Failed to create directory for wallpaper export: %@", buf, 0xCu);
      }
      int v10 = -36;
    }
    else
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F39350]) initWithPhotoAsset:v34];
      [getPISegmentationClass() exportWallpaperForAsset:v23 toURL:v20 options:self->_options completion:v33];
      dispatch_time_t v25 = dispatch_time(0, 100000000);
      if (dispatch_semaphore_wait(v12, v25))
      {
        while (!v9 || !v9[2](v9))
        {
          dispatch_time_t v26 = dispatch_time(0, 100000000);
          if (!dispatch_semaphore_wait(v12, v26)) {
            goto LABEL_16;
          }
        }
        [getPISegmentationClass() cancelSegmentationForAsset:v23];
        int v10 = -128;
        goto LABEL_31;
      }
LABEL_16:
      if (v41[5])
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v10 = -18;
          goto LABEL_31;
        }
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [(id)v41[5] description];
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v28;
          CGFloat v32 = (void *)v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Error running exportWallpaperForAsset: %@", buf, 0xCu);
        }
        int v10 = -18;
      }
      else
      {
        long long v47 = @"WallpaperExportResults";
        uint64_t v46 = v19;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        long long v48 = v27;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        int v10 = 0;
        *uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_31:

    goto LABEL_32;
  }
  int v10 = -128;
LABEL_35:

  return v10;
}

void __62__VCPParallaxAnalyzer_exportWallpaperForAsset_cancel_results___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)upgradeWallPaperAtURL:(id)a3 toURL:(id)a4 cancel:(id)a5 results:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v43 = a4;
  id v10 = a5;
  dispatch_semaphore_t v11 = v10;
  if (!a6)
  {
    int v12 = -18;
    goto LABEL_31;
  }
  if (!v10 || ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) == 0)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__55;
    uint64_t v41 = __Block_byref_object_dispose__55;
    id v42 = 0;
    uint64_t v31 = 0;
    CGFloat v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__55;
    id v35 = __Block_byref_object_dispose__55;
    id v36 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__VCPParallaxAnalyzer_upgradeWallPaperAtURL_toURL_cancel_results___block_invoke;
    aBlock[3] = &unk_1E629C6A8;
    uint64_t v28 = &v37;
    uint64_t v29 = &v31;
    id v14 = v13;
    v27 = v14;
    id v30 = _Block_copy(aBlock);
    SEL v15 = NSSelectorFromString(&cfstr_Upgradewallpap.isa);
    getPISegmentationClass();
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
LABEL_30:

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v37, 8);

        goto LABEL_31;
      }
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "PISegmentation SPI not available", buf, 2u);
      }
      int v12 = -18;
LABEL_29:

      goto LABEL_30;
    }
    v16 = [getPISegmentationClass() methodSignatureForSelector:v15];
    dispatch_time_t v17 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v16];
    getPISegmentationClass();
    [v17 setTarget:objc_opt_class()];
    [v17 setSelector:v15];
    [v17 setArgument:&v44 atIndex:2];
    [v17 setArgument:&v43 atIndex:3];
    [v17 setArgument:&self->_options atIndex:4];
    [v17 setArgument:&v30 atIndex:5];
    [v17 invoke];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (v32[5])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v12 = -18;
LABEL_28:

        goto LABEL_29;
      }
      dispatch_time_t v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [(id)v32[5] description];
        *(_DWORD *)buf = 138412290;
        long long v48 = v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "Error running upgradeWallpaperAtURL: %@", buf, 0xCu);
      }
      int v12 = -18;
    }
    else
    {
      uint64_t v20 = v38[5];
      id v25 = 0;
      v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v25];
      dispatch_time_t v18 = v25;
      if (v18 || !v21)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          id v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [v18 description];
            *(_DWORD *)buf = 138412290;
            long long v48 = v23;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "Error running encoding PosterEditConfiguration: %@", buf, 0xCu);
          }
        }
        int v12 = -18;
      }
      else
      {
        id v45 = @"WallpaperPosterConfigDataResults";
        uint64_t v46 = v21;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        int v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_28;
  }
  int v12 = -128;
LABEL_31:

  return v12;
}

void __66__VCPParallaxAnalyzer_upgradeWallPaperAtURL_toURL_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end