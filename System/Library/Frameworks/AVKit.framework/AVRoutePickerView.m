@interface AVRoutePickerView
- (AVCustomRoutingController)customRoutingController;
- (AVPlayer)player;
- (AVRoutePickerView)initWithCoder:(id)a3;
- (AVRoutePickerView)initWithFrame:(CGRect)a3;
- (AVRoutePickerViewButtonStyle)routePickerButtonStyle;
- (BOOL)_isAirPlayOrCustomRouteActive;
- (BOOL)isAirPlayActive;
- (BOOL)isRoutePickerButtonBordered;
- (BOOL)prioritizesVideoDevices;
- (CGRect)_normalizedRect:(CGRect)a3 fromView:(id)a4;
- (CGSize)intrinsicContentSize;
- (UIColor)activeTintColor;
- (UIEdgeInsets)alignmentRectInsets;
- (double)baselineOffsetFromBottom;
- (id)_defaultActiveTintColor;
- (id)customButton;
- (id)delegate;
- (id)routingConfiguration;
- (id)topViewControllerForPresentingAlert;
- (void)_addCustomRoutingItemsToRoutePickingControls;
- (void)_createOrUpdateRoutePickerButton;
- (void)_registerNotifications;
- (void)_routePickerButtonTapped:(id)a3;
- (void)_routePickerButtonTouchDown:(id)a3;
- (void)_routePickerButtonTouchDragEnter:(id)a3;
- (void)_routePickerButtonTouchUp:(id)a3;
- (void)_setRoutePickerButtonAlpha:(double)a3 animated:(BOOL)a4;
- (void)_setupOutputContext;
- (void)_updateAirPlayActive;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)interruptActiveInteractions;
- (void)layoutSubviews;
- (void)setActiveTintColor:(UIColor *)activeTintColor;
- (void)setAirPlayActive:(BOOL)a3;
- (void)setCustomButton:(id)a3;
- (void)setCustomRoutingController:(AVCustomRoutingController *)customRoutingController;
- (void)setDelegate:(id)delegate;
- (void)setPlayer:(AVPlayer *)player;
- (void)setPrioritizesVideoDevices:(BOOL)prioritizesVideoDevices;
- (void)setRoutePickerButtonBordered:(BOOL)routePickerButtonBordered;
- (void)setRoutePickerButtonStyle:(AVRoutePickerViewButtonStyle)routePickerButtonStyle;
- (void)setRoutingConfiguration:(id)a3;
- (void)tintColorDidChange;
- (void)updateButtonAppearance;
@end

@implementation AVRoutePickerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_routePickingControls);
  objc_storeStrong((id *)&self->_routePickerButtonMicaPackage, 0);
  objc_storeStrong((id *)&self->_customRoutingController, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_buttonHighlightAnimator, 0);
  objc_storeStrong((id *)&self->_customButton, 0);
  objc_storeStrong((id *)&self->_routePickerButton, 0);
  objc_storeStrong((id *)&self->_activeTintColor, 0);

  objc_storeStrong((id *)&self->_getAirPlayStatusQueue, 0);
}

- (void)setRoutePickerButtonStyle:(AVRoutePickerViewButtonStyle)routePickerButtonStyle
{
  self->_routePickerButtonStyle = routePickerButtonStyle;
}

- (AVRoutePickerViewButtonStyle)routePickerButtonStyle
{
  return self->_routePickerButtonStyle;
}

- (void)setRoutePickerButtonBordered:(BOOL)routePickerButtonBordered
{
  self->_routePickerButtonBordered = routePickerButtonBordered;
}

- (BOOL)isRoutePickerButtonBordered
{
  return self->_routePickerButtonBordered;
}

- (void)setPlayer:(AVPlayer *)player
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)_addCustomRoutingItemsToRoutePickingControls
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  p_routePickingControls = &self->_routePickingControls;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);

  if (WeakRetained)
  {
    v5 = [(AVRoutePickerView *)self customRoutingController];
    v6 = [v5 customActionItems];

    if ([v6 count])
    {
      v22 = self;
      v23 = v6;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      obj = v6;
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(obj);
            }
            v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v12 = _AVLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = [v11 type];
              v14 = [v11 overrideTitle];
              v15 = [v11 identifier];
              *(_DWORD *)buf = 136315906;
              v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
              __int16 v34 = 2112;
              v35 = v13;
              __int16 v36 = 2112;
              v37 = v14;
              __int16 v38 = 2112;
              v39 = v15;
              _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Adding custom row with type: %@, titleOverride: %@, identifier: %@", buf, 0x2Au);
            }
            id v16 = objc_loadWeakRetained((id *)p_routePickingControls);
            v17 = [v11 type];
            v18 = [v11 overrideTitle];
            v19 = [v11 identifier];
            [v16 addCustomRowWithType:v17 titleOverride:v18 identifier:v19];
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v8);
      }

      id v20 = objc_loadWeakRetained((id *)p_routePickingControls);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __65__AVRoutePickerView__addCustomRoutingItemsToRoutePickingControls__block_invoke;
      v25[3] = &unk_1E5FC3408;
      v26 = obj;
      v27 = v22;
      [v20 setCustomRowDidTapHandler:v25];

      v21 = v26;
      v6 = v23;
    }
    else
    {
      v21 = _AVLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
        _os_log_impl(&dword_1B05B7000, v21, OS_LOG_TYPE_DEFAULT, "%s No custom rows to be added to MPMediaControls.", buf, 0xCu);
      }
    }
  }
  else
  {
    v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[AVRoutePickerView _addCustomRoutingItemsToRoutePickingControls]";
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Can't add custom rows to MPMediaControls because MPMediaControls instance doesn't exist.", buf, 0xCu);
    }
  }
}

void __65__AVRoutePickerView__addCustomRoutingItemsToRoutePickingControls__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          v12 = [*(id *)(a1 + 40) customRoutingController];
          [v12 handleCustomActionItemSelected:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (CGRect)_normalizedRect:(CGRect)a3 fromView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  uint64_t v9 = [v8 window];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v9, "convertRect:fromView:", v8, x, y, width, height);
  double v32 = v19;
  double v33 = v18;
  double v30 = v21;
  double v31 = v20;

  double v22 = *MEMORY[0x1E4F1DB28];
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v34.origin.double x = v11;
  v34.origin.double y = v13;
  v34.size.double width = v15;
  v34.size.double height = v17;
  if (!CGRectIsEmpty(v34))
  {
    v35.origin.double x = v11;
    v35.origin.double y = v13;
    v35.size.double width = v15;
    v35.size.double height = v17;
    if (!CGRectIsInfinite(v35))
    {
      double v22 = v33 / v15;
      double v23 = v32 / v17;
      double v24 = v31 / v15;
      double v25 = v30 / v17;
    }
  }

  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (id)_defaultActiveTintColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.3629 green:0.7041 blue:1.001 alpha:1.0];
}

- (BOOL)_isAirPlayOrCustomRouteActive
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v20 = _AVMethodProem(self);
      *(_DWORD *)buf = 138412290;
      double v32 = v20;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "%@ should be called from a background thread", buf, 0xCu);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(AVOutputContext *)self->_outputContext outputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((unint64_t)[*(id *)(*((void *)&v25 + 1) + 8 * i) deviceType] < 2)
        {
          char v9 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v9 = 0;
LABEL_15:

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v10 = [(AVRoutePickerView *)self customRoutingController];
  CGFloat v11 = [v10 authorizedRoutes];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        double v17 = [(AVRoutePickerView *)self customRoutingController];
        LOBYTE(v16) = [v17 isRouteActive:v16];

        if (v16)
        {
          char v18 = 1;
          goto LABEL_25;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  char v18 = 0;
LABEL_25:

  return v9 | v18;
}

- (void)_setupOutputContext
{
  id v3 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v6 = [v3 routingContextUID];

  id v4 = [MEMORY[0x1E4F165D0] outputContextForID:v6];
  outputContext = self->_outputContext;
  self->_outputContext = v4;
}

- (void)_updateAirPlayActive
{
  objc_initWeak(&location, self);
  getAirPlayStatusQueue = self->_getAirPlayStatusQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AVRoutePickerView__updateAirPlayActive__block_invoke;
  v4[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(getAirPlayStatusQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__AVRoutePickerView__updateAirPlayActive__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _isAirPlayOrCustomRouteActive];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__AVRoutePickerView__updateAirPlayActive__block_invoke_2;
    v4[3] = &unk_1E5FC33E0;
    void v4[4] = v2;
    char v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __41__AVRoutePickerView__updateAirPlayActive__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAirPlayActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_registerNotifications
{
  objc_initWeak(&location, self);
  getAirPlayStatusQueue = self->_getAirPlayStatusQueue;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __43__AVRoutePickerView__registerNotifications__block_invoke;
  uint64_t v7 = &unk_1E5FC44F8;
  objc_copyWeak(&v8, &location);
  dispatch_async(getAirPlayStatusQueue, &v4);
  -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E4F16778], 0, 0, &__block_literal_global_54_15628, v4, v5, v6, v7);
  [(AVObservationController *)self->_observationController startObservingNotificationForName:*MEMORY[0x1E4F16770] object:0 notificationCenter:0 observationHandler:&__block_literal_global_56_15629];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __43__AVRoutePickerView__registerNotifications__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVRoutePickerView__registerNotifications__block_invoke_2;
  block[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 _updateAirPlayActive];
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 _customRoutingItemsDidChange];
}

void __43__AVRoutePickerView__registerNotifications__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[58] startObservingNotificationForName:*MEMORY[0x1E4F15F60] object:0 notificationCenter:0 observationHandler:&__block_literal_global_15633];
    [v2[58] startObservingNotificationForName:*MEMORY[0x1E4F15F10] object:0 notificationCenter:0 observationHandler:&__block_literal_global_50_15634];
    [v2[58] startObservingNotificationForName:*MEMORY[0x1E4F15F08] object:0 notificationCenter:0 observationHandler:&__block_literal_global_52_15635];
    id WeakRetained = v2;
  }
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _updateAirPlayActive];
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 _updateAirPlayActive];
}

uint64_t __43__AVRoutePickerView__registerNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _updateAirPlayActive];
}

- (void)_setRoutePickerButtonAlpha:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIButton *)self->_routePickerButton alpha];
  if (v7 != a3)
  {
    if ([(UIViewPropertyAnimator *)self->_buttonHighlightAnimator isRunning]
      && [(UIViewPropertyAnimator *)self->_buttonHighlightAnimator isInterruptible])
    {
      [(UIViewPropertyAnimator *)self->_buttonHighlightAnimator stopAnimation:0];
      [(UIViewPropertyAnimator *)self->_buttonHighlightAnimator finishAnimationAtPosition:2];
    }
    if (([(UIViewPropertyAnimator *)self->_buttonHighlightAnimator isRunning] & 1) == 0)
    {
      if (v4)
      {
        objc_initWeak(&location, self);
        id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __57__AVRoutePickerView__setRoutePickerButtonAlpha_animated___block_invoke;
        v12[3] = &unk_1E5FC41D0;
        objc_copyWeak(v13, &location);
        v13[1] = *(id *)&a3;
        char v9 = (UIViewPropertyAnimator *)[v8 initWithDuration:3 curve:v12 animations:0.25];
        buttonHighlightAnimator = self->_buttonHighlightAnimator;
        self->_buttonHighlightAnimator = v9;

        [(UIViewPropertyAnimator *)self->_buttonHighlightAnimator startAnimation];
        objc_destroyWeak(v13);
        objc_destroyWeak(&location);
      }
      else
      {
        routePickerButton = self->_routePickerButton;
        [(UIButton *)routePickerButton setAlpha:a3];
      }
    }
  }
}

void __57__AVRoutePickerView__setRoutePickerButtonAlpha_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    [WeakRetained[53] setAlpha:*(double *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_routePickerButtonTouchUp:(id)a3
{
}

- (void)_routePickerButtonTouchDragEnter:(id)a3
{
}

- (void)_routePickerButtonTouchDown:(id)a3
{
}

- (void)_routePickerButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVRoutePickerView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(AVRoutePickerView *)self delegate];
    [v7 routePickerViewWillBeginPresentingRoutes:self];
  }
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);

  if (!WeakRetained)
  {
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x3032000000;
    double v30 = __Block_byref_object_copy__15641;
    double v31 = __Block_byref_object_dispose__15642;
    id v32 = 0;
    char v9 = [(AVRoutePickerView *)self routingConfiguration];
    double v10 = v9;
    if (v9 && ![v9 isDefault])
    {
      id v13 = objc_alloc((Class)getMPMediaControlsClass());
      uint64_t v14 = [v10 sharingPolicy];
      uint64_t v12 = [v10 outputContextID];
      uint64_t v15 = [v13 initWithRouteSharingPolicy:v14 routingContextUID:v12];
      uint64_t v16 = (void *)v28[5];
      v28[5] = v15;
    }
    else
    {
      id v11 = objc_alloc_init((Class)getMPMediaControlsClass());
      uint64_t v12 = (void *)v28[5];
      v28[5] = (uint64_t)v11;
    }

    objc_storeWeak((id *)&self->_routePickingControls, (id)v28[5]);
    [(AVRoutePickerView *)self _addCustomRoutingItemsToRoutePickingControls];
    double v17 = [(id)v28[5] configuration];
    objc_msgSend(v17, "setSortByIsVideoRoute:", -[AVRoutePickerView prioritizesVideoDevices](self, "prioritizesVideoDevices"));

    char v18 = [(id)v28[5] configuration];
    NSSelectorFromString(&cfstr_Usegenericdevi.isa);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      double v20 = [(id)v28[5] configuration];
      long long v21 = NSNumber;
      long long v22 = [(AVRoutePickerView *)self customRoutingController];
      long long v23 = [v21 numberWithBool:v22 != 0];
      [v20 setValue:v23 forKey:@"useGenericDevicesIconInHeader"];
    }
    [(id)v28[5] startPrewarming];
    long long v24 = (void *)v28[5];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __46__AVRoutePickerView__routePickerButtonTapped___block_invoke;
    v25[3] = &unk_1E5FC3398;
    objc_copyWeak(&v26, &location);
    void v25[4] = &v27;
    [v24 setDismissHandler:v25];
    [(id)v28[5] present];
    objc_destroyWeak(&v26);

    _Block_object_dispose(&v27, 8);
  }
  objc_destroyWeak(&location);
}

void __46__AVRoutePickerView__routePickerButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [WeakRetained delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [WeakRetained delegate];
      [v4 routePickerViewDidEndPresentingRoutes:WeakRetained];
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (id)topViewControllerForPresentingAlert
{
  id v2 = [(AVRoutePickerView *)self window];
  char v3 = [v2 rootViewController];

  if (v3)
  {
    uint64_t v4 = [v3 presentedViewController];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      do
      {
        id v6 = v5;

        uint64_t v5 = [v6 presentedViewController];

        char v3 = v6;
      }
      while (v5);
    }
    else
    {
      id v6 = v3;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_createOrUpdateRoutePickerButton
{
  [(UIButton *)self->_routePickerButton removeFromSuperview];
  self->_oldSize = (CGSize)*MEMORY[0x1E4F1DB30];
  char v3 = [(AVRoutePickerView *)self customButton];
  routePickerButton = self->_routePickerButton;
  self->_routePickerButton = v3;

  uint64_t v5 = self->_routePickerButton;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    double v7 = self->_routePickerButton;
    self->_routePickerButton = v6;

    [(UIButton *)self->_routePickerButton setAccessibilityIdentifier:@"AirPlay"];
    id v8 = self->_routePickerButton;
    char v9 = AVLocalizedString(@"AirPlay");
    [(UIButton *)v8 setAccessibilityLabel:v9];

    -[UIButton setContentEdgeInsets:](self->_routePickerButton, "setContentEdgeInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UIButton *)self->_routePickerButton setContentHorizontalAlignment:3];
    [(UIButton *)self->_routePickerButton setContentVerticalAlignment:3];
    double v10 = [(AVRoutePickerView *)self customRoutingController];

    if (v10)
    {
      id v11 = @"AVRoutePickerViewCustomDevicesGlyph";
    }
    else
    {
      BOOL v12 = [(AVRoutePickerView *)self prioritizesVideoDevices];
      id v11 = @"AVRoutePickerViewCircularAirPlayGlyph";
      if (v12) {
        id v11 = @"AVRoutePickerViewSquareAirPlayGlyph";
      }
    }
    id v13 = v11;
    uint64_t v14 = [[AVMicaPackage alloc] initWithPackageName:v13 layoutDirection:[(AVRoutePickerView *)self effectiveUserInterfaceLayoutDirection]];
    routePickerButtonMicaPackage = self->_routePickerButtonMicaPackage;
    self->_routePickerButtonMicaPackage = v14;

    [(AVMicaPackage *)self->_routePickerButtonMicaPackage removeCompositingFiltersWithName:@"plusL"];
    uint64_t v16 = [(UIButton *)self->_routePickerButton layer];
    double v17 = [(AVMicaPackage *)self->_routePickerButtonMicaPackage rootLayer];
    [v16 addSublayer:v17];

    uint64_t v5 = self->_routePickerButton;
  }
  [(UIButton *)v5 addTarget:self action:sel__routePickerButtonTapped_ forControlEvents:0x2000];
  char v18 = [(AVRoutePickerView *)self customButton];

  if (!v18)
  {
    [(UIButton *)self->_routePickerButton addTarget:self action:sel__routePickerButtonTouchDown_ forControlEvents:1];
    [(UIButton *)self->_routePickerButton addTarget:self action:sel__routePickerButtonTouchDragEnter_ forControlEvents:16];
    [(UIButton *)self->_routePickerButton addTarget:self action:sel__routePickerButtonTouchUp_ forControlEvents:480];
  }
  [(UIButton *)self->_routePickerButton setPointerInteractionEnabled:1];
  [(UIButton *)self->_routePickerButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AVRoutePickerView *)self addSubview:self->_routePickerButton];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  char v19 = [(UIButton *)self->_routePickerButton topAnchor];
  double v20 = [(AVRoutePickerView *)self topAnchor];
  long long v21 = [v19 constraintEqualToAnchor:v20];
  [v31 addObject:v21];

  long long v22 = [(UIButton *)self->_routePickerButton bottomAnchor];
  long long v23 = [(AVRoutePickerView *)self bottomAnchor];
  long long v24 = [v22 constraintEqualToAnchor:v23];
  [v31 addObject:v24];

  long long v25 = [(UIButton *)self->_routePickerButton leadingAnchor];
  id v26 = [(AVRoutePickerView *)self leadingAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26];
  [v31 addObject:v27];

  long long v28 = [(UIButton *)self->_routePickerButton trailingAnchor];
  uint64_t v29 = [(AVRoutePickerView *)self trailingAnchor];
  double v30 = [v28 constraintEqualToAnchor:v29];
  [v31 addObject:v30];

  [MEMORY[0x1E4F28DC8] activateConstraints:v31];
  [(AVRoutePickerView *)self updateButtonAppearance];
}

- (void)interruptActiveInteractions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained dismiss];
    id WeakRetained = v3;
  }
}

- (void)setCustomRoutingController:(AVCustomRoutingController *)customRoutingController
{
  objc_storeStrong((id *)&self->_customRoutingController, customRoutingController);

  [(AVRoutePickerView *)self _createOrUpdateRoutePickerButton];
}

- (AVCustomRoutingController)customRoutingController
{
  return self->_customRoutingController;
}

- (void)setRoutingConfiguration:(id)a3
{
}

- (id)routingConfiguration
{
  return self->_routingConfiguration;
}

- (void)setPrioritizesVideoDevices:(BOOL)prioritizesVideoDevices
{
  if (self->_prioritizesVideoDevices != prioritizesVideoDevices)
  {
    BOOL v3 = prioritizesVideoDevices;
    self->_prioritizesVideoDevices = prioritizesVideoDevices;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_routePickingControls);
    id v6 = [WeakRetained configuration];
    [v6 setSortByIsVideoRoute:v3];

    [(AVRoutePickerView *)self _createOrUpdateRoutePickerButton];
  }
}

- (BOOL)prioritizesVideoDevices
{
  return self->_prioritizesVideoDevices;
}

- (void)updateButtonAppearance
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVRoutePickerView *)self customButton];

  if (!v3)
  {
    routePickerButton = self->_routePickerButton;
    if ([(AVRoutePickerView *)self isAirPlayActive])
    {
      uint64_t v5 = [(AVRoutePickerView *)self activeTintColor];
      [(UIButton *)routePickerButton setTintColor:v5];
    }
    else
    {
      [(UIButton *)routePickerButton setTintColor:0];
    }
  }
  BOOL v6 = [(AVRoutePickerView *)self isAirPlayActive];
  double v7 = @"off";
  if (v6) {
    double v7 = @"on";
  }
  id v8 = v7;
  char v9 = [(AVRoutePickerView *)self tintColor];
  if ([(AVRoutePickerView *)self isAirPlayActive])
  {
    id v10 = [(AVRoutePickerView *)self activeTintColor];
  }
  else
  {
    id v10 = v9;
  }
  id v11 = v10;
  double v24 = 0.0;
  double v25 = 0.0;
  uint64_t v22 = 0;
  double v23 = 0.0;
  [v10 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];
  BOOL v12 = _AVLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = v25 * 255.0;
    double v14 = v24 * 255.0;
    double v15 = v23 * 255.0;
    uint64_t v16 = v22;
    BOOL v17 = [(AVRoutePickerView *)self isAirPlayActive];
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = "-[AVRoutePickerView updateButtonAppearance]";
    char v18 = @"Inactive";
    __int16 v28 = 2048;
    double v29 = v13;
    if (v17) {
      char v18 = @"Active";
    }
    __int16 v30 = 2048;
    double v31 = v14;
    __int16 v32 = 2048;
    double v33 = v15;
    __int16 v34 = 2048;
    uint64_t v35 = v16;
    __int16 v36 = 2112;
    v37 = v18;
    _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting mica color: (R: %.2f G: %.2f B: %.2f Alpha: %.2f) and state: %@.", buf, 0x3Eu);
  }

  routePickerButtonMicaPackage = self->_routePickerButtonMicaPackage;
  BOOL v20 = [(AVRoutePickerView *)self isAirPlayActive];
  long long v21 = v9;
  if (v20)
  {
    long long v21 = [(AVRoutePickerView *)self activeTintColor];
  }
  -[AVMicaPackage setState:color:](routePickerButtonMicaPackage, "setState:color:", v8, [v21 CGColor]);

  if (v20) {
}
  }

- (void)setCustomButton:(id)a3
{
  uint64_t v5 = (UIButton *)a3;
  p_customButton = &self->_customButton;
  if (self->_customButton != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_customButton, a3);
    p_customButton = (UIButton **)[(AVRoutePickerView *)self _createOrUpdateRoutePickerButton];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_customButton, v5);
}

- (id)customButton
{
  return self->_customButton;
}

- (void)setAirPlayActive:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_airPlayActive != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "NO";
      int v7 = 136315650;
      id v8 = "-[AVRoutePickerView setAirPlayActive:]";
      id v10 = "airPlayActive";
      __int16 v9 = 2080;
      if (v3) {
        BOOL v6 = "YES";
      }
      __int16 v11 = 2080;
      BOOL v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_airPlayActive = v3;
    [(AVRoutePickerView *)self updateButtonAppearance];
  }
}

- (BOOL)isAirPlayActive
{
  return self->_airPlayActive;
}

- (void)setActiveTintColor:(UIColor *)activeTintColor
{
  uint64_t v4 = activeTintColor;
  if (!v4)
  {
    uint64_t v4 = [(AVRoutePickerView *)self _defaultActiveTintColor];
  }
  obuint64_t j = v4;
  if (self->_activeTintColor != v4) {
    objc_storeStrong((id *)&self->_activeTintColor, v4);
  }
  [(AVRoutePickerView *)self updateButtonAppearance];
}

- (UIColor)activeTintColor
{
  return self->_activeTintColor;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  [(AVRoutePickerView *)&v3 didMoveToWindow];
  [(AVRoutePickerView *)self updateButtonAppearance];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  [(AVRoutePickerView *)&v3 tintColorDidChange];
  [(AVRoutePickerView *)self updateButtonAppearance];
}

- (double)baselineOffsetFromBottom
{
  [(UIButton *)self->_routePickerButton intrinsicContentSize];
  [(AVMicaPackage *)self->_routePickerButtonMicaPackage targetSize];

  UIRoundToViewScale();
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(AVMicaPackage *)self->_routePickerButtonMicaPackage targetSize];
  double v3 = v2 * 0.1;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIButton *)self->_routePickerButton intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)AVRoutePickerView;
  [(AVRoutePickerView *)&v28 layoutSubviews];
  [(AVRoutePickerView *)self bounds];
  if (v3 != self->_oldSize.width || v4 != self->_oldSize.height)
  {
    double v6 = v3;
    double v7 = v4;
    self->_oldSize.double width = v3;
    self->_oldSize.double height = v4;
    [(AVMicaPackage *)self->_routePickerButtonMicaPackage unscaledSize];
    double v9 = (44.0 - v8) * 0.5;
    [(AVMicaPackage *)self->_routePickerButtonMicaPackage unscaledSize];
    double v11 = (44.0 - v10) * 0.5;
    [(AVMicaPackage *)self->_routePickerButtonMicaPackage unscaledSize];
    double v13 = fmax((v6 - v12) * 0.5, 0.0);
    if (v13 >= v9) {
      CGFloat v14 = v9;
    }
    else {
      CGFloat v14 = v13;
    }
    [(AVMicaPackage *)self->_routePickerButtonMicaPackage unscaledSize];
    double v16 = fmax((v7 - v15) * 0.5, 0.0);
    if (v16 >= v11) {
      CGFloat v17 = v11;
    }
    else {
      CGFloat v17 = v16;
    }
    [(AVRoutePickerView *)self bounds];
    CGRect v30 = CGRectInset(v29, v14, v17);
    double width = v30.size.width;
    double height = v30.size.height;
    BOOL IsNull = CGRectIsNull(v30);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (!IsNull)
    {
      double v22 = height;
      double v21 = width;
    }
    -[AVMicaPackage setTargetSize:](self->_routePickerButtonMicaPackage, "setTargetSize:", v21, v22);
  }
  double v23 = [(AVRoutePickerView *)self customButton];

  if (!v23)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v24 = [(AVMicaPackage *)self->_routePickerButtonMicaPackage rootLayer];
    double v25 = [(UIButton *)self->_routePickerButton layer];
    [v25 bounds];
    double MidX = CGRectGetMidX(v31);
    uint64_t v27 = [(UIButton *)self->_routePickerButton layer];
    [v27 bounds];
    objc_msgSend(v24, "setPosition:", MidX, CGRectGetMidY(v32));

    [MEMORY[0x1E4F39CF8] commit];
  }
  [(AVRoutePickerView *)self updateButtonAppearance];
}

- (void)dealloc
{
  [(AVObservationController *)self->_observationController stopAllObservation];
  v3.receiver = self;
  v3.super_class = (Class)AVRoutePickerView;
  [(AVRoutePickerView *)&v3 dealloc];
}

- (AVRoutePickerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVRoutePickerView;
  objc_super v3 = [(AVRoutePickerView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    _CommonInit_15688(v3);
  }
  return v4;
}

- (AVRoutePickerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVRoutePickerView;
  objc_super v3 = -[AVRoutePickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    _CommonInit_15688(v3);
  }
  return v4;
}

@end