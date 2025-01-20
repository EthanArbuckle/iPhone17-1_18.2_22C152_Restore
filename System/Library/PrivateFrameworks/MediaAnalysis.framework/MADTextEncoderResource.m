@interface MADTextEncoderResource
+ (id)sharedResource;
+ (id)sharedResource:(int64_t)a3;
- (BOOL)supportsAgeTypePromptAdjustment;
- (CSUTextEncoder)textEncoder;
- (MADTextEncoderResource)init;
- (id)additionalLayerNames;
- (id)tokensForAgeType:(unsigned __int16)a3;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
- (void)purge;
@end

@implementation MADTextEncoderResource

+ (id)sharedResource
{
  v3 = +[VCPSharedInstanceManager sharedManager];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MADTextEncoderResource_sharedResource__block_invoke;
  v8[3] = &__block_descriptor_40_e5__8__0l;
  v8[4] = a1;
  v6 = [v3 sharedInstanceWithIdentifier:v5 andCreationBlock:v8];

  return v6;
}

id __40__MADTextEncoderResource_sharedResource__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  return v0;
}

+ (id)sharedResource:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      v3 = MADSystemSearchMD2TextEncoderResource;
      goto LABEL_13;
    case 2:
      v3 = MADSystemSearchMD3TextEncoderResource;
      goto LABEL_13;
    case 3:
    case 5:
    case 7:
      v3 = MADGenerativePlaygroundsMD1TextEncoderResource;
      goto LABEL_13;
    case 4:
      v3 = MADSystemSearchMD4TextEncoderResource;
      goto LABEL_13;
    case 6:
    case 8:
      v3 = MADGenerativePlaygroundsMD4TextEncoderResource;
      goto LABEL_13;
    case 9:
      v3 = MADSystemSearchMD5TextEncoderResource;
LABEL_13:
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
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "MADTextEncoderResource requested for unsupported revision (%d)", (uint8_t *)v8, 8u);
        }
      }
      v6 = 0;
      break;
  }
  return v6;
}

- (MADTextEncoderResource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADTextEncoderResource;
  v2 = [(MADTextEncoderResource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADTextEmbeddingResource", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
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
    return 10;
  }
  else {
    return 100;
  }
}

- (int64_t)revision
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (objc_class *)objc_opt_class();
      dispatch_queue_t v4 = NSStringFromClass(v3);
      int v6 = 138412290;
      objc_super v7 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "%@ needs to implement revision", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (int64_t)tokenEmbeddingType
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (objc_class *)objc_opt_class();
      dispatch_queue_t v4 = NSStringFromClass(v3);
      int v6 = 138412290;
      objc_super v7 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "%@ needs to implement tokenEmbeddingType", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (unint64_t)version
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (objc_class *)objc_opt_class();
      dispatch_queue_t v4 = NSStringFromClass(v3);
      int v6 = 138412290;
      objc_super v7 = v4;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "%@ needs to implement version", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (id)additionalLayerNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CSUTextEncoder)textEncoder
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__47;
  v10 = __Block_byref_object_dispose__47;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MADTextEncoderResource_textEncoder__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSUTextEncoder *)v3;
}

void __37__MADTextEncoderResource_textEncoder__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[2];
  if (v3) {
    goto LABEL_2;
  }
  uint64_t v7 = [v2 revision];
  if (v7)
  {
    id v21 = 0;
    uint64_t v8 = [MEMORY[0x1E4F5D0C8] createForRevision:v7 error:&v21];
    uint64_t v6 = v21;
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) additionalLayerNames];
      [v8 setAdditionalLayerNames:v9];

      v10 = VCPSignPostLog();
      os_signpost_id_t v11 = os_signpost_id_generate(v10);

      v12 = VCPSignPostLog();
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CSUTextEncoder_init", "", buf, 2u);
      }

      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F5D0C0]) initWithConfiguration:v8];
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 16);
      *(void *)(v15 + 16) = v14;

      v17 = VCPSignPostLog();
      v18 = v17;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v11, "CSUTextEncoder_init", "", buf, 2u);
      }

      if (*(void *)(*(void *)(a1 + 32) + 16))
      {

        id v3 = *(void **)(*(void *)(a1 + 32) + 16);
LABEL_2:
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
        id v5 = v3;
        uint64_t v6 = *(NSObject **)(v4 + 40);
        *(void *)(v4 + 40) = v5;
LABEL_3:

        return;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to create text encoder", buf, 2u);
        }
LABEL_24:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 description];
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to create text encoder configuration (%@)", buf, 0xCu);
      }
      goto LABEL_24;
    }

    goto LABEL_3;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Invalid text encoder configuration", buf, 2u);
    }
    goto LABEL_3;
  }
}

- (id)tokensForAgeType:(unsigned __int16)a3
{
  return 0;
}

- (BOOL)supportsAgeTypePromptAdjustment
{
  return 0;
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MADTextEncoderResource_purge__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __31__MADTextEncoderResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end