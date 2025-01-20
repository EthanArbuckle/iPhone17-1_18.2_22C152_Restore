@interface FigSubtitleBackdropCALayer
- (BOOL)shouldEnableBackdropLayer;
- (FigSubtitleBackdropCALayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5;
- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setContents:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsLayout;
- (void)updateBackdropLayer;
- (void)updateHDRContentState:(BOOL)a3;
- (void)updateWindowOpacity:(double)a3;
@end

@implementation FigSubtitleBackdropCALayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);
}

- (FigSubtitleBackdropCALayer)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleBackdropCALayer;
  v2 = [(FigBaseCALayer *)&v6 init];
  if (v2)
  {
    v3 = (OpaqueFigSubtitleBackdropCALayerInternal *)malloc_type_calloc(1uLL, 0x38uLL, 0x108004000F36631uLL);
    v2->bdLayerInternal = v3;
    v3->var0 = v2;
    *(_WORD *)&v3->var2 = 0;
    v3->var4 = 0.0;
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.coremedia.FigSubtitleBackdropCALayer.messagequeue<%p>", v2);
    dispatch_queue_t v4 = dispatch_queue_create(label, 0);
    v2->bdLayerInternal->var1 = v4;
    if (!v4)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  bdLayerInternal = self->bdLayerInternal;
  if (bdLayerInternal)
  {

    dispatch_queue_t v4 = (dispatch_object_t *)self->bdLayerInternal;
    if (v4[1])
    {
      dispatch_release(v4[1]);
      dispatch_queue_t v4 = (dispatch_object_t *)self->bdLayerInternal;
      v4[1] = 0;
    }
    free(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleBackdropCALayer;
  [(FigSubtitleBackdropCALayer *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FigSubtitleBackdropCALayer_setDelegate___block_invoke;
  block[3] = &unk_1E57955D0;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(var1, block);
  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleBackdropCALayer;
  [(FigSubtitleBackdropCALayer *)&v6 setDelegate:a3];
}

uint64_t __42__FigSubtitleBackdropCALayer_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 40) + 48) = *(void *)(result + 40);
  return result;
}

- (void)setCornerRadius:(double)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  uint64_t v19 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  uint64_t v13 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FigSubtitleBackdropCALayer_setCornerRadius___block_invoke;
  block[3] = &unk_1E57955F8;
  block[4] = self;
  block[5] = &v20;
  void block[6] = &v14;
  block[7] = &v8;
  dispatch_sync(var1, block);
  if (*((unsigned char *)v21 + 24))
  {
    [(id)v15[5] setCornerRadius:a3];
    [(id)v9[5] setCornerRadius:a3];
  }

  v6.receiver = self;
  v6.super_class = (Class)FigSubtitleBackdropCALayer;
  [(FigSubtitleBackdropCALayer *)&v6 setCornerRadius:a3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

id __46__FigSubtitleBackdropCALayer_setCornerRadius___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 40) + 16);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(*(void *)(a1[4] + 40) + 40);
  id result = *(id *)(*(void *)(a1[4] + 40) + 32);
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  char v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  uint64_t v18 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FigSubtitleBackdropCALayer_setBounds___block_invoke;
  block[3] = &unk_1E57955F8;
  block[4] = self;
  block[5] = &v25;
  void block[6] = &v19;
  block[7] = &v13;
  dispatch_sync(var1, block);
  if (*((unsigned char *)v26 + 24))
  {
    [MEMORY[0x1E4F39CF8] begin];
    if (!pthread_main_np()) {
      [MEMORY[0x1E4F39CF8] activateBackground:1];
    }
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v9 = (void *)v20[5];
    if (v9)
    {
      objc_msgSend(v9, "setBounds:", x, y, width, height);
      objc_msgSend((id)v20[5], "setPosition:", x + width * 0.5, y + height * 0.5);
    }
    uint64_t v10 = (void *)v14[5];
    if (v10)
    {
      [v10 setHidden:0];
      objc_msgSend((id)v14[5], "setBounds:", x, y, width, height);
      objc_msgSend((id)v14[5], "setPosition:", x + width * 0.5, y + height * 0.5);
    }
    [MEMORY[0x1E4F39CF8] commit];
  }

  v11.receiver = self;
  v11.super_class = (Class)FigSubtitleBackdropCALayer;
  -[FigSubtitleBackdropCALayer setBounds:](&v11, sel_setBounds_, x, y, width, height);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
}

id __40__FigSubtitleBackdropCALayer_setBounds___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 40) + 16);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(*(void *)(a1[4] + 40) + 40);
  id result = *(id *)(*(void *)(a1[4] + 40) + 32);
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

- (void)setContents:(id)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  objc_super v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  uint64_t v13 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FigSubtitleBackdropCALayer_setContents___block_invoke;
  block[3] = &unk_1E5795620;
  block[4] = self;
  block[5] = &v14;
  void block[6] = &v8;
  dispatch_sync(var1, block);
  if (*((unsigned char *)v15 + 24))
  {
    [(id)v9[5] setContents:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)FigSubtitleBackdropCALayer;
    [(FigSubtitleBackdropCALayer *)&v6 setContents:a3];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

void *__42__FigSubtitleBackdropCALayer_setContents___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 40) + 16);
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    v1 = result;
    id result = *(id *)(*(void *)(result[4] + 40) + 40);
    *(void *)(*(void *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (void)setNeedsDisplay
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FigSubtitleBackdropCALayer_setNeedsDisplay__block_invoke;
  block[3] = &unk_1E5795620;
  block[4] = self;
  block[5] = &v12;
  void block[6] = &v6;
  dispatch_sync(var1, block);
  if (*((unsigned char *)v13 + 24))
  {
    [(id)v7[5] setNeedsDisplay];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)FigSubtitleBackdropCALayer;
    [(FigBaseCALayer *)&v4 setNeedsDisplay];
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
}

void *__45__FigSubtitleBackdropCALayer_setNeedsDisplay__block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 40) + 16);
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    v1 = result;
    id result = *(id *)(*(void *)(result[4] + 40) + 40);
    *(void *)(*(void *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (void)setNeedsLayout
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  char v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  uint64_t v17 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  uint64_t v11 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FigSubtitleBackdropCALayer_setNeedsLayout__block_invoke;
  block[3] = &unk_1E57955F8;
  block[4] = self;
  block[5] = &v18;
  void block[6] = &v12;
  void block[7] = &v6;
  dispatch_sync(var1, block);
  if (*((unsigned char *)v19 + 24))
  {
    [(id)v13[5] setNeedsLayout];
    [(id)v7[5] setNeedsLayout];
  }

  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleBackdropCALayer;
  [(FigSubtitleBackdropCALayer *)&v4 setNeedsLayout];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

id __44__FigSubtitleBackdropCALayer_setNeedsLayout__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 40) + 16);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(*(void *)(a1[4] + 40) + 40);
  id result = *(id *)(*(void *)(a1[4] + 40) + 32);
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

- (BOOL)shouldEnableBackdropLayer
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  var1 = self->bdLayerInternal->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FigSubtitleBackdropCALayer_shouldEnableBackdropLayer__block_invoke;
  block[3] = &unk_1E5795620;
  block[4] = self;
  block[5] = &v10;
  void block[6] = &v6;
  dispatch_sync(var1, block);
  BOOL v3 = 0;
  if (v11[3] > 0.0) {
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

double __55__FigSubtitleBackdropCALayer_shouldEnableBackdropLayer__block_invoke(void *a1)
{
  double result = *(double *)(*(void *)(a1[4] + 40) + 24);
  *(double *)(*(void *)(a1[5] + 8) + 24) = result;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 40) + 17);
  return result;
}

- (void)updateBackdropLayer
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  char v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  uint64_t v21 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = __Block_byref_object_copy__2;
  v15[4] = __Block_byref_object_dispose__2;
  v15[5] = 0;
  BOOL v3 = [(FigSubtitleBackdropCALayer *)self shouldEnableBackdropLayer];
  var1 = self->bdLayerInternal->var1;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke;
    block[3] = &unk_1E5795620;
    block[4] = self;
    block[5] = &v28;
    void block[6] = v15;
    dispatch_sync(var1, block);
    if (!*((unsigned char *)v29 + 24)
      && +[FigCaptionBackdropLayer isSupported])
    {
      [MEMORY[0x1E4F39CF8] begin];
      if (!pthread_main_np()) {
        [MEMORY[0x1E4F39CF8] activateBackground:1];
      }
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_super v5 = objc_alloc_init(FigSubtitleBackdropCALayerContentLayer);
      v23[5] = (uint64_t)v5;
      uint64_t v6 = objc_alloc_init(FigCaptionBackdropLayer);
      v17[5] = (uint64_t)v6;
      [MEMORY[0x1E4F39CF8] commit];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_2;
      v13[3] = &unk_1E5795648;
      v13[4] = self;
      v13[5] = &v22;
      v13[6] = v15;
      v13[7] = &v16;
      dispatch_async(MEMORY[0x1E4F14428], v13);
      v7 = self->bdLayerInternal->var1;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_3;
      v12[3] = &unk_1E5795670;
      v12[4] = self;
      v12[5] = &v22;
      v12[6] = &v16;
      dispatch_sync(v7, v12);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_4;
    v11[3] = &unk_1E5795698;
    v11[4] = self;
    v11[5] = &v28;
    dispatch_sync(var1, v11);
    if (*((unsigned char *)v29 + 24))
    {
      uint64_t v8 = self->bdLayerInternal->var1;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_5;
      v10[3] = &unk_1E5795670;
      v10[4] = self;
      v10[5] = &v22;
      v10[6] = &v16;
      dispatch_sync(v8, v10);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_6;
      v9[3] = &unk_1E57956C0;
      v9[4] = &v16;
      v9[5] = &v22;
      dispatch_async(MEMORY[0x1E4F14428], v9);
    }
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

void *__49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 40) + 16);
  *(void *)(*(void *)(result[6] + 8) + 40) = *(void *)(*(void *)(result[4] + 40) + 48);
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) setContents:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDelegate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) addSublayer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) insertSublayer:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) below:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

void *__49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_3(void *result)
{
  *(void *)(*(void *)(result[4] + 40) + 40) = *(void *)(*(void *)(result[5] + 8) + 40);
  *(void *)(*(void *)(result[4] + 40) + 32) = *(void *)(*(void *)(result[6] + 8) + 40);
  *(unsigned char *)(*(void *)(result[4] + 40) + 16) = 1;
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 40)
                                                                            + 16);
  return result;
}

id __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_5(void *a1)
{
  *(unsigned char *)(*(void *)(a1[4] + 40) + 16) = 0;
  *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(*(void *)(a1[4] + 40) + 40);
  *(void *)(*(void *)(a1[4] + 40) + 40) = 0;
  id result = *(id *)(*(void *)(a1[4] + 40) + 32);
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  *(void *)(*(void *)(a1[4] + 40) + 32) = 0;
  return result;
}

uint64_t __49__FigSubtitleBackdropCALayer_updateBackdropLayer__block_invoke_6(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setContents:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeFromSuperlayer];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setContents:0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeFromSuperlayer];

  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)updateWindowOpacity:(double)a3
{
  var1 = self->bdLayerInternal->var1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__FigSubtitleBackdropCALayer_updateWindowOpacity___block_invoke;
  v5[3] = &unk_1E57956E8;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_sync(var1, v5);
  [(FigSubtitleBackdropCALayer *)self updateBackdropLayer];
}

double __50__FigSubtitleBackdropCALayer_updateWindowOpacity___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 24) = result;
  return result;
}

- (void)updateHDRContentState:(BOOL)a3
{
  var1 = self->bdLayerInternal->var1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__FigSubtitleBackdropCALayer_updateHDRContentState___block_invoke;
  v5[3] = &unk_1E5795710;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(var1, v5);
  [(FigSubtitleBackdropCALayer *)self updateBackdropLayer];
}

uint64_t __52__FigSubtitleBackdropCALayer_updateHDRContentState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 40) + 17) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  id v8 = _animationByTransformingValues(a4, (uint64_t)&__block_literal_global_20);
  if ([a4 isAdditive]) {
    char v9 = @"bounds.size";
  }
  else {
    char v9 = @"bounds";
  }
  [v8 setKeyPath:v9];
  [v8 setDelegate:0];

  [a3 addAnimation:v8 forKey:a5];
}

uint64_t __79__FigSubtitleBackdropCALayer__addBoundsAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  if ([a4 isAdditive]) {
    id v8 = &__block_literal_global_31;
  }
  else {
    id v8 = &__block_literal_global_34;
  }
  id v9 = _animationByTransformingValues(a4, (uint64_t)v8);
  [v9 setKeyPath:@"position"];
  [v9 setDelegate:0];

  [a3 addAnimation:v9 forKey:a5];
}

uint64_t __81__FigSubtitleBackdropCALayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  [a2 sizeValue];
  v2 = (void *)MEMORY[0x1E4F29238];
  double v4 = v3 * 0.5;
  double v6 = v5 * 0.5;

  return objc_msgSend(v2, "valueWithPoint:", v4, v6);
}

uint64_t __81__FigSubtitleBackdropCALayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 rectValue];
  v2 = (void *)MEMORY[0x1E4F29238];
  double v5 = v3 + v4 * 0.5;
  double v8 = v6 + v7 * 0.5;

  return objc_msgSend(v2, "valueWithPoint:", v5, v8);
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (self->bdLayerInternal->var2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_msgSend(@"bounds.size", "isEqualToString:", objc_msgSend(a3, "keyPath")) & 1) != 0
       || objc_msgSend(@"bounds", "isEqualToString:", objc_msgSend(a3, "keyPath"))))
    {
      [(FigSubtitleBackdropCALayer *)self _addBoundsAnimationToLayer:self->bdLayerInternal->var6 usingAnimation:a3 forKey:a4];
      [(FigSubtitleBackdropCALayer *)self _addBoundsAnimationToLayer:self->bdLayerInternal->var5 usingAnimation:a3 forKey:a4];
      [(FigSubtitleBackdropCALayer *)self _addPositionAnimationToLayer:self->bdLayerInternal->var6 usingAnimation:a3 forKey:a4];
      [(FigSubtitleBackdropCALayer *)self _addPositionAnimationToLayer:self->bdLayerInternal->var5 usingAnimation:a3 forKey:a4];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)FigSubtitleBackdropCALayer;
  [(FigSubtitleBackdropCALayer *)&v7 addAnimation:a3 forKey:a4];
}

@end