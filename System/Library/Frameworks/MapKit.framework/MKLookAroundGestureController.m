@interface MKLookAroundGestureController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)navigatingEnabled;
- (BOOL)panningEnabled;
- (BOOL)zoomingEnabled;
- (MKLookAroundGestureController)initWithLookAroundView:(id)a3;
- (MKLookAroundGestureControllerDelegate)delegate;
- (MKLookAroundView)lookAroundView;
- (void)_handlePan:(id)a3;
- (void)_handleSingleNavigate:(id)a3;
- (void)_handleZoom:(id)a3;
- (void)_moveBackToReplayTap;
- (void)setDelegate:(id)a3;
- (void)setLookAroundView:(id)a3;
- (void)setNavigatingEnabled:(BOOL)a3;
- (void)setPanningEnabled:(BOOL)a3;
- (void)setZoomingEnabled:(BOOL)a3;
@end

@implementation MKLookAroundGestureController

- (MKLookAroundGestureController)initWithLookAroundView:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MKLookAroundGestureController;
  v5 = [(MKLookAroundGestureController *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lookAroundView, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v6 action:sel__handleSingleNavigate_];
    singleNavigateGestureRecognizer = v6->_singleNavigateGestureRecognizer;
    v6->_singleNavigateGestureRecognizer = (UITapGestureRecognizer *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v6 action:sel__handlePan_];
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v9;

    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer setDelegate:v6];
    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer _setRequiresSystemGesturesToFail:1];
    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer setAllowedScrollTypesMask:2];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42C80]) initWithTarget:v6 action:sel__handleZoom_];
    zoomGestureRecognizer = v6->_zoomGestureRecognizer;
    v6->_zoomGestureRecognizer = (UIPinchGestureRecognizer *)v11;

    [(UIPinchGestureRecognizer *)v6->_zoomGestureRecognizer setDelegate:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    [WeakRetained addGestureRecognizer:v6->_singleNavigateGestureRecognizer];

    id v14 = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    [v14 addGestureRecognizer:v6->_panGestureRecognizer];

    id v15 = objc_loadWeakRetained((id *)&v6->_lookAroundView);
    [v15 addGestureRecognizer:v6->_zoomGestureRecognizer];

    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    singleTapTime = v6->_singleTapTime;
    v6->_singleTapTime = (NSDate *)v16;

    v6->_readyToReplayTap = 0;
    v18 = v6;
  }

  return v6;
}

- (void)setNavigatingEnabled:(BOOL)a3
{
}

- (void)setPanningEnabled:(BOOL)a3
{
}

- (void)setZoomingEnabled:(BOOL)a3
{
}

- (void)_moveBackToReplayTap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = MKGetMKLookAroundLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -_moveBackToReplayTap", buf, 0xCu);
  }

  *(_OWORD *)buf = 0u;
  long long v15 = 0u;
  id v4 = [MEMORY[0x1E4FB3A08] sharedSettings];
  v5 = v4;
  if (v4)
  {
    [v4 muninTapState];
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v15 = 0u;
  }

  v6 = [MEMORY[0x1E4FB3A08] sharedSettings];
  [v6 setMuninReplayLastTap:0];

  double v7 = *(double *)&buf[8];
  long long v8 = v15;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  v10 = [WeakRetained lookAroundView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke;
  v12[3] = &unk_1E54BCF00;
  v12[4] = self;
  *(double *)&v12[5] = v7;
  long long v13 = v8;
  id v11 = (id)objc_msgSend(v10, "muninMarkerAtCoordinate:completeMarkerHandler:", v12, v7, *(double *)&v8);
}

void __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    v5 = [WeakRetained lookAroundView];
    double v6 = *(float *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_2;
    v7[3] = &unk_1E54BCED8;
    v7[4] = *(void *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 40);
    id v8 = v3;
    uint64_t v10 = *(void *)(a1 + 56);
    [v5 moveToMarker:v8 withHeading:0 animated:v7 completionHandler:v6];
  }
}

void __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    id v4 = [WeakRetained lookAroundView];
    [*(id *)(a1 + 40) coordinate];
    uint64_t v5 = *MEMORY[0x1E4FB3AE0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_3;
    v6[3] = &unk_1E54B86F0;
    v6[4] = *(void *)(a1 + 32);
    objc_msgSend(v4, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
}

uint64_t __53__MKLookAroundGestureController__moveBackToReplayTap__block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(result + 32) + 80) = 1;
  }
  return result;
}

- (void)_handleSingleNavigate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:self->_singleTapTime];
  if (v6 >= 0.6)
  {
    double v7 = [MEMORY[0x1E4FB3A08] sharedSettings];
    int v8 = [v7 muninReplayLastTap];

    if (v8)
    {
      [(MKLookAroundGestureController *)self _moveBackToReplayTap];
    }
    else
    {
      if (!self->_userInteractionCount)
      {
        long long v9 = MKGetMKLookAroundLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidStartUserInteraction>", buf, 2u);
        }

        uint64_t v10 = [(MKLookAroundGestureController *)self delegate];
        [v10 lookAroundGestureControllerDidStartUserInteraction:self];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
      [v4 locationInView:WeakRetained];
      double v13 = v12;
      double v15 = v14;

      if (self->_readyToReplayTap)
      {
        uint64_t v16 = [MEMORY[0x1E4FB3A08] sharedSettings];
        v17 = v16;
        if (v16)
        {
          [v16 muninTapState];
          double v13 = *(float *)&v42;
        }
        else
        {
          long long v42 = 0u;
          long long v43 = 0u;
          double v13 = 0.0;
        }

        v18 = [MEMORY[0x1E4FB3A08] sharedSettings];
        v19 = v18;
        if (v18)
        {
          [v18 muninTapState];
          double v15 = *((float *)&v40 + 1);
        }
        else
        {
          long long v40 = 0u;
          long long v41 = 0u;
          double v15 = 0.0;
        }

        self->_readyToReplayTap = 0;
      }
      id v20 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      v21 = [v20 lookAroundView];
      int v22 = [v21 enableDebugLabelHighlighting];

      id v23 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      v24 = [v23 lookAroundView];
      v25 = v24;
      if (v22)
      {
        objc_msgSend(v24, "debugHighlightLabelAtPoint:", v13, v15);
      }
      else
      {
        v26 = objc_msgSend(v24, "labelMarkerForSelectionAtPoint:selectableLabelsOnly:", 1, v13, v15);

        id v27 = objc_loadWeakRetained((id *)&self->_lookAroundView);
        v28 = [v27 selectedLabelMarker];

        if (v28 && v28 != v26)
        {
          id v29 = objc_loadWeakRetained((id *)&self->_lookAroundView);
          [v29 deselectLabelMarker];
        }
        id v30 = objc_loadWeakRetained((id *)&self->_lookAroundView);
        v31 = v30;
        if (v26)
        {
          [v30 selectLabelMarker:v26];

          v32 = MKGetMKLookAroundLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18BAEC000, v32, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidTapLabelMarker>", buf, 2u);
          }

          v33 = [(MKLookAroundGestureController *)self delegate];
          [v33 lookAroundGestureController:self didTapLabelMarker:v26];
        }
        else
        {
          uint64_t v34 = objc_msgSend(v30, "tapAtPoint:", v13, v15);

          v35 = MKGetMKLookAroundLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18BAEC000, v35, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidTapAtPoint>", buf, 2u);
          }

          v33 = [(MKLookAroundGestureController *)self delegate];
          objc_msgSend(v33, "lookAroundGestureController:didTapAtPoint:areaAvailable:", self, v34, v13, v15);
        }

        if (!self->_userInteractionCount)
        {
          v36 = MKGetMKLookAroundLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18BAEC000, v36, OS_LOG_TYPE_DEBUG, "[Gesture] _handleSingleNavigate: DidStopUserInteraction>", buf, 2u);
          }

          v37 = [(MKLookAroundGestureController *)self delegate];
          [v37 lookAroundGestureControllerDidStopUserInteraction:self];
        }
        objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v40, v41, v42, v43);
        v38 = (NSDate *)objc_claimAutoreleasedReturnValue();
        singleTapTime = self->_singleTapTime;
        self->_singleTapTime = v38;
      }
    }
  }
}

- (void)_handlePan:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  [v4 locationInView:WeakRetained];
  double v7 = v6;
  double v9 = v8;

  [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup stop];
  panDecelerationAnimationGroup = self->_panDecelerationAnimationGroup;
  self->_panDecelerationAnimationGroup = 0;

  if (!self->_userInteractionCount)
  {
    id v11 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStartUserInteraction>", buf, 2u);
    }

    double v12 = [(MKLookAroundGestureController *)self delegate];
    [v12 lookAroundGestureControllerDidStartUserInteraction:self];
  }
  *(void *)buf = 0;
  v46 = buf;
  uint64_t v47 = 0x3010000000;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  v48 = "";
  id v13 = objc_loadWeakRetained((id *)&self->_lookAroundView);
  [v4 translationInView:v13];
  uint64_t v49 = v14;
  uint64_t v50 = v15;

  switch([v4 state])
  {
    case 1:
      uint64_t v16 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Began>", v51, 2u);
      }

      ++self->_userInteractionCount;
      v17 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int64_t userInteractionCount = self->_userInteractionCount;
        *(_DWORD *)v51 = 134217984;
        int64_t v52 = userInteractionCount;
        _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: _userInteractionCount == %ld", v51, 0xCu);
      }

      id v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      id v20 = [v19 lookAroundView];
      objc_msgSend(v20, "startPanningAtPoint:", v7, v9);
      goto LABEL_13;
    case 2:
      id v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      id v20 = [v19 lookAroundView];
      objc_msgSend(v20, "updatePanWithTranslation:", *((double *)v46 + 4), *((double *)v46 + 5));
      goto LABEL_13;
    case 3:
      id v21 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      [v4 velocityInView:v21];
      double v23 = v22;
      double v25 = v24;

      id v19 = objc_alloc_init(MEMORY[0x1E4FB3A10]);
      v44[6] = (id)MEMORY[0x1E4F143A8];
      v44[7] = (id)3221225472;
      v44[8] = __44__MKLookAroundGestureController__handlePan___block_invoke;
      v44[9] = &unk_1E54BCF28;
      v44[10] = buf;
      v26 = dynamicValueAnimation();
      [v19 setDynamicStepHandler:v26];

      id v20 = objc_alloc_init(MEMORY[0x1E4FB3A10]);
      v44[1] = (id)MEMORY[0x1E4F143A8];
      v44[2] = (id)3221225472;
      v44[3] = __44__MKLookAroundGestureController__handlePan___block_invoke_2;
      v44[4] = &unk_1E54BCF28;
      v44[5] = buf;
      id v27 = dynamicValueAnimation();
      [v20 setDynamicStepHandler:v27];

      objc_initWeak((id *)v51, self);
      id v28 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      id v29 = [v28 lookAroundView];
      objc_msgSend(v29, "willStopPanningAtPoint:withVelocity:", v7, v9, v23, v25);

      id v30 = (VKCompoundAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB39F0]), "initWithAnimations:", v19, v20, 0);
      v31 = self->_panDecelerationAnimationGroup;
      self->_panDecelerationAnimationGroup = v30;

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __44__MKLookAroundGestureController__handlePan___block_invoke_3;
      v42[3] = &unk_1E54BCF50;
      objc_copyWeak(v44, (id *)v51);
      id v43 = v4;
      [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup setCompletionHandler:v42];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __44__MKLookAroundGestureController__handlePan___block_invoke_22;
      v40[3] = &unk_1E54BCF78;
      objc_copyWeak(&v41, (id *)v51);
      v40[4] = buf;
      [(VKCompoundAnimation *)self->_panDecelerationAnimationGroup setGroupStepHandler:v40];
      id v32 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      v33 = [v32 lookAroundView];
      [v33 runAnimation:self->_panDecelerationAnimationGroup];

      objc_destroyWeak(&v41);
      objc_destroyWeak(v44);
      objc_destroyWeak((id *)v51);
LABEL_13:

      goto LABEL_14;
    case 4:
      id v34 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      v35 = [v34 lookAroundView];
      objc_msgSend(v35, "stopPanningAtPoint:", v7, v9);

      v36 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_18BAEC000, v36, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Cancelled>", v51, 2u);
      }

      --self->_userInteractionCount;
      v37 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        int64_t v38 = self->_userInteractionCount;
        *(_DWORD *)v51 = 134217984;
        int64_t v52 = v38;
        _os_log_impl(&dword_18BAEC000, v37, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: _userInteractionCount == %ld", v51, 0xCu);
      }

      if (self->_userInteractionCount) {
        goto LABEL_15;
      }
      v39 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_18BAEC000, v39, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", v51, 2u);
      }

      id v19 = [(MKLookAroundGestureController *)self delegate];
      [v19 lookAroundGestureControllerDidStopUserInteraction:self];
LABEL_14:

LABEL_15:
      _Block_object_dispose(buf, 8);

      return;
    default:
      goto LABEL_15;
  }
}

uint64_t __44__MKLookAroundGestureController__handlePan___block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 32) = a2;
  return result;
}

uint64_t __44__MKLookAroundGestureController__handlePan___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  return result;
}

void __44__MKLookAroundGestureController__handlePan___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 12);
    uint64_t v5 = [v4 lookAroundView];
    double v6 = *(void **)(a1 + 32);
    id v7 = objc_loadWeakRetained(v3 + 12);
    [v6 locationInView:v7];
    objc_msgSend(v5, "stopPanningAtPoint:");

    double v8 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: Ended>", (uint8_t *)&v14, 2u);
    }

    v3[1] = (char *)v3[1] - 1;
    double v9 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = v3[1];
      int v14 = 134217984;
      id v15 = v10;
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidPan (_userInteractionCount == %ld)", (uint8_t *)&v14, 0xCu);
    }

    id v11 = [v3 delegate];
    [v11 lookAroundGestureControllerDidPan:v3];

    if (!v3[1])
    {
      double v12 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", (uint8_t *)&v14, 2u);
      }

      id v13 = [v3 delegate];
      [v13 lookAroundGestureControllerDidStopUserInteraction:v3];
    }
  }
}

void __44__MKLookAroundGestureController__handlePan___block_invoke_22(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 12);
    id v4 = [v3 lookAroundView];
    objc_msgSend(v4, "updatePanWithTranslation:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

    id WeakRetained = v5;
  }
}

- (void)_handleZoom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_userInteractionCount)
  {
    uint64_t v5 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: DidStartUserInteraction>", (uint8_t *)&v33, 2u);
    }

    double v6 = [(MKLookAroundGestureController *)self delegate];
    [v6 lookAroundGestureControllerDidStartUserInteraction:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);
  [v4 locationInView:WeakRetained];
  double v9 = v8;
  double v11 = v10;

  [v4 scale];
  double v13 = v12;
  switch([v4 state])
  {
    case 1:
      int v14 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Began>", (uint8_t *)&v33, 2u);
      }

      ++self->_userInteractionCount;
      id v15 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int64_t userInteractionCount = self->_userInteractionCount;
        int v33 = 134217984;
        int64_t v34 = userInteractionCount;
        _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: _userInteractionCount == %ld", (uint8_t *)&v33, 0xCu);
      }

      id v17 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      v18 = [v17 lookAroundView];
      objc_msgSend(v18, "startPinchingWithFocusPoint:", v9, v11);

      self->_lastZoomDirection = 0;
      self->_lastZoomScale = 1.0;
      self->_startZoomScale = v13;
      break;
    case 2:
      id v19 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      id v20 = [v19 lookAroundView];
      objc_msgSend(v20, "updatePinchWithFocusPoint:oldFactor:newFactor:", v9, v11, self->_lastZoomScale, v13);

      int64_t v21 = 2;
      if (self->_lastZoomScale > self->_startZoomScale) {
        int64_t v21 = 1;
      }
      self->_lastZoomDirection = v21;
      self->_lastZoomScale = v13;
      break;
    case 3:
      double v22 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Ended>", (uint8_t *)&v33, 2u);
      }

      --self->_userInteractionCount;
      double v23 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int64_t v24 = self->_userInteractionCount;
        int v33 = 134217984;
        int64_t v34 = v24;
        _os_log_impl(&dword_18BAEC000, v23, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: DidZoom (_userInteractionCount == %ld)", (uint8_t *)&v33, 0xCu);
      }

      double v25 = [(MKLookAroundGestureController *)self delegate];
      [v25 lookAroundGestureController:self didZoomWithDirection:self->_lastZoomDirection type:1];

      if (self->_userInteractionCount) {
        goto LABEL_30;
      }
      v26 = MKGetMKLookAroundLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_29;
      }
      LOWORD(v33) = 0;
      goto LABEL_28;
    case 4:
      id v27 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18BAEC000, v27, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: Cancelled>", (uint8_t *)&v33, 2u);
      }

      --self->_userInteractionCount;
      id v28 = MKGetMKLookAroundLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        int64_t v29 = self->_userInteractionCount;
        int v33 = 134217984;
        int64_t v34 = v29;
        _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_DEBUG, "[Gesture] _handleZoom: _userInteractionCount == %ld", (uint8_t *)&v33, 0xCu);
      }

      if (!self->_userInteractionCount)
      {
        v26 = MKGetMKLookAroundLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v33) = 0;
LABEL_28:
          _os_log_impl(&dword_18BAEC000, v26, OS_LOG_TYPE_DEBUG, "[Gesture] _handlePan: DidStopUserInteraction>", (uint8_t *)&v33, 2u);
        }
LABEL_29:

        id v30 = [(MKLookAroundGestureController *)self delegate];
        [v30 lookAroundGestureControllerDidStopUserInteraction:self];
      }
LABEL_30:
      id v31 = objc_loadWeakRetained((id *)&self->_lookAroundView);
      id v32 = [v31 lookAroundView];
      objc_msgSend(v32, "stopPinchingWithFocusPoint:", v9, v11);

      break;
    default:
      break;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(MKLookAroundGestureController *)self delegate];
  LOBYTE(self) = [v6 lookAroundGestureControllerShouldReceive:self shouldReceiveTouch:v5];

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  panGestureRecognizer = self->_panGestureRecognizer;
  zoomGestureRecognizer = self->_zoomGestureRecognizer;
  BOOL v11 = zoomGestureRecognizer == v7 && panGestureRecognizer == v6;
  BOOL v13 = zoomGestureRecognizer == v6 && panGestureRecognizer == v7 || v11;

  return v13;
}

- (MKLookAroundGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKLookAroundGestureControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (MKLookAroundView)lookAroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lookAroundView);

  return (MKLookAroundView *)WeakRetained;
}

- (void)setLookAroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lookAroundView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_panDecelerationAnimationGroup, 0);
  objc_storeStrong((id *)&self->_singleTapTime, 0);
  objc_storeStrong((id *)&self->_zoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_singleNavigateGestureRecognizer, 0);
}

@end