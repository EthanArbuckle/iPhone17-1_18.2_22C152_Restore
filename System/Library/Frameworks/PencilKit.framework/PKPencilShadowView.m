@interface PKPencilShadowView
+ (id)shadowViewForScene:(id)a3;
+ (void)createShadowViewForSceneIfNecessary:(id)a3;
+ (void)hideShadowViewForSceneIfNecessary:(id)a3;
- (CGPoint)location;
- (PKInk)ink;
- (PKPencilShadowView)initWithFrame:(CGRect)a3;
- (double)altitude;
- (double)azimuth;
- (double)rollAngle;
- (double)shadowAlphaMultiplier;
- (double)zPosition;
- (uint64_t)_shadowShouldBeVisibleForCurrentTiledView;
- (uint64_t)_updateFrame;
- (uint64_t)_updateFrameIfNecessary;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)hideShadow;
- (void)keepAlwaysVisible;
- (void)keepVisibleInTiledView:(id)a3;
- (void)layoutSubviews;
- (void)pauseUpdateCycle;
- (void)setAltitude:(double)a3;
- (void)setAzimuth:(double)a3;
- (void)setInk:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setRollAngle:(double)a3;
- (void)setShadowAlphaMultiplier:(double)a3;
- (void)setZPosition:(double)a3;
- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4;
- (void)strokeBegan;
- (void)updateInk:(id)a3 animated:(BOOL)a4;
- (void)updateOpacity:(double)a3 animated:(BOOL)a4;
@end

@implementation PKPencilShadowView

- (PKPencilShadowView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)PKPencilShadowView;
  id v3 = -[PKPencilShadowView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v5 = [v4 maximumFramesPerSecond];

    *((double *)v3 + 59) = 1.0 / (double)v5;
    *((void *)v3 + 78) = 0x3FF0000000000000;
    +[PKMetalUtility layerContentsScale];
    *((void *)v3 + 56) = v6;
    +[PKMetalPencilShadowRenderer pixelSize];
    double v7 = *((double *)v3 + 56);
    *((double *)v3 + 57) = v8 / v7;
    *((double *)v3 + 58) = v9 / v7;
    v10 = +[PKHoverSettings sharedSettings];
    [v10 toolShadowMaxOpacityInDrawingCanvas];
    *((void *)v3 + 60) = v11;

    id v12 = objc_alloc_init(MEMORY[0x1E4F39C20]);
    objc_storeStrong((id *)v3 + 51, v12);
    [*((id *)v3 + 51) setPixelFormat:80];
    v13 = [v3 layer];
    [v13 addSublayer:v12];

    v14 = +[PKMetalUtility defaultDevice];
    [v12 setDevice:v14];

    [v12 setOpaque:0];
    [v12 setFramebufferOnly:1];
    +[PKMetalPencilShadowRenderer pixelSize];
    objc_msgSend(v12, "setDrawableSize:");
    [v12 setContentsScale:*((double *)v3 + 56)];
    [v12 setPresentsWithTransaction:1];
    [v12 setAllowsHitTesting:0];
    [v12 setLowLatency:0];
    if (objc_opt_respondsToSelector()) {
      [v12 setLowWorkload:1];
    }
    v15 = (void *)*((void *)v3 + 51);
    *((void *)v3 + 51) = v12;
    id v16 = v12;

    [v3 setNeedsLayout];
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.pencilkit.shadowRenderer", v18);
    v20 = (void *)*((void *)v3 + 55);
    *((void *)v3 + 55) = v19;

    v21 = [*((id *)v3 + 51) device];
    v22 = +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v21);

    v23 = [PKMetalPencilShadowRenderer alloc];
    v24 = [*((id *)v3 + 51) device];
    v25 = -[PKMetalResourceHandler shaderLibrary]((uint64_t)v22);
    uint64_t v26 = [(PKMetalPencilShadowRenderer *)v23 initWithDevice:v24 library:v25];
    v27 = (void *)*((void *)v3 + 54);
    *((void *)v3 + 54) = v26;

    *((unsigned char *)v3 + 545) = 1;
    [v3 setUserInteractionEnabled:0];
    v28 = [v3 layer];
    [v28 setAllowsHitTesting:0];

    objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.0);
    v29 = *((void *)v3 + 55);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PKPencilShadowView_initWithFrame___block_invoke;
    block[3] = &unk_1E64C61C0;
    id v30 = v3;
    id v34 = v30;
    dispatch_async(v29, block);
    v31 = +[PKRendererVSyncController sharedController]();
    -[PKRendererVSyncController addRendererController:]((uint64_t)v31, v30);
  }
  return (PKPencilShadowView *)v3;
}

uint64_t __36__PKPencilShadowView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) updateInk:0];
}

- (void)dealloc
{
  id v3 = +[PKRendererVSyncController sharedController]();
  -[PKRendererVSyncController removeRendererController:]((uint64_t)v3, self);

  [(NSTimer *)self->_idleTimer invalidate];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKPencilShadowView;
  [(PKPencilShadowView *)&v5 dealloc];
}

+ (void)createShadowViewForSceneIfNecessary:(id)a3
{
  id v4 = a3;
  if (_UIUpdateCycleEnabled())
  {
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v4);
    id v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    -[PKPencilObserverInteraction createShadowViewIfNecessary](v3);
  }
}

+ (void)hideShadowViewForSceneIfNecessary:(id)a3
{
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *((unsigned char *)v4 + 32) = 0;
    [*((id *)v4 + 6) removeFromSuperview];
    id v3 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = 0;
  }
}

+ (id)shadowViewForScene:(id)a3
{
  id v3 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, a3);
  id v4 = v3;
  if (v3) {
    id v3 = (void *)v3[6];
  }
  objc_super v5 = v3;

  return v5;
}

- (void)strokeBegan
{
  self->_presentationCount = 0;
}

void __38__PKPencilShadowView_startUpdateCycle__block_invoke(uint64_t a1)
{
  _UIMediaTimeForMachTime();
  double v3 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = (uint64_t)WeakRetained;
    [WeakRetained bounds];
    BOOL IsEmpty = CGRectIsEmpty(v11);
    objc_super v5 = (void *)v9;
    if (!IsEmpty)
    {
      double v7 = v3 + *(double *)(v9 + 472) * 2.0 + -0.001;
      CFTimeInterval v8 = CACurrentMediaTime();
      objc_super v5 = (void *)v9;
      if (v8 < v7) {
        atomic_store(*(unint64_t *)&v7, (unint64_t *)(v9 + 576));
      }
      if (!*(unsigned char *)(v9 + 546))
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
        -[PKPencilShadowView _updateFrame](v9);
        [MEMORY[0x1E4F39CF8] commit];
        objc_super v5 = (void *)v9;
      }
    }
  }
}

void __38__PKPencilShadowView_startUpdateCycle__block_invoke_2(uint64_t a1)
{
  _UIMediaTimeForMachTime();
  double v3 = v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v43 = (uint64_t)WeakRetained;
    [WeakRetained bounds];
    BOOL IsEmpty = CGRectIsEmpty(v66);
    objc_super v5 = (void *)v43;
    if (!IsEmpty)
    {
      char ShouldBeVisibleForCurrentTiled = -[PKPencilShadowView _shadowShouldBeVisibleForCurrentTiledView](v43);
      uint64_t v8 = v43;
      if ((ShouldBeVisibleForCurrentTiled & 1) != 0 || *(double *)(v43 + 416) == 0.0)
      {
        uint64_t v9 = *(void *)(v43 + 552);
        *(void *)(v43 + 552) = v9 + 1;
        BOOL v11 = ((v9 + 1) & 1) == 0 && v9 < 15;
        *(unsigned char *)(v43 + 546) = v11;
        if (!*(unsigned char *)(v43 + 546))
        {
          double v12 = COERCE_DOUBLE(atomic_load((unint64_t *)(v43 + 576)));
          if (v3 < v12)
          {
            int v13 = -5;
            while (!__CFADD__(v13++, 1))
            {
              usleep(0xFAu);
              uint64_t v8 = v43;
              double v15 = COERCE_DOUBLE(atomic_load((unint64_t *)(v43 + 576)));
              if (v3 >= v15) {
                goto LABEL_19;
              }
            }
            *(unsigned char *)(v8 + 546) = 1;
            _UIMachTimeForMediaTime();
            kdebug_trace();
            uint64_t v8 = v43;
          }
        }
LABEL_19:
        double v16 = *(double *)(v8 + 424);
        double v17 = *(double *)(v8 + 416);
        double v18 = 10.0;
        if (v17 > v16) {
          double v18 = 30.0;
        }
        double v19 = (v17 + v16 * (v18 + -1.0)) / v18;
        *(double *)(v8 + 424) = v19;
        double v20 = *(double *)(v8 + 624) * (*(double *)(v8 + 480) * v19);
        double v21 = 0.0;
        if (v20 >= 0.00390625)
        {
          double v21 = v20;
          if (v20 > 0.99609375) {
            double v21 = 1.0;
          }
        }
        double v22 = CACurrentMediaTime();
        v23 = (void *)v43;
        if (*(void *)(v43 + 616)
          && *(double *)(v43 + 416) == 1.0
          && *(double *)(v43 + 424) > 0.9
          && v22 - *(double *)(v43 + 496) > 0.1
          && !*(unsigned char *)(v43 + 544))
        {
          [(id)v43 updateInk:0 animated:1];
          v23 = (void *)v43;
        }
        [v23 zPosition];
        uint64_t v25 = v24;
        [(id)v43 altitude];
        uint64_t v27 = v26;
        [(id)v43 rollAngle];
        uint64_t v29 = v28;
        int v30 = *(unsigned __int8 *)(v43 + 512);
        v31 = [(id)v43 ink];
        if (v30)
        {
          id v32 = *(id *)(v43 + 528);

          id v33 = *(id *)(v43 + 520);
          uint64_t v34 = v43;
          double v35 = v22 - *(double *)(v43 + 504) + v22 - *(double *)(v43 + 504);
          double v36 = 1.0;
          if (v35 >= 1.0)
          {
            v37 = *(void **)(v43 + 528);
            *(void *)(v43 + 528) = 0;

            v38 = *(void **)(v43 + 520);
            *(void *)(v43 + 520) = 0;

            uint64_t v34 = v43;
            *(unsigned char *)(v43 + 512) = 0;
            v31 = v32;
          }
          else
          {
            v31 = v32;
            double v36 = v35;
          }
        }
        else
        {
          id v33 = 0;
          double v36 = 1.0;
          uint64_t v34 = v43;
        }
        if (v21 == 0.0 || !*(unsigned char *)(v34 + 546))
        {
          [MEMORY[0x1E4F39CF8] activate];
          [MEMORY[0x1E4F39CF8] begin];
          [MEMORY[0x1E4F39CF8] setDisableActions:1];
          [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
          [(id)v43 setAlpha:v21];
          [(id)v43 setHidden:v21 == 0.0];
          if (v21 > 0.0)
          {
            v39 = *(NSObject **)(v43 + 440);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__PKPencilShadowView__vsyncWithTargetTimestamp___block_invoke;
            block[3] = &unk_1E64C9898;
            void block[4] = v43;
            id v45 = v31;
            id v46 = v33;
            uint64_t v47 = v29;
            uint64_t v48 = v27;
            double v49 = v36;
            dispatch_async(v39, block);
            if ([*(id *)(v43 + 408) isDrawableAvailable])
            {
              v40 = [*(id *)(v43 + 408) nextDrawable];
              if (v40)
              {
                uint64_t v59 = 0;
                v60 = &v59;
                uint64_t v61 = 0x3032000000;
                v62 = __Block_byref_object_copy__21;
                v63 = __Block_byref_object_dispose__21;
                id v64 = 0;
                v41 = *(NSObject **)(v43 + 440);
                *(void *)buf = MEMORY[0x1E4F143A8];
                uint64_t v51 = 3221225472;
                v52 = __53__PKPencilShadowView__renderAtHeight_altitude_alpha___block_invoke;
                v53 = &unk_1E64C98C0;
                v56 = &v59;
                uint64_t v54 = v43;
                os_log_t v42 = v40;
                os_log_t v55 = v42;
                uint64_t v57 = v27;
                uint64_t v58 = v25;
                dispatch_sync(v41, buf);
                [(id)v60[5] waitUntilScheduled];
                [v42 present];

                _Block_object_dispose(&v59, 8);
              }
              else
              {
                os_log_t v42 = 0;
              }
            }
            else
            {
              os_log_t v42 = os_log_create("com.apple.pencilkit", "");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C44F8000, v42, OS_LOG_TYPE_DEFAULT, "PKPencilShadowView: No drawable available; skipping frame",
                  buf,
                  2u);
              }
            }
          }
          [MEMORY[0x1E4F39CF8] commit];
          if (v21 == 0.0 && *(double *)(v43 + 416) == 0.0 && !*(unsigned char *)(v43 + 512)) {
            -[PKPencilShadowView pauseUpdateCycle](v43);
          }
        }
      }
      else
      {
        [(id)v43 updateOpacity:1 animated:0.0];
      }
      objc_super v5 = (void *)v43;
    }
  }
}

- (void)didMoveToSuperview
{
  double v3 = [(PKPencilShadowView *)self superview];

  if (!v3)
  {
    -[PKPencilShadowView pauseUpdateCycle]((uint64_t)self);
  }
}

- (void)pauseUpdateCycle
{
  if (a1)
  {
    *(unsigned char *)(a1 + 545) = 1;
    if (*(void *)(a1 + 568))
    {
      _UIUpdateRequestDeactivate();
      _UIUpdateSequenceRemoveItem();
      _UIUpdateSequenceRemoveItem();
      *(void *)(a1 + 568) = 0;
      *(void *)(a1 + 560) = 0;
    }
    *(void *)(a1 + 424) = 0;
    [*(id *)(a1 + 488) invalidate];
    double v2 = *(void **)(a1 + 488);
    *(void *)(a1 + 488) = 0;
  }
}

- (void)updateOpacity:(double)a3 animated:(BOOL)a4
{
  self->_targetOpacity = a3;
  if (a3 > 0.0 && self->_updateCyclePaused)
  {
    self->_updateCyclePaused = 0;
    self->_presentationCount = 0;
    if (!self->_vsyncItem)
    {
      objc_initWeak(&location, self);
      _UIUpdateRequestActivate();
      from[0] = (id)MEMORY[0x1E4F143A8];
      from[1] = (id)3221225472;
      from[2] = __38__PKPencilShadowView_startUpdateCycle__block_invoke;
      from[3] = &unk_1E64C9848;
      objc_copyWeak(&v13, &location);
      self->_commitItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
      v10[1] = (id)MEMORY[0x1E4F143A8];
      v10[2] = (id)3221225472;
      v10[3] = __38__PKPencilShadowView_startUpdateCycle__block_invoke_2;
      v10[4] = &unk_1E64C9848;
      objc_copyWeak(&v11, &location);
      self->_vsyncItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    if (!self->_idleTimer)
    {
      objc_initWeak(from, self);
      uint64_t v6 = (void *)MEMORY[0x1E4F1CB00];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__PKPencilShadowView_updateOpacity_animated___block_invoke;
      v9[3] = &unk_1E64C9870;
      objc_copyWeak(v10, from);
      double v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:v9 block:0.5];
      idleTimer = self->_idleTimer;
      self->_idleTimer = v7;

      objc_destroyWeak(v10);
      objc_destroyWeak(from);
    }
  }
}

void __45__PKPencilShadowView_updateOpacity_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[61])
    {
      double v3 = WeakRetained;
      CFTimeInterval v2 = CACurrentMediaTime();
      id WeakRetained = v3;
      if (v2 - *((double *)v3 + 62) > 10.0 && !*((unsigned char *)v3 + 544))
      {
        [v3 updateOpacity:1 animated:0.0];
        id WeakRetained = v3;
      }
    }
  }
}

- (void)updateInk:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (PKInk *)a3;
  ink = self->_ink;
  uint64_t v9 = ink;
  v10 = v9;
  if (v9 != v7)
  {
    id v11 = [(PKInk *)v9 identifier];
    double v12 = [(PKInk *)v7 identifier];
    char v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_ink, a3);
      if (v4 && !self->_updateCyclePaused)
      {
        self->_animatingInk = 1;
        self->_animatingInkBeginTimestamp = CACurrentMediaTime();
        objc_storeStrong((id *)&self->_animatingInkOld, ink);
        objc_storeStrong((id *)&self->_animatingInkNew, a3);
      }
      else
      {
        self->_animatingInk = 0;
        renderQueue = self->_renderQueue;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __41__PKPencilShadowView_updateInk_animated___block_invoke;
        v15[3] = &unk_1E64C5F60;
        v15[4] = self;
        double v16 = v7;
        dispatch_async(renderQueue, v15);
      }
    }
  }
}

uint64_t __41__PKPencilShadowView_updateInk_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) updateInk:*(void *)(a1 + 40)];
}

- (void)setInk:(id)a3
{
}

- (void)setLocation:(CGPoint)a3
{
  self->_id location = a3;
  if (CACurrentMediaTime() - self->_latestKeepVisibleTimestamp < 10.0) {
    [(PKPencilShadowView *)self updateOpacity:1 animated:1.0];
  }

  -[PKPencilShadowView _updateFrameIfNecessary]((uint64_t)self);
}

- (uint64_t)_updateFrameIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 408) bounds];
    BOOL v4 = v3 == *(double *)(v1 + 456) && v2 == *(double *)(v1 + 464);
    if (!v4
      || ((result = [(id)v1 bounds], v6 == *(double *)(v1 + 456))
        ? (BOOL v7 = v5 == *(double *)(v1 + 464))
        : (BOOL v7 = 0),
          !v7 || *(unsigned char *)(v1 + 545)))
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
      -[PKPencilShadowView _updateFrame](v1);
      uint64_t v8 = (void *)MEMORY[0x1E4F39CF8];
      return [v8 commit];
    }
  }
  return result;
}

- (void)setAzimuth:(double)a3
{
  self->_azimuth = a3;
  -[PKPencilShadowView _updateFrameIfNecessary]((uint64_t)self);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPencilShadowView;
  [(PKPencilShadowView *)&v3 layoutSubviews];
  -[CAMetalLayer setFrame:](self->_metalLayer, "setFrame:", 0.0, 0.0, self->_viewSize.width, self->_viewSize.height);
}

- (uint64_t)_shadowShouldBeVisibleForCurrentTiledView
{
  if (result)
  {
    if (*(unsigned char *)(result + 544)) {
      return 1;
    }
    id v1 = objc_loadWeakRetained((id *)(result + 536));
    double v2 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_super v3 = [v2 bundleIdentifier];
    int v4 = [v3 isEqualToString:@"com.apple.freeform"];

    if (v4)
    {

      if (v1) {
        return 1;
      }
    }
    else
    {
      double v5 = v1;
      if (v1)
      {
        double v6 = [v1 window];

        double v5 = v1;
        if (v6)
        {
          double v5 = v1;
          while (([v5 isHidden] & 1) == 0)
          {
            uint64_t v7 = [v5 superview];

            double v5 = (void *)v7;
            if (!v7)
            {

              return 1;
            }
          }
        }
      }
    }
    CACurrentMediaTime();
    return 0;
  }
  return result;
}

- (void)keepAlwaysVisible
{
  self->_keepAlwaysVisible = 1;
  [(PKPencilShadowView *)self updateOpacity:1 animated:1.0];
}

- (void)keepVisibleInTiledView:(id)a3
{
  objc_storeWeak((id *)&self->_keepVisibleInTiledView, a3);
  self->_latestKeepVisibleTimestamp = CACurrentMediaTime();
  int ShouldBeVisibleForCurrentTiled = -[PKPencilShadowView _shadowShouldBeVisibleForCurrentTiledView]((uint64_t)self);
  double v5 = 0.0;
  if (ShouldBeVisibleForCurrentTiled) {
    double v5 = 1.0;
  }

  [(PKPencilShadowView *)self updateOpacity:1 animated:v5];
}

- (void)hideShadow
{
}

- (uint64_t)_updateFrame
{
  double v2 = *(double *)(a1 + 464) * 0.5;
  +[PKMetalPencilShadowRenderer maxBlurSize];
  double v4 = v2 * v3;
  +[PKMetalPencilShadowRenderer pixelSize];
  memset(&v20, 0, sizeof(v20));
  double v6 = v4 / v5;
  [(id)a1 azimuth];
  CGAffineTransformMakeRotation(&v20, v7);
  CGFloat v8 = v20.tx + v6 * v20.c + v20.a * 0.0;
  CGFloat v9 = v20.ty + v6 * v20.d + v20.b * 0.0;
  [(id)a1 location];
  double v11 = v10 - *(double *)(a1 + 456) * 0.5 - v8;
  [(id)a1 location];
  double v13 = v12 - v9;
  double v14 = *(double *)(a1 + 456);
  double v15 = *(double *)(a1 + 464);
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v19[0] = *MEMORY[0x1E4F1DAB8];
  v19[1] = v16;
  v19[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(id)a1 setTransform:v19];
  objc_msgSend((id)a1, "setFrame:", v11, v13, v14, v15);
  CGAffineTransform v18 = v20;
  [(id)a1 setTransform:&v18];
  return objc_msgSend(*(id *)(a1 + 408), "setFrame:", 0.0, 0.0, *(double *)(a1 + 456), *(double *)(a1 + 464));
}

uint64_t __48__PKPencilShadowView__vsyncWithTargetTimestamp___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) updateInk:*(void *)(a1 + 40) oldInk:*(void *)(a1 + 48) rollAngle:*(double *)(a1 + 56) altitudeAngle:*(double *)(a1 + 64) progress:*(double *)(a1 + 72)];
}

uint64_t __53__PKPencilShadowView__renderAtHeight_altitude_alpha___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 432) commandQueue];
  uint64_t v3 = [v2 commandBuffer];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  +[PKMetalPencilShadowRenderer pixelSize];
  double v7 = v6;
  CGFloat v8 = *(void **)(*(void *)(a1 + 32) + 432);
  CGFloat v9 = [*(id *)(a1 + 40) texture];
  objc_msgSend(v8, "renderInto:commandBuffer:position:azimuth:altitude:height:alpha:scale:clearFramebuffer:grayscale:", v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 1, v7 * 0.5, 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64), 1.0, 1.0, 0.1);

  double v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v10 commit];
}

- (void)signalVSyncSemaphore:(double)a3 presentationTime:(unint64_t)a4
{
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)azimuth
{
  return self->_azimuth;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(double)a3
{
  self->_rollAngle = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (PKInk)ink
{
  return self->_ink;
}

- (double)shadowAlphaMultiplier
{
  return self->_shadowAlphaMultiplier;
}

- (void)setShadowAlphaMultiplier:(double)a3
{
  self->_shadowAlphaMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_destroyWeak((id *)&self->_keepVisibleInTiledView);
  objc_storeStrong((id *)&self->_animatingInkNew, 0);
  objc_storeStrong((id *)&self->_animatingInkOld, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_shadowRenderer, 0);

  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end