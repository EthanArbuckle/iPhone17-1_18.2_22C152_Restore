@interface FigSubtitleCALayer
+ (id)defaultActionForKey:(id)a3;
- (BOOL)isOverscanSubtitleSupportEnabled;
- (FigSubtitleCALayer)init;
- (FigSubtitleCALayer)initWithLayer:(id)a3;
- (NSString)captionRenderingStrategy;
- (id)actionForKey:(id)a3;
- (void)_addBoundsAnimation:(id)a3 forKey:(id)a4;
- (void)_addPositionAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimations:(id)a3 forKey:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)handleNeedsLayoutNotification;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)removeAnimationsForKey:(id)a3;
- (void)setCaptionRendererOutputOptions:(id)a3 forKeyPath:(id)a4;
- (void)setCaptionRendererOutputSeparated:(BOOL)a3;
- (void)setCaptionRenderingStrategy:(id)a3;
- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3;
- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3;
- (void)setPlayer:(OpaqueFigPlayer *)a3;
- (void)setSubtitleGravityNonObscuring:(unsigned __int8)a3;
- (void)setVideoRelativeToViewport:(CGRect)a3;
- (void)setVideosize:(CGSize)a3;
- (void)setViewport:(CGRect)a3;
- (void)updateNonForcedSubtitleDisplayEnabled:(unsigned __int8)a3;
@end

@implementation FigSubtitleCALayer

- (id)actionForKey:(id)a3
{
  if ((objc_msgSend(@"hidden", "isEqualToString:") & 1) == 0
    && ![@"contents" isEqualToString:a3])
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleCALayer;
  return [(FigBaseCALayer *)&v6 actionForKey:a3];
}

+ (id)defaultActionForKey:(id)a3
{
  if ((objc_msgSend(@"hidden", "isEqualToString:") & 1) == 0
    && ![@"contents" isEqualToString:a3])
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___FigSubtitleCALayer;
  return objc_msgSendSuper2(&v6, sel_defaultActionForKey_, a3);
}

- (FigSubtitleCALayer)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)FigSubtitleCALayer;
  id v2 = [(FigSubtitleBackdropCALayer *)&v16 init];
  if (!v2) {
    return (FigSubtitleCALayer *)v2;
  }
  v3 = malloc_type_calloc(1uLL, 0x140uLL, 0x10E00406081BCC0uLL);
  *((void *)v2 + 6) = v3;
  if (!v3)
  {
LABEL_11:

    return 0;
  }
  v3[1] = v2;
  long long v4 = *MEMORY[0x1E4F1DB28];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *((_OWORD *)v3 + 1) = *MEMORY[0x1E4F1DB28];
  *((_OWORD *)v3 + 2) = v5;
  *(_OWORD *)(*((void *)v2 + 6) + 48) = *MEMORY[0x1E4F1DB30];
  uint64_t v6 = *((void *)v2 + 6);
  *(_OWORD *)(v6 + 88) = v5;
  *(_OWORD *)(v6 + 72) = v4;
  uint64_t v7 = *((void *)v2 + 6);
  v8 = (long long *)MEMORY[0x1E4F216C0];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F216C0] + 32);
  *(_OWORD *)(v7 + 152) = *(_OWORD *)(MEMORY[0x1E4F216C0] + 48);
  *(_OWORD *)(v7 + 136) = v9;
  long long v10 = *v8;
  *(_OWORD *)(v7 + 120) = v8[1];
  *(_OWORD *)(v7 + 104) = v10;
  *(unsigned char *)(*((void *)v2 + 6) + 168) = 0;
  int v11 = FigSubtitleRendererUseCoreTextRendererByDefault();
  uint64_t v12 = *((void *)v2 + 6);
  if (v11)
  {
    *(_DWORD *)(v12 + 184) = 1;
  }
  else
  {
    *(_DWORD *)(v12 + 184) = 0;
    if (setupFCR(v12))
    {
LABEL_14:
      FigSignalErrorAt();
      goto LABEL_11;
    }
    if (*(_DWORD *)(*((void *)v2 + 6) + 184) != 1) {
      goto LABEL_8;
    }
  }
  [v2 setDelegate:v2];
  if (setupCoreTextRenderer(*((void *)v2 + 6))) {
    goto LABEL_14;
  }
LABEL_8:
  [v2 setEdgeAntialiasingMask:0];
  __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleCALayer.messagequeue<%p>", v2);
  dispatch_queue_t v13 = dispatch_queue_create(label, 0);
  uint64_t v14 = *((void *)v2 + 6);
  *(void *)(v14 + 176) = v13;
  if (!v13) {
    goto LABEL_11;
  }
  if (*(_DWORD *)(v14 + 184) == 1)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    if (!FigNotificationCenterAddWeakListener())
    {
      [v2 setHidden:1];
      *(unsigned char *)(*((void *)v2 + 6) + 171) = 1;
      return (FigSubtitleCALayer *)v2;
    }
    goto LABEL_11;
  }
  return (FigSubtitleCALayer *)v2;
}

- (FigSubtitleCALayer)initWithLayer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FigSubtitleCALayer;
  long long v5 = [(FigSubtitleCALayer *)&v8 initWithLayer:a3];
  if (v5)
  {
    uint64_t v6 = (OpaqueFigSubtitleCALayerInternal *)malloc_type_calloc(1uLL, 0x140uLL, 0x10E00406081BCC0uLL);
    v5->layerInternal = v6;
    if (v6)
    {
      v6->var1 = v5;
      v6->var9 = 1;
      v6->var7 = 0;
      return v5;
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    unsigned int var12 = layerInternal->var12;
    if (!var12)
    {
      releaseFCR((uint64_t)layerInternal);
      layerInternal = self->layerInternal;
      unsigned int var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      releaseCoreTextRenderer((uint64_t)layerInternal);
      layerInternal = self->layerInternal;
    }
    if (layerInternal->var11)
    {
      dispatch_release((dispatch_object_t)layerInternal->var11);
      layerInternal = self->layerInternal;
      layerInternal->var11 = 0;
    }
    if (!layerInternal->var0 || (CFRelease(layerInternal->var0), (layerInternal = self->layerInternal) != 0))
    {
      self->layerInternal = 0;
      free(layerInternal);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleCALayer;
  [(FigSubtitleBackdropCALayer *)&v5 dealloc];
}

- (void)clear
{
  layerInternal = self->layerInternal;
  unsigned int var12 = layerInternal->var12;
  if (!var12)
  {
    FigCaptionRendererSessionClear(layerInternal->var14, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    layerInternal = self->layerInternal;
    unsigned int var12 = layerInternal->var12;
  }
  if (var12 == 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v6 = layerInternal;
    uint64_t v7 = 1;
    var11 = layerInternal->var11;
    if (var11)
    {
      dispatch_sync_f(var11, &v6, (dispatch_function_t)updateSubtitleDo);
      layerInternal = self->layerInternal;
    }
    objc_msgSend(layerInternal->var1, "setNeedsDisplay", v6, v7, v8, v9);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  layerInternal = self->layerInternal;
  if (layerInternal->var12 == 1)
  {
    var11 = layerInternal->var11;
    if (var11)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __45__FigSubtitleCALayer_layoutSublayersOfLayer___block_invoke;
      v5[3] = &unk_1E57955D0;
      v5[4] = self;
      v5[5] = a3;
      dispatch_sync(var11, v5);
    }
  }
}

uint64_t __45__FigSubtitleCALayer_layoutSublayersOfLayer___block_invoke(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 32) + 48) + 240));
  v3 = *(void **)(a1 + 40);
  long long v4 = *(float64x2_t **)(*(void *)(a1 + 32) + 48);
  if (Count)
  {
    __asm { FMOV            V2.2D, #0.5 }
    objc_msgSend(v3, "setPosition:", vaddq_f64(v4[1], vmulq_f64(v4[2], _Q2)));
    long long v10 = *(void **)(a1 + 40);
    int v11 = *(double **)(*(void *)(a1 + 32) + 48);
    double v12 = v11[2];
    double v13 = v11[3];
    double v14 = v11[4];
    double v15 = v11[5];
    return objc_msgSend(v10, "setBounds:", v12, v13, v14, v15);
  }
  else
  {
    __asm { FMOV            V2.2D, #0.5 }
    objc_msgSend(v3, "setPosition:", vaddq_f64(v4[18], vmulq_f64(v4[19], _Q2)));
    objc_msgSend(*(id *)(a1 + 40), "setBounds:", *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 288), *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 296), *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 304), *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 312));
    double WindowRoundedCornerRadius = FigSubtitleRendererGetWindowRoundedCornerRadius(*(void *)(*(void *)(*(void *)(a1 + 32) + 48)
                                                                                          + 208));
    v19 = *(void **)(a1 + 40);
    return [v19 setCornerRadius:WindowRoundedCornerRadius];
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  layerInternal = self->layerInternal;
  if (layerInternal->var12 == 1)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3052000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    uint64_t v27 = 0;
    var11 = layerInternal->var11;
    if (var11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__FigSubtitleCALayer_drawLayer_inContext___block_invoke;
      block[3] = &unk_1E5795780;
      block[4] = self;
      block[5] = &v22;
      dispatch_sync(var11, block);
      if (v23[5])
      {
        CGContextSaveGState(a4);
        uint64_t v9 = (CGFloat *)MEMORY[0x1E4F1DAB8];
        long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
        if ([a3 contentsAreFlipped])
        {
          [a3 frame];
          CGFloat v11 = v10;
          long long v20 = 0uLL;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.a = 1.0;
          *(_OWORD *)&transform.d = xmmword_1949965D0;
          transform.ty = v10;
          CGContextConcatCTM(a4, &transform);
          CGFloat v12 = 0.0;
          CGFloat v13 = -1.0;
          CGFloat v14 = 1.0;
        }
        else
        {
          CGFloat v14 = *v9;
          CGFloat v13 = v9[3];
          CGFloat v12 = v9[4];
          CGFloat v11 = v9[5];
        }
        *(_OWORD *)&transform.c = v20;
        var15 = self->layerInternal->var15;
        uint64_t v16 = v23[5];
        *(void *)&transform.a = a4;
        transform.b = v14;
        transform.tx = v13;
        transform.ty = v12;
        CGFloat v19 = v11;
        FigSubtitleRendererDrawSubtitleText((uint64_t)var15, v16, (uint64_t)&transform);
        v17 = (const void *)v23[5];
        if (v17) {
          CFRelease(v17);
        }
        CGContextRestoreGState(a4);
      }
      else
      {
        [a3 bounds];
        CGContextClearRect(a4, v28);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
}

void *__42__FigSubtitleCALayer_drawLayer_inContext___block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = *(void *)(result[4] + 48);
  if (*(unsigned char *)(v2 + 224) || *(unsigned char *)(v2 + 168))
  {
    result = *(void **)(v2 + 216);
    if (result) {
      result = CFRetain(result);
    }
    *(void *)(*(void *)(v1[5] + 8) + 40) = result;
  }
  return result;
}

- (void)_addBoundsAnimation:(id)a3 forKey:(id)a4
{
  if ([a3 isAdditive])
  {
    uint64_t v7 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    uint64_t v8 = __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke;
  }
  else
  {
    uint64_t v7 = &v12;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v8 = __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke_2;
  }
  v7[2] = (uint64_t)v8;
  v7[3] = (uint64_t)&unk_1E5798248;
  v7[4] = (uint64_t)self;
  id v9 = _animationByTransformingValues(a3, (uint64_t)v7);
  if ([a3 isAdditive]) {
    CGFloat v10 = @"bounds.size";
  }
  else {
    CGFloat v10 = @"bounds";
  }
  objc_msgSend(v9, "setKeyPath:", v10, v12, v13);
  [v9 setDelegate:0];
  layerInternal = self->layerInternal;
  if (layerInternal->var12) {
    [(FigSubtitleBackdropCALayer *)self addAnimation:v9 forKey:a4];
  }
  else {
    FigCaptionRendererSessionAddAnimation((uint64_t)layerInternal->var14, (uint64_t)v9, (uint64_t)a4);
  }
}

uint64_t __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  [a2 sizeValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(_DWORD *)(v6 + 184))
  {
    getLayoutForAnimation(v6, (uint64_t)&v10, 0.0, 0.0, v4 + *(double *)(v6 + 32), v5 + *(double *)(v6 + 40));
  }
  else
  {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(void *)(v6 + 200), &v10);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    long long v8 = v11;
    *(_OWORD *)(v7 + 256) = v10;
    *(_OWORD *)(v7 + 272) = v8;
  }
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", *(double *)&v11 - *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 272), *((double *)&v11 + 1) - *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 280));
}

uint64_t __49__FigSubtitleCALayer__addBoundsAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  objc_msgSend(a2, "rectValue", v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(_DWORD *)(v8 + 184)) {
    getLayoutForAnimation(v8, (uint64_t)&v10, v4, v5, v6, v7);
  }
  else {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(void *)(v8 + 200), &v10);
  }
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, v11);
}

- (void)_addPositionAnimation:(id)a3 forKey:(id)a4
{
  if ([a3 isAdditive])
  {
    double v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    uint64_t v8 = __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke;
  }
  else
  {
    double v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    uint64_t v8 = __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke_2;
  }
  v7[2] = v8;
  v7[3] = &unk_1E5798248;
  v7[4] = self;
  id v9 = _animationByTransformingValues(a3, (uint64_t)v7);
  [v9 setKeyPath:@"position"];
  [v9 setDelegate:0];
  layerInternal = self->layerInternal;
  if (layerInternal->var12) {
    [(FigSubtitleBackdropCALayer *)self addAnimation:v9 forKey:a4];
  }
  else {
    FigCaptionRendererSessionAddAnimation((uint64_t)layerInternal->var14, (uint64_t)v9, (uint64_t)a4);
  }
}

uint64_t __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  float64x2_t v3 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
  float64x2_t v15 = *(float64x2_t *)MEMORY[0x1E4F1DB28];
  float64x2_t v16 = v3;
  [a2 sizeValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(_DWORD *)(v6 + 184))
  {
    getLayoutForAnimation(v6, (uint64_t)&v15, 0.0, 0.0, v4 + *(double *)(v6 + 32), v5 + *(double *)(v6 + 40));
  }
  else
  {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(void *)(v6 + 200), &v15);
    double v7 = *(float64x2_t **)(*(void *)(a1 + 32) + 48);
    float64x2_t v8 = v16;
    v7[16] = v15;
    v7[17] = v8;
  }
  __asm { FMOV            V4.2D, #0.5 }
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", vsubq_f64(vmlaq_f64(v15, _Q4, v16), vmlaq_f64(*(float64x2_t *)(*(void *)(*(void *)(a1 + 32) + 48) + 256), _Q4, *(float64x2_t *)(*(void *)(*(void *)(a1 + 32) + 48) + 272))));
}

uint64_t __51__FigSubtitleCALayer__addPositionAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  [a2 rectValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48);
  if (*(_DWORD *)(v8 + 184)) {
    getLayoutForAnimation(v8, (uint64_t)&v10, v4, v5, v6, v7);
  }
  else {
    FigCaptionRendererSessionGetCALayerNodeLayoutForAnimation(*(void *)(v8 + 200), &v10);
  }
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *(double *)&v10 + *(double *)&v11 * 0.5, *((double *)&v10 + 1) + *((double *)&v11 + 1) * 0.5);
}

- (void)handleNeedsLayoutNotification
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xBFF0000000000000;
  var11 = self->layerInternal->var11;
  if (var11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke;
    block[3] = &unk_1E5795698;
    block[4] = self;
    block[5] = &v6;
    dispatch_sync(var11, block);
    if (v7[3] >= 0.0)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke_2;
      v4[3] = &unk_1E5795780;
      v4[4] = self;
      v4[5] = &v6;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
  updateSubtitleDisplay((uint64_t)self->layerInternal, 1);
  _Block_object_dispose(&v6, 8);
}

void __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = FigSubtitleRendererGetWindowOpacity(*(void *)(*(void *)(*(void *)(a1 + 32) + 48) + 208));
}

uint64_t __51__FigSubtitleCALayer_handleNeedsLayoutNotification__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) updateWindowOpacity:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)setCaptionRenderingStrategy:(id)a3
{
  id v4 = (id)[a3 copy];
  if (v4)
  {
    double v5 = v4;
    if ([v4 isEqualToString:@"CoreTextSubtitleRenderer"])
    {
      layerInternal = self->layerInternal;
      var13 = layerInternal->var13;
      uint64_t v8 = (const void **)&kFigPlayerCaptionRenderingStrategy_CoreTextSubtitleRenderer;
    }
    else
    {
      if (![v5 isEqualToString:@"CaptionDisplayService"]) {
        return;
      }
      layerInternal = self->layerInternal;
      var13 = layerInternal->var13;
      uint64_t v8 = (const void **)&kFigPlayerCaptionRenderingStrategy_CaptionDisplayService;
    }
    long long v10 = *v8;
    layerInternal->var13 = (__CFString *)*v8;
    if (v10) {
      CFRetain(v10);
    }
    if (var13)
    {
      CFRelease(var13);
    }
  }
  else
  {
    unint64_t v9 = self->layerInternal->var13;
    if (v9)
    {
      CFRelease(v9);
      self->layerInternal->var13 = 0;
    }
  }
}

- (NSString)captionRenderingStrategy
{
  result = &self->layerInternal->var13->isa;
  if (result)
  {
    if (FigCFEqual())
    {
      return (NSString *)@"CoreTextSubtitleRenderer";
    }
    else if (FigCFEqual())
    {
      return (NSString *)@"CaptionDisplayService";
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setPlayer:(OpaqueFigPlayer *)a3
{
  layerInternal = self->layerInternal;
  CFTypeRef cf = 0;
  if (!layerInternal->var9)
  {
    if (a3)
    {
      if (FigCFEqual())
      {
        if (layerInternal->var12 == 1)
        {
          releaseCoreTextRenderer((uint64_t)layerInternal);
          setupFCR((uint64_t)layerInternal);
          layerInternal->unsigned int var12 = 0;
        }
      }
      else if (FigCFEqual() && !layerInternal->var12)
      {
        releaseFCR((uint64_t)layerInternal);
        setupCoreTextRenderer((uint64_t)layerInternal);
        layerInternal->unsigned int var12 = 1;
      }
    }
    unsigned int var12 = layerInternal->var12;
    if (!var12)
    {
      FigCaptionRendererSessionSetPlayer((uint64_t)layerInternal->var14, (uint64_t)a3);
      unsigned int var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      if (layerInternal->var0)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener();
        var0 = layerInternal->var0;
      }
      else
      {
        var0 = 0;
      }
      layerInternal->var0 = a3;
      if (a3) {
        CFRetain(a3);
      }
      if (var0) {
        CFRelease(var0);
      }
      if (layerInternal->var0)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        uint64_t FigBaseObject = FigPlayerGetFigBaseObject(layerInternal->var0);
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        long long v10 = *(void (**)(uint64_t, __CFString *, void, CFTypeRef *))(v9 + 48);
        if (v10)
        {
          v10(FigBaseObject, @"LastSentSubtitleSample", *MEMORY[0x1E4F1CF80], &cf);
          if (cf)
          {
            digestSubtitleSample(1, (uint64_t)layerInternal, cf);
            if (cf) {
              CFRelease(cf);
            }
          }
        }
      }
    }
  }
}

- (void)setViewport:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  layerInternal = self->layerInternal;
  if (!layerInternal->var12)
  {
    -[FigSubtitleBackdropCALayer setBounds:](self, "setBounds:", 0.0, 0.0, a3.size.width, a3.size.height);
    -[FigSubtitleCALayer setPosition:](self, "setPosition:", width * 0.5, height * 0.5);
    layerInternal = self->layerInternal;
  }
  if (width >= 0.0 && height >= 0.0)
  {
    layerInternal->var2.origin.double x = x;
    layerInternal->var2.origin.double y = y;
    layerInternal->var2.size.double width = width;
    layerInternal->var2.size.double height = height;
    unsigned int var12 = layerInternal->var12;
    if (!var12)
    {
      FigCaptionRendererSessionSetLayoutContext_Viewport((uint64_t)layerInternal->var14, x, y, width, height);
      unsigned int var12 = layerInternal->var12;
    }
    if (var12 == 1)
    {
      CFIndex Count = CFArrayGetCount(layerInternal->var19);
      if (Count >= 1)
      {
        CFIndex v11 = Count;
        for (CFIndex i = 0; i != v11; ++i)
        {
          ValueAtIndedouble x = (void *)CFArrayGetValueAtIndex(layerInternal->var19, i);
          objc_msgSend(ValueAtIndex, "setViewport:", FCRGetVideoPresentationBounds(layerInternal->var3.width, layerInternal->var3.height, x, y, width, height));
        }
      }
    }
  }
  CGFloat v14 = self->layerInternal;
  if (v14->var12 == 1)
  {
    updateSubtitleDisplay((uint64_t)v14, 0);
  }
}

- (void)setVideosize:(CGSize)a3
{
  layerInternal = self->layerInternal;
  if (a3.width >= 0.0)
  {
    CGFloat height = a3.height;
    if (a3.height >= 0.0)
    {
      CGFloat width = a3.width;
      uint64_t v6 = self->layerInternal;
      if (!layerInternal->var12)
      {
        FigCaptionRendererSessionSetLayoutContext_VideoSize(layerInternal->var14, a3.width, a3.height);
        uint64_t v6 = self->layerInternal;
      }
      layerInternal->var3.CGFloat width = width;
      layerInternal->var3.CGFloat height = height;
      layerInternal = v6;
    }
  }
  if (layerInternal->var12 == 1)
  {
    updateSubtitleDisplay((uint64_t)layerInternal, 0);
  }
}

- (void)setSubtitleGravityNonObscuring:(unsigned __int8)a3
{
  layerInternal = self->layerInternal;
  unsigned int var12 = layerInternal->var12;
  double v7 = layerInternal;
  if (!var12)
  {
    FigCaptionRendererSessionSetLayoutContext_Gravity(layerInternal->var14, a3);
    double v7 = self->layerInternal;
    unsigned int var12 = v7->var12;
  }
  layerInternal->var4 = a3;
  if (var12 == 1)
  {
    updateSubtitleDisplay((uint64_t)v7, 0);
  }
}

- (void)updateNonForcedSubtitleDisplayEnabled:(unsigned __int8)a3
{
  layerInternal = self->layerInternal;
  v5[0] = layerInternal;
  v5[1] = a3;
  if (layerInternal->var11)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var11, v5, (dispatch_function_t)updateNonForcedSubtitleDisplayEnabledDo);
    layerInternal = self->layerInternal;
  }
  if (layerInternal->var12 == 1) {
    updateSubtitleDisplay((uint64_t)layerInternal, 1);
  }
}

- (void)setVideoRelativeToViewport:(CGRect)a3
{
  layerInternal = self->layerInternal;
  if (a3.size.width >= 0.0)
  {
    CGFloat height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      CGFloat width = a3.size.width;
      CGFloat y = a3.origin.y;
      CGFloat x = a3.origin.x;
      uint64_t v8 = self->layerInternal;
      if (!layerInternal->var12)
      {
        FigCaptionRendererSessionSetLayoutContext_VideoRelativeToViewport(layerInternal->var14, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        uint64_t v8 = self->layerInternal;
      }
      layerInternal->var5.origin.CGFloat x = x;
      layerInternal->var5.origin.CGFloat y = y;
      layerInternal->var5.size.CGFloat width = width;
      layerInternal->var5.size.CGFloat height = height;
      layerInternal = v8;
    }
  }
  if (layerInternal->var12 == 1)
  {
    updateSubtitleDisplay((uint64_t)layerInternal, 0);
  }
}

- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3
{
  layerInternal = self->layerInternal;
  FigGeometryMargins v9 = *a3;
  if (!layerInternal->var12)
  {
    var14 = layerInternal->var14;
    FigGeometryDimension right = a3->right;
    v10[0] = a3->left;
    v10[1] = right;
    FigGeometryDimension bottom = a3->bottom;
    v10[2] = a3->top;
    v10[3] = bottom;
    FigCaptionRendererSessionSetLayoutContext_CaptionsAvoidanceMargins(var14, v10);
  }
  layerInternal->var6 = v9;
  uint64_t v8 = self->layerInternal;
  if (v8->var12 == 1) {
    updateSubtitleDisplay((uint64_t)v8, 0);
  }
}

- (void)setCaptionRendererOutputOptions:(id)a3 forKeyPath:(id)a4
{
  if (a4) {
    FigCaptionRendererSessionSetOptions((uint64_t)self->layerInternal->var14, (uint64_t)a4, (uint64_t)a3);
  }
}

- (void)setCaptionRendererOutputSeparated:(BOOL)a3
{
}

- (BOOL)isOverscanSubtitleSupportEnabled
{
  layerInternal = self->layerInternal;
  unsigned int var12 = layerInternal->var12;
  if (var12 == 1)
  {
    uint64_t v8 = 0;
    FigGeometryMargins v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    var11 = layerInternal->var11;
    if (var11)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__FigSubtitleCALayer_isOverscanSubtitleSupportEnabled__block_invoke;
      v7[3] = &unk_1E5795698;
      v7[4] = self;
      v7[5] = &v8;
      dispatch_sync(var11, v7);
      BOOL v4 = *((unsigned char *)v9 + 24) != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
    _Block_object_dispose(&v8, 8);
  }
  else if (var12)
  {
    return 0;
  }
  else
  {
    LOBYTE(v8) = 0;
    return FigCaptionRendererSessionGetLayoutContext_Overscan((uint64_t)layerInternal->var14, &v8) != 0;
  }
  return v4;
}

uint64_t __54__FigSubtitleCALayer_isOverscanSubtitleSupportEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 48)
                                                                            + 169);
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
  layerInternal = self->layerInternal;
  if (!layerInternal->var12) {
    FigCaptionRendererSessionSetLayoutContext_Overscan(layerInternal->var14, a3);
  }
  [(FigSubtitleCALayer *)self bounds];
  var11 = self->layerInternal->var11;
  if (var11)
  {
    double v11 = v6;
    double v12 = v7;
    double v13 = v8;
    double v14 = v9;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__FigSubtitleCALayer_setOverscanSubtitleSupportEnabled___block_invoke;
    v15[3] = &unk_1E5795710;
    v15[4] = self;
    BOOL v16 = a3;
    dispatch_sync(var11, v15);
    -[FigSubtitleBackdropCALayer setBounds:](self, "setBounds:", v11, v12, v13, v14);
  }
}

uint64_t __56__FigSubtitleCALayer_setOverscanSubtitleSupportEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 48) + 169) = *(unsigned char *)(result + 40);
  return result;
}

- (void)addAnimations:(id)a3 forKey:(id)a4
{
  if (!self->layerInternal->var12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[FigSubtitleCALayer _addBoundsAnimation:forKey:](self, "_addBoundsAnimation:forKey:", a3, [NSString stringWithFormat:@"FigSubtitleCALayer_Bounds_%@", a4]);
      -[FigSubtitleCALayer _addPositionAnimation:forKey:](self, "_addPositionAnimation:forKey:", a3, [NSString stringWithFormat:@"FigSubtitleCALayer_Position_%@", a4]);
    }
  }
  if (self->layerInternal->var12 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[FigSubtitleCALayer _addBoundsAnimation:forKey:](self, "_addBoundsAnimation:forKey:", a3, [NSString stringWithFormat:@"FigSubtitleCALayer_Bounds_%@", a4]);
      uint64_t v7 = [NSString stringWithFormat:@"FigSubtitleCALayer_Position_%@", a4];
      [(FigSubtitleCALayer *)self _addPositionAnimation:a3 forKey:v7];
    }
  }
}

- (void)removeAnimationsForKey:(id)a3
{
  unsigned int var12 = self->layerInternal->var12;
  if (!var12)
  {
    v9.receiver = self;
    v9.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v9, sel_removeAnimationForKey_, [NSString stringWithFormat:@"FigSubtitleCALayer_Bounds_%@", a3]);
    v8.receiver = self;
    v8.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v8, sel_removeAnimationForKey_, [NSString stringWithFormat:@"FigSubtitleCALayer_Position_%@", a3]);
    unsigned int var12 = self->layerInternal->var12;
  }
  if (var12 == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v7, sel_removeAnimationForKey_, [NSString stringWithFormat:@"FigSubtitleCALayer_Bounds_%@", a3]);
    v6.receiver = self;
    v6.super_class = (Class)FigSubtitleCALayer;
    -[FigSubtitleCALayer removeAnimationForKey:](&v6, sel_removeAnimationForKey_, [NSString stringWithFormat:@"FigSubtitleCALayer_Position_%@", a3]);
  }
}

@end