@interface FigLearnedMattingMetalStage
- (FigLearnedMattingMetalStage)init;
- (FigLearnedMattingMetalStage)initWithMetalContext:(id)a3;
- (id)_runKernel:(void *)a3 sourceTexture:(void *)a4 destinationTexture:(long long *)a5 gridSize:(void *)a6 setParamsBlock:;
- (id)_textureFromPixelBuffer:(uint64_t)a3 usage:;
- (int)clearBuffer:(__CVBuffer *)a3;
- (int)createTileFrom:(FigLearnedMattingMetalStage *)self to:(SEL)a2 withStart:(__CVBuffer *)a3 withScale:(__CVBuffer *)a4 outCommandBuffer:(id *)a5;
- (int)createTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id)a5 commandBuffer:;
- (int)pasteTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id *)a5 withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:;
- (uint64_t)_compileShaders;
- (void)dealloc;
- (void)finishProcessing;
@end

@implementation FigLearnedMattingMetalStage

- (FigLearnedMattingMetalStage)initWithMetalContext:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FigLearnedMattingMetalStage;
  v6 = [(FigLearnedMattingMetalStage *)&v16 init];
  uint64_t v7 = (uint64_t)v6;
  if (!v6) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (!*(void *)(v7 + 8))
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v8 andOptionalCommandQueue:0];
    v10 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v9;

    if (!*(void *)(v7 + 8)) {
      goto LABEL_8;
    }
  }
  if (-[FigLearnedMattingMetalStage _compileShaders](v7)) {
    goto LABEL_8;
  }
  uint64_t v17 = *MEMORY[0x1E4F24C78];
  v18[0] = &unk_1EFAFE178;
  CFDictionaryRef v11 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v13 = [*(id *)(v7 + 8) device];
  LODWORD(v11) = CVMetalTextureCacheCreate(v12, v11, v13, 0, (CVMetalTextureCacheRef *)(v7 + 40));

  if (v11)
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = 0;
  }
  else
  {
LABEL_6:
    v14 = (FigLearnedMattingMetalStage *)(id)v7;
  }

  return v14;
}

- (uint64_t)_compileShaders
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"clearTexture" constants:0];
  v3 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v2;

  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"createTileWithScale" constants:0];
    id v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v4;

    if (*(void *)(a1 + 16))
    {
      uint64_t v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"pasteTile" constants:0];
      uint64_t v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      if (*(void *)(a1 + 24)) {
        return 0;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (FigLearnedMattingMetalStage)init
{
  return [(FigLearnedMattingMetalStage *)self initWithMetalContext:0];
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigLearnedMattingMetalStage;
  [(FigLearnedMattingMetalStage *)&v4 dealloc];
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  if (a3
    && (-[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 2),
        (objc_super v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v4 width];
    uint64_t v7 = [v5 height];
    clearTextureKernel = self->_clearTextureKernel;
    *(void *)&long long v11 = v6;
    *((void *)&v11 + 1) = v7;
    uint64_t v12 = 1;
    uint64_t v9 = -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, clearTextureKernel, v5, 0, &v11, 0);
    [v9 commit];

    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)_textureFromPixelBuffer:(uint64_t)a3 usage:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_6;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  switch(PixelFormatType)
  {
    case 0x42475241u:
      MTLPixelFormat v7 = MTLPixelFormatBGRA8Unorm;
      break;
    case 0x4C303068u:
      MTLPixelFormat v7 = MTLPixelFormatR16Float;
      break;
    case 0x4C303038u:
      MTLPixelFormat v7 = MTLPixelFormatR8Unorm;
      break;
    default:
LABEL_6:
      v8 = 0;
      goto LABEL_14;
  }
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  uint64_t v17 = *MEMORY[0x1E4F24C88];
  long long v11 = [NSNumber numberWithUnsignedInteger:a3];
  v18[0] = v11;
  CFDictionaryRef v12 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

  CVMetalTextureRef image = 0;
  CVReturn v13 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CVMetalTextureCacheRef *)(a1 + 40), pixelBuffer, v12, v7, WidthOfPlane, HeightOfPlane, 0, &image);
  v8 = 0;
  if (v13) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = image == 0;
  }
  if (!v14)
  {
    v8 = CVMetalTextureGetTexture(image);
    CFRelease(image);
  }
LABEL_14:
  return v8;
}

- (id)_runKernel:(void *)a3 sourceTexture:(void *)a4 destinationTexture:(long long *)a5 gridSize:(void *)a6 setParamsBlock:
{
  id v11 = a2;
  id v12 = a4;
  CVReturn v13 = a6;
  if (a1)
  {
    BOOL v14 = *(void **)(a1 + 8);
    id v15 = a3;
    objc_super v16 = [v14 commandQueue];
    uint64_t v17 = [v16 commandBuffer];

    v18 = [NSString stringWithFormat:@"_runKernel_%@", v11];
    [v17 setLabel:v18];

    v19 = [v17 computeCommandEncoder];
    [v19 setComputePipelineState:v11];
    [v19 setTexture:v15 atIndex:0];

    if (v12) {
      [v19 setTexture:v12 atIndex:1];
    }
    if (v13) {
      v13[2](v13, v19);
    }
    v23[0] = [v11 threadExecutionWidth];
    v23[1] = (unint64_t)[v11 maxTotalThreadsPerThreadgroup] / v23[0];
    v23[2] = 1;
    long long v21 = *a5;
    uint64_t v22 = *((void *)a5 + 2);
    [v19 dispatchThreads:&v21 threadsPerThreadgroup:v23];
    [v19 endEncoding];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (int)createTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id)a5 commandBuffer:
{
  unsigned int v6 = a5;
  id v10 = v5;
  if (!a3
    || !a4
    || (-[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1),
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_7;
  }
  id v12 = (void *)v11;
  CVReturn v13 = -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a4, 2);
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
LABEL_11:

    goto LABEL_7;
  }
  BOOL v14 = v13;
  uint64_t v15 = [v13 width];
  uint64_t v16 = [v14 height];
  uint64_t v17 = [v10 blitCommandEncoder];
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();

    goto LABEL_11;
  }
  v18 = v17;
  memset(v23, 0, sizeof(v23));
  v22[0] = (unsigned __int16)v6;
  v22[1] = HIWORD(v6);
  v22[2] = 0;
  v21[0] = v15;
  v21[1] = v16;
  v21[2] = 1;
  [v17 copyFromTexture:v12 sourceSlice:0 sourceLevel:0 sourceOrigin:v22 sourceSize:v21 toTexture:v14 destinationSlice:0 destinationLevel:0 destinationOrigin:v23];
  [v18 endEncoding];

  int v19 = 0;
LABEL_7:

  return v19;
}

- (int)createTileFrom:(FigLearnedMattingMetalStage *)self to:(SEL)a2 withStart:(__CVBuffer *)a3 withScale:(__CVBuffer *)a4 outCommandBuffer:(id *)a5
{
  if (!a3) {
    goto LABEL_13;
  }
  MTLPixelFormat v7 = a4;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
LABEL_14:
    id v12 = 0;
LABEL_17:
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  if (!a5)
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    MTLPixelFormat v7 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  id v12 = -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1);
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    MTLPixelFormat v7 = 0;
    goto LABEL_17;
  }
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, v7, 2);
  CVReturn v13 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  MTLPixelFormat v7 = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v14 = [(__CVBuffer *)v13 width];
  uint64_t v15 = [(__CVBuffer *)v7 height];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__FigLearnedMattingMetalStage_createTileFrom_to_withStart_withScale_outCommandBuffer___block_invoke;
  aBlock[3] = &__block_descriptor_48_e36_v16__0___MTLComputeCommandEncoder__8l;
  aBlock[4] = v10;
  aBlock[5] = v9;
  uint64_t v16 = _Block_copy(aBlock);
  createTileWithScaleKernel = self->_createTileWithScaleKernel;
  *(void *)&long long v22 = v14;
  *((void *)&v22 + 1) = v15;
  uint64_t v23 = 1;
  v18 = -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, createTileWithScaleKernel, v12, v7, &v22, v16);
  if (!v18)
  {
    int v20 = 0;
LABEL_9:
    id v19 = 0;
    goto LABEL_10;
  }
  id v19 = v18;
  int v20 = 0;
  *a5 = v19;
LABEL_10:

  return v20;
}

void __86__FigLearnedMattingMetalStage_createTileFrom_to_withStart_withScale_outCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 32;
  id v4 = a2;
  [v4 setBytes:v3 length:8 atIndex:0];
  [v4 setBytes:a1 + 40 length:8 atIndex:1];
}

- (int)pasteTileFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 withStart:(id *)a5 withNoOverlapStart:withNoOverlapEnd:outCommandBuffer:
{
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v8 = 0;
LABEL_11:
    uint64_t v14 = 0;
LABEL_14:
    uint64_t v17 = 0;
    id v20 = 0;
    goto LABEL_8;
  }
  v8 = a4;
  if (!a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v9 = v7;
  int v10 = v6;
  int v11 = v5;
  int v12 = (int)a5;
  uint64_t v14 = -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, a3, 1);
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v8 = 0;
    goto LABEL_14;
  }
  -[FigLearnedMattingMetalStage _textureFromPixelBuffer:usage:]((uint64_t)self, v8, 2);
  v8 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    goto LABEL_14;
  }
  uint64_t v15 = [v14 width];
  uint64_t v16 = [v14 height];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__FigLearnedMattingMetalStage_pasteTileFrom_to_withStart_withNoOverlapStart_withNoOverlapEnd_outCommandBuffer___block_invoke;
  aBlock[3] = &__block_descriptor_44_e36_v16__0___MTLComputeCommandEncoder__8l;
  int v26 = v12;
  int v27 = v11;
  int v28 = v10;
  uint64_t v17 = _Block_copy(aBlock);
  pasteTileKernel = self->_pasteTileKernel;
  *(void *)&long long v23 = v15;
  *((void *)&v23 + 1) = v16;
  uint64_t v24 = 1;
  id v19 = -[FigLearnedMattingMetalStage _runKernel:sourceTexture:destinationTexture:gridSize:setParamsBlock:]((uint64_t)self, pasteTileKernel, v14, v8, &v23, v17);
  id v20 = v19;
  int v21 = 0;
  if (v9 && v19)
  {
    id v20 = v19;
    int v21 = 0;
    *uint64_t v9 = v20;
  }
LABEL_8:

  return v21;
}

void __111__FigLearnedMattingMetalStage_pasteTileFrom_to_withStart_withNoOverlapStart_withNoOverlapEnd_outCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 32;
  id v4 = a2;
  [v4 setBytes:v3 length:4 atIndex:0];
  [v4 setBytes:a1 + 36 length:4 atIndex:1];
  [v4 setBytes:a1 + 40 length:4 atIndex:2];
}

- (void)finishProcessing
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CVMetalTextureCacheFlush(textureCache, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearTextureKernel, 0);
  objc_storeStrong((id *)&self->_pasteTileKernel, 0);
  objc_storeStrong((id *)&self->_createTileWithScaleKernel, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end