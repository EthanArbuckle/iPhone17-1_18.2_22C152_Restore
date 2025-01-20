@interface FigSubtitleWebVTTRegionCALayer
- (FigSubtitleWebVTTRegionCALayer)init;
- (__CFString)getContentID;
- (void)dealloc;
- (void)handleNeedsLayoutNotification;
- (void)layoutSublayers;
- (void)setContent:(__CFDictionary *)a3;
- (void)setNeedsDisplay;
- (void)setReLayout;
- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3;
- (void)setViewport:(CGRect)a3;
@end

@implementation FigSubtitleWebVTTRegionCALayer

- (FigSubtitleWebVTTRegionCALayer)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  v2 = [(FigBaseCALayer *)&v7 init];
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040DD8530F3uLL);
    v2->layerInternal = (OpaqueFigSubtitleWebVTTRegionCALayerInternal *)v3;
    if (!v3) {
      goto LABEL_6;
    }
    *(void *)v3 = v2;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v3 + 24) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v3 + 40) = v4;
    v2->layerInternal->var2 = 0;
    v2->layerInternal->var4 = 0;
    v2->layerInternal->var6 = 1;
    [(FigSubtitleWebVTTRegionCALayer *)v2 setMasksToBounds:1];
    v2->layerInternal->var5 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (!v2->layerInternal->var5
      || (__sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleWebVTTRegionCALayer.messagequeue<%p>", v2),
          dispatch_queue_t v5 = dispatch_queue_create(label, 0),
          (v2->layerInternal->var1 = v5) == 0)
      || (CMNotificationCenterGetDefaultLocalCenter(), FigNotificationCenterAddWeakListener()))
    {
LABEL_6:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  layerInternal = self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal->var2)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      layerInternal = self->layerInternal;
      if (layerInternal->var2)
      {
        CFRelease(layerInternal->var2);
        layerInternal = self->layerInternal;
      }
    }
    if (layerInternal->var1)
    {
      dispatch_release((dispatch_object_t)layerInternal->var1);
      layerInternal = self->layerInternal;
      layerInternal->var1 = 0;
    }
    if (layerInternal->var5)
    {
      CFRelease(layerInternal->var5);
      layerInternal = self->layerInternal;
    }
    if (!layerInternal->var4 || (CFRelease(layerInternal->var4), (layerInternal = self->layerInternal) != 0)) {
      free(layerInternal);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  [(FigSubtitleWebVTTRegionCALayer *)&v4 dealloc];
}

- (__CFString)getContentID
{
  objc_super v4 = 0;
  context[0] = self->layerInternal;
  context[1] = &v4;
  result = *(__CFString **)(context[0] + 8);
  if (result)
  {
    dispatch_sync_f((dispatch_queue_t)result, context, (dispatch_function_t)getContentIDDo);
    return v4;
  }
  return result;
}

- (void)setContent:(__CFDictionary *)a3
{
  layerInternal = self->layerInternal;
  v5[0] = layerInternal;
  v5[1] = a3;
  if (layerInternal->var1)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var1, v5, (dispatch_function_t)setContentDo);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3
{
  v4[0] = self->layerInternal;
  v4[1] = a3;
  v3 = *(NSObject **)(v4[0] + 8);
  if (v3) {
    dispatch_sync_f(v3, v4, (dispatch_function_t)setRendererDo);
  }
}

- (void)setViewport:(CGRect)a3
{
  layerInternal = self->layerInternal;
  context = layerInternal;
  CGRect v6 = a3;
  if (layerInternal->var1)
  {
    dispatch_sync_f((dispatch_queue_t)layerInternal->var1, &context, (dispatch_function_t)setViewportDo);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

- (void)setNeedsDisplay
{
  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleWebVTTRegionCALayer_setNeedsDisplay__block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(var1, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
  [(FigBaseCALayer *)&v4 setNeedsDisplay];
}

CFIndex __49__FigSubtitleWebVTTRegionCALayer_setNeedsDisplay__block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 32) + 40) + 64));
  if (result >= 1)
  {
    CFIndex v3 = result;
    for (CFIndex i = 0; i != v3; ++i)
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 32) + 40) + 64), i);
      CFIndex result = [ValueAtIndex isDirty];
      if (result) {
        CFIndex result = [ValueAtIndex setNeedsDisplay];
      }
    }
  }
  return result;
}

- (void)setReLayout
{
  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__FigSubtitleWebVTTRegionCALayer_setReLayout__block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(var1, block);
  }
}

uint64_t __45__FigSubtitleWebVTTRegionCALayer_setReLayout__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 40) + 72) = 1;
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)layoutSublayers
{
  layerInternal = self->layerInternal;
  unsigned int var6 = layerInternal->var6;
  if (var6 != 2)
  {
    if (var6 == 1) {
      layerInternal->unsigned int var6 = 2;
    }
    int v5 = [(FigSubtitleWebVTTRegionCALayer *)self contentsAreFlipped];
    uint64_t v18 = 0;
    v19 = (float64x2_t *)&v18;
    uint64_t v20 = 0x4010000000;
    v21 = &unk_194A3FED6;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v22 = *MEMORY[0x1E4F1DB28];
    long long v23 = v6;
    var1 = self->layerInternal->var1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke;
    block[3] = &unk_1E5795758;
    block[4] = self;
    void block[5] = &v18;
    int v17 = v5;
    dispatch_sync(var1, block);
    __asm { FMOV            V2.2D, #0.5 }
    [(FigSubtitleWebVTTRegionCALayer *)self setPosition:vaddq_f64(v19[2], vmulq_f64(v19[3], _Q2))];
    -[FigSubtitleWebVTTRegionCALayer setBounds:](self, "setBounds:", v19[2].f64[0], v19[2].f64[1], v19[3].f64[0], v19[3].f64[1]);
    v13 = self->layerInternal->var1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke_2;
    v15[3] = &unk_1E5795780;
    v15[4] = self;
    v15[5] = &v18;
    dispatch_sync(v13, v15);
    v14.receiver = self;
    v14.super_class = (Class)FigSubtitleWebVTTRegionCALayer;
    [(FigSubtitleWebVTTRegionCALayer *)&v14 layoutSublayers];
    _Block_object_dispose(&v18, 8);
  }
}

void __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke(uint64_t a1)
{
  double RegionBounds = FigSubtitleRendererGetRegionBounds(*(const __CFDictionary **)(*(void *)(*(void *)(a1 + 32) + 40) + 56), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 24), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = RegionBounds;
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 56) = v6;
}

void __49__FigSubtitleWebVTTRegionCALayer_layoutSublayers__block_invoke_2(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 32) + 40) + 64));
  int v3 = [*(id *)(a1 + 32) contentsAreFlipped];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(double *)(v4 + 40);
  if (v3) {
    double v5 = v5 + *(double *)(v4 + 56);
  }
  double RegionDefaultFontSize = FigSubtitleRendererGetRegionDefaultFontSize(*(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 24), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 48));
  if (Count >= 1)
  {
    double v7 = RegionDefaultFontSize;
    uint64_t v8 = 0;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(*(void *)(a1 + 32) + 40) + 64), Count + v8 - 1);
      objc_msgSend(ValueAtIndex, "setViewport:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
      [ValueAtIndex setDefaultFontSize:v7];
      [ValueAtIndex getSuggestedBounds:1];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = *(void **)(a1 + 32);
      if (v8 || *(_DWORD *)(v16[5] + 72))
      {
        if ([v16 contentsAreFlipped]) {
          double v17 = v15;
        }
        else {
          double v17 = 0.0;
        }
      }
      else
      {
        if ([v16 contentsAreFlipped]) {
          double v17 = 0.0;
        }
        else {
          double v17 = v15;
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 40) + 72) = 2;
      }
      double v18 = v5 - v17;
      objc_msgSend(ValueAtIndex, "setCuePosition:", v13 * 0.5 + v11 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v15 * 0.5 + v18);
      [ValueAtIndex setNeedsLayout];
      int v19 = [*(id *)(a1 + 32) contentsAreFlipped];
      double v20 = -0.0;
      if (!v19) {
        double v20 = v15;
      }
      double v5 = v18 + v20;
      --v8;
    }
    while (Count + v8 > 0);
  }
}

- (void)handleNeedsLayoutNotification
{
  layerInternal = self->layerInternal;
  var1 = layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__FigSubtitleWebVTTRegionCALayer_handleNeedsLayoutNotification__block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(var1, block);
    layerInternal = self->layerInternal;
  }
  updateRegionDisplay(&layerInternal->var0);
}

uint64_t __63__FigSubtitleWebVTTRegionCALayer_handleNeedsLayoutNotification__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 40) + 72) = 1;
  return result;
}

@end