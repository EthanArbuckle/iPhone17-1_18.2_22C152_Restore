@interface MADTextEmbeddingResource
+ (id)sharedResource:(unint64_t)a3;
+ (int64_t)revision;
- (CSUTextEncoder)textEncoder;
- (MADTextEmbeddingResource)init;
- (MADTextEmbeddingSafety)safety;
- (MADTextEmbeddingThreshold)calibration;
- (VUWGallery)entityGallery;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (int64_t)tokenEmbeddingType;
- (unint64_t)calibrationVersion;
- (unint64_t)version;
- (void)purge;
@end

@implementation MADTextEmbeddingResource

- (MADTextEmbeddingResource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingResource;
  v2 = [(MADTextEmbeddingResource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADTextEmbeddingResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedResource:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
      v3 = MADTextEmbeddingMD1Resource;
      goto LABEL_12;
    case 2uLL:
      v3 = MADTextEmbeddingMD2Resource;
      goto LABEL_12;
    case 3uLL:
      v3 = MADTextEmbeddingMD3Resource;
      goto LABEL_12;
    case 4uLL:
      v3 = MADTextEmbeddingMD4Resource;
      goto LABEL_12;
    case 5uLL:
      v3 = MADTextEmbeddingMD5Resource;
LABEL_12:
      v6 = [(__objc2_class *)v3 sharedResource];
      break;
    default:
      int v4 = a3;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 67109120;
          v8[1] = v4;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Unsupported text encoder version (%d) requested", (uint8_t *)v8, 8u);
        }
      }
      v6 = 0;
      break;
  }
  return v6;
}

- (int64_t)activeCost
{
  if (DeviceHasANE()) {
    return 10;
  }
  else {
    return 100;
  }
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE()) {
    return 5;
  }
  else {
    return 100;
  }
}

- (unint64_t)version
{
  return 0;
}

+ (int64_t)revision
{
  return 0;
}

- (CSUTextEncoder)textEncoder
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MADTextEmbeddingResource_textEncoder__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSUTextEncoder *)v3;
}

void __39__MADTextEmbeddingResource_textEncoder__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v16 = 0;
    id v3 = objc_msgSend(MEMORY[0x1E4F5D0C8], "createForRevision:error:", objc_msgSend((id)objc_opt_class(), "revision"), &v16);
    id v4 = v16;
    if (v3)
    {
      v5 = VCPSignPostLog();
      os_signpost_id_t v6 = os_signpost_id_generate(v5);

      objc_super v7 = VCPSignPostLog();
      uint64_t v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUTextEncoder_init", "", buf, 2u);
      }

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F5D0C0]) initWithConfiguration:v3];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 16);
      *(void *)(v10 + 16) = v9;

      v12 = VCPSignPostLog();
      v13 = v12;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v6, "CSUTextEncoder_init", "", buf, 2u);
      }

      if (*(void *)(*(void *)(a1 + 32) + 16) || (int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_17;
      }
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to create text encoder", buf, 2u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_17:

        v2 = *(void **)(*(void *)(a1 + 32) + 16);
        goto LABEL_18;
      }
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v4 description];
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to create text encoder configuration (%@)", buf, 0xCu);
      }
    }

    goto LABEL_17;
  }
LABEL_18:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (VUWGallery)entityGallery
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MADTextEmbeddingResource_entityGallery__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VUWGallery *)v3;
}

void __41__MADTextEmbeddingResource_entityGallery__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
LABEL_15:
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id v21 = v2;
    id v3 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
    goto LABEL_16;
  }
  id v3 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultPhotoLibrary");
  id v4 = objc_msgSend(v3, "vcp_visionCacheStorageDirectoryURL");
  v5 = [v4 URLByAppendingPathComponent:@"VUIndex.sqlite"];
  if (v5)
  {
    uint64_t v6 = VCPSignPostLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    uint64_t v8 = VCPSignPostLog();
    uint64_t v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VUWGallery_initWithPath", "", buf, 2u);
    }

    id v26 = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB4238]) initWithPath:v5 error:&v26];
    id v11 = v26;
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v10;

    v14 = VCPSignPostLog();
    v15 = v14;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v7, "VUWGallery_initWithPath", "", buf, 2u);
    }

    if (!*(void *)(*(void *)(a1 + 32) + 24) && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        uint64_t v19 = [v11 description];
        *(_DWORD *)buf = 138412546;
        v28 = v18;
        __int16 v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to create %@ (%@)", buf, 0x16u);
      }
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v22 = VCPLogInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v3 photoLibraryURL];
      *(_DWORD *)buf = 138412546;
      v28 = v24;
      __int16 v29 = 2112;
      v30 = v25;
      _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "Failed to create %@: no VUIndex URL for library %@", buf, 0x16u);
    }
  }

LABEL_16:
}

- (MADTextEmbeddingThreshold)calibration
{
  uint64_t v6 = 0;
  os_signpost_id_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MADTextEmbeddingResource_calibration__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MADTextEmbeddingThreshold *)v3;
}

void __39__MADTextEmbeddingResource_calibration__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = [*(id *)(a1 + 32) version];
        v14[0] = 67109120;
        v14[1] = v3;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Creating calibration model (MD%d)", (uint8_t *)v14, 8u);
      }
    }
    id v4 = VCPSignPostLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    uint64_t v6 = VCPSignPostLog();
    os_signpost_id_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADTextEmbeddingThreshold_create", "", (uint8_t *)v14, 2u);
    }

    uint64_t v8 = +[MADTextEmbeddingThreshold createForEmbeddingVersion:](MADTextEmbeddingThreshold, "createForEmbeddingVersion:", [*(id *)(a1 + 32) version]);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    id v11 = VCPSignPostLog();
    uint64_t v12 = v11;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_END, v5, "MADTextEmbeddingThreshold_create", "", (uint8_t *)v14, 2u);
    }

    if (!*(void *)(*(void *)(a1 + 32) + 32) && (int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to create embedding calibration", (uint8_t *)v14, 2u);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
}

- (unint64_t)calibrationVersion
{
  return 0;
}

- (int64_t)tokenEmbeddingType
{
  return 2;
}

- (MADTextEmbeddingSafety)safety
{
  uint64_t v6 = 0;
  os_signpost_id_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MADTextEmbeddingResource_safety__block_invoke;
  v5[3] = &unk_1E6296FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MADTextEmbeddingSafety *)v3;
}

void __34__MADTextEmbeddingResource_safety__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = [*(id *)(a1 + 32) version];
        v14[0] = 67109120;
        v14[1] = v3;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Creating safety model (MD%d)", (uint8_t *)v14, 8u);
      }
    }
    id v4 = VCPSignPostLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    uint64_t v6 = VCPSignPostLog();
    os_signpost_id_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADTextEmbeddingSafety_create", "", (uint8_t *)v14, 2u);
    }

    uint64_t v8 = +[MADTextEmbeddingSafety createForEmbeddingVersion:](MADTextEmbeddingSafety, "createForEmbeddingVersion:", [*(id *)(a1 + 32) version]);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = VCPSignPostLog();
    uint64_t v12 = v11;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_END, v5, "MADTextEmbeddingSafety_create", "", (uint8_t *)v14, 2u);
    }

    if (!*(void *)(*(void *)(a1 + 32) + 40) && (int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to create embedding safety", (uint8_t *)v14, 2u);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MADTextEmbeddingResource_purge__block_invoke;
  block[3] = &unk_1E6296FD0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __33__MADTextEmbeddingResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  os_signpost_id_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  os_signpost_id_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safety, 0);
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_entityGallery, 0);
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end