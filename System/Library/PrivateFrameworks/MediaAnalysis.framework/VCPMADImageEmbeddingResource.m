@interface VCPMADImageEmbeddingResource
+ (id)sharedResourceForRevision:(unint64_t)a3;
- (VCPImageBackboneAnalyzer)imageBackbone;
- (VCPMADImageEmbeddingResource)initWithRevision:(unint64_t)a3;
- (int64_t)activeCost;
- (int64_t)inactiveCost;
- (void)purge;
@end

@implementation VCPMADImageEmbeddingResource

- (VCPMADImageEmbeddingResource)initWithRevision:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VCPMADImageEmbeddingResource;
  v4 = [(VCPMADImageEmbeddingResource *)&v9 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("VCPMADImageEmbeddingResource", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v4->_version = a3;
  }
  return v4;
}

+ (id)sharedResourceForRevision:(unint64_t)a3
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  dispatch_queue_t v6 = NSStringFromClass(v5);
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v7 stringValue];
  objc_super v9 = [v4 stringWithFormat:@"%@_%@", v6, v8];

  v10 = +[VCPSharedInstanceManager sharedManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__VCPMADImageEmbeddingResource_sharedResourceForRevision___block_invoke;
  v13[3] = &__block_descriptor_40_e35___VCPMADImageEmbeddingResource_8__0l;
  v13[4] = a3;
  v11 = [v10 sharedInstanceWithIdentifier:v9 andCreationBlock:v13];

  return v11;
}

VCPMADImageEmbeddingResource *__58__VCPMADImageEmbeddingResource_sharedResourceForRevision___block_invoke(uint64_t a1)
{
  v1 = [[VCPMADImageEmbeddingResource alloc] initWithRevision:*(void *)(a1 + 32)];
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

- (VCPImageBackboneAnalyzer)imageBackbone
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__VCPMADImageEmbeddingResource_imageBackbone__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (VCPImageBackboneAnalyzer *)v3;
}

void __45__VCPMADImageEmbeddingResource_imageBackbone__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (DeviceGeqD5x())
    {
      v2 = VCPSignPostLog();
      os_signpost_id_t v3 = os_signpost_id_generate(v2);

      v4 = VCPSignPostLog();
      v5 = v4;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v15[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPImageBackbone_init", "", (uint8_t *)v15, 2u);
      }

      unint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24) - 2;
      if (v6 > 2)
      {
        v7 = 0;
      }
      else
      {
        v7 = (void *)qword_1E6298E60[v6];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v8 = VCPLogInstance();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v9 = [v7 intValue];
            v15[0] = 67109120;
            v15[1] = v9;
            _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "ImageEmbeddingTask set VCPImageBackboneAnalyzer revision %d", (uint8_t *)v15, 8u);
          }
        }
      }
      id v11 = [[VCPImageBackboneAnalyzer alloc] initWithRequestedAnalyses:0x1000000000000 andRevision:v7 useSharedModel:0];
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 16);
      *(void *)(v12 + 16) = v11;

      v14 = VCPSignPostLog();
      v10 = v14;
      if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
      {
        LOWORD(v15[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v3, "VCPImageBackbone_init", "", (uint8_t *)v15, 2u);
      }
LABEL_18:

      goto LABEL_19;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "ImageEmbeddingTask not supported on this device, requires devices >=D5x", (uint8_t *)v15, 2u);
      }
      goto LABEL_18;
    }
  }
LABEL_19:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
}

- (void)purge
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCPMADImageEmbeddingResource_purge__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__VCPMADImageEmbeddingResource_purge__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackbone, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end