@interface VCPWatchFaceAnalyzer
- (VCPWatchFaceAnalyzer)initWithOptions:(id)a3;
- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5;
@end

@implementation VCPWatchFaceAnalyzer

- (VCPWatchFaceAnalyzer)initWithOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPWatchFaceAnalyzer;
  v6 = [(VCPWatchFaceAnalyzer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  v8 = (unsigned int (**)(void))a4;
  v9 = v8;
  if (!v8 || (((uint64_t (*)(id))v8[2])(v8) & 1) == 0)
  {
    v40 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v40 fileExistsAtPath:@"/tmp/com.apple.mediaanalysisd/"])
    {
      id v39 = 0;
    }
    else
    {
      id v55 = 0;
      char v11 = [v40 createDirectoryAtPath:@"/tmp/com.apple.mediaanalysisd/" withIntermediateDirectories:1 attributes:0 error:&v55];
      id v39 = v55;
      if ((v11 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v10 = -18;
LABEL_44:

          goto LABEL_45;
        }
        log = VCPLogInstance();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v32 = [v39 description];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v32;
          _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);
        }
        int v10 = -18;
LABEL_43:

        goto LABEL_44;
      }
    }
    v12 = NSString;
    v13 = [MEMORY[0x1E4F29128] UUID];
    v14 = [v13 UUIDString];
    log = [v12 stringWithFormat:@"%@wf-%@", @"/tmp/com.apple.mediaanalysisd/", v14];

    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:log isDirectory:1];
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v54 = 0;
    [v15 createDirectoryAtURL:v41 withIntermediateDirectories:1 attributes:0 error:&v54];
    id v16 = v54;

    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Failed to create directory for watchface export: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      int v10 = -36;
      goto LABEL_42;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__54;
    v68 = __Block_byref_object_dispose__54;
    id v69 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__54;
    v52 = __Block_byref_object_dispose__54;
    id v53 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    options = self->_options;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __52__VCPWatchFaceAnalyzer_analyzeAsset_cancel_results___block_invoke;
    v44[3] = &unk_1E629C618;
    p_long long buf = &buf;
    v47 = &v48;
    v20 = v18;
    v45 = v20;
    id v21 = v43;
    id v22 = v41;
    v23 = options;
    v24 = v44;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    v25 = (void (*)(id, id, NSDictionary *, void *))getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr;
    v59 = getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr;
    if (!getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr)
    {
      *(void *)&long long v70 = MEMORY[0x1E4F143A8];
      *((void *)&v70 + 1) = 3221225472;
      v71 = ___ZL44getPFLGeneratePhotosFaceWithOptionsSymbolLocv_block_invoke;
      v72 = &unk_1E62970F8;
      v73 = &v56;
      v26 = (void *)PhotosFaceLayoutLibrary();
      v27 = dlsym(v26, "PFLGeneratePhotosFaceWithOptions");
      *(void *)(v73[1] + 24) = v27;
      getPFLGeneratePhotosFaceWithOptionsSymbolLoc(void)::ptr = *(_UNKNOWN **)(v73[1] + 24);
      v25 = (void (*)(id, id, NSDictionary *, void *))v57[3];
    }
    _Block_object_dispose(&v56, 8);
    if (!v25) {
      goto LABEL_46;
    }
    v25(v21, v22, v23, v24);

    dispatch_time_t v28 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v20, v28))
    {
      while (!v9 || !v9[2](v9))
      {
        dispatch_time_t v29 = dispatch_time(0, 100000000);
        if (!dispatch_semaphore_wait(v20, v29)) {
          goto LABEL_20;
        }
      }
      v30 = v21;
      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x2020000000;
      v35 = (void (*))getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr;
      v59 = getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr;
      if (!getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr)
      {
        *(void *)&long long v70 = MEMORY[0x1E4F143A8];
        *((void *)&v70 + 1) = 3221225472;
        v71 = ___ZL49getPFLCancelGeneratingPhotosFaceForAssetSymbolLocv_block_invoke;
        v72 = &unk_1E62970F8;
        v73 = &v56;
        v36 = (void *)PhotosFaceLayoutLibrary();
        v37 = dlsym(v36, "PFLCancelGeneratingPhotosFaceForAsset");
        *(void *)(v73[1] + 24) = v37;
        getPFLCancelGeneratingPhotosFaceForAssetSymbolLoc(void)::ptr = *(_UNKNOWN **)(v73[1] + 24);
        v35 = (void (*))v57[3];
      }
      _Block_object_dispose(&v56, 8);
      if (v35)
      {
        v35(v30);
        int v10 = -128;
        goto LABEL_36;
      }
LABEL_46:
      dlerror();
      abort_report_np();
      __break(1u);
    }
LABEL_20:
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = [*(id *)(*((void *)&buf + 1) + 40) description];
          LODWORD(v70) = 138412290;
          *(void *)((char *)&v70 + 4) = v31;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Error running exportWatchFaceForAsset: %@", (uint8_t *)&v70, 0xCu);
        }
LABEL_24:
        int v10 = -18;
LABEL_36:

LABEL_41:
        _Block_object_dispose(&v48, 8);

        _Block_object_dispose(&buf, 8);
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v33 = v49[5];
      if (v33)
      {
        v63 = @"WatchFaceResults";
        v60[0] = @"watchFacePath";
        v60[1] = @"watchFaceData";
        v61[0] = log;
        v61[1] = v33;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
        v62 = v30;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
        v64 = v34;
        *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

        int v10 = 0;
        goto LABEL_36;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v70) = 0;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_ERROR, "Nil Photo Data for asset", (uint8_t *)&v70, 2u);
        }
        goto LABEL_24;
      }
    }
    int v10 = -18;
    goto LABEL_41;
  }
  int v10 = -128;
LABEL_45:

  return v10;
}

void __52__VCPWatchFaceAnalyzer_analyzeAsset_cancel_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end