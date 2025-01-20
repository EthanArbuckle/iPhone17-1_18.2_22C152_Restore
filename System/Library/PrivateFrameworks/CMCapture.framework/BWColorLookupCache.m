@interface BWColorLookupCache
+ (void)initialize;
- (BWColorLookupCache)init;
- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubeFilter:(BWColorLookupCacheEntry *)result;
- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubesWithMaskFilter:(BWColorLookupCacheEntry *)result;
- (id)blackColorLookupTable;
- (id)colorLookupTablesForFilter:(id)a3;
- (id)fetchColorLookupTablesForFilter:(id)a3;
- (id)identityColorLookupTable;
- (id)interpolatedColorLookupTableFromTable:(id)a3 toTable:(id)a4 fractionComplete:(float)a5;
- (id)whiteColorLookupTable;
- (void)dealloc;
@end

@implementation BWColorLookupCache

id __49__BWColorLookupCache_colorLookupTablesForFilter___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __54__BWColorLookupCache_fetchColorLookupTablesForFilter___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

id __26__BWColorLookupCache_init__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

- (BWColorLookupCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BWColorLookupCache;
  v2 = [(BWColorLookupCache *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.bwgraph.color-lookup-cache", 0);
    v2->_coreImageCacheIsolationQueue = (OS_dispatch_queue *)v3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__BWColorLookupCache_init__block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = v2;
    dispatch_sync(v3, block);
  }
  return v2;
}

- (id)fetchColorLookupTablesForFilter:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [a3 name];
  NSClassFromString(&cfstr_Ciphotoeffect.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  NSClassFromString(&cfstr_Ciphotoeffect3_1.isa);
  char v7 = objc_opt_isKindOfClass();
  NSClassFromString(&cfstr_Ciportraiteffe_8.isa);
  if (objc_opt_isKindOfClass())
  {
    char v8 = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Ciportraiteffe_9.isa);
    char v8 = objc_opt_isKindOfClass();
  }
  NSClassFromString(&cfstr_Cicolorcubewit.isa);
  char v10 = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v11 = [a3 cubePath];
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v11 = [a3 cubePath];
    uint64_t v13 = [a3 backgroundCubePath];
LABEL_12:
    uint64_t v12 = v13;
LABEL_13:
    uint64_t v18 = 0;
    if (v11)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v11 options:2 error:&v18];
      if (!v12) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if (!v12)
      {
LABEL_18:
        if (v14 | v12)
        {
          v15 = [[BWColorLookupCacheEntry alloc] initWithForegroundColorLookupTable:v14 backgroundColorLookupTable:v12];
          coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __54__BWColorLookupCache_fetchColorLookupTablesForFilter___block_invoke;
          v17[3] = &unk_1E5C248A0;
          v17[4] = self;
          v17[5] = v15;
          v17[6] = v5;
          dispatch_sync(coreImageCacheIsolationQueue, v17);
        }
        else
        {
          v15 = 0;
        }
        return v15;
      }
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v12 options:2 error:&v18];
    goto LABEL_18;
  }
  if (v8)
  {
    uint64_t v11 = [a3 previewCubePath];
    uint64_t v13 = [a3 backgroundPreviewCubePath];
    goto LABEL_12;
  }
  if ((v10 & 1) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v12 = 0;
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  return -[BWColorLookupCache _colorLookupTablesForColorCubeFilter:]((BWColorLookupCacheEntry *)self, a3);
}

- (id)colorLookupTablesForFilter:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = __Block_byref_object_copy__30;
    uint64_t v14 = __Block_byref_object_dispose__30;
    uint64_t v15 = 0;
    NSClassFromString(&cfstr_Cicolorcubesmi.isa);
    int isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(&cfstr_Cicolorcubewit.isa);
    if ((objc_opt_isKindOfClass() | isKindOfClass))
    {
      if (isKindOfClass) {
        objc_super v6 = -[BWColorLookupCache _colorLookupTablesForColorCubesWithMaskFilter:]((BWColorLookupCacheEntry *)self, v3);
      }
      else {
        objc_super v6 = -[BWColorLookupCache _colorLookupTablesForColorCubeFilter:]((BWColorLookupCacheEntry *)self, v3);
      }
    }
    else
    {
      coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__BWColorLookupCache_colorLookupTablesForFilter___block_invoke;
      block[3] = &unk_1E5C27038;
      void block[5] = v3;
      block[6] = &v10;
      block[4] = self;
      dispatch_sync(coreImageCacheIsolationQueue, block);
      objc_super v6 = (BWColorLookupCacheEntry *)(id)v11[5];
    }
    id v3 = v6;
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

- (id)identityColorLookupTable
{
  if (identityColorLookupTable_onceToken != -1) {
    dispatch_once(&identityColorLookupTable_onceToken, &__block_literal_global_85);
  }
  return (id)identityColorLookupTable_identityColorLookupTable;
}

+ (void)initialize
{
}

- (void)dealloc
{
  coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BWColorLookupCache_dealloc__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(coreImageCacheIsolationQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)BWColorLookupCache;
  [(BWColorLookupCache *)&v4 dealloc];
}

void __29__BWColorLookupCache_dealloc__block_invoke(uint64_t a1)
{
}

- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubesWithMaskFilter:(BWColorLookupCacheEntry *)result
{
  if (result)
  {
    [a2 cubeDimension];
    if (v3 != 32.0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    objc_super v4 = -[BWColorLookupCacheEntry initWithForegroundColorLookupTable:backgroundColorLookupTable:]([BWColorLookupCacheEntry alloc], "initWithForegroundColorLookupTable:backgroundColorLookupTable:", [a2 cube0Data], objc_msgSend(a2, "cube1Data"));
    return v4;
  }
  return result;
}

- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubeFilter:(BWColorLookupCacheEntry *)result
{
  if (result)
  {
    [a2 cubeDimension];
    if (v3 != 32.0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    objc_super v4 = -[BWColorLookupCacheEntry initWithForegroundColorLookupTable:backgroundColorLookupTable:]([BWColorLookupCacheEntry alloc], "initWithForegroundColorLookupTable:backgroundColorLookupTable:", [a2 cubeData], 0);
    return v4;
  }
  return result;
}

uint64_t __46__BWColorLookupCache_identityColorLookupTable__block_invoke()
{
  v0 = (char *)malloc_type_malloc(0x20000uLL, 0x6E5A3F69uLL);
  uint64_t v1 = 0;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  float64x2_t v3 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
  __asm { FMOV            V19.2D, #31.0 }
  v9.i64[0] = 0x1000000010;
  v9.i64[1] = 0x1000000010;
  uint64_t v10 = v0;
  do
  {
    uint64_t v11 = 0;
    int8x16_t v12 = vdupq_n_s8(llround((double)(int)v1 * 255.0 / 31.0));
    uint64_t v13 = v10;
    do
    {
      uint64_t v14 = 0;
      int8x16_t v15 = vdupq_n_s8(llround((double)(int)v11 * 255.0 / 31.0));
      int32x4_t v16 = (int32x4_t)xmmword_1A5DBD230;
      int32x4_t v17 = (int32x4_t)xmmword_1A5F0C5A0;
      int32x4_t v18 = (int32x4_t)xmmword_1A5F0C5B0;
      int32x4_t v19 = (int32x4_t)xmmword_1A5F0CA50;
      do
      {
        v20.i64[0] = v16.i32[2];
        v20.i64[1] = v16.i32[3];
        float64x2_t v21 = vcvtq_f64_s64(v20);
        v20.i64[0] = v16.i32[0];
        v20.i64[1] = v16.i32[1];
        float64x2_t v22 = vcvtq_f64_s64(v20);
        v20.i64[0] = v17.i32[2];
        v20.i64[1] = v17.i32[3];
        float64x2_t v23 = vcvtq_f64_s64(v20);
        v20.i64[0] = v17.i32[0];
        v20.i64[1] = v17.i32[1];
        float64x2_t v24 = vcvtq_f64_s64(v20);
        v20.i64[0] = v18.i32[2];
        v20.i64[1] = v18.i32[3];
        float64x2_t v25 = vcvtq_f64_s64(v20);
        v20.i64[0] = v18.i32[0];
        v20.i64[1] = v18.i32[1];
        float64x2_t v26 = vcvtq_f64_s64(v20);
        v20.i64[0] = v19.i32[2];
        v20.i64[1] = v19.i32[3];
        float64x2_t v27 = vcvtq_f64_s64(v20);
        v20.i64[0] = v19.i32[0];
        v20.i64[1] = v19.i32[1];
        *(int16x4_t *)&v21.f64[0] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v22, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v21, v3), _Q19)))));
        *(int16x4_t *)&v21.f64[1] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v24, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v23, v3), _Q19)))));
        *(int16x4_t *)&v22.f64[0] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v26, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v25, v3), _Q19)))));
        *(int16x4_t *)&v22.f64[1] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(vcvtq_f64_s64(v20), v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v27, v3), _Q19)))));
        int8x16_t v28 = vuzp1q_s8((int8x16_t)v21, (int8x16_t)v22);
        v29 = &v13[v14];
        vst4q_s8(v29, *(int8x16x4_t *)(&v2 - 3));
        int32x4_t v16 = vaddq_s32(v16, v9);
        int32x4_t v17 = vaddq_s32(v17, v9);
        int32x4_t v18 = vaddq_s32(v18, v9);
        int32x4_t v19 = vaddq_s32(v19, v9);
        v14 += 64;
      }
      while (v14 != 128);
      ++v11;
      v13 += 128;
    }
    while (v11 != 32);
    ++v1;
    v10 += 4096;
  }
  while (v1 != 32);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v0 length:0x20000 freeWhenDone:1];
  identityColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)blackColorLookupTable
{
  if (blackColorLookupTable_onceToken != -1) {
    dispatch_once(&blackColorLookupTable_onceToken, &__block_literal_global_30);
  }
  return (id)blackColorLookupTable_identityColorLookupTable;
}

uint64_t __43__BWColorLookupCache_blackColorLookupTable__block_invoke()
{
  v0 = (char *)malloc_type_malloc(0x20000uLL, 0x93E8BCEuLL);
  uint64_t v1 = 0;
  *(void *)&long long v2 = 0xFF000000FF000000;
  *((void *)&v2 + 1) = 0xFF000000FF000000;
  float64x2_t v3 = v0;
  do
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      for (uint64_t i = 0; i != 128; i += 64)
      {
        char v7 = &v5[i];
        *((_OWORD *)v7 + 2) = v2;
        *((_OWORD *)v7 + 3) = v2;
        *(_OWORD *)char v7 = v2;
        *((_OWORD *)v7 + 1) = v2;
      }
      ++v4;
      v5 += 128;
    }
    while (v4 != 32);
    ++v1;
    v3 += 4096;
  }
  while (v1 != 32);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v0 length:0x20000 freeWhenDone:1];
  blackColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)whiteColorLookupTable
{
  if (whiteColorLookupTable_onceToken != -1) {
    dispatch_once(&whiteColorLookupTable_onceToken, &__block_literal_global_32_0);
  }
  return (id)whiteColorLookupTable_identityColorLookupTable;
}

uint64_t __43__BWColorLookupCache_whiteColorLookupTable__block_invoke()
{
  v0 = malloc_type_malloc(0x20000uLL, 0x511EF02BuLL);
  memset(v0, 255, 0x20000uLL);
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v0 length:0x20000 freeWhenDone:1];
  whiteColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)interpolatedColorLookupTableFromTable:(id)a3 toTable:(id)a4 fractionComplete:(float)a5
{
  if (!a3 || !a4) {
    return 0;
  }
  unint64_t v8 = (unint64_t)cbrt((double)((unint64_t)[a3 length] >> 2));
  if (v8 != (unint64_t)cbrt((double)((unint64_t)[a4 length] >> 2)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  int32x4_t v9 = (unsigned __int8 *)[a3 bytes];
  uint64_t v10 = (unsigned __int8 *)[a4 bytes];
  size_t v11 = 4 * v8 * v8 * v8;
  int8x16_t v12 = malloc_type_malloc(v11, 0xF60A403AuLL);
  uint64_t v13 = v12;
  *(float *)&double v14 = 1.0 - a5;
  if (a5 <= 1.0)
  {
    if (v11)
    {
      float64x2_t v21 = v12;
      uint64_t v22 = 4 * v8 * v8 * v8;
      do
      {
        unsigned int v24 = *v9++;
        unsigned int v23 = v24;
        unsigned int v25 = *v10++;
        *v21++ = llroundf((float)((float)v25 * a5) + (float)((float)v23 * *(float *)&v14));
        --v22;
      }
      while (v22);
    }
  }
  else if (v11)
  {
    int8x16_t v15 = v12;
    uint64_t v16 = 4 * v8 * v8 * v8;
    do
    {
      unsigned int v18 = *v10++;
      unsigned int v17 = v18;
      unsigned int v19 = *v9++;
      float v20 = roundf((float)((float)v17 * a5) + (float)((float)v19 * *(float *)&v14));
      if (v20 > 255.0) {
        float v20 = 255.0;
      }
      if (v20 < 0.0) {
        float v20 = 0.0;
      }
      *v15++ = (int)v20;
      --v16;
    }
    while (v16);
  }
  float64x2_t v26 = (void *)MEMORY[0x1E4F1C9B8];
  return (id)objc_msgSend(v26, "dataWithBytesNoCopy:length:freeWhenDone:", v13, v11, 1, v14);
}

@end