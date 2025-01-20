@interface MADVUGalleryReader
+ (id)sharedGalleryWithPhotoLibrary:(id)a3;
- (MADVUGalleryReader)initWithPhotoLibrary:(id)a3;
- (id)queryKeyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5;
- (void)flush;
@end

@implementation MADVUGalleryReader

- (MADVUGalleryReader)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVUGalleryReader;
  v5 = [(MADVUGalleryReader *)&v13 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MADVUGalleryReader", v6);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL");
    storageURL = v5->_storageURL;
    v5->_storageURL = (NSURL *)v9;

    vuService = v5->_vuService;
    v5->_vuService = 0;
  }
  return v5;
}

+ (id)sharedGalleryWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[VCPSharedInstanceManager sharedManager];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MADVUGalleryReader_sharedGalleryWithPhotoLibrary___block_invoke;
    v9[3] = &unk_1E629C868;
    id v10 = v3;
    dispatch_queue_t v7 = [v4 sharedInstanceWithIdentifier:v6 andCreationBlock:v9];
  }
  else
  {
    dispatch_queue_t v7 = 0;
  }

  return v7;
}

MADVUGalleryReader *__52__MADVUGalleryReader_sharedGalleryWithPhotoLibrary___block_invoke(uint64_t a1)
{
  v1 = [[MADVUGalleryReader alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  return v1;
}

- (id)queryKeyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_vuService) {
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "[MADVUGalleryReader] Lazy allocation of vuService", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v10 = (void *)getGDVUVisualUnderstandingServiceClass_softClass_0;
  uint64_t v29 = getGDVUVisualUnderstandingServiceClass_softClass_0;
  if (!getGDVUVisualUnderstandingServiceClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v31 = (uint64_t)__getGDVUVisualUnderstandingServiceClass_block_invoke_0;
    v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E629B028;
    v33 = (void (*)(uint64_t))&v26;
    __getGDVUVisualUnderstandingServiceClass_block_invoke_0((uint64_t)&buf);
    id v10 = (void *)v27[3];
  }
  v11 = v10;
  _Block_object_dispose(&v26, 8);
  id v12 = [v11 alloc];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  objc_super v13 = (void *)getGDVUEntityRecognitionClientClass_softClass_0;
  uint64_t v29 = getGDVUEntityRecognitionClientClass_softClass_0;
  if (!getGDVUEntityRecognitionClientClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v31 = (uint64_t)__getGDVUEntityRecognitionClientClass_block_invoke_0;
    v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E629B028;
    v33 = (void (*)(uint64_t))&v26;
    __getGDVUEntityRecognitionClientClass_block_invoke_0((uint64_t)&buf);
    objc_super v13 = (void *)v27[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v26, 8);
  v15 = [v14 photos];
  storageURL = self->_storageURL;
  id v25 = 0;
  v17 = (GDVUVisualUnderstandingService *)[v12 initWithClient:v15 version:1 url:storageURL error:&v25];
  id v18 = v25;
  vuService = self->_vuService;
  self->_vuService = v17;

  if (self->_vuService)
  {

LABEL_12:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__57;
    v33 = __Block_byref_object_dispose__57;
    id v34 = 0;
    operationQueue = self->_operationQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__MADVUGalleryReader_queryKeyObservationsFor_limit_offset___block_invoke;
    v24[3] = &unk_1E629C890;
    v24[6] = a3;
    v24[7] = a4;
    v24[8] = a5;
    v24[4] = self;
    v24[5] = &buf;
    dispatch_sync(operationQueue, v24);
    id v21 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[MADVUGalleryReader] Failed to load Gallery - %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v21 = 0;
LABEL_13:
  return v21;
}

void __59__MADVUGalleryReader_queryKeyObservationsFor_limit_offset___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[6];
      uint64_t v4 = a1[7];
      uint64_t v5 = a1[8];
      int v12 = 134218496;
      uint64_t v13 = v3;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[MADVUGalleryHeader] Querying key observations for mdID: %ld, limit: %ld, offset: %ld", (uint8_t *)&v12, 0x20u);
    }
  }
  v6 = [*(id *)(a1[4] + 24) gallery];
  uint64_t v7 = [v6 keyObservationsFor:a1[6] limit:a1[7] offset:a1[8]];
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[6];
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "[MADVUGalleryHeader] Finished querying key observations for mdID: %ld", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)flush
{
}

void __27__MADVUGalleryReader_flush__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_INFO, "[MADVUGalleryReader] Flushing operation queue ", v1, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end