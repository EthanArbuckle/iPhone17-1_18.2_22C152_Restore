@interface VCPDefaultPhotoLibraryManager
+ (id)sharedManager;
- (VCPDefaultPhotoLibraryManager)init;
- (id)defaultPhotoLibrary;
- (void)closedefaultPhotoLibrary;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
@end

@implementation VCPDefaultPhotoLibraryManager

- (VCPDefaultPhotoLibraryManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPDefaultPhotoLibraryManager;
  v2 = [(VCPDefaultPhotoLibraryManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPDefaultPhotoLibraryManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCPDefaultPhotoLibraryManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_instance_1;
  return v2;
}

void __46__VCPDefaultPhotoLibraryManager_sharedManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_instance_1;
  sharedManager_instance_1 = (uint64_t)v0;
}

- (id)defaultPhotoLibrary
{
  if ([MEMORY[0x1E4F39220] isMultiLibraryModeEnabled])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__49;
    v11 = __Block_byref_object_dispose__49;
    id v12 = 0;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__VCPDefaultPhotoLibraryManager_defaultPhotoLibrary__block_invoke;
    v6[3] = &unk_1E6296FA8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F39220] sharedPhotoLibrary];
  }
  return v4;
}

void __52__VCPDefaultPhotoLibraryManager_defaultPhotoLibrary__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "Connecting to system photo library...", buf, 2u);
      }
    }
    if (*(void *)(*(void *)(a1 + 32) + 16)
      || ([MEMORY[0x1E4F39220] systemPhotoLibraryURL],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = *(void *)(a1 + 32),
          v5 = *(void **)(v4 + 16),
          *(void *)(v4 + 16) = v3,
          v5,
          *(void *)(*(void *)(a1 + 32) + 16)))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        objc_super v6 = VCPLogInstance();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "Opening system photo library...", buf, 2u);
        }
      }
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F39220]) initWithPhotoLibraryURL:*(void *)(*(void *)(a1 + 32) + 16)];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = v7;

      v10 = *(void **)(*(void *)(a1 + 32) + 24);
      id v19 = 0;
      int v11 = [v10 openAndWaitWithUpgrade:0 error:&v19];
      id v12 = v19;
      int v13 = MediaAnalysisLogLevel();
      if (v11)
      {
        if (v13 >= 7)
        {
          v14 = VCPLogInstance();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "Opened system photo library", buf, 2u);
          }
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "registerAvailabilityObserver:");
      }
      else
      {
        if (v13 >= 4)
        {
          v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v12 description];
            *(_DWORD *)buf = 138412290;
            v21 = v16;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "Failed to open system photo library (%@)", buf, 0xCu);
          }
        }
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = *(void **)(v17 + 24);
        *(void *)(v17 + 24) = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_24;
      }
      id v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Failed to obtain system photo library URL", buf, 2u);
      }
    }
  }
LABEL_24:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
}

- (void)closedefaultPhotoLibrary
{
  defaultPhotoLibrary = self->_defaultPhotoLibrary;
  if (defaultPhotoLibrary)
  {
    [(PHPhotoLibrary *)defaultPhotoLibrary unregisterAvailabilityObserver:self];
    [(PHPhotoLibrary *)self->_defaultPhotoLibrary close];
    uint64_t v4 = self->_defaultPhotoLibrary;
    self->_defaultPhotoLibrary = 0;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v6 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "Closed Photo Library", v6, 2u);
      }
    }
  }
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "Photo Library unavailable (%@); closing Photo Library...",
        buf,
        0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCPDefaultPhotoLibraryManager_photoLibraryDidBecomeUnavailable___block_invoke;
  block[3] = &unk_1E629BF70;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __66__VCPDefaultPhotoLibraryManager_photoLibraryDidBecomeUnavailable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained closedefaultPhotoLibrary];
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_defaultPhotoLibraryURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end