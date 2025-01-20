@interface VCPMADImageCaptionResource
+ (id)sharedResourceForModelType:(int64_t)a3 safetyType:(int64_t)a4;
- (VCPImageCaptionAnalyzer)imageCaptionAnalyzer;
- (VCPMADImageCaptionResource)initWithModelType:(int64_t)a3 safetyType:(int64_t)a4;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation VCPMADImageCaptionResource

- (VCPMADImageCaptionResource)initWithModelType:(int64_t)a3 safetyType:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VCPMADImageCaptionResource;
  v6 = [(VCPMADImageCaptionResource *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("VCPMADImageCaptionResource", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v6->_modelType = a3;
    v6->_safetyType = a4;
  }
  return v6;
}

+ (id)sharedResourceForModelType:(int64_t)a3 safetyType:(int64_t)a4
{
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  dispatch_queue_t v8 = NSStringFromClass(v7);
  v9 = [NSNumber numberWithInteger:a3];
  v10 = [v9 stringValue];
  objc_super v11 = [v6 stringWithFormat:@"%@_%@", v8, v10];

  v12 = +[VCPSharedInstanceManager sharedManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__VCPMADImageCaptionResource_sharedResourceForModelType_safetyType___block_invoke;
  v15[3] = &__block_descriptor_48_e33___VCPMADImageCaptionResource_8__0l;
  v15[4] = a3;
  v15[5] = a4;
  v13 = [v12 sharedInstanceWithIdentifier:v11 andCreationBlock:v15];

  return v13;
}

VCPMADImageCaptionResource *__68__VCPMADImageCaptionResource_sharedResourceForModelType_safetyType___block_invoke(uint64_t a1)
{
  v1 = [[VCPMADImageCaptionResource alloc] initWithModelType:*(void *)(a1 + 32) safetyType:*(void *)(a1 + 40)];
  return v1;
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

- (VCPImageCaptionAnalyzer)imageCaptionAnalyzer
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__VCPMADImageCaptionResource_imageCaptionAnalyzer__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VCPImageCaptionAnalyzer *)v3;
}

void __50__VCPMADImageCaptionResource_imageCaptionAnalyzer__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = VCPSignPostLog();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    v5 = VCPSignPostLog();
    uint64_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v16[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPImageCaptionAnalyzer_init", "", (uint8_t *)v16, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(v8 + 24);
        uint64_t v10 = *(void *)(v8 + 32);
        v16[0] = 67109376;
        v16[1] = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "ImageCaptionTask set VCPImageCaptionAnalyzer model type %d, safety type %d", (uint8_t *)v16, 0xEu);
      }
    }
    id v11 = [[VCPImageCaptionAnalyzer alloc] initWithCaptionModelType:*(void *)(*(void *)(a1 + 32) + 24) captionSafetyType:*(void *)(*(void *)(a1 + 32) + 32) useSharedModel:0];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;

    v14 = VCPSignPostLog();
    v15 = v14;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v16[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v4, "VCPImageCaptionAnalyzer_init", "", (uint8_t *)v16, 2u);
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCPMADImageCaptionResource_purge__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __35__VCPMADImageCaptionResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptionAnalyzer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end