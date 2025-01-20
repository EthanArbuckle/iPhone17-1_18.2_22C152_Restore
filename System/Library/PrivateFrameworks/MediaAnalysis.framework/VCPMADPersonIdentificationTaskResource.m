@interface VCPMADPersonIdentificationTaskResource
+ (id)sharedResource;
- (VCPMADPersonIdentificationTaskResource)init;
- (id)faceProcessingContext;
- (id)personIdentityModel;
- (id)photoLibrary;
- (id)vuService;
- (void)_loadResources;
- (void)purge;
@end

@implementation VCPMADPersonIdentificationTaskResource

- (VCPMADPersonIdentificationTaskResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPMADPersonIdentificationTaskResource;
  v2 = [(VCPMADVisionResource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VCPMADPersonIdentificationTaskResource", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  dispatch_queue_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_42];

  return v5;
}

VCPMADPersonIdentificationTaskResource *__56__VCPMADPersonIdentificationTaskResource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(VCPMADPersonIdentificationTaskResource);
  return v0;
}

- (void)_loadResources
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = +[VCPDefaultPhotoLibraryManager sharedManager];
  v4 = [v3 defaultPhotoLibrary];
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v4;

  BOOL v6 = [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery];
  faceProcessingContext = self->_faceProcessingContext;
  if (v6)
  {
    if (!faceProcessingContext) {
      goto LABEL_7;
    }
    uint64_t v8 = 56;
  }
  else
  {
    if (!faceProcessingContext) {
      goto LABEL_7;
    }
    uint64_t v8 = 40;
  }
  if (*(Class *)((char *)&self->super.super.super.isa + v8)) {
    return;
  }
LABEL_7:
  v9 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:self->_photoLibrary];
  v10 = self->_faceProcessingContext;
  self->_faceProcessingContext = v9;

  if (![(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery])
  {
    v26 = VCPSignPostLog();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    v28 = VCPSignPostLog();
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PersonIdentityModel_init", "", (uint8_t *)&buf, 2u);
    }

    v11 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:0];
    v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v31 = [v30 fileExistsAtPath:v11];

    if (v31)
    {
      id v41 = 0;
      v32 = +[VCPFaceIDModel loadVIPModelAtPath:v11 withVIPType:0 error:&v41];
      v33 = v41;
      personIdentityModel = self->_personIdentityModel;
      self->_personIdentityModel = v32;

      v35 = self->_personIdentityModel;
      if (v35)
      {
        v36 = [(VNPersonsModel *)v35 configuration];
        uint64_t v37 = [v36 faceprintRequestRevision];

        if (v37 == 3737841669) {
          uint64_t v38 = 15;
        }
        else {
          uint64_t v38 = 11;
        }
        [(VCPPhotosFaceProcessingContext *)self->_faceProcessingContext setProcessingVersion:v38];
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v39 = VCPLogInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "Cannot load Person Identity Model - %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 5)
      {
LABEL_42:
        v40 = VCPSignPostLog();
        v19 = v40;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_END, v27, "PersonIdentityModel_init", "", (uint8_t *)&buf, 2u);
        }
        goto LABEL_45;
      }
      v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "Person Identity Model not exist - %@", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_42;
  }
  v11 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  v12 = (void *)getGDVUVisualUnderstandingServiceClass(void)::softClass;
  uint64_t v46 = getGDVUVisualUnderstandingServiceClass(void)::softClass;
  if (!getGDVUVisualUnderstandingServiceClass(void)::softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v48 = ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke;
    v49 = &unk_1E62970F8;
    v50 = &v43;
    ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke((uint64_t)&buf);
    v12 = (void *)v44[3];
  }
  v13 = v12;
  _Block_object_dispose(&v43, 8);
  id v14 = [v13 alloc];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  v15 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
  uint64_t v46 = getGDVUEntityRecognitionClientClass(void)::softClass;
  if (!getGDVUEntityRecognitionClientClass(void)::softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v48 = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_0;
    v49 = &unk_1E62970F8;
    v50 = &v43;
    ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_0((uint64_t)&buf);
    v15 = (void *)v44[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v43, 8);
  v17 = [v16 photos];
  id v42 = 0;
  v18 = (GDVUVisualUnderstandingService *)[v14 initWithClient:v17 version:1 url:v11 error:&v42];
  v19 = v42;
  vuService = self->_vuService;
  self->_vuService = v18;

  if (!self->_vuService && (int)MediaAnalysisLogLevel() >= 3)
  {
    v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Failed to create MADGDVisualUnderstandingService instance - %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v22 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
  uint64_t v23 = [v22 faceprintRevision];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v24 = VCPLogInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "Gallery uses faceprint with revision %ld", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v23 == 3737841669) {
    uint64_t v25 = 15;
  }
  else {
    uint64_t v25 = 11;
  }
  [(VCPPhotosFaceProcessingContext *)self->_faceProcessingContext setProcessingVersion:v25];
LABEL_45:
}

- (id)personIdentityModel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__VCPMADPersonIdentificationTaskResource_personIdentityModel__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__VCPMADPersonIdentificationTaskResource_personIdentityModel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadResources];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (id)vuService
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VCPMADPersonIdentificationTaskResource_vuService__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__VCPMADPersonIdentificationTaskResource_vuService__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadResources];
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (id)faceProcessingContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__VCPMADPersonIdentificationTaskResource_faceProcessingContext__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__VCPMADPersonIdentificationTaskResource_faceProcessingContext__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadResources];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (id)photoLibrary
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__VCPMADPersonIdentificationTaskResource_photoLibrary__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__VCPMADPersonIdentificationTaskResource_photoLibrary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadResources];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCPMADPersonIdentificationTaskResource_purge__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

id __47__VCPMADPersonIdentificationTaskResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = 0;

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VCPMADPersonIdentificationTaskResource;
  return objc_msgSendSuper2(&v11, sel_purge);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_personIdentityModel, 0);
  objc_storeStrong((id *)&self->_faceProcessingContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end