@interface PKPencilObserverInteraction
+ (id)interactionForScene:(uint64_t)a1;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (UIView)view;
- (id).cxx_construct;
- (uint64_t)_trackHoverInEdgeForInputPoint:(uint64_t)result;
- (uint64_t)_updatePencilShadowView:(uint64_t)result;
- (uint64_t)isActive;
- (uint64_t)workaroundShadowUpdateEnded;
- (void)_updateActivePencilMinutes;
- (void)createShadowViewIfNecessary;
- (void)didMoveToView:(id)a3;
- (void)hidePencilShadowViewIfNecessary;
- (void)hoverController:(id)a3 didBegin:(id *)a4;
- (void)hoverController:(id)a3 didUpdate:(id *)a4;
- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4;
- (void)hoverControllerDidEnd:(id)a3;
- (void)initWithDelegate:(void *)a1;
- (void)pencilInteractionDidTap:(id)a3;
- (void)pencilObserver:(id)a3 didBeginAtPoint:(id *)a4;
- (void)pencilObserver:(id)a3 didMoveToPoint:(id *)a4;
- (void)pencilObserverDidEnd:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PKPencilObserverInteraction

- (void)initWithDelegate:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKPencilObserverInteraction;
    id v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 5, v3);
      v5 = objc_alloc_init(PKPencilStatisticsManager);
      v6 = (void *)a1[7];
      a1[7] = v5;
    }
  }

  return a1;
}

- (void)willMoveToView:(id)a3
{
  if (self->_pencilObserver)
  {
    id v4 = [(PKPencilObserverInteraction *)self view];
    [v4 removeGestureRecognizer:self->_pencilObserver];

    pencilObserver = self->_pencilObserver;
    self->_pencilObserver = 0;
  }
  hoverController = self->_hoverController;
  self->_hoverController = 0;
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  [(PKPencilObserverInteraction *)self setView:v4];
  if (v4)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__PKPencilObserverInteraction_didMoveToView___block_invoke;
    v12[3] = &unk_1E64C6C98;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    +[PKHoverSettings checkIfHoverIsSupported:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  v5 = [v4 window];
  v6 = [v5 windowScene];

  if (v6)
  {
    WeakRetained = +[PKPencilInteraction observerPencilInteraction]();
    [WeakRetained setDelegate:self];
    [v4 addInteraction:WeakRetained];
    objc_storeWeak((id *)&self->_pencilInteraction, WeakRetained);
    objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = [v4 window];
    v10 = [v9 windowScene];
    [v8 addObserver:self selector:sel_sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:v10];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pencilInteraction);
    objc_storeWeak((id *)&self->_pencilInteraction, 0);
    if (WeakRetained)
    {
      v11 = [WeakRetained view];
      [v11 removeInteraction:WeakRetained];
    }
    objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];
  }
}

void __45__PKPencilObserverInteraction_didMoveToView___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    if (WeakRetained)
    {
      id v4 = [WeakRetained view];
      v5 = *(void **)(a1 + 32);

      if (v4 == v5)
      {
        v6 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], WeakRetained, *(void **)(a1 + 32));
        v7 = (void *)WeakRetained[8];
        WeakRetained[8] = v6;

        int has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
          v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          char v9 = [v5 BOOLForKey:@"PKLogHoverEventsInPencilKit"];
        }
        else
        {
          char v9 = 0;
        }
        v10 = WeakRetained;
        uint64_t v11 = WeakRetained[8];
        if (v11) {
          *(unsigned char *)(v11 + 428) = v9;
        }
        if (has_internal_diagnostics)
        {

          v10 = WeakRetained;
        }
        uint64_t v12 = +[PKPencilObserverGestureRecognizer pencilObserverWithDelegate:]((uint64_t)PKPencilObserverGestureRecognizer, v10);
        id v13 = (void *)WeakRetained[9];
        WeakRetained[9] = v12;

        [*(id *)(a1 + 32) addGestureRecognizer:WeakRetained[9]];
      }
    }
  }
}

- (void)createShadowViewIfNecessary
{
  if (val)
  {
    if (!*((void *)val + 6)) {
      goto LABEL_14;
    }
    v2 = +[PKPencilDevice activePencil];
    if ([v2 isRollSupportUnknown])
    {
      int v3 = val[33];

      if (!v3)
      {
        id v4 = os_log_create("com.apple.pencilkit", "PencilDevice");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Detected unknown roll state. Tearing down shadow view.", (uint8_t *)buf, 2u);
        }

        val[32] = 0;
        [*((id *)val + 6) removeFromSuperview];
        v5 = (void *)*((void *)val + 6);
        *((void *)val + 6) = 0;
      }
    }
    else
    {
    }
    if (!*((void *)val + 6))
    {
LABEL_14:
      if (!val[33])
      {
        *((_WORD *)val + 16) = 257;
        objc_initWeak(buf, val);
        v6 = +[PKPencilDevice activePencil];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __58__PKPencilObserverInteraction_createShadowViewIfNecessary__block_invoke;
        v7[3] = &unk_1E64C5DD8;
        objc_copyWeak(&v8, buf);
        [v6 checkIfRollIsSupported:v7];

        objc_destroyWeak(&v8);
        objc_destroyWeak(buf);
      }
    }
  }
}

void __58__PKPencilObserverInteraction_createShadowViewIfNecessary__block_invoke(uint64_t a1, char a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    if (!WeakRetained) {
      goto LABEL_9;
    }
    WeakRetained[33] = 0;
  }
  else
  {
    char v9 = WeakRetained;
    id v4 = +[PKHoverSettings sharedSettings];
    int v5 = [v4 toolShadowActiveOnOldPencils];

    WeakRetained = v9;
    if (!v9) {
      goto LABEL_9;
    }
    v9[33] = 0;
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (WeakRetained[32] && !*((void *)WeakRetained + 6))
  {
    v10 = (id *)WeakRetained;
    v6 = objc_alloc_init(PKPencilShadowView);
    id v7 = v10[6];
    v10[6] = v6;

    [v10[6] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v10 view];
    [v8 addSubview:v10[6]];

    WeakRetained = v10;
  }
LABEL_9:
}

- (uint64_t)_updatePencilShadowView:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 48))
    {
      result = [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:result selector:sel_hidePencilShadowViewIfNecessary object:0];
      uint64_t v5 = *(void *)(v2 + 8);
      id v4 = *(double **)(v2 + 16);
      unint64_t v6 = (unint64_t)v4 - v5;
      if (v4 == (double *)v5 || a2[8] - *(v4 - 8) >= 0.002)
      {
        if (v6 >= 0x481)
        {
          uint64_t v7 = *(void *)(v2 + 8);
          do
          {
            id v8 = (char *)v4 - v5 - 128;
            if (v4 != (double *)(v5 + 128))
            {
              memmove((void *)v5, (const void *)(v5 + 128), (size_t)v4 - v5 - 128);
              uint64_t v7 = *(void *)(v2 + 8);
            }
            id v4 = (double *)&v8[v5];
            *(void *)(v2 + 16) = &v8[v5];
            unint64_t v6 = (unint64_t)&v8[v5 - v7];
            uint64_t v5 = v7;
          }
          while (v6 > 0x480);
          uint64_t v5 = v7;
        }
        unint64_t v9 = *(void *)(v2 + 24);
        if ((unint64_t)v4 >= v9)
        {
          unint64_t v17 = v6 >> 7;
          unint64_t v18 = (v6 >> 7) + 1;
          unint64_t v19 = v9 - v5;
          unint64_t v20 = (uint64_t)(v9 - v5) >> 6;
          if (v20 <= v18) {
            unint64_t v21 = v17 + 1;
          }
          else {
            unint64_t v21 = v20;
          }
          if (v19 >= 0x7FFFFFFFFFFFFF80) {
            unint64_t v22 = 0x1FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>(v2 + 24, v22);
          v24 = &v23[128 * v17];
          v26 = &v23[128 * v25];
          long long v27 = *(_OWORD *)a2;
          long long v28 = *((_OWORD *)a2 + 1);
          long long v29 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v24 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v24 + 3) = v29;
          *(_OWORD *)v24 = v27;
          *((_OWORD *)v24 + 1) = v28;
          long long v30 = *((_OWORD *)a2 + 4);
          long long v31 = *((_OWORD *)a2 + 5);
          long long v32 = *((_OWORD *)a2 + 7);
          *((_OWORD *)v24 + 6) = *((_OWORD *)a2 + 6);
          *((_OWORD *)v24 + 7) = v32;
          *((_OWORD *)v24 + 4) = v30;
          *((_OWORD *)v24 + 5) = v31;
          v16 = v24 + 128;
          v34 = *(char **)(v2 + 8);
          v33 = *(char **)(v2 + 16);
          if (v33 != v34)
          {
            do
            {
              long long v35 = *((_OWORD *)v33 - 8);
              long long v36 = *((_OWORD *)v33 - 7);
              long long v37 = *((_OWORD *)v33 - 5);
              *((_OWORD *)v24 - 6) = *((_OWORD *)v33 - 6);
              *((_OWORD *)v24 - 5) = v37;
              *((_OWORD *)v24 - 8) = v35;
              *((_OWORD *)v24 - 7) = v36;
              long long v38 = *((_OWORD *)v33 - 4);
              long long v39 = *((_OWORD *)v33 - 3);
              long long v40 = *((_OWORD *)v33 - 1);
              *((_OWORD *)v24 - 2) = *((_OWORD *)v33 - 2);
              *((_OWORD *)v24 - 1) = v40;
              *((_OWORD *)v24 - 4) = v38;
              *((_OWORD *)v24 - 3) = v39;
              v24 -= 128;
              v33 -= 128;
            }
            while (v33 != v34);
            v33 = *(char **)(v2 + 8);
          }
          *(void *)(v2 + 8) = v24;
          *(void *)(v2 + 16) = v16;
          *(void *)(v2 + 24) = v26;
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          long long v10 = *(_OWORD *)a2;
          long long v11 = *((_OWORD *)a2 + 1);
          long long v12 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v4 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v4 + 3) = v12;
          *(_OWORD *)id v4 = v10;
          *((_OWORD *)v4 + 1) = v11;
          long long v13 = *((_OWORD *)a2 + 4);
          long long v14 = *((_OWORD *)a2 + 5);
          long long v15 = *((_OWORD *)a2 + 7);
          *((_OWORD *)v4 + 6) = *((_OWORD *)a2 + 6);
          *((_OWORD *)v4 + 7) = v15;
          *((_OWORD *)v4 + 4) = v13;
          *((_OWORD *)v4 + 5) = v14;
          v16 = v4 + 16;
        }
        *(void *)(v2 + 16) = v16;
        objc_msgSend(*(id *)(v2 + 48), "setLocation:", *a2, a2[1]);
        double v41 = a2[13];
        v42 = +[PKPencilDevice activePencil];
        [v42 baseRollAngle];
        double v44 = v43 - v41;
        double v45 = fmod(v44, 6.28318531);
        if (v44 <= 6.28318531 && v44 >= 0.0) {
          double v45 = v44;
        }
        if (v45 < 0.0) {
          double v45 = v45 + 6.28318531;
        }
        if (v45 == 0.0) {
          double v45 = 0.0;
        }
        [*(id *)(v2 + 48) setRollAngle:v45];

        [*(id *)(v2 + 48) setZPosition:a2[7]];
        [*(id *)(v2 + 48) setAzimuth:a2[3] + 1.57079633];
        [*(id *)(v2 + 48) setAltitude:1.57079633 - a2[4]];
        [*(id *)(v2 + 48) setAccessibilityIdentifier:@"ToolShadow"];
        id v47 = *(id *)(v2 + 64);
        v48 = +[PKHoverSettings sharedSettings];
        [v48 toolPreviewMaxZDistance];
        long long v49 = *((_OWORD *)a2 + 5);
        v75[4] = *((_OWORD *)a2 + 4);
        v75[5] = v49;
        long long v50 = *((_OWORD *)a2 + 7);
        v75[6] = *((_OWORD *)a2 + 6);
        v75[7] = v50;
        long long v51 = *((_OWORD *)a2 + 1);
        v75[0] = *(_OWORD *)a2;
        v75[1] = v51;
        long long v52 = *((_OWORD *)a2 + 3);
        v75[2] = *((_OWORD *)a2 + 2);
        v75[3] = v52;
        double v54 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v47, v75, v53);

        v55 = +[PKHoverSettings sharedSettings];
        [v55 toolShadowFadeInDistance];
        double v57 = v56;

        if (v54 >= v57) {
          double v58 = v57;
        }
        else {
          double v58 = v54;
        }
        double v59 = v54 - v58;
        double v60 = a2[7];
        double v61 = 1.0;
        if (v60 > v54 - v58)
        {
          double v62 = v60 - v59;
          if (v60 - v59 >= v58) {
            double v62 = v58;
          }
          double v61 = 1.0 - v62 / v58;
        }
        uint64_t v63 = *(void *)(v2 + 8);
        uint64_t v64 = *(void *)(v2 + 16) - v63;
        if ((unint64_t)v64 >= 0x500)
        {
          uint64_t v66 = v64 >> 7;
          double v67 = 0.0;
          if (v64 >= 129)
          {
            uint64_t v68 = 2;
            if (v66 > 2) {
              uint64_t v68 = v66;
            }
            double v69 = *(double *)(v63 + 64);
            v70 = (double *)(v63 + 128);
            uint64_t v71 = v68 - 1;
            do
            {
              double v72 = v70[8];
              if (v72 > v69) {
                double v67 = v67
              }
                    + ((*(v70 - 15) - v70[1]) * (*(v70 - 15) - v70[1]) + (*(v70 - 16) - *v70) * (*(v70 - 16) - *v70))
                    / (v72 - v69);
              v70 += 16;
              double v69 = v72;
              --v71;
            }
            while (v71);
          }
          double v65 = sqrt(v67) / (double)v66 + -60.0;
        }
        else
        {
          double v65 = -60.0;
        }
        double v73 = v65 / -50.0;
        double v74 = 0.0;
        if (v73 >= 0.0)
        {
          double v74 = v73;
          if (v73 > 1.0) {
            double v74 = 1.0;
          }
        }
        return [*(id *)(v2 + 48) setShadowAlphaMultiplier:v61 * v74];
      }
    }
  }
  return result;
}

+ (id)interactionForScene:(uint64_t)a1
{
  id v2 = a2;
  self;
  int v3 = +[PKTextInputInteraction interactionForScene:v2];
  id v4 = [v3 pencilObserverInteraction];

  return v4;
}

- (uint64_t)isActive
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2 && *(unsigned char *)(v2 + 56))
    {
      return 1;
    }
    else
    {
      id v3 = *(id *)(a1 + 72);
      uint64_t v1 = [v3 state] == 2 || objc_msgSend(*(id *)(v1 + 72), "state") == 1;
    }
  }
  return v1;
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = +[PKPencilDevice activePencil];
  [v4 appSceneDidEnterBackground];

  if (self)
  {
    self->_wantsShadowView = 0;
    [(PKPencilShadowView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;
  }
  statisticsManager = self->_statisticsManager;

  -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)statisticsManager);
}

- (uint64_t)_trackHoverInEdgeForInputPoint:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(_OWORD *)(result + 120) = *a2;
    uint64_t v4 = *(void *)(result + 64);
    long long v5 = a2[5];
    v19[4] = a2[4];
    v19[5] = v5;
    long long v6 = a2[7];
    v19[6] = a2[6];
    v19[7] = v6;
    long long v7 = a2[1];
    v19[0] = *a2;
    v19[1] = v7;
    long long v8 = a2[3];
    v19[2] = a2[2];
    v19[3] = v8;
    result = -[PKHoverController isInEdgeOfScreen:](v4, v19);
    if (result)
    {
      uint64_t v9 = *(void *)(v3 + 56);
      if (!v9) {
        goto LABEL_9;
      }
      long long v10 = (void *)(v9 + 56);
    }
    else
    {
      uint64_t v11 = *(void *)(v3 + 64);
      long long v12 = a2[5];
      v18[4] = a2[4];
      v18[5] = v12;
      long long v13 = a2[7];
      v18[6] = a2[6];
      v18[7] = v13;
      long long v14 = a2[1];
      v18[0] = *a2;
      v18[1] = v14;
      long long v15 = a2[3];
      v18[2] = a2[2];
      v18[3] = v15;
      result = -[PKHoverController isInExteriorOfScreen:](v11, v18);
      if (!result) {
        goto LABEL_9;
      }
      uint64_t v16 = *(void *)(v3 + 56);
      if (!v16) {
        goto LABEL_9;
      }
      long long v10 = (void *)(v16 + 64);
    }
    ++*v10;
LABEL_9:
    uint64_t v17 = *(void *)(v3 + 56);
    if (v17) {
      ++*(void *)(v17 + 72);
    }
  }
  return result;
}

- (void)_updateActivePencilMinutes
{
  if (a1)
  {
    double v2 = CACurrentMediaTime();
    if (v2 - *(double *)(a1 + 96) >= 60.0)
    {
      uint64_t v3 = *(void *)(a1 + 56);
      if (v3) {
        ++*(void *)(v3 + 120);
      }
      *(double *)(a1 + 96) = v2;
    }
  }
}

- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4
{
  if (self)
  {
    statisticsManager = self->_statisticsManager;
    if (statisticsManager)
    {
      value = statisticsManager->_intentionalHoverStats.__ptr_.__value_;
      if (value) {
        PKRunningStat::push(value, a4);
      }
      statisticsManager->_intentionalHoverDuration = statisticsManager->_intentionalHoverDuration + a4;
    }
  }
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  self->_timestampForHoverBegan = CACurrentMediaTime();
  long long v6 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v6;
  long long v7 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v7;
  long long v8 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v9;
  -[PKPencilObserverInteraction _trackHoverInEdgeForInputPoint:]((uint64_t)self, v15);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  long long v10 = *(_OWORD *)&a4->var9;
  v14[4] = *(_OWORD *)&a4->var7;
  v14[5] = v10;
  long long v11 = *(_OWORD *)&a4->var13;
  v14[6] = *(_OWORD *)&a4->var11;
  v14[7] = v11;
  long long v12 = *(_OWORD *)&a4->var1;
  v14[0] = a4->var0;
  v14[1] = v12;
  long long v13 = *(_OWORD *)&a4->var5;
  v14[2] = *(_OWORD *)&a4->var3;
  v14[3] = v13;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v14);
}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  long long v6 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v6;
  long long v7 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v7;
  long long v8 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v9;
  -[PKPencilObserverInteraction _trackHoverInEdgeForInputPoint:]((uint64_t)self, v15);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  long long v10 = *(_OWORD *)&a4->var9;
  v14[4] = *(_OWORD *)&a4->var7;
  v14[5] = v10;
  long long v11 = *(_OWORD *)&a4->var13;
  v14[6] = *(_OWORD *)&a4->var11;
  v14[7] = v11;
  long long v12 = *(_OWORD *)&a4->var1;
  v14[0] = a4->var0;
  v14[1] = v12;
  long long v13 = *(_OWORD *)&a4->var5;
  v14[2] = *(_OWORD *)&a4->var3;
  v14[3] = v13;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v14);
}

- (void)hoverControllerDidEnd:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = CACurrentMediaTime();
  double v5 = v4;
  if (self)
  {
    double v5 = v4 - self->_timestampForHoverBegan;
    long long v6 = self->_statisticsManager;
    if (v6) {
      v6->_accumulatedHoverDuration = v5 + v6->_accumulatedHoverDuration;
    }
  }
  else
  {
    long long v6 = 0;
  }

  long long v7 = os_log_create("com.apple.pencilkit", "Pencil Observer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Pencil Hover Duration: %.3f", (uint8_t *)&v8, 0xCu);
  }

  [(PKPencilObserverInteraction *)self performSelector:sel_hidePencilShadowViewIfNecessary withObject:0 afterDelay:0.0666666667];
}

- (void)pencilObserver:(id)a3 didBeginAtPoint:(id *)a4
{
  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  self->_currentLocation = (CGPoint)a4->var0;
  self->_timestampForPencilObserverBegan = CACurrentMediaTime();
  -[PKHoverController didReceiveNormalTouch:]((uint64_t)self->_hoverController, 0);
  long long v6 = *(_OWORD *)&a4->var9;
  v10[4] = *(_OWORD *)&a4->var7;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a4->var13;
  v10[6] = *(_OWORD *)&a4->var11;
  v10[7] = v7;
  long long v8 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v9;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v10);
}

- (void)pencilObserver:(id)a3 didMoveToPoint:(id *)a4
{
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  self->_currentLocation = (CGPoint)a4->var0;
  -[PKHoverController didReceiveNormalTouch:]((uint64_t)self->_hoverController, 0);
  long long v6 = *(_OWORD *)&a4->var9;
  v10[4] = *(_OWORD *)&a4->var7;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a4->var13;
  v10[6] = *(_OWORD *)&a4->var11;
  v10[7] = v7;
  long long v8 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v9;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v10);
}

- (void)pencilObserverDidEnd:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = CACurrentMediaTime();
  double v5 = v4;
  if (self)
  {
    double v5 = v4 - self->_timestampForPencilObserverBegan;
    long long v6 = self->_statisticsManager;
    if (v6) {
      v6->_accumulatedOnScreenDuration = v5 + v6->_accumulatedOnScreenDuration;
    }
  }
  else
  {
    long long v6 = 0;
  }

  long long v7 = os_log_create("com.apple.pencilkit", "Pencil Observer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Pencil On Screen Duration: %.3f", (uint8_t *)&v8, 0xCu);
  }

  [(PKPencilObserverInteraction *)self performSelector:sel_hidePencilShadowViewIfNecessary withObject:0 afterDelay:0.0666666667];
}

- (uint64_t)workaroundShadowUpdateEnded
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    result = -[PKPencilObserverInteraction isActive](result);
    if ((result & 1) == 0)
    {
      return [v1 performSelector:sel_hidePencilShadowViewIfNecessary withObject:0 afterDelay:0.0666666667];
    }
  }
  return result;
}

- (void)hidePencilShadowViewIfNecessary
{
  if ((-[PKPencilObserverInteraction isActive]((uint64_t)self) & 1) == 0)
  {
    std::vector<PKInputPoint>::resize((uint64_t)&self->_inputPoints, 0);
    shadowView = self->_shadowView;
    [(PKPencilShadowView *)shadowView hideShadow];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([v5 type] == 2 && (hoverController = self->_hoverController) != 0)
  {
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)hoverController, v5);
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void)pencilInteractionDidTap:(id)a3
{
  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  hoverController = self->_hoverController;
  if (hoverController)
  {
    int waitingForHoverHoldTimestamp_low = LOBYTE(hoverController->_waitingForHoverHoldTimestamp);
    statisticsManager = self->_statisticsManager;
    if (waitingForHoverHoldTimestamp_low)
    {
      if (!statisticsManager) {
        return;
      }
      p_doubleTapsInRange = &statisticsManager->_doubleTapsInRange;
      goto LABEL_8;
    }
  }
  else
  {
    statisticsManager = self->_statisticsManager;
  }
  if (!statisticsManager) {
    return;
  }
  p_doubleTapsInRange = &statisticsManager->_doubleTapsOutsideRange;
LABEL_8:
  ++*p_doubleTapsInRange;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_pencilInteraction);
  objc_storeStrong((id *)&self->_pencilObserver, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    self->_inputPoints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end