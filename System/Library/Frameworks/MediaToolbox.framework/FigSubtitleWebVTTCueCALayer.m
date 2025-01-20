@interface FigSubtitleWebVTTCueCALayer
- (CGRect)getSuggestedBounds:(unsigned __int8)a3;
- (FigSubtitleWebVTTCueCALayer)init;
- (__CFString)getContentID;
- (unsigned)isDirty;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setContent:(__CFAttributedString *)a3;
- (void)setCuePosition:(CGPoint)a3;
- (void)setDefaultFontSize:(double)a3;
- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3;
- (void)setViewport:(CGRect)a3;
@end

@implementation FigSubtitleWebVTTCueCALayer

- (FigSubtitleWebVTTCueCALayer)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleWebVTTCueCALayer;
  v2 = [(FigSubtitleBackdropCALayer *)&v7 init];
  if (v2)
  {
    v3 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10A00401FA4BE4CuLL);
    v2->layerInternal = (OpaqueFigSubtitleWebVTTCueCALayerInternal *)v3;
    if (!v3) {
      goto LABEL_5;
    }
    *(void *)v3 = v2;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v3 + 24) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v3 + 40) = v4;
    v2->layerInternal->var2 = 0;
    v2->layerInternal->var4 = 0;
    v2->layerInternal->var5 = 0;
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleWebVTTCueCALayer.messagequeue<%p>", v2);
    dispatch_queue_t v5 = dispatch_queue_create(label, 0);
    v2->layerInternal->var1 = v5;
    if (v5)
    {
      [(FigSubtitleBackdropCALayer *)v2 setDelegate:v2];
    }
    else
    {
LABEL_5:

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
      CFRelease(layerInternal->var2);
      layerInternal = self->layerInternal;
    }
    if (layerInternal->var1)
    {
      dispatch_release((dispatch_object_t)layerInternal->var1);
      layerInternal = self->layerInternal;
      layerInternal->var1 = 0;
    }
    if (!layerInternal->var4 || (CFRelease(layerInternal->var4), (layerInternal = self->layerInternal) != 0)) {
      free(layerInternal);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleWebVTTCueCALayer;
  [(FigSubtitleBackdropCALayer *)&v4 dealloc];
}

- (void)setCuePosition:(CGPoint)a3
{
  context = self->layerInternal;
  CGPoint v5 = a3;
  var1 = context->var1;
  if (var1) {
    dispatch_sync_f(var1, &context, (dispatch_function_t)setCuePositionDo);
  }
}

- (CGRect)getSuggestedBounds:(unsigned __int8)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v10 = *MEMORY[0x1E4F1DB28];
  long long v11 = v3;
  context[0] = self->layerInternal;
  context[1] = a3;
  context[2] = &v10;
  objc_super v4 = *(NSObject **)(context[0] + 8);
  if (v4) {
    dispatch_sync_f(v4, context, (dispatch_function_t)getSuggestedBoundsDo);
  }
  double v6 = *((double *)&v10 + 1);
  double v5 = *(double *)&v10;
  double v8 = *((double *)&v11 + 1);
  double v7 = *(double *)&v11;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (unsigned)isDirty
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  var1 = self->layerInternal->var1;
  if (var1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__FigSubtitleWebVTTCueCALayer_isDirty__block_invoke;
    v5[3] = &unk_1E5795698;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(var1, v5);
    unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__FigSubtitleWebVTTCueCALayer_isDirty__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 48)
                                                                            + 64);
  return result;
}

- (__CFString)getContentID
{
  context[0] = self->layerInternal;
  context[1] = &v4;
  CGRect result = *(__CFString **)(context[0] + 8);
  if (result)
  {
    objc_super v4 = 0;
    dispatch_sync_f((dispatch_queue_t)result, context, (dispatch_function_t)getContentIDDo_0);
    return v4;
  }
  return result;
}

- (void)setContent:(__CFAttributedString *)a3
{
  v4[0] = self->layerInternal;
  v4[1] = a3;
  unsigned __int8 v3 = *(NSObject **)(v4[0] + 8);
  if (v3) {
    dispatch_sync_f(v3, v4, (dispatch_function_t)setContentDo_0);
  }
}

- (void)setRenderer:(OpaqueFigSubtitleRenderer *)a3
{
  v4[0] = self->layerInternal;
  v4[1] = a3;
  unsigned __int8 v3 = *(NSObject **)(v4[0] + 8);
  if (v3) {
    dispatch_sync_f(v3, v4, (dispatch_function_t)setRendererDo_0);
  }
}

- (void)setViewport:(CGRect)a3
{
  context = self->layerInternal;
  CGRect v5 = a3;
  var1 = context->var1;
  if (var1) {
    dispatch_sync_f(var1, &context, (dispatch_function_t)setViewportDo_0);
  }
}

- (void)setDefaultFontSize:(double)a3
{
  v4[0] = self->layerInternal;
  *(double *)&v4[1] = a3;
  unsigned __int8 v3 = *(NSObject **)(v4[0] + 8);
  if (v3) {
    dispatch_sync_f(v3, v4, (dispatch_function_t)setDefaultFontSizeDo);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(var1, block);
  }
  [(FigSubtitleWebVTTCueCALayer *)self getSuggestedBounds:0];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [a3 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v20 = v14;
  CGFloat v21 = v15;
  if (v15 <= 0.0 || v14 <= 0.0 || fabs((v11 - v14) / v14) >= 0.02 || fabs((v13 - v15) / v15) >= 0.02)
  {
    v22 = self->layerInternal->var1;
    if (v22)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_2;
      v30[3] = &unk_1E5794738;
      v30[4] = self;
      dispatch_sync(v22, v30);
    }
  }
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  v23 = self->layerInternal->var1;
  if (v23)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_3;
    v29[3] = &unk_1E57955D0;
    v29[4] = a3;
    v29[5] = self;
    dispatch_sync(v23, v29);
  }
  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = v20;
  v32.size.height = v21;
  if (CGRectEqualToRect(v32, *MEMORY[0x1E4F1DB28]))
  {
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend(a3, "setPosition:", v7 + v11 * 0.5, v9 + v13 * 0.5);
  }
  else
  {
    [a3 position];
    double v25 = v24;
    double v27 = v26;
    v28 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
    objc_msgSend(v28, "setFromValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v25, v27));
    objc_msgSend(v28, "setToValue:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v7 + v11 * 0.5, v9 + v13 * 0.5));
    [v28 setDuration:0.433];
    objc_msgSend(a3, "setPosition:", v7 + v11 * 0.5, v9 + v13 * 0.5);
    [a3 addAnimation:v28 forKey:@"animatePosition"];
  }
  objc_msgSend(a3, "setBounds:", v7, v9, v11, v13);
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke(uint64_t a1)
{
  double WindowOpacity = FigSubtitleRendererGetWindowOpacity(*(void *)(*(void *)(*(void *)(a1 + 32) + 48) + 16));
  unsigned __int8 v3 = *(void **)(a1 + 32);

  return [v3 updateWindowOpacity:WindowOpacity];
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 48) + 64) = 1;
  return result;
}

uint64_t __54__FigSubtitleWebVTTCueCALayer_layoutSublayersOfLayer___block_invoke_3(uint64_t a1)
{
  double WindowRoundedCornerRadius = FigSubtitleRendererGetWindowRoundedCornerRadius(*(void *)(*(void *)(*(void *)(a1 + 40) + 48)
                                                                                        + 16));
  unsigned __int8 v3 = *(void **)(a1 + 32);

  return [v3 setCornerRadius:WindowRoundedCornerRadius];
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  var1 = self->layerInternal->var1;
  if (var1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke;
    block[3] = &unk_1E5795620;
    block[4] = self;
    void block[5] = &v24;
    block[6] = &v28;
    dispatch_sync(var1, block);
    if (*((unsigned char *)v25 + 24))
    {
      double v8 = (const void *)v29[3];
      if (v8)
      {
        SubtitleSampleFromAttributedString = FigSubtitleRendererCreateSubtitleSampleFromAttributedString(v8);
        if (!SubtitleSampleFromAttributedString) {
          goto LABEL_15;
        }
        CGContextSaveGState(a4);
        double v10 = (CGFloat *)MEMORY[0x1E4F1DAB8];
        long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
        if ([a3 contentsAreFlipped])
        {
          [a3 frame];
          CGFloat v12 = v11;
          long long v22 = 0uLL;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.a = 1.0;
          *(_OWORD *)&transform.d = xmmword_1949965D0;
          transform.ty = v11;
          CGContextConcatCTM(a4, &transform);
          CGFloat v13 = 0.0;
          CGFloat v14 = -1.0;
          CGFloat v15 = 1.0;
        }
        else
        {
          CGFloat v15 = *v10;
          CGFloat v14 = v10[3];
          CGFloat v13 = v10[4];
          CGFloat v12 = v10[5];
        }
        var2 = self->layerInternal->var2;
        *(void *)&transform.a = a4;
        transform.b = v15;
        *(_OWORD *)&transform.c = v22;
        transform.tx = v14;
        transform.ty = v13;
        CGFloat v21 = v12;
        FigSubtitleRendererDrawSubtitleText((uint64_t)var2, (uint64_t)SubtitleSampleFromAttributedString, (uint64_t)&transform);
        CFRelease(SubtitleSampleFromAttributedString);
        CGContextRestoreGState(a4);
        CGFloat v17 = (const void *)v29[3];
        if (v17) {
          CFRelease(v17);
        }
      }
      else
      {
        [a3 bounds];
        CGContextClearRect(a4, v32);
      }
      double v18 = self->layerInternal->var1;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke_2;
      v19[3] = &unk_1E5794738;
      v19[4] = self;
      dispatch_sync(v18, v19);
      [a3 superlayer];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_14:
        objc_msgSend((id)objc_msgSend(a3, "superlayer"), "setReLayout");
        goto LABEL_15;
      }
      [a3 superlayer];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a3 = (id)[a3 superlayer];
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

CFTypeRef __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 48) + 64);
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1[4] + 48) + 56);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __51__FigSubtitleWebVTTCueCALayer_drawLayer_inContext___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 48) + 64) = 0;
  return result;
}

@end