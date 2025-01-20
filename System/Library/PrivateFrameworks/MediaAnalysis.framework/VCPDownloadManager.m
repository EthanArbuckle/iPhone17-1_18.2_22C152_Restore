@interface VCPDownloadManager
+ (id)sharedManager;
+ (unint64_t)maxSizeBytes;
+ (void)_reportDownload:(unint64_t)a3;
- (VCPDownloadManager)init;
- (id)cancel;
- (id)requestDownloadOfResource:(id)a3;
- (void)flush;
- (void)setCancel:(id)a3;
@end

@implementation VCPDownloadManager

- (VCPDownloadManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPDownloadManager;
  v2 = [(VCPDownloadManager *)&v8 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    mutex = v2->_mutex;
    v2->_mutex = (OS_dispatch_semaphore *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_72);
  }
  v2 = (void *)sharedManager_instance_0;
  return v2;
}

void __35__VCPDownloadManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(VCPDownloadManager);
  v1 = (void *)sharedManager_instance_0;
  sharedManager_instance_0 = (uint64_t)v0;
}

+ (unint64_t)maxSizeBytes
{
  return 10485760;
}

+ (void)_reportDownload:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      dispatch_semaphore_t v5 = VCPTaskIDDescription(1);
      qos_class_t v6 = qos_class_self();
      v7 = VCPMAQoSDescription(v6);
      *(_DWORD *)buf = 138413058;
      v17 = @"com.apple.mediaanalysisd.das.dutycycle.task";
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[DAS QoS] %@: %@ (%@) download %lu bytes", buf, 0x2Au);
    }
  }
  objc_super v8 = +[VCPMADCoreAnalyticsManager sharedManager];
  v9 = VCPTaskIDDescription(1);
  qos_class_t v10 = qos_class_self();
  v11 = VCPMAQoSDescription(v10);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3, @"taskName", @"QoS", @"DownloadAssetCount", @"DownloadBytes", v9, v11, &unk_1F15EDA10);
  v15[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:4];
  [v8 sendEvent:@"com.apple.mediaanalysisd.das.dutycycle.task" withAnalytics:v13];
}

- (id)requestDownloadOfResource:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 fileSize] > 0xA00000)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      qos_class_t v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "Requested resource exceeds maximum supported size", buf, 2u);
      }
    }
    dispatch_semaphore_t v3 = 0;
    goto LABEL_58;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutex, 0xFFFFFFFFFFFFFFFFLL);
  localIdentifier = self->_localIdentifier;
  objc_super v8 = [v5 assetLocalIdentifier];
  LODWORD(localIdentifier) = [(NSString *)localIdentifier isEqualToString:v8];

  int v9 = MediaAnalysisLogLevel();
  if (localIdentifier)
  {
    if (v9 >= 6)
    {
      qos_class_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "Resource already in the buffer. Skip downloading.", buf, 2u);
      }
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v12 = [(NSMutableData *)self->_buffer mutableBytes];
    unint64_t length = self->_length;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke;
    v68[3] = &unk_1E629BE88;
    v68[4] = self;
    dispatch_semaphore_t v3 = [v11 initWithBytesNoCopy:v12 length:length deallocator:v68];
    goto LABEL_58;
  }
  if (v9 >= 6)
  {
    uint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v5 assetLocalIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "[%@] requestDownloadOfResource: %@", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v70 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  context = (void *)MEMORY[0x1C186D320]();
  if (self->_buffer
    || (objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 10485760, context),
        v16 = (NSMutableData *)objc_claimAutoreleasedReturnValue(),
        buffer = self->_buffer,
        self->_buffer = v16,
        buffer,
        self->_buffer))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F38F90]);
    [v18 setNetworkAccessAllowed:1];
    [v18 setDownloadIsTransient:1];
    [v18 setProgressHandler:&__block_literal_global_202_0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_203;
    aBlock[3] = &unk_1E629BEB0;
    v62 = &v64;
    aBlock[4] = self;
    id v19 = v5;
    id v61 = v19;
    v63 = buf;
    v49 = _Block_copy(aBlock);
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v59[3] = 0;
    __int16 v20 = VCPSignPostLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    __int16 v22 = VCPSignPostLog();
    unint64_t v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PHAssetResourceManager_requestDataForAssetResource", "", v58, 2u);
    }

    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__48;
    v56 = __Block_byref_object_dispose__48;
    dispatch_semaphore_t v57 = dispatch_semaphore_create(0);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_205;
    v51[3] = &unk_1E629BED8;
    v51[4] = self;
    v51[5] = buf;
    v51[6] = &v64;
    v51[7] = v59;
    v51[8] = &v52;
    v51[9] = v21;
    v48 = _Block_copy(v51);
    uint64_t v24 = [MEMORY[0x1E4F38F80] defaultManager];
    dispatch_semaphore_t v3 = [v24 requestDataForAssetResource:v19 options:v18 dataReceivedHandler:v49 completionHandler:v48];

    if (v3)
    {
      v25 = [(VCPDownloadManager *)self cancel];

      if (v25)
      {
        unint64_t v26 = -100000000;
        while (1)
        {
          v27 = v53[5];
          dispatch_time_t v28 = dispatch_time(0, 100000000);
          if (!dispatch_semaphore_wait(v27, v28)) {
            break;
          }
          v26 += 100000000;
          if (v26 >= 0x3781BF501)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v44 = VCPLogInstance();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v58 = 0;
                _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "Download resource timed-out", v58, 2u);
              }
            }
            goto LABEL_51;
          }
          v29 = [(VCPDownloadManager *)self cancel];
          int v30 = v29[2]();

          if (v30)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v58 = 0;
                _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_INFO, "Cancelling download", v58, 2u);
              }
            }
            v32 = objc_msgSend(MEMORY[0x1E4F38F80], "defaultManager", context);
            [v32 cancelDataRequest:v3];

            dispatch_semaphore_wait((dispatch_semaphore_t)v53[5], 0xFFFFFFFFFFFFFFFFLL);
            uint64_t v33 = *(void *)&buf[8];
            int v34 = -128;
            goto LABEL_52;
          }
        }
LABEL_44:
        if (!*(_DWORD *)(*(void *)&buf[8] + 24))
        {
          self->_unint64_t length = v65[3];
          v38 = [v19 assetLocalIdentifier];
          v39 = self->_localIdentifier;
          self->_localIdentifier = v38;

          id v40 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v41 = [(NSMutableData *)self->_buffer mutableBytes];
          unint64_t v42 = self->_length;
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_209;
          v50[3] = &unk_1E629BE88;
          v50[4] = self;
          dispatch_semaphore_t v3 = [v40 initWithBytesNoCopy:v41 length:v42 deallocator:v50];
          int v43 = 1;
LABEL_54:

          _Block_object_dispose(&v52, 8);
          _Block_object_dispose(v59, 8);

          goto LABEL_55;
        }
LABEL_53:
        int v43 = 10;
        goto LABEL_54;
      }
      v35 = v53[5];
      dispatch_time_t v36 = dispatch_time(0, 15000000000);
      if (!dispatch_semaphore_wait(v35, v36)) {
        goto LABEL_44;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v37 = VCPLogInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEFAULT, "Download resource timed-out", v58, 2u);
        }
      }
LABEL_51:
      v45 = objc_msgSend(MEMORY[0x1E4F38F80], "defaultManager", context);
      [v45 cancelDataRequest:v3];

      dispatch_semaphore_wait((dispatch_semaphore_t)v53[5], 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v33 = *(void *)&buf[8];
      int v34 = -925;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        dispatch_semaphore_t v3 = VCPLogInstance();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Failed to issue resource request", v58, 2u);
        }
      }
      uint64_t v33 = *(void *)&buf[8];
      int v34 = -18;
    }
LABEL_52:
    *(_DWORD *)(v33 + 24) = v34;
    goto LABEL_53;
  }
  *(_DWORD *)(*(void *)&buf[8] + 24) = -18;
  int v43 = 10;
LABEL_55:
  if (v43 == 10)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutex);
    dispatch_semaphore_t v3 = 0;
  }
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(buf, 8);
LABEL_58:

  return v3;
}

intptr_t __48__VCPDownloadManager_requestDownloadOfResource___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_199(double a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v3 = 134217984;
      double v4 = a1;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "Download progress: %.2f", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_203(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unint64_t v5 = [v3 length] + v4;
  unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) length];
  int v7 = MediaAnalysisLogLevel();
  if (v5 <= v6)
  {
    if (v7 >= 7)
    {
      int v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = [v3 length];
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        uint64_t v12 = [v3 length] + v11;
        uint64_t v13 = [*(id *)(a1 + 40) fileSize];
        int v16 = 134218496;
        uint64_t v17 = v10;
        __int16 v18 = 2048;
        uint64_t v19 = v12;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "    Received %llu bytes (Overall: %llu/%llu)", (uint8_t *)&v16, 0x20u);
      }
    }
    uint64_t v14 = (void *)([*(id *)(*(void *)(a1 + 32) + 16) mutableBytes]
                 + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    id v15 = v3;
    memcpy(v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v15 length];
  }
  else
  {
    if (v7 >= 7)
    {
      objc_super v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "Data received exceeds maximum supported size", (uint8_t *)&v16, 2u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -18;
  }
}

void __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_205(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 3)
    {
      unint64_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        unint64_t v6 = [v3 description];
        int v11 = 138412290;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Failed to download asset resource (%@)", (uint8_t *)&v11, 0xCu);
      }
    }
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -18;
  }
  else
  {
    if (v4 >= 7)
    {
      int v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "Successfully downloaded asset resource", (uint8_t *)&v11, 2u);
      }
    }
    [(id)objc_opt_class() _reportDownload:*(void *)(*(void *)(a1[6] + 8) + 24)];
  }
  objc_super v8 = VCPSignPostLog();
  int v9 = v8;
  os_signpost_id_t v10 = a1[9];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PHAssetResourceManager_requestDataForAssetResource", "", (uint8_t *)&v11, 2u);
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 24))
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8) + 40));
}

intptr_t __48__VCPDownloadManager_requestDownloadOfResource___block_invoke_209(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));
}

- (void)flush
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutex, 0xFFFFFFFFFFFFFFFFLL);
  buffer = self->_buffer;
  self->_buffer = 0;

  id cancel = self->_cancel;
  self->_id cancel = 0;

  localIdentifier = self->_localIdentifier;
  self->_localIdentifier = 0;

  mutex = self->_mutex;
  dispatch_semaphore_signal(mutex);
}

- (id)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancel, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mutex, 0);
}

@end