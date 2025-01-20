@interface FigCaptionLayer
- (FigCaptionLayer)init;
- (void)dealloc;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)processCaptionCommand:(unsigned int)a3 data:(id)a4;
- (void)resetCaptions;
- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3;
- (void)setFontName:(const char *)a3;
- (void)setOptions:(id)a3 forKeyPath:(id)a4;
- (void)setSeparatedValue:(BOOL)a3;
- (void)setVideoRelativeToViewport:(CGRect)a3;
- (void)updateDisplay:(OpaqueFigCFCaptionRenderer *)a3;
@end

@implementation FigCaptionLayer

- (FigCaptionLayer)init
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v16.receiver = self;
  v16.super_class = (Class)FigCaptionLayer;
  v3 = [(FigBaseCALayer *)&v16 init];
  if (v3)
  {
    if (getDisplayScale_onceToken != -1) {
      dispatch_once(&getDisplayScale_onceToken, &__block_literal_global_2);
    }
    double v4 = *(double *)&sMaxDisplayScale;
    v3->_priv = objc_alloc_init(FigCaptionLayerPrivate);
    v3->_priv->renderMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!v3->_priv->renderMutex) {
      goto LABEL_16;
    }
    v3->_priv->layoutSublayersMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    if (!v3->_priv->layoutSublayersMutex) {
      goto LABEL_16;
    }
    v3->_priv->renderer = (OpaqueFigCFCaptionRenderer *)FigCFCaptionRendererCreate();
    v3->_priv->captionElementLayers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    v3->_priv->options = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_priv->separated = 0;
    v3->_priv->separatedUpdated = 0;
    v3->_priv->enableBackdrop = +[FigCaptionBackdropLayer isSupported];
    priv = v3->_priv;
    if (priv->enableBackdrop)
    {
      v3->_priv->captionBackdropLayers = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
      priv = v3->_priv;
      if (!priv) {
        goto LABEL_16;
      }
    }
    if (!priv->renderer || !priv->captionElementLayers) {
      goto LABEL_16;
    }
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    priv->videoRelativeToViewport.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    priv->videoRelativeToViewport.size = v6;
    v7 = v3->_priv;
    v8 = (FigGeometryDimension *)MEMORY[0x1E4F216C0];
    FigGeometryDimension v9 = *(FigGeometryDimension *)(MEMORY[0x1E4F216C0] + 16);
    v7->captionsAvoidanceMargins.left = (FigGeometryDimension)*MEMORY[0x1E4F216C0];
    v7->captionsAvoidanceMargins.right = v9;
    FigGeometryDimension v10 = v8[3];
    v7->captionsAvoidanceMargins.top = v8[2];
    v7->captionsAvoidanceMargins.bottom = v10;
    v3->_priv->enableGMSpew = 1;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    int v11 = 10;
    do
    {
      v12 = objc_alloc_init(FigCaptionRowLayer);
      [(FigCaptionRowLayer *)v12 setContentsScale:v4];
      [(FigCaptionRowLayer *)v12 setDelegate:v3];
      [(FigCaptionRowLayer *)v12 setNeedsDisplayOnBoundsChange:1];
      [(FigCaptionRowLayer *)v12 setClearsContext:1];
      [(FigCaptionRowLayer *)v12 setContents:0];
      [(FigBaseCALayer *)v3 addSublayer:v12];
      [(NSMutableArray *)v3->_priv->captionElementLayers addObject:v12];
      --v11;
    }
    while (v11);
    if (v3->_priv->enableBackdrop)
    {
      for (uint64_t i = 0; i != 10; ++i)
      {
        v14 = objc_alloc_init(FigCaptionBackdropLayer);
        [(FigCaptionBackdropLayer *)v14 setHidden:1];
        [(FigCaptionBackdropLayer *)v14 insertBackdropAsSublayerToLayer:v3 below:[(NSMutableArray *)v3->_priv->captionElementLayers objectAtIndex:i]];
        [(NSMutableArray *)v3->_priv->captionBackdropLayers addObject:v14];
      }
    }
    [(FigCaptionLayer *)v3 setClearsContext:1];
    [(FigCaptionLayer *)v3 setNeedsLayout];
    [MEMORY[0x1E4F39CF8] commit];
    CMNotificationCenterGetDefaultLocalCenter();
    if (FigNotificationCenterAddWeakListener())
    {
LABEL_16:

      return 0;
    }
  }
  return v3;
}

- (void)setFontName:(const char *)a3
{
  uint64_t v4 = [NSString stringWithCString:a3 encoding:4];
  if (v4)
  {
    CFStringRef v5 = (const __CFString *)v4;
    renderer = self->_priv->renderer;
    FigCFCaptionRendererSetFontName((uint64_t)renderer, v5);
  }
}

- (void)setVideoRelativeToViewport:(CGRect)a3
{
  self->_priv->videoRelativeToViewport = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(FigCaptionLayer *)self setNeedsLayout];
  uint64_t v4 = (void *)MEMORY[0x1E4F39CF8];

  [v4 commit];
}

- (void)setCaptionsAvoidanceMargins:(FigGeometryMargins *)a3
{
  priv = self->_priv;
  FigGeometryDimension bottom = a3->bottom;
  FigGeometryDimension left = a3->left;
  FigGeometryDimension right = a3->right;
  priv->captionsAvoidanceMargins.top = a3->top;
  priv->captionsAvoidanceMargins.FigGeometryDimension bottom = bottom;
  priv->captionsAvoidanceMargins.FigGeometryDimension left = left;
  priv->captionsAvoidanceMargins.FigGeometryDimension right = right;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(FigCaptionLayer *)self setNeedsLayout];
  v8 = (void *)MEMORY[0x1E4F39CF8];

  [v8 commit];
}

- (void)setOptions:(id)a3 forKeyPath:(id)a4
{
  if ([a4 isEqualToString:@"separatedOptions"])
  {
    id v7 = (id)[MEMORY[0x1E4F1CA98] null];
    options = self->_priv->options;
    if (v7 == a3)
    {
      [(NSMutableDictionary *)options removeObjectForKey:a4];
    }
    else
    {
      [(NSMutableDictionary *)options setValue:a3 forKey:a4];
    }
  }
  else if ([a4 isEqualToString:@"styleOptions"])
  {
    id v9 = (id)[MEMORY[0x1E4F1CA98] null];
    renderer = self->_priv->renderer;
    if (v9 == a3) {
      CFDictionaryRef v11 = 0;
    }
    else {
      CFDictionaryRef v11 = (const __CFDictionary *)a3;
    }
    FigCFCaptionRendererSetStyleOptions((uint64_t)renderer, v11);
  }
}

- (void)setSeparatedValue:(BOOL)a3
{
  self->_priv->separated = a3;
  self->_priv->separatedUpdated = 1;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (priv->renderer)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
      priv = self->_priv;
      renderer = priv->renderer;
      if (renderer)
      {
        CFRelease(renderer);
        self->_priv->renderer = 0;
        priv = self->_priv;
      }
    }

    CFStringRef v5 = self->_priv;
    if (v5->renderMutex)
    {
      FigSimpleMutexDestroy();
      CFStringRef v5 = self->_priv;
    }
    if (v5->layoutSublayersMutex)
    {
      FigSimpleMutexDestroy();
      CFStringRef v5 = self->_priv;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FigCaptionLayer;
  [(FigCaptionLayer *)&v6 dealloc];
}

- (void)resetCaptions
{
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  FigCFCaptionRendererResetCaptions();
  uint64_t v3 = [(NSMutableArray *)self->_priv->captionElementLayers count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_priv->captionElementLayers, "objectAtIndex:", i), "setContents:", 0);
      priv = self->_priv;
      if (priv->enableBackdrop) {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](priv->captionBackdropLayers, "objectAtIndex:", i), "setHidden:", 1);
      }
    }
  }
  id v7 = (void *)MEMORY[0x1E4F39CF8];

  [v7 commit];
}

- (void)processCaptionCommand:(unsigned int)a3 data:(id)a4
{
}

- (void)layoutSublayers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  MEMORY[0x19970E290](self->_priv->layoutSublayersMutex, a2);
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  [(FigCaptionLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(NSMutableArray *)self->_priv->captionElementLayers count];
  int v12 = [(FigCaptionLayer *)self contentsAreFlipped];
  int v37 = 0;
  char v36 = 0;
  if (v8 != 0.0 && v10 != 0.0)
  {
    int v13 = v12;
    priv = self->_priv;
    uint64_t renderer = (uint64_t)priv->renderer;
    double x = priv->videoRelativeToViewport.origin.x;
    double y = priv->videoRelativeToViewport.origin.y;
    FigGeometryDimension right = priv->captionsAvoidanceMargins.right;
    v35[0] = priv->captionsAvoidanceMargins.left;
    v35[1] = right;
    FigGeometryDimension bottom = priv->captionsAvoidanceMargins.bottom;
    v35[2] = priv->captionsAvoidanceMargins.top;
    v35[3] = bottom;
    FigCFCaptionRendererGetCaptionElementWindowProperties(v4, v6, v8, v10, x, y, renderer, (double *)v35, v13, 10, &v37, v40, v39, v38, &v36);
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  if (v11)
  {
    unint64_t v20 = 0;
    double v21 = *MEMORY[0x1E4F1DB28];
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v25 = v40;
    do
    {
      v26 = (void *)[(NSMutableArray *)self->_priv->captionElementLayers objectAtIndex:v20];
      v27 = v26;
      if (v20 > 9 || v20 >= v37)
      {
        objc_msgSend(v26, "setBounds:", v21, v22, v23, v24);
        [v27 setContents:0];
      }
      else
      {
        objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v27, "setPosition:", v25->origin.x, v25->origin.y);
        objc_msgSend(v27, "setBounds:", v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
      }
      v28 = self->_priv;
      if (v28->enableBackdrop) {
        BOOL v29 = v36 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      if (!v29)
      {
        v30 = (void *)[(NSMutableArray *)v28->captionBackdropLayers objectAtIndex:v20];
        if (v30)
        {
          v31 = v30;
          if (v20 > 9 || v20 >= v37)
          {
            [v30 setHidden:1];
          }
          else
          {
            objc_msgSend(v30, "setAnchorPoint:", 0.0, 0.0);
            objc_msgSend(v31, "setPosition:", v25->origin.x, v25->origin.y);
            objc_msgSend(v31, "setBounds:", v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
            [v31 setHidden:!v39[v20]];
            if (v39[v20])
            {
              if (v38[v20] == 0.0)
              {
                [v31 setCornerRadius:0.0];
                v32 = v31;
                uint64_t v33 = 0;
              }
              else
              {
                objc_msgSend(v31, "setCornerRadius:");
                v32 = v31;
                uint64_t v33 = 1;
              }
              [v32 setMasksToBounds:v33];
            }
          }
        }
      }
      ++v20;
      ++v25;
    }
    while (v11 != v20);
  }
  v34.receiver = self;
  v34.super_class = (Class)FigCaptionLayer;
  [(FigCaptionLayer *)&v34 layoutSublayers];
  [MEMORY[0x1E4F39CF8] commit];
  MEMORY[0x19970E2B0](self->_priv->layoutSublayersMutex);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v22 = 0;
  MEMORY[0x19970E910](self->_priv->renderMutex, a2);
  [MEMORY[0x1E4F39CF8] begin];
  if (!pthread_main_np()) {
    [MEMORY[0x1E4F39CF8] activateBackground:1];
  }
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  unsigned int v7 = [(NSMutableArray *)self->_priv->captionElementLayers indexOfObject:a3];
  priv = self->_priv;
  if (priv->enableGMSpew)
  {
    priv->enableGMSpew = 0;
    if (dword_1E9350A70)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9350A70)
      {
        double v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  uint64_t renderer = self->_priv->renderer;
  objc_msgSend(a3, "bounds", v20, v21);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [a3 position];
  FigCFCaptionRendererDrawCaptionElementInContextForRectOrientation(v13, v15, v17, v19, (uint64_t)renderer, v7, a4, [a3 contentsAreFlipped], &v22);
  [MEMORY[0x1E4F39CF8] commit];
  MEMORY[0x19970E930](self->_priv->renderMutex);
}

- (void)updateDisplay:(OpaqueFigCFCaptionRenderer *)a3
{
  priv = self->_priv;
  if (priv->renderer == a3)
  {
    MEMORY[0x19970E290](priv->layoutSublayersMutex, a2);
    [MEMORY[0x1E4F39CF8] begin];
    if (!pthread_main_np()) {
      [MEMORY[0x1E4F39CF8] activateBackground:1];
    }
    [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
    [(FigCaptionLayer *)self setNeedsLayout];
    if ([(NSMutableArray *)self->_priv->captionElementLayers count])
    {
      unint64_t v5 = 0;
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_priv->captionElementLayers, "objectAtIndex:", v5++), "setNeedsDisplay");
      while (v5 < [(NSMutableArray *)self->_priv->captionElementLayers count]);
    }
    [MEMORY[0x1E4F39CF8] commit];
    JUMPOUT(0x19970E2B0);
  }
}

@end