@interface PKMetalRenderer
- (BOOL)generateBSplineInComputeForStroke:(uint64_t)a1;
- (BOOL)setViewScissor:(CGFloat)a3;
- (BOOL)setupAlphaBlendingForAlphaBlendFactor:(void *)a1 renderEncoder:(double)a2;
- (BOOL)shouldRenderDebugColorForStroke:(uint64_t)a1;
- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3;
- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3 framebuffer:(CGFloat)a4;
- (CGImageRef)newSixChannelMultiplyCGImageWithClipRect:(CGFloat)a3;
- (PKMetalStrokeRenderCache)generateCacheForStroke:(unint64_t)a3 points:(unint64_t)a4 segmentSteps:(void *)a5;
- (__n128)setCombineStrokesAllowed:(uint64_t)a1;
- (double)alphaForStroke:(uint64_t)a1;
- (double)antialiasingThresholdForStroke:(uint64_t)a1;
- (double)calculateSourceRectForTile:(_OWORD *)a3 tileTransform:(CGFloat *)a4 destinationRectOut:;
- (double)dirtyClipRectForAnimatingStrokeVertices:(uint64_t)a1 newSize:(unint64_t)a2;
- (double)updateActualSize:(double)a3 pixelSize:(double)a4;
- (float)clipRectForVertices:(float *)result numVertices:(uint64_t)a2 vertexSize:(uint64_t)a3;
- (id).cxx_construct;
- (id)blitShader;
- (id)colorForStroke:(uint64_t)a1;
- (id)generateParticleCacheForStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(int)a6 secondaryParticles:(int)a7;
- (id)initWithDrawingPixelSize:(void *)a3 actualSize:(void *)a4 device:resourceHandler:sixChannelBlendingMode:pixelFormat:;
- (id)renderCacheItemForStroke:(uint64_t)a3 bsplineFilter:(void *)a4 purgeableResources:(void *)a5 strokeRenderCache:;
- (id)renderCommandEncoderForCommandBuffer:(id *)a3 renderStateConfig:(void *)a4 renderState:;
- (uint64_t)_renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6;
- (uint64_t)applyStrokeSpaceClipRect:(double)a3 strokeTransform:(double)a4;
- (uint64_t)clearAndRenderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(CGFloat)a5 stopBlock:(CGFloat)a6;
- (uint64_t)ensureOriginalBackFramebufferHasContents;
- (uint64_t)renderParticleRenderCache:(void *)a3 renderEncoder:(void *)a4 computeEncoder:(id *)a5 animatingStroke:(int)a6 secondaryParticles:;
- (uint64_t)renderParticleStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(char)a6 secondaryParticles:(int)a7 renderEncoder:(void *)a8;
- (uint64_t)renderPenStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5;
- (uint64_t)renderSDFPenStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5;
- (uint64_t)renderStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5 computeEncoder:(void *)a6 renderCache:(void *)a7;
- (uint64_t)renderStrokeRenderCache:(void *)a3 renderEncoder:(uint64_t)a4 animatingStroke:(int)a5 indexed:;
- (uint64_t)renderStrokeRenderCacheBuffers:(void *)a3 renderEncoder:(_anonymous_namespace_:(int)a5 :AnimatingStroke *)a4 animatingStroke:indexed:;
- (uint64_t)renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6;
- (uint64_t)renderStrokes:(void *)a3 stopBlock:;
- (uint64_t)renderVerticies:(unint64_t)a3 size:(uint64_t)a4 numRenderedVertices:(void *)a5 vertexSize:(uint64_t)a6 numIndices:(uint64_t)a7 localClipRect:(char)a8 animatingStroke:(CGFloat)a9 secondaryParticles:(CGFloat)a10 renderEncoder:(CGFloat)a11;
- (uint64_t)renderZoomFactorForStroke:(uint64_t)a1;
- (uint64_t)setupClippingForStrokeClipRect:(CGFloat *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 outNewClipRect:(CGFloat)a6;
- (unint64_t)fadeOutLimitFromPoints:(uint64_t)a3 animatingStroke:;
- (void)addBufferForRenderCache:(uint64_t)a3 strokeVertices:(unint64_t)a4 numVertices:(void *)a5 vertexSize:(char)a6 bounds:(void *)a7 secondaryParticles:(double)a8 renderEncoder:(double)a9;
- (void)addStrokeSpaceDrawableDirtyRect:(double)a3;
- (void)buildRenderCacheForStrokes:(uint64_t)a1;
- (void)clearFramebuffer:(uint64_t)a1 waitUntilCompleted:(void *)a2;
- (void)clearNowWithStrokeSpaceClipRect:(CGFloat)a3 strokeTransform:(CGFloat)a4;
- (void)clearTile:(uint64_t)a1 waitUntilCompleted:(void *)a2;
- (void)copyFromFramebuffer:(uint64_t)a3 toFramebuffer:(CGFloat)a4 clipRect:(CGFloat)a5 renderEncoder:(CGFloat)a6 paintIndex:(CGFloat)a7 alphaBlendFactor:(double)a8;
- (void)copyIntoPaintFromTexture:(void *)a3 clipRect:(uint64_t)a4 renderEncoder:(CGFloat)a5 paintIndex:(CGFloat)a6 alphaBlendFactor:(CGFloat)a7;
- (void)dealloc;
- (void)disableClippingForRenderEncoder:(uint64_t)a1;
- (void)drawNewPointsAt:(uint64_t)a1 drawCount:(uint64_t)a2;
- (void)drawingBeganWithStroke:(uint64_t)a1 forPreview:(void *)a2;
- (void)drawingCancelledForPreview:(uint64_t)a1;
- (void)drawingEnded:(void *)a3 finishStrokeBlock:;
- (void)eraseShaderForAttachmentIndex:(void *)a1;
- (void)finishLiveStrokeAndPresentDrawable:(void *)a3 multiplyDrawable:(int)a4 waitUntilScheduled:;
- (void)finishRendering;
- (void)finishRenderingNoTeardownForStroke:(void *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5;
- (void)flushMemoryIfPossible;
- (void)framebufferForTile:(char)a3 createIfNeeded:;
- (void)generateLiveStrokeCachesForStrokes:(uint64_t)a1 destinationLocations:(void *)a2 startTime:duration:;
- (void)generatePaintCacheForStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 segmentSteps:(void *)a5 liveStrokePoints:(uint64_t)a6 liveStrokeStartTime:(double)a7 duration:(double)a8;
- (void)generateRenderMaskForPaths:(void *)a3 renderCache:;
- (void)getAndRenderNewPoints:(uint64_t)a1;
- (void)multiplyFramebufferForTile:(char)a3 createIfNeeded:;
- (void)purgeOriginalBackFramebuffer;
- (void)purgePaintFramebuffers;
- (void)purgeRenderCachesForStrokes:(uint64_t)a1;
- (void)renderAheadWithTransform:(int)a3 onPaper:(void *)a4 renderBufferSize:(void *)a5 destinationTexture:(double)a6 destinationMultiplyTexture:(double)a7;
- (void)renderBrushIndicatorForStroke:(long long *)a3 withTransform:(unint64_t)a4 mode:;
- (void)renderFullscreenQuadWithShader:(void *)a3 renderEncoder:;
- (void)renderImageTexture:(long long *)a3 imageTextureTransform:(void *)a4 withTiles:(_OWORD *)a5 tileTransform:(char)a6 waitUntilCompleted:;
- (void)renderLiveStrokeWithTransform:(double)a3 renderBufferSize:(double)a4;
- (void)renderPaperTransform:(float64x2_t *)a3 paperTransform:(int)a4 flipped:(void *)a5 multiply:(double)a6 renderEncoder:;
- (void)renderStroke:(uint64_t)a3 withTransform:(unint64_t)a4 mode:(int)a5 flipped:(void *)a6 renderBufferSize:(int)a7 renderEncoder:(double)a8 currentClipRect:(double)a9 needRenderMask:(CGFloat)a10;
- (void)renderStrokeVertices:(unint64_t)a3 numVertices:(uint64_t)a4 vertexSize:(uint64_t)a5 numIndices:(void *)a6 renderEncoder:;
- (void)renderTexture:(uint64_t)a1;
- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 clipRect:(CGFloat)a5 renderState:(CGFloat)a6;
- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 sourceRect:(uint64_t)a5 destinationRect:(CGFloat)a6 renderState:(CGFloat)a7 blendMode:(CGFloat)a8;
- (void)renderTile:(void *)a3 tileFramebuffer:(_OWORD *)a4 tileTransform:(void *)a5 renderState:(int)a6 shouldComposite:;
- (void)renderTiles:(int)a3 clearBackBuffer:(_OWORD *)a4 tileTransform:(char)a5 waitUntilCompleted:;
- (void)renderTiles:(void *)a3 intoTile:(char)a4 waitUntilCompleted:;
- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7;
- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7 texCoordTransform:(CGFloat)a8;
- (void)renderWithTransform:(uint64_t)a3 animatingStroke:(unint64_t)a4 mode:(int)a5 clipped:(void *)a6 renderBufferSize:(double)a7 renderEncoder:(double)a8;
- (void)resetPaintFramebufferAccumulate:(uint64_t)a1;
- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:;
- (void)setBackgroundColor:(uint64_t)a1;
- (void)setLinedPaper:(uint64_t)a1;
- (void)setLiveRenderingOverrideColor:(uint64_t)a1;
- (void)setPaperTextureImage:(uint64_t)a1;
- (void)setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:(uint64_t)a1;
- (void)setupForDefaultUberVertexShaderInRenderEncoder:(uint64_t)a1;
- (void)setupOriginalBackFramebufferIfNecessary;
- (void)setupRenderEncoder:(uint64_t)a1 forSDFPenStroke:(void *)a2 alphaFactor:(uint64_t)a3;
- (void)setupRenderEncoder:(uint64_t)a3 forParticleStroke:(int)a4 secondaryParticles:;
- (void)setupRenderEncoder:(uint64_t)a3 forPenStroke:(double)a4 alphaFactor:;
- (void)setupRenderState:(int)a3 needCompute:(int)a4 clearPaint:;
- (void)setupRenderStateForRenderingStrokes:(uint64_t)a1;
- (void)setupRenderStateForStrokeRenderingNumPaintBuffers:(int)a3 needRenderMask:;
- (void)setupRenderStateWithLiveRenderConfig:(uint64_t)a1;
- (void)setupUberVertexShaderWithTransform:(_anonymous_namespace_ *)a1 paperTransform:(float64x2_t *)a2 texCoordTransform:(float64x2_t *)a3 renderEncoder:(void *)a4;
- (void)setupViewScissorClippingIfNecessaryForRenderEncoder:(uint64_t)a1;
- (void)teardownDrawingFramebuffers;
- (void)teardownRenderStateIfNecessary;
- (void)updateTile:(void *)a3 strokes:(uint64_t)a4 clear:(char)a5 waitUntilCompleted:(uint64_t)a6 offscreen:(void *)a7 stopBlock:;
@end

@implementation PKMetalRenderer

void __33__PKMetalRenderer_useBlitEncoder__block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  _MergedGlobals_140 = [v0 BOOLForKey:@"PKUseBlitEncoder"];
}

- (BOOL)shouldRenderDebugColorForStroke:(uint64_t)a1
{
  id v3 = a2;
  if ([v3 _isSynthesizedInk]) {
    BOOL v4 = *(unsigned char *)(a1 + 936) != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)colorForStroke:(uint64_t)a1
{
  id v3 = a2;
  if (-[PKMetalRenderer shouldRenderDebugColorForStroke:](a1, v3))
  {
    BOOL v4 = [MEMORY[0x1E4FB1618] redColor];
  }
  else
  {
    v5 = [v3 ink];
    BOOL v4 = [v5 color];
  }

  return v4;
}

void __59__PKMetalRenderer_disableClearOriginalBackbufferWorkaround__block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  byte_1EB3C5FF9 = [v0 BOOLForKey:@"PKDisableClearOriginalBackbufferWorkaround"];
}

- (id)initWithDrawingPixelSize:(void *)a3 actualSize:(void *)a4 device:resourceHandler:sixChannelBlendingMode:pixelFormat:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PKMetalRenderer;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      v10[124] = (id)0x3FF0000000000000;
      objc_storeStrong(v10 + 3, a2);
      a1[90] = a4;
      *((unsigned char *)a1 + 966) = 0;
      a1[128] = (id)0x3FF0000000000000;
      *((_OWORD *)a1 + 5) = 0u;
      *((_OWORD *)a1 + 6) = 0u;
      *((unsigned char *)a1 + 713) = 1;
      operator new();
    }
  }

  return a1;
}

- (void)dealloc
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    CGColorRelease(backgroundColor);
  }
  liveRenderingOverrideColor = self->_liveRenderingOverrideColor;
  if (liveRenderingOverrideColor) {
    CGColorRelease(liveRenderingOverrideColor);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKMetalRenderer;
  [(PKMetalRenderer *)&v5 dealloc];
}

- (BOOL)generateBSplineInComputeForStroke:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!*(unsigned char *)(a1 + 963))
  {
    v7 = [v3 ink];
    id v8 = v7;
    if (v7)
    {
      char v9 = [v7 _isFountainPenInkV2];

      if (v9)
      {
        BOOL v5 = 1;
        goto LABEL_3;
      }
    }
    if (*(unsigned char *)(a1 + 713) && (unint64_t)[v4 _pointsCount] >= 0x20)
    {
      v10 = [v4 ink];
      v11 = [v10 behavior];
      objc_super v12 = [v11 renderingDescriptor];
      BOOL v5 = [v12 type] == 0;

      goto LABEL_3;
    }
  }
  BOOL v5 = 0;
LABEL_3:

  return v5;
}

- (void)flushMemoryIfPossible
{
  if (a1)
  {
    v2 = -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
    -[PKLRUCache removeAllObjects]((uint64_t)v2);

    -[PKMetalResourceHandler deallocateReusableBuffers](*(void *)(a1 + 192));
    id v3 = *(void **)(a1 + 944);
    *(void *)(a1 + 944) = 0;

    BOOL v4 = *(void **)(a1 + 952);
    *(void *)(a1 + 952) = 0;

    if (!*(void *)(a1 + 8))
    {
      -[PKMetalRenderer teardownDrawingFramebuffers]((void *)a1);
    }
  }
}

- (void)teardownDrawingFramebuffers
{
  if (a1)
  {
    v2 = (void *)a1[22];
    a1[22] = 0;

    id v3 = (void *)a1[23];
    a1[23] = 0;
  }
}

- (BOOL)setViewScissor:(CGFloat)a3
{
  if (result)
  {
    CGFloat v8 = a2;
    char v9 = (CGFloat *)result;
    result = CGRectIsNull(*(CGRect *)&a2);
    if (!result)
    {
      v11.size.width = v9[28];
      v11.size.height = v9[29];
      v11.origin.x = 0.0;
      v11.origin.y = 0.0;
      v10.origin.x = v8;
      v10.origin.y = a3;
      v10.size.width = a4;
      v10.size.height = a5;
      result = CGRectEqualToRect(v10, v11);
      if (result)
      {
        CGFloat v8 = *MEMORY[0x1E4F1DB20];
        a3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        a4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        a5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
    }
    v9[40] = v8;
    v9[41] = a3;
    v9[42] = a4;
    v9[43] = a5;
  }
  return result;
}

- (uint64_t)renderZoomFactorForStroke:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  BOOL v5 = [v3 ink];
  v6 = [v5 behavior];
  v7 = [v6 renderingDescriptor];
  uint64_t v8 = [v7 type];

  if (!v8) {
    uint64_t v9 = (uint64_t)fmax(round(*(double *)(a1 + 992)), 1.0);
  }
  else {
LABEL_3:
  }
    uint64_t v9 = 1;

  return v9;
}

- (void)drawingBeganWithStroke:(uint64_t)a1 forPreview:(void *)a2
{
  id v4 = a2;
  BOOL v5 = v4;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 624);
    uint64_t v7 = *(void *)(a1 + 632) - v6;
    if (v7)
    {
      unint64_t v8 = v7 / 360;
      if (v8 <= 1) {
        unint64_t v8 = 1;
      }
      uint64_t v9 = (_OWORD *)(v6 + 296);
      do
      {
        *uint64_t v9 = xmmword_1C4827030;
        uint64_t v9 = (_OWORD *)((char *)v9 + 360);
        --v8;
      }
      while (v8);
    }
    [v4 _renderMask];
    objc_claimAutoreleasedReturnValue();
    *(unsigned char *)(a1 + 352) = 0;
    if (*(unsigned char *)(a1 + 967))
    {
      CGRect v10 = *(void **)(a1 + 648);
      if (v10)
      {
        CGRect v11 = [v10 _renderGroupID];
        objc_super v12 = [v5 _renderGroupID];
        char v13 = [v11 isEqual:v12];

        if ((v13 & 1) == 0)
        {
          -[PKMetalRenderer purgePaintFramebuffers](a1);
          *(unsigned char *)(a1 + 121) = 1;
          *(unsigned char *)(a1 + 153) = 1;
          *(unsigned char *)(a1 + 137) = 1;
          *(unsigned char *)(a1 + 169) = 1;
          long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          *(_OWORD *)(a1 + 664) = *MEMORY[0x1E4F1DB20];
          *(_OWORD *)(a1 + 680) = v14;
          v15 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Clearing paint framebuffers to switching to a new render group.", buf, 2u);
          }
        }
      }
    }
    objc_storeStrong((id *)(a1 + 648), a2);
    v16 = *(void **)(a1 + 656);
    *(void *)(a1 + 656) = 0;

    -[PKMetalRenderer renderZoomFactorForStroke:](a1, v5);
    operator new();
  }
}

- (void)getAndRenderNewPoints:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    if (v5)
    {
      uint64_t v3 = *(void *)(a1 + 632);
      if (*(void *)(a1 + 624) != v3)
      {
        if (*(unsigned char *)(v3 - 184))
        {
          kdebug_trace();
          kdebug_trace();
        }
      }
    }
    uint64_t v4 = *(void *)(a1 + 632);
    if (*(void *)(a1 + 624) == v4 || !*(unsigned char *)(v4 - 23))
    {
      kdebug_trace();
      CACurrentMediaTime();
      -[PKMetalRenderer drawNewPointsAt:drawCount:](a1, 1);
      kdebug_trace();
    }
  }
}

- (void)drawingEnded:(void *)a3 finishStrokeBlock:
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 632);
    uint64_t v8 = *(void *)(a1 + 624);
    if (v7 == v8)
    {
      if (v5) {
        (*((void (**)(id))v5 + 2))(v5);
      }
    }
    else
    {
      while (!*(unsigned char *)(v8 + 176))
      {
        v8 += 360;
        if (v8 == v7) {
          goto LABEL_9;
        }
      }
      id v9 = v12;
      *(unsigned char *)(v8 + 176) = 0;
      (*(void (**)(void))(**(void **)(v8 + 96) + 8))(*(void *)(v8 + 96));

      CGRect v10 = _Block_copy(v6);
      CGRect v11 = *(void **)(v8 + 352);
      *(void *)(v8 + 352) = v10;
    }
  }
LABEL_9:
}

- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v25 = x1_0;
  if (!a1) {
    goto LABEL_29;
  }
  uint64_t v8 = *(void *)(a1 + 632);
  if (*(void *)(a1 + 624) == v8) {
    goto LABEL_29;
  }
  id v9 = (id *)(v8 - 72);
  id v23 = *(id *)(v8 - 72);
  if (v23)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v23;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "_bounds", v23);
          long long v14 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v31.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v31.c = v14;
          *(_OWORD *)&v31.tx = *(_OWORD *)(a1 + 304);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v11);
    }
  }
  if (objc_msgSend(*v9, "count", v23) || !objc_msgSend(v25, "count"))
  {
    if ([v25 count] || !objc_msgSend(*v9, "count")) {
      goto LABEL_19;
    }
    *(void *)&long long v15 = *(void *)(v8 - 84);
    DWORD2(v15) = *(_DWORD *)(v8 - 96);
    HIDWORD(v15) = DWORD2(v15);
  }
  else
  {
    uint64_t v16 = *(void *)(v8 - 96);
    *(void *)&long long v17 = v16;
    *((void *)&v17 + 1) = HIDWORD(v16);
    long long v15 = v17;
    DWORD1(v15) = v17;
    HIDWORD(v15) = *(_DWORD *)(v8 - 88);
  }
  *(_OWORD *)(v8 - 92) = v15;
LABEL_19:
  objc_storeStrong((id *)(v8 - 72), x1_0);
  *(double *)(v8 - 64) = a3;
  *(double *)(v8 - 56) = a4;
  if (v25)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v25;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) _bounds];
          long long v22 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v26.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v26.c = v22;
          *(_OWORD *)&v26.tx = *(_OWORD *)(a1 + 304);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v19);
    }
  }
LABEL_29:
}

- (void)drawingCancelledForPreview:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 632);
    if (v3 != *(void *)(a1 + 624))
    {
      if (*(unsigned char *)(v3 - 184))
      {
        uint64_t v7 = (void (**)(void))_Block_copy(*(const void **)(v3 - 8));
        *(void *)(a1 + 632) = v5;
        if (v5 == *(void *)(a1 + 624) && (a2 & 1) == 0)
        {
          -[PKMetalRenderer purgePaintFramebuffers](a1);
          *(unsigned char *)(a1 + 121) = 1;
          *(unsigned char *)(a1 + 153) = 1;
          *(unsigned char *)(a1 + 137) = 1;
          *(unsigned char *)(a1 + 169) = 1;
          long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          *(_OWORD *)(a1 + 664) = *MEMORY[0x1E4F1DB20];
          *(_OWORD *)(a1 + 680) = v6;
        }
        if (v7) {
          v7[2]();
        }
      }
    }
  }
}

- (void)drawNewPointsAt:(uint64_t)a1 drawCount:(uint64_t)a2
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 632);
    if (v3 != *(void *)(a1 + 624)
      && *(void *)(*(void *)(v3 - 264) + 88) != *(void *)(*(void *)(v3 - 264) + 80)
      && *(unsigned char *)(v3 - 184))
    {
      uint64_t v5 = *(void **)(a1 + 8);
      if (v5) {
        uint64_t v5 = (void *)v5[10];
      }
      v47 = v5;
      uint64_t v6 = *(void *)(a1 + 632);
      uint64_t v7 = *(void *)(v6 - 264);
      if (!*(unsigned char *)(v6 - 23)) {
        goto LABEL_27;
      }
      uint64_t v8 = [*(id *)(v6 - 280) ink];
      id v9 = [v8 identifier];
      if ([v9 isEqualToString:@"com.apple.ink.pencil"])
      {
        std::vector<_PKStrokePoint>::resize(a1 + 768, 6uLL);
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)(v7 + 88);
        uint64_t v55 = *(void *)(v11 - 56);
        uint64_t v50 = *(void *)(v11 - 24);
        uint64_t v12 = *(void *)(v11 - 88);
        long long v52 = *(_OWORD *)(v11 - 72);
        double v13 = *(double *)(v11 - 48);
        long long v48 = *(_OWORD *)(v11 - 40);
        uint64_t v14 = *(void *)(v11 - 8);
        double v15 = fmax(v13, 0.1);
        double v16 = *(double *)(v11 - 16) * *(double *)(a1 + 1024);
        double v17 = *(double *)(v11 - 80) - v15;
        double v18 = v15 / 5.0;
        do
        {
          uint64_t v19 = *(void *)(a1 + 768) + v10;
          *(void *)uint64_t v19 = v12;
          *(double *)(v19 + 8) = v17;
          *(_OWORD *)(v19 + 16) = v52;
          *(void *)(v19 + 32) = v55;
          *(double *)(v19 + 40) = v13;
          *(_OWORD *)(v19 + 48) = v48;
          *(void *)(v19 + 64) = v50;
          double v17 = v18 + v17;
          v10 += 88;
          *(double *)(v19 + 72) = v16;
          *(void *)(v19 + 80) = v14;
        }
        while (v10 != 528);
      }
      else
      {
        uint64_t v20 = (uint64_t *)(a1 + 768);
        if ([v9 isEqualToString:@"com.apple.ink.crayon"])
        {
          std::vector<_PKStrokePoint>::resize(a1 + 768, 2uLL);
          uint64_t v21 = 0;
          uint64_t v22 = *(void *)(v7 + 88);
          uint64_t v23 = *(void *)(v22 - 88);
          long long v53 = *(_OWORD *)(v22 - 72);
          long long v56 = *(_OWORD *)(v22 - 56);
          long long v58 = *(_OWORD *)(v22 - 40);
          uint64_t v59 = *(void *)(v22 - 24);
          uint64_t v24 = *(void *)(v22 - 8);
          uint64_t v25 = *(void *)(a1 + 1024);
          double v26 = *(double *)(v22 - 80) + -1.0;
          char v27 = 1;
          do
          {
            char v28 = v27;
            uint64_t v29 = *v20 + 88 * v21;
            *(void *)uint64_t v29 = v23;
            *(double *)(v29 + 8) = v26;
            *(_OWORD *)(v29 + 16) = v53;
            *(_OWORD *)(v29 + 32) = v56;
            *(_OWORD *)(v29 + 48) = v58;
            *(void *)(v29 + 64) = v59;
            *(void *)(v29 + 72) = v25;
            *(void *)(v29 + 80) = v24;
            double v26 = v26 + 1.0;
            uint64_t v21 = 1;
            char v27 = 0;
          }
          while ((v28 & 1) != 0);
        }
        else
        {
          std::vector<_PKStrokePoint>::resize(a1 + 768, 2uLL);
          uint64_t v30 = *(void *)(v7 + 88);
          uint64_t v31 = *(void *)(v30 - 88);
          double v32 = *(double *)(v30 - 80);
          long long v54 = *(_OWORD *)(v30 - 72);
          uint64_t v57 = *(void *)(v30 - 56);
          uint64_t v33 = *(void *)(v30 - 48);
          long long v49 = *(_OWORD *)(v30 - 40);
          uint64_t v51 = *(void *)(v30 - 24);
          double v35 = *(double *)(v30 - 16);
          uint64_t v34 = *(void *)(v30 - 8);
          v36 = [v8 behavior];
          if (!v36) {
            goto LABEL_20;
          }
          int v37 = v36[9];

          if (v37)
          {
            *(void *)(a1 + 360) = v31;
            *(double *)(a1 + 368) = v32;
            *(void *)(a1 + 392) = v57;
            *(_OWORD *)(a1 + 376) = v54;
            *(void *)(a1 + 400) = v33;
            *(void *)(a1 + 424) = v51;
            *(_OWORD *)(a1 + 408) = v49;
            *(double *)(a1 + 432) = v35;
            *(void *)(a1 + 440) = v34;
            *(unsigned char *)(a1 + 352) = 1;
            double v38 = *(double *)(a1 + 1024);
            *(double *)(a1 + 1016) = v38;
          }
          else
          {
LABEL_20:
            double v38 = *(double *)(a1 + 1024);
          }
          double v39 = [v9 isEqualToString:@"com.apple.ink.watercolor"]
              ? *(double *)(a1 + 1024) * 0.25
              : v35 * v38;
          uint64_t v40 = *v20;
          *(void *)uint64_t v40 = v31;
          *(double *)(v40 + 8) = v32;
          *(_OWORD *)(v40 + 16) = v54;
          *(_OWORD *)(v40 + 48) = v49;
          *(void *)(v40 + 64) = v51;
          *(void *)(v40 + 32) = v57;
          *(void *)(v40 + 40) = 0;
          *(double *)(v40 + 72) = v39;
          *(void *)(v40 + 80) = v34;
          uint64_t v41 = *v20;
          *(void *)(v41 + 88) = v31;
          *(double *)(v41 + 96) = v32 + 0.1;
          *(_OWORD *)(v41 + 104) = v54;
          *(void *)(v41 + 120) = v57;
          *(void *)(v41 + 128) = 0;
          *(void *)(v41 + 152) = v51;
          *(_OWORD *)(v41 + 136) = v49;
          *(double *)(v41 + 160) = v39;
          *(void *)(v41 + 168) = v34;
        }
      }

      if (*(unsigned char *)(v6 - 23))
      {
        unint64_t v42 = *(void *)(a1 + 768);
        v43 = (unint64_t *)(a1 + 776);
      }
      else
      {
LABEL_27:
        uint64_t v44 = *(void *)(v6 - 192);
        if (v44 <= *(void *)(v6 - 200)) {
          uint64_t v44 = *(void *)(v6 - 200);
        }
        if (v44 <= 1) {
          uint64_t v44 = 1;
        }
        unint64_t v42 = *(void *)(v7 + 80) + 88 * v44 - 88;
        v43 = (unint64_t *)(v7 + 88);
      }
      unint64_t v45 = *v43;
      -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](a1, v47);
      if (a2 >= 1)
      {
        do
        {
          [(PKMetalRenderer *)a1 renderStroke:v45 animatingStroke:v6 - 360 renderEncoder:v47 computeEncoder:0 renderCache:0];
          --a2;
        }
        while (a2);
      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v47);
      uint64_t v46 = *(void *)(a1 + 8);
      if (v46) {
        [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v46 + 80)];
      }
      *(CGRect *)(a1 + 728) = CGRectUnion(*(CGRect *)(a1 + 728), *(CGRect *)(v6 - 176));
      *(CGRect *)(a1 + 664) = CGRectUnion(*(CGRect *)(a1 + 664), *(CGRect *)(v6 - 176));
    }
  }
}

- (void)setupViewScissorClippingIfNecessaryForRenderEncoder:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (!CGRectIsNull(*(CGRect *)(a1 + 320)))
  {
    CGFloat v4 = *(double *)(a1 + 336);
    CGFloat v5 = *(double *)(a1 + 344);
    double v6 = *(double *)(a1 + 232);
    CGFloat v7 = *(double *)(a1 + 320);
    v20.origin.y = *(CGFloat *)(a1 + 328);
    v20.origin.x = v7;
    v20.size.width = v4;
    v20.size.height = v5;
    v21.origin.y = v6 - CGRectGetMaxY(v20);
    long long v15 = 0u;
    long long v16 = 0u;
    v21.origin.x = v7;
    v21.size.width = v4;
    v21.size.height = v5;
    uint64_t v8 = v16;
    if ((void)v16)
    {
      uint64_t v9 = *((void *)&v16 + 1);
      if (*((void *)&v16 + 1))
      {
        v14[0] = v15;
        v14[1] = v16;
        [v3 setScissorRect:v14];
        uint64_t v10 = *(void **)(a1 + 8);
        if (v10) {
          uint64_t v10 = (void *)v10[10];
        }
        uint64_t v11 = v10;

        if (v11 == v3)
        {
          uint64_t v12 = *(void *)(a1 + 8);
          if (v12)
          {
            *(_OWORD *)(v12 + 160) = v15;
            *(void *)(v12 + 176) = v8;
            *(void *)(v12 + 184) = v9;
            double v13 = *(void **)(v12 + 80);
            if (v13)
            {
              long long v17 = v15;
              uint64_t v18 = v8;
              uint64_t v19 = v9;
              [v13 setScissorRect:&v17];
            }
          }
        }
      }
    }
  }
}

- (uint64_t)renderStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5 computeEncoder:(void *)a6 renderCache:(void *)a7
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v131 = a5;
  id v130 = a6;
  id v13 = a7;
  *(unsigned char *)(a1 + 352) = 0;
  unint64_t v136 = x1_0;
  unint64_t v138 = a3;
  v132 = v13;
  BOOL v14 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - x1_0) >> 3)) <= 1 && v13 == 0;
  if (v14 && !*(unsigned char *)(a4 + 336))
  {
    uint64_t v28 = 0;
    goto LABEL_136;
  }
  uint64_t v15 = *(void *)(a4 + 248);
  uint64_t v16 = *(void *)(a4 + 256);
  v127 = (void *)(a4 + 268);
  uint64_t v17 = *(void *)(a4 + 268);
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(a4 + 184) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(a4 + 200) = v18;
  uint64_t v19 = [*(id *)(a4 + 80) ink];
  CGRect v20 = [v19 behavior];
  if (v20 && v20[9])
  {

    if (a3 != x1_0)
    {
      memmove((void *)(a1 + 360), (const void *)(a3 - 88), 0x58uLL);
      *(unsigned char *)(a1 + 352) = 1;
    }
  }
  else
  {
  }
  if (*(unsigned char *)(a4 + 336)) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = *(unsigned char *)(a4 + 72) != 0;
  }
  BOOL v128 = v21;
  uint64_t v22 = [*(id *)(a4 + 80) ink];
  uint64_t v23 = [v22 behavior];
  uint64_t v24 = [v23 renderingDescriptor];
  uint64_t v25 = [v24 type];

  if (!v25)
  {
    uint64_t v32 = objc_opt_class();
    v129 = PKDynamicCast(v32, v132);
    uint64_t v33 = objc_opt_class();
    v126 = PKDynamicCast(v33, v132);
    uint64_t v34 = objc_opt_class();
    v125 = PKDynamicCast(v34, v132);
    v150 = (_anonymous_namespace_::AnimatingStroke *)a4;
    uint64_t v151 = a1;
    if (v129)
    {
      v134 = v129;
      id v35 = v131;
      id v36 = v130;
      int v37 = -[PKMetalResourceHandler sdfPenShaderKernelPipelineState](*(void *)(a1 + 192));
      [v36 setComputePipelineState:v37];
      float v38 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a4 + 80));
      *(float *)&unint64_t v154 = v38;
      memset(&v159, 0, sizeof(v159));
      long long v160 = 0u;
      -[PKMetalSDFPenRenderCache buffers](v134);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = [obj countByEnumeratingWithState:&v159 objects:v168 count:16];
      if (v39)
      {
        uint64_t v144 = **(void **)&v159.c;
        do
        {
          uint64_t v147 = v39;
          for (uint64_t i = 0; i != v147; ++i)
          {
            if (**(void **)&v159.c != v144) {
              objc_enumerationMutation(obj);
            }
            uint64_t v41 = *(void **)(*(void *)&v159.b + 8 * i);
            v166.a = 0.0;
            if (v41) {
              uint64_t v42 = v41[5];
            }
            else {
              uint64_t v42 = 0;
            }
            v43 = *(void **)(a1 + 8);
            if (v43) {
              v43 = (void *)v43[7];
            }
            uint64_t v44 = *(void *)(a1 + 192);
            unint64_t v45 = v43;
            id v46 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v44, 36 * v42, (uint64_t)&v166, v45);

            unint64_t v47 = [v37 threadExecutionWidth];
            if (v41) {
              unint64_t v48 = v41[6];
            }
            else {
              unint64_t v48 = 0;
            }
            [v36 setComputePipelineState:v37];
            [v36 setBytes:&v154 length:4 atIndex:3];
            long long v49 = -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v41);
            if (v41) {
              uint64_t v50 = v41[3];
            }
            else {
              uint64_t v50 = 0;
            }
            [v36 setBuffer:v49 offset:v50 atIndex:0];

            uint64_t v51 = -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v41);
            if (v41) {
              uint64_t v52 = v41[4];
            }
            else {
              uint64_t v52 = 0;
            }
            [v36 setBuffer:v51 offset:v52 atIndex:1];

            [v36 setBuffer:v46 offset:*(void *)&v166.a atIndex:2];
            *(void *)&v158.a = vcvtpd_u64_f64((double)v48 / (double)v47);
            *(int64x2_t *)&v158.b = vdupq_n_s64(1uLL);
            *(void *)&v157.a = v47;
            *(_OWORD *)&v157.b = *(_OWORD *)&v158.b;
            [v36 dispatchThreadgroups:&v158 threadsPerThreadgroup:&v157];
            -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:](v151, v35, (uint64_t)v150);
            [v35 setVertexBuffer:v46 offset:*(void *)&v166.a atIndex:0];
            if (v41)
            {
              unint64_t v53 = v41[5];
              unint64_t v54 = ((3 * v53) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              unint64_t v54 = 0;
              unint64_t v53 = 0;
            }
            v156.a = 0.0;
            uint64_t v55 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(v151 + 192), v53, &v156);
            [v35 drawIndexedPrimitives:3 indexCount:v54 indexType:*(void *)&v156.a indexBuffer:v55 indexBufferOffset:0];

            a1 = v151;
          }
          uint64_t v39 = [obj countByEnumeratingWithState:&v159 objects:v168 count:16];
        }
        while (v39);
      }

      [*((id *)v150 + 10) _bounds];
      long long v56 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v166.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v166.c = v56;
      *(_OWORD *)&v166.tx = *(_OWORD *)(v151 + 304);

      a4 = (uint64_t)v150;
      a1 = v151;
    }
    if (v126)
    {
      v139 = v126;
      id v57 = v131;
      id v58 = v130;
      uint64_t v59 = *(void *)(a1 + 192);
      if (*(unsigned char *)(a1 + 963)) {
        -[PKMetalResourceHandler paintShaderKernelPipelineStateWithLiveStrokeMode](v59);
      }
      else {
      v149 = -[PKMetalResourceHandler paintShaderKernelPipelineState](v59);
      }
      objc_msgSend(v58, "setComputePipelineState:");
      long long v160 = 0u;
      memset(&v159, 0, sizeof(v159));
      -[PKMetalSDFPenRenderCache buffers](v139);
      id objb = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = 0;
      uint64_t v101 = [objb countByEnumeratingWithState:&v159 objects:v168 count:16];
      if (v101)
      {
        uint64_t v146 = **(void **)&v159.c;
        do
        {
          uint64_t v102 = 0;
          do
          {
            if (**(void **)&v159.c != v146) {
              objc_enumerationMutation(objb);
            }
            v103 = *(void **)(*(void *)&v159.b + 8 * v102);
            v166.a = 0.0;
            if (v103) {
              uint64_t v104 = v103[5];
            }
            else {
              uint64_t v104 = 0;
            }
            v105 = *(void **)(v151 + 8);
            if (v105) {
              v105 = (void *)v105[7];
            }
            uint64_t v106 = *(void *)(v151 + 192);
            v107 = v105;
            id v108 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v106, 20 * v104, (uint64_t)&v166, v107);

            unint64_t v109 = [v149 threadExecutionWidth];
            if (v103) {
              unint64_t v110 = v103[6];
            }
            else {
              unint64_t v110 = 0;
            }
            [v58 setComputePipelineState:v149];
            v111 = -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v103);
            if (v103) {
              uint64_t v112 = v103[3];
            }
            else {
              uint64_t v112 = 0;
            }
            [v58 setBuffer:v111 offset:v112 atIndex:0];

            v113 = -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v103);
            if (v103) {
              uint64_t v114 = v103[4];
            }
            else {
              uint64_t v114 = 0;
            }
            [v58 setBuffer:v113 offset:v114 atIndex:1];

            [v58 setBuffer:v108 offset:*(void *)&v166.a atIndex:2];
            *(void *)&v158.a = vcvtpd_u64_f64((double)v110 / (double)v109);
            *(int64x2_t *)&v158.b = vdupq_n_s64(1uLL);
            *(void *)&v157.a = v109;
            *(_OWORD *)&v157.b = *(_OWORD *)&v158.b;
            [v58 dispatchThreadgroups:&v158 threadsPerThreadgroup:&v157];
            -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:](v151, v57, (uint64_t)v150, 1.0);
            [v57 setVertexBuffer:v108 offset:*(void *)&v166.a atIndex:0];
            if (v103)
            {
              unint64_t v115 = v103[5];
              unint64_t v116 = ((3 * v115) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              unint64_t v116 = 0;
              unint64_t v115 = 0;
            }
            v156.a = 0.0;
            v117 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(v151 + 192), v115, &v156);
            [v57 drawIndexedPrimitives:3 indexCount:v116 indexType:*(void *)&v156.a indexBuffer:v117 indexBufferOffset:0];
            if (v103) {
              v103 = (void *)v103[5];
            }

            v28 += (uint64_t)v103;
            ++v102;
          }
          while (v101 != v102);
          uint64_t v118 = [objb countByEnumeratingWithState:&v159 objects:v168 count:16];
          uint64_t v101 = v118;
        }
        while (v118);
      }

      [*((id *)v150 + 10) _bounds];
      long long v119 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v166.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v166.c = v119;
      *(_OWORD *)&v166.tx = *(_OWORD *)(v151 + 304);
    }
    else
    {
      if (!v125)
      {
        if (v132)
        {
          uint64_t v121 = objc_opt_class();
          v122 = PKDynamicCast(v121, v132);
          uint64_t v28 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v122, v131, a4, 1);
        }
        else
        {
            uint64_t v123 = [(PKMetalRenderer *)(_OWORD *)a1 renderSDFPenStroke:v138 animatingStroke:a4 renderEncoder:v131];
          else {
            uint64_t v123 = [(PKMetalRenderer *)(_OWORD *)a1 renderPenStroke:v138 animatingStroke:a4 renderEncoder:v131];
          }
          uint64_t v28 = v123;
        }
        goto LABEL_131;
      }
      v140 = v125;
      id v137 = v131;
      id v62 = v130;
      v148 = -[PKMetalResourceHandler paintShaderKernelPipelineStateWithLiveStrokeParticles](*(void *)(a1 + 192));
      objc_msgSend(v62, "setComputePipelineState:");
      long long v167 = 0u;
      memset(&v166, 0, sizeof(v166));
      -[PKMetalSDFPenRenderCache buffers]((id *)v140);
      id v133 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = 0;
      uint64_t v63 = [v133 countByEnumeratingWithState:&v166 objects:v168 count:16];
      if (v63)
      {
        uint64_t v135 = **(void **)&v166.c;
        do
        {
          v64 = 0;
          id obja = (id)v63;
          do
          {
            if (**(void **)&v166.c != v135) {
              objc_enumerationMutation(v133);
            }
            uint64_t v65 = *(void *)(*(void *)&v166.b + 8 * (void)v64);
            uint64_t v165 = 0;
            if (v65) {
              uint64_t v66 = *(void *)(v65 + 40);
            }
            else {
              uint64_t v66 = 0;
            }
            v67 = *(void **)(a1 + 8);
            if (v67) {
              v67 = (void *)v67[7];
            }
            uint64_t v68 = *(void *)(a1 + 192);
            v69 = v67;
            id v70 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v68, 20 * v66, (uint64_t)&v165, v69);

            unint64_t v71 = [v148 threadExecutionWidth];
            if (v65) {
              unint64_t v72 = *(void *)(v65 + 48);
            }
            else {
              unint64_t v72 = 0;
            }
            [v62 setComputePipelineState:v148];
            long long v163 = 0u;
            long long v164 = 0u;
            long long v161 = 0u;
            long long v162 = 0u;
            *(_OWORD *)&v159.tx = 0u;
            long long v160 = 0u;
            LODWORD(v159.a) = 0;
            if (v65) {
              uint64_t v73 = *(void *)(v65 + 48);
            }
            else {
              LODWORD(v73) = 0;
            }
            unint64_t v145 = v72;
            double v74 = *((double *)v140 + 5);
            double v75 = *(double *)(v151 + 1040) - *((double *)v140 + 4);
            if (v75 >= v74) {
              double v75 = *((double *)v140 + 5);
            }
            *(float *)&unsigned int v76 = v75;
            float v77 = v74;
            *(float *)&v159.c = v77;
            unsigned int v78 = *((_DWORD *)v150 + 67);
            HIDWORD(v159.a) = v73;
            *(void *)&v159.b = __PAIR64__(v76, v78);
            float64x2_t v79 = 0uLL;
            memset(&v158, 0, sizeof(v158));
            v80 = (void *)*((void *)v150 + 10);
            if (v80)
            {
              [v80 _inkTransform];
              float64x2_t v82 = *(float64x2_t *)&v158.a;
              float64x2_t v81 = *(float64x2_t *)&v158.c;
              float64x2_t v79 = *(float64x2_t *)&v158.tx;
            }
            else
            {
              float64x2_t v81 = 0uLL;
              float64x2_t v82 = 0uLL;
            }
            LODWORD(v159.ty) = 0;
            *(float32x2_t *)&v159.tx = vcvt_f32_f64(v82);
            DWORD2(v160) = 0;
            *(float32x2_t *)&long long v160 = vcvt_f32_f64(v81);
            DWORD2(v161) = 1065353216;
            *(float32x2_t *)&long long v161 = vcvt_f32_f64(v79);
            CGAffineTransform v156 = v158;
            CGAffineTransformInvert(&v157, &v156);
            DWORD2(v162) = 0;
            *(float32x2_t *)&long long v162 = vcvt_f32_f64(*(float64x2_t *)&v157.a);
            DWORD2(v163) = 0;
            *(float32x2_t *)&long long v163 = vcvt_f32_f64(*(float64x2_t *)&v157.c);
            DWORD2(v164) = 1065353216;
            *(float32x2_t *)&long long v164 = vcvt_f32_f64(*(float64x2_t *)&v157.tx);
            [v62 setBytes:&v159 length:128 atIndex:0];
            [v62 setBuffer:*(void *)(v151 + 696) offset:0 atIndex:4];
            if (v65)
            {
              id v83 = *(id *)(v65 + 24);
              uint64_t v84 = *(void *)(v65 + 32);
            }
            else
            {
              id v83 = 0;
              uint64_t v84 = 0;
            }
            [v62 setBuffer:v83 offset:v84 atIndex:3];

            if (v65)
            {
              id v85 = *(id *)(v65 + 8);
              uint64_t v86 = *(void *)(v65 + 16);
            }
            else
            {
              id v85 = 0;
              uint64_t v86 = 0;
            }
            [v62 setBuffer:v85 offset:v86 atIndex:1];

            [v62 setBuffer:v70 offset:v165 atIndex:2];
            unint64_t v154 = vcvtpd_u64_f64((double)v145 / (double)v71);
            int64x2_t v155 = vdupq_n_s64(1uLL);
            unint64_t v152 = v71;
            int64x2_t v153 = v155;
            [v62 dispatchThreadgroups:&v154 threadsPerThreadgroup:&v152];
            -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:](v151, v137, (uint64_t)v150, fmax(fmin((*((float *)&v159.b + 1) - *(float *)&v159.c * 0.5) / (0.0 - *(float *)&v159.c * 0.5), 1.0), 0.0));
            [v137 setVertexBuffer:v70 offset:v165 atIndex:0];
            if (v65)
            {
              unint64_t v87 = *(void *)(v65 + 40);
              unint64_t v88 = ((3 * v87) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              unint64_t v88 = 0;
              unint64_t v87 = 0;
            }
            v157.a = 0.0;
            v89 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(v151 + 192), v87, &v157);
            [v137 drawIndexedPrimitives:3 indexCount:v88 indexType:*(void *)&v157.a indexBuffer:v89 indexBufferOffset:0];
            if (v65) {
              uint64_t v65 = *(void *)(v65 + 40);
            }

            v28 += v65;
            v64 = (char *)v64 + 1;
            a1 = v151;
          }
          while (obja != v64);
          uint64_t v90 = [v133 countByEnumeratingWithState:&v166 objects:v168 count:16];
          uint64_t v63 = v90;
        }
        while (v90);
      }

      [*((id *)v150 + 10) _bounds];
      long long v91 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v159.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v159.c = v91;
      *(_OWORD *)&v159.tx = *(_OWORD *)(v151 + 304);
      CGRect v172 = *(CGRect *)(v140 + 48);
      long long v92 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v158.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v158.c = v92;
      *(_OWORD *)&v158.tx = *(_OWORD *)(v151 + 304);
    }
    a4 = (uint64_t)v150;
    a1 = v151;
LABEL_131:

LABEL_132:
    goto LABEL_133;
  }
  uint64_t v26 = objc_opt_class();
  char v27 = PKDynamicCast(v26, v132);
  v129 = v27;
  if (v27)
  {
    uint64_t v28 = -[PKMetalRenderer renderParticleRenderCache:renderEncoder:computeEncoder:animatingStroke:secondaryParticles:](a1, v27, v131, v130, (id *)a4, 0);
    uint64_t v29 = [*(id *)(a4 + 80) ink];
    uint64_t v30 = [v29 behavior];
    uint64_t v31 = [v30 secondaryParticleDescriptor];

    if (v31) {
      v28 += -[PKMetalRenderer renderParticleRenderCache:renderEncoder:computeEncoder:animatingStroke:secondaryParticles:](a1, v129, v131, v130, (id *)a4, 1);
    }
    goto LABEL_132;
  }
  if (!v132)
  {
    v93 = [*(id *)(a4 + 80) ink];
    v94 = [v93 behavior];
    v61 = [v94 particleDescriptor];

    if ([v61 adjustEndCapParticleAlpha] && !*(unsigned char *)(a4 + 337))
    {
      uint64_t v124 = *(void *)(a4 + 168);
      if (v124 <= *(void *)(a4 + 160)) {
        uint64_t v124 = *(void *)(a4 + 160);
      }
      BOOL v95 = v124 == 0;
    }
    else
    {
      BOOL v95 = 0;
    }
    if (![v61 adjustEndCapParticleAlpha]) {
      goto LABEL_97;
    }
    char v96 = *(unsigned char *)(a4 + 337) == 0;
    BOOL v97 = v128;
    if (*(unsigned char *)(a4 + 337)) {
      BOOL v97 = 0;
    }
    if (!v97) {
      goto LABEL_98;
    }
    if (!*(unsigned char *)(a4 + 176)) {
      char v96 = *(void *)(*(void *)(a4 + 96) + 88) == v138;
    }
    else {
LABEL_97:
    }
      char v96 = 0;
LABEL_98:
    uint64_t v28 = [(PKMetalRenderer *)a1 renderParticleStroke:v138 animatingStroke:a4 starts:v95 ends:v96 secondaryParticles:0 renderEncoder:v131];
    v98 = [*(id *)(a4 + 80) ink];
    v99 = [v98 behavior];
    v100 = [v99 secondaryParticleDescriptor];

    if (v100) {
      v28 += [(PKMetalRenderer *)a1 renderParticleStroke:v138 animatingStroke:a4 starts:0 ends:0 secondaryParticles:1 renderEncoder:v131];
    }
    goto LABEL_100;
  }
  uint64_t v60 = objc_opt_class();
  v61 = PKDynamicCast(v60, v132);
  uint64_t v28 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v61, v131, a4, 1);
LABEL_100:

LABEL_133:
  if (!v128)
  {
    *(void *)(a4 + 248) = v15;
    *(void *)(a4 + 256) = v16;
    void *v127 = v17;
  }
  *(CGRect *)(a1 + 728) = CGRectUnion(*(CGRect *)(a1 + 728), *(CGRect *)(a4 + 184));
LABEL_136:

  return v28;
}

- (void)disableClippingForRenderEncoder:(uint64_t)a1
{
  uint64_t v3 = a2;
  v9.size.width = *(CGFloat *)(a1 + 224);
  v9.size.height = *(CGFloat *)(a1 + 232);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v8.width = v9.size.width;
  v8.height = v9.size.height;
  [v3 setScissorRect:v7];
  CGFloat v4 = *(void **)(a1 + 8);
  if (v4) {
    CGFloat v4 = (void *)v4[10];
  }
  CGFloat v5 = v4;

  if (v5 == v3)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6)
    {
      *(_OWORD *)(v6 + 160) = 0u;
      *(_OWORD *)(v6 + 176) = 0u;
    }
  }
}

- (uint64_t)applyStrokeSpaceClipRect:(double)a3 strokeTransform:(double)a4
{
  long long v7 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v7;
  *(_OWORD *)&v16.tx = a2[2];
  CGRect v18 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v16);
  CGRect v19 = CGRectIntegral(v18);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v8 = v15;
  if ((void)v15) {
    BOOL v9 = *((void *)&v15 + 1) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (!v9)
  {
    uint64_t v11 = *(void *)(a1 + 8);
    if (v11)
    {
      *(_OWORD *)(v11 + 160) = v14;
      *(_OWORD *)(v11 + 176) = v8;
      uint64_t v12 = *(void **)(v11 + 80);
      if (v12)
      {
        v17[0] = v14;
        v17[1] = v8;
        [v12 setScissorRect:v17];
      }
    }
  }
  return v10;
}

- (uint64_t)renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6
{
  id v15 = a2;
  id v16 = a4;
  if (a1
    && (long long v17 = a3[1],
        v24[0] = *a3,
        v24[1] = v17,
        v24[2] = a3[2],
        -[PKMetalRenderer applyStrokeSpaceClipRect:strokeTransform:](a1, v24, a5, a6, a7, a8)))
  {
    long long v18 = a3[1];
    v23[0] = *a3;
    v23[1] = v18;
    v23[2] = a3[2];
    uint64_t v19 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v23, v16, a5, a6, a7, a8);
    CGRect v20 = *(void **)(a1 + 8);
    if (v20) {
      CGRect v20 = (void *)v20[10];
    }
    BOOL v21 = v20;
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v21);
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (uint64_t)_renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v26 = a4;
  long long v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v14 BOOLForKey:@"internalSettings.drawing.slowRendering"];

  uint64_t v15 = a1;
  if (!*(unsigned char *)(a1 + 963))
  {
    id v16 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = [v27 count];
      _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Metal Render %ld strokes.", buf, 0xCu);
    }

    uint64_t v15 = a1;
  }
  id v17 = *(id *)(v15 + 8);
  if ([v27 count] && v17)
  {
    *(void *)(a1 + 16) = 0;
    long long v18 = *(_OWORD *)(a1 + 288);
    long long v30 = *(_OWORD *)(a1 + 272);
    long long v31 = v18;
    long long v32 = *(_OWORD *)(a1 + 304);
    long long v20 = a3[1];
    long long v19 = a3[2];
    *(_OWORD *)(a1 + 272) = *a3;
    *(_OWORD *)(a1 + 288) = v20;
    *(_OWORD *)(a1 + 304) = v19;
    [v27 count];
    kdebug_trace();
    long long v21 = a3[1];
    *(_OWORD *)&v29.a = *a3;
    *(_OWORD *)&v29.c = v21;
    *(_OWORD *)&v29.tx = a3[2];
    double v22 = a5;
    *(double *)&long long v21 = a6;
    double v23 = a7;
    double v24 = a8;
    CGRect v36 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v21 - 8), &v29);
    CGRectIntegral(v36);
    operator new();
  }

  return 0;
}

- (uint64_t)renderStrokes:(void *)a3 stopBlock:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v29 = a3;
  if (a1)
  {
    __int16 v34 = 0;
    uint64_t v33 = 0;
    uint64_t v35 = 0;
    __int16 v36 = 0;
    uint64_t v6 = (_OWORD *)(a1 + 664);
    long long v7 = *(_OWORD *)(a1 + 680);
    long long v31 = *(_OWORD *)(a1 + 664);
    long long v32 = v7;
    int v8 = *(unsigned __int8 *)(a1 + 963);
    BOOL v9 = (double *)MEMORY[0x1E4F1DB20];
    if (*(unsigned char *)(a1 + 963))
    {
      id v10 = *(id *)(a1 + 8);
      uint64_t v11 = 0;
      char v12 = 1;
      do
      {
        char v13 = v12;
        long long v14 = (_anonymous_namespace_::RendererFramebuffer *)(a1 + 112 + 16 * v11);
        char v12 = 0;
        uint64_t v11 = 1;
      }
      while ((v13 & 1) != 0);
      id v15 = *(id *)(a1 + 176);
      id v16 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = 0;

      id v17 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;

      long long v18 = *((_OWORD *)v9 + 1);
      _OWORD *v6 = *(_OWORD *)v9;
      *(_OWORD *)(a1 + 680) = v18;
    }
    else
    {
      id v15 = 0;
      id v10 = 0;
    }
    uint64_t v19 = *(void *)(a1 + 8);
    if (!v19) {
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v5);
    }
    double v20 = *v9;
    double v21 = v9[1];
    double v22 = v9[2];
    double v23 = v9[3];
    long long v24 = *(_OWORD *)(a1 + 288);
    v30[0] = *(_OWORD *)(a1 + 272);
    v30[1] = v24;
    v30[2] = *(_OWORD *)(a1 + 304);
    uint64_t v25 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v5, v30, v29, v20, v21, v22, v23);
    if (!v19) {
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    }
    if (v10) {
      objc_storeStrong((id *)(a1 + 8), v10);
    }
    if (v15) {
      objc_storeStrong((id *)(a1 + 176), v15);
    }
    if (v8)
    {
    }
    long long v26 = v32;
    _OWORD *v6 = v31;
    *(_OWORD *)(a1 + 680) = v26;

    for (uint64_t i = 16; i != -16; i -= 16)
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (void)setupRenderStateForRenderingStrokes:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        long long v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "_strokeMask", (void)v16);
        BOOL v9 = v8 != 0;

        if (!v8)
        {
          id v10 = [v7 _renderMask];
          BOOL v11 = v10 == 0;

          if (v11) {
            continue;
          }
        }
        BOOL v12 = v8 == 0;
        goto LABEL_13;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v9 = 0;
      BOOL v12 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
    BOOL v12 = 0;
  }
LABEL_13:

  if ([v3 count])
  {
    char v13 = [v3 objectAtIndexedSubscript:0];
    long long v14 = [v13 ink];
    uint64_t v15 = [v14 _numPaintFramebuffers];
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[PKMetalRenderer setupRenderStateForStrokeRenderingNumPaintBuffers:needRenderMask:](a1, v15, v9 || v12);
}

- (void)teardownRenderStateIfNecessary
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      -[PKMetalRenderState commitAndPurgeResourceSet:](v2, 0);
      id v3 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;
    }
  }
}

- (void)setupRenderStateWithLiveRenderConfig:(uint64_t)a1
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4 && !*(unsigned char *)(v4 + 38)) {
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  }
  id v5 = *(id *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    long long v7 = (uint64_t *)(a2 + 80);
    uint64_t v8 = *(void *)(a2 + 80);
LABEL_12:
    *(void *)(v6 + 152) = v8;
    uint64_t v15 = *(void *)(a1 + 8);
    if (v15)
    {
      *(unsigned char *)(v15 + 42) = *(unsigned char *)(a2 + 72);
      uint64_t v16 = *(void *)(a1 + 8);
      if (v16) {
        *(unsigned char *)(v16 + 45) = *(unsigned char *)(a2 + 73);
      }
    }
    goto LABEL_15;
  }
  BOOL v9 = [PKMetalRenderState alloc];
  uint64_t v10 = 798;
  if (!*(void *)(a1 + 720)) {
    uint64_t v10 = 792;
  }
  BOOL v11 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)&v9->super.isa, *(void **)(a1 + 32), 1, *(unsigned int *)(a1 + v10) | ((unint64_t)*(unsigned __int16 *)(a1 + v10 + 4) << 32));
  BOOL v12 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v11;

  uint64_t v13 = *(void *)(a1 + 720);
  if ((unint64_t)(v13 - 1) >= 2)
  {
LABEL_11:
    uint64_t v6 = *(void *)(a1 + 8);
    long long v7 = (uint64_t *)(a2 + 80);
    uint64_t v8 = *(void *)(a2 + 80);
    if (!v6) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  uint64_t v14 = *(void *)(a1 + 8);
  if (v14)
  {
    *(void *)(v14 + 136) = v13;
    goto LABEL_11;
  }
  long long v7 = (uint64_t *)(a2 + 80);
LABEL_15:
  uint64_t v8 = *v7;
LABEL_16:
  uint64_t v17 = *(void *)(a2 + 40);
  BOOL v18 = v17 != 1;
  if (v8 >= 1 && v17 == 1)
  {
    double v20 = (unsigned __int8 *)(a1 + 121);
    uint64_t v21 = 1;
    while (1)
    {
      uint64_t v22 = *(void *)(v20 - 9);
      if (!v22 || *(unsigned char *)(v22 + 18) || !*(v20 - 1)) {
        break;
      }
      int v24 = *v20;
      v20 += 16;
      int v23 = v24;
      BOOL v18 = v24 != 0;
      if (v21 < v8)
      {
        ++v21;
        if (!v23) {
          continue;
        }
      }
      goto LABEL_29;
    }
    BOOL v18 = 1;
  }
LABEL_29:
  uint64_t v25 = *(void *)(a2 + 32);
  -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 0);
  if (v8 >= 1)
  {
    long long v26 = (unsigned char *)(a1 + 121);
    do
    {
      *long long v26 = 0;
      v26 += 16;
      --v8;
    }
    while (v8);
  }
  -[PKMetalRenderState setDestinationTexture:](*(void *)(a1 + 8), v5);
  uint64_t v27 = *(void *)(a1 + 8);
  if (v27)
  {
    *(void *)(v27 + 128) = 3;
    uint64_t v28 = *(void *)(a1 + 8);
  }
  else
  {
    uint64_t v28 = 0;
  }
  if (*(void *)(a1 + 720) == 2)
  {
    -[PKMetalRenderState setMultiplyDestinationTexture:](v28, *(void **)(a2 + 8));
    id v29 = *(void **)(a1 + 8);
    if (!v29) {
      goto LABEL_39;
    }
    v29[16] = 0;
    uint64_t v28 = *(void *)(a1 + 8);
  }
  if (v28) {
    id v29 = *(void **)(v28 + 80);
  }
  else {
    id v29 = 0;
  }
LABEL_39:
  long long v30 = v29;

  if (!v30)
  {
    long long v31 = -[PKMetalRenderState commandBufferCreateIfNecessary](*(id **)(a1 + 8));
    [v31 setLabel:@"Live rendering command buffer"];
    uint64_t v32 = 1;
    if (v18) {
      uint64_t v32 = 2;
    }
    *(void *)(a2 + 40) = v32;
    v41[0] = *(id *)a2;
    v41[1] = *(id *)(a2 + 8);
    long long v33 = *(_OWORD *)(a2 + 64);
    long long v44 = *(_OWORD *)(a2 + 48);
    long long v45 = v33;
    uint64_t v46 = *(void *)(a2 + 80);
    long long v34 = *(_OWORD *)(a2 + 16);
    long long v43 = *(_OWORD *)(a2 + 32);
    long long v42 = v34;
    uint64_t v35 = -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v31, v41, *(void **)(a1 + 8));
    -[PKMetalRenderState setRenderEncoder:](*(void *)(a1 + 8), v35);
    if (v25 == 1) {
      *(unsigned char *)(a1 + 72) = 0;
    }
  }
  uint64_t v36 = *(void *)(a1 + 632);
  uint64_t v37 = *(void *)(a1 + 624);
  if (v36 != v37)
  {
    unint64_t v38 = 0;
    uint64_t v39 = 344;
    do
    {
      uint64_t v40 = *(void **)(v37 + v39);
      if (v40)
      {
        -[PKMetalRenderState extendLifetimeUntilCompleted:](*(void *)(a1 + 8), v40);
        uint64_t v36 = *(void *)(a1 + 632);
        uint64_t v37 = *(void *)(a1 + 624);
      }
      ++v38;
      v39 += 360;
    }
    while (v38 < 0x4FA4FA4FA4FA4FA5 * ((v36 - v37) >> 3));
  }
}

- (void)setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:(uint64_t)a1
{
  -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
  uint64_t v4 = *(void *)(a1 + 8);
  if (!v4) {
    goto LABEL_50;
  }
  if (*(void *)(v4 + 136) != 3) {
    goto LABEL_13;
  }
  int v5 = *(unsigned __int8 *)(a1 + 64);
  if (!*(void *)(a1 + 56)) {
    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    int v5 = -[PKMetalFramebuffer incrementNonPurgeableCount](*(unsigned char **)(a1 + 56));
    *(unsigned char *)(a1 + 64) = v5;
LABEL_6:
    if (!v5)
    {
      uint64_t v6 = *(void *)(a1 + 56);
      if (v6
        && (*(unsigned char *)(a1 + 64)
         || (*(unsigned char *)(a1 + 64) = -[PKMetalFramebuffer incrementNonPurgeableCount]((unsigned char *)v6),
             (uint64_t v6 = *(void *)(a1 + 56)) != 0)))
      {
        long long v7 = *(void **)(v6 + 24);
      }
      else
      {
        long long v7 = 0;
      }
      id v8 = v7;
      [v8 setLabel:@"Six channel multiply framebuffer"];
    }
  }
LABEL_13:
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9) {
    goto LABEL_50;
  }
  uint64_t v10 = (unsigned char **)(a1 + 112);
  uint64_t v11 = -1;
  while ((unint64_t)++v11 < *(void *)(v9 + 152))
  {
    BOOL v12 = *v10;
    if (*v10)
    {
      if ((v12[18] != 0) == a2
            (BOOL v12 = *v10) != 0))
      {
        if (!*((unsigned char *)v10 + 8)) {
          *((unsigned char *)v10 + 8) = -[PKMetalFramebuffer incrementNonPurgeableCount](v12);
        }
      }
    }
    if (!*((unsigned char *)v10 + 8))
    {
      uint64_t v13 = *v10;
      if (*v10) {
        uint64_t v13 = (void *)v13[3];
      }
      uint64_t v14 = v13;
      [v14 setLabel:@"Paint framebuffer"];

      if (*v10 && !*((unsigned char *)v10 + 8)) {
        *((unsigned char *)v10 + 8) = -[PKMetalFramebuffer incrementNonPurgeableCount](*v10);
      }
      *((unsigned char *)v10 + 9) = 1;
    }
    uint64_t v15 = *(void *)(a1 + 8);
    if (!v15) {
      goto LABEL_50;
    }
    if (*(unsigned char *)(v15 + 45))
    {
      uint64_t v16 = v10 + 4;
      int v17 = *((unsigned __int8 *)v10 + 40);
      if (!v10[4]) {
        goto LABEL_33;
      }
      if (!*((unsigned char *)v10 + 40))
      {
        int v17 = -[PKMetalFramebuffer incrementNonPurgeableCount](v10[4]);
        *((unsigned char *)v10 + 40) = v17;
LABEL_33:
        if (!v17)
        {
          BOOL v18 = (unsigned char *)*v16;
          if (*v16
            && (*((unsigned char *)v10 + 40)
             || (*((unsigned char *)v10 + 40) = -[PKMetalFramebuffer incrementNonPurgeableCount](v18), (BOOL v18 = v10[4]) != 0)))
          {
            long long v19 = (void *)*((void *)v18 + 3);
          }
          else
          {
            long long v19 = 0;
          }
          id v20 = v19;
          [v20 setLabel:@"Accumulation framebuffer"];

          *((unsigned char *)v10 + 41) = 1;
        }
      }
    }
    v10 += 2;
    uint64_t v9 = *(void *)(a1 + 8);
    if (!v9) {
      goto LABEL_50;
    }
  }
  if (!*(unsigned char *)(v9 + 42) || *(void *)(a1 + 176)) {
    goto LABEL_54;
  }
  uint64_t v21 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(a1 + 24) pixelFormat:0 device:0 memoryless:(void *)1 backedByIOSurface:0 sampleCount:*(double *)(a1 + 224) purgeable:*(double *)(a1 + 232)];
  uint64_t v22 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = v21;

  int v23 = *(void **)(a1 + 176);
  if (v23) {
    int v23 = (void *)v23[3];
  }
  int v24 = v23;
  [v24 setLabel:@"Paint mask framebuffer"];

  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
LABEL_54:
    if (*(unsigned char *)(v9 + 42) && !*(void *)(a1 + 184))
    {
      uint64_t v25 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(a1 + 24) pixelFormat:1 device:0 memoryless:*(void **)(a1 + 704) backedByIOSurface:0 sampleCount:*(double *)(a1 + 224) purgeable:*(double *)(a1 + 232)];
      long long v26 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v25;
    }
  }
LABEL_50:
  if (!*(void *)(a1 + 696))
  {
    uint64_t v27 = -[PKMetalResourceHandler randomNumberBuffer](*(void *)(a1 + 192));
    uint64_t v28 = *(void **)(a1 + 696);
    *(void *)(a1 + 696) = v27;
  }
}

- (id)renderCommandEncoderForCommandBuffer:(id *)a3 renderStateConfig:(void *)a4 renderState:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v71 = a2;
  id v6 = a4;
  long long v7 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  id v8 = [v7 colorAttachments];
  uint64_t v73 = [v8 objectAtIndexedSubscript:0];

  uint64_t v9 = [v7 colorAttachments];
  unint64_t v72 = [v9 objectAtIndexedSubscript:3];

  [v73 setLoadAction:a3[3]];
  [v73 setStoreAction:a3[4]];
  uint64_t v10 = *(void *)(a1 + 720);
  if (v10 == 2)
  {
    if (*a3)
    {
      objc_msgSend(v73, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      [v73 setTexture:*a3];
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (v10 != 3)
  {
LABEL_8:
    objc_msgSend(v73, "setClearColor:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    uint64_t v11 = *(void **)(a1 + 40);
    if (v11) {
      uint64_t v11 = (void *)v11[3];
    }
    goto LABEL_10;
  }
  objc_msgSend(v73, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v11 = *(void **)(a1 + 40);
  if (v11) {
    uint64_t v11 = (void *)v11[3];
  }
LABEL_10:
  BOOL v12 = v11;
  [v73 setTexture:v12];

LABEL_11:
  uint64_t v13 = *(void **)(a1 + 40);
  if (v13) {
    -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, v13);
  }
  uint64_t v74 = a1;
  uint64_t v14 = v7;
  if ((uint64_t)a3[10] >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = a1 + 144;
    uint64_t v17 = a1 + 112;
    uint64_t v18 = a1 + 200;
    do
    {
      long long v19 = [v14 colorAttachments];
      id v20 = v19;
      if (v15) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 1;
      }
      uint64_t v22 = [v19 objectAtIndexedSubscript:v21];

      if (v6)
      {
        int v23 = (void **)(v16 + 16 * v15);
        if (*((unsigned char *)v6 + 44)) {
          uint64_t v24 = v17 + 32;
        }
        else {
          uint64_t v24 = v17;
        }
      }
      else
      {
        int v23 = (void **)(v17 + 32);
        uint64_t v24 = v17;
      }
      uint64_t v25 = *(void **)v24;
      if (*(void *)v24) {
        uint64_t v25 = (void *)v25[3];
      }
      long long v26 = v25;
      [v22 setTexture:v26];

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *(void **)v24);
      uint64_t v27 = *(unsigned char **)v24;
      if (*(unsigned char *)(v24 + 9))
      {
        uint64_t v28 = 2;
        if (!v27) {
          goto LABEL_26;
        }
      }
      else if (v27 && v27[18])
      {
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v28 = (uint64_t)a3[5];
        if (!v27)
        {
LABEL_26:
          BOOL v29 = 0;
          goto LABEL_32;
        }
      }
      BOOL v29 = v27[18] != 0;
LABEL_32:
      [v22 setLoadAction:v28];
      [v22 setStoreAction:!v29];
      objc_msgSend(v22, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      *(unsigned char *)(v24 + 9) = 0;

      if ((!v6 || !*((unsigned char *)v6 + 44)) && *((unsigned char *)a3 + 73) && *v23)
      {
        uint64_t v36 = [v14 colorAttachments];
        uint64_t v37 = v36;
        if (v15) {
          uint64_t v38 = 5;
        }
        else {
          uint64_t v38 = 2;
        }
        long long v33 = [v36 objectAtIndexedSubscript:v38];

        if (*(unsigned char *)(v17 + 41)) {
          uint64_t v39 = 2;
        }
        else {
          uint64_t v39 = 1;
        }
        [v33 setLoadAction:v39];
        *(unsigned char *)(v17 + 41) = 0;
        [v33 setStoreAction:1];
        uint64_t v40 = *v23;
        if (*v23) {
          uint64_t v40 = (void *)v40[3];
        }
        uint64_t v41 = v40;
        [v33 setTexture:v41];

        -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *v23);
        goto LABEL_55;
      }
      long long v30 = [v14 colorAttachments];
      long long v31 = v30;
      if (v15) {
        uint64_t v32 = 5;
      }
      else {
        uint64_t v32 = 2;
      }
      long long v33 = [v30 objectAtIndexedSubscript:v32];

      [v33 setLoadAction:0];
      [v33 setStoreAction:0];
      long long v34 = *(void **)(v18 + 8 * v15);
      if (v34)
      {
        uint64_t v35 = v34;
      }
      else
      {
        long long v42 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(v74 + 24) pixelFormat:1 device:0 memoryless:(void *)1 backedByIOSurface:0 sampleCount:*(double *)(v74 + 224) purgeable:*(double *)(v74 + 232)];
        long long v43 = *(void **)(v18 + 8 * v15);
        *(void *)(v18 + 8 * v15) = v42;

        long long v44 = *(void **)(v18 + 8 * v15);
        if (v44) {
          long long v44 = (void *)v44[3];
        }
        long long v45 = v44;
        [v45 setLabel:@"Dummy Paint Framebuffer"];

        uint64_t v35 = *(id *)(v18 + 8 * v15);
        if (!v35)
        {
          uint64_t v46 = 0;
          goto LABEL_54;
        }
      }
      uint64_t v46 = (void *)v35[3];
LABEL_54:
      id v47 = v46;
      [v33 setTexture:v47];

LABEL_55:
      ++v15;
      v17 += 16;
    }
    while (v15 < (uint64_t)a3[10]);
  }
  unint64_t v48 = v14;
  objc_msgSend(v72, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v49 = *(void *)(v74 + 720);
  if (v49 == 2)
  {
    uint64_t v50 = *(void **)(v74 + 8);
    if (v50) {
      uint64_t v50 = (void *)v50[15];
    }
    uint64_t v51 = v50;
    [v72 setTexture:v51];

    [v72 setLoadAction:a3[2]];
    [v72 setStoreAction:1];
    objc_msgSend(v72, "setClearColor:", 1.0, 1.0, 1.0, 1.0);
    goto LABEL_87;
  }
  id v52 = a3[4];
  if (!v6)
  {
LABEL_69:
    if (v49 && *(void *)(v74 + 56) && v52 == (id)1)
    {
      objc_msgSend(v72, "setClearColor:", 1.0, 1.0, 1.0, 1.0);
      long long v56 = *(void **)(v74 + 56);
      if (v56) {
        long long v56 = (void *)v56[3];
      }
      id v57 = v56;
      [v72 setTexture:v57];

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *(void **)(v74 + 56));
      [v72 setLoadAction:a3[3]];
      uint64_t v58 = 1;
      goto LABEL_82;
    }
    uint64_t v59 = *(void **)(v74 + 216);
    if (v59)
    {
      uint64_t v60 = v59;
    }
    else
    {
      v61 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(v74 + 24) pixelFormat:1 device:0 memoryless:(void *)1 backedByIOSurface:0 sampleCount:*(double *)(v74 + 224) purgeable:*(double *)(v74 + 232)];
      id v62 = *(void **)(v74 + 216);
      *(void *)(v74 + 216) = v61;

      uint64_t v63 = *(void **)(v74 + 216);
      if (v63) {
        uint64_t v63 = (void *)v63[3];
      }
      v64 = v63;
      [v64 setLabel:@"Dummy Color Framebuffer"];

      uint64_t v60 = *(id *)(v74 + 216);
      if (!v60)
      {
        uint64_t v65 = 0;
        goto LABEL_81;
      }
    }
    uint64_t v65 = (void *)v60[3];
LABEL_81:
    id v66 = v65;
    [v72 setTexture:v66];

    [v72 setLoadAction:0];
    uint64_t v58 = 0;
LABEL_82:
    [v72 setStoreAction:v58];
    goto LABEL_87;
  }
  id v53 = *((id *)v6 + 14);

  if (!v53)
  {
    uint64_t v49 = *(void *)(v74 + 720);
    goto LABEL_69;
  }
  id v54 = a3[2];
  if (v54 == (id)2)
  {
    uint64_t v55 = *(CGColor **)(v74 + 240);
    if (v55)
    {
      long long v76 = xmmword_1C482A9D0;
      long long v77 = unk_1C482A9E0;
      DKUColorGetRGBAComponents(v55, &v76);
      objc_msgSend(v72, "setClearColor:", v76, v77);
    }
    else
    {
      objc_msgSend(v72, "setClearColor:", *(double *)&PKMetalRendererBackboardWhiteLevel, *(double *)&PKMetalRendererBackboardWhiteLevel, *(double *)&PKMetalRendererBackboardWhiteLevel, 1.0);
    }
  }
  v67 = *(void **)(v74 + 8);
  if (v67) {
    v67 = (void *)v67[14];
  }
  uint64_t v68 = v67;
  [v72 setTexture:v68];

  [v72 setLoadAction:v54];
  [v72 setStoreAction:1];
LABEL_87:
  v69 = [v71 renderCommandEncoderWithDescriptor:v14];

  return v69;
}

- (void)setupRenderStateForStrokeRenderingNumPaintBuffers:(int)a3 needRenderMask:
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    if (!*(unsigned char *)(v6 + 38)
      || (-[PKMetalRenderer teardownRenderStateIfNecessary](a1), uint64_t v6 = *(void *)(a1 + 8), v7 = a2 > 0, v6))
    {
      if (a2 <= 0) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v7 = a2 > 0;
  }
  id v8 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32));
  uint64_t v9 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v8;

  if (v7)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6)
    {
      *(void *)(v6 + 152) = a2;
      uint64_t v6 = *(void *)(a1 + 8);
      if (*(void *)(a1 + 720))
      {
        if (v6)
        {
          *(void *)(v6 + 136) = 3;
          uint64_t v6 = *(void *)(a1 + 8);
        }
      }
    }
    if (a3)
    {
      if (!v6) {
        goto LABEL_17;
      }
      *(unsigned char *)(v6 + 42) = 1;
      uint64_t v6 = *(void *)(a1 + 8);
    }
    if (v6) {
LABEL_16:
    }
      *(void *)(v6 + 152) = a2;
LABEL_17:
    uint64_t v10 = 2;
    goto LABEL_22;
  }
  if (a3)
  {
    uint64_t v11 = *(void *)(a1 + 8);
    if (v11)
    {
      uint64_t v10 = 0;
      *(unsigned char *)(v11 + 42) = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  uint64_t v10 = 0;
LABEL_22:
  -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
  BOOL v12 = *(void **)(a1 + 8);
  if (v12) {
    BOOL v12 = (void *)v12[10];
  }
  uint64_t v13 = v12;

  if (!v13)
  {
    uint64_t v14 = *(void *)(a1 + 8);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 152);
    }
    else {
      uint64_t v15 = 0;
    }
    int v16 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v17 = -[PKMetalRenderState commandBufferCreateIfNecessary]((id *)v14);
    v20[0] = 0;
    v20[1] = 0;
    if (v16) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    v20[2] = 0;
    v20[3] = (id)v18;
    v20[4] = (id)1;
    v20[5] = (id)v10;
    memset(&v20[6], 0, 24);
    __int16 v21 = 0;
    uint64_t v22 = v15;
    long long v19 = -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v17, v20, *(void **)(a1 + 8));
    -[PKMetalRenderState setRenderEncoder:](*(void *)(a1 + 8), v19);
    *(unsigned char *)(a1 + 72) = 0;
  }
}

- (void)renderAheadWithTransform:(int)a3 onPaper:(void *)a4 renderBufferSize:(void *)a5 destinationTexture:(double)a6 destinationMultiplyTexture:(double)a7
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v181 = a4;
  id v182 = a5;
  if (!a1) {
    goto LABEL_202;
  }
  uint64_t v12 = *(void *)(a1 + 624);
  uint64_t v13 = *(void *)(a1 + 632);
  while (v12 != v13)
  {
    if (!*(unsigned char *)(v12 + 176)) {
    v12 += 360;
    }
  }
  id v178 = v181;
  uint64_t v231 = 0;
  long long v230 = 0uLL;
  id v179 = v182;
  uint64_t v14 = *(void *)(a1 + 8);
  if (v14) {
    *(unsigned char *)(v14 + 41) = a3;
  }
  if (a3) {
    uint64_t v15 = 2 * (*(void *)(a1 + 240) != 0);
  }
  else {
    uint64_t v15 = 2;
  }
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  uint64_t v17 = *(void *)(a1 + 632);
  if (*(void *)(a1 + 624) == v17)
  {
    if (*(void *)(a1 + 648))
    {
      if ([*(id *)(a1 + 656) count])
      {
        id v184 = *(id *)(a1 + 656);
        double v18 = 1.0;
      }
      else
      {
        id v184 = 0;
        double v18 = 0.0;
      }
      uint64_t v24 = [*(id *)(a1 + 648) ink];
      uint64_t v25 = [v24 _numPaintFramebuffers];

      char v177 = 0;
      if (v25 <= 1) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = v25;
      }
      uint64_t v176 = v26;
      int v187 = 1;
      uint64_t v23 = 1;
    }
    else
    {
      char v177 = 0;
      int v187 = 0;
      id v184 = 0;
      double v18 = 0.0;
      uint64_t v23 = 2;
      uint64_t v176 = 1;
    }
  }
  else
  {
    char v177 = *(unsigned char *)(v17 - 75);
    id v184 = *(id *)(v17 - 72);
    double v18 = *(double *)(v17 - 64);
    int v19 = *(unsigned __int8 *)(v17 - 40);
    id v20 = [*(id *)(v17 - 280) ink];
    uint64_t v21 = [v20 _numPaintFramebuffers];

    if (v21 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v21;
    }
    uint64_t v176 = v22;
    int v187 = v19 ^ 1;
    if (v19) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 1;
    }
  }
  uint64_t v27 = *(void *)(a1 + 720);
  val = (char *)a1;
  if (v27 == 1)
  {
    uint64_t v28 = *(void *)(a1 + 192);
    if (v28) {
      uint64_t v28 = *(void *)(v28 + 440);
    }
    *(void *)(a1 + 472) = v28;
  }
  else
  {
    *(void *)(a1 + 472) = *(void *)(a1 + 968);
    if (v27 == 2)
    {
      uint64_t v29 = *(void *)(a1 + 944);
      if (v29 && (id v30 = *(id *)(v29 + 24)) != 0)
      {
        long long v31 = v30;
        uint64_t v32 = *(void **)(a1 + 952);
        if (v32) {
          uint64_t v32 = (void *)v32[3];
        }
        long long v33 = v32;

        uint64_t v16 = 2;
        if (v179 && v178)
        {
          uint64_t v15 = 2;
          if (v33)
          {
            long long v34 = [*(id *)(a1 + 32) commandBuffer];
            uint64_t v35 = [v34 blitCommandEncoder];
            uint64_t v36 = *(void **)(a1 + 944);
            if (v36) {
              uint64_t v36 = (void *)v36[3];
            }
            uint64_t v37 = v36;
            uint64_t v38 = [v37 width];
            uint64_t v39 = *(void **)(a1 + 944);
            if (v39) {
              uint64_t v39 = (void *)v39[3];
            }
            uint64_t v40 = v39;
            uint64_t v41 = [v40 height];

            long long v42 = (void *)*((void *)val + 118);
            if (v42) {
              long long v42 = (void *)v42[3];
            }
            long long v43 = v42;
            memset(v227, 0, sizeof(v227));
            v226[0] = v38;
            v226[1] = v41;
            v226[2] = 1;
            memset(v225, 0, sizeof(v225));
            [v35 copyFromTexture:v43 sourceSlice:0 sourceLevel:0 sourceOrigin:v227 sourceSize:v226 toTexture:v178 destinationSlice:0 destinationLevel:0 destinationOrigin:v225];

            long long v44 = (void *)*((void *)val + 119);
            if (v44) {
              long long v44 = (void *)v44[3];
            }
            long long v45 = v44;
            uint64_t v46 = [v45 width];
            id v47 = (void *)*((void *)val + 119);
            if (v47) {
              id v47 = (void *)v47[3];
            }
            unint64_t v48 = v47;
            uint64_t v49 = [v48 height];

            uint64_t v50 = (void *)*((void *)val + 119);
            if (v50) {
              uint64_t v50 = (void *)v50[3];
            }
            uint64_t v51 = v50;
            memset(v224, 0, sizeof(v224));
            v223[0] = v46;
            v223[1] = v49;
            v223[2] = 1;
            memset(v222, 0, sizeof(v222));
            [v35 copyFromTexture:v51 sourceSlice:0 sourceLevel:0 sourceOrigin:v224 sourceSize:v223 toTexture:v179 destinationSlice:0 destinationLevel:0 destinationOrigin:v222];

            [v35 endEncoding];
            [v34 enqueue];
            [v34 commit];

            uint64_t v16 = 1;
            uint64_t v15 = 1;
            a1 = (uint64_t)val;
          }
          goto LABEL_58;
        }
      }
      else
      {
        uint64_t v16 = 2;
      }
      uint64_t v15 = 2;
    }
  }
LABEL_58:
  id v174 = v178;
  v216[0] = v174;
  id v175 = v179;
  v216[1] = v175;
  v216[2] = v15;
  v216[3] = v16;
  v216[4] = 1;
  v216[5] = v23;
  memset(&v216[6], 0, 24);
  char v217 = v177;
  char v218 = v187;
  int v219 = v228;
  __int16 v220 = v229;
  uint64_t v221 = v176;
  -[PKMetalRenderer setupRenderStateWithLiveRenderConfig:](a1, (uint64_t)v216);
  -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"renderAheadWithTransform");
  if (v187)
  {
    uint64_t v52 = *(void *)(a1 + 624);
    int v53 = v52 != *(void *)(a1 + 632)
       && !*(unsigned char *)(v52 + 337)
       && *(void *)(*(void *)(v52 + 96) + 72) > *(void *)(v52 + 160) + 1;
    -[PKMetalRenderer resetPaintFramebufferAccumulate:](a1, v53);
  }
  if ([v184 count])
  {
    v198 = [MEMORY[0x1E4F1CA80] set];
    long long v215 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v212 = 0u;
    obunint64_t j = v184;
    uint64_t v54 = [obj countByEnumeratingWithState:&v212 objects:v239 count:16];
    if (v54)
    {
      uint64_t v196 = *(void *)v213;
      v192 = (uint64_t *)(a1 + 608);
      v194 = (uint64_t *)(a1 + 592);
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v213 != v196) {
            objc_enumerationMutation(obj);
          }
          long long v56 = (PKStroke *)*(id *)(*((void *)&v212 + 1) + 8 * i);
          id v200 = v198;
          if (*(id *)(a1 + 8))
          {
            uint64_t v57 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v56);
            if (v56) {
              [(PKStroke *)v56 _transform];
            }
            else {
              memset(&t1, 0, sizeof(t1));
            }
            *(CGAffineTransform *)&buf[2].c = t1;
            double v241 = v18;
            operator new();
          }

          a1 = (uint64_t)val;
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v212 objects:v239 count:16];
      }
      while (v54);
    }

    a1 = (uint64_t)val;
  }
  else
  {
    v198 = 0;
  }
  char v58 = *(unsigned char *)(a1 + 352);
  *(unsigned char *)(a1 + 352) = 0;
  double v59 = *a2;
  double v60 = a2[1];
  double v62 = a2[2];
  double v61 = a2[3];
  double v64 = a2[4];
  double v63 = a2[5];
  -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"renderAnimatingStrokesWithTransform");
  uint64_t v65 = *(void **)(a1 + 8);
  if (v65) {
    uint64_t v65 = (void *)v65[10];
  }
  char v173 = v58;
  id v66 = v65;
  v67 = v66;
  if (*(void *)(a1 + 624) != *(void *)(a1 + 632))
  {
    unint64_t v68 = 0;
    v186 = (_OWORD *)(a1 + 664);
    *(unsigned char *)(a1 + 72) = 0;
    v183 = (uint64_t *)(a1 + 608);
    v180 = (_OWORD *)(a1 + 272);
    char v69 = 1;
    v197 = v66;
    while (1)
    {
      uint64_t v70 = *(void *)(a1 + 624);
      unint64_t v71 = 0x4FA4FA4FA4FA4FA5 * ((*(void *)(a1 + 632) - v70) >> 3);
      if (v68 >= v71) {
        goto LABEL_194;
      }
      unint64_t v72 = v68;
      uint64_t v73 = v70 + 360 * v68;
      *(CGRect *)(a1 + 728) = CGRectUnion(*(CGRect *)(a1 + 728), *(CGRect *)(v73 + 184));
      unint64_t v201 = v72;
      if (!(*(unsigned __int8 *)(v70 + 360 * v72 + 337) | v187))
      {
        uint64_t v74 = v70 + 360 * v72;
        uint64_t v77 = *(void *)(v74 + 168);
        uint64_t v76 = v74 + 168;
        uint64_t v75 = v77;
        uint64_t v78 = *(void *)(v76 - 72);
        uint64_t v79 = *(void *)(v78 + 72);
        uint64_t v80 = *(void *)(v78 + 80);
        *(unsigned char *)(v76 + 168) = 1;
        -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](a1, v197);
        if (v77 <= 1) {
          uint64_t v81 = 1;
        }
        else {
          uint64_t v81 = v75;
        }
        [(PKMetalRenderer *)(uint64_t)val renderStroke:v80 + 88 * v79 animatingStroke:v73 renderEncoder:v197 computeEncoder:0 renderCache:0];
        -[PKMetalRenderer disableClippingForRenderEncoder:]((uint64_t)val, v197);
        uint64_t v82 = *((void *)val + 1);
        if (v82) {
          [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v82 + 80)];
        }
        *(void *)uint64_t v76 = v79;
        *(unsigned char *)(v76 + 168) = 0;
        a1 = (uint64_t)val;
        unint64_t v72 = v201;
      }
      unint64_t v83 = v71 - 1;
      *(CGRect *)(a1 + 664) = CGRectUnion(*(CGRect *)(a1 + 664), *(CGRect *)(v70 + 360 * v72 + 216));
      v67 = v197;
      if (*(void *)(a1 + 720) != 2 || v201 != v83)
      {
        if (v69) {
          unint64_t v84 = 0;
        }
        else {
          unint64_t v84 = 2;
        }
        t1.a = v59;
        t1.b = v60;
        t1.c = v62;
        t1.d = v61;
        t1.tx = v64;
        t1.ty = v63;
        [(PKMetalRenderer *)(uint64_t)val renderWithTransform:v73 animatingStroke:v84 mode:(v69 & 1) == 0 clipped:v197 renderBufferSize:a6 renderEncoder:a7];
      }
      unint64_t v85 = v201;
      if (!*(unsigned char *)(*(void *)(v70 + 360 * v201 + 96) + 108)) {
        goto LABEL_117;
      }
      if (*(void *)(v70 + 360 * v201 + 288) && *(double *)(v70 + 360 * v201 + 304) >= 0.01)
      {
        BOOL v86 = *(double *)(v70 + 360 * v201 + 296) < 0.01;
        if (v201) {
          goto LABEL_117;
        }
      }
      else
      {
        BOOL v86 = 1;
        if (v201) {
          goto LABEL_117;
        }
      }
      if (!v86)
      {
LABEL_117:
        unint64_t v68 = v201 + 1;
        a1 = (uint64_t)val;
        goto LABEL_160;
      }
      -[PKMetalRenderState pushDebugGroup:](*((void *)val + 1), @"finishStroke");
      unint64_t v87 = (void *)*((void *)val + 1);
      if (v87) {
        unint64_t v87 = (void *)v87[10];
      }
      unint64_t v88 = v87;
      uint64_t v89 = *((void *)val + 78);
      uint64_t v90 = *(void *)(v89 + 96);
      uint64_t v91 = *(void *)(v89 + 168);
      if (v91 <= *(void *)(v89 + 160)) {
        uint64_t v91 = *(void *)(v89 + 160);
      }
      if (v91 <= 1) {
        uint64_t v91 = 1;
      }
      unint64_t v92 = *(void *)(v90 + 88);
      unint64_t v93 = *(void *)(v90 + 80) + 88 * v91 - 88;
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v92 - v93) >> 3)) < 2)
      {
        char v96 = (unsigned char *)(v89 + 338);
        if (*(unsigned char *)(v89 + 338)) {
          goto LABEL_120;
        }
      }
      else
      {
        v94 = os_log_create("com.apple.pencilkit", "Sketching");
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0].a) = 134217984;
          *(void *)((char *)&buf[0].a + 4) = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v92 - v93) >> 3);
          _os_log_impl(&dword_1C44F8000, v94, OS_LOG_TYPE_DEFAULT, "FinishFrontStroke: Rendering remaining stroke points: %lu", (uint8_t *)buf, 0xCu);
        }

        -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:]((uint64_t)val, v88);
        [(PKMetalRenderer *)(uint64_t)val renderStroke:v92 animatingStroke:v89 renderEncoder:v88 computeEncoder:0 renderCache:0];
        -[PKMetalRenderer disableClippingForRenderEncoder:]((uint64_t)val, v88);
        uint64_t v95 = *((void *)val + 1);
        if (v95) {
          [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v95 + 80)];
        }
        *(CGRect *)(val + 728) = CGRectUnion(*(CGRect *)(val + 728), *(CGRect *)(v89 + 184));
        *(CGRect *)(val + 664) = CGRectUnion(*(CGRect *)(val + 664), *(CGRect *)(v89 + 184));
        char v96 = (unsigned char *)(v89 + 338);
        if (*(unsigned char *)(v89 + 338))
        {
          -[PKMetalRenderer resetPaintFramebufferAccumulate:]((uint64_t)val, 1);
          goto LABEL_120;
        }
      }
      uint64_t v191 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
      uint64_t v193 = *MEMORY[0x1E4F1DB20];
      id obja = *(id *)(MEMORY[0x1E4F1DB20] + 24);
      uint64_t v190 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
      BOOL v97 = v88;
      long long v98 = v180[1];
      *(_OWORD *)&buf[0].a = *v180;
      *(_OWORD *)&buf[0].c = v98;
      *(_OWORD *)&buf[0].tx = v180[2];
      *(void *)&long long v98 = v191;
      uint64_t v99 = v193;
      id v101 = obja;
      uint64_t v100 = v190;
      CGRect v243 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v98 - 8), buf);
      -[PKMetalRenderer finishRenderingNoTeardownForStroke:clippedToPixelSpaceRect:renderEncoder:]((uint64_t)val, v89, v97, v243.origin.x, v243.origin.y, v243.size.width, v243.size.height);
      -[PKMetalRenderer finishRendering]((uint64_t)val);

LABEL_120:
      if (*(unsigned char *)(*(void *)(v89 + 96) + 108))
      {
        uint64_t v102 = *(void **)(v89 + 288);
        if (!v102 || *(double *)(v89 + 304) < 0.01 || *(double *)(v89 + 296) < 0.01)
        {
          if (*v96 && [v102 count])
          {
            uint64_t v103 = [*(id *)(v89 + 288) copy];
            uint64_t v104 = (void *)*((void *)val + 82);
            *((void *)val + 82) = v103;
          }
          v105 = _Block_copy(*(const void **)(v89 + 352));
          objc_initWeak((id *)buf, val);
          if (v105)
          {
            uint64_t v106 = (void *)*((void *)val + 1);
            if (v106) {
              uint64_t v106 = (void *)v106[7];
            }
            v107 = v106;
            *(void *)&t2.a = MEMORY[0x1E4F143A8];
            *(void *)&t2.b = 3221225472;
            *(void *)&t2.c = __36__PKMetalRenderer_finishFrontStroke__block_invoke;
            *(void *)&t2.d = &unk_1E64C9120;
            *(void *)&t2.tx = v105;
            [v107 addCompletedHandler:&t2];
          }
          objc_destroyWeak((id *)buf);
        }
      }
      uint64_t v108 = *((void *)val + 78);
      uint64_t v109 = v108 + 360;
      uint64_t v110 = *((void *)val + 79);
      if (v108 + 360 == v110)
      {
        uint64_t v146 = (uint64_t)val;
      }
      else
      {
        uint64_t v111 = 0;
        do
        {
          uint64_t v112 = v108 + v111;
          long long v113 = *(_OWORD *)(v108 + v111 + 360);
          *(void *)(v112 + 360) = 0;
          *(void *)(v112 + 368) = 0;
          uint64_t v114 = *(std::__shared_weak_count **)(v108 + v111 + 8);
          *(_OWORD *)uint64_t v112 = v113;
          if (v114) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v114);
          }
          long long v115 = *(_OWORD *)(v112 + 376);
          *(void *)(v112 + 376) = 0;
          *(void *)(v112 + 384) = 0;
          unint64_t v116 = *(std::__shared_weak_count **)(v112 + 24);
          *(_OWORD *)(v112 + 16) = v115;
          if (v116) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v116);
          }
          uint64_t v117 = v108 + v111;
          long long v118 = *(_OWORD *)(v108 + v111 + 392);
          *(void *)(v117 + 392) = 0;
          *(void *)(v117 + 400) = 0;
          long long v119 = *(std::__shared_weak_count **)(v108 + v111 + 40);
          *(_OWORD *)(v117 + 32) = v118;
          if (v119) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v119);
          }
          long long v120 = *(_OWORD *)(v117 + 408);
          *(void *)(v117 + 408) = 0;
          *(void *)(v117 + 416) = 0;
          uint64_t v121 = *(std::__shared_weak_count **)(v117 + 56);
          *(_OWORD *)(v117 + 48) = v120;
          if (v121) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v121);
          }
          uint64_t v122 = v108 + v111;
          *(void *)(v122 + 64) = *(void *)(v108 + v111 + 424);
          *(_DWORD *)(v122 + 71) = *(_DWORD *)(v108 + v111 + 431);
          uint64_t v123 = *(void *)(v108 + v111 + 440);
          *(void *)(v122 + 440) = 0;
          uint64_t v124 = *(void **)(v108 + v111 + 80);
          *(void *)(v122 + 80) = v123;

          uint64_t v125 = *(void *)(v108 + v111 + 448);
          *(void *)(v122 + 448) = 0;
          v126 = *(void **)(v108 + v111 + 88);
          *(void *)(v122 + 88) = v125;

          uint64_t v127 = v108 + v111;
          BOOL v128 = (uint64_t *)(v108 + v111 + 96);
          uint64_t v129 = *v128;
          uint64_t v130 = *(void *)(v108 + v111 + 456);
          v128[45] = 0;
          *BOOL v128 = v130;
          if (v129) {
            std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)v128, v129);
          }
          uint64_t v131 = *(void *)(v127 + 464);
          *(void *)(v127 + 464) = 0;
          std::unique_ptr<PKMetalInputProvider>::reset[abi:ne180100]((uint64_t *)(v127 + 104), v131);
          long long v132 = *(_OWORD *)(v127 + 616);
          *(_OWORD *)(v127 + 240) = *(_OWORD *)(v127 + 600);
          *(_OWORD *)(v127 + 256) = v132;
          *(_OWORD *)(v127 + 270) = *(_OWORD *)(v127 + 630);
          long long v133 = *(_OWORD *)(v127 + 552);
          *(_OWORD *)(v127 + 176) = *(_OWORD *)(v127 + 536);
          *(_OWORD *)(v127 + 192) = v133;
          long long v134 = *(_OWORD *)(v127 + 584);
          *(_OWORD *)(v127 + 208) = *(_OWORD *)(v127 + 568);
          *(_OWORD *)(v127 + 224) = v134;
          long long v135 = *(_OWORD *)(v127 + 488);
          *(_OWORD *)(v127 + 112) = *(_OWORD *)(v127 + 472);
          *(_OWORD *)(v127 + 128) = v135;
          long long v136 = *(_OWORD *)(v127 + 520);
          *(_OWORD *)(v127 + 144) = *(_OWORD *)(v127 + 504);
          *(_OWORD *)(v127 + 160) = v136;
          uint64_t v137 = *(void *)(v127 + 648);
          *(void *)(v127 + 648) = 0;
          unint64_t v138 = *(void **)(v127 + 288);
          *(void *)(v127 + 288) = v137;

          v139 = (void *)(v108 + v111);
          v140 = (_OWORD *)(v108 + v111 + 296);
          long long v141 = *(_OWORD *)(v108 + v111 + 672);
          _OWORD *v140 = *(_OWORD *)(v108 + v111 + 656);
          v140[1] = v141;
          *(_OWORD *)((char *)v140 + 27) = *(_OWORD *)(v108 + v111 + 683);
          uint64_t v142 = *(void *)(v108 + v111 + 704);
          v139[88] = 0;
          v143 = *(void **)(v108 + v111 + 344);
          v139[43] = v142;

          uint64_t v144 = *(void *)(v108 + v111 + 712);
          v139[89] = 0;
          unint64_t v145 = *(void **)(v108 + v111 + 352);
          v139[44] = v144;

          v111 += 360;
        }
        while (v108 + v111 + 360 != v110);
        uint64_t v146 = (uint64_t)val;
        uint64_t v109 = *((void *)val + 79);
        v108 += v111;
      }
      while (v109 != v108)
      *(void *)(v146 + 632) = v108;
      if (*(void *)(v146 + 624) == v108)
      {
        if (!*(unsigned char *)(v146 + 967) || (v147 = [*(id *)(v146 + 656) count], uint64_t v146 = (uint64_t)val, v147))
        {
          -[PKMetalRenderer purgePaintFramebuffers](v146);
          uint64_t v146 = (uint64_t)val;
          val[121] = 1;
          val[153] = 1;
          val[137] = 1;
          val[169] = 1;
          long long v148 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          _OWORD *v186 = *MEMORY[0x1E4F1DB20];
          v186[1] = v148;
        }
      }
      uint64_t v149 = *(void *)(v146 + 8);
      if (v149) {
        [*(id *)(v149 + 80) popDebugGroup];
      }

      if (v187)
      {
        a1 = (uint64_t)val;
        if (!val[967])
        {
          for (unint64_t j = 0; ; ++j)
          {
            unint64_t v156 = *(void *)(a1 + 8);
            if (v156) {
              unint64_t v156 = *(void *)(v156 + 152);
            }
            if (j >= v156) {
              break;
            }
            if (j) {
              int v157 = 5;
            }
            else {
              int v157 = 2;
            }
            CGAffineTransform v158 = -[PKMetalRenderer eraseShaderForAttachmentIndex:]((void *)a1, v157);
            -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v158, v197);

            a1 = (uint64_t)val;
          }
        }
        unint64_t v68 = 0;
      }
      else
      {
        unint64_t v68 = 0;
        a1 = (uint64_t)val;
      }
      unint64_t v85 = v201;
LABEL_160:
      if (v85 != v83 && !*(unsigned char *)(a1 + 967))
      {
        memset(buf, 0, 32);
        if (*(void *)&buf[0].c)
        {
          if (*(void *)&buf[0].d)
          {
            for (unint64_t k = 0; ; ++k)
            {
              unint64_t v151 = *(void *)(a1 + 8);
              if (v151) {
                unint64_t v151 = *(void *)(v151 + 152);
              }
              if (k >= v151) {
                break;
              }
              if (k) {
                int v152 = 4;
              }
              else {
                int v152 = 1;
              }
              int64x2_t v153 = -[PKMetalRenderer eraseShaderForAttachmentIndex:]((void *)a1, v152);
              -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v153, v197);

              a1 = (uint64_t)val;
            }
            long long v154 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
            _OWORD *v186 = *MEMORY[0x1E4F1DB20];
            v186[1] = v154;
          }
        }
      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v197);
      char v69 = 0;
    }
  }
  CGAffineTransform v159 = *(void **)(a1 + 648);
  if (v159)
  {
    long long v160 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&buf[0].a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&buf[0].c = v160;
    *(_OWORD *)&buf[0].tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v161 = fabs(v59 * v61 - v60 * v62);
    if (v161 >= 0.001 && v161 != INFINITY && fabs(v64) != INFINITY && fabs(v63) != INFINITY && a6 > 0.0 && a7 > 0.0)
    {
      t1.a = v59;
      t1.b = v60;
      t1.c = v62;
      t1.d = v61;
      t1.tx = v64;
      t1.ty = v63;
      t2.a = 2.0 / a6;
      t2.c = 0.0;
      t2.b = 0.0;
      t2.d = 2.0 / a7;
      __asm { FMOV            V0.2D, #-1.0 }
      long long v195 = _Q0;
      *(_OWORD *)&t2.tx = _Q0;
      CGAffineTransformConcat(buf, &t1, &t2);
      v234.c = 0.0;
      v234.b = 0.0;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v168 = vmulq_f64(*(float64x2_t *)(a1 + 248), _Q1);
      v234.d = v168.f64[1];
      v234.a = v168.f64[0];
      *(float64x2_t *)&v234.tx = v168;
      v233.a = v59;
      v233.b = v60;
      v233.c = v62;
      v233.d = v61;
      v233.tx = v64;
      v233.ty = v63;
      CGAffineTransformConcat(&v235, &v234, &v233);
      v232.a = 2.0 / a6;
      v232.c = 0.0;
      v232.b = 0.0;
      v232.d = 2.0 / a7;
      *(_OWORD *)&v232.tx = v195;
      CGAffineTransformConcat(&v236, &v235, &v232);
      buf[0] = v236;
    }
    uint64_t v169 = *(void *)(a1 + 192);
    if (v169) {
      BOOL v170 = *(unsigned __int8 *)(v169 + 428) != 0;
    }
    else {
      BOOL v170 = 0;
    }
    CGAffineTransform v236 = buf[0];
    -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](a1, v159, (uint64_t)&v236, 0, v170, v67, 0, a6, a7, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
    a1 = (uint64_t)val;
  }
  else
  {
    buf[0].a = v59;
    buf[0].b = v60;
    buf[0].c = v62;
    buf[0].d = v61;
    buf[0].tx = v64;
    buf[0].ty = v63;
    [(PKMetalRenderer *)a1 renderWithTransform:0 animatingStroke:0 mode:0 clipped:v66 renderBufferSize:a6 renderEncoder:a7];
  }
LABEL_194:
  uint64_t v171 = *(void *)(a1 + 8);
  if (v171) {
    [*(id *)(v171 + 80) popDebugGroup];
  }

  val[352] = v173;
  uint64_t v172 = *((void *)val + 1);
  if (v172) {
    [*(id *)(v172 + 80) popDebugGroup];
  }
  if (!val[961] && *((void *)val + 90) != 2)
  {
    -[PKMetalRenderState commitAndPurgeResourceSet:](*((void *)val + 1), v198);
    v202[0] = v174;
    v202[1] = v175;
    int64x2_t v203 = vdupq_n_s64(1uLL);
    int64x2_t v204 = v203;
    long long v205 = v230;
    uint64_t v206 = v231;
    char v207 = v177;
    char v208 = v187;
    int v209 = v228;
    __int16 v210 = v229;
    uint64_t v211 = v176;
    -[PKMetalRenderer setupRenderStateWithLiveRenderConfig:]((uint64_t)val, (uint64_t)v202);
  }

LABEL_202:
}

- (void)resetPaintFramebufferAccumulate:(uint64_t)a1
{
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4) {
    uint64_t v4 = (void *)v4[10];
  }
  int v5 = v4;
  -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"resetPaintFramebufferAccumulateIfNeeded");
  if (a2)
  {
    -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"Render into accumulator");
    uint64_t v6 = *(void *)(a1 + 624);
    CGFloat v7 = *(double *)(v6 + 184);
    CGFloat v8 = *(double *)(v6 + 192);
    CGFloat v9 = *(double *)(v6 + 200);
    CGFloat v10 = *(double *)(v6 + 208);
    uint64_t v11 = *(void **)(v6 + 96);
    uint64_t v12 = *(void *)(v6 + 160);
    uint64_t v13 = v11[10];
    uint64_t v14 = v11[11];
    unint64_t v15 = v11[9];
    *(unsigned char *)(v6 + 72) = 1;
    uint64_t v16 = *(void *)(v6 + 304);
    *(void *)(v6 + 304) = 0x3FF0000000000000;
    -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](a1, v5);
    unint64_t v17 = 0x2E8BA2E8BA2E8BA3 * ((v14 - v13) >> 3);
    if (v17 >= v15) {
      unint64_t v17 = v15;
    }
    unint64_t v18 = v13 + 88 * v17;
    if (v12 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v12;
    }
    [(PKMetalRenderer *)a1 renderStroke:v18 animatingStroke:v6 renderEncoder:v5 computeEncoder:0 renderCache:0];
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v5);
    *(unsigned char *)(v6 + 72) = 0;
    *(void *)(v6 + 304) = v16;
    uint64_t v20 = *(void *)(a1 + 8);
    if (v20) {
      [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v20 + 80)];
    }
    v69.origin.CGFloat x = v7;
    v69.origin.CGFloat y = v8;
    v69.size.CGFloat width = v9;
    v69.size.CGFloat height = v10;
    *(CGRect *)(v6 + 184) = CGRectUnion(v69, *(CGRect *)(v6 + 184));
    *(void *)(v6 + 160) = *(void *)(*(void *)(v6 + 96) + 72);
    uint64_t v21 = *(void *)(a1 + 8);
    if (v21) {
      [*(id *)(v21 + 80) popDebugGroup];
    }
  }
  uint64_t v22 = *(void *)(a1 + 624);
  if (v22 == *(void *)(a1 + 632))
  {
    uint64_t v37 = *(void *)(a1 + 624);
  }
  else
  {
    if ([*(id *)(v22 + 288) count])
    {
      uint64_t v23 = *(void *)(a1 + 624);
      CGRect v70 = CGRectUnion(*(CGRect *)(v23 + 216), *(CGRect *)(a1 + 664));
      CGRect v71 = CGRectIntegral(v70);
      CGFloat x = v71.origin.x;
      CGFloat y = v71.origin.y;
      CGFloat width = v71.size.width;
      CGFloat height = v71.size.height;
      unint64_t v28 = 0;
      for (uint64_t i = 144; ; i += 16)
      {
        id v30 = *(void **)(a1 + 8);
        unint64_t v31 = v30 ? v30[19] : 0;
        if (v28 >= v31) {
          break;
        }
        uint64_t v32 = *(void *)(a1 + 192);
        if (v32 && *(unsigned char *)(v32 + 428))
        {
          if (v30) {
            id v30 = (void *)v30[10];
          }
          long long v33 = v30;
          [(PKMetalRenderer *)a1 copyFromFramebuffer:v28 toFramebuffer:x clipRect:y renderEncoder:width paintIndex:height alphaBlendFactor:*(double *)(v23 + 304)];
        }
        else
        {
          long long v34 = *(void **)(a1 + i);
          if (v34) {
            long long v34 = (void *)v34[3];
          }
          long long v33 = v34;
          uint64_t v35 = *(void **)(a1 + 8);
          if (v35) {
            uint64_t v35 = (void *)v35[10];
          }
          uint64_t v36 = v35;
          -[PKMetalRenderer copyIntoPaintFromTexture:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v33, v36, v28, x, y, width, height, *(double *)(v23 + 304));
        }
        ++v28;
      }
      goto LABEL_76;
    }
    uint64_t v37 = *(void *)(a1 + 632);
    uint64_t v22 = *(void *)(a1 + 624);
  }
  if (*(unsigned char *)(a1 + 967))
  {
    if (v37 - v22 == 360)
    {
      CGRect v72 = CGRectUnion(*(CGRect *)(v22 + 184), *(CGRect *)(a1 + 664));
      goto LABEL_46;
    }
LABEL_44:
    if (v22 == v37)
    {
      CGFloat x = *(double *)(a1 + 664);
      CGFloat y = *(double *)(a1 + 672);
      CGFloat width = *(double *)(a1 + 680);
      CGFloat height = *(double *)(a1 + 688);
LABEL_59:
      v74.origin.CGFloat x = x;
      v74.origin.CGFloat y = y;
      v74.size.CGFloat width = width;
      v74.size.CGFloat height = height;
      if (CGRectIsNull(v74)) {
        goto LABEL_76;
      }
      v75.origin.CGFloat x = x;
      v75.origin.CGFloat y = y;
      v75.size.CGFloat width = width;
      v75.size.CGFloat height = height;
      CGRect v76 = CGRectIntegral(v75);
      CGFloat x = v76.origin.x;
      CGFloat y = v76.origin.y;
      CGFloat width = v76.size.width;
      CGFloat height = v76.size.height;
      -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"copyFromAccumulatorToPaint");
      uint64_t v47 = *(void *)(a1 + 8);
      if (!v47)
      {
LABEL_76:
        v78.origin.CGFloat x = x;
        v78.origin.CGFloat y = y;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        *(CGRect *)(a1 + 728) = CGRectUnion(*(CGRect *)(a1 + 728), v78);
        long long v62 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        *(_OWORD *)(a1 + 664) = *MEMORY[0x1E4F1DB20];
        *(_OWORD *)(a1 + 680) = v62;
        goto LABEL_77;
      }
      unint64_t v48 = 0;
      uint64_t v49 = (void **)(a1 + 144);
      while (1)
      {
        if (v48 >= *(void *)(v47 + 152))
        {
          [*(id *)(v47 + 80) popDebugGroup];
          goto LABEL_76;
        }
        uint64_t v50 = *(void *)(a1 + 192);
        if (!v50) {
          break;
        }
        uint64_t v51 = *v49;
        if (!*(unsigned char *)(v50 + 428)) {
          goto LABEL_67;
        }
        uint64_t v52 = *(v49 - 4);
        id v53 = *(id *)(v47 + 80);
        uint64_t v54 = v51;
        id v55 = v52;
        long long v56 = v53;
        [(PKMetalRenderer *)a1 copyFromFramebuffer:v48 toFramebuffer:x clipRect:y renderEncoder:width paintIndex:height alphaBlendFactor:1.0];
        uint64_t v57 = v56;
LABEL_72:

        ++v48;
        uint64_t v47 = *(void *)(a1 + 8);
        v49 += 2;
        if (!v47) {
          goto LABEL_76;
        }
      }
      uint64_t v51 = *v49;
LABEL_67:
      if (v51) {
        char v58 = (void *)v51[3];
      }
      else {
        char v58 = 0;
      }
      id v59 = v58;
      double v60 = *(void **)(a1 + 8);
      if (v60) {
        double v60 = (void *)v60[10];
      }
      double v61 = v60;
      id v55 = v59;
      long long v56 = v61;
      -[PKMetalRenderer copyIntoPaintFromTexture:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v55, v56, v48, x, y, width, height, 1.0);
      uint64_t v54 = v56;
      uint64_t v57 = v55;
      goto LABEL_72;
    }
    CGRect v72 = CGRectUnion(*(CGRect *)(v22 + 216), *(CGRect *)(a1 + 664));
LABEL_46:
    CGFloat x = v72.origin.x;
    CGFloat y = v72.origin.y;
    CGFloat width = v72.size.width;
    CGFloat height = v72.size.height;
    goto LABEL_59;
  }
  if (v22 != v37 && (*(uint64_t *)(v22 + 160) > 0 || a2 != 0))
  {
    if (v37 - v22 == 360)
    {
      CGFloat x = *(double *)(v22 + 184);
      CGFloat y = *(double *)(v22 + 192);
      CGFloat width = *(double *)(v22 + 200);
      CGFloat height = *(double *)(v22 + 208);
      goto LABEL_59;
    }
    goto LABEL_44;
  }
  if (!CGRectIsNull(*(CGRect *)(a1 + 664)))
  {
    -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"Erase Paint");
    CGRect v73 = CGRectIntegral(*(CGRect *)(a1 + 664));
    CGFloat v39 = v73.origin.x;
    CGFloat v40 = v73.origin.y;
    CGFloat v41 = v73.size.width;
    CGFloat v42 = v73.size.height;
    long long v67 = 0u;
    long long v68 = 0u;
    if ((void)v68 && *((void *)&v68 + 1))
    {
      v77.origin.CGFloat x = v39;
      v77.origin.CGFloat y = v40;
      v77.size.CGFloat width = v41;
      v77.size.CGFloat height = v42;
      *(CGRect *)(a1 + 728) = CGRectUnion(*(CGRect *)(a1 + 728), v77);
      v66[0] = v67;
      v66[1] = v68;
      [v5 setScissorRect:v66];
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v44 = *(void *)(a1 + 8);
        if (v44) {
          unint64_t v44 = *(void *)(v44 + 152);
        }
        if (j >= v44) {
          break;
        }
        if (j) {
          int v45 = 4;
        }
        else {
          int v45 = 1;
        }
        uint64_t v46 = -[PKMetalRenderer eraseShaderForAttachmentIndex:]((void *)a1, v45);
        -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v5);
        -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v46, v5);
      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v5);
    }
    long long v64 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(a1 + 664) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(a1 + 680) = v64;
    uint64_t v65 = *(void *)(a1 + 8);
    if (v65) {
      [*(id *)(v65 + 80) popDebugGroup];
    }
  }
LABEL_77:
  uint64_t v63 = *(void *)(a1 + 8);
  if (v63) {
    [*(id *)(v63 + 80) popDebugGroup];
  }
}

- (void)renderLiveStrokeWithTransform:(double)a3 renderBufferSize:(double)a4
{
  if (a1)
  {
    uint64_t v5 = a1[79];
    if (v5 != a1[78])
    {
      if (*(unsigned char *)(v5 - 184))
      {
        if (*(unsigned char *)(v5 - 23))
        {
          CGFloat v9 = [*(id *)(v5 - 280) ink];
          id v15 = [v9 identifier];

          if ((objc_msgSend(v15, "isEqualToString:", @"com.apple.ink.marker", CACurrentMediaTime()) & 1) != 0
            || [v15 isEqualToString:@"com.apple.ink.pencil"])
          {
            uint64_t v10 = 3;
          }
          else
          {
            uint64_t v10 = 1;
          }
          -[PKMetalRenderer drawNewPointsAt:drawCount:]((uint64_t)a1, v10);
        }
        uint64_t v11 = (void *)a1[1];
        if (v11) {
          uint64_t v11 = (void *)v11[10];
        }
        uint64_t v16 = v11;
        -[PKMetalRenderState pushDebugGroup:](a1[1], @"renderLiveStrokeWithTransform");
        uint64_t v12 = a1[79] - 360;
        long long v13 = a2[1];
        v17[0] = *a2;
        v17[1] = v13;
        _OWORD v17[2] = a2[2];
        [(PKMetalRenderer *)(uint64_t)a1 renderWithTransform:v12 animatingStroke:0 mode:1 clipped:v16 renderBufferSize:a3 renderEncoder:a4];
        uint64_t v14 = a1[1];
        if (v14) {
          [*(id *)(v14 + 80) popDebugGroup];
        }
      }
    }
  }
}

- (void)renderWithTransform:(uint64_t)a3 animatingStroke:(unint64_t)a4 mode:(int)a5 clipped:(void *)a6 renderBufferSize:(double)a7 renderEncoder:(double)a8
{
  id v15 = a6;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v58.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v58.c = v16;
  *(_OWORD *)&v58.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  unint64_t v17 = (double *)MEMORY[0x1E4F1DB20];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v22 = fabs(*a2 * a2[3] - a2[1] * a2[2]);
  if (v22 >= 0.001 && v22 != INFINITY && fabs(a2[4]) != INFINITY && fabs(a2[5]) != INFINITY && a7 > 0.0 && a8 > 0.0)
  {
    long long v23 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = *((_OWORD *)a2 + 2);
    t2.a = 2.0 / a7;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.d = 2.0 / a8;
    __asm { FMOV            V0.2D, #-1.0 }
    long long v45 = _Q0;
    *(_OWORD *)&t2.tCGFloat x = _Q0;
    CGAffineTransformConcat(&v58, &t1, &t2);
    v53.b = 0.0;
    v53.c = 0.0;
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v30 = vmulq_f64(*(float64x2_t *)(a1 + 248), _Q1);
    v53.d = v30.f64[1];
    v53.a = v30.f64[0];
    *(float64x2_t *)&v53.tCGFloat x = v30;
    long long v31 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&v52.a = *(_OWORD *)a2;
    *(_OWORD *)&v52.c = v31;
    *(_OWORD *)&v52.tCGFloat x = *((_OWORD *)a2 + 2);
    CGAffineTransformConcat(&v54, &v53, &v52);
    v51.a = 2.0 / a7;
    v51.b = 0.0;
    v51.c = 0.0;
    v51.d = 2.0 / a8;
    *(_OWORD *)&v51.tCGFloat x = v45;
    CGAffineTransformConcat(&v55, &v54, &v51);
    CGAffineTransform v58 = v55;
  }
  if (a3)
  {
    if (a5 && !CGRectIsNull(*(CGRect *)(a3 + 184)))
    {
      uint64_t v32 = *(void *)(a3 + 184);
      uint64_t v33 = *(void *)(a3 + 192);
      uint64_t v34 = *(void *)(a3 + 200);
      uint64_t v35 = *(void *)(a3 + 208);
      if (*(void *)(a1 + 720) == 2) {
        *(CGRect *)&uint64_t v32 = CGRectUnion(*(CGRect *)&v32, *(CGRect *)(a3 + 216));
      }
      double v36 = *(double *)(a1 + 232);
      v50.a = 2.0 / *(double *)(a1 + 224);
      v50.b = 0.0;
      v50.c = 0.0;
      v50.d = 2.0 / v36;
      __asm { FMOV            V4.2D, #-1.0 }
      *(_OWORD *)&v50.tCGFloat x = _Q4;
      CGRect v59 = CGRectApplyAffineTransform(*(CGRect *)&v32, &v50);
      CGAffineTransform v49 = v58;
      CGRect v60 = CGRectApplyAffineTransform(v59, &v49);
      v48.a = a7 * 0.5;
      v48.b = 0.0;
      v48.c = 0.0;
      v48.d = a8 * 0.5;
      v48.tCGFloat x = a7 * 0.5;
      v48.tCGFloat y = a8 * 0.5;
      CGRect v61 = CGRectApplyAffineTransform(v60, &v48);
      CGRect v62 = CGRectIntegral(v61);
      CGFloat x = v62.origin.x;
      CGFloat y = v62.origin.y;
      CGFloat width = v62.size.width;
      CGFloat height = v62.size.height;
      memset(&v55, 0, 32);
      if (*(void *)&v55.c && *(void *)&v55.d)
      {
        v47[0] = *(_OWORD *)&v55.a;
        v47[1] = *(_OWORD *)&v55.c;
        [v15 setScissorRect:v47];
      }
      else
      {
        CGFloat x = *v17;
        CGFloat y = v17[1];
        CGFloat width = v17[2];
        CGFloat height = v17[3];
      }
    }
    uint64_t v38 = *(void **)(a3 + 80);
  }
  else
  {
    uint64_t v38 = 0;
  }
  id v39 = v38;
  uint64_t v40 = *(void *)(a1 + 192);
  if (v40) {
    BOOL v41 = *(unsigned __int8 *)(v40 + 428) != 0;
  }
  else {
    BOOL v41 = 0;
  }
  CGAffineTransform v46 = v58;
  if (a3)
  {
    CGFloat v42 = (unsigned __int8 *)(a3 + 285);
  }
  else
  {
    uint64_t v43 = *(void *)(a1 + 8);
    if (!v43)
    {
      BOOL v44 = 0;
      goto LABEL_26;
    }
    CGFloat v42 = (unsigned __int8 *)(v43 + 42);
  }
  BOOL v44 = *v42 != 0;
LABEL_26:
  -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](a1, v39, (uint64_t)&v46, a4, v41, v15, v44, a7, a8, x, y, width, height);
  -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v15);
}

- (void)finishLiveStrokeAndPresentDrawable:(void *)a3 multiplyDrawable:(int)a4 waitUntilScheduled:
{
  unint64_t v9 = a2;
  unint64_t v7 = a3;
  if (a1)
  {
    CGFloat v8 = -[PKMetalRenderState lastCommandBuffer](*(id **)(a1 + 8));
    if (v9 | v7)
    {
      if (v9) {
        [v8 presentDrawable:v9];
      }
      if (v7) {
        [v8 presentDrawable:v7];
      }
      [v8 addCompletedHandler:&__block_literal_global_58];
    }
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    if (a4) {
      [v8 waitUntilScheduled];
    }
    if (*(void *)(a1 + 624) == *(void *)(a1 + 632) && !*(unsigned char *)(a1 + 967)) {
      -[PKMetalRenderer purgePaintFramebuffers](a1);
    }
  }
}

uint64_t __90__PKMetalRenderer_finishLiveStrokeAndPresentDrawable_multiplyDrawable_waitUntilScheduled___block_invoke()
{
  return kdebug_trace();
}

- (void)purgePaintFramebuffers
{
  if (a1)
  {
    uint64_t v1 = 0;
    uint64_t v2 = a1 + 112;
    uint64_t v3 = a1 + 144;
    char v4 = 1;
    do
    {
      char v5 = v4;
      uint64_t v6 = v2 + 16 * v1;
      int v8 = *(unsigned __int8 *)(v6 + 8);
      unint64_t v7 = (unsigned char *)(v6 + 8);
      uint64_t v9 = 16 * v1;
      if (v8)
      {
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(v2 + 16 * v1));
        unsigned char *v7 = 0;
      }
      uint64_t v10 = v3 + 16 * v1;
      int v12 = *(unsigned __int8 *)(v10 + 8);
      uint64_t v11 = (unsigned char *)(v10 + 8);
      if (v12)
      {
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(v3 + v9));
        unsigned char *v11 = 0;
      }
      char v4 = 0;
      uint64_t v1 = 1;
    }
    while ((v5 & 1) != 0);
  }
}

- (void)addStrokeSpaceDrawableDirtyRect:(double)a3
{
  if (a1)
  {
    CGFloat v6 = *(double *)(a1 + 728);
    CGFloat v7 = *(double *)(a1 + 736);
    CGFloat v8 = *(double *)(a1 + 744);
    CGFloat v9 = *(double *)(a1 + 752);
    long long v10 = *(_OWORD *)(a1 + 288);
    *(_OWORD *)&v11.a = *(_OWORD *)(a1 + 272);
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)(a1 + 304);
    CGRect v13 = CGRectApplyAffineTransform(*(CGRect *)&a2, &v11);
    v12.origin.CGFloat x = v6;
    v12.origin.CGFloat y = v7;
    v12.size.CGFloat width = v8;
    v12.size.CGFloat height = v9;
    *(CGRect *)(a1 + 728) = CGRectUnion(v12, v13);
  }
}

uint64_t __36__PKMetalRenderer_finishFrontStroke__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (__n128)setCombineStrokesAllowed:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 967) = a2;
    if ((a2 & 1) == 0)
    {
      uint64_t v3 = *(void **)(a1 + 648);
      *(void *)(a1 + 648) = 0;

      char v4 = *(void **)(a1 + 656);
      *(void *)(a1 + 656) = 0;

      -[PKMetalRenderer purgePaintFramebuffers](a1);
      *(unsigned char *)(a1 + 121) = 1;
      *(unsigned char *)(a1 + 153) = 1;
      *(unsigned char *)(a1 + 137) = 1;
      *(unsigned char *)(a1 + 169) = 1;
      __n128 result = *(__n128 *)MEMORY[0x1E4F1DB20];
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(a1 + 664) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(a1 + 680) = v6;
    }
  }
  return result;
}

- (void)renderStroke:(uint64_t)a3 withTransform:(unint64_t)a4 mode:(int)a5 flipped:(void *)a6 renderBufferSize:(int)a7 renderEncoder:(double)a8 currentClipRect:(double)a9 needRenderMask:(CGFloat)a10
{
  uint64_t v571 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v24 = a6;
  v496 = v23;
  v513 = v24;
  int v512 = a5;
  if (!*(void *)(a1 + 720))
  {
    r2double a = a11;
    double v491 = a9;
    -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"renderStroke:withTransform:...");
    uint64_t v37 = *(void *)(a1 + 8);
    if (v37) {
      uint64_t v38 = *(void *)(v37 + 128);
    }
    else {
      LODWORD(v38) = 0;
    }
    uint64_t v39 = a4;
    if (!a4)
    {
      if (*(void *)(a1 + 976)) {
        uint64_t v39 = 2;
      }
      else {
        uint64_t v39 = *(void *)(a1 + 240) != 0;
      }
    }
    long long v555 = 0u;
    long long v556 = 0u;
    long long v563 = 0u;
    long long v562 = 0u;
    long long v561 = 0u;
    long long v560 = 0u;
    long long v559 = 0u;
    long long v557 = 0u;
    long long v558 = 0u;
    long long v554 = 0u;
    long long v553 = 0u;
    long long v552 = 0u;
    long long v551 = 0u;
    char v564 = a5;
    float32x2_t v138 = vcvt_f32_f64(*MEMORY[0x1E4F1DAB8]);
    float32x2_t v139 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16));
    float32x2_t v140 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32));
    DWORD2(v555) = 0;
    *(float32x2_t *)&long long v555 = v138;
    DWORD2(v556) = 0;
    *(float32x2_t *)&long long v556 = v139;
    DWORD2(v557) = 1065353216;
    *(float32x2_t *)&long long v557 = v140;
    int v542 = 1065353216;
    if (*(unsigned char *)(a1 + 964))
    {
      __asm { FMOV            V1.2D, #16.0 }
      float32x2_t v539 = vcvt_f32_f64(vdivq_f64(_Q1, *(float64x2_t *)(a1 + 248)));
    }
    rectdouble b = a12;
    if (v37)
    {
      char v142 = *(void *)(v37 + 152) > 1uLL;
      if (v23) {
        goto LABEL_81;
      }
      unint64_t v147 = -[PKMetalRenderState pipelineConfig](v37);
    }
    else
    {
      if (v23)
      {
        char v142 = 0;
LABEL_81:
        v143 = [v23 ink];
        -[PKMetalRenderer colorForStroke:](a1, v23);
        id v144 = objc_claimAutoreleasedReturnValue();
        unint64_t v145 = (CGColor *)[v144 CGColor];

        uint64_t v146 = *(void *)(a1 + 8);
        if (v146 && *(unsigned char *)(v146 + 38) && *(void *)(a1 + 984)) {
          unint64_t v145 = *(CGColor **)(a1 + 984);
        }
        *(_OWORD *)&v570.double a = xmmword_1C482A9D0;
        *(_OWORD *)&v570.double c = unk_1C482A9E0;
        if (*(unsigned char *)(a1 + 965))
        {
          *(_OWORD *)&v567.double a = xmmword_1C482A9D0;
          *(_OWORD *)&v567.double c = unk_1C482A9E0;
          DKUColorGetRGBAComponents(v145, &v567);
          *(_OWORD *)&v565.double a = __const_DKUTransformColorFromRGBA_hsla;
          *(_OWORD *)&v565.double c = unk_1C482B3D8;
          DKUConvertsRGBToHSL((uint64_t)&v567, (uint64_t)&v565);
          v565.double c = 1.0 - v565.c;
          DKUConvertHSLToSRGB((uint64_t)&v565, (uint64_t)&v570);
        }
        else
        {
          DKUColorGetRGBAComponents(v145, &v570);
        }
        double d = v570.d;
        v150 = [v143 behavior];
        BOOL v151 = (unint64_t)[v150 version] < 3;

        if (v151)
        {
          int v152 = [v143 behavior];
          [v152 blendAlpha];
          double d = v153;
        }
        long long v154 = [v143 behavior];
        [v154 targetMultiple];
        double v156 = v155;

        if (v156 != 0.0 && vabdd_f64(v570.a, v570.b) < 0.00999999978 && vabdd_f64(v570.b, v570.c) < 0.00999999978) {
          double v156 = 0.0;
        }
        *(float32x2_t *)&long long v157 = vcvt_f32_f64(*(float64x2_t *)&v570.a);
        *(float *)&unsigned int v158 = v570.c;
        *((void *)&v157 + 1) = __PAIR64__(1.0, v158);
        v535[0] = v157;
        *(float *)&long long v157 = d;
        float v159 = v156;
        int v537 = v157;
        float v538 = v159;
        long long v160 = [v496 _clipPlane];
        double v161 = [v143 behavior];
        long long v162 = [v161 renderingDescriptor];
        uint64_t v163 = [v162 blendMode];

        if (v163)
        {
          if (v163 == 1)
          {
            if (v570.a < 0.99 || v570.b < 0.99 || v570.c < 0.99)
            {
              id v178 = *(void **)(a1 + 192);
              int v179 = *(unsigned __int8 *)(a1 + 964);
              uint64_t v180 = *(void *)(a1 + 8);
              if (v180) {
                unint64_t v181 = -[PKMetalRenderState pipelineConfig](v180);
              }
              else {
                unint64_t v181 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
              }
              uint64_t v182 = [(PKMetalResourceHandler *)v178 compositeMultiplyShaderWithMode:v160 != 0 clipping:v156 > 0.0 targetMultiple:v38 colorAttachmentIndex:a7 renderMask:v179 != 0 edgeMask:v142 secondaryPaintEnabled:v181 pipelineConfig:(v181 & 0xFFFFFFFFFFFFLL) >> 32];
            }
            else
            {
              long long v167 = objc_msgSend(v143, "behavior", 0.99, v570.c);
              BOOL v168 = (unint64_t)[v167 version] < 3;

              if (v168) {
                int v537 = 1065353216;
              }
              uint64_t v169 = *(void **)(a1 + 192);
              int v170 = *(unsigned __int8 *)(a1 + 964);
              uint64_t v171 = *(void *)(a1 + 8);
              if (v171) {
                unint64_t v172 = -[PKMetalRenderState pipelineConfig](v171);
              }
              else {
                unint64_t v172 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
              }
              uint64_t v182 = -[PKMetalResourceHandler compositeSoftWhiteShaderWithMode:clipping:colorAttachmentIndex:renderMask:edgeMask:secondaryPaintEnabled:pipelineConfig:](v169, v39, v160 != 0, v38, a7, v170 != 0, v142, v172 & 0xFFFFFFFFFFFFLL);
            }
          }
          else
          {
            if (v163 != 2)
            {
              char v177 = os_log_create("com.apple.pencilkit", "");
              if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
              {
                v451 = [v496 ink];
                v452 = [v451 behavior];
                v453 = [v452 renderingDescriptor];
                uint64_t v454 = [v453 blendMode];
                LODWORD(v565.a) = 134217984;
                *(void *)((char *)&v565.a + 4) = v454;
                _os_log_error_impl(&dword_1C44F8000, v177, OS_LOG_TYPE_ERROR, "Renderer has stroke with unknown blend mode %ld", (uint8_t *)&v565, 0xCu);
              }
              long long v148 = v143;
              goto LABEL_413;
            }
            long long v164 = *(void **)(a1 + 192);
            uint64_t v165 = *(void *)(a1 + 8);
            if (v165) {
              unint64_t v166 = -[PKMetalRenderState pipelineConfig](v165);
            }
            else {
              unint64_t v166 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
            }
            uint64_t v182 = -[PKMetalResourceHandler compositeEraseShaderWithMode:clipping:colorAttachmentIndex:secondaryPaintEnabled:pipelineConfig:](v164, v39, v160 != 0, v38, v142, v166 & 0xFFFFFFFFFFFFLL);
          }
        }
        else
        {
          char v173 = *(void **)(a1 + 192);
          int v174 = *(unsigned __int8 *)(a1 + 964);
          uint64_t v175 = *(void *)(a1 + 8);
          if (v175) {
            unint64_t v176 = -[PKMetalRenderState pipelineConfig](v175);
          }
          else {
            unint64_t v176 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
          }
          uint64_t v182 = -[PKMetalResourceHandler compositeOverShaderWithMode:clipping:colorAttachmentIndex:renderMask:edgeMask:secondaryPaintEnabled:pipelineConfig:](v173, v39, v160 != 0, v38, a7, v174 != 0, v142, v176 & 0xFFFFFFFFFFFFLL);
        }
        long long v148 = (void *)v182;
        if (v160)
        {
          double v184 = *(double *)(a1 + 224);
          double v183 = *(double *)(a1 + 232);
          [v160 origin];
          double v487 = v185;
          double v187 = v186;
          [v160 normal];
          double v483 = v188;
          double v190 = v189;
          long long v191 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v533.double a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v533.double c = v191;
          *(_OWORD *)&v533.tCGFloat x = *(_OWORD *)(a1 + 304);
          if (CGAffineTransformIsIdentity(&v533))
          {
            v194.f64[0] = v483;
            v193.f64[0] = v487;
          }
          else
          {
            double v195 = *(double *)(a1 + 272);
            double v196 = *(double *)(a1 + 280);
            double v197 = *(double *)(a1 + 288);
            double v198 = *(double *)(a1 + 296);
            double v199 = *(double *)(a1 + 304);
            double v200 = *(double *)(a1 + 312);
            double v201 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
            double v202 = v200 + v198 * v201 + v196 * *MEMORY[0x1E4F1DAD8];
            double v203 = v199 + v190 * v197 + v195 * v483 - (v199 + v197 * v201 + v195 * *MEMORY[0x1E4F1DAD8]);
            double v204 = v200 + v190 * v198 + v196 * v483 - v202;
            double v205 = v187 * v197;
            double v187 = v200 + v187 * v198 + v196 * v487;
            v193.f64[0] = v199 + v205 + v195 * v487;
            double v206 = 1.0 / sqrt(v204 * v204 + v203 * v203);
            v194.f64[0] = v203 * v206;
            double v190 = v204 * v206;
          }
          *(double *)v192.i64 = -v190;
          double v207 = v183 - v187;
          if (!v512)
          {
            *(double *)v192.i64 = v190;
            double v207 = v187;
          }
          v193.f64[1] = v207;
          *(float32x2_t *)&long long v208 = vcvt_f32_f64(v193);
          *(void *)&v194.f64[1] = v192.i64[0];
          *(float32x2_t *)v192.f32 = vcvt_f32_f64(v194);
          *((void *)&v208 + 1) = vnegq_f32(v192).u64[0];
          long long v536 = v208;
          *(float *)&unsigned int v209 = v184;
          *(void *)&long long v208 = v209;
          float v210 = v183;
          LODWORD(v211) = 0;
          *((float *)&v211 + 1) = v210;
          DWORD2(v558) = 0;
          *(void *)&long long v558 = v208;
          DWORD2(v559) = 0;
          *(void *)&long long v559 = v211;
          DWORD2(v560) = 1065353216;
          *(void *)&long long v560 = 0;
        }

LABEL_131:
        double v212 = -[PKMetalResourceHandler paperTextureSize](*(void *)(a1 + 192));
        CGFloat v214 = a13;
        if (*(void *)(a1 + 448))
        {
          double v215 = a8;
          double v216 = *(double *)(a1 + 456);
          double v217 = *(double *)(a1 + 464);
          double v218 = 1.0;
        }
        else
        {
          double v216 = v212;
          double v217 = v213;
          double v215 = a8;
          double v218 = 2.0;
        }
        double v219 = *(double *)(a1 + 224);
        double v220 = *(double *)(a1 + 232);
        memset(&v532, 0, sizeof(v532));
        double v221 = *(double *)a3;
        double v222 = *(double *)(a3 + 8);
        double v223 = *(double *)(a3 + 16);
        double v224 = *(double *)(a3 + 24);
        v565.tCGFloat y = 0.0;
        v565.tCGFloat x = 0.0;
        v565.double a = v221;
        v565.double b = v222;
        v565.double c = v223;
        v565.double d = v224;
        CGAffineTransformScale(&v532, &v565, 1.0 / sqrt(v222 * v222 + v221 * v221), 1.0 / sqrt(v224 * v224 + v223 * v223));
        CGAffineTransformMakeScale(&v565, v219 / v218 / v216, v220 / v218 / v217);
        CGAffineTransform v531 = v565;
        CGAffineTransform v530 = v532;
        CGAffineTransformConcat(&v565, &v531, &v530);
        CGAffineTransform v529 = v565;
        CGAffineTransformMakeTranslation(&v528, 0.0, -(*(double *)(a1 + 1104) * *(double *)(a1 + 264)) / (v217 * v218));
        CGAffineTransformConcat(&v565, &v529, &v528);
        float64x2_t v484 = *(float64x2_t *)&v565.c;
        float64x2_t v488 = *(float64x2_t *)&v565.a;
        float64x2_t v479 = *(float64x2_t *)&v565.tx;
        if (a4)
        {
          double v226 = v215;
          if (a4 > 2)
          {
            if (v39 != 2) {
              goto LABEL_388;
            }
            goto LABEL_158;
          }
        }
        else
        {
          id v227 = v513;
          int v228 = *(CGColor **)(a1 + 240);
          double v226 = v215;
          if (v228)
          {
            *(_OWORD *)&v565.double a = xmmword_1C482A9D0;
            *(_OWORD *)&v565.double c = unk_1C482A9E0;
            DKUColorGetRGBAComponents(v228, &v565);
            CGFloat v229 = v214;
            v535[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v565.a), *(float64x2_t *)&v565.c);
          }
          else
          {
            long long v230 = *(void **)(a1 + 448);
            uint64_t v231 = v230;
            CGFloat v229 = v214;
            if (!v230)
            {
              uint64_t v231 = -[PKMetalResourceHandler paperTexture](*(void *)(a1 + 192));
            }
            [v227 setFragmentTexture:v231 atIndex:2];
            if (!v230) {
          }
            }
          if (!*(void *)(a1 + 240))
          {
            DWORD2(v561) = 0;
            *(float32x2_t *)&long long v561 = vcvt_f32_f64(v488);
            DWORD2(v562) = 0;
            *(float32x2_t *)&long long v562 = vcvt_f32_f64(v484);
            DWORD2(v563) = 1065353216;
            *(float32x2_t *)&long long v563 = vcvt_f32_f64(v479);
          }
          if (!CGRectIsNull(*(CGRect *)(a1 + 320)) && !*(unsigned char *)(a1 + 960) && !*(void *)(a1 + 240))
          {
            CGFloat v444 = *(double *)(a1 + 336);
            v574.size.CGFloat height = *(CGFloat *)(a1 + 344);
            double v445 = *(double *)(a1 + 232);
            double v446 = *(double *)(a1 + 320);
            v574.origin.CGFloat y = *(CGFloat *)(a1 + 328);
            v574.origin.CGFloat x = v446;
            v574.size.CGFloat width = v444;
            CGFloat height = v574.size.height;
            double MaxY = CGRectGetMaxY(v574);
            if (v446 > 0.0
              || (double v448 = v445 - MaxY,
                  v575.origin.CGFloat x = v446,
                  v575.origin.CGFloat y = v448,
                  v575.size.CGFloat width = v444,
                  v575.size.CGFloat height = height,
                  CGFloat MaxX = CGRectGetMaxX(v575),
                  double r1 = *(double *)(a1 + 224),
                  MaxX < r1))
            {
              long long v450 = *(_OWORD *)(a3 + 16);
              v527[0] = *(_OWORD *)a3;
              v527[1] = v450;
              v527[2] = *(_OWORD *)(a3 + 32);
              v526[0] = v488;
              v526[1] = v484;
              v526[2] = v479;
              -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v527, v526, v512 ^ 1, v227, *(double *)(a1 + 1000));
              char v232 = 1;
LABEL_150:
              if (!CGRectIsNull(*(CGRect *)(a1 + 320)))
              {
                double v233 = v226;
                CGFloat v235 = *(double *)(a1 + 336);
                CGFloat v234 = *(double *)(a1 + 344);
                double v236 = *(double *)(a1 + 232);
                CGFloat v237 = *(double *)(a1 + 320);
                v572.origin.CGFloat y = *(CGFloat *)(a1 + 328);
                v572.origin.CGFloat x = v237;
                v572.size.CGFloat width = v235;
                v572.size.CGFloat height = v234;
                double v238 = CGRectGetMaxY(v572);
                v573.origin.CGFloat x = a10;
                v573.origin.CGFloat y = r2a;
                v573.size.CGFloat width = rectb;
                v573.size.CGFloat height = v214;
                BOOL IsNull = CGRectIsNull(v573);
                double v240 = v236 - v238;
                if (!IsNull)
                {
                  CGFloat v241 = v237;
                  CGFloat v242 = v235;
                  CGFloat v243 = v234;
                  v580.origin.CGFloat x = a10;
                  v580.origin.CGFloat y = r2a;
                  v580.size.CGFloat width = rectb;
                  v580.size.CGFloat height = v214;
                  *(CGRect *)(&v240 - 1) = CGRectIntersection(*(CGRect *)(&v240 - 1), v580);
                  CGFloat v237 = v244;
                  CGFloat v235 = v245;
                  CGFloat v234 = v246;
                }
                double v226 = v233;
                memset(&v565, 0, 32);
                CGFloat v247 = v237;
                CGFloat v248 = v235;
                CGFloat v249 = v234;
                if (!*(void *)&v565.c || !*(void *)&v565.d) {
                  goto LABEL_411;
                }
                v519[0] = *(_OWORD *)&v565.a;
                v519[1] = *(_OWORD *)&v565.c;
                [v513 setScissorRect:v519];
              }
              if (v39 != 2)
              {
LABEL_388:
                uint64_t v417 = *(void *)(a1 + 192);
                if (!v417 || !*(unsigned char *)(v417 + 428))
                {
                  uint64_t v418 = *(void *)(a1 + 8);
                  if (v418
                    && *(unsigned char *)(v418 + 38)
                    && (id v419 = *(id *)(v418 + 120), v420 = v419 == 0, v419, !v420))
                  {
                    v421 = *(void **)(a1 + 8);
                    if (v421) {
                      v421 = (void *)v421[15];
                    }
                  }
                  else
                  {
                    v421 = *(void **)(a1 + 40);
                    if (v421) {
                      v421 = (void *)v421[3];
                    }
                  }
                  v422 = v421;
                  [v513 setFragmentTexture:v422 atIndex:1];

                  uint64_t v417 = *(void *)(a1 + 192);
                  if (!v417) {
                    goto LABEL_415;
                  }
                }
                if (!*(unsigned char *)(v417 + 428))
                {
LABEL_415:
                  uint64_t v437 = *(void *)(a1 + 8);
                  if (v437)
                  {
                    unint64_t v438 = 0;
                    v439 = (void **)(a1 + 112);
                    do
                    {
                      if (v438 >= *(void *)(v437 + 152)) {
                        break;
                      }
                      if (*(unsigned char *)(v437 + 44)) {
                        v440 = v439 + 4;
                      }
                      else {
                        v440 = v439;
                      }
                      v441 = *v440;
                      if (v441) {
                        v441 = (void *)v441[3];
                      }
                      v442 = v441;
                      uint64_t v443 = v438 ? 7 : 6;
                      [v513 setFragmentTexture:v442 atIndex:v443];

                      ++v438;
                      uint64_t v437 = *(void *)(a1 + 8);
                      v439 += 2;
                    }
                    while (v437);
                  }
                }
                if (a7)
                {
                  v423 = *(void **)(a1 + 176);
                  if (v423) {
                    v423 = (void *)v423[3];
                  }
                  v424 = v423;
                  [v513 setFragmentTexture:v424 atIndex:3];
                }
                if (v512)
                {
                  long long v425 = *(_OWORD *)(a3 + 16);
                  *(_OWORD *)&v516.double a = *(_OWORD *)a3;
                  *(_OWORD *)&v516.double c = v425;
                  *(_OWORD *)&v516.tCGFloat x = *(_OWORD *)(a3 + 32);
                  v515.double a = 1.0;
                  v515.double b = 0.0;
                  v515.double c = 0.0;
                  v515.double d = -1.0;
                  v515.tCGFloat x = 0.0;
                  v515.tCGFloat y = 0.0;
                  CGAffineTransformConcat(&v565, &v516, &v515);
                  long long v426 = *(_OWORD *)&v565.c;
                  *(_OWORD *)a3 = *(_OWORD *)&v565.a;
                  *(_OWORD *)(a3 + 16) = v426;
                  *(_OWORD *)(a3 + 32) = *(_OWORD *)&v565.tx;
                }
                long long v551 = v427;
                long long v552 = v428;
                long long v553 = v429;
                long long v554 = v430;
                [v513 setVertexBytes:&v551 length:224 atIndex:3];
                [v513 setFragmentBytes:v535 length:112 atIndex:0];
                -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v148, v513);
                uint64_t v431 = *(void *)(a1 + 192);
                if (v431) {
                  LODWORD(v431) = *(unsigned __int8 *)(v431 + 428) != 0;
                }
                double v432 = *(double *)(a1 + 224);
                double v433 = *(double *)(a1 + 232);
                double v434 = -1.0;
                if (v431 != v512) {
                  double v434 = 1.0;
                }
                v567.double a = 2.0 / v432;
                v567.double b = 0.0;
                v567.double c = 0.0;
                v567.double d = (v434 + v434) / v433;
                v567.tCGFloat x = -1.0;
                v567.tCGFloat y = -v434;
                long long v435 = *(_OWORD *)(a1 + 288);
                *(_OWORD *)&v565.double a = *(_OWORD *)(a1 + 272);
                *(_OWORD *)&v565.double c = v435;
                *(_OWORD *)&v565.tCGFloat x = *(_OWORD *)(a1 + 304);
                *(_OWORD *)&v570.double a = COERCE_UNSIGNED_INT64(2.0 / v432);
                *(_OWORD *)&v570.double c = *(_OWORD *)&v567.c;
                *(_OWORD *)&v570.tCGFloat x = *(_OWORD *)&v567.tx;
                CGAffineTransformConcat(&v567, &v565, &v570);
                CGAffineTransform v514 = v567;
                -[PKMetalRenderer renderBrushIndicatorForStroke:withTransform:mode:](a1, v496, (long long *)&v514, a4);
LABEL_411:
                uint64_t v436 = *(void *)(a1 + 8);
                if (v436) {
                  [*(id *)(v436 + 80) popDebugGroup];
                }
LABEL_413:

                goto LABEL_414;
              }
              if (v232)
              {
LABEL_164:
                id v256 = v513;
                id v257 = *(id *)(a1 + 976);
                BOOL v258 = v257 == 0;

                if (!v258)
                {
                  __p = 0;
                  v548 = 0;
                  v550 = 0;
                  uint64_t v259 = *(void *)(a1 + 8);
                  if (v259) {
                    unint64_t v260 = -[PKMetalRenderState pipelineConfig](v259);
                  }
                  else {
                    unint64_t v260 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
                  }
                  uint64_t v261 = *(void *)(a1 + 192);
                  *(void *)&v565.double a = 8;
                  memset(&v565.b, 0, 24);
                  LODWORD(v565.tx) = v260;
                  HIDWORD(v565.tx) = WORD2(v260);
                  v476 = -[PKMetalResourceHandler namedShaderForKey:](v261, (long long *)&v565);
                  if (*(unsigned char *)(a1 + 965)) {
                    objc_msgSend(MEMORY[0x1E4FB1618], "pk_linedPaperLineColor_dark");
                  }
                  else {
                  v262 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_linedPaperLineColor_light");
                  }
                  float64x2_t v568 = (float64x2_t)xmmword_1C482A9D0;
                  float64x2_t v569 = (float64x2_t)unk_1C482A9E0;
                  id v263 = v262;
                  v478 = v148;
                  DKUColorGetRGBAComponents((CGColor *)[v263 CGColor], &v568);
                  float32x4_t v547 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v568), v569);
                  [v256 setFragmentBytes:&v547 length:16 atIndex:0];
                  v567.double a = 2.0 / v226;
                  v567.double b = 0.0;
                  v567.double c = 0.0;
                  v567.double d = -2.0 / v491;
                  *(_OWORD *)&v567.tCGFloat x = xmmword_1C48267F0;
                  long long v264 = *(_OWORD *)(a1 + 288);
                  *(_OWORD *)&v565.double a = *(_OWORD *)(a1 + 272);
                  *(_OWORD *)&v565.double c = v264;
                  *(_OWORD *)&v565.tCGFloat x = *(_OWORD *)(a1 + 304);
                  *(_OWORD *)&v570.double a = COERCE_UNSIGNED_INT64(2.0 / v226);
                  *(_OWORD *)&v570.double c = *(_OWORD *)&v567.c;
                  *(_OWORD *)&v570.tCGFloat x = xmmword_1C48267F0;
                  CGAffineTransformConcat(&v567, &v565, &v570);
                  *(_OWORD *)&v565.double a = v266;
                  *(_OWORD *)&v565.double c = v267;
                  *(_OWORD *)&v565.tCGFloat x = v268;
                  long long v566 = v269;
                  memset(&v570, 0, sizeof(v570));
                  CGAffineTransform t1 = v567;
                  t2.double a = v226 * -0.5;
                  t2.double c = 0.0;
                  t2.double b = 0.0;
                  t2.double d = v491 * -0.5;
                  t2.tCGFloat x = v226 * 0.5;
                  t2.tCGFloat y = v491 * 0.5;
                  CGAffineTransformConcat(&v570, &t1, &t2);
                  memset(&v544, 0, sizeof(v544));
                  CGAffineTransform v543 = v570;
                  CGAffineTransformInvert(&v544, &v543);
                  id v270 = *(id *)(a1 + 976);
                  [v270 lineSpacing];
                  double v272 = v271;
                  double v274 = v273;

                  id v275 = *(id *)(a1 + 976);
                  [v275 horizontalInset];
                  double v277 = v276;

                  double a = v544.a;
                  double b = v544.b;
                  double c = v544.c;
                  double v283 = v544.d;
                  tCGFloat y = v544.ty;
                  v285 = v548;
                  if ((unint64_t)(v550 - (unsigned char *)v548) >> 6 <= 0x4A)
                  {
                    v286 = __p;
                    v287 = (char *)operator new(0x12C0uLL);
                    v288 = &v287[(v286 - v285) & 0xFFFFFFFFFFFFFFF8];
                    v289 = v288;
                    if (v286 != v285)
                    {
                      v289 = &v287[(v286 - v285) & 0xFFFFFFFFFFFFFFF8];
                      do
                      {
                        uint64_t v290 = *((void *)v286 - 1);
                        v286 -= 8;
                        *((void *)v289 - 1) = v290;
                        v289 -= 8;
                      }
                      while (v286 != v285);
                    }
                    v548 = v289;
                    __p = v288;
                    v550 = v287 + 4800;
                    if (v285) {
                      operator delete(v285);
                    }
                  }
                  v480.f64[0] = ty + v283 * 0.0 + b * 0.0;
                  double v291 = ty + v491 * v283 + b * 0.0;
                  double v292 = a + c;
                  if (v274 > 1.0)
                  {
                    int64_t v293 = vcvtpd_s64_f64(v291 / v274);
                    *(double *)v278.i64 = v480.f64[0] / v274;
                    uint64_t v294 = vcvtmd_s64_f64(v480.f64[0] / v274);
                    if (v294 <= v293)
                    {
                      v278.f32[0] = v277;
                      float32x4_t v489 = v278;
                      *(double *)v278.i64 = 768.0 - v277;
                      v278.f32[0] = 768.0 - v277;
                      float32x4_t v494 = v278;
                      v295 = (char *)__p;
                      do
                      {
                        double v296 = v274 * (double)v294;
                        *(double *)v279.i64 = v570.tx + v296 * v570.c + v570.a * 0.0;
                        double v297 = v544.ty
                             + v544.d * (round(v570.ty + v296 * v570.d + v570.b * 0.0) + 1.0)
                             + v544.b * *(double *)v279.i64;
                        v279.f32[0] = v297 - v292;
                        r2double b = v279;
                        rectdouble c = __PAIR64__(v279.u32[0], v489.u32[0]);
                        if (v295 >= v550)
                        {
                          uint64_t v299 = (v295 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v299 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v300 = (v550 - (unsigned char *)v548) >> 2;
                          if (v300 <= v299 + 1) {
                            unint64_t v300 = v299 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v301 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v301 = v300;
                          }
                          if (v301) {
                            v302 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v301);
                          }
                          else {
                            v302 = 0;
                          }
                          v303 = (unint64_t *)&v302[8 * v299];
                          unint64_t *v303 = rectc;
                          v298 = v303 + 1;
                          v304 = (char *)__p;
                          v305 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v306 = *((void *)v304 - 1);
                              v304 -= 8;
                              *--v303 = v306;
                            }
                            while (v304 != v305);
                            v304 = (char *)v548;
                          }
                          v548 = v303;
                          __p = v298;
                          v550 = &v302[8 * v301];
                          if (v304) {
                            operator delete(v304);
                          }
                        }
                        else
                        {
                          *(void *)v295 = __PAIR64__(v279.u32[0], v489.u32[0]);
                          v298 = (unint64_t *)(v295 + 8);
                        }
                        __p = v298;
                        float32x4_t v308 = v494;
                        *((void *)&v307 + 1) = r2b.i64[1];
                        v308.i32[1] = r2b.i32[0];
                        if (v298 >= (unint64_t *)v550)
                        {
                          r2double c = v308;
                          uint64_t v310 = ((char *)v298 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v310 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v311 = (v550 - (unsigned char *)v548) >> 2;
                          if (v311 <= v310 + 1) {
                            unint64_t v311 = v310 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v312 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v312 = v311;
                          }
                          if (v312) {
                            v313 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v312);
                          }
                          else {
                            v313 = 0;
                          }
                          v314 = &v313[8 * v310];
                          *((void *)&v307 + 1) = r2c.i64[1];
                          *(void *)v314 = r2c.i64[0];
                          v309 = (unint64_t *)(v314 + 8);
                          v315 = (char *)__p;
                          v316 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              uint64_t v317 = *((void *)v315 - 1);
                              v315 -= 8;
                              *((void *)v314 - 1) = v317;
                              v314 -= 8;
                            }
                            while (v315 != v316);
                            v315 = (char *)v548;
                          }
                          v548 = v314;
                          __p = v309;
                          v550 = &v313[8 * v312];
                          if (v315) {
                            operator delete(v315);
                          }
                        }
                        else
                        {
                          unint64_t *v298 = v308.i64[0];
                          v309 = v298 + 1;
                        }
                        __p = v309;
                        *(double *)&long long v307 = v292 + v297;
                        *(float *)&long long v307 = v292 + v297;
                        long long v485 = v307;
                        r2double d = __PAIR64__(v307, v494.u32[0]);
                        if (v309 >= (unint64_t *)v550)
                        {
                          uint64_t v319 = ((char *)v309 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v319 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v320 = (v550 - (unsigned char *)v548) >> 2;
                          if (v320 <= v319 + 1) {
                            unint64_t v320 = v319 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v321 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v321 = v320;
                          }
                          if (v321) {
                            v322 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v321);
                          }
                          else {
                            v322 = 0;
                          }
                          v323 = (unint64_t *)&v322[8 * v319];
                          unint64_t *v323 = r2d;
                          v318 = v323 + 1;
                          v324 = (char *)__p;
                          v325 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v326 = *((void *)v324 - 1);
                              v324 -= 8;
                              *--v323 = v326;
                            }
                            while (v324 != v325);
                            v324 = (char *)v548;
                          }
                          v548 = v323;
                          __p = v318;
                          v550 = &v322[8 * v321];
                          if (v324) {
                            operator delete(v324);
                          }
                        }
                        else
                        {
                          unint64_t *v309 = __PAIR64__(v307, v494.u32[0]);
                          v318 = v309 + 1;
                        }
                        __p = v318;
                        if (v318 >= (unint64_t *)v550)
                        {
                          uint64_t v328 = ((char *)v318 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v328 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v329 = (v550 - (unsigned char *)v548) >> 2;
                          if (v329 <= v328 + 1) {
                            unint64_t v329 = v328 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v330 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v330 = v329;
                          }
                          if (v330) {
                            v331 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v330);
                          }
                          else {
                            v331 = 0;
                          }
                          v332 = (unint64_t *)&v331[8 * v328];
                          unint64_t *v332 = rectc;
                          v327 = v332 + 1;
                          v333 = (char *)__p;
                          v334 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v335 = *((void *)v333 - 1);
                              v333 -= 8;
                              *--v332 = v335;
                            }
                            while (v333 != v334);
                            v333 = (char *)v548;
                          }
                          v548 = v332;
                          __p = v327;
                          v550 = &v331[8 * v330];
                          if (v333) {
                            operator delete(v333);
                          }
                        }
                        else
                        {
                          unint64_t *v318 = rectc;
                          v327 = v318 + 1;
                        }
                        __p = v327;
                        if (v327 >= (unint64_t *)v550)
                        {
                          uint64_t v337 = ((char *)v327 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v337 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v338 = (v550 - (unsigned char *)v548) >> 2;
                          if (v338 <= v337 + 1) {
                            unint64_t v338 = v337 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v339 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v339 = v338;
                          }
                          if (v339) {
                            v340 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v339);
                          }
                          else {
                            v340 = 0;
                          }
                          v341 = (unint64_t *)&v340[8 * v337];
                          unint64_t *v341 = r2d;
                          v336 = (char *)(v341 + 1);
                          v342 = (char *)__p;
                          v343 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v344 = *((void *)v342 - 1);
                              v342 -= 8;
                              *--v341 = v344;
                            }
                            while (v342 != v343);
                            v342 = (char *)v548;
                          }
                          v548 = v341;
                          __p = v336;
                          v550 = &v340[8 * v339];
                          if (v342) {
                            operator delete(v342);
                          }
                        }
                        else
                        {
                          unint64_t *v327 = r2d;
                          v336 = (char *)(v327 + 1);
                        }
                        __p = v336;
                        v278.i64[1] = *((void *)&v485 + 1);
                        float32x4_t v279 = v489;
                        v279.i32[1] = v485;
                        if (v336 >= v550)
                        {
                          rectdouble d = v279;
                          uint64_t v345 = (v336 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v345 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v346 = (v550 - (unsigned char *)v548) >> 2;
                          if (v346 <= v345 + 1) {
                            unint64_t v346 = v345 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v347 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v347 = v346;
                          }
                          if (v347) {
                            v348 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v347);
                          }
                          else {
                            v348 = 0;
                          }
                          v349 = &v348[8 * v345];
                          v278.i64[1] = rectd.i64[1];
                          *(void *)v349 = rectd.i64[0];
                          v295 = v349 + 8;
                          v350 = (char *)__p;
                          v351 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              uint64_t v352 = *((void *)v350 - 1);
                              v350 -= 8;
                              *((void *)v349 - 1) = v352;
                              v349 -= 8;
                            }
                            while (v350 != v351);
                            v350 = (char *)v548;
                          }
                          v548 = v349;
                          __p = v295;
                          v550 = &v348[8 * v347];
                          if (v350) {
                            operator delete(v350);
                          }
                        }
                        else
                        {
                          *(void *)v336 = v279.i64[0];
                          v295 = v336 + 8;
                        }
                        __p = v295;
                        _ZF = v294++ == v293;
                      }
                      while (!_ZF);
                    }
                  }
                  if (v272 > 1.0)
                  {
                    uint64_t v353 = (uint64_t)((v277 * -2.0 + 768.0) / v272);
                    if ((v353 & 0x8000000000000000) == 0)
                    {
                      uint64_t v354 = 0;
                      v278.i32[1] = HIDWORD(v480.f64[0]);
                      v278.f32[0] = v480.f64[0];
                      int v486 = v278.i32[0];
                      v278.f32[0] = v291;
                      float32x4_t v490 = v278;
                      v355 = (char *)__p;
                      do
                      {
                        double v356 = v277 + v272 * (double)v354;
                        *(double *)v279.i64 = round(v570.tx + v570.c * 0.0 + v570.a * v356);
                        double v357 = v544.tx
                             + (v570.ty + v570.d * 0.0 + v570.b * v356) * v544.c
                             + v544.a * *(double *)v279.i64;
                        v279.f32[0] = v357 - v292;
                        float32x4_t recte = v279;
                        v279.i32[1] = v486;
                        unint64_t r2e = v279.i64[0];
                        if (v355 >= v550)
                        {
                          uint64_t v359 = (v355 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v359 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v360 = (v550 - (unsigned char *)v548) >> 2;
                          if (v360 <= v359 + 1) {
                            unint64_t v360 = v359 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v361 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v361 = v360;
                          }
                          if (v361) {
                            v362 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v361);
                          }
                          else {
                            v362 = 0;
                          }
                          v363 = &v362[8 * v359];
                          *(void *)v363 = r2e;
                          v358 = v363 + 8;
                          v364 = (char *)__p;
                          v365 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              uint64_t v366 = *((void *)v364 - 1);
                              v364 -= 8;
                              *((void *)v363 - 1) = v366;
                              v363 -= 8;
                            }
                            while (v364 != v365);
                            v364 = (char *)v548;
                          }
                          v548 = v363;
                          __p = v358;
                          v550 = &v362[8 * v361];
                          if (v364) {
                            operator delete(v364);
                          }
                        }
                        else
                        {
                          *(void *)v355 = v279.i64[0];
                          v358 = v355 + 8;
                        }
                        __p = v358;
                        v367.i64[1] = v490.i64[1];
                        float32x4_t v368 = recte;
                        v368.i32[1] = v490.i32[0];
                        if (v358 >= v550)
                        {
                          float32x4_t rectf = v368;
                          uint64_t v370 = (v358 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v370 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v371 = (v550 - (unsigned char *)v548) >> 2;
                          if (v371 <= v370 + 1) {
                            unint64_t v371 = v370 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v372 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v372 = v371;
                          }
                          if (v372) {
                            v373 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v372);
                          }
                          else {
                            v373 = 0;
                          }
                          v374 = &v373[8 * v370];
                          v367.i64[1] = rectf.i64[1];
                          *(void *)v374 = rectf.i64[0];
                          v369 = (unint64_t *)(v374 + 8);
                          v375 = (char *)__p;
                          v376 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              uint64_t v377 = *((void *)v375 - 1);
                              v375 -= 8;
                              *((void *)v374 - 1) = v377;
                              v374 -= 8;
                            }
                            while (v375 != v376);
                            v375 = (char *)v548;
                          }
                          v548 = v374;
                          __p = v369;
                          v550 = &v373[8 * v372];
                          if (v375) {
                            operator delete(v375);
                          }
                        }
                        else
                        {
                          *(void *)v358 = v368.i64[0];
                          v369 = (unint64_t *)(v358 + 8);
                        }
                        __p = v369;
                        *(double *)v367.i64 = v292 + v357;
                        v367.f32[0] = v292 + v357;
                        float32x4_t rectg = v367;
                        unint64_t v495 = __PAIR64__(v490.u32[0], v367.u32[0]);
                        if (v369 >= (unint64_t *)v550)
                        {
                          uint64_t v379 = ((char *)v369 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v379 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v380 = (v550 - (unsigned char *)v548) >> 2;
                          if (v380 <= v379 + 1) {
                            unint64_t v380 = v379 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v381 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v381 = v380;
                          }
                          if (v381) {
                            v382 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v381);
                          }
                          else {
                            v382 = 0;
                          }
                          v383 = (unint64_t *)&v382[8 * v379];
                          unint64_t *v383 = v495;
                          v378 = v383 + 1;
                          v384 = (char *)__p;
                          v385 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v386 = *((void *)v384 - 1);
                              v384 -= 8;
                              *--v383 = v386;
                            }
                            while (v384 != v385);
                            v384 = (char *)v548;
                          }
                          v548 = v383;
                          __p = v378;
                          v550 = &v382[8 * v381];
                          if (v384) {
                            operator delete(v384);
                          }
                        }
                        else
                        {
                          unint64_t *v369 = __PAIR64__(v490.u32[0], v367.u32[0]);
                          v378 = v369 + 1;
                        }
                        __p = v378;
                        if (v378 >= (unint64_t *)v550)
                        {
                          uint64_t v388 = ((char *)v378 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v388 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v389 = (v550 - (unsigned char *)v548) >> 2;
                          if (v389 <= v388 + 1) {
                            unint64_t v389 = v388 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v390 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v390 = v389;
                          }
                          if (v390) {
                            v391 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v390);
                          }
                          else {
                            v391 = 0;
                          }
                          v392 = (unint64_t *)&v391[8 * v388];
                          unint64_t *v392 = r2e;
                          v387 = v392 + 1;
                          v393 = (char *)__p;
                          v394 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v395 = *((void *)v393 - 1);
                              v393 -= 8;
                              *--v392 = v395;
                            }
                            while (v393 != v394);
                            v393 = (char *)v548;
                          }
                          v548 = v392;
                          __p = v387;
                          v550 = &v391[8 * v390];
                          if (v393) {
                            operator delete(v393);
                          }
                        }
                        else
                        {
                          unint64_t *v378 = r2e;
                          v387 = v378 + 1;
                        }
                        __p = v387;
                        if (v387 >= (unint64_t *)v550)
                        {
                          uint64_t v397 = ((char *)v387 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v397 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v398 = (v550 - (unsigned char *)v548) >> 2;
                          if (v398 <= v397 + 1) {
                            unint64_t v398 = v397 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v399 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v399 = v398;
                          }
                          if (v399) {
                            v400 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v399);
                          }
                          else {
                            v400 = 0;
                          }
                          v401 = (unint64_t *)&v400[8 * v397];
                          unint64_t *v401 = v495;
                          v396 = (char *)(v401 + 1);
                          v402 = (char *)__p;
                          v403 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              unint64_t v404 = *((void *)v402 - 1);
                              v402 -= 8;
                              *--v401 = v404;
                            }
                            while (v402 != v403);
                            v402 = (char *)v548;
                          }
                          v548 = v401;
                          __p = v396;
                          v550 = &v400[8 * v399];
                          if (v402) {
                            operator delete(v402);
                          }
                        }
                        else
                        {
                          unint64_t *v387 = v495;
                          v396 = (char *)(v387 + 1);
                        }
                        __p = v396;
                        float32x4_t v279 = rectg;
                        v279.i32[1] = v486;
                        if (v396 >= v550)
                        {
                          uint64_t recth = v279.i64[0];
                          uint64_t v405 = (v396 - (unsigned char *)v548) >> 3;
                          if ((unint64_t)(v405 + 1) >> 61) {
                            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                          }
                          unint64_t v406 = (v550 - (unsigned char *)v548) >> 2;
                          if (v406 <= v405 + 1) {
                            unint64_t v406 = v405 + 1;
                          }
                          if ((unint64_t)(v550 - (unsigned char *)v548) >= 0x7FFFFFFFFFFFFFF8) {
                            unint64_t v407 = 0x1FFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v407 = v406;
                          }
                          if (v407) {
                            v408 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v550, v407);
                          }
                          else {
                            v408 = 0;
                          }
                          v409 = &v408[8 * v405];
                          *(void *)v409 = recth;
                          v355 = v409 + 8;
                          v410 = (char *)__p;
                          v411 = (char *)v548;
                          if (__p != v548)
                          {
                            do
                            {
                              uint64_t v412 = *((void *)v410 - 1);
                              v410 -= 8;
                              *((void *)v409 - 1) = v412;
                              v409 -= 8;
                            }
                            while (v410 != v411);
                            v410 = (char *)v548;
                          }
                          v548 = v409;
                          __p = v355;
                          v550 = &v408[8 * v407];
                          if (v410) {
                            operator delete(v410);
                          }
                        }
                        else
                        {
                          *(void *)v396 = v279.i64[0];
                          v355 = v396 + 8;
                        }
                        __p = v355;
                        _ZF = v354++ == v353;
                      }
                      while (!_ZF);
                    }
                  }
                  long long v148 = v478;
                  if (__p != v548)
                  {
                    if (v476) {
                      v413 = (void *)v476[3];
                    }
                    else {
                      v413 = 0;
                    }
                    id v414 = v413;
                    [v256 setRenderPipelineState:v414];

                    [v256 setVertexBytes:v548 length:(unsigned char *)__p - (unsigned char *)v548 atIndex:0];
                    [v256 setVertexBytes:&v565 length:64 atIndex:1];
                    [v256 drawPrimitives:3 vertexStart:0 vertexCount:((unsigned char *)__p - (unsigned char *)v548) >> 3];
                  }

                  if (v548)
                  {
                    __p = v548;
                    operator delete(v548);
                  }
                }

                uint64_t v415 = *(void *)(a1 + 8);
                if (v415) {
                  [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v415 + 80)];
                }
                uint64_t v416 = -[PKMetalShader shaderWithBlendMode:](v148, 2);

                long long v148 = (void *)v416;
                goto LABEL_388;
              }
LABEL_158:
              if (*(void *)(a1 + 240))
              {
                id v250 = v513;
                *(_OWORD *)&v570.double a = xmmword_1C482A9D0;
                *(_OWORD *)&v570.double c = unk_1C482A9E0;
                DKUColorGetRGBAComponents(*(CGColor **)(a1 + 240), &v570);
                *(float32x4_t *)&v567.double a = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v570.a), *(float64x2_t *)&v570.c);
                -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v250);
                [v250 setFragmentBytes:&v567 length:16 atIndex:0];
                uint64_t v251 = *(void *)(a1 + 8);
                if (v251) {
                  unint64_t v252 = -[PKMetalRenderState pipelineConfig](v251);
                }
                else {
                  unint64_t v252 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
                }
                uint64_t v254 = *(void *)(a1 + 192);
                *(void *)&v565.double a = 12;
                memset((char *)&v565.b + 4, 0, 20);
                LODWORD(v565.b) = 3;
                LODWORD(v565.tx) = v252;
                HIDWORD(v565.tx) = WORD2(v252);
                v255 = -[PKMetalResourceHandler namedShaderForKey:](v254, (long long *)&v565);
                -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v255, v250);
              }
              else
              {
                long long v253 = *(_OWORD *)(a3 + 16);
                v518[0] = *(_OWORD *)a3;
                v518[1] = v253;
                v518[2] = *(_OWORD *)(a3 + 32);
                v517[0] = v488;
                v517[1] = v484;
                v517[2] = v479;
                -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v518, v517, v512 ^ 1, v513, *(double *)(a1 + 1000));
              }
              goto LABEL_164;
            }
            if (v448 > 0.0)
            {
              v576.origin.CGFloat x = a10;
              v576.origin.CGFloat y = r2a;
              v576.size.CGFloat width = rectb;
              v576.size.CGFloat height = v229;
              BOOL v455 = CGRectIsNull(v576);
              uint64_t v456 = 0;
              uint64_t v457 = 0;
              double v458 = r1;
              double v459 = v448;
              if (!v455)
              {
                double v460 = r1;
                double v461 = v448;
                v581.origin.CGFloat x = a10;
                v581.origin.CGFloat y = r2a;
                v581.size.CGFloat width = rectb;
                v581.size.CGFloat height = v229;
                *(CGRect *)&uint64_t v456 = CGRectIntersection(*(CGRect *)&v456, v581);
              }
              memset(&v565, 0, 32);
              if (*(void *)&v565.c)
              {
                if (*(void *)&v565.d)
                {
                  v525[0] = *(_OWORD *)&v565.a;
                  v525[1] = *(_OWORD *)&v565.c;
                  [v227 setScissorRect:v525];
                  if (!*(void *)(a1 + 240))
                  {
                    long long v462 = *(_OWORD *)(a3 + 16);
                    v524[0] = *(_OWORD *)a3;
                    v524[1] = v462;
                    v524[2] = *(_OWORD *)(a3 + 32);
                    v523[0] = v488;
                    v523[1] = v484;
                    v523[2] = v479;
                    -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v524, v523, v512 ^ 1, v227, *(double *)(a1 + 1000));
                  }
                }
              }
            }
            v577.origin.CGFloat x = v446;
            v577.origin.CGFloat y = v448;
            v577.size.CGFloat width = v444;
            v577.size.CGFloat height = height;
            if (CGRectGetMaxY(v577) < *(double *)(a1 + 232))
            {
              v578.origin.CGFloat x = v446;
              v578.origin.CGFloat y = v448;
              v578.size.CGFloat width = v444;
              v578.size.CGFloat height = height;
              double v463 = CGRectGetMaxY(v578);
              double v464 = *(double *)(a1 + 232);
              v579.origin.CGFloat x = a10;
              v579.origin.CGFloat y = r2a;
              v579.size.CGFloat width = rectb;
              v579.size.CGFloat height = v229;
              BOOL v465 = CGRectIsNull(v579);
              double v466 = v464 - v463;
              uint64_t v467 = 0;
              if (!v465)
              {
                double v468 = v463;
                double v469 = r1;
                v582.origin.CGFloat x = a10;
                v582.origin.CGFloat y = r2a;
                v582.size.CGFloat width = rectb;
                v582.size.CGFloat height = v229;
                *(CGRect *)&uint64_t v467 = CGRectIntersection(*(CGRect *)&v467, v582);
                double r1 = v470;
                double v463 = v471;
              }
              memset(&v565, 0, 32);
              double v472 = v463;
              double v473 = r1;
              if (*(void *)&v565.c && *(void *)&v565.d)
              {
                v522[0] = *(_OWORD *)&v565.a;
                v522[1] = *(_OWORD *)&v565.c;
                [v227 setScissorRect:v522];
                long long v474 = *(_OWORD *)(a3 + 16);
                v521[0] = *(_OWORD *)a3;
                v521[1] = v474;
                v521[2] = *(_OWORD *)(a3 + 32);
                v520[0] = v488;
                v520[1] = v484;
                v520[2] = v479;
                -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v521, v520, v512 ^ 1, v227, *(double *)(a1 + 1000));
              }
            }
          }
        }
        char v232 = 0;
        goto LABEL_150;
      }
      char v142 = 0;
      unint64_t v147 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
    }
    long long v148 = -[PKMetalResourceHandler compositePaperShaderWithMode:colorAttachmentIndex:secondaryPaintEnabled:pipelineConfig:](*(void **)(a1 + 192), v39, v38, v142, v147 & 0xFFFFFFFFFFFFLL);
    goto LABEL_131;
  }
  uint64_t v25 = v24;
  long long v26 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&v534.double a = *(_OWORD *)a3;
  *(_OWORD *)&v534.double c = v26;
  *(_OWORD *)&v534.tCGFloat x = *(_OWORD *)(a3 + 32);
  id v27 = v23;
  id v28 = v25;
  long long v563 = 0u;
  long long v562 = 0u;
  long long v561 = 0u;
  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  long long v556 = 0u;
  long long v555 = 0u;
  long long v554 = 0u;
  long long v553 = 0u;
  long long v552 = 0u;
  long long v551 = 0u;
  int v542 = 1065353216;
  char v564 = a5;
  float32x2_t v29 = vcvt_f32_f64(*MEMORY[0x1E4F1DAB8]);
  float32x2_t v30 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16));
  float32x2_t v31 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32));
  DWORD2(v555) = 0;
  *(float32x2_t *)&long long v555 = v29;
  DWORD2(v556) = 0;
  *(float32x2_t *)&long long v556 = v30;
  DWORD2(v557) = 1065353216;
  *(float32x2_t *)&long long v557 = v31;
  uint64_t v32 = *(void *)(a1 + 8);
  if (v32)
  {
    char v33 = *(void *)(v32 + 152) > 1uLL;
    if (v27) {
      goto LABEL_4;
    }
    uint64_t v40 = *(void *)(v32 + 128);
    unint64_t v41 = -[PKMetalRenderState pipelineConfig](v32);
  }
  else
  {
    if (v27)
    {
      char v33 = 0;
LABEL_4:
      uint64_t v34 = [v27 ink];
      char r2 = v33;
      -[PKMetalRenderer colorForStroke:](a1, v27);
      id v35 = objc_claimAutoreleasedReturnValue();
      double v36 = (CGColor *)[v35 CGColor];

      *(_OWORD *)&v570.double a = xmmword_1C482A9D0;
      *(_OWORD *)&v570.double c = unk_1C482A9E0;
      if (*(unsigned char *)(a1 + 965))
      {
        *(_OWORD *)&v567.double a = xmmword_1C482A9D0;
        *(_OWORD *)&v567.double c = unk_1C482A9E0;
        DKUColorGetRGBAComponents(v36, &v567);
        *(_OWORD *)&v565.double a = __const_DKUTransformColorFromRGBA_hsla;
        *(_OWORD *)&v565.double c = unk_1C482B3D8;
        DKUConvertsRGBToHSL((uint64_t)&v567, (uint64_t)&v565);
        v565.double c = 1.0 - v565.c;
        DKUConvertHSLToSRGB((uint64_t)&v565, (uint64_t)&v570);
      }
      else
      {
        DKUColorGetRGBAComponents(v36, &v570);
      }
      double v44 = v570.d;
      long long v45 = [v34 behavior];
      if ((unint64_t)[v45 version] <= 2)
      {
        CGAffineTransform v46 = [v34 behavior];
        uint64_t v47 = [v46 renderingDescriptor];
        if ([v47 blendMode] == 1)
        {
        }
        else
        {
          CGAffineTransform v48 = [v34 behavior];
          CGAffineTransform v49 = [v48 renderingDescriptor];
          BOOL v50 = [v49 blendMode] == 3;

          if (!v50)
          {
LABEL_20:
            CGAffineTransform v52 = [v34 behavior];
            CGAffineTransform v53 = [v52 renderingDescriptor];
            BOOL v54 = [v53 blendMode] == 0;

            *(float32x2_t *)&long long v55 = vcvt_f32_f64(*(float64x2_t *)&v570.a);
            *(float *)&unsigned int v56 = v570.c;
            *((void *)&v55 + 1) = __PAIR64__(1.0, v56);
            v535[0] = v55;
            float v57 = v44;
            if (v54) {
              float v57 = 1.0;
            }
            int v537 = LODWORD(v57);
            CGAffineTransform v58 = [v27 _ink];
            [v58 _sixChannelAddColor];
            float32x4_t v492 = v59;

            CGRect v60 = [v27 _ink];
            [v60 _sixChannelMultiplyColor];
            float32x4_t rect = v61;

            if (-[PKMetalRenderer shouldRenderDebugColorForStroke:](a1, v27))
            {
              CGRect v62 = [v27 ink];
              uint64_t v63 = [v62 behavior];
              long long v64 = [v63 renderingDescriptor];
              BOOL v65 = [v64 blendMode] == 1;

              if (v65)
              {
                v66.i64[0] = 0;
                v66.i32[2] = 0;
                v66.i32[3] = v492.i32[3];
                v67.i64[0] = 1065353216;
                v67.i32[2] = 0;
                v67.i32[3] = rect.i32[3];
                float32x4_t rect = v67;
              }
              else
              {
                v66.i64[0] = 1065353216;
                v66.i32[2] = 0;
                v66.i32[3] = v492.i32[3];
              }
              float32x4_t v68 = v66;
            }
            else
            {
              float32x4_t v68 = v492;
            }
            v69.i64[0] = v68.i64[0];
            float32x4_t v540 = v68;
            float32x4_t v541 = rect;
            uint64_t v70 = *(void *)(a1 + 8);
            if (v70 && *(void *)(v70 + 136) == 1 && !*(unsigned char *)(a1 + 488))
            {
              int v542 = 0;
              float32x4_t v69 = vaddq_f32(rect, v68);
              float v71 = v69.f32[3];
              if (v69.f32[3] < rect.f32[3]) {
                float v71 = rect.f32[3];
              }
              v69.f32[3] = v71;
              __asm { FMOV            V1.4S, #1.0 }
              float32x4_t v540 = v69;
              float32x4_t v541 = _Q1;
            }
            CGRect v77 = objc_msgSend(v27, "_clipPlane", *(double *)v69.i64);
            CGRect v78 = v77;
            if (v77)
            {
              double v80 = *(double *)(a1 + 224);
              double v79 = *(double *)(a1 + 232);
              [v77 origin];
              rectdouble a = v81;
              double v83 = v82;
              [v78 normal];
              double v493 = v84;
              double v86 = v85;
              long long v87 = *(_OWORD *)(a1 + 288);
              *(_OWORD *)&v567.double a = *(_OWORD *)(a1 + 272);
              *(_OWORD *)&v567.double c = v87;
              *(_OWORD *)&v567.tCGFloat x = *(_OWORD *)(a1 + 304);
              if (CGAffineTransformIsIdentity(&v567))
              {
                v89.f64[0] = recta;
                v90.f64[0] = v493;
              }
              else
              {
                double v91 = *(double *)(a1 + 272);
                double v92 = *(double *)(a1 + 280);
                double v93 = *(double *)(a1 + 288);
                double v94 = *(double *)(a1 + 296);
                double v95 = *(double *)(a1 + 304);
                double v96 = *(double *)(a1 + 312);
                double v97 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                double v98 = v96 + v94 * v97 + v92 * *MEMORY[0x1E4F1DAD8];
                double v99 = v95 + v86 * v93 + v91 * v493 - (v95 + v93 * v97 + v91 * *MEMORY[0x1E4F1DAD8]);
                double v100 = v96 + v86 * v94 + v92 * v493 - v98;
                double v101 = v83 * v93;
                double v83 = v96 + v83 * v94 + v92 * recta;
                v89.f64[0] = v95 + v101 + v91 * recta;
                double v102 = 1.0 / sqrt(v100 * v100 + v99 * v99);
                v90.f64[0] = v99 * v102;
                double v86 = v100 * v102;
              }
              *(double *)v88.i64 = -v86;
              double v103 = v79 - v83;
              if (!v512)
              {
                *(double *)v88.i64 = v86;
                double v103 = v83;
              }
              v89.f64[1] = v103;
              *(float32x2_t *)&long long v104 = vcvt_f32_f64(v89);
              *(void *)&v90.f64[1] = v88.i64[0];
              *(float32x2_t *)v88.f32 = vcvt_f32_f64(v90);
              *((void *)&v104 + 1) = vnegq_f32(v88).u64[0];
              long long v536 = v104;
              *(float *)&unsigned int v105 = v80;
              *(void *)&long long v104 = v105;
              float v106 = v79;
              LODWORD(v107) = 0;
              *((float *)&v107 + 1) = v106;
              DWORD2(v558) = 0;
              *(void *)&long long v558 = v104;
              DWORD2(v559) = 0;
              *(void *)&long long v559 = v107;
              DWORD2(v560) = 1065353216;
              *(void *)&long long v560 = 0;
            }
            uint64_t v108 = [v27 ink];
            char v109 = [v108 _isEraserInk];

            uint64_t v110 = *(void *)(a1 + 192);
            uint64_t v111 = *(void *)(a1 + 8);
            if (v111)
            {
              uint64_t v112 = *(void *)(v111 + 128);
              uint64_t v113 = *(void *)(v111 + 136);
              unint64_t v114 = -[PKMetalRenderState pipelineConfig](v111);
            }
            else
            {
              uint64_t v112 = 0;
              uint64_t v113 = 0;
              unint64_t v114 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
            }
            uint64_t v43 = [(PKMetalResourceHandler *)v110 sixChannelShaderWithMode:v78 != 0 clipping:v109 erase:*(unsigned char *)(a1 + 966) bitmapEraserMask:0 snapshotImage:a7 renderMask:r2 secondaryPaintEnabled:v112 colorAttachmentIndex:v114 pipelineConfig:(v114 & 0xFFFFFFFFFFFFLL) >> 32];

            goto LABEL_44;
          }
        }
        long long v45 = [v34 behavior];
        [v45 blendAlpha];
        double v44 = v51;
      }

      goto LABEL_20;
    }
    uint64_t v40 = 0;
    char v33 = 0;
    unint64_t v41 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
  }
  uint64_t v43 = [(PKMetalResourceHandler *)*(void *)(a1 + 192) sixChannelShaderWithMode:0 clipping:0 erase:0 bitmapEraserMask:0 snapshotImage:0 renderMask:v33 secondaryPaintEnabled:v40 colorAttachmentIndex:v41 pipelineConfig:(v41 & 0xFFFFFFFFFFFFLL) >> 32];
LABEL_44:
  uint64_t v115 = *(void *)(a1 + 192);
  if (!v115 || !*(unsigned char *)(v115 + 428))
  {
    unint64_t v116 = *(void **)(a1 + 40);
    if (v116) {
      unint64_t v116 = (void *)v116[3];
    }
    uint64_t v117 = v116;
    [v28 setFragmentTexture:v117 atIndex:1];

    uint64_t v118 = *(void *)(a1 + 8);
    if (v118)
    {
      unint64_t v119 = 0;
      long long v120 = (void **)(a1 + 112);
      while (v119 < *(void *)(v118 + 152))
      {
        if (*(unsigned char *)(v118 + 44)) {
          uint64_t v121 = v120 + 4;
        }
        else {
          uint64_t v121 = v120;
        }
        uint64_t v122 = *v121;
        if (v122) {
          uint64_t v122 = (void *)v122[3];
        }
        uint64_t v123 = v122;
        if (v119) {
          uint64_t v124 = 7;
        }
        else {
          uint64_t v124 = 6;
        }
        [v28 setFragmentTexture:v123 atIndex:v124];

        ++v119;
        uint64_t v118 = *(void *)(a1 + 8);
        v120 += 2;
        if (!v118) {
          goto LABEL_65;
        }
      }
      if (*(void *)(v118 + 136) == 3)
      {
        uint64_t v125 = *(void **)(a1 + 56);
        if (v125) {
          uint64_t v125 = (void *)v125[3];
        }
        v126 = v125;
        [v28 setFragmentTexture:v126 atIndex:5];
      }
    }
  }
LABEL_65:
  if (a7)
  {
    uint64_t v127 = *(void **)(a1 + 176);
    if (v127) {
      uint64_t v127 = (void *)v127[3];
    }
    BOOL v128 = v127;
    [v28 setFragmentTexture:v128 atIndex:3];
  }
  if (v512)
  {
    CGAffineTransform t1 = v534;
    t2.double a = 1.0;
    t2.double b = 0.0;
    t2.double c = 0.0;
    t2.double d = -1.0;
    t2.tCGFloat y = 0.0;
    t2.tCGFloat x = 0.0;
    CGAffineTransformConcat(&v534, &t1, &t2);
  }
  long long v551 = v129;
  long long v552 = v130;
  long long v553 = v131;
  long long v554 = v132;
  [v28 setVertexBytes:&v551 length:224 atIndex:3];
  [v28 setFragmentBytes:v535 length:112 atIndex:0];
  -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v43, v28);
  uint64_t v133 = *(void *)(a1 + 192);
  if (v133) {
    LODWORD(v133) = *(unsigned __int8 *)(v133 + 428) != 0;
  }
  double v134 = *(double *)(a1 + 224);
  double v135 = *(double *)(a1 + 232);
  double v136 = -1.0;
  if (v133 != v512) {
    double v136 = 1.0;
  }
  v544.double a = 2.0 / v134;
  v544.double b = 0.0;
  v544.double c = 0.0;
  v544.double d = (v136 + v136) / v135;
  v544.tCGFloat x = -1.0;
  v544.tCGFloat y = -v136;
  long long v137 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&v565.double a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&v565.double c = v137;
  *(_OWORD *)&v565.tCGFloat x = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&v570.double a = COERCE_UNSIGNED_INT64(2.0 / v134);
  *(_OWORD *)&v570.double c = *(_OWORD *)&v544.c;
  *(_OWORD *)&v570.tCGFloat x = *(_OWORD *)&v544.tx;
  CGAffineTransformConcat(&v544, &v565, &v570);
  CGAffineTransform v565 = v544;
  -[PKMetalRenderer renderBrushIndicatorForStroke:withTransform:mode:](a1, v27, (long long *)&v565, a4);

LABEL_414:
}

- (void)eraseShaderForAttachmentIndex:(void *)a1
{
  if (a1)
  {
    char v4 = a1;
    uint64_t v5 = a1[1];
    if (v5) {
      unint64_t v6 = -[PKMetalRenderState pipelineConfig](v5);
    }
    else {
      unint64_t v6 = *((unsigned int *)v4 + 198) | ((unint64_t)*((unsigned __int16 *)v4 + 398) << 32);
    }
    uint64_t v7 = v4[24];
    uint64_t v9 = 11;
    int v10 = a2;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    int v13 = 0;
    int v14 = v6;
    __int16 v15 = WORD2(v6);
    __int16 v16 = 0;
    a1 = -[PKMetalResourceHandler namedShaderForKey:](v7, (long long *)&v9);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)renderFullscreenQuadWithShader:(void *)a3 renderEncoder:
{
  uint64_t v11 = a2;
  id v5 = a3;
  if (a1)
  {
    -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"renderFullscreenQuadWithShader");
    unint64_t v6 = v11 ? (void *)v11[3] : 0;
    id v7 = v6;
    [v5 setRenderPipelineState:v7];

    CGFloat v8 = -[PKMetalResourceHandler cachedQuadVertexBuffer](*(void *)(a1 + 192));
    [v5 setVertexBuffer:v8 offset:0 atIndex:0];

    uint64_t v9 = -[PKMetalResourceHandler cachedQuadTexCoordBuffer](*(void *)(a1 + 192));
    [v5 setVertexBuffer:v9 offset:0 atIndex:1];

    [v5 drawPrimitives:4 vertexStart:0 vertexCount:4];
    +[PKMetalRenderState renderTargetBarrierForRenderEncoder:v5];
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10) {
      [*(id *)(v10 + 80) popDebugGroup];
    }
  }
}

- (id)renderCacheItemForStroke:(uint64_t)a3 bsplineFilter:(void *)a4 purgeableResources:(void *)a5 strokeRenderCache:
{
  id v9 = a4;
  uint64_t v10 = a5;
  id v11 = *(id *)(a2 + 80);
  uint64_t v12 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80));
  int v13 = [v11 _strokeDataUUID];
  int v14 = -[PKLRUCache objectForKey:scaleFactor:](v10, v13, v12);

  if (v14)
  {
    __int16 v15 = [v11 ink];
    if ([v14 isCompatibleWithInk:v15 renderZoomFactor:v12])
    {
      char v16 = [v14 lockPurgeableResourcesAddToSet:v9];

      if (v16) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    unint64_t v17 = [v11 _strokeDataUUID];
    -[PKLRUCache removeObjectForKey:scaleFactor:]((uint64_t)v10, v17, v12);
  }
  memset(__p, 0, sizeof(__p));
  if (-[PKMetalRenderer generateBSplineInComputeForStroke:](a1, v11))
  {
    unint64_t v18 = [v11 path];
    uint64_t v19 = [v11 ink];
    PKBSplineFilter::copyPointsFromStroke(a3, v18, v19, (char **)__p);
  }
  else
  {
    unint64_t v18 = [v11 path];
    uint64_t v19 = [v11 ink];
    PKBSplineFilter::splineFromStroke((id *)a3, v18, v19, -1.0);
  }

  int v14 = [(PKMetalRenderer *)a1 generateCacheForStroke:*(void *)(a3 + 80) points:*(void *)(a3 + 88) segmentSteps:__p];
  [v14 lockPurgeableResourcesAddToSet:v9];
  if (__p[0]) {
    operator delete(__p[0]);
  }
LABEL_12:

  return v14;
}

- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 clipRect:(CGFloat)a5 renderState:(CGFloat)a6
{
  id v19 = a2;
  id v15 = a3;
  id v16 = a4;
  if (a1)
  {
    v21.origin.CGFloat x = a5;
    v21.origin.CGFloat y = a6;
    v21.size.CGFloat width = a7;
    v21.size.CGFloat height = a8;
    if (CGRectIsNull(v21))
    {
      a7 = (double)(unint64_t)[v19 width];
      a8 = (double)(unint64_t)[v19 height];
      a5 = 0.0;
      a6 = 0.0;
    }
    double v17 = -[PKMetalFramebuffer size]((uint64_t)v15);
    -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v19, v15, v16, 0, a5, a6, a7, a8, 0.0, 0.0, v17, v18);
  }
}

- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 sourceRect:(uint64_t)a5 destinationRect:(CGFloat)a6 renderState:(CGFloat)a7 blendMode:(CGFloat)a8
{
  id v67 = a2;
  uint64_t v25 = a3;
  long long v26 = a4;
  if (a1)
  {
    if (qword_1EB3C6000 != -1) {
      dispatch_once(&qword_1EB3C6000, &__block_literal_global_53);
    }
    float32x4_t v66 = v25;
    if (_MergedGlobals_140)
    {
      if (v26 && (id v27 = *((id *)v26 + 7)) != 0 || (id v27 = 0, a8 != a12) || a9 != a13)
      {
      }
      else if (*(void **)(a1 + 40) != v25 || !*(unsigned char *)(a1 + 72))
      {
        float32x2_t v29 = v67;
        uint64_t v43 = v25;
        CGAffineTransform v49 = v26;
        if ((unint64_t)a8 && (unint64_t)a9)
        {
          BOOL v50 = [*(id *)(a1 + 32) commandBuffer];
          double v51 = [v50 blitCommandEncoder];
          *(void *)float32x4_t v69 = (unint64_t)a6;
          *(void *)&v69[8] = (unint64_t)a7;
          *(void *)&v69[16] = 0;
          v72[0] = (unint64_t)a8;
          v72[1] = (unint64_t)a9;
          v72[2] = 1;
          if (v43) {
            CGAffineTransform v52 = (void *)v43[3];
          }
          else {
            CGAffineTransform v52 = 0;
          }
          id v53 = v52;
          v71[0] = (unint64_t)a10;
          v71[1] = (unint64_t)a11;
          v71[2] = 0;
          [v51 copyFromTexture:v29 sourceSlice:0 sourceLevel:0 sourceOrigin:v69 sourceSize:v72 toTexture:v53 destinationSlice:0 destinationLevel:0 destinationOrigin:v71];

          [v51 endEncoding];
          if (v26)
          {
            -[PKMetalRenderState addCommandBuffer:]((uint64_t)v49, v50);
          }
          else
          {
            [v50 enqueue];
            [v50 commit];
          }
        }
LABEL_60:

        uint64_t v25 = v66;
        goto LABEL_61;
      }
    }
    uint64_t v28 = *(void *)(a1 + 192);
    *(void *)float32x4_t v69 = 7;
    memset(&v69[8], 0, 24);
    *(void *)&v70.f64[0] = 2 * (v28 != 0);
    float32x2_t v29 = -[PKMetalResourceHandler namedShaderForKey:](v28, (long long *)v69);
    if (v26) {
      float32x2_t v30 = (void *)*((void *)v26 + 18);
    }
    else {
      float32x2_t v30 = 0;
    }
    id v31 = v30;

    if (v31)
    {
      uint64_t v32 = *(void *)(a1 + 192);
      memset(&v69[12], 0, 20);
      if (v32)
      {
        if (*(unsigned char *)(v32 + 429)) {
          unsigned __int8 v33 = 3;
        }
        else {
          unsigned __int8 v33 = 2;
        }
      }
      else
      {
        unsigned __int8 v33 = 0;
      }
      *(void *)float32x4_t v69 = 7;
      *(void *)&v70.f64[0] = v33;
      *(_DWORD *)&v69[8] = 0;
      uint64_t v34 = -[PKMetalResourceHandler namedShaderForKey:](v32, (long long *)v69);
    }
    else
    {
      if (!v26) {
        goto LABEL_17;
      }
      if (v26[38]) {
        goto LABEL_17;
      }
      if (*(void **)(a1 + 40) != v25) {
        goto LABEL_17;
      }
      id v48 = *((id *)v26 + 18);

      if (v48) {
        goto LABEL_17;
      }
      uint64_t v34 = -[PKMetalRenderer blitShader](a1);
    }
    id v35 = (void *)v34;

    float32x2_t v29 = v35;
LABEL_17:
    if (a5)
    {
      uint64_t v36 = -[PKMetalShader shaderWithBlendMode:](v29, a5);

      float32x2_t v29 = (void *)v36;
    }
    if (v26)
    {
      uint64_t v37 = *((id *)v26 + 7);
      uint64_t v38 = (void *)*((void *)v26 + 10);
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
    }
    id v39 = v38;
    uint64_t v40 = v39;
    BOOL v41 = v37 == 0;
    if (v37 && v39)
    {
      BOOL v41 = 0;
      CGFloat v42 = v39;
      uint64_t v43 = v37;
    }
    else
    {
      uint64_t v43 = v37;
      if (!v37)
      {
        uint64_t v43 = [*(id *)(a1 + 32) commandBuffer];
      }
      double v44 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
      long long v45 = [v44 colorAttachments];
      CGAffineTransform v46 = [v45 objectAtIndexedSubscript:0];

      if (*(void **)(a1 + 40) == v66 && *(unsigned char *)(a1 + 72))
      {
        *(unsigned char *)(a1 + 72) = 0;
        uint64_t v47 = 2;
      }
      else
      {
        uint64_t v47 = 1;
      }
      [v46 setLoadAction:v47];
      [v46 setStoreAction:1];
      BOOL v54 = v66;
      if (v66) {
        BOOL v54 = (void *)v66[3];
      }
      id v55 = v54;
      [v46 setTexture:v55];

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v26, v66);
      CGFloat v42 = [v43 renderCommandEncoderWithDescriptor:v44];

      if (v37) {
        -[PKMetalRenderState setRenderEncoder:]((uint64_t)v26, v42);
      }
    }
    if (v29) {
      unsigned int v56 = (void *)v29[3];
    }
    else {
      unsigned int v56 = 0;
    }
    id v57 = v56;
    [v42 setRenderPipelineState:v57];

    [v42 setFragmentTexture:v67 atIndex:0];
    if (v29) {
      CGAffineTransform v58 = (void *)v29[3];
    }
    else {
      CGAffineTransform v58 = 0;
    }
    id v59 = v58;
    [v42 setRenderPipelineState:v59];

    CGRect v60 = (float64x2_t *)(v26 + 192);
    if (!v26) {
      CGRect v60 = (float64x2_t *)MEMORY[0x1E4F1DAB8];
    }
    float64x2_t v61 = v60[1];
    *(float64x2_t *)float32x4_t v69 = *v60;
    *(float64x2_t *)&v69[16] = v61;
    float64x2_t v70 = v60[2];
    unint64_t v62 = [v67 width];
    unint64_t v63 = [v67 height];
    double v64 = -[PKMetalFramebuffer size]((uint64_t)v66);
    v68[0] = *(float64x2_t *)v69;
    v68[1] = *(float64x2_t *)&v69[16];
    v68[2] = v70;
    -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:texCoordTransform:](v42, v68, a6, a7, a8, a9, a10, a11, a12, a13, (double)v62, (double)v63, v64, v65);
    if (v41)
    {
      if (v26)
      {
        [v42 endEncoding];
        -[PKMetalRenderState addCommandBuffer:]((uint64_t)v26, v43);
      }
      else
      {
        +[PKMetalRenderState renderTargetBarrierForRenderEncoder:v42];
        [v42 endEncoding];
        [v43 enqueue];
        [v43 commit];
      }
    }

    goto LABEL_60;
  }
LABEL_61:
}

- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7
{
  id v26 = a1;
  float64x2_t v27 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
  v32[0] = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
  v32[1] = v27;
  v32[2] = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v28 = a8;
  id v30 = v26;
  -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:texCoordTransform:](v26, v32, a2, a3, a4, a5, a6, a7, v28, a9, a10, a11, a12, a13);
}

- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7 texCoordTransform:(CGFloat)a8
{
  v73.size.CGFloat width = a9;
  v73.size.CGFloat height = a10;
  v73.origin.CGFloat x = a7;
  v73.origin.float64_t y = a8;
  v82[4] = *MEMORY[0x1E4F143B8];
  id v25 = a1;
  CGAffineTransformMakeScale(&v80, 1.0 / a11, 1.0 / a12);
  v83.origin.CGFloat x = a3;
  v83.origin.float64_t y = a4;
  v83.size.CGFloat width = a5;
  v83.size.CGFloat height = a6;
  CGRect v84 = CGRectApplyAffineTransform(v83, &v80);
  CGFloat x = v84.origin.x;
  float64_t y = v84.origin.y;
  CGFloat width = v84.size.width;
  CGFloat height = v84.size.height;
  CGAffineTransformMakeScale(&v79, 1.0 / a13, 1.0 / a14);
  CGRect v85 = CGRectApplyAffineTransform(v73, &v79);
  v78.double b = 0.0;
  v78.double c = 0.0;
  v78.double a = 2.0;
  *(_OWORD *)&v78.double d = xmmword_1C482A980;
  v78.tfloat64_t y = 1.0;
  CGRect v86 = CGRectApplyAffineTransform(v85, &v78);
  CGFloat v30 = v86.origin.x;
  float64_t v31 = v86.origin.y;
  CGFloat v32 = v86.size.width;
  CGFloat v33 = v86.size.height;
  v73.size.CGFloat height = CGRectGetMinX(v86);
  v87.origin.CGFloat x = v30;
  v87.origin.float64_t y = v31;
  v87.size.CGFloat width = v32;
  v87.size.CGFloat height = v33;
  CGFloat MaxY = CGRectGetMaxY(v87);
  v35.f64[0] = v73.size.height;
  v35.f64[1] = MaxY;
  v82[0] = vcvt_f32_f64(v35);
  CGFloat v36 = v30;
  v35.f64[0] = v31;
  CGFloat v37 = v32;
  CGFloat v38 = v33;
  v73.size.CGFloat height = CGRectGetMaxX(*(CGRect *)((char *)&v35 - 8));
  v88.origin.CGFloat x = v30;
  v88.origin.float64_t y = v31;
  v88.size.CGFloat width = v32;
  v88.size.CGFloat height = v33;
  CGFloat v39 = CGRectGetMaxY(v88);
  v40.f64[0] = v73.size.height;
  v40.f64[1] = v39;
  v82[1] = vcvt_f32_f64(v40);
  CGFloat v41 = v30;
  v40.f64[0] = v31;
  CGFloat v42 = v32;
  CGFloat v43 = v33;
  v73.size.CGFloat height = CGRectGetMinX(*(CGRect *)((char *)&v40 - 8));
  v89.origin.CGFloat x = v30;
  v89.origin.float64_t y = v31;
  v89.size.CGFloat width = v32;
  v89.size.CGFloat height = v33;
  CGFloat MinY = CGRectGetMinY(v89);
  v45.f64[0] = v73.size.height;
  v45.f64[1] = MinY;
  v82[2] = vcvt_f32_f64(v45);
  CGFloat v46 = v30;
  v45.f64[0] = v31;
  CGFloat v47 = v32;
  CGFloat v48 = v33;
  v73.size.CGFloat height = CGRectGetMaxX(*(CGRect *)((char *)&v45 - 8));
  v90.origin.CGFloat x = v30;
  v90.origin.float64_t y = v31;
  v90.size.CGFloat width = v32;
  v90.size.CGFloat height = v33;
  CGFloat v49 = CGRectGetMinY(v90);
  v50.f64[0] = v73.size.height;
  v50.f64[1] = v49;
  v82[3] = vcvt_f32_f64(v50);
  CGFloat v51 = x;
  v50.f64[0] = y;
  CGFloat v52 = width;
  CGFloat v53 = height;
  v73.size.CGFloat height = CGRectGetMinX(*(CGRect *)((char *)&v50 - 8));
  v91.origin.CGFloat x = x;
  v91.origin.float64_t y = y;
  v91.size.CGFloat width = width;
  v91.size.CGFloat height = height;
  CGFloat v54 = CGRectGetMinY(v91);
  v55.f64[0] = v73.size.height;
  v55.f64[1] = v54;
  v81[0] = vcvt_f32_f64(v55);
  CGFloat v56 = x;
  v55.f64[0] = y;
  CGFloat v57 = width;
  CGFloat v58 = height;
  v73.size.CGFloat height = CGRectGetMaxX(*(CGRect *)((char *)&v55 - 8));
  v92.origin.CGFloat x = x;
  v92.origin.float64_t y = y;
  v92.size.CGFloat width = width;
  v92.size.CGFloat height = height;
  CGFloat v59 = CGRectGetMinY(v92);
  v60.f64[0] = v73.size.height;
  v60.f64[1] = v59;
  v81[1] = vcvt_f32_f64(v60);
  CGFloat v61 = x;
  v60.f64[0] = y;
  CGFloat v62 = width;
  CGFloat v63 = height;
  v73.size.CGFloat height = CGRectGetMinX(*(CGRect *)((char *)&v60 - 8));
  v93.origin.CGFloat x = x;
  v93.origin.float64_t y = y;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  CGFloat v64 = CGRectGetMaxY(v93);
  v65.f64[0] = v73.size.height;
  v65.f64[1] = v64;
  v81[2] = vcvt_f32_f64(v65);
  CGFloat v66 = x;
  v65.f64[0] = y;
  CGFloat v67 = width;
  CGFloat v68 = height;
  v73.size.CGFloat height = CGRectGetMaxX(*(CGRect *)((char *)&v65 - 8));
  v94.origin.CGFloat x = x;
  v94.origin.float64_t y = y;
  v94.size.CGFloat width = width;
  v94.size.CGFloat height = height;
  CGFloat v69 = CGRectGetMaxY(v94);
  v70.f64[0] = v73.size.height;
  v70.f64[1] = v69;
  v81[3] = vcvt_f32_f64(v70);
  float64x2_t v71 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
  v76[0] = *MEMORY[0x1E4F1DAB8];
  v76[1] = v71;
  float64x2_t v77 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
  v75[0] = (float64x2_t)v76[0];
  v75[1] = v71;
  v75[2] = v77;
  float64x2_t v72 = a2[1];
  v74[0] = *a2;
  v74[1] = v72;
  v74[2] = a2[2];
  -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v76, v75, v74, v25);
  [v25 setVertexBytes:v82 length:32 atIndex:0];
  [v25 setVertexBytes:v81 length:32 atIndex:1];
  [v25 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void)setupUberVertexShaderWithTransform:(_anonymous_namespace_ *)a1 paperTransform:(float64x2_t *)a2 texCoordTransform:(float64x2_t *)a3 renderEncoder:(void *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  float32x2_t v8 = vcvt_f32_f64(*a3);
  float32x2_t v9 = vcvt_f32_f64(a3[1]);
  float32x2_t v10 = vcvt_f32_f64(a3[2]);
  DWORD2(v20) = 0;
  *(float32x2_t *)&long long v20 = v8;
  DWORD2(v21) = 0;
  *(float32x2_t *)&long long v21 = v9;
  DWORD2(v22) = 1065353216;
  *(float32x2_t *)&long long v22 = v10;
  float32x2_t v11 = vcvt_f32_f64(*MEMORY[0x1E4F1DAB8]);
  float32x2_t v12 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16));
  float32x2_t v13 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32));
  DWORD2(v23) = 0;
  *(float32x2_t *)&long long v23 = v11;
  DWORD2(v24) = 0;
  *(float32x2_t *)&long long v24 = v12;
  DWORD2(v25) = 1065353216;
  *(float32x2_t *)&long long v25 = v13;
  v19[0] = v15;
  v19[1] = v16;
  v19[2] = v17;
  v19[3] = v18;
  *(float32x2_t *)&long long v15 = vcvt_f32_f64(*a2);
  *(float32x2_t *)&long long v16 = vcvt_f32_f64(a2[1]);
  *(float32x2_t *)&long long v17 = vcvt_f32_f64(a2[2]);
  DWORD2(v26) = 0;
  *(void *)&long long v26 = v15;
  DWORD2(v27) = 0;
  *(void *)&long long v27 = v16;
  DWORD2(v28) = 1065353216;
  *(void *)&long long v28 = v17;
  [v7 setVertexBytes:v19 length:224 atIndex:3];
}

- (id)blitShader
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    unint64_t v3 = -[PKMetalRenderState pipelineConfig](v2);
  }
  else {
    unint64_t v3 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
  }
  uint64_t v4 = *(void *)(a1 + 192);
  long long v7 = 7uLL;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  int v10 = v3;
  __int16 v11 = WORD2(v3);
  __int16 v12 = 0;
  id v5 = -[PKMetalResourceHandler namedShaderForKey:](v4, &v7);

  return v5;
}

- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3
{
  CGImageRef v5 = (CGImageRef)a1;
  if (a1)
  {
    if (-[PKMetalRenderer ensureOriginalBackFramebufferHasContents](a1)) {
      id v10 = *((id *)v5 + 5);
    }
    else {
      id v10 = 0;
    }
    CGImageRef v5 = -[PKMetalRenderer newCGImageWithClipRect:framebuffer:]((uint64_t)v5, v10, a2, a3, a4, a5);
  }
  return v5;
}

- (CGImageRef)newSixChannelMultiplyCGImageWithClipRect:(CGFloat)a3
{
  CGImageRef v5 = a1;
  if (a1)
  {
    id v10 = (unsigned char *)*((void *)a1 + 7);
    if (v10)
    {
      if (*((unsigned char *)v5 + 64))
      {
LABEL_6:
        __int16 v12 = v10;
LABEL_8:
        CGImageRef v5 = -[PKMetalRenderer newCGImageWithClipRect:framebuffer:]((uint64_t)v5, v12, a2, a3, a4, a5);

        return v5;
      }
      int v11 = -[PKMetalFramebuffer incrementNonPurgeableCount](v10);
      *((unsigned char *)v5 + 64) = v11;
      if (v11)
      {
        id v10 = (unsigned char *)*((void *)v5 + 7);
        goto LABEL_6;
      }
    }
    __int16 v12 = 0;
    goto LABEL_8;
  }
  return v5;
}

- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3 framebuffer:(CGFloat)a4
{
  int v11 = a2;
  if (!a1) {
    goto LABEL_10;
  }
  v37.origin.double x = a3;
  v37.origin.float64_t y = a4;
  v37.size.double width = a5;
  v37.size.double height = a6;
  BOOL IsNull = CGRectIsNull(v37);
  double width = *(double *)(a1 + 224);
  double height = *(double *)(a1 + 232);
  double x = 0.0;
  if (IsNull)
  {
    double rect = 0.0;
    a3 = 0.0;
    a4 = 0.0;
    a5 = *(double *)(a1 + 224);
    a6 = *(double *)(a1 + 232);
  }
  else
  {
    v45.origin.double x = 0.0;
    v45.origin.float64_t y = 0.0;
    v38.origin.double x = a3;
    v38.origin.float64_t y = a4;
    v38.size.double width = a5;
    v38.size.double height = a6;
    v45.size.double width = *(CGFloat *)(a1 + 224);
    v45.size.double height = *(CGFloat *)(a1 + 232);
    CGRect v39 = CGRectIntersection(v38, v45);
    double rect = v39.origin.y;
    double x = v39.origin.x;
    double width = v39.size.width;
    double height = v39.size.height;
  }
  v40.origin.double x = a3;
  v40.origin.float64_t y = a4;
  v40.size.double width = a5;
  v40.size.double height = a6;
  double v16 = CGRectGetWidth(v40);
  v41.origin.double x = a3;
  v41.origin.float64_t y = a4;
  v41.size.double width = a5;
  v41.size.double height = a6;
  size_t v17 = vcvtpd_u64_f64(v16);
  size_t v18 = vcvtpd_u64_f64(CGRectGetHeight(v41));
  if (!v17 || v18 == 0)
  {
LABEL_10:
    CGImageRef Image = 0;
    goto LABEL_23;
  }
  v42.origin.double x = x;
  v42.origin.float64_t y = rect;
  v42.size.double width = width;
  v42.size.double height = height;
  IsEmptfloat64_t y = CGRectIsEmpty(v42);
  if (v11) {
    char v22 = IsEmpty;
  }
  else {
    char v22 = 1;
  }
  if (v22)
  {
    long long v23 = DKUCreateRGBABitmapContext(0, (double)v17, (double)v18, 1.0);
    long long v24 = v23;
    if (v23)
    {
      v43.origin.double x = 0.0;
      v43.origin.float64_t y = 0.0;
      v43.size.double width = (double)v17;
      v43.size.double height = (double)v18;
      CGContextClearRect(v23, v43);
      CGImageRef Image = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      goto LABEL_23;
    }
    goto LABEL_10;
  }
  long long v25 = (CGColorSpace *)DKUDeviceRGBColorSpace();
  size_t v26 = (4 * v17 + 31) & 0xFFFFFFFFFFFFFFE0;
  size_t v27 = v26 * v18;
  id v28 = (id) [*(id *)(a1 + 24) newBufferWithLength:v26 * v18 options:0];
  char v29 = CGBitmapContextCreate((void *)[v28 contents], v17, v18, 8uLL, v26, v25, 0x2002u);
  if (v29)
  {
    CGFloat v33 = [*(id *)(a1 + 32) commandBuffer];
    uint64_t v30 = [v33 blitCommandEncoder];
    v44.origin.double x = x;
    v44.origin.float64_t y = rect;
    v44.size.double width = width;
    v44.size.double height = height;
    v46.origin.double x = a3;
    v46.origin.float64_t y = a4;
    v46.size.double width = a5;
    v46.size.double height = a6;
    if (!CGRectEqualToRect(v44, v46)) {
      objc_msgSend(v30, "fillBuffer:range:value:", v28, 0, v27, 0);
    }
    id v31 = v11[3];
    v36[0] = (unint64_t)x;
    v36[1] = (unint64_t)rect;
    v36[2] = 0;
    v35[0] = (unint64_t)width;
    v35[1] = (unint64_t)height;
    v35[2] = 1;
    [v30 copyFromTexture:v31 sourceSlice:0 sourceLevel:0 sourceOrigin:v36 sourceSize:v35 toBuffer:v28 destinationOffset:0 destinationBytesPerRow:v26 destinationBytesPerImage:v27];

    [v30 endEncoding];
    [v33 commit];
    [v33 waitUntilCompleted];
    CGImageRef Image = CGBitmapContextCreateImage(v29);
    CGContextRelease(v29);
  }
  else
  {
    CGImageRef Image = 0;
  }

LABEL_23:
  return Image;
}

- (uint64_t)ensureOriginalBackFramebufferHasContents
{
  if (result)
  {
    uint64_t v1 = result;
    __n128 result = *(void *)(result + 40);
    if (result)
    {
      if (*(unsigned char *)(v1 + 72))
      {
        return 0;
      }
      else if (*(unsigned char *)(v1 + 48))
      {
        return 1;
      }
      else
      {
        __n128 result = -[PKMetalFramebuffer incrementNonPurgeableCount]((unsigned char *)result);
        *(unsigned char *)(v1 + 48) = result;
      }
    }
  }
  return result;
}

- (void)setBackgroundColor:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(CGColor **)(a1 + 240);
    if (v4 != (CGColor *)a2)
    {
      if (v4)
      {
        CGColorRelease(v4);
        *(void *)(a1 + 240) = 0;
      }
      if (a2) {
        *(void *)(a1 + 240) = DKUCGColorCreateConvertedToSRGB(a2);
      }
    }
  }
}

- (void)setLiveRenderingOverrideColor:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(CGColor **)(a1 + 984);
    if (v4 != color)
    {
      if (v4)
      {
        CGColorRelease(v4);
        *(void *)(a1 + 984) = 0;
      }
      if (color) {
        *(void *)(a1 + 984) = CGColorRetain(color);
      }
    }
  }
}

- (void)setPaperTextureImage:(uint64_t)a1
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 448);
    *(void *)(a1 + 448) = 0;

    *(_OWORD *)(a1 + 456) = *MEMORY[0x1E4F1DB30];
    if (a2)
    {
      CGImageRef v5 = (void *)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:*(void *)(a1 + 24)];
      uint64_t v6 = *MEMORY[0x1E4F353A0];
      uint64_t v7 = *MEMORY[0x1E4F35380];
      v28[0] = *MEMORY[0x1E4F35378];
      v28[1] = v7;
      v29[0] = v6;
      v29[1] = MEMORY[0x1E4F1CC28];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      id v25 = 0;
      uint64_t v9 = [v5 newTextureWithCGImage:a2 options:v8 error:&v25];
      id v10 = v25;
      int v11 = *(void **)(a1 + 448);
      *(void *)(a1 + 448) = v9;

      __int16 v12 = *(void **)(a1 + 448);
      if (!v12)
      {
        size_t Width = CGImageGetWidth(a2);
        CGFloat Height = (double)CGImageGetHeight(a2);
        v30.double width = (double)Width;
        v30.double height = Height;
        UIGraphicsBeginImageContextWithOptions(v30, 0, 1.0);
        long long v15 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
        objc_msgSend(v15, "drawInRect:", 0.0, 0.0, (double)Width, Height);

        double v16 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        id v17 = v16;
        id v24 = v10;
        uint64_t v18 = objc_msgSend(v5, "newTextureWithCGImage:options:error:", objc_msgSend(v17, "CGImage"), v8, &v24);
        id v19 = v24;

        long long v20 = *(void **)(a1 + 448);
        *(void *)(a1 + 448) = v18;

        __int16 v12 = *(void **)(a1 + 448);
        id v10 = v19;
      }
      unint64_t v21 = [v12 width];
      unint64_t v22 = [*(id *)(a1 + 448) height];
      *(double *)(a1 + 456) = (double)v21;
      *(double *)(a1 + 464) = (double)v22;
      if (!*(void *)(a1 + 448))
      {
        long long v23 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v10;
          _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_DEFAULT, "Failed to load texture: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)setupForDefaultUberVertexShaderInRenderEncoder:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    float64x2_t v3 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v3;
    float64x2_t v8 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
    v6[0] = (float64x2_t)v7[0];
    v6[1] = v3;
    v6[2] = v8;
    v5[0] = (float64x2_t)v7[0];
    v5[1] = v3;
    v5[2] = v8;
    -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v7, v6, v5, v4);
  }
}

- (double)dirtyClipRectForAnimatingStrokeVertices:(uint64_t)a1 newSize:(unint64_t)a2
{
  double v4 = *MEMORY[0x1E4F1DB20];
  unint64_t v5 = *(void *)(a1 + 328);
    uint64_t v6 = 36;
  else {
    uint64_t v6 = 20;
  }
  if (*(unsigned char *)(a1 + 320))
  {
    uint64_t v7 = (_anonymous_namespace_::AnimatingStroke *)a1;
    uint64_t v8 = 0;
  }
  else
  {
    BOOL v9 = a2 > v5;
    a2 -= v5;
    if (!v9) {
      return v4;
    }
    uint64_t v7 = (_anonymous_namespace_::AnimatingStroke *)a1;
    uint64_t v8 = v5;
  }
  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v10, a2, v6);
  return v11;
}

- (float)clipRectForVertices:(float *)result numVertices:(uint64_t)a2 vertexSize:(uint64_t)a3
{
  if (a2)
  {
    double v3 = *result;
    double v4 = result[1];
    uint64_t v5 = a2 - 1;
    if (a2 != 1)
    {
      uint64_t v6 = (float *)((char *)result + a3 + 4);
      double v7 = result[1];
      double v8 = *result;
      while (1)
      {
        double v9 = *(v6 - 1);
        double v10 = v3 < v9 ? *(v6 - 1) : v3;
        if (v8 <= v9) {
          double v3 = v10;
        }
        else {
          double v8 = *(v6 - 1);
        }
        double v11 = *v6;
        if (v7 > v11) {
          break;
        }
        if (v4 >= v11) {
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v6 = (float *)((char *)v6 + a3);
        double v4 = v11;
        if (!--v5) {
          return result;
        }
      }
      double v7 = *v6;
LABEL_15:
      double v11 = v4;
      goto LABEL_16;
    }
  }
  return result;
}

- (double)updateActualSize:(double)a3 pixelSize:(double)a4
{
  if (a1)
  {
    double v6 = result;
    double v8 = *(double *)(a1 + 224);
    if (a4 != v8 || a5 != *(double *)(a1 + 232))
    {
      *(double *)(a1 + 224) = a4;
      *(double *)(a1 + 232) = a5;
      -[PKMetalRenderer teardownDrawingFramebuffers]((void *)a1);
      double v10 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = 0;

      double v11 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = 0;

      __int16 v12 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = 0;

      double v8 = *(double *)(a1 + 224);
    }
    *(double *)(a1 + 248) = v6;
    *(double *)(a1 + 256) = a3;
    __n128 result = v8 / v6;
    *(double *)(a1 + 264) = result;
  }
  return result;
}

- (void)setupOriginalBackFramebufferIfNecessary
{
  if (!a1 || *(void *)(a1 + 720) == 2) {
    return;
  }
  double v3 = (uint64_t *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 48)) {
      goto LABEL_8;
    }
    int v4 = -[PKMetalFramebuffer incrementNonPurgeableCount]((unsigned char *)v2);
    *(unsigned char *)(a1 + 48) = v4;
  }
  if (v4)
  {
    uint64_t v2 = *v3;
    if (!*v3)
    {
      uint64_t v5 = 0;
LABEL_9:
      double v6 = *(void **)(a1 + 472);
      if (v5 == v6) {
        return;
      }
      goto LABEL_12;
    }
LABEL_8:
    uint64_t v5 = *(void **)(v2 + 40);
    goto LABEL_9;
  }
  double v6 = *(void **)(a1 + 472);
LABEL_12:
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7
    && (*(unsigned char *)(a1 + 48)
     || (*(unsigned char *)(a1 + 48) = -[PKMetalFramebuffer incrementNonPurgeableCount]((unsigned char *)v7),
         (uint64_t v7 = *(void *)(a1 + 40)) != 0)))
  {
    double v8 = *(void **)(v7 + 24);
  }
  else
  {
    double v8 = 0;
  }
  id v9 = v8;
  [v9 setLabel:@"Original back framebuffer"];

  *(unsigned char *)(a1 + 72) = 1;
  uint64_t v10 = *(void *)(a1 + 192);
  if (v10 && !*(unsigned char *)(v10 + 426) && *(unsigned char *)(v10 + 427))
  {
    if (qword_1EB3C6008 != -1) {
      dispatch_once(&qword_1EB3C6008, &__block_literal_global_31);
    }
    if (!byte_1EB3C5FF9) {
      -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](a1, *(void **)(a1 + 40));
    }
  }
}

- (void)clearFramebuffer:(uint64_t)a1 waitUntilCompleted:(void *)a2
{
  double v3 = a2;
  if (a1)
  {
    int v4 = [*(id *)(a1 + 32) commandBuffer];
    uint64_t v5 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
    double v6 = [v5 colorAttachments];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];

    [v7 setLoadAction:0];
    [v7 setStoreAction:1];
    if (v3) {
      double v8 = (void *)*((void *)v3 + 3);
    }
    else {
      double v8 = 0;
    }
    id v9 = v8;
    [v7 setTexture:v9];

    uint64_t v10 = [v4 renderCommandEncoderWithDescriptor:v5];
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v10);
    if (v3) {
      float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v3 + 88)), *(float64x2_t *)(v3 + 104));
    }
    else {
      float32x4_t v11 = 0uLL;
    }
    float32x4_t v14 = v11;
    [v10 setFragmentBytes:&v14 length:16 atIndex:0];
    uint64_t v12 = *(void *)(a1 + 192);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    long long v15 = 0xCuLL;
    int v18 = 2 * (v12 != 0);
    int v19 = 0;
    float32x2_t v13 = -[PKMetalResourceHandler namedShaderForKey:](v12, &v15);
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v13, v10);

    [v10 endEncoding];
    [v4 enqueue];
    [v4 commit];
  }
}

- (void)renderBrushIndicatorForStroke:(long long *)a3 withTransform:(unint64_t)a4 mode:
{
  *(void *)&v62[50] = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  uint64_t v7 = [v43 ink];
  double v8 = [v7 behavior];
  int v9 = [v8 isEraser] ^ 1;
  if (a4 > 2) {
    LOBYTE(v9) = 1;
  }
  if (v9)
  {
  }
  else
  {
    int v10 = *(unsigned __int8 *)(a1 + 352);

    if (v10)
    {
      double v11 = *(double *)(a1 + 368);
      double v12 = *(double *)(a1 + 376);
      double v13 = *(double *)(a1 + 384);
      long long v44 = *a3;
      long long v45 = a3[1];
      long long v46 = a3[2];
      uint64_t v14 = *(void *)(a1 + 8);
      if (v14)
      {
        id v21 = *(id *)(v14 + 80);
        if (v21)
        {
          long long v55 = xmmword_1C482A990;
          float64x2_t v22 = *(float64x2_t *)(a1 + 1008);
          float v23 = 3.5 / v22.f64[0];
          float v58 = v23;
          __asm
          {
            FMOV            V1.2D, #0.5
            FMOV            V2.2D, #1.0
          }
          float32x2_t v57 = vcvt_f32_f64((float64x2_t)vextq_s8((int8x16_t)vmulq_f64(v22, _Q1), (int8x16_t)vdivq_f64(_Q2, v22), 8uLL));
          *(float *)v22.f64 = v13;
          int v56 = LODWORD(v22.f64[0]);
          uint64_t v54 = 0;
          uint64_t v31 = 0;
          CGFloat v32 = (__int16 *)v62;
          do
          {
            v64.val[0].i32[0] = *(_DWORD *)(v32 - 15);
            v64.val[0].i32[1] = *(_DWORD *)(v32 - 5);
            v64.val[1].i32[0] = *(_DWORD *)(v32 - 13);
            v64.val[1].i32[1] = *(_DWORD *)(v32 - 3);
            CGFloat v33 = (float *)&v60[v31];
            vst2_f32(v33, v64);
            v64.val[0].i16[0] = *(v32 - 11);
            v64.val[0].i16[1] = *(v32 - 1);
            v64.val[0] = (float32x2_t)vcvtq_f32_f16((float16x4_t)v64.val[0]).u64[0];
            v30.i16[0] = *(v32 - 10);
            v30.i16[1] = *v32;
            v64.val[1] = (float32x2_t)vcvtq_f32_f16(v30).u64[0];
            uint64_t v34 = (float *)&v59[v31];
            vst2_f32(v34, v64);
            v32 += 20;
            v31 += 16;
          }
          while (v31 != 32);
          uint64_t v35 = *(void *)(a1 + 8);
          if (v35) {
            unint64_t v36 = -[PKMetalRenderState pipelineConfig](v35);
          }
          else {
            unint64_t v36 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
          }
          uint64_t v37 = *(void *)(a1 + 192);
          long long v51 = 9uLL;
          long long v52 = 0uLL;
          LODWORD(v53) = v36;
          DWORD1(v53) = WORD2(v36);
          CGRect v38 = -[PKMetalResourceHandler namedShaderForKey:](v37, &v51);
          long long v51 = v44;
          long long v52 = v45;
          long long v53 = v46;
          float64x2_t v39 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
          v49[0] = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
          v49[1] = v39;
          float64x2_t v50 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
          v48[0] = v49[0];
          v48[1] = v39;
          v48[2] = v50;
          -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)&v51, v49, v48, v21);
          if (v38) {
            CGRect v40 = (void *)v38[3];
          }
          else {
            CGRect v40 = 0;
          }
          id v41 = v40;
          [v21 setRenderPipelineState:v41];

          [v21 setVertexBytes:v60 length:32 atIndex:0];
          [v21 setVertexBytes:v59 length:32 atIndex:1];
          [v21 setFragmentBytes:&v55 length:32 atIndex:0];
          uint64_t v47 = 0;
          CGRect v42 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(a1 + 192), 8uLL, &v47);
          [v21 drawIndexedPrimitives:3 indexCount:6 indexType:v47 indexBuffer:v42 indexBufferOffset:0];
        }
      }
      else
      {
        id v21 = 0;
      }
    }
  }
}

- (void)finishRenderingNoTeardownForStroke:(void *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5
{
  id v13 = a3;
  -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"finishRenderingNoTeardownForStroke");
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v24 = *MEMORY[0x1E4F1DB20];
  long long v25 = v14;
  if (!-[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](a1, v13, (CGFloat *)&v24, *(CGFloat *)(a2 + 216), *(CGFloat *)(a2 + 224), *(CGFloat *)(a2 + 232), *(CGFloat *)(a2 + 240), a4, a5, a6, a7))
  {
LABEL_7:
    uint64_t v22 = *(void *)(a1 + 8);
    if (v22) {
      [*(id *)(v22 + 80) popDebugGroup];
    }
    goto LABEL_9;
  }
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15)
  {
    uint64_t v16 = *(void *)(v15 + 128);
    *(void *)(v15 + 128) = 0;
    uint64_t v17 = *(void *)(a1 + 8);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  *(unsigned char *)(a1 + 72) = 0;
  -[PKMetalRenderState pushDebugGroup:](v17, @"Render stroke into original back framebuffer");
  uint64_t v18 = *(void **)(a2 + 80);
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v23[0] = *MEMORY[0x1E4F1DAB8];
  v23[1] = v19;
  v23[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](a1, v18, (uint64_t)v23, 3uLL, 0, v13, *(unsigned __int8 *)(a2 + 285), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *(CGFloat *)&v24, *((CGFloat *)&v24 + 1), *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
  uint64_t v20 = *(void *)(a1 + 8);
  if (v20)
  {
    [*(id *)(v20 + 80) popDebugGroup];
    uint64_t v21 = *(void *)(a1 + 8);
    if (v21)
    {
      *(void *)(v21 + 128) = v16;
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)finishRendering
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 963))
    {
      uint64_t v2 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v3 = 0;
        _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Finish rendering", v3, 2u);
      }
    }
    *(unsigned char *)(a1 + 352) = 0;
  }
}

- (uint64_t)setupClippingForStrokeClipRect:(CGFloat *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 outNewClipRect:(CGFloat)a6
{
  id v21 = a2;
  if (a1)
  {
    v32.origin.CGFloat x = a8;
    v32.origin.CGFloat y = a9;
    v32.size.CGFloat width = a10;
    v32.size.CGFloat height = a11;
    BOOL IsNull = CGRectIsNull(v32);
    v33.origin.CGFloat x = a4;
    v33.origin.CGFloat y = a5;
    v33.size.CGFloat width = a6;
    v33.size.CGFloat height = a7;
    CGRect v34 = CGRectIntegral(v33);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    if (!IsNull)
    {
      v38.origin.CGFloat x = a8;
      v38.origin.CGFloat y = a9;
      v38.size.CGFloat width = a10;
      v38.size.CGFloat height = a11;
      CGRect v35 = CGRectIntersection(v34, v38);
      CGFloat x = v35.origin.x;
      CGFloat y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
    }
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    if (CGRectIsNull(v36))
    {
      a1 = 0;
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      if ((void)v31) {
        BOOL v27 = *((void *)&v31 + 1) == 0;
      }
      else {
        BOOL v27 = 1;
      }
      a1 = !v27;
      if (!v27)
      {
        if (a3)
        {
          *a3 = x;
          a3[1] = y;
          a3[2] = width;
          a3[3] = height;
        }
        v29[0] = v30;
        v29[1] = v31;
        [v21 setScissorRect:v29];
      }
    }
  }

  return a1;
}

- (void)renderPaperTransform:(float64x2_t *)a3 paperTransform:(int)a4 flipped:(void *)a5 multiply:(double)a6 renderEncoder:
{
  id v11 = a5;
  -[PKMetalRenderState pushDebugGroup:](*(void *)(a1 + 8), @"renderPaperTransform");
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12) {
    unint64_t v13 = -[PKMetalRenderState pipelineConfig](v12);
  }
  else {
    unint64_t v13 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
  }
  uint64_t v14 = *(void *)(a1 + 192);
  *(void *)&v48.double a = 6;
  memset(&v48.b, 0, 24);
  LODWORD(v48.tx) = v13;
  HIDWORD(v48.tx) = WORD2(v13);
  uint64_t v15 = -[PKMetalResourceHandler namedShaderForKey:](v14, (long long *)&v48);
  float v16 = a6;
  float v49 = v16;
  [v11 setFragmentBytes:&v49 length:4 atIndex:0];
  uint64_t v17 = *(void **)(a1 + 448);
  uint64_t v18 = v17;
  if (!v17)
  {
    uint64_t v18 = -[PKMetalResourceHandler paperTexture](*(void *)(a1 + 192));
  }
  [v11 setFragmentTexture:v18 atIndex:2];
  if (!v17) {

  }
  if (a4)
  {
    long long v19 = a2[1];
    *(_OWORD *)&t1.double a = *a2;
    *(_OWORD *)&t1.double c = v19;
    *(_OWORD *)&t1.tCGFloat x = a2[2];
    t2.double a = 1.0;
    t2.double b = 0.0;
    t2.double c = 0.0;
    t2.double d = -1.0;
    t2.tCGFloat x = 0.0;
    t2.tCGFloat y = 0.0;
    CGAffineTransformConcat(&v48, &t1, &t2);
    long long v20 = *(_OWORD *)&v48.c;
    *a2 = *(_OWORD *)&v48.a;
    a2[1] = v20;
    a2[2] = *(_OWORD *)&v48.tx;
  }
  long long v21 = a2[1];
  v45[0] = *a2;
  v45[1] = v21;
  v45[2] = a2[2];
  long long v41 = 0x3FE0000000000000uLL;
  __asm { FMOV            V0.2D, #0.5 }
  long long v43 = _Q0;
  uint64_t v42 = 0;
  uint64_t v44 = 0x3FE0000000000000;
  DKDTransformFromTransformSpace(v45, &v41, &v48);
  long long v27 = *(_OWORD *)&v48.c;
  *a2 = *(_OWORD *)&v48.a;
  a2[1] = v27;
  a2[2] = *(_OWORD *)&v48.tx;
  long long v28 = a2[1];
  *(_OWORD *)&v40.double a = *a2;
  *(_OWORD *)&v40.double c = v28;
  *(_OWORD *)&v40.tCGFloat x = a2[2];
  CGAffineTransformInvert(&v48, &v40);
  long long v29 = *(_OWORD *)&v48.tx;
  long long v30 = *(_OWORD *)&v48.a;
  a2[1] = *(_OWORD *)&v48.c;
  a2[2] = v29;
  *a2 = v30;
  long long v31 = a2[1];
  v39[0] = *a2;
  v39[1] = v31;
  v39[2] = a2[2];
  float64x2_t v32 = a3[2];
  float64x2_t v33 = *a3;
  v38[1] = a3[1];
  v38[2] = v32;
  v38[0] = v33;
  float64x2_t v34 = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
  float64x2_t v35 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
  v37[1] = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
  v37[2] = v35;
  v37[0] = v34;
  -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v39, v38, v37, v11);
  -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v15, v11);
  uint64_t v36 = *(void *)(a1 + 8);
  if (v36) {
    [*(id *)(v36 + 80) popDebugGroup];
  }
}

- (double)alphaForStroke:(uint64_t)a1
{
  id v3 = a2;
  int v4 = [v3 ink];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 color];
    uint64_t v7 = (CGColor *)[v6 CGColor];

    uint64_t v8 = *(void *)(a1 + 8);
    if (v8 && *(unsigned char *)(v8 + 38) && *(void *)(a1 + 984)) {
      uint64_t v7 = *(CGColor **)(a1 + 984);
    }
    int v9 = [v5 behavior];
    double v10 = -[PKInkBehavior alphaForStrokeColor:](v9, v7);
  }
  else
  {
    double v10 = 1.0;
  }

  return v10;
}

- (double)antialiasingThresholdForStroke:(uint64_t)a1
{
  double v2 = *(double *)(a1 + 272);
  double v3 = *(double *)(a1 + 280);
  if (a2)
  {
    [a2 transform];
    double v5 = v7;
    double v4 = v8;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  return 1.0 / (sqrt(v3 * v3 + v2 * v2) * sqrt(v4 * v4 + v5 * v5));
}

- (uint64_t)renderStrokeRenderCacheBuffers:(void *)a3 renderEncoder:(_anonymous_namespace_:(int)a5 :AnimatingStroke *)a4 animatingStroke:indexed:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obunint64_t j = v7;
  uint64_t v9 = 0;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        uint64_t v14 = -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v13);
        if (v13) {
          uint64_t v15 = v13[2];
        }
        else {
          uint64_t v15 = 0;
        }
        [v8 setVertexBuffer:v14 offset:v15 atIndex:0];

        if (v13) {
          unint64_t v16 = v13[3];
        }
        else {
          unint64_t v16 = 0;
        }
        if (a5)
        {
          uint64_t v29 = 0;
          uint64_t v17 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(a1 + 192), v16, &v29);
          [v8 drawIndexedPrimitives:3 indexCount:6 * (v16 >> 2) indexType:v29 indexBuffer:v17 indexBufferOffset:0];
        }
        else
        {
          [v8 drawPrimitives:4 vertexStart:0 vertexCount:v16];
        }
        if (*((unsigned char *)a4 + 320))
        {
          if (v13)
          {
            uint64_t v18 = v13[5];
            uint64_t v19 = v13[6];
            uint64_t v20 = v13[7];
            uint64_t v21 = v13[8];
          }
          else
          {
            uint64_t v19 = 0;
            uint64_t v20 = 0;
            uint64_t v21 = 0;
            uint64_t v18 = 0;
          }
          long long v22 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v28.double a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v28.double c = v22;
          *(_OWORD *)&v28.tCGFloat x = *(_OWORD *)(a1 + 304);
        }
        v9 += v16;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v10 = v23;
    }
    while (v23);
  }

  return v9;
}

- (uint64_t)renderStrokeRenderCache:(void *)a3 renderEncoder:(uint64_t)a4 animatingStroke:(int)a5 indexed:
{
  id v9 = x1_0;
  id v10 = a3;
  if (*(unsigned char *)(a4 + 284)) {
    goto LABEL_5;
  }
  uint64_t v11 = [*(id *)(a4 + 80) ink];
  uint64_t v12 = [v11 behavior];
  unint64_t v13 = [v12 renderingDescriptor];
  uint64_t v14 = [v13 type];

  if (v14 != 1)
  {
LABEL_5:
      && !*(unsigned char *)(a4 + 284))
    {
      -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:]((uint64_t)a1, v10, a4);
    }
    else
    {
      -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:]((uint64_t)a1, v10, a4, 1.0);
    }
    int v15 = 0;
  }
  else
  {
    -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:]((uint64_t)a1, v10, a4, 0);
    int v15 = 1;
  }
  unint64_t v16 = [v9 buffers];
  uint64_t v17 = -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:]((uint64_t)a1, v16, v10, (_anonymous_namespace_::AnimatingStroke *)a4, a5);

  if (v15)
  {
    uint64_t v18 = [v9 secondaryBuffers];

    if (v18)
    {
      -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:]((uint64_t)a1, v10, a4, 1);
      uint64_t v19 = [v9 secondaryBuffers];
      v17 += -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:]((uint64_t)a1, v19, v10, (_anonymous_namespace_::AnimatingStroke *)a4, a5);
    }
  }
  if (!*(unsigned char *)(a4 + 336))
  {
    [*(id *)(a4 + 80) _bounds];
    long long v20 = a1[18];
    *(_OWORD *)&v22.double a = a1[17];
    *(_OWORD *)&v22.double c = v20;
    *(_OWORD *)&v22.tCGFloat x = a1[19];
  }

  return v17;
}

- (void)setupRenderEncoder:(uint64_t)a3 forParticleStroke:(int)a4 secondaryParticles:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [*(id *)(a3 + 80) ink];
  id v9 = [v8 behavior];
  if (a4) {
    [v9 secondaryParticleDescriptor];
  }
  else {
  id v10 = [v9 particleDescriptor];
  }

  *(unsigned char *)(a3 + 73) = a4;
  uint64_t v11 = [v8 identifier];
  int v12 = [v11 isEqualToString:@"com.apple.ink.marker"];

  if (v12)
  {
    int v13 = *(unsigned __int8 *)(a3 + 73);
    if (!*(unsigned char *)(a3 + 74))
    {
      if (*(unsigned char *)(a3 + 72))
      {
        if (*(unsigned char *)(a3 + 73)) {
          int v13 = 5;
        }
        else {
          int v13 = 2;
        }
      }
      else if (*(unsigned char *)(a3 + 73))
      {
        int v13 = 4;
      }
      else
      {
        int v13 = 1;
      }
    }
    uint64_t v16 = *(void *)(a1 + 8);
    if (v16) {
      unint64_t v17 = -[PKMetalRenderState pipelineConfig](v16);
    }
    else {
      unint64_t v17 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
    }
    uint64_t v18 = *(void *)(a1 + 192);
    *(void *)&v50[0] = 5;
    memset((char *)v50 + 12, 0, 20);
    DWORD2(v50[0]) = v13;
  }
  else
  {
    uint64_t v14 = [v10 maskTextureName];

    int v15 = *(unsigned __int8 *)(a3 + 73);
    if (v14)
    {
      if (!*(unsigned char *)(a3 + 74))
      {
        if (*(unsigned char *)(a3 + 72))
        {
          if (*(unsigned char *)(a3 + 73)) {
            int v15 = 5;
          }
          else {
            int v15 = 2;
          }
        }
        else if (*(unsigned char *)(a3 + 73))
        {
          int v15 = 4;
        }
        else
        {
          int v15 = 1;
        }
      }
      uint64_t v19 = [v10 particleBlendMode];
      uint64_t v20 = *(void *)(a1 + 8);
      if (v20) {
        unint64_t v17 = -[PKMetalRenderState pipelineConfig](v20);
      }
      else {
        unint64_t v17 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
      }
      uint64_t v18 = *(void *)(a1 + 192);
      BOOL v21 = v19 == 1;
      uint64_t v22 = 4;
    }
    else
    {
      if (!*(unsigned char *)(a3 + 74))
      {
        if (*(unsigned char *)(a3 + 72))
        {
          if (*(unsigned char *)(a3 + 73)) {
            int v15 = 5;
          }
          else {
            int v15 = 2;
          }
        }
        else if (*(unsigned char *)(a3 + 73))
        {
          int v15 = 4;
        }
        else
        {
          int v15 = 1;
        }
      }
      uint64_t v23 = [v10 particleBlendMode];
      uint64_t v24 = *(void *)(a1 + 8);
      if (v24) {
        unint64_t v17 = -[PKMetalRenderState pipelineConfig](v24);
      }
      else {
        unint64_t v17 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
      }
      uint64_t v18 = *(void *)(a1 + 192);
      BOOL v21 = v23 == 1;
      uint64_t v22 = 3;
    }
    *(void *)&v50[0] = v22;
    *(void *)((char *)v50 + 12) = 0;
    DWORD2(v50[0]) = v15;
    DWORD1(v50[1]) = 0;
    *((void *)&v50[1] + 1) = v21;
  }
  LODWORD(v51) = v17;
  DWORD1(v51) = WORD2(v17);
  long long v25 = -[PKMetalResourceHandler namedShaderForKey:](v18, v50);
  long long v51 = 0u;
  long long v52 = 0u;
  memset(v50, 0, sizeof(v50));
  long long v26 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v46.double a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v46.double c = v26;
  *(_OWORD *)&v46.tCGFloat x = *(_OWORD *)(a3 + 144);
  memset(&v47, 0, sizeof(v47));
  *(double *)&long long v26 = -2.0 / *(double *)(a1 + 232);
  v45.double a = 2.0 / *(double *)(a1 + 224);
  v45.double b = 0.0;
  v45.double c = 0.0;
  *(void *)&v45.double d = v26;
  *(_OWORD *)&v45.tCGFloat x = xmmword_1C48267F0;
  long long v27 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.double a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.double c = v27;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.double a = *(unint64_t *)&v45.a;
  *(_OWORD *)&t2.double c = *(_OWORD *)&v45.c;
  *(_OWORD *)&t2.tCGFloat x = xmmword_1C48267F0;
  CGAffineTransformConcat(&v45, &t1, &t2);
  CGAffineTransformConcat(&v47, &v46, &v45);
  v50[0] = v29;
  v50[1] = v30;
  long long v51 = v31;
  long long v52 = v32;
  *(float *)&long long v29 = *(double *)(a3 + 304);
  int v53 = v29;
  [v10 maskDepth];
  *(float *)&double v33 = v33;
  int v54 = LODWORD(v33);
  [v7 setVertexBytes:v50 length:80 atIndex:1];
  if (v25) {
    float64x2_t v34 = (void *)v25[3];
  }
  else {
    float64x2_t v34 = 0;
  }
  id v35 = v34;
  [v7 setRenderPipelineState:v35];

  uint64_t v36 = *(void *)(a1 + 192);
  CGRect v37 = [v10 textureName];
  CGRect v38 = -[PKMetalResourceHandler inkTextureNamed:image:](v36, v37, [v10 textureImage]);

  if (v38)
  {
    [v7 setFragmentTexture:v38 atIndex:0];
  }
  else
  {
    float64x2_t v39 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(t1.a) = 0;
      _os_log_error_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_ERROR, "Failed to load ink texture.", (uint8_t *)&t1, 2u);
    }
  }
  CGAffineTransform v40 = [v10 maskTextureName];
  BOOL v41 = v40 == 0;

  if (!v41)
  {
    uint64_t v42 = *(void *)(a1 + 192);
    long long v43 = [v10 maskTextureName];
    uint64_t v44 = -[PKMetalResourceHandler inkTextureNamed:image:](v42, v43, [v10 maskTextureImage]);

    if (v44) {
      [v7 setFragmentTexture:v44 atIndex:1];
    }
  }
}

- (void)setupRenderEncoder:(uint64_t)a1 forSDFPenStroke:(void *)a2 alphaFactor:(uint64_t)a3
{
  id v5 = a2;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v6 = *(unsigned __int8 *)(a3 + 73);
  if (!*(unsigned char *)(a3 + 74))
  {
    if (*(unsigned char *)(a3 + 73)) {
      int v7 = 4;
    }
    else {
      int v7 = 1;
    }
    if (*(unsigned char *)(a3 + 73)) {
      int v8 = 5;
    }
    else {
      int v8 = 2;
    }
    if (*(unsigned char *)(a3 + 72)) {
      int v6 = v8;
    }
    else {
      int v6 = v7;
    }
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9) {
    unint64_t v10 = -[PKMetalRenderState pipelineConfig](v9);
  }
  else {
    unint64_t v10 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
  }
  uint64_t v11 = *(void *)(a1 + 192);
  *(void *)&t1.double a = 14;
  memset((char *)&t1.b + 4, 0, 20);
  LODWORD(t1.b) = v6;
  LODWORD(t1.tx) = v10;
  HIDWORD(t1.tx) = WORD2(v10);
  uint64_t v12 = -[PKMetalResourceHandler namedShaderForKey:](v11, (long long *)&t1);
  int v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = *(void **)(v12 + 24);
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  [v5 setRenderPipelineState:v15];

  id v16 = *(id *)(a3 + 80);
  double v17 = -[PKMetalRenderer alphaForStroke:](a1, v16);
  if (v17 >= 0.97) {
    double v18 = 1.0;
  }
  else {
    double v18 = v17;
  }
  if (*(unsigned char *)(a3 + 337)) {
    double v18 = v18 * *(double *)(a1 + 1024);
  }
  long long v19 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v32.double a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v32.double c = v19;
  *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)(a3 + 144);
  memset(&v33, 0, sizeof(v33));
  *(double *)&long long v19 = -2.0 / *(double *)(a1 + 232);
  v31.double a = 2.0 / *(double *)(a1 + 224);
  v31.double b = 0.0;
  v31.double c = 0.0;
  *(void *)&v31.float d = v19;
  *(_OWORD *)&v31.tCGFloat x = xmmword_1C48267F0;
  long long v20 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.double a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.double c = v20;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.double a = *(unint64_t *)&v31.a;
  *(_OWORD *)&t2.double c = *(_OWORD *)&v31.c;
  *(_OWORD *)&t2.tCGFloat x = xmmword_1C48267F0;
  CGAffineTransformConcat(&v31, &t1, &t2);
  CGAffineTransformConcat(&v33, &v32, &v31);
  long long v34 = v22;
  long long v35 = v23;
  long long v36 = v24;
  long long v37 = v25;
  *(float *)&long long v22 = v18 * *(double *)(a3 + 304);
  int v38 = v22;
  float v26 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a3 + 80));
  float v40 = v26;
  long long v27 = *(void **)(a3 + 80);
  if (v27)
  {
    [v27 _inkTransform];
    float d = t1.d;
  }
  else
  {
    float d = 0.0;
  }
  float v39 = d;
  [v5 setVertexBytes:&v34 length:80 atIndex:1];
  [v5 setFragmentBytes:&v34 length:80 atIndex:0];
  long long v29 = -[PKMetalResourceHandler sdfPenMaxHeightLookupTexture](*(void *)(a1 + 192));
  [v5 setFragmentTexture:v29 atIndex:0];

  long long v30 = -[PKMetalResourceHandler sdfPenEllipseLookupTexture](*(void *)(a1 + 192));
  [v5 setFragmentTexture:v30 atIndex:1];
}

- (void)setupRenderEncoder:(uint64_t)a3 forPenStroke:(double)a4 alphaFactor:
{
  id v7 = a2;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  if (*(unsigned char *)(a3 + 284))
  {
    uint64_t v8 = *(void *)(a1 + 192);
    t1.tCGFloat x = COERCE_DOUBLE(1);
    *(void *)&t1.double a = 10;
    memset(&t1.b, 0, 24);
    -[PKMetalResourceHandler namedShaderForKey:](v8, (long long *)&t1);
    uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKMetalShader msaaPipelineStateWithSampleCount:](v9, *(void *)(a1 + 704));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v7 setRenderPipelineState:v10];
  }
  else
  {
    uint64_t v11 = [*(id *)(a3 + 80) ink];
    uint64_t v12 = [v11 behavior];
    int v13 = [v12 renderingDescriptor];
    uint64_t v14 = [v13 alternateMode];

    if (v14 == 1)
    {
      int v15 = *(unsigned __int8 *)(a3 + 73);
      if (!*(unsigned char *)(a3 + 74))
      {
        if (*(unsigned char *)(a3 + 72))
        {
          if (*(unsigned char *)(a3 + 73)) {
            int v15 = 5;
          }
          else {
            int v15 = 2;
          }
        }
        else if (*(unsigned char *)(a3 + 73))
        {
          int v15 = 4;
        }
        else
        {
          int v15 = 1;
        }
      }
      uint64_t v21 = *(void *)(a1 + 8);
      if (v21) {
        unint64_t v22 = -[PKMetalRenderState pipelineConfig](v21);
      }
      else {
        unint64_t v22 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
      }
      uint64_t v23 = *(void *)(a1 + 192);
      *(void *)&t1.double a = 15;
      memset((char *)&t1.b + 4, 0, 20);
      LODWORD(t1.b) = v15;
      LODWORD(t1.tx) = v22;
      HIDWORD(t1.tx) = WORD2(v22);
      uint64_t v24 = -[PKMetalResourceHandler namedShaderForKey:](v23, (long long *)&t1);
      uint64_t v9 = (id *)v24;
      if (v24) {
        long long v25 = *(void **)(v24 + 24);
      }
      else {
        long long v25 = 0;
      }
    }
    else
    {
      id v16 = [*(id *)(a3 + 80) ink];
      double v17 = [v16 behavior];
      double v18 = [v17 renderingDescriptor];
      uint64_t v19 = [v18 alternateMode];

      int v20 = *(unsigned __int8 *)(a3 + 73);
      if (v19 == 2)
      {
        if (!*(unsigned char *)(a3 + 74))
        {
          if (*(unsigned char *)(a3 + 72))
          {
            if (*(unsigned char *)(a3 + 73)) {
              int v20 = 5;
            }
            else {
              int v20 = 2;
            }
          }
          else if (*(unsigned char *)(a3 + 73))
          {
            int v20 = 4;
          }
          else
          {
            int v20 = 1;
          }
        }
        uint64_t v26 = *(void *)(a1 + 8);
        if (v26) {
          unint64_t v27 = -[PKMetalRenderState pipelineConfig](v26);
        }
        else {
          unint64_t v27 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
        }
        uint64_t v28 = *(void *)(a1 + 192);
        *(void *)&t1.double a = 16;
        memset((char *)&t1.b + 4, 0, 20);
        LODWORD(t1.b) = v20;
        LODWORD(t1.tx) = v27;
        HIDWORD(t1.tx) = WORD2(v27);
        uint64_t v29 = -[PKMetalResourceHandler namedShaderForKey:](v28, (long long *)&t1);
        uint64_t v9 = (id *)v29;
        if (v29) {
          long long v25 = *(void **)(v29 + 24);
        }
        else {
          long long v25 = 0;
        }
      }
      else
      {
        if (!*(unsigned char *)(a3 + 74))
        {
          if (*(unsigned char *)(a3 + 72))
          {
            if (*(unsigned char *)(a3 + 73)) {
              int v20 = 5;
            }
            else {
              int v20 = 2;
            }
          }
          else if (*(unsigned char *)(a3 + 73))
          {
            int v20 = 4;
          }
          else
          {
            int v20 = 1;
          }
        }
        int v30 = *(unsigned __int8 *)(a1 + 963);
        uint64_t v31 = *(void *)(a1 + 8);
        if (v31) {
          unint64_t v32 = -[PKMetalRenderState pipelineConfig](v31);
        }
        else {
          unint64_t v32 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
        }
        uint64_t v33 = *(void *)(a1 + 192);
        uint64_t v34 = 1;
        if (v30) {
          uint64_t v34 = 2;
        }
        *(void *)&t1.double a = v34;
        memset((char *)&t1.b + 4, 0, 20);
        LODWORD(t1.b) = v20;
        LODWORD(t1.tx) = v32;
        HIDWORD(t1.tx) = WORD2(v32);
        uint64_t v35 = -[PKMetalResourceHandler namedShaderForKey:](v33, (long long *)&t1);
        uint64_t v9 = (id *)v35;
        if (v35) {
          long long v25 = *(void **)(v35 + 24);
        }
        else {
          long long v25 = 0;
        }
      }
    }
    id v10 = v25;
    [v7 setRenderPipelineState:v10];
  }

  id v36 = *(id *)(a3 + 80);
  double v37 = -[PKMetalRenderer alphaForStroke:](a1, v36);
  if (v37 >= 0.97) {
    double v38 = 1.0;
  }
  else {
    double v38 = v37;
  }
  if (*(unsigned char *)(a3 + 337)) {
    double v38 = v38 * *(double *)(a1 + 1024);
  }
  long long v39 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v56.double a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v56.double c = v39;
  *(_OWORD *)&v56.tCGFloat x = *(_OWORD *)(a3 + 144);
  memset(&v57, 0, sizeof(v57));
  *(double *)&long long v39 = -2.0 / *(double *)(a1 + 232);
  v55.double a = 2.0 / *(double *)(a1 + 224);
  v55.double b = 0.0;
  v55.double c = 0.0;
  *(void *)&v55.float d = v39;
  *(_OWORD *)&v55.tCGFloat x = xmmword_1C48267F0;
  long long v40 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.double a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.double c = v40;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.double a = *(unint64_t *)&v55.a;
  *(_OWORD *)&t2.double c = *(_OWORD *)&v55.c;
  *(_OWORD *)&t2.tCGFloat x = xmmword_1C48267F0;
  CGAffineTransformConcat(&v55, &t1, &t2);
  CGAffineTransformConcat(&v57, &v56, &v55);
  long long v58 = v42;
  long long v59 = v43;
  long long v60 = v44;
  long long v61 = v45;
  *(float *)&long long v42 = v38 * a4 * *(double *)(a3 + 304);
  int v62 = v42;
  float v46 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a3 + 80));
  float v63 = v46;
  int64x2_t v47 = 0uLL;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransform v48 = *(void **)(a3 + 80);
  if (v48)
  {
    [v48 _inkTransform];
    float32x2_t v49 = vcvt_f32_f64(*(float64x2_t *)&t1.a);
    int64x2_t v47 = (int64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&t1.c), *(float64x2_t *)&t1.tx);
  }
  else
  {
    float32x2_t v49 = 0;
  }
  DWORD2(v65) = 0;
  *(float32x2_t *)&long long v65 = v49;
  DWORD2(v66) = 0;
  *(void *)&long long v66 = v47.i64[0];
  DWORD2(v67) = 1065353216;
  *(void *)&long long v67 = vdupq_laneq_s64(v47, 1).u64[0];
  float v64 = 0.0;
  if (*(unsigned char *)(a1 + 962))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v51 = v50;
    if ([*(id *)(a3 + 80) _pointsCount])
    {
      [*(id *)(a3 + 80) timestamp];
    }
    else
    {
      int v53 = *(double **)(*(void *)(a3 + 96) + 80);
      if (*(double **)(*(void *)(a3 + 96) + 88) == v53) {
        double v52 = 0.0;
      }
      else {
        double v52 = *v53;
      }
    }
    float v54 = v51 - v52;
    float v64 = v54;
  }
  [v7 setVertexBytes:&v58 length:128 atIndex:1];
  [v7 setFragmentBytes:&v58 length:128 atIndex:0];
}

- (uint64_t)renderParticleRenderCache:(void *)a3 renderEncoder:(void *)a4 computeEncoder:(id *)a5 animatingStroke:(int)a6 secondaryParticles:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = x1_0;
  id v49 = a3;
  id v11 = a4;
  long long v42 = v10;
  uint64_t v12 = [a5[10] ink];
  unint64_t v13 = [v12 version];

  uint64_t v14 = [a5[10] ink];
  int v15 = [v14 behavior];
  if (a6) {
    [v15 secondaryParticleDescriptor];
  }
  else {
  id v16 = [v15 particleDescriptor];
  }

  long long v43 = v16;
  double v17 = [v16 maskTextureName];
  BOOL v18 = v17 != 0;

  CGAffineTransform v48 = -[PKMetalResourceHandler particleShaderKernelPipelineStateWithVariableSpacing:particleMasks:](*(void **)(a1 + 192), v13 > 2, v18);
  objc_msgSend(v11, "setComputePipelineState:");
  if (a6) {
    -[PKMetalParticleRenderCache secondaryBuffers](v10);
  }
  else {
    -[PKMetalSDFPenRenderCache buffers](v10);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  float v46 = a5;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v45 = *(void *)v58;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v57 + 1) + 8 * v22);
        uint64_t v56 = 0;
        if (v23) {
          uint64_t v24 = v23[5];
        }
        else {
          uint64_t v24 = 0;
        }
        long long v25 = *(void **)(a1 + 8);
        if (v25) {
          long long v25 = (void *)v25[7];
        }
        uint64_t v26 = *(void *)(a1 + 192);
        unint64_t v27 = v25;
        id v28 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v26, 20 * v24, (uint64_t)&v56, v27);

        unint64_t v29 = [v48 threadExecutionWidth];
        if (v23) {
          unint64_t v30 = v23[7];
        }
        else {
          unint64_t v30 = 0;
        }
        [v11 setComputePipelineState:v48];
        uint64_t v31 = -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v23);
        if (v23) {
          uint64_t v32 = v23[3];
        }
        else {
          uint64_t v32 = 0;
        }
        [v11 setBuffer:v31 offset:v32 atIndex:0];

        uint64_t v33 = -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v23);
        if (v23) {
          uint64_t v34 = v23[4];
        }
        else {
          uint64_t v34 = 0;
        }
        [v11 setBuffer:v33 offset:v34 atIndex:1];

        [v11 setBuffer:v28 offset:v56 atIndex:2];
        [v11 setBuffer:*(void *)(a1 + 696) offset:0 atIndex:3];
        unint64_t v54 = vcvtpd_u64_f64((double)v30 / (double)v29);
        int64x2_t v55 = vdupq_n_s64(1uLL);
        unint64_t v52 = v29;
        int64x2_t v53 = v55;
        [v11 dispatchThreadgroups:&v54 threadsPerThreadgroup:&v52];
        -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v49, (uint64_t)v46, a6);
        [v49 setVertexBuffer:v28 offset:v56 atIndex:0];
        if (v23)
        {
          unint64_t v35 = v23[5];
          unint64_t v36 = ((3 * v35) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v36 = 0;
          unint64_t v35 = 0;
        }
        uint64_t v51 = 0;
        double v37 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(a1 + 192), v35, &v51);
        [v49 drawIndexedPrimitives:3 indexCount:v36 indexType:v51 indexBuffer:v37 indexBufferOffset:0];
        if (v23) {
          uint64_t v38 = v23[5];
        }
        else {
          uint64_t v38 = 0;
        }

        v21 += v38;
        ++v22;
      }
      while (v20 != v22);
      uint64_t v39 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      uint64_t v20 = v39;
    }
    while (v39);
  }
  else
  {
    uint64_t v21 = 0;
  }

  [v46[10] _bounds];
  long long v40 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&v50.double a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&v50.double c = v40;
  *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)(a1 + 304);

  return v21;
}

- (uint64_t)renderSDFPenStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5
{
  id v9 = a5;
  if (*(unsigned char *)(a4 + 336)
    && ([*(id *)(a4 + 344) buffers],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    char v12 = 1;
    uint64_t v13 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:](a1, *(void **)(a4 + 344), v9, a4, 1);
  }
  else
  {
    char v12 = 0;
    uint64_t v13 = 0;
  }
  unint64_t v14 = *(void *)(a4 + 328);
  if (v14 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((a3 - a2) >> 3)) >= 2)
  {
    if (v9) {
      char v15 = v12;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:]((uint64_t)a1, v9, a4);
    }
    double v16 = -[PKMetalRenderer antialiasingThresholdForStroke:]((uint64_t)a1, *(void **)(a4 + 80));
    double v17 = *(char ***)(a4 + 48);
    BOOL v18 = v17;
    if (!v17) {
      BOOL v18 = *(char ***)(a4 + 32);
    }
    if (v18[1] == *v18)
    {
      std::vector<PKMetalSDFStrokeVertex>::resize(v18);
      double v17 = *(char ***)(a4 + 48);
    }
    double v81 = a1;
    if (!v17) {
      double v17 = *(char ***)(a4 + 32);
    }
    uint64_t v19 = *v18;
    *(void *)&v80[16] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    *(void *)&v80[24] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    *(void *)CGAffineTransform v80 = *MEMORY[0x1E4F1DB20];
    *(void *)&v80[8] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    if (a3 != a2)
    {
      uint64_t v20 = a2 + 88;
      if (a2 + 88 != a3)
      {
        unint64_t v21 = 0x8E38E38E38E38E39 * ((v17[1] - *v17) >> 2);
        __int16 v22 = COERCE_UNSIGNED_INT(-1.0);
        do
        {
          float64x2_t v23 = vsubq_f64(*(float64x2_t *)(v20 + 8), *(float64x2_t *)(v20 - 80));
          double v24 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v23, v23).f64[1]), v23.f64[0], v23.f64[0]));
          if (v24 >= 0.00000011920929)
          {
            float64x2_t v82 = v23;
            float64x2_t v83 = *(float64x2_t *)(v20 - 80);
            *(double *)&uint64_t v84 = v24;
            float64x2_t v85 = *(float64x2_t *)(v20 + 8);
            long double v25 = *(double *)(v20 - 32);
            double v26 = fmod(v25, 6.28318531);
            if (v25 <= 6.28318531 && v25 >= 0.0) {
              double v26 = v25;
            }
            if (v26 < 0.0) {
              double v26 = v26 + 6.28318531;
            }
            if (v26 == 0.0) {
              double v28 = 0.0;
            }
            else {
              double v28 = v26;
            }
            long double v29 = *(double *)(v20 + 56);
            double v30 = fmod(v29, 6.28318531);
            if (v29 <= 6.28318531 && v29 >= 0.0) {
              double v30 = v29;
            }
            if (v30 < 0.0) {
              double v30 = v30 + 6.28318531;
            }
            if (v30 == 0.0) {
              double v32 = 0.0;
            }
            else {
              double v32 = v30;
            }
            double v33 = *(double *)(v20 - 64);
            double v34 = *(double *)(v20 + 24);
            if (v14 + 12 >= v21)
            {
              unint64_t v35 = *(void **)(a4 + 88);
              if (v35)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:]((float *)v19, v14, 36);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)v81, v35, (uint64_t)v19, v14, (void *)0x24, 0, 0, v36, v37, v38, v39);
              }
              else if (v9)
              {
                long long v40 = *(void **)(a4 + 344);
                if (v40)
                {
                  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:]((float *)v19, v14, 36);
                  -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)v81, v40, (uint64_t)v19, v14, (void *)0x24, 0, v9, v41, v42, v43, v44);
                }
                else
                {
                  -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)v81, (uint64_t)v19, v14, 36, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, v9);
                }
                v86.origin.CGFloat x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a4, v14);
                v86.origin.CGFloat y = v45;
                v86.size.CGFloat width = v46;
                v86.size.CGFloat height = v47;
                *(CGRect *)CGAffineTransform v80 = CGRectUnion(*(CGRect *)v80, v86);
              }
              v13 += v14;
              *(void *)(a4 + 328) = 0;
              unint64_t v14 = 0;
            }
            float64x2_t v48 = vdivq_f64(v82, (float64x2_t)vdupq_lane_s64(v84, 0));
            _S2 = v28;
            _S16 = v32;
            _D4 = v16 + v33 + -2.0;
            _D3 = v16 + v34 + -2.0;
            *(void *)&v53.f64[0] = vdupq_laneq_s64((int64x2_t)v48, 1).u64[0];
            v53.f64[1] = -v48.f64[0];
            float64x2_t v54 = vsubq_f64(v53, v48);
            v48.f64[0] = vaddvq_f64(v48);
            float64_t v55 = v83.f64[0] - v48.f64[0] * _D4;
            float64_t v56 = v85.f64[0] + v48.f64[0] * _D3;
            *(float32x2_t *)&v53.f64[0] = vcvt_f32_f64(v83);
            float32x2_t v57 = vcvt_f32_f64(v85);
            __asm
            {
              FCVT            H6, D4
              FCVT            H1, D3
              FCVT            H7, S2
              FCVT            H2, S16
            }
            _D16 = *(void *)(v20 - 8);
            __asm { FCVT            H16, D16 }
            _D23 = *(void *)(v20 + 80);
            *(float *)&uint64_t v67 = v83.f64[0] + _D4 * v54.f64[0];
            _S19 = v83.f64[1] + vmuld_lane_f64(_D4, v54, 1);
            *((float *)&v67 + 1) = _S19;
            __asm { FCVT            H19, D23 }
            CGFloat v69 = &v19[36 * v14];
            *(void *)CGFloat v69 = v67;
            *((void *)v69 + 1) = *(void *)&v53.f64[0];
            *((float32x2_t *)v69 + 2) = v57;
            *((_WORD *)v69 + 12) = _H6;
            *((_WORD *)v69 + 13) = _H1;
            *((_WORD *)v69 + 14) = _H7;
            *((_WORD *)v69 + 15) = _H2;
            *((_WORD *)v69 + 16) = _D16;
            *((_WORD *)v69 + 17) = LOWORD(_S19);
            *(float *)&uint64_t v67 = v55;
            *(float *)&float64_t v55 = v83.f64[1] - _D4 * v54.f64[0];
            HIDWORD(v67) = LODWORD(v55);
            *(void *)(v69 + 36) = v67;
            *(float64_t *)(v69 + 44) = v53.f64[0];
            *(float32x2_t *)(v69 + 52) = v57;
            *((_WORD *)v69 + 30) = _H6;
            *((_WORD *)v69 + 31) = _H1;
            *((_WORD *)v69 + 32) = _H7;
            *((_WORD *)v69 + 33) = _H2;
            *((_WORD *)v69 + 34) = _D16;
            *((_WORD *)v69 + 35) = LOWORD(_S19);
            *(float *)&uint64_t v67 = v56;
            *((void *)v69 + 10) = *(void *)&v53.f64[0];
            *((float32x2_t *)v69 + 11) = v57;
            *((_WORD *)v69 + 48) = _H6;
            *((_WORD *)v69 + 49) = _H1;
            *((_WORD *)v69 + 50) = _H7;
            *((_WORD *)v69 + 51) = _H2;
            *((_WORD *)v69 + 52) = _D16;
            *((_WORD *)v69 + 53) = LOWORD(_S19);
            float64x2_t v70 = vmulq_n_f64(v54, _D3);
            float v71 = v85.f64[1] + v70.f64[0];
            *((float *)&v67 + 1) = v71;
            *((void *)v69 + 9) = v67;
            *(float32x2_t *)(v69 + 108) = vcvt_f32_f64(vsubq_f64(v85, v70));
            *(float64_t *)(v69 + 116) = v53.f64[0];
            *(float32x2_t *)(v69 + 124) = v57;
            *((_WORD *)v69 + 66) = _H6;
            *((_WORD *)v69 + 67) = _H1;
            *((_WORD *)v69 + 68) = _H7;
            *((_WORD *)v69 + 69) = _H2;
            *((_WORD *)v69 + 70) = _D16;
            *((_WORD *)v69 + 71) = LOWORD(_S19);
            if (v20 + 88 == a3 && (_D4 - _D3) / *(double *)&v84 < 1.0)
            {
              _D4 = *(void *)(v20 + 80);
              *(float *)&uint64_t v73 = v85.f64[0] - _D3;
              *(float *)&unsigned int v74 = v85.f64[1] - _D3;
              CGRect v75 = (float32x2_t *)&v19[36 * v14 + 144];
              *CGRect v75 = (float32x2_t)__PAIR64__(v74, v73);
              v75[1] = v57;
              v75[2] = v57;
              __asm { FCVT            H4, D4 }
              v75[3].i16[0] = _H1;
              v75[3].i16[1] = v22;
              v75[3].i16[2] = _H2;
              v75[3].i16[3] = v22;
              v75[4].i16[0] = _D4;
              v75[4].i16[1] = _D4;
              float v76 = v85.f64[1] + _D3;
              *((float *)&v73 + 1) = v76;
              float64x2_t v77 = &v19[36 * v14];
              *(void *)(v77 + 180) = v73;
              *(float32x2_t *)(v77 + 188) = v57;
              *(float32x2_t *)(v77 + 196) = v57;
              *((_WORD *)v77 + 102) = _H1;
              *((_WORD *)v77 + 103) = v22;
              *((_WORD *)v77 + 104) = _H2;
              *((_WORD *)v77 + 105) = v22;
              *((_WORD *)v77 + 106) = _D4;
              *((_WORD *)v77 + 107) = _D4;
              *(float *)&uint64_t v78 = v85.f64[0] + _D3;
              *((float *)&v78 + 1) = v76;
              *(void *)(v77 + 252) = v78;
              v77 += 252;
              *(void *)(v77 - 36) = __PAIR64__(v74, v78);
              *(float32x2_t *)(v77 - 28) = v57;
              *(float32x2_t *)(v77 - 20) = v57;
              *((_WORD *)v77 - 6) = _H1;
              *((_WORD *)v77 - 5) = v22;
              *((_WORD *)v77 - 4) = _H2;
              *((_WORD *)v77 - 3) = v22;
              *((_WORD *)v77 - 2) = _D4;
              *((_WORD *)v77 - 1) = _D4;
              v14 += 8;
              *((float32x2_t *)v77 + 1) = v57;
              *((float32x2_t *)v77 + 2) = v57;
              *((_WORD *)v77 + 12) = _H1;
              *((_WORD *)v77 + 13) = v22;
              *((_WORD *)v77 + 14) = _H2;
              *((_WORD *)v77 + 15) = v22;
              *((_WORD *)v77 + 16) = _D4;
              *((_WORD *)v77 + 17) = _D4;
            }
            else
            {
              v14 += 4;
            }
          }
          v20 += 88;
        }
        while (v20 != a3);
      }
    }
    uint64_t v13 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:](v81, (float *)v19, v14, v13, (void *)0x24, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, a4, 0, *(CGFloat *)v80, *(CGFloat *)&v80[8], *(CGFloat *)&v80[16], *(CGFloat *)&v80[24], v9);
  }

  return v13;
}

- (uint64_t)renderPenStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5
{
  v138[0] = a2;
  v138[1] = a3;
  id v9 = a5;
  if (*(unsigned char *)(a4 + 336)
    && ([*(id *)(a4 + 344) buffers],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11))
  {
    char v12 = 1;
    uint64_t v13 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:](a1, *(void **)(a4 + 344), v9, a4, 1);
  }
  else
  {
    char v12 = 0;
    uint64_t v13 = 0;
  }
  unint64_t v14 = *(void *)(a4 + 328);
  unint64_t v137 = v14;
  if (v14 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) >= 2)
  {
    if (v9) {
      char v15 = v12;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:]((uint64_t)a1, v9, a4, 1.0);
    }
    memset(&v136, 0, sizeof(v136));
    double v16 = *(void **)(a4 + 80);
    if (v16)
    {
      [v16 _inkTransform];
      double b = v136.b;
      double a = v136.a;
      double d = v136.d;
      double c = v136.c;
      tCGFloat y = v136.ty;
      tCGFloat x = v136.tx;
      float64x2_t v23 = *(void **)(a4 + 80);
    }
    else
    {
      float64x2_t v23 = 0;
      tCGFloat y = 0.0;
      tCGFloat x = 0.0;
      double d = 0.0;
      double c = 0.0;
      double b = 0.0;
      double a = 0.0;
    }
    CGAffineTransform v134 = v136;
    memset(&v135, 0, sizeof(v135));
    CGAffineTransformInvert(&v135, &v134);
    if ([v23 _pointsCount])
    {
      [*(id *)(a4 + 80) timestamp];
      double v119 = v24;
    }
    else
    {
      long double v25 = *(double **)(*(void *)(a4 + 96) + 80);
      if (*(double **)(*(void *)(a4 + 96) + 88) == v25) {
        double v26 = 0.0;
      }
      else {
        double v26 = *v25;
      }
      double v119 = v26;
    }
    uint64_t v27 = *(void *)(a4 + 16);
    if (!v27) {
      uint64_t v27 = *(void *)a4;
    }
    double v28 = *(float **)v27;
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    if (a3 != a2)
    {
      uint64_t v29 = *(void *)(v27 + 8);
      double v36 = (double *)(-[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:]((uint64_t)a1, v138, a4) + 88);
      if (v36 != (double *)a3)
      {
        double v126 = ty + d * 0.0 + b;
        double v127 = tx + c * 0.0 + a;
        double v124 = ty + d + b * 0.0;
        double v125 = tx + c + a * 0.0;
        do
        {
          double v37 = *(v36 - 10);
          double v38 = *(v36 - 9);
          double v39 = v36[1];
          double v40 = v36[2];
          double v41 = v135.tx + v38 * v135.c + v135.a * v37;
          double v42 = v135.ty + v38 * v135.d + v135.b * v37;
          double v43 = v135.tx + v40 * v135.c + v135.a * v39 - v41;
          double v44 = v135.ty + v40 * v135.d + v135.b * v39 - v42;
          double v45 = sqrt(v44 * v44 + v43 * v43);
          if (v45 >= 0.00000011920929)
          {
            double v120 = v135.ty + v40 * v135.d + v135.b * v39;
            double v121 = v135.tx + v40 * v135.c + v135.a * v39;
            double v122 = v36[2];
            double v123 = v36[1];
            double v46 = *(v36 - 8);
            double v133 = v36[3];
            double v130 = *(v36 - 11);
            double v132 = v36[9];
            unint64_t v47 = v137;
            double v128 = *(v36 - 2);
            if (v137 + 12 >= 0xCCCCCCCCCCCCCCCDLL * ((v29 - (uint64_t)v28) >> 2))
            {
              float64x2_t v48 = *(void **)(a4 + 88);
              if (v48)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v28, v137, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v48, (uint64_t)v28, v47, (void *)0x14, 0, 0, v49, v50, v51, v52);
              }
              else if (v9)
              {
                float64x2_t v53 = *(void **)(a4 + 344);
                if (v53)
                {
                  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v28, v137, 20);
                  -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v53, (uint64_t)v28, v47, (void *)0x14, 0, v9, v54, v55, v56, v57);
                }
                else
                {
                  -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)a1, (uint64_t)v28, v137, 20, ((3 * v137) >> 1) & 0x3FFFFFFFFFFFFFFFLL, v9);
                }
                v141.origin.CGFloat x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a4, v47);
                v141.origin.CGFloat y = v58;
                v141.size.CGFloat width = v59;
                v141.size.CGFloat height = v60;
                v139.origin.CGFloat y = y;
                v139.origin.CGFloat x = x;
                v139.size.CGFloat height = height;
                v139.size.CGFloat width = width;
                CGRect v140 = CGRectUnion(v139, v141);
                CGFloat y = v140.origin.y;
                CGFloat x = v140.origin.x;
                CGFloat height = v140.size.height;
                CGFloat width = v140.size.width;
              }
              v13 += v47;
              unint64_t v137 = 0;
              *(void *)(a4 + 328) = 0;
            }
            *(float *)&int v61 = v128;
            int v129 = v61;
            double v131 = v130 - v119;
            double v62 = (v46 - v133) / v45;
            if (v62 > -1.0 && v62 < 1.0)
            {
              double v64 = asin((v46 - v133) / v45) + -1.57079633;
              if (v64 == 0.0)
              {
                double sinval = 0.0;
                double cosval = 1.0;
              }
              else
              {
                __double2 v67 = __sincos_stret(v64);
                double cosval = v67.__cosval;
                double sinval = v67.__sinval;
              }
              double v68 = -(v43 / v45);
              double v69 = v44 / v45 * (v44 / v45 * cosval - v43 / v45 * sinval)
                  + v43 / v45 * (v43 / v45 * cosval + v44 / v45 * sinval);
              double v70 = v43 / v45 * v69;
              double v71 = v44 / v45 * v69;
              double v72 = v41 + v46 * v70;
              double v73 = v42 + v46 * v71;
              double v74 = v44 / v45 * v46;
              double v75 = v46 * v68;
              double v76 = v74 + v72;
              double v77 = v46 * v68 + v73;
              double v78 = v72 - v74;
              double v79 = v73 - v46 * v68;
              double v80 = v121 + v133 * v70;
              double v81 = v120 + v133 * v71;
              _D4 = v44 / v45 * v133;
              double v83 = v133 * v68;
              double v84 = _D4 + v80;
              double v85 = v80 - _D4;
              double v86 = v81 - v83;
              CGFloat v87 = v136.tx + v136.c * v77 + v136.a * v76;
              CGFloat v88 = v136.ty + v136.d * v77 + v136.b * v76;
              CGFloat v89 = v136.tx + v136.c * v79 + v136.a * v78;
              CGFloat v90 = v136.ty + v136.d * v79 + v136.b * v78;
              CGFloat v91 = v136.tx + v136.c * (v83 + v81) + v136.a * v84;
              CGFloat v92 = v136.ty + v136.d * (v83 + v81) + v136.b * v84;
              CGFloat v93 = v136.tx + v136.c * (v81 - v83) + v136.a * v85;
              CGFloat v94 = v136.ty + v136.d * v86 + v136.b * v85;
              _D23 = v43 / v45 * (v46 * v69);
              _D21 = v44 / v45 * (v46 * v69);
              _D24 = _D23 - v74;
              _D25 = _D21 - v75;
              _D16 = v74 + _D23;
              _D17 = v75 + _D21;
              double v101 = v133 * v69;
              double v102 = v43 / v45 * v101;
              *(float *)&_D21 = v87;
              *(float *)&CGFloat v88 = v88;
              *(float *)&_D23 = _D24;
              *(float *)&_D24 = _D25;
              *(float *)&_D25 = v46;
              __asm
              {
                FCVT            H23, S23
                FCVT            H24, S24
                FCVT            H25, S25
              }
              unint64_t v106 = v137;
              uint64_t v107 = &v28[5 * v137];
              float *v107 = *(float *)&_D21;
              v107[1] = *(float *)&v88;
              *((_WORD *)v107 + 4) = LOWORD(_D23);
              *((_WORD *)v107 + 5) = LOWORD(_D24);
              *((_WORD *)v107 + 6) = LOWORD(_D25);
              double v108 = v44 / v45 * v101;
              _D6 = v102 - _D4;
              _D18 = v108 - v83;
              _D3 = _D4 + v102;
              *(float *)&_D4 = v131;
              __asm { FCVT            H4, S4 }
              LODWORD(_D21) = v129;
              __asm { FCVT            H21, S21 }
              *((_WORD *)v107 + 7) = LOWORD(_D4);
              *((_WORD *)v107 + 8) = LOWORD(_D21);
              *((_WORD *)v107 + 9) = 0;
              *(float *)&CGFloat v89 = v89;
              *(float *)&CGFloat v90 = v90;
              *(float *)&_D16 = _D16;
              *(float *)&_D17 = _D17;
              __asm
              {
                FCVT            H16, S16
                FCVT            H17, S17
              }
              v107[5] = *(float *)&v89;
              v107[6] = *(float *)&v90;
              *((_WORD *)v107 + 14) = LOWORD(_D16);
              *((_WORD *)v107 + 15) = LOWORD(_D17);
              *((_WORD *)v107 + 16) = LOWORD(_D25);
              *((_WORD *)v107 + 17) = LOWORD(_D4);
              *((_WORD *)v107 + 18) = LOWORD(_D21);
              _D0 = v83 + v108;
              *((_WORD *)v107 + 19) = 0;
              *(float *)&double v108 = v91;
              *(float *)&CGFloat v90 = v92;
              *(float *)&_D6 = _D6;
              *(float *)&_D16 = _D18;
              *(float *)&_D17 = v133;
              *(float *)&_D18 = v132;
              __asm
              {
                FCVT            H6, S6
                FCVT            H16, S16
                FCVT            H17, S17
                FCVT            H18, S18
              }
              v107[10] = *(float *)&v108;
              v107[11] = *(float *)&v90;
              *((_WORD *)v107 + 24) = LOWORD(_D6);
              *((_WORD *)v107 + 25) = LOWORD(_D16);
              *((_WORD *)v107 + 26) = LOWORD(_D17);
              *((_WORD *)v107 + 27) = LOWORD(_D4);
              *((_WORD *)v107 + 28) = LOWORD(_D18);
              *((_WORD *)v107 + 29) = 0;
              *(float *)&CGFloat v93 = v93;
              *(float *)&double v108 = v94;
              *(float *)&_D3 = _D3;
              *(float *)&_D0 = _D0;
              __asm { FCVT            H3, S3 }
              unint64_t v137 = v106 + 4;
              v107[15] = *(float *)&v93;
              v107[16] = *(float *)&v108;
              *((_WORD *)v107 + 34) = LOWORD(_D3);
              __asm { FCVT            H0, S0 }
              *((_WORD *)v107 + 35) = LOWORD(_D0);
              *((_WORD *)v107 + 36) = LOWORD(_D17);
              *((_WORD *)v107 + 37) = LOWORD(_D4);
              *((_WORD *)v107 + 38) = LOWORD(_D18);
              *((_WORD *)v107 + 39) = 0;
            }
            if (v36 + 11 == (double *)a3 && v62 < 1.0)
            {
              *(float *)&int v113 = v132;
            }
          }
          v36 += 11;
        }
        while (v36 != (double *)a3);
        unint64_t v14 = v137;
      }
    }
    uint64_t v13 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:](a1, v28, v14, v13, (void *)0x14, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, a4, 0, x, y, width, height, v9);
  }

  return v13;
}

- (uint64_t)renderParticleStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(char)a6 secondaryParticles:(int)a7 renderEncoder:(void *)a8
{
  v236[0] = a2;
  v236[1] = a3;
  id v202 = a8;
  char v13 = *(unsigned char *)(a4 + 336);
  if (!v13) {
    goto LABEL_6;
  }
  unint64_t v14 = [*(id *)(a4 + 344) buffers];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    char v13 = 0;
LABEL_6:
    uint64_t v17 = 0;
    goto LABEL_9;
  }
  -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v202, a4, a7);
  double v16 = *(void **)(a4 + 344);
  if (a7) {
    [v16 secondaryBuffers];
  }
  else {
  BOOL v18 = [v16 buffers];
  }
  uint64_t v17 = -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:](a1, v18, v202, (_anonymous_namespace_::AnimatingStroke *)a4, 1);

  char v13 = 1;
LABEL_9:
  unint64_t v19 = *(void *)(a4 + 328);
  if (v19 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) >= 2)
  {
    if (!v202) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0) {
      -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v202, a4, a7);
    }
    double v190 = [*(id *)(a4 + 80) ink];
    uint64_t v21 = 248;
    if (a7) {
      uint64_t v21 = 256;
    }
    *(void *)&long long v20 = *(void *)(a4 + v21);
    long long v228 = v20;
    double v194 = -[PKMetalRenderer alphaForStroke:](a1, *(void **)(a4 + 80));
    uint64_t v22 = *(void *)(a4 + 16);
    if (!v22) {
      uint64_t v22 = *(void *)a4;
    }
    double v24 = *(float **)v22;
    uint64_t v23 = *(void *)(v22 + 8);
    *(void *)double v199 = *MEMORY[0x1E4F1DB20];
    *(void *)&v199[8] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    *(void *)&v199[16] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    *(void *)&v199[24] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
    char v232 = a6;
    long double v25 = [v190 behavior];
    if (a7) {
      [v25 secondaryParticleDescriptor];
    }
    else {
    double v186 = [v25 particleDescriptor];
    }

    unsigned int v26 = [v186 particleCount];
    uint64_t v27 = *(void *)(a4 + 168);
    if (v27 <= *(void *)(a4 + 160)) {
      uint64_t v27 = *(void *)(a4 + 160);
    }
    uint64_t v185 = v17;
    uint64_t v230 = v23;
    if (v27 < 1) {
      [v186 particleSpacingForRadius:*(double *)(a2 + 24)];
    }
    else {
      [v186 particleSpacingForRadius:*(double *)(*(void *)(*(void *)(a4 + 96) + 80) + 24)];
    }
    double v187 = v28;
    uint64_t v29 = 268;
    if (a7) {
      uint64_t v29 = 272;
    }
    int v30 = *(_DWORD *)(a4 + v29);
    uint64_t v31 = -[PKMetalResourceHandler randomNumberArray](*(void *)(a1 + 192));
    [v186 particleSpacing];
    double v214 = v32;
    [v186 dynamicStep];
    double v206 = v33;
    uint64_t v207 = [v186 particleRotation];
    double v205 = [v186 maskTextureName];

    [v186 maskScale];
    double v35 = v34;
    [v190 weight];
    double v37 = v36;
    [v186 maskScaleConstant];
    double v39 = v38;
    [v186 maskMovement];
    double v40 = *MEMORY[0x1E4F1DAD8];
    double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v226 = v42;
    if ([v186 maskInitialRandomOffset])
    {
      __int16 v43 = *(_DWORD *)(a4 + 264);
      double v40 = *(float *)(v31 + 4 * (v43 & 0xFFF));
      double v41 = *(float *)(v31 + 4 * ((v43 + 1) & 0xFFF));
    }
    [*(id *)(a4 + 80) _anchorPointForTexture];
    double v45 = v44;
    double v47 = v46;
    [v186 particleSize];
    double v200 = v49;
    double v201 = v48;
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) >= 2)
    {
      double v50 = *(double *)(a2 + 24);
      unint64_t v51 = -[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:](a1, v236, a4);
      unint64_t v53 = v51 + 88;
      if (v51 + 88 != a3)
      {
        unint64_t v54 = v51;
        unint64_t v204 = 0xCCCCCCCCCCCCCCCDLL * ((v230 - (uint64_t)v24) >> 2);
        double v195 = 1.0 / (v39 + v35 * v37);
        double v198 = v195 * v226;
        double v196 = v41 - v195 * v226 * v47;
        double v197 = v40 - v195 * v226 * v45;
        double v55 = -(v50 * v201);
        float v203 = (float)v26;
        double v56 = v200 * v50;
        char v189 = v232 ^ 1;
        uint64_t v57 = 4;
        if (a5) {
          uint64_t v57 = 8;
        }
        unint64_t v188 = v57;
        double v219 = -(v50 * v200);
        double v220 = v201 * v50;
        double v217 = v201 * v50;
        double v218 = v219;
        double v58 = -(v50 * v201);
        double v59 = v200 * v50;
        long long v60 = v228;
        while (1)
        {
          double v61 = v59;
          double v62 = v58;
          double v63 = v55;
          long long v229 = v60;
          unint64_t v191 = v53;
          double v64 = *(double *)(v54 + 24);
          double v225 = *(double *)(v54 + 16);
          double v227 = *(double *)(v54 + 8);
          int8x16_t v233 = *(int8x16_t *)(v54 + 32);
          *(void *)&long long v52 = *(void *)(v54 + 80);
          double v65 = *(double *)(v54 + 96);
          double v66 = *(double *)(v54 + 104);
          double v67 = *(double *)(v54 + 112);
          v68.f64[0] = *(float64_t *)(v54 + 128);
          long double v215 = *(double *)(v54 + 144);
          long double v216 = *(double *)(v54 + 56);
          v68.f64[1] = *(float64_t *)(v54 + 120);
          v69.f64[0] = *(float64_t *)(v54 + 168);
          v69.f64[1] = *(float64_t *)(v54 + 160);
          float64x2_t v210 = v69;
          float64x2_t v212 = v68;
          long long v223 = v52;
          *(void *)&v69.f64[0] = v52;
          v69.f64[1] = *(float64_t *)(v54 + 72);
          float64x2_t v231 = v69;
          if ((unint64_t)[v190 version] >= 3)
          {
            double v70 = 1.0;
            long long v60 = v223;
            if (*(double *)&v223 < 1.0) {
              *(double *)&long long v60 = 1.0;
            }
            if (v64 >= 1.0) {
              double v70 = v64;
            }
            if (!a7) {
              *(double *)&long long v60 = v70;
            }
            double v214 = v187 * *(double *)&v60;
          }
          double v71 = v65 - v227;
          double v72 = v66 - v225;
          double v73 = sqrt(v72 * v72 + v71 * v71);
          *((void *)&v52 + 1) = *((void *)&v229 + 1);
          if (v73 > *(double *)&v229) {
            break;
          }
          double v77 = v73;
          double v96 = *(double *)&v229;
          double v55 = v63;
          double v58 = v62;
          double v59 = v61;
LABEL_85:
          char v170 = v189;
          if (v54 + 176 != a3) {
            char v170 = 1;
          }
          if ((v170 & 1) == 0 && v19 >= v188)
          {
            uint64_t v171 = &v24[5 * v19];
            double v172 = (*(double *)(v54 + 104) - *(double *)(v54 + 16)) * (*(v171 - 4) - *(v171 - 9))
                 + (*(v171 - 5) - *(v171 - 10)) * (*(double *)(v54 + 96) - *(double *)(v54 + 8));
            BOOL v173 = v172 < 0.0;
            double v174 = 2.5;
            if (v172 >= 0.0) {
              double v175 = 2.5;
            }
            else {
              double v175 = 0.5;
            }
            if (!v173) {
              double v174 = 0.5;
            }
            unint64_t v176 = &v24[5 * v19 - 7];
            char v177 = 1;
            do
            {
              char v178 = v177;
              _H2 = *((_WORD *)v176 + 10);
              __asm { FCVT            D2, H2 }
              _D2 = v175 * _D2;
              __asm { FCVT            H2, D2 }
              *((_WORD *)v176 + 10) = LOWORD(_D2);
              LOWORD(_D2) = *(_WORD *)v176;
              __asm { FCVT            D2, H2 }
              _D2 = v174 * _D2;
              __asm { FCVT            H2, D2 }
              *(_WORD *)unint64_t v176 = LOWORD(_D2);
              v176 -= 10;
              char v177 = 0;
            }
            while ((v178 & 1) != 0);
          }
          *(double *)&long long v60 = v96 - v77;
          unint64_t v54 = v191;
          unint64_t v53 = v191 + 88;
          if (v191 + 88 == a3)
          {
            if (a7) {
              goto LABEL_98;
            }
LABEL_100:
            *(void *)(a4 + 248) = v60;
            *(_DWORD *)(a4 + 268) = v30;
            goto LABEL_101;
          }
        }
        double v221 = v72 / v73;
        double v222 = v71 / v73;
        double v224 = v64;
        double v74 = v67 - v64;
        float64x2_t v75 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
        float64x2_t v234 = (float64x2_t)vextq_s8(v233, v233, 8uLL);
        float64x2_t v209 = vdivq_f64(vsubq_f64(v212, v234), v75);
        float64x2_t v211 = vdivq_f64(vsubq_f64(v210, v231), v75);
        char v76 = a5;
        double v77 = v73;
        double v213 = v73;
        double v208 = v74 / v73;
        double v55 = v63;
        double v58 = v62;
        double v59 = v61;
        while (1)
        {
          if (v19 + 12 >= v204)
          {
            if (v202)
            {
              double v80 = *(void **)(a4 + 344);
              if (v80)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v24, v19, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v80, (uint64_t)v24, v19, (void *)0x14, a7, v202, v81, v82, v83, v84);
              }
              else
              {
                -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:](a1, (uint64_t)v24, v19, 20, 6 * (v19 >> 2), v202);
              }
              v237.origin.CGFloat x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a4, v19);
              v237.origin.CGFloat y = v90;
              v237.size.CGFloat width = v91;
              v237.size.CGFloat height = v92;
              *(CGRect *)double v199 = CGRectUnion(*(CGRect *)v199, v237);
            }
            else
            {
              double v85 = *(void **)(a4 + 88);
              if (v85)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v24, v19, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v85, (uint64_t)v24, v19, (void *)0x14, a7, 0, v86, v87, v88, v89);
              }
            }
            double v78 = v58;
            double v79 = v55;
            unint64_t v19 = 0;
            *(void *)(a4 + 328) = 0;
          }
          else
          {
            double v78 = v58;
            double v79 = v55;
          }
          double v77 = v77 - *(double *)&v229;
          double v93 = v224 + v208 * *(double *)&v229;
          float64x2_t v234 = vmlaq_n_f64(v234, v209, *(double *)&v229);
          float64x2_t v231 = vmlaq_n_f64(v231, v211, *(double *)&v229);
          DKDMixAnglesInRadians(v216, v215, (v213 - v77) / v213);
          double v224 = v93;
          double v95 = a7 ? v231.f64[0] : v93;
          double v96 = v206 > 0.0 ? v214 * v95 / v206 : v214;
          float v97 = *(float *)(v31 + 4 * (v30 & 0xFFF));
          if (v207 == 2) {
            break;
          }
          CGAffineTransformMakeRotation(&v235, v94);
          *(CGFloat *)&long long v52 = v235.a;
          double b = v235.b;
          double c = v235.c;
          double d = v235.d;
          tCGFloat x = v235.tx;
          tCGFloat y = v235.ty;
          float64x2_t v104 = v234;
          if ((unint64_t)(v207 - 1) <= 1) {
            goto LABEL_65;
          }
LABEL_66:
          double v108 = v222 * *(double *)&v229 + v227;
          double v109 = v221 * *(double *)&v229 + v225;
          if (v104.f64[0] > 0.0)
          {
            double v110 = fmax(fmin((float)(*(float *)(v31 + 4 * (((_WORD)v30 + 2) & 0xFFF)) * 100.0) / 200.0, 1.0), 0.0);
            double v111 = (v110 * (v110 * (v110 * -2.0)) + v110 * 3.0 * v110) * (v104.f64[0] + v104.f64[0]) + 0.0;
            double v108 = v222 * *(double *)&v229 + v227 + (tx + c * 0.0 - *(double *)&v52) * v111;
            double v109 = v221 * *(double *)&v229 + v225 + (ty + d * 0.0 - b) * v111;
          }
          double v225 = v221 * *(double *)&v229 + v225;
          double v227 = v222 * *(double *)&v229 + v227;
          double v112 = 1.0;
          double v113 = 1.0;
          double v55 = v79;
          if ((a7 & 1) == 0)
          {
            double v114 = 2.5;
            if ((v76 & 1) == 0) {
              double v114 = 1.0;
            }
            double v113 = v194 * vmuld_lane_f64(v114, v231, 1);
            double v115 = 0.5;
            if ((v76 & 1) == 0) {
              double v115 = 1.0;
            }
            double v112 = v194 * vmuld_lane_f64(v115, v231, 1);
          }
          signed int v116 = (int)(float)(v97 * v203) % v26;
          _S7 = (float)v116 / v203;
          _S2 = (float)(v116 + 1) / v203;
          double v58 = v78;
          double v119 = v221 * (v59 - v218) + (v78 - v55) * v222;
          _NF = v119 < 0.0;
          if (v119 >= 0.0) {
            double v121 = v112;
          }
          else {
            double v121 = v113;
          }
          if (!_NF) {
            double v112 = v113;
          }
          double v122 = v55 + v108;
          double v123 = v218 + v109;
          if (v205)
          {
            double v124 = v197 + v198 * v108;
            double v125 = v196 + v198 * v109;
            float v126 = v122;
            float v127 = v123;
            double v128 = &v24[5 * v19];
            *double v128 = v126;
            v128[1] = v127;
            _S17 = v195 * v55 + v124;
            _S18 = v195 * v218 + v125;
            __asm
            {
              FCVT            H17, S17
              FCVT            H18, S18
            }
            *((_WORD *)v128 + 8) = LOWORD(_S17);
            *((_WORD *)v128 + 9) = LOWORD(_S18);
            float v134 = v78 + v108;
            float v135 = v59 + v109;
            v128[5] = v134;
            v128[6] = v135;
            __asm { FCVT            H7, S7 }
            *((_WORD *)v128 + 4) = _H7;
            *((_WORD *)v128 + 14) = _H7;
            _S7 = v195 * v78 + v124;
            _S17 = v195 * v59 + v125;
            __asm
            {
              FCVT            H7, S7
              FCVT            H17, S17
            }
            *((_WORD *)v128 + 18) = LOWORD(_S7);
            *((_WORD *)v128 + 19) = LOWORD(_S17);
            float v139 = v220 + v108;
            float v140 = v219 + v109;
            v128[10] = v139;
            v128[11] = v140;
            _S5 = v112;
            __asm { FCVT            H5, S5 }
            *((_WORD *)v128 + 6) = LOWORD(_S5);
            *((_WORD *)v128 + 26) = LOWORD(_S5);
            _S5 = v195 * v220 + v124;
            __asm { FCVT            H5, S5 }
            *((_WORD *)v128 + 28) = LOWORD(_S5);
            _S5 = v195 * v219 + v125;
            __asm { FCVT            H5, S5 }
            *((_WORD *)v128 + 29) = LOWORD(_S5);
            _S4 = v234.f64[1];
            __asm { FCVT            H4, S4 }
            *((_WORD *)v128 + 5) = 0;
            *((_WORD *)v128 + 7) = _H4;
            _S3 = v121;
            __asm { FCVT            H3, S3 }
            __int16 v148 = COERCE_UNSIGNED_INT(1.0);
            *((_WORD *)v128 + 15) = COERCE_UNSIGNED_INT(1.0);
            *((_WORD *)v128 + 16) = _H3;
            *((_WORD *)v128 + 17) = _H4;
            __asm { FCVT            H2, S2 }
            *((_WORD *)v128 + 24) = _H2;
            *((_WORD *)v128 + 25) = 0;
            *((_WORD *)v128 + 27) = _H4;
            float v150 = v217 + v108;
            v128[15] = v150;
            BOOL v151 = v128 + 15;
            _S1 = v195 * v217 + v124;
            _S6 = v195 * v56 + v125;
            __asm
            {
              FCVT            H5, S1
              FCVT            H1, S6
            }
          }
          else
          {
            float v156 = v122;
            float v157 = v123;
            _S5 = v112;
            _S4 = v234.f64[1];
            __asm
            {
              FCVT            H7, S7
              FCVT            H17, S5
              FCVT            H4, S4
            }
            long long v162 = &v24[5 * v19];
            *long long v162 = v156;
            v162[1] = v157;
            *((_WORD *)v162 + 4) = _H7;
            _H5 = 0;
            *((_WORD *)v162 + 5) = 0;
            *((_WORD *)v162 + 6) = _H17;
            *((_WORD *)v162 + 7) = _H4;
            v162[4] = 0.0;
            float v163 = v78 + v108;
            float v164 = v59 + v109;
            _S3 = v121;
            __asm { FCVT            H3, S3 }
            v162[5] = v163;
            v162[6] = v164;
            *((_WORD *)v162 + 14) = _H7;
            __int16 v148 = COERCE_UNSIGNED_INT(1.0);
            *((_WORD *)v162 + 15) = COERCE_UNSIGNED_INT(1.0);
            *((_WORD *)v162 + 16) = _H3;
            *((_WORD *)v162 + 17) = _H4;
            v162[9] = 0.0;
            float v166 = v220 + v108;
            float v167 = v219 + v109;
            __asm { FCVT            H2, S2 }
            v162[10] = v166;
            v162[11] = v167;
            *((_WORD *)v162 + 24) = _H2;
            *((_WORD *)v162 + 25) = 0;
            *((_WORD *)v162 + 26) = _H17;
            *((_WORD *)v162 + 27) = _H4;
            v162[14] = 0.0;
            float v168 = v217 + v108;
            _H1 = 0;
            v162[15] = v168;
            BOOL v151 = v162 + 15;
          }
          char v76 = 0;
          LOBYTE(a5) = 0;
          float v169 = v56 + v109;
          v151[1] = v169;
          *((_WORD *)v151 + 4) = _H2;
          *((_WORD *)v151 + 5) = v148;
          *((_WORD *)v151 + 6) = _H3;
          *((_WORD *)v151 + 7) = _H4;
          *((_WORD *)v151 + 8) = _H5;
          *((_WORD *)v151 + 9) = _H1;
          v19 += 4;
          v30 += 3;
          *(double *)&long long v229 = v96;
          if (v77 <= v96) {
            goto LABEL_85;
          }
        }
        double v98 = *(float *)(v31 + 4 * (((_WORD)v30 + 1) & 0xFFF)) * 3.14159265;
        *(float *)&double v98 = v98 + v98;
        CGAffineTransformMakeRotation(&v235, *(float *)&v98);
        *(CGFloat *)&long long v52 = v235.a;
        double b = v235.b;
        double c = v235.c;
        double d = v235.d;
        tCGFloat x = v235.tx;
        tCGFloat y = v235.ty;
        float64x2_t v104 = v234;
LABEL_65:
        double v105 = v201 * vmuld_lane_f64(v95, v104, 1);
        double v79 = tx + -(v200 * v95 * c) - *(double *)&v52 * v105;
        double v220 = tx + *(double *)&v52 * v105 - v200 * v95 * c;
        double v218 = ty + -(v200 * v95 * d) - b * v105;
        double v219 = ty + b * v105 - v200 * v95 * d;
        double v106 = v200 * v95 * c;
        double v217 = tx + v106 + *(double *)&v52 * v105;
        double v107 = v200 * v95 * d;
        double v56 = ty + v107 + b * v105;
        double v78 = tx + v106 - *(double *)&v52 * v105;
        double v59 = ty + v107 - b * v105;
        goto LABEL_66;
      }
    }
    *(void *)&long long v60 = v228;
    if ((a7 & 1) == 0) {
      goto LABEL_100;
    }
LABEL_98:
    *(void *)(a4 + 256) = v60;
    *(_DWORD *)(a4 + 272) = v30;
LABEL_101:
    uint64_t v17 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:]((_OWORD *)a1, v24, v19, v185, (void *)0x14, 6 * (v19 >> 2), a4, a7, *(CGFloat *)v199, *(CGFloat *)&v199[8], *(CGFloat *)&v199[16], *(CGFloat *)&v199[24], v202);
  }
  return v17;
}

- (void)renderStrokeVertices:(unint64_t)a3 numVertices:(uint64_t)a4 vertexSize:(uint64_t)a5 numIndices:(void *)a6 renderEncoder:
{
  id v11 = a6;
  uint64_t v14 = 0;
  id v12 = -[PKMetalResourceHandler newBufferWithLength:bytes:outOffset:](*(id *)(a1 + 192), a4 * a3, a2, (uint64_t)&v14);
  [v11 setVertexBuffer:v12 offset:v14 atIndex:0];

  uint64_t v14 = 0;
  char v13 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(a1 + 192), a3, &v14);
  [v11 drawIndexedPrimitives:3 indexCount:a5 indexType:v14 indexBuffer:v13 indexBufferOffset:0];
}

- (unint64_t)fadeOutLimitFromPoints:(uint64_t)a3 animatingStroke:
{
  unint64_t v3 = *a2;
  if (!a3) {
    return v3;
  }
  if (*(unsigned char *)(a1 + 963) && (double v6 = *(double *)(a1 + 1048), v6 > 0.0) && (v7 = *(double *)(a1 + 1056), v7 > 0.0))
  {
    uint64_t v8 = *(void *)(a3 + 312);
    if (v8) {
      goto LABEL_6;
    }
    if (a2[1] != v3)
    {
      uint64_t v12 = 0;
      double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      uint64_t v15 = *MEMORY[0x1E4F1DB20];
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
      do
      {
        v19.origin.CGFloat x = *(CGFloat *)(v3 + v12 + 8);
        v19.origin.CGFloat y = *(CGFloat *)(v3 + v12 + 16);
        v19.size.CGFloat width = 1.0;
        v19.size.CGFloat height = 1.0;
        *(CGRect *)&uint64_t v15 = CGRectUnion(*(CGRect *)&v15, v19);
        if (v13 > v6 || v14 > v7)
        {
          uint64_t v8 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v3 - *a2 + v12) >> 3);
          *(void *)(a3 + 312) = v8;
          goto LABEL_22;
        }
        v12 += 88;
      }
      while (v3 + v12 != a2[1]);
      uint64_t v8 = *(void *)(a3 + 312);
LABEL_22:
      if (v8)
      {
        unint64_t v3 = *a2;
LABEL_6:
        unint64_t v9 = a2[1] - 88 * v8;
        if (v9 >= v3) {
          return v9;
        }
      }
    }
  }
  else if (*(unsigned char *)(a3 + 337))
  {
    unint64_t v10 = *(void *)(a3 + 312);
    if (v10)
    {
      unint64_t v11 = a2[1];
      if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v11 - v3) >> 3) > v10) {
        return v11 - 88 * v10;
      }
    }
  }
  return v3;
}

- (void)addBufferForRenderCache:(uint64_t)a3 strokeVertices:(unint64_t)a4 numVertices:(void *)a5 vertexSize:(char)a6 bounds:(void *)a7 secondaryParticles:(double)a8 renderEncoder:(double)a9
{
  id v21 = a2;
  id v22 = a7;
  *(void *)(a1 + 16) += 20 * a4;
  int v30 = 0;
  id v23 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](*(id *)(a1 + 192), (void)a5 * a4, a3, (uint64_t)&v30);
  double v24 = [PKMetalStrokeRenderCacheBuffer alloc];
  long double v25 = -[PKMetalStrokeRenderCacheBuffer initWithBuffer:offset:numVertices:vertexSize:bounds:]((id *)&v24->super.isa, v23, v30, (void *)a4, a5, a8, a9, a10, a11);
  if (a6) {
    [v21 addSecondaryBuffer:v25];
  }
  else {
    [v21 addBuffer:v25];
  }
  if (v22)
  {
    unsigned int v26 = -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v25);
    if (v25) {
      id v27 = v25[2];
    }
    else {
      id v27 = 0;
    }
    [v22 setVertexBuffer:v26 offset:v27 atIndex:0];

    uint64_t v29 = 0;
    double v28 = -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(void *)(a1 + 192), a4, &v29);
    [v22 drawIndexedPrimitives:3 indexCount:6 * (a4 >> 2) indexType:v29 indexBuffer:v28 indexBufferOffset:0];
  }
}

- (uint64_t)renderVerticies:(unint64_t)a3 size:(uint64_t)a4 numRenderedVertices:(void *)a5 vertexSize:(uint64_t)a6 numIndices:(uint64_t)a7 localClipRect:(char)a8 animatingStroke:(CGFloat)a9 secondaryParticles:(CGFloat)a10 renderEncoder:(CGFloat)a11
{
  id v25 = a13;
  unsigned int v26 = v25;
  if (a3)
  {
    if (v25)
    {
      -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, a6, v25);
      v40.origin.CGFloat x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a7, a3);
      v40.origin.CGFloat y = v27;
      v40.size.CGFloat width = v28;
      v40.size.CGFloat height = v29;
      v38.origin.CGFloat x = a9;
      v38.origin.CGFloat y = a10;
      v38.size.CGFloat width = a11;
      v38.size.CGFloat height = a12;
      CGRect v39 = CGRectUnion(v38, v40);
      long long v30 = a1[18];
      *(_OWORD *)&v37.double a = a1[17];
      *(_OWORD *)&v37.double c = v30;
      *(_OWORD *)&v37.tCGFloat x = a1[19];
    }
    else
    {
      uint64_t v31 = *(void **)(a7 + 88);
      if (v31)
      {
        -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](a2, a3, (uint64_t)a5);
        -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v31, (uint64_t)a2, a3, a5, a8, 0, v32, v33, v34, v35);
      }
    }
    a4 += a3;
    if (*(unsigned char *)(a7 + 336)) {
      *(void *)(a7 + 328) = a3;
    }
  }

  return a4;
}

- (void)generateRenderMaskForPaths:(void *)a3 renderCache:
{
  id v5 = a3;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  if (*a2 != v7)
  {
    uint64_t v8 = **(float ***)(a1 + 592);
    float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      __p = 0;
      id v21 = 0;
      uint64_t v22 = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&__p, *(const void **)v6, *(void *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3));
      unint64_t v9 = (char *)__p;
      unint64_t v10 = (v21 - (unsigned char *)__p) / 24;
      if (v21 != __p)
      {
        unint64_t v11 = 0;
        if (v10 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = (v21 - (unsigned char *)__p) / 24;
        }
        double v13 = v8 + 2;
        do
        {
          unint64_t v14 = v11 >> 1;
          if (v11) {
            unint64_t v14 = v10 + ~(v11 >> 1);
          }
          *((float32x2_t *)v13 - 1) = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(*(int64x2_t *)&v9[24 * v14]), v19));
          ++v11;
          *(void *)double v13 = 0;
          v13[2] = 0.0;
          v13 += 5;
        }
        while (v12 != v11);
      }
      -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v8, v10, 20);
      -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v5, (uint64_t)v8, v10, (void *)0x14, 0, 0, v15, v16, v17, v18);
      if (__p)
      {
        id v21 = __p;
        operator delete(__p);
      }
      v6 += 24;
    }
    while (v6 != v7);
  }
}

- (void)generatePaintCacheForStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 segmentSteps:(void *)a5 liveStrokePoints:(uint64_t)a6 liveStrokeStartTime:(double)a7 duration:(double)a8
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  v156[0] = a2;
  v156[1] = a3;
  if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) < 2)
  {
    uint64_t v8 = 0;
    goto LABEL_83;
  }
  uint64_t v140 = 0;
  CGRect v141 = &v140;
  uint64_t v142 = 0xB012000000;
  v143 = __Block_byref_object_copy__20;
  id v144 = __Block_byref_object_dispose__20;
  unint64_t v145 = "";
  float64x2_t v15 = 0uLL;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  int v146 = 0;
  int v147 = -1171354717 * ((uint64_t)(a3 - a2) >> 3);
  int v149 = 0;
  int v148 = 0;
  memset(&v139, 0, sizeof(v139));
  double v16 = *(void **)(a4 + 80);
  if (v16)
  {
    [v16 _inkTransform];
    float64x2_t v18 = *(float64x2_t *)&v139.a;
    float64x2_t v17 = *(float64x2_t *)&v139.c;
    float64x2_t v19 = (long long *)(v141 + 20);
    long long v20 = (long long *)(v141 + 16);
    float64x2_t v15 = *(float64x2_t *)&v139.tx;
    id v21 = (long long *)(v141 + 18);
    uint64_t v22 = (float32x2_t *)(v141 + 14);
    id v23 = (float32x2_t *)(v141 + 10);
    double v24 = (float32x2_t *)(v141 + 12);
  }
  else
  {
    id v23 = (float32x2_t *)&v150;
    double v24 = (float32x2_t *)&v151;
    uint64_t v22 = (float32x2_t *)&v152;
    long long v20 = &v153;
    float64x2_t v17 = 0uLL;
    id v21 = &v154;
    float64x2_t v18 = 0uLL;
    float64x2_t v19 = &v155;
  }
  v23[1].i32[0] = 0;
  *id v23 = vcvt_f32_f64(v18);
  v24[1].i32[0] = 0;
  float32x2_t *v24 = vcvt_f32_f64(v17);
  v22[1].i32[0] = 1065353216;
  *uint64_t v22 = vcvt_f32_f64(v15);
  CGAffineTransform v138 = v139;
  CGAffineTransformInvert(&v127, &v138);
  float32x2_t v25 = vcvt_f32_f64(*(float64x2_t *)&v127.a);
  float32x2_t v26 = vcvt_f32_f64(*(float64x2_t *)&v127.c);
  float32x2_t v27 = vcvt_f32_f64(*(float64x2_t *)&v127.tx);
  *((_DWORD *)v20 + 2) = 0;
  *(float32x2_t *)long long v20 = v25;
  *((_DWORD *)v21 + 2) = 0;
  *(float32x2_t *)id v21 = v26;
  *((_DWORD *)v19 + 2) = 1065353216;
  *(float32x2_t *)float64x2_t v19 = v27;
  uint64_t v134 = 0;
  float v135 = &v134;
  uint64_t v136 = 0x2020000000;
  uint64_t v137 = 0;
  uint64_t v130 = 0;
  double v131 = &v130;
  uint64_t v132 = 0x2020000000;
  uint64_t v133 = 0;
  uint64_t v28 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a4 + 80));
  uint64_t v107 = a6;
  if (!a6)
  {
    uint64_t v41 = 0;
    goto LABEL_26;
  }
  CGFloat v29 = *(char **)(a1 + 576);
  long long v30 = *(char **)(a1 + 568);
  unint64_t v31 = v29 - v30;
  if (!((unint64_t)(v29 - v30) >> 20))
  {
    unint64_t v32 = 0x10000 - (v31 >> 4);
    uint64_t v33 = *(void *)(a1 + 584);
    if (v32 > (v33 - (uint64_t)v29) >> 4)
    {
      uint64_t v34 = v33 - (void)v30;
      uint64_t v35 = v34 >> 3;
      if ((unint64_t)(v34 >> 3) <= 0x10000) {
        uint64_t v35 = 0x10000;
      }
      if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v35;
      }
      if (v36 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      CGAffineTransform v37 = (char *)operator new(16 * v36);
      CGRect v38 = &v37[16 * (v31 >> 4)];
      CGRect v39 = &v37[16 * v36];
      bzero(v38, 16 * v32);
      CGRect v40 = &v38[16 * v32];
      if (v29 != v30)
      {
        do
        {
          *((_OWORD *)v38 - 1) = *((_OWORD *)v29 - 1);
          v38 -= 16;
          v29 -= 16;
        }
        while (v29 != v30);
        CGFloat v29 = v30;
      }
      *(void *)(a1 + 568) = v38;
      *(void *)(a1 + 576) = v40;
      *(void *)(a1 + 584) = v39;
      a6 = v107;
      if (v29) {
        operator delete(v29);
      }
      goto LABEL_25;
    }
    bzero(*(void **)(a1 + 576), 16 * v32);
    double v42 = &v29[16 * v32];
    goto LABEL_24;
  }
  if (v31 != 0x100000)
  {
    double v42 = v30 + 0x100000;
LABEL_24:
    *(void *)(a1 + 576) = v42;
  }
LABEL_25:
  uint64_t v41 = *(void *)(a1 + 568);
LABEL_26:
  __int16 v43 = *(char **)(a1 + 528);
  double v44 = *(char **)(a1 + 520);
  double v45 = (char *)(v43 - v44);
  unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((v43 - v44) >> 3);
  uint64_t v105 = v28;
  if (!(v46 >> 16))
  {
    uint64_t v47 = *(void *)(a1 + 536);
    if (0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v43) >> 3) < 0x10000 - v46)
    {
      unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v44) >> 3);
      unint64_t v49 = 0x5555555555555556 * ((v47 - (uint64_t)v44) >> 3);
      if (v49 <= 0x10000) {
        unint64_t v49 = 0x10000;
      }
      if (v48 >= 0x555555555555555) {
        unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v50 = v49;
      }
      if (v50 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v51 = (char *)operator new(24 * v50);
      long long v52 = &v51[8 * ((v43 - v44) >> 3)];
      unint64_t v53 = &v51[24 * v50];
      size_t v54 = 1572840 - (void)v45 - (1572840 - (int)v45) % 0x18u + 24;
      bzero(v52, v54);
      uint64_t v55 = (uint64_t)&v52[v54];
      if (v43 != v44)
      {
        do
        {
          long long v56 = *(_OWORD *)(v43 - 24);
          *((void *)v52 - 1) = *((void *)v43 - 1);
          *(_OWORD *)(v52 - 24) = v56;
          v52 -= 24;
          v43 -= 24;
        }
        while (v43 != v44);
        __int16 v43 = v44;
      }
      *(void *)(a1 + 520) = v52;
      *(void *)(a1 + 528) = v55;
      *(void *)(a1 + 536) = v53;
      a6 = v107;
      if (v43)
      {
        operator delete(v43);
        uint64_t v55 = *(void *)(a1 + 528);
      }
      goto LABEL_43;
    }
    bzero(v43, 1572840 - (void)v45 - (1572840 - (int)v45) % 0x18u + 24);
    uint64_t v55 = (uint64_t)&v44[-((1572840 - ((int)v43 - (int)v44)) % 0x18u) + 1572864];
    a6 = v107;
    goto LABEL_42;
  }
  uint64_t v55 = *(void *)(a1 + 528);
  if (v45 != (char *)1572864)
  {
    uint64_t v55 = (uint64_t)(v44 + 1572864);
LABEL_42:
    *(void *)(a1 + 528) = v55;
  }
LABEL_43:
  uint64_t v57 = *(void *)(a1 + 520);
  double v106 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a4 + 80) _pointsCount])
  {
    [*(id *)(a4 + 80) timestamp];
    double v59 = v58;
  }
  else
  {
    long long v60 = *(double **)(*(void *)(a4 + 96) + 80);
    if (*(double **)(*(void *)(a4 + 96) + 88) == v60) {
      double v59 = 0.0;
    }
    else {
      double v59 = *v60;
    }
  }
  unint64_t v61 = -[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:](a1, v156, a4);
  v127.double a = 0.0;
  *(void *)&v127.double b = &v127;
  *(void *)&v127.double c = 0x5012000000;
  *(void *)&v127.double d = __Block_byref_object_copy__108;
  *(void *)&v127.tCGFloat x = __Block_byref_object_dispose__109;
  *(void *)&v127.tCGFloat y = "";
  long long v128 = 0u;
  long long v129 = 0u;
  [*(id *)(a4 + 80) _bounds];
  *(void *)&long long v128 = v62;
  *((void *)&v128 + 1) = v63;
  *(void *)&long long v129 = v64;
  *((void *)&v129 + 1) = v65;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__PKMetalRenderer_generatePaintCacheForStroke_animatingStroke_segmentSteps_liveStrokePoints_liveStrokeStartTime_duration___block_invoke;
  aBlock[3] = &unk_1E64C9148;
  double v121 = &v134;
  double v122 = &v127;
  uint64_t v125 = a6;
  uint64_t v126 = v41;
  double v123 = &v130;
  uint64_t v124 = v57;
  double v120 = &v140;
  aBlock[4] = a1;
  id v66 = v106;
  id v119 = v66;
  double v109 = (void (**)(void))_Block_copy(aBlock);
  float64x2_t v104 = v66;
  unint64_t v67 = a3;
  if (v61 + 88 != a3)
  {
    unint64_t v68 = 0;
    unint64_t v69 = 0xAAAAAAAAAAAAAAABLL * ((v55 - v57) >> 3);
    unint64_t v70 = v61;
    do
    {
      if (v68 >= (uint64_t)(a5[1] - *a5) >> 2) {
        int v71 = 8;
      }
      else {
        int v71 = *(_DWORD *)(*a5 + 4 * v68);
      }
      if (*(unsigned char *)(a1 + 963))
      {
        if (*(unsigned char *)(a1 + 962))
        {
          double v72 = *(double *)v70 - v59;
          if (v72 <= 255.996094) {
            double v73 = v72 * 256.0;
          }
          else {
            double v73 = 65535.0;
          }
          int v74 = (int)v73;
        }
        else
        {
          int v74 = 0xFFFF;
        }
      }
      else
      {
        int v74 = (unsigned __int16)v71;
      }
      float32x2_t v75 = vcvt_f32_f64(*(float64x2_t *)(v70 + 8));
      float v76 = *(double *)(v70 + 24);
      float v77 = *(double *)(v70 + 72);
      int v78 = v74 | (*((_DWORD *)v131 + 6) << 16);
      uint64_t v79 = v135[3];
      v135[3] = v79 + 1;
      double v80 = (float32x2_t *)(v57 + 24 * v79);
      float32x2_t *v80 = v75;
      v80[1].f32[0] = v76;
      v80[1].f32[1] = v77;
      v80[2].i32[0] = v78;
      double v81 = v131;
      uint64_t v82 = v131[3];
      int v83 = 8 * v71;
      if (v82 + 8 * v71 + 4 > v69)
      {
        v109[2]();
        double v84 = v135;
        v135[3] = 0;
        v131[3] = 0;
        uint64_t v85 = v84[3];
        v84[3] = v85 + 1;
        double v86 = (float32x2_t *)(v57 + 24 * v85);
        *double v86 = v75;
        v86[1].f32[0] = v76;
        v86[1].f32[1] = v77;
        v86[2].i32[0] = v74;
        double v81 = v131;
        uint64_t v82 = v131[3];
        unint64_t v67 = a3;
      }
      v81[3] = v82 + v83;
      ++v68;
      unint64_t v61 = v70 + 88;
      unint64_t v87 = v70 + 176;
      v70 += 88;
    }
    while (v87 != v67);
  }
  float32x2_t v88 = vcvt_f32_f64(*(float64x2_t *)(v61 + 8));
  float32_t v89 = *(double *)(v61 + 24);
  float32_t v90 = *(double *)(v61 + 72);
  uint64_t v91 = v135[3];
  v135[3] = v91 + 1;
  CGFloat v92 = (float32x2_t *)(v57 + 24 * v91);
  *CGFloat v92 = v88;
  v92[1].f32[0] = v89;
  v92[1].f32[1] = v90;
  v109[2]();
  if (v107)
  {
    double v93 = -[PKMetalLiveStrokePaintRenderCache initWithRenderZoomFactor:]([PKMetalLiveStrokePaintRenderCache alloc], v105);
    uint64_t v8 = v93;
    if (v93)
    {
      *((double *)v93 + 4) = a7;
      *((double *)v93 + 5) = a8;
      long long v94 = *(_OWORD *)(*(void *)&v127.b + 64);
      *((_OWORD *)v93 + 3) = *(_OWORD *)(*(void *)&v127.b + 48);
      *((_OWORD *)v93 + 4) = v94;
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v95 = v66;
    uint64_t v96 = [v95 countByEnumeratingWithState:&v114 objects:v158 count:16];
    if (v96)
    {
      uint64_t v97 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v96; ++i)
        {
          if (*(void *)v115 != v97) {
            objc_enumerationMutation(v95);
          }
          -[PKMetalLiveStrokePaintRenderCache addBuffer:]((uint64_t)v8, *(void **)(*((void *)&v114 + 1) + 8 * i));
        }
        uint64_t v96 = [v95 countByEnumeratingWithState:&v114 objects:v158 count:16];
      }
      while (v96);
    }
  }
  else
  {
    uint64_t v8 = -[PKMetalPaintRenderCache initWithPurgeableBuffers:renderZoomFactor:]([PKMetalPaintRenderCache alloc], *(unsigned char *)(a1 + 963) == 0, v105);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v99 = v66;
    uint64_t v100 = [v99 countByEnumeratingWithState:&v110 objects:v157 count:16];
    if (v100)
    {
      uint64_t v101 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v100; ++j)
        {
          if (*(void *)v111 != v101) {
            objc_enumerationMutation(v99);
          }
          -[PKMetalPaintRenderCache addBuffer:]((uint64_t)v8, *(void **)(*((void *)&v110 + 1) + 8 * j));
        }
        uint64_t v100 = [v99 countByEnumeratingWithState:&v110 objects:v157 count:16];
      }
      while (v100);
    }
  }

  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);
LABEL_83:

  return v8;
}

void __122__PKMetalRenderer_generatePaintCacheForStroke_animatingStroke_segmentSteps_liveStrokePoints_liveStrokeStartTime_duration___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 52) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  uint64_t v2 = *(void *)(a1 + 80) + 24 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v2 - 8) = *(unsigned __int16 *)(v2 - 8);
  uint64_t v3 = *(void *)(a1 + 80) + 24 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v3 - 8) = *(unsigned __int16 *)(v3 - 6) << 16;
  if (*(void *)(a1 + 88))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = *(void *)(a1 + 88);
        v9.origin.CGFloat x = COERCE_FLOAT(*(void *)(v6 + 8 * v5));
        v9.origin.CGFloat y = COERCE_FLOAT(HIDWORD(*(void *)(v6 + 8 * v5)));
        v9.size.CGFloat width = 1.0;
        v9.size.CGFloat height = 1.0;
        CGRect v10 = CGRectInset(v9, -20.0, -20.0);
        *(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 64)+ 8)+ 48), v10);
        *(void *)(*(void *)(a1 + 96) + v4) = *(void *)(*(void *)(a1 + 88) + 8 * v5);
        *(void *)(*(void *)(a1 + 96) + v4 + 8) = 1074790400;
        ++v5;
        v4 += 16;
      }
      while (v5 < *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    }
    uint64_t v7 = -[PKMetalLiveStrokePaintRenderCacheBuffer initWithPoints:liveStrokePoints:numPoints:numVertices:resourceHandler:]([PKMetalLiveStrokePaintRenderCacheBuffer alloc], *(void *)(a1 + 80), *(void *)(a1 + 96), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 4, *(void **)(*(void *)(a1 + 32) + 192));
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else
  {
    uint64_t v7 = -[PKMetalPaintRenderCacheBuffer initWithUniforms:points:numPoints:numVertices:resourceHandler:]([PKMetalPaintRenderCacheBuffer alloc], *(void *)(*(void *)(a1 + 48) + 8) + 48, *(void *)(a1 + 80), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 4, *(void **)(*(void *)(a1 + 32) + 192));
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
}

void __77__PKMetalRenderer_generateSDFPenCacheForStroke_animatingStroke_segmentSteps___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 52) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  uint64_t v2 = *(void *)(a1 + 72) + 24 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v2 - 8) = *(unsigned __int16 *)(v2 - 8);
  uint64_t v3 = *(void *)(a1 + 72) + 24 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v3 - 8) = *(unsigned __int16 *)(v3 - 6) << 16;
  uint64_t v4 = -[PKMetalSDFPenRenderCacheBuffer initWithUniforms:points:numPoints:numVertices:resourceHandler:]([PKMetalSDFPenRenderCacheBuffer alloc], *(void *)(*(void *)(a1 + 48) + 8) + 48, *(void *)(a1 + 72), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void **)(*(void *)(a1 + 32) + 192));
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

- (id)generateParticleCacheForStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(int)a6 secondaryParticles:(int)a7
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  if (a3 == a2)
  {
    uint64_t v7 = 0;
    goto LABEL_98;
  }
  uint64_t v9 = a2;
  unint64_t v145 = [*(id *)(a4 + 80) ink];
  unint64_t v11 = [v145 behavior];
  double v12 = -[PKInkBehavior alphaForStroke:](v11, *(void **)(a4 + 80));

  double v13 = *(char **)(a1 + 496);
  unint64_t v14 = *(char **)(a1 + 504);
  unint64_t v15 = v14 - v13;
  if (!((unint64_t)(v14 - v13) >> 21))
  {
    unint64_t v16 = 0x10000 - (v15 >> 5);
    uint64_t v17 = *(void *)(a1 + 512);
    if (v16 > (v17 - (uint64_t)v14) >> 5)
    {
      uint64_t v18 = v17 - (void)v13;
      uint64_t v19 = v18 >> 4;
      if ((unint64_t)(v18 >> 4) <= 0x10000) {
        uint64_t v19 = 0x10000;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      id v21 = (char *)operator new(32 * v20);
      uint64_t v22 = &v21[32 * (v15 >> 5)];
      id v23 = &v21[32 * v20];
      bzero(v22, 32 * v16);
      double v24 = &v22[32 * v16];
      if (v14 != v13)
      {
        do
        {
          long long v25 = *((_OWORD *)v14 - 1);
          *((_OWORD *)v22 - 2) = *((_OWORD *)v14 - 2);
          *((_OWORD *)v22 - 1) = v25;
          v22 -= 32;
          v14 -= 32;
        }
        while (v14 != v13);
        unint64_t v14 = v13;
      }
      *(void *)(a1 + 496) = v22;
      *(void *)(a1 + 504) = v24;
      *(void *)(a1 + 512) = v23;
      if (v14)
      {
        operator delete(v14);
        double v24 = *(char **)(a1 + 504);
      }
      goto LABEL_20;
    }
    bzero(*(void **)(a1 + 504), 32 * v16);
    double v24 = &v14[32 * v16];
    goto LABEL_19;
  }
  double v24 = *(char **)(a1 + 504);
  if (v15 != 0x200000)
  {
    double v24 = v13 + 0x200000;
LABEL_19:
    *(void *)(a1 + 504) = v24;
  }
LABEL_20:
  uint64_t v26 = *(void *)(a1 + 496);
  uint64_t v27 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a4 + 80));
  uint64_t v28 = [v145 behavior];
  if (a7) {
    [v28 secondaryParticleDescriptor];
  }
  else {
  CGFloat v29 = [v28 particleDescriptor];
  }

  float v135 = v29;
  int v30 = [v29 particleCount];
  [v29 particleSpacingForRadius:*(double *)(v9 + 24)];
  double v142 = v31;
  [v29 particleSpacing];
  double v33 = v32;
  [v29 dynamicStep];
  double v35 = v34;
  uint64_t v36 = [v29 particleRotation];
  [v29 particleSize];
  float64_t v148 = v38;
  float64_t v151 = v37;
  uint64_t v39 = -[PKMetalResourceHandler randomNumberArray](*(void *)(a1 + 192));
  v40.f64[0] = v151;
  v40.f64[1] = v148;
  float32x2_t v158 = vcvt_f32_f64(v40);
  *(float *)v40.f64 = v12;
  int v159 = LODWORD(v40.f64[0]);
  int v163 = v30;
  unint64_t v41 = [v145 version];
  double v42 = v142;
  if (v41 <= 2) {
    double v42 = v33;
  }
  float v43 = v42;
  float v44 = v35;
  float v160 = v43;
  float v161 = v44;
  BOOL v165 = v36 != 0;
  BOOL v166 = v36 == 2;
  char v167 = a5;
  char v168 = 0;
  [v29 maskScale];
  double v46 = v45;
  [v145 weight];
  double v48 = v47;
  [v29 maskScaleConstant];
  float v50 = 1.0 / (v49 + v46 * v48);
  float v169 = v50;
  [v29 maskMovement];
  double v140 = v35;
  double v51 = v33;
  *(float *)&double v52 = v52 * v50;
  float v170 = *(float *)&v52;
  uint64_t v53 = 268;
  if (a7) {
    uint64_t v53 = 272;
  }
  int v54 = *(_DWORD *)(a4 + v53);
  double v55 = *MEMORY[0x1E4F1DAD8];
  double v56 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([v29 maskInitialRandomOffset])
  {
    __int16 v57 = *(_DWORD *)(a4 + 264);
    double v55 = *(float *)(v39 + 4 * (v57 & 0xFFF));
    double v56 = *(float *)(v39 + 4 * ((v57 + 1) & 0xFFF));
  }
  uint64_t v138 = a1;
  [*(id *)(a4 + 80) _anchorPointForTexture];
  uint64_t v136 = (void *)v27;
  *(float *)&double v58 = v55 - v58 * v170;
  *(float *)&double v59 = v56 - v59 * v170;
  HIDWORD(v58) = LODWORD(v59);
  double v171 = v58;
  CGAffineTransform v139 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v60 = a3;
  uint64_t v61 = v9 + 88;
  if (v9 + 88 != a3)
  {
    double v62 = v51;
    uint64_t v63 = v24;
    uint64_t v64 = 0;
    unint64_t v65 = 0;
    int v66 = 0;
    uint64_t v67 = 0;
    unint64_t v68 = (uint64_t)&v63[-v26] >> 5;
    _D14 = 0.0;
    do
    {
      uint64_t v70 = v61;
      double v71 = *(double *)(v9 + 8);
      double v72 = *(double *)(v9 + 16);
      double v73 = sqrt((*(double *)(v9 + 104) - v72) * (*(double *)(v9 + 104) - v72)+ (*(double *)(v9 + 96) - v71) * (*(double *)(v9 + 96) - v71));
      if (v73 <= _D14)
      {
        _D14 = _D14 - v73;
      }
      else
      {
        double v149 = v62;
        double v143 = *(double *)(v9 + 112);
        double v74 = *(double *)(v9 + 80);
        uint64_t v152 = *(void *)(v9 + 72);
        long double v75 = *(double *)(v9 + 56);
        double v76 = *(double *)(v9 + 24);
        double v146 = *(double *)(v9 + 32);
        uint64_t v147 = *(void *)(v9 + 40);
        double v77 = fmod(v75, 6.28318531);
        if (v75 <= 6.28318531 && v75 >= 0.0) {
          double v77 = v75;
        }
        if (v77 < 0.0) {
          double v77 = v77 + 6.28318531;
        }
        if (v77 == 0.0) {
          double v79 = 0.0;
        }
        else {
          double v79 = v77;
        }
        if (a7) {
          _D11 = v74;
        }
        else {
          _D11 = v76;
        }
        _D0 = v152;
        __asm { FCVT            H0, D0 }
        if (!_ZF) {
          _H0 = COERCE_UNSIGNED_INT(1.0);
        }
        __int16 v153 = _H0;
        unint64_t v86 = [v145 version];
        *(float *)&uint64_t v88 = v71;
        float v87 = v72;
        *((float *)&v88 + 1) = v87;
        __asm { FCVT            H11, D11 }
        float v90 = v146;
        _D0 = v147;
        __asm { FCVT            H4, D0 }
        float v93 = v79;
        __asm { FCVT            H6, D14 }
        double v95 = 1.0;
        if (v74 >= 1.0) {
          double v96 = v74;
        }
        else {
          double v96 = 1.0;
        }
        if (v76 >= 1.0) {
          double v95 = v76;
        }
        if (!a7) {
          double v96 = v95;
        }
        double v97 = v142 * v96;
        double v62 = v149;
        if (v86 >= 3) {
          double v62 = v97;
        }
        if (v140 <= 0.0)
        {
          double v100 = fmax(floor((v73 - _D14) / v62), 0.0);
          unsigned int v99 = v100 + 1;
          _D14 = v62 - (v73 - _D14 - v100 * v62);
        }
        else
        {
          if (v73 >= _D14)
          {
            double v98 = (v143 - v76) / v73;
            do
            {
              double v73 = v73 - _D14;
              double v76 = v76 + v98 * _D14;
              _D14 = v62 * v76 / v140;
            }
            while (v73 >= _D14);
          }
          LOWORD(v99) = 0;
          _D14 = _D14 - v73;
        }
        uint64_t v101 = v64 + 1;
        if (v67 + 4 * (unint64_t)(unsigned __int16)v99 > v68 || v101 == v68)
        {
          uint64_t v102 = v26 + 32 * v64;
          uint64_t v150 = v88;
          *(void *)uint64_t v102 = v88;
          *(_DWORD *)(v102 + 8) = v67;
          *(float *)(v102 + 12) = v93;
          *(float *)(v102 + 16) = v90;
          float v103 = v146;
          __int16 v104 = _H6;
          *(_WORD *)(v102 + 20) = _H6;
          *(_WORD *)(v102 + 22) = _H11;
          __int16 v105 = _H4;
          *(_WORD *)(v102 + 24) = _H4;
          *(_WORD *)(v102 + 26) = v153;
          *(_DWORD *)(v102 + 28) = 0;
          *(void *)(v138 + 16) += 32 * v101;
          int v164 = v64 + 1;
          int v162 = v66;
          double v106 = -[PKMetalParticleRenderCacheBuffer initWithUniforms:points:numPoints:resourceHandler:]([PKMetalParticleRenderCacheBuffer alloc], (uint64_t)&v158, v26, v101, *(void **)(v138 + 192));
          [v139 addObject:v106];
          char v167 = 0;

          uint64_t v67 = 0;
          uint64_t v64 = 0;
          v66 += v101;
          uint64_t v88 = v150;
          _H4 = v105;
          float v90 = v103;
          _H6 = v104;
        }
        uint64_t v107 = v26 + 32 * v64++;
        *(void *)uint64_t v107 = v88;
        *(_DWORD *)(v107 + 8) = v67;
        *(float *)(v107 + 12) = v93;
        *(float *)(v107 + 16) = v90;
        *(_WORD *)(v107 + 20) = _H6;
        *(_WORD *)(v107 + 22) = _H11;
        *(_WORD *)(v107 + 24) = _H4;
        *(_WORD *)(v107 + 26) = v153;
        *(_WORD *)(v107 + 28) = v99;
        *(_WORD *)(v107 + 30) = v54;
        uint64_t v108 = 4 * (unsigned __int16)v99;
        v67 += v108;
        v65 += v108;
        v54 += 3 * (unsigned __int16)v99;
        uint64_t v60 = a3;
      }
      uint64_t v61 = v70 + 88;
      uint64_t v9 = v70;
    }
    while (v70 + 88 != v60);
    if (v64)
    {
      double v109 = (uint64_t *)(v60 - 64);
      double v110 = *(double *)(v60 - 56);
      _D10 = *(void *)(v60 - 48);
      long double v112 = *(double *)(v60 - 32);
      _D11 = *(void *)(v60 - 16);
      long long v114 = (uint64_t *)(v60 - 8);
      float32x2_t v115 = vcvt_f32_f64(*(float64x2_t *)(v60 - 80));
      double v116 = fmod(v112, 6.28318531);
      if (v112 <= 6.28318531 && v112 >= 0.0) {
        double v116 = v112;
      }
      if (v116 < 0.0) {
        double v116 = v116 + 6.28318531;
      }
      if (v116 == 0.0) {
        double v116 = 0.0;
      }
      if (a7) {
        uint64_t v118 = v114;
      }
      else {
        uint64_t v118 = v109;
      }
      _D1 = *v118;
      __asm { FCVT            H1, D1 }
      float v121 = v110;
      __asm { FCVT            H3, D10 }
      float v123 = v116;
      __asm { FCVT            H4, D11 }
      uint64_t v125 = v26 + 32 * v64;
      *(float32x2_t *)uint64_t v125 = v115;
      *(_DWORD *)(v125 + 8) = v67;
      *(float *)(v125 + 12) = v123;
      *(float *)(v125 + 16) = v121;
      *(_WORD *)(v125 + 20) = 0;
      if (_ZF) {
        short float v126 = _H4;
      }
      else {
        LOWORD(v126) = COERCE_UNSIGNED_INT(1.0);
      }
      *(_WORD *)(v125 + 22) = _H1;
      *(_WORD *)(v125 + 24) = _H3;
      *(short float *)(v125 + 26) = v126;
      *(_DWORD *)(v125 + 28) = 0;
      unint64_t v127 = 4;
      if (a5) {
        unint64_t v127 = 8;
      }
      if (a6 && v65 >= v127) {
        char v168 = 1;
      }
      int v162 = v66;
      int v164 = v64 + 1;
      long long v128 = -[PKMetalParticleRenderCacheBuffer initWithUniforms:points:numPoints:resourceHandler:]([PKMetalParticleRenderCacheBuffer alloc], (uint64_t)&v158, v26, v64 + 1, *(void **)(v138 + 192));
      [v139 addObject:v128];
      *(void *)(v138 + 16) += 32 * (v64 + 1);
    }
  }
  uint64_t v7 = -[PKMetalParticleRenderCache initWithDevice:ink:renderZoomFactor:]((id *)[PKMetalParticleRenderCache alloc], *(void *)(v138 + 24), v145, v136);
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v129 = v139;
  uint64_t v130 = [v129 countByEnumeratingWithState:&v154 objects:v172 count:16];
  if (v130)
  {
    uint64_t v131 = *(void *)v155;
    do
    {
      for (uint64_t i = 0; i != v130; ++i)
      {
        if (*(void *)v155 != v131) {
          objc_enumerationMutation(v129);
        }
        -[PKMetalParticleRenderCache addBuffer:]((uint64_t)v7, *(void **)(*((void *)&v154 + 1) + 8 * i));
      }
      uint64_t v130 = [v129 countByEnumeratingWithState:&v154 objects:v172 count:16];
    }
    while (v130);
  }

LABEL_98:

  return v7;
}

- (PKMetalStrokeRenderCache)generateCacheForStroke:(unint64_t)a3 points:(unint64_t)a4 segmentSteps:(void *)a5
{
  unint64_t v5 = 0;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v6 = a4;
    unint64_t v7 = a3;
    unint64_t v8 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a4 - a3) >> 3);
    if (v8 >= 2)
    {
      id v11 = *(id *)(a2 + 80);
      double v12 = [v11 ink];
      double v13 = [v12 behavior];
      if (v13)
      {
        int v14 = v13[9];

        if (v14)
        {
          unint64_t v5 = 0;
LABEL_102:

          goto LABEL_103;
        }
      }
      else
      {
      }
      uint64_t v15 = *(void *)(a2 + 248);
      uint64_t v16 = *(void *)(a2 + 256);
      uint64_t v17 = *(void *)(a2 + 268);
      id v121 = v11;
      uint64_t v18 = [v11 ink];
      uint64_t v19 = [v18 behavior];
      unint64_t v20 = [v19 renderingDescriptor];
      uint64_t v21 = [v20 type];

      if (!v21)
      {
        {
          unint64_t v123 = v6;
          v143[0] = 0;
          v143[1] = v143;
          v143[2] = 0x3812000000;
          v143[3] = __Block_byref_object_copy__113;
          v143[4] = __Block_byref_object_dispose__114;
          v143[5] = "";
          int v144 = 0;
          int v145 = v8;
          uint64_t v139 = 0;
          double v140 = &v139;
          uint64_t v141 = 0x2020000000;
          uint64_t v142 = 0;
          uint64_t v135 = 0;
          uint64_t v136 = &v135;
          uint64_t v137 = 0x2020000000;
          uint64_t v138 = 0;
          uint64_t v28 = a1;
          uint64_t v29 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80));
          int v30 = *(char **)(a1 + 552);
          double v31 = *(char **)(a1 + 544);
          double v32 = (char *)(v30 - v31);
          unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v30 - v31) >> 3);
          if (v33 >> 16)
          {
            double v42 = *(char **)(a1 + 552);
            if (v32 != (char *)1572864)
            {
              double v42 = v31 + 1572864;
              *(void *)(a1 + 552) = v31 + 1572864;
            }
          }
          else
          {
            uint64_t v34 = *(void *)(a1 + 560);
            if (0xAAAAAAAAAAAAAAABLL * ((v34 - (uint64_t)v30) >> 3) >= 0x10000 - v33)
            {
              size_t v72 = 1572840 - (void)v32 - (1572840 - (int)v32) % 0x18u + 24;
              bzero(*(void **)(a1 + 552), v72);
              double v42 = &v30[v72];
              *(void *)(a1 + 552) = &v30[v72];
            }
            else
            {
              unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((v34 - (uint64_t)v31) >> 3);
              unint64_t v36 = 0x5555555555555556 * ((v34 - (uint64_t)v31) >> 3);
              if (v36 <= 0x10000) {
                unint64_t v36 = 0x10000;
              }
              if (v35 >= 0x555555555555555) {
                unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v37 = v36;
              }
              if (v37 > 0xAAAAAAAAAAAAAAALL) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              double v38 = (char *)operator new(24 * v37);
              uint64_t v118 = v29;
              uint64_t v39 = &v38[8 * ((v30 - v31) >> 3)];
              float64x2_t v40 = &v38[24 * v37];
              size_t v41 = 1572840 - (void)v32 - (1572840 - (int)v32) % 0x18u + 24;
              bzero(v39, v41);
              double v42 = &v39[v41];
              if (v30 != v31)
              {
                do
                {
                  long long v43 = *(_OWORD *)(v30 - 24);
                  *((void *)v39 - 1) = *((void *)v30 - 1);
                  *(_OWORD *)(v39 - 24) = v43;
                  v39 -= 24;
                  v30 -= 24;
                }
                while (v30 != v31);
                int v30 = v31;
              }
              uint64_t v28 = a1;
              *(void *)(a1 + 544) = v39;
              *(void *)(a1 + 552) = v42;
              *(void *)(a1 + 560) = v40;
              unint64_t v6 = v123;
              uint64_t v29 = v118;
              if (v30)
              {
                operator delete(v30);
                double v42 = *(char **)(a1 + 552);
              }
            }
          }
          uint64_t v73 = *(void *)(v28 + 544);
          double v74 = [MEMORY[0x1E4F1CA48] array];
          *(void *)&aBlocunint64_t k = MEMORY[0x1E4F143A8];
          *((void *)&aBlock + 1) = 3221225472;
          *(void *)&long long v130 = __77__PKMetalRenderer_generateSDFPenCacheForStroke_animatingStroke_segmentSteps___block_invoke;
          *((void *)&v130 + 1) = &unk_1E64C9170;
          *(void *)&long long v132 = v143;
          *((void *)&v132 + 1) = &v139;
          uint64_t v133 = &v135;
          uint64_t v134 = v73;
          *(void *)&long long v131 = v28;
          id v75 = v74;
          *((void *)&v131 + 1) = v75;
          double v120 = (void (**)(void))_Block_copy(&aBlock);
          uint64_t v119 = v17;
          if (v7 + 88 != v6)
          {
            id v117 = v75;
            uint64_t v76 = 0;
            unint64_t v77 = 0;
            unint64_t v78 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v42[-v73] >> 3);
            do
            {
              if (v77 >= (uint64_t)(a5[1] - *a5) >> 2) {
                int v79 = 8;
              }
              else {
                int v79 = *(_DWORD *)(*a5 + 4 * v77);
              }
              long double v80 = *(double *)(v7 + v76 + 56);
              _D10 = *(void *)(v7 + v76 + 80);
              float32x2_t v82 = vcvt_f32_f64(*(float64x2_t *)(v7 + v76 + 8));
              float v83 = *(double *)(v7 + v76 + 24);
              int v84 = (unsigned __int16)v79 | ((unsigned __int16)*((_DWORD *)v136 + 6) << 16);
              _D0 = fmod(v80, 6.28318531);
              if (v80 <= 6.28318531 && v80 >= 0.0) {
                _D0 = v80;
              }
              if (_D0 < 0.0) {
                _D0 = _D0 + 6.28318531;
              }
              if (_D0 == 0.0) {
                _D0 = 0.0;
              }
              __asm
              {
                FCVT            H9, D0
                FCVT            H10, D10
              }
              uint64_t v92 = v140[3];
              v140[3] = v92 + 1;
              float v93 = (float32x2_t *)(v73 + 24 * v92);
              float32x2_t *v93 = v82;
              v93[1].f32[0] = v83;
              v93[1].i16[2] = _H9;
              v93[1].i16[3] = _H10;
              v93[2].i32[0] = v84;
              long long v94 = v136;
              uint64_t v95 = v136[3];
              if (v95 + 4 * v79 > v78)
              {
                v120[2]();
                double v96 = v140;
                v140[3] = 0;
                v136[3] = 0;
                uint64_t v97 = v96[3];
                v96[3] = v97 + 1;
                double v98 = (float32x2_t *)(v73 + 24 * v97);
                float32x2_t *v98 = v82;
                v98[1].f32[0] = v83;
                v98[1].i16[2] = _H9;
                v98[1].i16[3] = _H10;
                v98[2].i32[0] = (unsigned __int16)v79;
                long long v94 = v136;
                uint64_t v95 = v136[3];
              }
              if (!v76)
              {
                v95 += 4;
                v94[3] = v95;
              }
              v94[3] = v95 + 4 * v79;
              ++v77;
              v76 += 88;
            }
            while (v7 + v76 + 88 != v123);
            v7 += v76;
            id v75 = v117;
          }
          long double v99 = *(double *)(v7 + 56);
          _D10 = *(void *)(v7 + 80);
          float32x2_t v101 = vcvt_f32_f64(*(float64x2_t *)(v7 + 8));
          float v102 = *(double *)(v7 + 24);
          _D0 = fmod(v99, 6.28318531);
          if (v99 <= 6.28318531 && v99 >= 0.0) {
            _D0 = v99;
          }
          if (_D0 < 0.0) {
            _D0 = _D0 + 6.28318531;
          }
          if (_D0 == 0.0) {
            _D0 = 0.0;
          }
          __asm
          {
            FCVT            H0, D0
            FCVT            H1, D10
          }
          uint64_t v107 = v140[3];
          v140[3] = v107 + 1;
          uint64_t v108 = (float32x2_t *)(v73 + 24 * v107);
          *uint64_t v108 = v101;
          v108[1].f32[0] = v102;
          v108[1].i16[2] = _H0;
          v108[1].i16[3] = _H1;
          v120[2]();
          unint64_t v5 = (PKMetalStrokeRenderCache *)-[PKMetalSDFPenRenderCache initWithPurgeableBuffers:renderZoomFactor:]([PKMetalSDFPenRenderCache alloc], 1, v29);
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          id v109 = v75;
          uint64_t v110 = [v109 countByEnumeratingWithState:&v125 objects:v146 count:16];
          uint64_t v17 = v119;
          if (v110)
          {
            uint64_t v111 = *(void *)v126;
            do
            {
              for (uint64_t i = 0; i != v110; ++i)
              {
                if (*(void *)v126 != v111) {
                  objc_enumerationMutation(v109);
                }
                -[PKMetalSDFPenRenderCache addBuffer:]((uint64_t)v5, *(void **)(*((void *)&v125 + 1) + 8 * i));
              }
              uint64_t v110 = [v109 countByEnumeratingWithState:&v125 objects:v146 count:16];
            }
            while (v110);
          }

          _Block_object_dispose(&v135, 8);
          _Block_object_dispose(&v139, 8);
          _Block_object_dispose(v143, 8);
          id v11 = v121;
        }
        else if (-[PKMetalRenderer generateBSplineInComputeForStroke:](a1, v11))
        {
          unint64_t v5 = [(PKMetalRenderer *)a1 generatePaintCacheForStroke:v6 animatingStroke:a2 segmentSteps:a5 liveStrokePoints:0 liveStrokeStartTime:0.0 duration:0.0];
        }
        else
        {
          int v66 = [PKMetalStrokeRenderCache alloc];
          uint64_t v67 = [*(id *)(a2 + 80) ink];
          unint64_t v68 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](v66, "initWithInk:renderZoomFactor:", v67, -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80)));

          objc_storeStrong((id *)(a2 + 88), v68);
          [(PKMetalRenderer *)(_OWORD *)a1 renderPenStroke:v6 animatingStroke:a2 renderEncoder:0];
          unint64_t v69 = *(void **)(a2 + 88);
          *(void *)(a2 + 88) = 0;

          uint64_t v70 = [(PKMetalStrokeRenderCache *)v68 buffers];
          if ([v70 count]) {
            double v71 = v68;
          }
          else {
            double v71 = 0;
          }
          unint64_t v5 = v71;
        }
        goto LABEL_98;
      }
      int v22 = *(unsigned __int8 *)(a2 + 336);
      id v23 = [*(id *)(a2 + 80) ink];
      double v24 = [v23 behavior];
      long long v25 = [v24 particleDescriptor];

      double v122 = v25;
      if ([v25 adjustEndCapParticleAlpha])
      {
        uint64_t v26 = *(void *)(a2 + 168);
        if (v26 <= *(void *)(a2 + 160)) {
          uint64_t v26 = *(void *)(a2 + 160);
        }
        BOOL v27 = v26 == 0;
      }
      else
      {
        BOOL v27 = 0;
      }
      int v44 = [v25 adjustEndCapParticleAlpha];
      char v45 = v44 ^ 1;
      if (!v22) {
        char v45 = 1;
      }
      if ((v45 & 1) == 0)
      {
        if (*(unsigned char *)(a2 + 176)) {
          int v44 = 0;
        }
        else {
          int v44 = *(void *)(*(void *)(a2 + 96) + 88) == v6;
        }
      }
      if (v8 >= 0x29 && *(unsigned char *)(a1 + 713))
      {
        int v46 = v27;
        unint64_t v5 = [(PKMetalRenderer *)a1 generateParticleCacheForStroke:v6 animatingStroke:a2 starts:v27 ends:v44 secondaryParticles:0];
        double v47 = [*(id *)(a2 + 80) ink];
        id v11 = v121;
        double v48 = [v47 behavior];
        double v49 = [v48 secondaryParticleDescriptor];

        if (!v49)
        {
LABEL_53:

LABEL_98:
          if (v5)
          {
            uint64_t v113 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v11);
            long long v114 = -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
            float32x2_t v115 = [*(id *)(a2 + 80) _strokeDataUUID];
            -[PKLRUCache setObject:forKey:cost:scaleFactor:]((uint64_t)v114, v5, v115, [(PKMetalStrokeRenderCache *)v5 cacheCost], v113);

            id v11 = v121;
          }
          if (!*(unsigned char *)(a2 + 72))
          {
            *(void *)(a2 + 248) = v15;
            *(void *)(a2 + 256) = v16;
            *(void *)(a2 + 268) = v17;
          }
          goto LABEL_102;
        }
        float v50 = [(PKMetalRenderer *)a1 generateParticleCacheForStroke:v6 animatingStroke:a2 starts:v46 ends:v44 secondaryParticles:1];
        long long v131 = 0u;
        long long v132 = 0u;
        aBlocunint64_t k = 0u;
        long long v130 = 0u;
        double v51 = -[PKMetalSDFPenRenderCache buffers](v50);
        uint64_t v52 = [v51 countByEnumeratingWithState:&aBlock objects:v146 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v130;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v130 != v53) {
                objc_enumerationMutation(v51);
              }
              -[PKMetalParticleRenderCache addSecondaryBuffer:]((uint64_t)v5, *(void **)(*((void *)&aBlock + 1) + 8 * j));
            }
            uint64_t v52 = [v51 countByEnumeratingWithState:&aBlock objects:v146 count:16];
          }
          while (v52);
        }
      }
      else
      {
        int v55 = v27;
        double v56 = [PKMetalStrokeRenderCache alloc];
        __int16 v57 = [*(id *)(a2 + 80) ink];
        double v58 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](v56, "initWithInk:renderZoomFactor:", v57, -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80)));

        double v59 = (void **)(a2 + 88);
        objc_storeStrong((id *)(a2 + 88), v58);
        [(PKMetalRenderer *)a1 renderParticleStroke:v6 animatingStroke:a2 starts:v27 ends:v44 secondaryParticles:0 renderEncoder:0];
        uint64_t v60 = [*(id *)(a2 + 80) ink];
        uint64_t v61 = [v60 behavior];
        double v62 = [v61 secondaryParticleDescriptor];

        if (v62) {
          [(PKMetalRenderer *)a1 renderParticleStroke:v6 animatingStroke:a2 starts:v55 ends:v44 secondaryParticles:1 renderEncoder:0];
        }
        uint64_t v63 = *v59;
        *double v59 = 0;

        uint64_t v64 = [(PKMetalStrokeRenderCache *)v58 buffers];
        if ([v64 count]) {
          unint64_t v65 = v58;
        }
        else {
          unint64_t v65 = 0;
        }
        unint64_t v5 = v65;
      }
      id v11 = v121;
      goto LABEL_53;
    }
  }
LABEL_103:

  return v5;
}

- (void)setupRenderState:(int)a3 needCompute:(int)a4 clearPaint:
{
  unint64_t v7 = a2;
  uint64_t v8 = (uint64_t)v7;
  if (a3)
  {
    uint64_t v9 = -[PKMetalRenderState computeCommandBufferCreateIfNecessary](v7);
    if (v9)
    {
      CGRect v10 = v8 ? *(void **)(v8 + 88) : 0;
      id v11 = v10;

      if (!v11)
      {
        double v12 = [v9 computeCommandEncoder];
        -[PKMetalRenderState setComputeEncoder:](v8, v12);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  double v12 = 0;
LABEL_9:
  uint64_t v39 = -[PKMetalRenderState commandBufferCreateIfNecessary]((id *)v8);
  if (!v8)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (unsigned char *)(a1 + 72);
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    if (a4) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    goto LABEL_37;
  }
  id v13 = *(id *)(v8 + 80);
  if (!v13)
  {
    uint64_t v14 = *(void *)(v8 + 152);
    uint64_t v15 = (unsigned char *)(a1 + 72);
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    if (a4) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    if (*(unsigned char *)(v8 + 43))
    {
      unint64_t v36 = v12;
      unint64_t v37 = v9;
      id v35 = v39;
      uint64_t v38 = v8;
      id v18 = (id)v8;
      uint64_t v19 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
      if (v14 >= 1)
      {
        uint64_t v20 = 0;
        uint64_t v21 = a1 + 112;
        do
        {
          int v22 = objc_msgSend(v19, "colorAttachments", v35);
          id v23 = [v22 objectAtIndexedSubscript:v20];

          double v24 = *(void **)v21;
          if (*(void *)v21) {
            double v24 = (void *)v24[3];
          }
          long long v25 = v24;
          [v23 setTexture:v25];

          -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v18, *(void **)v21);
          [v23 setLoadAction:2];
          [v23 setStoreAction:0];
          objc_msgSend(v23, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
          *(unsigned char *)(v21 + 9) = 0;

          ++v20;
          v21 += 16;
        }
        while (v14 != v20);
        uint64_t v26 = 0;
        BOOL v27 = (unsigned char *)(a1 + 153);
        do
        {
          uint64_t v28 = [v19 colorAttachments];
          uint64_t v29 = [v28 objectAtIndexedSubscript:v14 + v26];

          int v30 = *(void **)(v27 - 9);
          if (v30) {
            int v30 = (void *)v30[3];
          }
          double v31 = v30;
          [v29 setTexture:v31];

          -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v18, *(void **)(v27 - 9));
          if (*v27) {
            uint64_t v32 = 2;
          }
          else {
            uint64_t v32 = v17;
          }
          [v29 setLoadAction:v32];
          [v29 setStoreAction:1];
          objc_msgSend(v29, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
          *BOOL v27 = 0;
          v27 += 16;

          ++v26;
        }
        while (v14 != v26);
      }
      unint64_t v33 = v35;
      objc_msgSend(v35, "renderCommandEncoderWithDescriptor:", v19, v35);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v9 = v37;
      uint64_t v8 = v38;
      double v12 = v36;
      goto LABEL_38;
    }
LABEL_37:
    memset(v40, 0, 24);
    v40[3] = (id)v16;
    v40[4] = (id)1;
    v40[5] = (id)v17;
    memset(&v40[6], 0, 24);
    __int16 v41 = 0;
    uint64_t v42 = v14;
    uint64_t v34 = -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v39, v40, (void *)v8);
    unsigned char *v15 = 0;
    id v13 = (id)v34;
LABEL_38:
    -[PKMetalRenderState setRenderEncoder:](v8, v13);
  }
}

uint64_t __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke(uint64_t a1)
{
  -[PKMetalRenderState commitAndPurgeResourceSet:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = [*(id *)(a1 + 40) removeAllObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 48);
  if (*(void *)(v3 + 56) != v4) {
    *(void *)(v3 + 56) = v4;
  }
  return result;
}

void __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke_2(double *a1, void *a2)
{
  id v79 = a2;
  uint64_t v3 = *(double **)(*((void *)a1 + 7) + 8);
  CGFloat v4 = v3[6];
  CGFloat v5 = v3[7];
  CGFloat v6 = v3[8];
  CGFloat v7 = v3[9];
  CGFloat v8 = a1[8];
  CGFloat v9 = a1[9];
  CGFloat v11 = a1[10];
  CGFloat v10 = a1[11];
  uint64_t v13 = *((void *)a1 + 4);
  double v12 = (void *)*((void *)a1 + 5);
  if (v12) {
    double v12 = (void *)v12[10];
  }
  uint64_t v14 = v12;
  int v15 = -[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](v13, v14, 0, v4, v5, v6, v7, v8, v9, v11, v10);

  if (v15)
  {
    uint64_t v16 = [v79 _strokeMask];
    if (v16)
    {
      LODWORD(v17) = 1;
    }
    else
    {
      id v18 = [v79 _renderMask];
      LODWORD(v17) = v18 != 0;
    }
    uint64_t v19 = *((void *)a1 + 5);
    if (v19) {
      [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v19 + 80)];
    }
    unint64_t v20 = 0;
    uint64_t v80 = 112;
    int v78 = v17;
    while (1)
    {
      uint64_t v21 = *((void *)a1 + 5);
      if (v21) {
        unint64_t v22 = *(void *)(v21 + 152);
      }
      else {
        unint64_t v22 = 0;
      }
      if (v20 >= v22)
      {
        if (v17)
        {
          if (v21) {
            uint64_t v60 = *(void **)(v21 + 96);
          }
          else {
            uint64_t v60 = 0;
          }
          id v61 = v60;

          if (v61)
          {
            double v62 = *(double **)(*((void *)a1 + 7) + 8);
            CGFloat v63 = v62[6];
            CGFloat v64 = v62[7];
            CGFloat v65 = v62[8];
            CGFloat v66 = v62[9];
            CGFloat v67 = a1[8];
            CGFloat v68 = a1[9];
            CGFloat v70 = a1[10];
            CGFloat v69 = a1[11];
            uint64_t v72 = *((void *)a1 + 4);
            double v71 = (void *)*((void *)a1 + 5);
            if (v71) {
              double v71 = (void *)v71[12];
            }
            uint64_t v73 = v71;
            -[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](v72, v73, 0, v63, v64, v65, v66, v67, v68, v70, v69);
          }
          (*(void (**)(void))(*((void *)a1 + 6) + 16))();
        }
        break;
      }
      uint64_t v23 = *((void *)a1 + 4);
      if (v23)
      {
        uint64_t v24 = *(void *)(v23 + 8);
        if (v24)
        {
          unint64_t v25 = -[PKMetalRenderState pipelineConfig](v24);
          if (!v21) {
            goto LABEL_50;
          }
        }
        else
        {
          unint64_t v25 = *(unsigned int *)(v23 + 792) | ((unint64_t)*(unsigned __int16 *)(v23 + 796) << 32);
          if (!v21) {
            goto LABEL_50;
          }
        }
      }
      else
      {
        unint64_t v25 = 0;
        if (!v21)
        {
LABEL_50:
          LODWORD(v26) = 0;
          goto LABEL_17;
        }
      }
      uint64_t v26 = *(void *)(v21 + 152);
LABEL_17:
      uint64_t v27 = *(void *)(v23 + 192);
      if (v27 && *(unsigned char *)(v27 + 428))
      {
        uint64_t v28 = 0;
        int v29 = v20;
        uint64_t v17 = 13;
        if (v20) {
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v33 = *(void **)(v23 + v80);
        if (v33) {
          unint64_t v33 = (void *)v33[3];
        }
        uint64_t v28 = v33;
        int v29 = 0;
        uint64_t v17 = 7;
        if (v20)
        {
LABEL_20:
          int v30 = [v79 ink];
          double v31 = [v30 behavior];
          uint64_t v32 = [v31 secondaryParticleDescriptor];
          goto LABEL_25;
        }
      }
      int v30 = [v79 ink];
      double v31 = [v30 behavior];
      uint64_t v32 = [v31 particleDescriptor];
LABEL_25:
      uint64_t v34 = (void *)v32;

      uint64_t v35 = [v34 particleBlendMode];
      uint64_t v36 = *(void *)(*((void *)a1 + 4) + 192);
      *(void *)&long long v84 = v17;
      DWORD2(v84) = v26 + v20;
      HIDWORD(v84) = v29;
      char v85 = 0;
      LOBYTE(v17) = v78;
      char v86 = v78;
      memset(v87, 0, sizeof(v87));
      int v88 = v25;
      __int16 v89 = WORD2(v25);
      __int16 v90 = 0;
      unint64_t v37 = -[PKMetalResourceHandler namedShaderForKey:](v36, &v84);
      uint64_t v38 = v37;
      if (v35) {
        uint64_t v39 = 1;
      }
      else {
        uint64_t v39 = 3;
      }
      float64x2_t v40 = -[PKMetalShader shaderWithBlendMode:](v37, v39);

      __int16 v41 = (void *)*((void *)a1 + 5);
      if (v41) {
        __int16 v41 = (void *)v41[10];
      }
      uint64_t v42 = *((void *)a1 + 4);
      long long v43 = v41;
      -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](v42, v43);

      if (v78)
      {
        int v44 = (void *)*((void *)a1 + 5);
        if (v44) {
          int v44 = (void *)v44[10];
        }
        char v45 = v44;
        int v46 = *(void **)(*((void *)a1 + 4) + 176);
        if (v46) {
          int v46 = (void *)v46[3];
        }
        double v47 = v46;
        [v45 setFragmentTexture:v47 atIndex:1];
      }
      if (v28)
      {
        double v48 = (void *)*((void *)a1 + 5);
        if (v48) {
          double v48 = (void *)v48[10];
        }
        double v49 = v48;
        [v49 setFragmentTexture:v28 atIndex:0];
      }
      uint64_t v51 = *((void *)a1 + 4);
      float v50 = (void *)*((void *)a1 + 5);
      if (v50) {
        float v50 = (void *)v50[10];
      }
      uint64_t v52 = v50;
      -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](v51, v40, v52);

      if ((v78 & 1) == 0)
      {
        uint64_t v53 = (void *)*((void *)a1 + 5);
        if (v53) {
          uint64_t v53 = (void *)v53[10];
        }
        uint64_t v54 = *((void *)a1 + 4);
        int v55 = v53;
        -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](v54, v55);

        double v56 = (void *)*((void *)a1 + 4);
        __int16 v57 = -[PKMetalRenderer eraseShaderForAttachmentIndex:](v56, v20);
        double v58 = (void *)*((void *)a1 + 5);
        if (v58) {
          double v58 = (void *)v58[10];
        }
        double v59 = v58;
        -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:]((uint64_t)v56, v57, v59);
      }
      ++v20;
      v80 += 16;
    }
  }
  uint64_t v74 = *(void *)(*((void *)a1 + 7) + 8);
  long long v75 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v74 + 48) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v74 + 64) = v75;
  uint64_t v76 = (void *)*((void *)a1 + 5);
  float64x2_t v81 = *(float64x2_t *)(*((void *)a1 + 4) + 224);
  if (v76) {
    uint64_t v76 = (void *)v76[10];
  }
  unint64_t v77 = v76;
  v82[0] = 0;
  v82[1] = 0;
  uint64x2_t v83 = vcvtq_u64_f64(v81);
  [v77 setScissorRect:v82];
}

- (uint64_t)clearAndRenderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(CGFloat)a5 stopBlock:(CGFloat)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a4;
  if (!a1)
  {
    uint64_t v32 = 0;
    goto LABEL_17;
  }
  v46.origin.CGFloat x = a5;
  v46.origin.CGFloat y = a6;
  v46.size.CGFloat width = a7;
  v46.size.CGFloat height = a8;
  BOOL IsNull = CGRectIsNull(v46);
  id v18 = os_log_create("com.apple.pencilkit", "Sketching");
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (IsNull)
  {
    if (!v19) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    unint64_t v20 = "Metal Render not clipped to rect";
    uint64_t v21 = v18;
    uint32_t v22 = 2;
  }
  else
  {
    if (!v19) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109888;
    int v38 = (int)a5;
    __int16 v39 = 1024;
    int v40 = (int)a6;
    __int16 v41 = 1024;
    int v42 = (int)a7;
    __int16 v43 = 1024;
    int v44 = (int)a7;
    unint64_t v20 = "Metal Render clippedToRect %d %d %d %d";
    uint64_t v21 = v18;
    uint32_t v22 = 26;
  }
  _os_log_debug_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
LABEL_6:

  v47.origin.CGFloat x = a5;
  v47.origin.CGFloat y = a6;
  v47.size.CGFloat width = a7;
  v47.size.CGFloat height = a8;
  if (!CGRectIsNull(v47))
  {
    int v29 = *(unsigned __int8 *)(a1 + 72);
    -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v15);
    if (!v29)
    {
      long long v30 = a3[1];
      v36[0] = *a3;
      v36[1] = v30;
      v36[2] = a3[2];
      -[PKMetalRenderer clearNowWithStrokeSpaceClipRect:strokeTransform:](a1, v36, a5, a6, a7, a8);
    }
    if ([v15 count])
    {
      long long v31 = a3[1];
      v35[0] = *a3;
      v35[1] = v31;
      v35[2] = a3[2];
      uint64_t v28 = -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v35, v16, a5, a6, a7, a8);
      goto LABEL_13;
    }
    -[PKMetalRenderer finishRendering](a1);
LABEL_15:
    uint64_t v32 = 0;
    goto LABEL_16;
  }
  -[PKMetalRenderer finishRendering](a1);
  *(unsigned char *)(a1 + 72) = 1;
  if (![v15 count]) {
    goto LABEL_15;
  }
  -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v15);
  double v23 = *MEMORY[0x1E4F1DB20];
  double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v27 = a3[1];
  v34[0] = *a3;
  v34[1] = v27;
  v34[2] = a3[2];
  uint64_t v28 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v34, v16, v23, v24, v25, v26);
LABEL_13:
  uint64_t v32 = v28;
LABEL_16:
  -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  -[PKMetalRenderer purgePaintFramebuffers](a1);
LABEL_17:

  return v32;
}

- (void)clearNowWithStrokeSpaceClipRect:(CGFloat)a3 strokeTransform:(CGFloat)a4
{
  double v12 = (id *)(a1 + 8);
  uint64_t v13 = (id *)*(id *)(a1 + 8);
  uint64_t v14 = v13;
  if (!v13)
  {
    id v15 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32));
    objc_storeStrong(v12, v15);
    uint64_t v14 = v15;
    -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
  }
  id v16 = -[PKMetalRenderState commandBufferCreateIfNecessary](v14);
  if (!v14 || (id v17 = v14[10]) == 0)
  {
    __int16 v31 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    memset(v25, 0, sizeof(v25));
    int64x2_t v26 = vdupq_n_s64(1uLL);
    uint64_t v27 = 2;
    uint64_t v28 = 0;
    uint64_t v32 = 1;
    -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v16, v25, v14);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderState setRenderEncoder:]((uint64_t)v14, v17);
  }
  v39.origin.CGFloat x = a3;
  v39.origin.CGFloat y = a4;
  v39.size.CGFloat width = a5;
  v39.size.CGFloat height = a6;
  if (CGRectIsNull(v39)
    || (long long v18 = a2[1],
        v24[0] = *a2,
        v24[1] = v18,
        v24[2] = a2[2],
        (-[PKMetalRenderer applyStrokeSpaceClipRect:strokeTransform:](a1, v24, a3, a4, a5, a6) & 1) != 0))
  {
    if (*v12) {
      unint64_t v19 = -[PKMetalRenderState pipelineConfig]((uint64_t)*v12);
    }
    else {
      unint64_t v19 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
    }
    uint64_t v20 = *(void *)(a1 + 192);
    long long v33 = 0xBuLL;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    int v36 = v19;
    __int16 v37 = WORD2(v19);
    __int16 v38 = 0;
    uint64_t v21 = -[PKMetalResourceHandler namedShaderForKey:](v20, &v33);
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v17);
    if (v14) {
      id v22 = v14[10];
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v21, v23);
  }
  if (v13)
  {
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v17);
  }
  else
  {
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    -[PKMetalRenderer teardownDrawingFramebuffers]((void *)a1);
  }
}

- (void)updateTile:(void *)a3 strokes:(uint64_t)a4 clear:(char)a5 waitUntilCompleted:(uint64_t)a6 offscreen:(void *)a7 stopBlock:
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v135 = a3;
  id v14 = a7;
  if (a1)
  {
    char context = a5;
    if (v13)
    {
      double v15 = *((double *)v13 + 25);
      double v16 = *((double *)v13 + 26);
      double v17 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      double v18 = round(v15 * v17);
      double v19 = round(v16 * v17);
      memset(&v151, 0, sizeof(v151));
      CGAffineTransformMakeTranslation(&t1, -*((double *)v13 + 23), -*((double *)v13 + 24));
      *(double *)&unint64_t v20 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      CGFloat v21 = *(double *)&v20;
      *(double *)&unint64_t v22 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      CGFloat v23 = *(double *)&v22;
    }
    else
    {
      memset(&v151, 0, sizeof(v151));
      CGAffineTransformMakeTranslation(&t1, -0.0, -0.0);
      double v18 = 0.0;
      double v19 = 0.0;
      CGFloat v21 = 0.0;
      CGFloat v23 = 0.0;
    }
    CGAffineTransformMakeScale(&t2, v21, v23);
    CGAffineTransformConcat(&v151, &t1, &t2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKMetalRenderer_updateTile_strokes_clear_waitUntilCompleted_offscreen_stopBlock___block_invoke;
    aBlock[3] = &unk_1E64C91E8;
    id v24 = v14;
    id v148 = v24;
    uint64_t v134 = (uint64_t (**)(void))_Block_copy(aBlock);
    double v25 = *(double *)(a1 + 224);
    double v26 = *(double *)(a1 + 232);
    if (!v24 && (v18 == v25 ? (BOOL v27 = v19 == v26) : (BOOL v27 = 0), v27))
    {
      *(void *)buf = *(id *)(a1 + 40);
      *(_WORD *)&buf[8] = *(_WORD *)(a1 + 48);
      uint64_t v28 = (unsigned char **)(a1 + 56);
      double v140 = COERCE_DOUBLE(*(id *)(a1 + 56));
      LOWORD(v141) = *(_WORD *)(a1 + 64);
      char v29 = *(unsigned char *)(a1 + 72);
      uint64_t v145 = -[PKMetalRenderer framebufferForTile:createIfNeeded:]((void *)a1, v13, 1);
      __int16 v146 = 0;
      uint64_t v30 = *(unsigned char **)(a1 + 40);
      if (v30 && !*(unsigned char *)(a1 + 48)) {
        *(unsigned char *)(a1 + 48) = -[PKMetalFramebuffer incrementNonPurgeableCount](v30);
      }
      if (*(void *)(a1 + 720))
      {
        uint64_t v145 = -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v13, 1);
        __int16 v146 = 0;
        if (*v28)
        {
          if (!*(unsigned char *)(a1 + 64)) {
            *(unsigned char *)(a1 + 64) = -[PKMetalFramebuffer incrementNonPurgeableCount](*v28);
          }
        }
      }
      *(unsigned char *)(a1 + 72) = a4;
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v135);
      uint64_t v31 = *(void *)(a1 + 8);
      if (v31) {
        *(unsigned char *)(v31 + 39) = context;
      }
      if (*(void *)(a1 + 720))
      {
        uint64_t v32 = *(void *)(a1 + 8);
        if (v32) {
          *(void *)(v32 + 136) = 3;
        }
      }
      if (v13)
      {
        double v33 = *((double *)v13 + 23);
        double v34 = *((double *)v13 + 24);
        double v35 = *((double *)v13 + 25);
        double v36 = *((double *)v13 + 26);
      }
      else
      {
        double v34 = 0.0;
        double v35 = 0.0;
        double v36 = 0.0;
        double v33 = 0.0;
      }
      CGAffineTransform v144 = v151;
      -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v135, &v144, 0, v33, v34, v35, v36);
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
      *(unsigned char *)(a1 + 72) = v29;
      -[PKMetalRenderer purgePaintFramebuffers](a1);
    }
    else if (v25 < v18 || v26 < v19)
    {
      __int16 v38 = os_log_create("com.apple.pencilkit", "");
      CGRect v39 = v38;
      if (fabs(v18) == INFINITY || fabs(v19) == INFINITY)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_FAULT, "Tried to update a tile with a non-finite size", buf, 2u);
        }
      }
      else
      {
        int v40 = v38;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v41 = NSStringFromCGSize(*(CGSize *)(a1 + 224));
          v159.CGFloat width = v18;
          v159.CGFloat height = v19;
          int v42 = NSStringFromCGSize(v159);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v41;
          LOWORD(v153) = 2112;
          *(void *)((char *)&v153 + 2) = v42;
          _os_log_impl(&dword_1C44F8000, v40, OS_LOG_TYPE_DEFAULT, "Created a one off tile  renderer: %@ => %@", buf, 0x16u);
        }
        contextdouble a = (void *)MEMORY[0x1C8784520]();
        __int16 v43 = [PKMetalRenderer alloc];
        int v44 = *(void **)(a1 + 192);
        uint64_t v45 = *(void **)(a1 + 720);
        id v46 = *(id *)(a1 + 24);
        id v47 = v44;
        double v48 = v47;
        if (v43)
        {
          double v49 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlendingMode:pixelFormat:]((id *)&v43->super.isa, v46, v47, v45);

          if (v49) {
            *((unsigned char *)v49 + 966) = *(unsigned char *)(a1 + 966);
          }
        }
        else
        {

          double v49 = 0;
        }
        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:](v49, v13, v135, a4, 1, a6, v24);
      }
    }
    else
    {
      uint64_t v50 = -[PKMetalRenderer framebufferForTile:createIfNeeded:]((void *)a1, v13, 1);
      if (*(void *)(a1 + 720))
      {
        uint64_t v51 = -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v13, 1);
      }
      else
      {
        uint64_t v51 = 0;
      }
      long long v131 = (void *)v51;
      *(unsigned char *)(a1 + 72) = a4;
      if (v50)
      {
        long long v52 = *(_OWORD *)(v50 + 88);
        long long v53 = *(_OWORD *)(v50 + 104);
      }
      else
      {
        long long v52 = 0uLL;
        long long v53 = 0uLL;
      }
      *(_OWORD *)(a1 + 80) = v52;
      *(_OWORD *)(a1 + 96) = v53;
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v135);
      if ((a4 & 1) == 0)
      {
        if (*(void *)(a1 + 720))
        {
          CGAffineTransform v139 = v151;
          double v54 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v13, &v139, &v140);
          CGFloat v56 = v55;
          CGFloat v58 = v57;
          CGFloat v60 = v59;
          id v61 = *(void **)(a1 + 8);
          if (v61) {
            id v61 = (void *)v61[10];
          }
          double v62 = v61;
          uint64_t v63 = -[PKMetalRenderer blitShader](a1);
          CGFloat v64 = (void *)v63;
          if (v63) {
            CGFloat v65 = *(void **)(v63 + 24);
          }
          else {
            CGFloat v65 = 0;
          }
          id v66 = v65;
          [v62 setRenderPipelineState:v66];

          if (v50) {
            CGFloat v67 = *(void **)(v50 + 24);
          }
          else {
            CGFloat v67 = 0;
          }
          id v68 = v67;
          [v62 setFragmentTexture:v68 atIndex:0];

          double v69 = -[PKMetalFramebuffer size](v50);
          CGFloat v71 = v142;
          CGFloat v70 = v143;
          CGFloat v73 = v140;
          CGFloat v72 = v141;
          -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:](v62, v54, v56, v58, v60, v140, v141, v142, v143, v69, v74, *(double *)(a1 + 224), *(double *)(a1 + 232));
          uint64_t v75 = *(void *)(a1 + 8);
          if (v75) {
            unint64_t v76 = -[PKMetalRenderState pipelineConfig](v75);
          }
          else {
            unint64_t v76 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
          }
          uint64_t v77 = *(void *)(a1 + 192);
          *(void *)buf = 7;
          long long v153 = 0uLL;
          *(_DWORD *)&buf[8] = 3;
          int v154 = 0;
          int v155 = v76;
          __int16 v156 = WORD2(v76);
          __int16 v157 = 0;
          uint64_t v78 = -[PKMetalResourceHandler namedShaderForKey:](v77, (long long *)buf);
          id v79 = (void *)v78;
          if (v78) {
            uint64_t v80 = *(void **)(v78 + 24);
          }
          else {
            uint64_t v80 = 0;
          }
          id v81 = v80;
          [v62 setRenderPipelineState:v81];

          float32x2_t v82 = v131;
          if (v131) {
            float32x2_t v82 = (void *)v131[3];
          }
          id v83 = v82;
          [v62 setFragmentTexture:v83 atIndex:0];

          double v84 = -[PKMetalFramebuffer size](v50);
          -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:](v62, v54, v56, v58, v60, v73, v72, v71, v70, v84, v85, *(double *)(a1 + 224), *(double *)(a1 + 232));
        }
        else
        {
          CGAffineTransform v138 = v151;
          -[PKMetalRenderer renderTile:tileFramebuffer:tileTransform:renderState:shouldComposite:](a1, v13, (void *)v50, &v138, *(void **)(a1 + 8), 0);
        }
      }
      if (v13)
      {
        double v86 = *((double *)v13 + 23);
        double v87 = *((double *)v13 + 24);
        double v88 = *((double *)v13 + 25);
        double v89 = *((double *)v13 + 26);
      }
      else
      {
        double v87 = 0.0;
        double v88 = 0.0;
        double v89 = 0.0;
        double v86 = 0.0;
      }
      CGAffineTransform v137 = v151;
      -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v135, &v137, v24, v86, v87, v88, v89);
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
      if ((v134[2]() & 1) == 0)
      {
        if (v13)
        {
          uint64_t v90 = *((void *)v13 + 23);
          uint64_t v91 = *((void *)v13 + 24);
          uint64_t v92 = *((void *)v13 + 25);
          uint64_t v93 = *((void *)v13 + 26);
        }
        else
        {
          uint64_t v91 = 0;
          uint64_t v92 = 0;
          uint64_t v93 = 0;
          uint64_t v90 = 0;
        }
        CGAffineTransform v136 = v151;
        CGRect v160 = CGRectApplyAffineTransform(*(CGRect *)&v90, &v136);
        CGFloat x = v160.origin.x;
        CGFloat width = v160.size.width;
        CGFloat height = v160.size.height;
        v162.size.CGFloat width = *(CGFloat *)(a1 + 224);
        v162.size.CGFloat height = *(CGFloat *)(a1 + 232);
        v162.origin.CGFloat x = 0.0;
        v162.origin.CGFloat y = 0.0;
        CGFloat y = v160.origin.y;
        CGRect v161 = CGRectIntersection(v160, v162);
        double v98 = v161.origin.x;
        CGFloat v99 = v161.origin.y;
        CGFloat v100 = v161.size.width;
        CGFloat v101 = v161.size.height;
        double v102 = -[PKMetalFramebuffer size](v50);
        double v129 = v103;
        double v130 = v102;
        double v104 = DKDRoundedRectForScale(v98, v99, v100, v101, 1.0);
        CGFloat v128 = x;
        DKDNormalizedSubrectInRect(v104, v105, v106, v107);
        DKDRectFromNormalizedSubrect(0.0, 0.0, v130, v129, v108, v109, v110, v111);
        double v116 = DKDRoundedRectForScale(v112, v113, v114, v115, 1.0);
        CGFloat v118 = v117;
        CGFloat v120 = v119;
        CGFloat v122 = v121;
        unint64_t v123 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32));
        if (*(void *)(a1 + 720))
        {
          uint64_t v124 = *(void **)(a1 + 56);
          if (v124) {
            uint64_t v124 = (void *)v124[3];
          }
          long long v125 = v124;
          -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v125, v131, v123, 0, v128, y, width, height, v116, v118, v120, v122);
        }
        if (v123) {
          *((unsigned char *)v123 + 39) = context;
        }
        long long v126 = *(void **)(a1 + 40);
        if (v126) {
          long long v126 = (void *)v126[3];
        }
        long long v127 = v126;
        -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v127, (void *)v50, v123, 0, v128, y, width, height, v116, v118, v120, v122);

        if (v123) {
          -[PKMetalRenderState commitAndPurgeResourceSet:]((uint64_t)v123, 0);
        }
      }
      -[PKMetalRenderer purgePaintFramebuffers](a1);
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 96) = 0u;
      *(unsigned char *)(a1 + 72) = 1;
    }
  }
}

uint64_t __83__PKMetalRenderer_updateTile_strokes_clear_waitUntilCompleted_offscreen_stopBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)framebufferForTile:(char)a3 createIfNeeded:
{
  CGFloat v5 = a2;
  CGFloat v6 = -[PKRendererTile framebuffer](v5);
  if (!v6)
  {
    CGFloat v7 = +[PKRendererTileController sharedController]();
    CGFloat v8 = (void *)a1[3];
    uint64_t v9 = a1[121];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PKMetalRenderer_framebufferForTile_createIfNeeded___block_invoke;
    v11[3] = &unk_1E64C9210;
    v11[4] = a1;
    CGFloat v6 = -[PKRendererTileController framebufferForTile:createIfNeeded:device:pixelFormat:clearFramebufferBlock:]((uint64_t)v7, v5, a3, v8, v9, v11);

    if (a1[90])
    {
      if (v6) {
        v6[8] = 6;
      }
    }
  }

  return v6;
}

- (void)multiplyFramebufferForTile:(char)a3 createIfNeeded:
{
  CGFloat v5 = a2;
  CGFloat v6 = -[PKRendererTile multiplyFramebuffer](v5);
  if (v6) {
    goto LABEL_3;
  }
  CGFloat v7 = +[PKRendererTileController sharedController]();
  CGFloat v8 = *(void **)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 968);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PKMetalRenderer_multiplyFramebufferForTile_createIfNeeded___block_invoke;
  v11[3] = &unk_1E64C9210;
  v11[4] = a1;
  CGFloat v6 = -[PKRendererTileController multiplyFramebufferForTile:createIfNeeded:device:pixelFormat:clearFramebufferBlock:]((uint64_t)v7, v5, a3, v8, v9, v11);

  if (v6) {
LABEL_3:
  }
    v6[8] = 7;

  return v6;
}

- (double)calculateSourceRectForTile:(_OWORD *)a3 tileTransform:(CGFloat *)a4 destinationRectOut:
{
  CGFloat v7 = a2;
  CGFloat v8 = (id *)v7;
  if (v7)
  {
    uint64_t v9 = v7[23];
    uint64_t v10 = v7[24];
    uint64_t v11 = v7[25];
    uint64_t v12 = v7[26];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v9 = 0;
  }
  long long v13 = a3[1];
  *(_OWORD *)&v32.double a = *a3;
  *(_OWORD *)&v32.double c = v13;
  *(_OWORD *)&v32.tCGFloat x = a3[2];
  CGRect v33 = CGRectApplyAffineTransform(*(CGRect *)&v9, &v32);
  v35.size.CGFloat width = *(CGFloat *)(a1 + 224);
  v35.size.CGFloat height = *(CGFloat *)(a1 + 232);
  v35.origin.CGFloat x = 0.0;
  v35.origin.CGFloat y = 0.0;
  CGRect v34 = CGRectIntersection(v33, v35);
  CGFloat height = v34.size.height;
  CGFloat width = v34.size.width;
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  double v16 = -[PKRendererTile framebuffer](v8);
  double v17 = -[PKMetalFramebuffer size]((uint64_t)v16);
  double v19 = v18;

  DKDNormalizedSubrectInRect(x, y, width, height);
  DKDRectFromNormalizedSubrect(0.0, 0.0, v17, v19, v20, v21, v22, v23);
  *a4 = x;
  a4[1] = y;
  a4[2] = width;
  a4[3] = height;
  double v28 = DKDRoundedRectForScale(v24, v25, v26, v27, 1.0);

  return v28;
}

- (void)renderTile:(void *)a3 tileFramebuffer:(_OWORD *)a4 tileTransform:(void *)a5 renderState:(int)a6 shouldComposite:
{
  id v23 = a2;
  id v11 = a3;
  id v12 = a5;
  if (v11)
  {
    long long v13 = a4[1];
    v24[0] = *a4;
    v24[1] = v13;
    v24[2] = a4[2];
    double v14 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v23, v24, v25);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
    if (a6) {
      uint64_t v21 = *((void *)v11 + 8);
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = *((id *)v11 + 3);
    -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v22, *(void **)(a1 + 40), v12, v21, v14, v16, v18, v20, v25[0], v25[1], v25[2], v25[3]);
  }
}

- (void)buildRenderCacheForStrokes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    memset(v4, 0, sizeof(v4));
    -[PKMetalRenderer generateLiveStrokeCachesForStrokes:destinationLocations:startTime:duration:](a1, v3);
    CGFloat v5 = (void **)v4;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

- (void)generateLiveStrokeCachesForStrokes:(uint64_t)a1 destinationLocations:(void *)a2 startTime:duration:
{
  id v3 = a2;
  if (a1)
  {
    *(void *)(a1 + 16) = 0;
    operator new();
  }
}

- (void)purgeRenderCachesForStrokes:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    CGFloat v4 = -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "_strokeUUID", (void)v12);
          -[PKLRUCache removeObjectForKey:]((uint64_t)v4, v10);

          id v11 = [v9 _strokeDataUUID];
          -[PKLRUCache removeObjectForKey:]((uint64_t)v4, v11);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)purgeOriginalBackFramebuffer
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(a1 + 40));
      *(unsigned char *)(a1 + 48) = 0;
    }
    *(unsigned char *)(a1 + 72) = 1;
    if (*(unsigned char *)(a1 + 64))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(a1 + 56));
      *(unsigned char *)(a1 + 64) = 0;
    }
    uint64_t v2 = *(void **)(a1 + 944);
    *(void *)(a1 + 944) = 0;

    id v3 = *(void **)(a1 + 952);
    *(void *)(a1 + 952) = 0;
  }
}

- (void)renderImageTexture:(long long *)a3 imageTextureTransform:(void *)a4 withTiles:(_OWORD *)a5 tileTransform:(char)a6 waitUntilCompleted:
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v86 = a2;
  id v85 = a4;
  if (a1)
  {
    uint64_t v11 = *(void *)(a1 + 720);
    if (v11)
    {
      if (v11 == 2)
      {
        uint64_t v33 = [v85 count];
        CGRect v34 = *(void **)(a1 + 944);
        if (v33)
        {
          CGRect v35 = v34;
          double v36 = v35;
          if (!v35
            || (-[PKMetalFramebuffer size]((uint64_t)v35) == *(double *)(a1 + 224)
              ? (_ZF = v37 == *(double *)(a1 + 232))
              : (_ZF = 0),
                !_ZF))
          {
            double v87 = v36;
            double v36 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(a1 + 24) pixelFormat:0 device:0 memoryless:(void *)1 backedByIOSurface:0 sampleCount:*(double *)(a1 + 224) purgeable:*(double *)(a1 + 232)];

            if (v36)
            {
              *(_OWORD *)(v36 + 13) = 0u;
              *(_OWORD *)(v36 + 11) = 0u;
            }
            objc_storeStrong((id *)(a1 + 944), v36);
          }
          double v88 = v36;
          -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](a1, v36);
          CGRect v39 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, 2 * (*(void *)(a1 + 192) != 0));
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v40 = v85;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v100 objects:v105 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v101;
            do
            {
              uint64_t v43 = 0;
              do
              {
                if (*(void *)v101 != v42) {
                  objc_enumerationMutation(v40);
                }
                int v44 = *(void **)(*((void *)&v100 + 1) + 8 * v43);
                long long v45 = a5[1];
                v95[0] = *a5;
                v95[1] = v45;
                v95[2] = a5[2];
                double v46 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v44, v95, &v96);
                CGFloat v48 = v47;
                CGFloat v50 = v49;
                CGFloat v52 = v51;
                uint64_t v53 = -[PKRendererTile framebuffer]((id *)v44);
                double v54 = (void *)v53;
                if (v53) {
                  double v55 = *(void **)(v53 + 24);
                }
                else {
                  double v55 = 0;
                }
                id v56 = v55;
                -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v56, v88, v39, 0, v46, v48, v50, v52, v96, v97, v98, v99);

                ++v43;
              }
              while (v41 != v43);
              uint64_t v57 = [v40 countByEnumeratingWithState:&v100 objects:v105 count:16];
              uint64_t v41 = v57;
            }
            while (v57);
          }

          CGFloat v58 = (id *)*(id *)(a1 + 952);
          double v59 = v58;
          if (!v58 || -[PKMetalFramebuffer size]((uint64_t)v58) != *(double *)(a1 + 224) || v60 != *(double *)(a1 + 232))
          {
            id v61 = [(id *)[PKMetalFramebuffer alloc] initWithSize:*(void **)(a1 + 24) pixelFormat:0 device:0 memoryless:(void *)1 backedByIOSurface:0 sampleCount:*(double *)(a1 + 224) purgeable:*(double *)(a1 + 232)];

            if (v61)
            {
              __asm { FMOV            V0.2D, #1.0 }
              *(_OWORD *)(v61 + 11) = _Q0;
              *(_OWORD *)(v61 + 13) = _Q0;
            }
            objc_storeStrong((id *)(a1 + 952), v61);
            double v59 = v61;
          }
          -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](a1, v59);
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v66 = v40;
          uint64_t v67 = [v66 countByEnumeratingWithState:&v91 objects:v104 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v92;
            do
            {
              uint64_t v69 = 0;
              do
              {
                if (*(void *)v92 != v68) {
                  objc_enumerationMutation(v66);
                }
                CGFloat v70 = *(void **)(*((void *)&v91 + 1) + 8 * v69);
                long long v71 = a5[1];
                v90[0] = *a5;
                v90[1] = v71;
                v90[2] = a5[2];
                double v72 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v70, v90, &v96);
                CGFloat v74 = v73;
                CGFloat v76 = v75;
                CGFloat v78 = v77;
                uint64_t v79 = -[PKRendererTile multiplyFramebuffer]((id *)v70);
                uint64_t v80 = (void *)v79;
                if (v79) {
                  id v81 = *(void **)(v79 + 24);
                }
                else {
                  id v81 = 0;
                }
                id v82 = v81;
                -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v82, v59, v39, 0, v72, v74, v76, v78, v96, v97, v98, v99);

                ++v69;
              }
              while (v67 != v69);
              uint64_t v83 = [v66 countByEnumeratingWithState:&v91 objects:v104 count:16];
              uint64_t v67 = v83;
            }
            while (v83);
          }
        }
        else
        {
          *(void *)(a1 + 944) = 0;

          double v84 = *(void **)(a1 + 952);
          *(void *)(a1 + 952) = 0;
        }
      }
      else if (v11 == 1)
      {
        -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
        uint64_t v12 = *(void *)(a1 + 192);
        if (v12) {
          uint64_t v12 = *(void *)(v12 + 440);
        }
        *(void *)(a1 + 472) = v12;
        *(unsigned char *)(a1 + 488) = v86 != 0;
        if (v86)
        {
          long long v13 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32));
          long long v14 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v13;

          uint64_t v15 = *(void *)(a1 + 8);
          if (v15) {
            *(unsigned char *)(v15 + 39) = a6;
          }
          -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
          CGFloat v16 = *(void **)(a1 + 40);
          if (v16) {
            -[PKMetalRenderState addPurgeableFramebuffer:](*(void *)(a1 + 8), v16);
          }
          uint64_t v17 = *(void **)(a1 + 56);
          if (v17) {
            -[PKMetalRenderState addPurgeableFramebuffer:](*(void *)(a1 + 8), v17);
          }
          CGFloat v18 = -[PKMetalRenderState commandBufferCreateIfNecessary](*(id **)(a1 + 8));
          -[PKMetalRenderState setSixChannelContentTexture:](*(void *)(a1 + 8), v86);
          double v19 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
          CGFloat v20 = [v19 colorAttachments];
          uint64_t v21 = [v20 objectAtIndexedSubscript:0];

          [v21 setLoadAction:0];
          [v21 setStoreAction:1];
          id v22 = *(void **)(a1 + 40);
          if (v22) {
            id v22 = (void *)v22[3];
          }
          id v23 = v22;
          [v21 setTexture:v23];

          double v24 = [v18 renderCommandEncoderWithDescriptor:v19];
          -[PKMetalRenderState setRenderEncoder:](*(void *)(a1 + 8), v24);
          CGFloat v25 = *(_OWORD **)(a1 + 8);
          if (v25)
          {
            long long v26 = *a3;
            long long v27 = a3[2];
            v25[13] = a3[1];
            v25[14] = v27;
            v25[12] = v26;
            double v28 = *(void **)(a1 + 8);
          }
          else
          {
            double v28 = 0;
          }
          -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v86, *(void **)(a1 + 40), v28, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
          char v29 = *(_OWORD **)(a1 + 8);
          if (v29)
          {
            uint64_t v30 = MEMORY[0x1E4F1DAB8];
            long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            v29[12] = *MEMORY[0x1E4F1DAB8];
            v29[13] = v31;
            v29[14] = *(_OWORD *)(v30 + 32);
          }
          -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
          *(unsigned char *)(a1 + 72) = 0;
        }
        else
        {
          *(unsigned char *)(a1 + 72) = 1;
        }
      }
    }
    else
    {
      if (v86) {
        -[PKMetalRenderer renderTexture:](a1, v86);
      }
      long long v32 = a5[1];
      v89[0] = *a5;
      v89[1] = v32;
      v89[2] = a5[2];
      -[PKMetalRenderer renderTiles:clearBackBuffer:tileTransform:waitUntilCompleted:](a1, v85, v86 == 0, v89, a6);
    }
  }
}

- (void)renderTexture:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
    id v3 = (_OWORD *)MEMORY[0x1E4F1DB20];
    -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v5, *(void **)(a1 + 40), 0, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
    -[PKMetalRenderer purgePaintFramebuffers](a1);
    *(unsigned char *)(a1 + 121) = 1;
    *(unsigned char *)(a1 + 153) = 1;
    *(unsigned char *)(a1 + 137) = 1;
    *(unsigned char *)(a1 + 169) = 1;
    long long v4 = v3[1];
    *(_OWORD *)(a1 + 664) = *v3;
    *(_OWORD *)(a1 + 680) = v4;
  }
}

- (void)renderTiles:(int)a3 clearBackBuffer:(_OWORD *)a4 tileTransform:(char)a5 waitUntilCompleted:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  if (a1)
  {
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    if (a3)
    {
      -[PKMetalRenderer finishRendering](a1);
      *(unsigned char *)(a1 + 72) = 1;
    }
    -[PKMetalRenderer setupRenderStateForStrokeRenderingNumPaintBuffers:needRenderMask:](a1, 0, 0);
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10) {
      *(unsigned char *)(v10 + 39) = a5;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      int v14 = a3 ^ 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v17 = -[PKMetalRenderer framebufferForTile:createIfNeeded:]((void *)a1, v16, 0);
          long long v18 = a4[1];
          v19[0] = *a4;
          v19[1] = v18;
          v19[2] = a4[2];
          -[PKMetalRenderer renderTile:tileFramebuffer:tileTransform:renderState:shouldComposite:](a1, v16, v17, v19, *(void **)(a1 + 8), v14);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  }
}

- (void)renderTiles:(void *)a3 intoTile:(char)a4 waitUntilCompleted:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v67 = a2;
  uint64_t v7 = a3;
  if (!a1) {
    goto LABEL_49;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  if (*(void *)(a1 + 720)) {
    uint64_t v9 = 2;
  }
  uint64_t v66 = v9;
  uint64_t v64 = v9 - 1;
  do
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = v67;
    uint64_t v10 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (!v10)
    {

      uint64_t v12 = 0;
      id v11 = 0;
      goto LABEL_48;
    }
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v71 = *(void *)v73;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v73 != v71) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v72 + 1) + 8 * v13);
        if (v8) {
          -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, *(void **)(*((void *)&v72 + 1) + 8 * v13), 0);
        }
        else {
          -[PKMetalRenderer framebufferForTile:createIfNeeded:]((void *)a1, *(void **)(*((void *)&v72 + 1) + 8 * v13), 0);
        }
        uint64_t v15 = (id *)objc_claimAutoreleasedReturnValue();
        if (!v15) {
          goto LABEL_38;
        }
        if (!v11)
        {
          CGFloat v16 = [PKMetalRenderState alloc];
          unint64_t v4 = v4 & 0xFFFF000000000000 | *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
          id v11 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)&v16->super.isa, *(void **)(a1 + 32), 0, v4);
          id v17 = -[PKMetalRenderState commandBufferCreateIfNecessary](v11);
        }
        if (!v12)
        {
          if (v8) {
            -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v7, 1);
          }
          else {
          uint64_t v12 = -[PKMetalRenderer framebufferForTile:createIfNeeded:]((void *)a1, v7, 1);
          }
        }
        if (v14)
        {
          uint64_t v18 = v14[16];
          if (v7) {
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v18 = 0;
          if (v7)
          {
LABEL_23:
            uint64_t v19 = v7[16];
            goto LABEL_24;
          }
        }
        uint64_t v19 = 0;
LABEL_24:
        if (v18 == v19)
        {
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          if (v14)
          {
            uint64_t v24 = v14[23];
            uint64_t v21 = v14[24];
            uint64_t v22 = v14[25];
            uint64_t v23 = v14[26];
          }
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          if (v7)
          {
            uint64_t v27 = v7[23];
            uint64_t v20 = v7[24];
            uint64_t v25 = v7[25];
            uint64_t v26 = v7[26];
          }
          if (CGRectEqualToRect(*(CGRect *)&v24, *(CGRect *)(&v20 - 1)))
          {
            id v28 = v15[3];
            -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v28, v12, v11, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
LABEL_37:

            goto LABEL_38;
          }
        }
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        if (v14)
        {
          uint64_t v33 = v14[23];
          uint64_t v30 = v14[24];
          uint64_t v31 = v14[25];
          uint64_t v32 = v14[26];
        }
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        if (v7)
        {
          uint64_t v36 = v7[23];
          uint64_t v29 = v7[24];
          uint64_t v34 = v7[25];
          uint64_t v35 = v7[26];
        }
        CGRect v78 = CGRectIntersection(*(CGRect *)&v33, *(CGRect *)(&v29 - 1));
        CGFloat x = v78.origin.x;
        CGFloat y = v78.origin.y;
        CGFloat width = v78.size.width;
        CGFloat height = v78.size.height;
        if (!CGRectIsNull(v78))
        {
          double v41 = -[PKMetalFramebuffer size]((uint64_t)v15);
          double v43 = v42;
          DKDNormalizedSubrectInRect(x, y, width, height);
          DKDRectFromNormalizedSubrect(0.0, 0.0, v41, v43, v44, v45, v46, v47);
          CGRect v80 = CGRectIntegral(v79);
          CGFloat v48 = v80.origin.y;
          CGFloat v49 = v80.size.width;
          CGFloat v50 = v80.size.height;
          CGFloat v68 = v80.origin.x;
          double v51 = -[PKMetalFramebuffer size]((uint64_t)v12);
          double v69 = v52;
          double v53 = v51;
          DKDNormalizedSubrectInRect(x, y, width, height);
          DKDRectFromNormalizedSubrect(0.0, 0.0, v53, v69, v54, v55, v56, v57);
          CGRect v82 = CGRectIntegral(v81);
          CGFloat v58 = v82.origin.x;
          CGFloat v59 = v82.origin.y;
          CGFloat v60 = v82.size.width;
          CGFloat v61 = v82.size.height;
          id v28 = v15[3];
          -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v28, v12, v11, 0, v68, v48, v49, v50, v58, v59, v60, v61);
          goto LABEL_37;
        }
LABEL_38:

        ++v13;
      }
      while (v10 != v13);
      uint64_t v62 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
      uint64_t v10 = v62;
    }
    while (v62);

    if (v11)
    {
      char v63 = a4;
      if (v8 != v64) {
        char v63 = 0;
      }
      *((unsigned char *)v11 + 39) = v63;
      -[PKMetalRenderState commitAndPurgeResourceSet:]((uint64_t)v11, 0);
    }
LABEL_48:

    ++v8;
  }
  while (v8 != v66);
LABEL_49:
}

void __53__PKMetalRenderer_framebufferForTile_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
}

void __61__PKMetalRenderer_multiplyFramebufferForTile_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
}

- (void)clearTile:(uint64_t)a1 waitUntilCompleted:(void *)a2
{
  id v4 = a2;
  if (a1)
  {
    id v3 = +[PKRendererTileController sharedController]();
    -[PKRendererTileController didTeardownTile:]((uint64_t)v3, (uint64_t)v4);

    -[PKRendererTile clearFramebuffersThreadSafe]((uint64_t)v4);
  }
}

- (void)copyFromFramebuffer:(uint64_t)a3 toFramebuffer:(CGFloat)a4 clipRect:(CGFloat)a5 renderEncoder:(CGFloat)a6 paintIndex:(CGFloat)a7 alphaBlendFactor:(double)a8
{
  id v15 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  v32.origin.CGFloat x = a4;
  v32.origin.CGFloat y = a5;
  v32.size.CGFloat width = a6;
  v32.size.CGFloat height = a7;
  if ((void)v24) {
    BOOL v16 = *((void *)&v24 + 1) == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v22[0] = v23;
    v22[1] = v24;
    [v15 setScissorRect:v22];
    BOOL v17 = -[PKMetalRenderer setupAlphaBlendingForAlphaBlendFactor:renderEncoder:](v15, a8);
    uint64_t v18 = *(void *)(a1 + 8);
    if (v18) {
      unint64_t v19 = -[PKMetalRenderState pipelineConfig](v18);
    }
    else {
      unint64_t v19 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
    }
    uint64_t v20 = *(void *)(a1 + 192);
    *(void *)&long long v25 = 13;
    *((int8x8_t *)&v25 + 1) = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3 == 0), 0x1FuLL)), (int8x8_t)0x200000001, (int8x8_t)0x500000004);
    __int16 v26 = 0;
    BOOL v27 = v17;
    memset(v28, 0, sizeof(v28));
    int v29 = v19;
    __int16 v30 = WORD2(v19);
    __int16 v31 = 0;
    uint64_t v21 = -[PKMetalResourceHandler namedShaderForKey:](v20, &v25);
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v15);
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v21, v15);
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v15);
  }
}

- (void)copyIntoPaintFromTexture:(void *)a3 clipRect:(uint64_t)a4 renderEncoder:(CGFloat)a5 paintIndex:(CGFloat)a6 alphaBlendFactor:(CGFloat)a7
{
  id v17 = a2;
  id v18 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  if ((void)v29) {
    BOOL v19 = *((void *)&v29 + 1) == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    v27[0] = v28;
    v27[1] = v29;
    [v18 setScissorRect:v27];
    [v18 setFragmentTexture:v17 atIndex:0];
    BOOL v20 = -[PKMetalRenderer setupAlphaBlendingForAlphaBlendFactor:renderEncoder:](v18, a9);
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v18);
    uint64_t v21 = *(void *)(a1 + 8);
    if (v21) {
      unint64_t v22 = -[PKMetalRenderState pipelineConfig](v21);
    }
    else {
      unint64_t v22 = *(unsigned int *)(a1 + 792) | ((unint64_t)*(unsigned __int16 *)(a1 + 796) << 32);
    }
    uint64_t v23 = *(void *)(a1 + 192);
    *(void *)&long long v30 = 7;
    if (a4) {
      unsigned int v24 = 4;
    }
    else {
      unsigned int v24 = 1;
    }
    *((void *)&v30 + 1) = v24;
    __int16 v31 = 0;
    BOOL v32 = v20;
    memset(v33, 0, sizeof(v33));
    int v34 = v22;
    __int16 v35 = WORD2(v22);
    __int16 v36 = 0;
    long long v25 = -[PKMetalResourceHandler namedShaderForKey:](v23, &v30);
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v25, v18);

    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v18);
    uint64_t v26 = *(void *)(a1 + 8);
    if (v26) {
      [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(v26 + 80)];
    }
  }
}

- (BOOL)setupAlphaBlendingForAlphaBlendFactor:(void *)a1 renderEncoder:(double)a2
{
  id v3 = a1;
  id v4 = v3;
  if (a2 < 1.0)
  {
    float v5 = a2;
    float v7 = v5;
    [v3 setFragmentBytes:&v7 length:4 atIndex:0];
  }

  return a2 < 1.0;
}

- (void)setLinedPaper:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 976), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_storeStrong((id *)&self->_multiplyLayerFramebuffer, 0);
  objc_storeStrong((id *)&self->_addLayerFramebuffer, 0);
  begin = self->previewStrokePoints.__begin_;
  if (begin)
  {
    self->previewStrokePoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_randomNumberBuffer, 0);
  objc_storeStrong((id *)&self->_activeCombinedAlternativeStrokes, 0);
  objc_storeStrong((id *)&self->_activeCombinedStroke, 0);
  id v4 = self->_animatingStrokes.__begin_;
  if (v4)
  {
    endouble d = self->_animatingStrokes.__end_;
    uint64_t v6 = self->_animatingStrokes.__begin_;
    if (end != v4)
    {
      do
      while (end != v4);
      uint64_t v6 = self->_animatingStrokes.__begin_;
    }
    self->_animatingStrokes.__end_ = v4;
    operator delete(v6);
  }
  cntrl = self->_sharedSDFStrokeVertexBuffer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v8 = self->_sharedStrokeVertexBuffer.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  uint64_t v9 = self->_liveStrokeStrokePointBuffer.__begin_;
  if (v9)
  {
    self->_liveStrokeStrokePointBuffer.__end_ = v9;
    operator delete(v9);
  }
  uint64_t v10 = self->_sdfPenStrokePointBuffer.__begin_;
  if (v10)
  {
    self->_sdfPenStrokePointBuffer.__end_ = v10;
    operator delete(v10);
  }
  id v11 = self->_paintStrokePointBuffer.__begin_;
  if (v11)
  {
    self->_paintStrokePointBuffer.__end_ = v11;
    operator delete(v11);
  }
  uint64_t v12 = self->_particleStrokePointBuffer.__begin_;
  if (v12)
  {
    self->_particleStrokePointBuffer.__end_ = v12;
    operator delete(v12);
  }
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_dummyColorFramebuffer, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_dummyPaintFramebuffer[i + 1], 0);
  objc_storeStrong((id *)&self->_resourceHandler, 0);
  objc_storeStrong((id *)&self->_maskMSAAFramebuffer, 0);
  objc_storeStrong((id *)&self->_paintFramebufferMask, 0);
  for (uint64_t j = 0; j != -2; --j)
  for (uint64_t k = 0; k != -2; --k)
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_currentRenderState, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 24) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 7) = 0;
  *((_WORD *)self + 32) = 0;
  for (uint64_t i = 112; i != 144; i += 16)
  {
    id v3 = (char *)self + i;
    *((_WORD *)v3 + 4) = 0;
    *(void *)id v3 = 0;
  }
  do
  {
    id v4 = (char *)self + i;
    *((_WORD *)v4 + 4) = 0;
    *(void *)id v4 = 0;
    i += 16;
  }
  while (i != 176);
  *((void *)self + 80) = 0;
  *((_OWORD *)self + 38) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 34) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_DWORD *)self + 200) = 0;
  return self;
}

@end