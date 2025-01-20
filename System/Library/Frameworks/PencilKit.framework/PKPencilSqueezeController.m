@interface PKPencilSqueezeController
- (BOOL)_canSelectTool:(uint64_t *)a1 atIndex:(void *)a2;
- (BOOL)_isPresentedViewController:(uint64_t)a1;
- (BOOL)_onlyShowUndoOrRedo;
- (BOOL)pencilSqueezeAnalyticsControllerIsHovering:(id)a3;
- (double)_paletteViewCenterInRect:(CGFloat)a3 hoverLocation:(CGFloat)a4 paletteViewSize:(CGFloat)a5;
- (double)_paletteViewScale;
- (double)paletteViewFrameForHoverLocation:(double)a3;
- (double)pencilSqueezeAnalyticsControllerHoverZOffset:(id)a3;
- (id)_currentFirstResponder;
- (id)_currentUndoManager;
- (id)_hoverViewInPalette:(id *)a1;
- (id)_loggableNotificationDescription:(uint64_t)a1;
- (id)hitTest:(void *)a3 fromView:(double)a4 withEvent:(double)a5;
- (id)pencilSqueezeAnalyticsControllerHoverSettings:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (uint64_t)_keyWindow;
- (uint64_t)_toolPickerForKeyWindow;
- (uint64_t)_updatePalettePositionWithHoverLocation:(double)a3;
- (uint64_t)_updatePaletteViewPresentationState;
- (uint64_t)initWithContainerView:(void *)a3 rootViewController:(void *)a4 textEffectsWindowObserver:;
- (void)_didChangePaletteViewToVisible;
- (void)_didSelectTool:(uint64_t *)a1 atIndex:(void *)a2;
- (void)_dismissPopovers;
- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3;
- (void)_handleKeyboardWillHideNotification:(id)a3;
- (void)_handleKeyboardWillShowNotification:(id)a3;
- (void)_handleSceneDidEnterBackgroundNotification:(id)a3;
- (void)_handleSceneWillEnterForegroundNotification:(id)a3;
- (void)_hidePaletteViewAfterDelay:(void *)a1;
- (void)_presentViewControllerAsPopover:(void *)a3 sourceView:;
- (void)_setPaletteViewVisible:(uint64_t)a1 notify:(uint64_t)a2 didChangeHandler:(void *)a3;
- (void)_togglePresentViewControllerAsPopover:(void *)a3 sourceView:;
- (void)_updatePalettePosition;
- (void)_updateToolPickerVisibilityWithCompletion:(uint64_t *)a1;
- (void)_updateUIWithSqueeze:(void *)a3 customHoverPoint:(int)a4 animated:;
- (void)_updateUserInterfaceStyle;
- (void)imageWandOnboardingControllerDidHideView:(id)a3;
- (void)keyWindowDidChangeBounds;
- (void)pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4;
- (void)pencilInteraction:(id)a3 didReceiveTap:(id)a4;
- (void)pencilSettingsDidChange;
- (void)performSqueezeAction;
- (void)setMiniPaletteVisible:(double)a3 hoverLocation:(double)a4;
- (void)updateUserInterfaceStyle;
@end

@implementation PKPencilSqueezeController

- (uint64_t)initWithContainerView:(void *)a3 rootViewController:(void *)a4 textEffectsWindowObserver:
{
  v84[4] = *MEMORY[0x1E4F143B8];
  id obj = a2;
  id v75 = a3;
  id v73 = a4;
  if (a1)
  {
    v82.receiver = a1;
    v82.super_class = (Class)PKPencilSqueezeController;
    v7 = (id *)objc_msgSendSuper2(&v82, sel_init);
    uint64_t v8 = (uint64_t)v7;
    if (v7)
    {
      location = v7 + 1;
      objc_storeWeak(v7 + 1, obj);
      objc_storeWeak((id *)(v8 + 232), v75);
      objc_storeStrong((id *)(v8 + 240), a4);
      *(unsigned char *)(v8 + 216) = 0;
      *(void *)(v8 + 144) = PKSqueezePaletteViewHideDelay;
      *(double *)(v8 + 24) = PKSqueezePaletteViewSize();
      *(void *)(v8 + 32) = v9;
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      v11 = *(void **)(v8 + 64);
      *(void *)(v8 + 64) = v10;

      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 8));
      [WeakRetained addLayoutGuide:*(void *)(v8 + 64)];

      v13 = [*(id *)(v8 + 64) widthAnchor];
      uint64_t v14 = [v13 constraintEqualToConstant:0.0];
      v15 = *(void **)(v8 + 72);
      *(void *)(v8 + 72) = v14;

      v16 = [*(id *)(v8 + 64) heightAnchor];
      uint64_t v17 = [v16 constraintEqualToConstant:0.0];
      v18 = *(void **)(v8 + 80);
      *(void *)(v8 + 80) = v17;

      v71 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v19 = *(void *)(v8 + 80);
      v84[0] = *(void *)(v8 + 72);
      v84[1] = v19;
      v20 = [*(id *)(v8 + 64) topAnchor];
      id v21 = objc_loadWeakRetained((id *)(v8 + 8));
      v22 = [v21 topAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      v84[2] = v23;
      v24 = [*(id *)(v8 + 64) leadingAnchor];
      id v25 = objc_loadWeakRetained((id *)(v8 + 8));
      v26 = [v25 leadingAnchor];
      v27 = [v24 constraintEqualToAnchor:v26];
      v84[3] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
      [v71 activateConstraints:v28];

      uint64_t v29 = +[PKPencilInteraction fallbackPencilInteraction]();
      v30 = *(void **)(v8 + 128);
      *(void *)(v8 + 128) = v29;

      [*(id *)(v8 + 128) setDelegate:v8];
      id v31 = objc_loadWeakRetained((id *)(v8 + 8));
      [v31 addInteraction:*(void *)(v8 + 128)];

      uint64_t v32 = *(void *)(v8 + 128);
      BOOL v33 = -[PKPencilSqueezeController _onlyShowUndoOrRedo]((uint64_t *)v8);
      if (v32) {
        *(unsigned char *)(v32 + 136) = !v33;
      }
      v34 = objc_alloc_init(PKPencilSqueezeContainerViewOverlay);
      v35 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = v34;

      [*(id *)(v8 + 120) setTranslatesAutoresizingMaskIntoConstraints:0];
      id v36 = objc_loadWeakRetained(location);
      [v36 addSubview:*(void *)(v8 + 120)];

      v63 = (void *)MEMORY[0x1E4F28DC8];
      v70 = [*(id *)(v8 + 120) topAnchor];
      id v72 = objc_loadWeakRetained(location);
      v69 = [v72 topAnchor];
      v68 = [v70 constraintEqualToAnchor:v69];
      v83[0] = v68;
      v66 = [*(id *)(v8 + 120) leadingAnchor];
      id v67 = objc_loadWeakRetained(location);
      v65 = [v67 leadingAnchor];
      v64 = [v66 constraintEqualToAnchor:v65];
      v83[1] = v64;
      v37 = [*(id *)(v8 + 120) bottomAnchor];
      id v38 = objc_loadWeakRetained(location);
      v39 = [v38 bottomAnchor];
      v40 = [v37 constraintEqualToAnchor:v39];
      v83[2] = v40;
      v41 = [*(id *)(v8 + 120) trailingAnchor];
      id v42 = objc_loadWeakRetained(location);
      v43 = [v42 trailingAnchor];
      v44 = [v41 constraintEqualToAnchor:v43];
      v83[3] = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:4];
      [v63 activateConstraints:v45];

      id v46 = objc_alloc_init(MEMORY[0x1E4FB1800]);
      v47 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = v46;

      id v48 = objc_loadWeakRetained(location);
      [v48 addGestureRecognizer:*(void *)(v8 + 56)];

      objc_initWeak(&from, (id)v8);
      uint64_t v49 = +[PKHoverSettings sharedSettings];
      v50 = *(void **)(v8 + 96);
      *(void *)(v8 + 96) = v49;

      v51 = [PKUIPencilInteractionObserver alloc];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke;
      v79[3] = &unk_1E64C5998;
      objc_copyWeak(&v80, &from);
      v52 = -[PKUIPencilInteractionObserver initWithPrefersPencilOnlyDrawsDidChangeHandler:](v51, v79);
      v53 = *(void **)(v8 + 104);
      *(void *)(v8 + 104) = v52;

      v54 = [PKAutoRefineSettingsObserver alloc];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_3;
      v77[3] = &unk_1E64C6690;
      objc_copyWeak(&v78, &from);
      v55 = -[PKAutoRefineSettingsObserver initWithHandler:](v54, v77);
      v56 = *(void **)(v8 + 112);
      *(void *)(v8 + 112) = v55;

      v57 = -[PKPencilSqueezeAnalyticsController initWithDelegate:]((id *)[PKPencilSqueezeAnalyticsController alloc], (void *)v8);
      v58 = *(void **)(v8 + 248);
      *(void *)(v8 + 248) = v57;

      v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v59 addObserver:v8 selector:sel__handleKeyboardWillHideNotification_ name:*MEMORY[0x1E4FB2C50] object:0];
      [v59 addObserver:v8 selector:sel__handleKeyboardWillShowNotification_ name:*MEMORY[0x1E4FB2C58] object:0];
      [v59 addObserver:v8 selector:sel__handleSceneWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2EB0] object:0];
      [v59 addObserver:v8 selector:sel__handleSceneDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2E90] object:0];
      [v59 addObserver:v8 selector:sel__handleHandwritingEducationPaneSettingsDidChange_ name:@"PKHandwritingEducationPaneSettingsDidChangeNotification" object:0];
      v60 = objc_alloc_init(PKPencilSqueezeUserDefaults);
      v61 = *(void **)(v8 + 192);
      *(void *)(v8 + 192) = v60;

      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](v8, 0, 0, 1);
      objc_destroyWeak(&v78);
      objc_destroyWeak(&v80);
      objc_destroyWeak(&from);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_onlyShowUndoOrRedo
{
  v1 = -[PKPencilSqueezeController _toolPickerForKeyWindow](a1);
  v2 = [v1 _tools];
  uint64_t v3 = [v2 count];

  return v3 == 0;
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_2;
  v1[3] = &unk_1E64C5998;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  PKPerformOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*((unsigned char *)WeakRetained + 216))
    {
      -[PKPencilSqueezeControllerPaletteViewDelegateProxy pencilInteractionSettingsDidChange](WeakRetained[11]);
    }
    else
    {
      id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = *((unsigned __int8 *)v4 + 216);
        *(_DWORD *)buf = 67109120;
        int v6 = v3;
        _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Ignore pencil interaction settings did change, paletteViewVisible: %{BOOL}d", buf, 8u);
      }
    }
    id WeakRetained = v4;
  }
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_4;
  v4[3] = &unk_1E64C5998;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*((unsigned char *)WeakRetained + 216))
    {
      -[PKPencilSqueezeControllerPaletteViewDelegateProxy autoRefineSettingsDidChange](WeakRetained[11]);
    }
    else
    {
      id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = *((unsigned __int8 *)v4 + 216);
        *(_DWORD *)buf = 67109120;
        int v6 = v3;
        _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Ignore AutoRefine settings did change, paletteViewVisible: %{BOOL}d", buf, 8u);
      }
    }
    id WeakRetained = v4;
  }
}

- (id)_loggableNotificationDescription:(uint64_t)a1
{
  if (a1)
  {
    id v2 = NSString;
    id v3 = a2;
    v4 = [v3 name];
    id v5 = [v3 object];
    int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = [v3 object];

    uint64_t v9 = [v2 stringWithFormat:@"notificationName:%@ object:<%@:%p>", v4, v7, v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_handleSceneWillEnterForegroundNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Scene will enter foreground, notification: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_handleSceneDidEnterBackgroundNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    *(_DWORD *)buf = 138477827;
    v12 = v6;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Scene did enter background, notification: %{private}@", buf, 0xCu);
  }
  int v7 = [v4 object];
  uint64_t v8 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)self);
  uint64_t v9 = [v8 windowScene];

  if (v7 == v9 && self->_paletteViewVisible)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKPencilSqueezeController__handleSceneDidEnterBackgroundNotification___block_invoke;
    v10[3] = &unk_1E64C61C0;
    v10[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v10);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 0);
  }
}

- (uint64_t)_keyWindow
{
  if (a1)
  {
    -[PKTextEffectsWindowObserver keyWindow](a1[30]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

void __72__PKPencilSqueezeController__handleSceneDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
}

- (void)_setPaletteViewVisible:(uint64_t)a1 notify:(uint64_t)a2 didChangeHandler:(void *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1 && *(unsigned __int8 *)(a1 + 216) != a2)
  {
    if (!*(unsigned char *)(a1 + 216)
      && a2
      && (id v6 = objc_loadWeakRetained((id *)(a1 + 224)),
          char v7 = objc_opt_respondsToSelector(),
          v6,
          (v7 & 1) != 0)
      && (id v8 = objc_loadWeakRetained((id *)(a1 + 224)),
          char v9 = [v8 pencilSqueezeControllerCanShowPaletteView:a1],
          v8,
          (v9 & 1) == 0))
    {
      v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "Delegate doesn't want to show palette view", (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 224));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 67109120;
          int v22 = a2;
          _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Notify palette view visibility will change, toVisible: %{BOOL}d", (uint8_t *)&v21, 8u);
        }

        id v13 = objc_loadWeakRetained((id *)(a1 + 224));
        [v13 pencilSqueezeControllerWillChangePaletteViewVisibility:a1 toVisible:a2];
      }
      *(unsigned char *)(a1 + 216) = a2;
      uint64_t v14 = *(void *)(a1 + 128);
      BOOL v15 = -[PKPencilSqueezeController _onlyShowUndoOrRedo]((uint64_t *)a1);
      if (v14) {
        *(unsigned char *)(v14 + 136) = !v15;
      }
      id v16 = objc_loadWeakRetained((id *)(a1 + 224));
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 67109120;
          int v22 = a2;
          _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Notify palette view visibility did change, toVisible: %{BOOL}d", (uint8_t *)&v21, 8u);
        }

        id v19 = objc_loadWeakRetained((id *)(a1 + 224));
        [v19 pencilSqueezeControllerDidChangePaletteViewVisibility:a1];
      }
      if (v5) {
        v5[2](v5);
      }
    }
  }
}

- (void)_updateUIWithSqueeze:(void *)a3 customHoverPoint:(int)a4 animated:
{
  v140[5] = *MEMORY[0x1E4F143B8];
  id v114 = a2;
  id v113 = a3;
  if (!a1) {
    goto LABEL_83;
  }
  id v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 216);
    id v4 = [v114 hoverPose];
    uint64_t v5 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    id v10 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    char v11 = [v10 windowScene];
    *(_DWORD *)buf = 67110403;
    *(_DWORD *)v133 = v9;
    *(_WORD *)&v133[4] = 2048;
    *(void *)&v133[6] = v114;
    *(_WORD *)&v133[14] = 2113;
    *(void *)&v133[16] = v4;
    __int16 v134 = 2048;
    id v135 = v113;
    __int16 v136 = 2113;
    uint64_t v137 = v5;
    __int16 v138 = 2113;
    v139 = v11;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Update UI, visible: %{BOOL}d, squeeze: %p, hover pose: %{private}@ custom hover point: %p, window: %{private}@, scene: %{private}@", buf, 0x3Au);
  }
  v12 = *(void **)(a1 + 16);
  if (!*(unsigned char *)(a1 + 216))
  {
    if (v12)
    {
      id v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Hide mini palette", buf, 2u);
      }

      -[PKPencilSqueezeController _dismissPopovers]((id *)a1);
      -[PKPencilSqueezeControllerPaletteViewDelegateProxy dismissEyeDropper](*(void *)(a1 + 88));
    }
LABEL_62:
    objc_initWeak((id *)buf, (id)a1);
    [*(id *)(a1 + 120) setHidden:*(unsigned char *)(a1 + 216) == 0];
    int v86 = *(unsigned __int8 *)(a1 + 216);
    if (*(unsigned char *)(a1 + 216))
    {
      v124[0] = MEMORY[0x1E4F143A8];
      v124[1] = 3221225472;
      v124[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_52;
      v124[3] = &unk_1E64C79C8;
      id v4 = &v125;
      objc_copyWeak(&v125, (id *)buf);
      v87 = v124;
    }
    else
    {
      v87 = 0;
    }
    v88 = *(void **)(a1 + 120);
    if (v88) {
      objc_setProperty_nonatomic_copy(v88, v85, v87, 416);
    }
    int v89 = *(unsigned __int8 *)(a1 + 216);
    if (*(unsigned char *)(a1 + 216))
    {
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_2;
      v122[3] = &unk_1E64C69C8;
      uint64_t v5 = (uint64_t)&v123;
      objc_copyWeak(&v123, (id *)buf);
      v90 = v122;
    }
    else
    {
      v90 = 0;
    }
    v91 = *(void **)(a1 + 120);
    if (v91) {
      objc_setProperty_nonatomic_copy(v91, v85, v90, 408);
    }
    unsigned int v92 = *(unsigned __int8 *)(a1 + 216);
    if (*(unsigned char *)(a1 + 216)) {
      double v93 = 1.0;
    }
    else {
      double v93 = 0.05;
    }
    uint64_t v94 = *(void *)(a1 + 152);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_3;
    v120[3] = &unk_1E64C5998;
    objc_copyWeak(&v121, (id *)buf);
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_4;
    v118[3] = &unk_1E64C79F0;
    objc_copyWeak(&v119, (id *)buf);
    -[PKSqueezePaletteViewPresentationHandle animateToPaletteViewOpacity:paletteViewScale:animated:presentationValueHandler:completion:](v94, a4, v120, v118, (double)v92, v93);
    if (*(unsigned char *)(a1 + 216))
    {
      v95 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
      v96 = [v95 _windowScene];
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_5;
      v115[3] = &unk_1E64C66B8;
      objc_copyWeak(&v117, (id *)buf);
      id v97 = v96;
      id v116 = v97;
      -[PKPencilSqueezeController _updateToolPickerVisibilityWithCompletion:]((uint64_t *)a1, v115);

      objc_destroyWeak(&v117);
    }
    else
    {
      -[PKPencilSqueezeController _updateToolPickerVisibilityWithCompletion:]((uint64_t *)a1, 0);
    }
    objc_destroyWeak(&v119);
    objc_destroyWeak(&v121);
    if (v89) {
      objc_destroyWeak((id *)v5);
    }
    if (v86) {
      objc_destroyWeak((id *)&v4->isa);
    }
    objc_destroyWeak((id *)buf);
    goto LABEL_83;
  }
  [v12 removeFromSuperview];
  id v13 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  v109 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  v111 = -[PKPencilSqueezeController _currentUndoManager]((uint64_t *)a1);
  uint64_t v14 = (void *)MEMORY[0x1E4FB1EB0];
  id v4 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  LODWORD(v14) = objc_msgSend(v14, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[NSObject semanticContentAttribute](v4, "semanticContentAttribute")) == 0;

  v110 = objc_alloc_init(PKSqueezePaletteViewLayoutFactory);
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke;
  v126[3] = &unk_1E64C79A0;
  v126[4] = a1;
  v112 = -[PKSqueezePaletteViewLayoutFactory makeInitialLayoutWithToolPicker:undoManager:paletteViewStartAngleProvider:isLTR:]((uint64_t *)v110, v109, v111, v126, (int)v14);
  if (v112)
  {
    v106 = objc_alloc_init(PKPaletteBackgroundViewFactory);
    v103 = objc_alloc_init(PKPaletteBackgroundColorFactory);
    v102 = -[PKPaletteBackgroundColorFactory makeBackgroundColor](v103);
    v105 = -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v106, @"com.apple.PencilKit.PKSqueezePaletteView", v102);
    [v105 setUserInteractionEnabled:0];
    id v104 = v114;
    BOOL v15 = [v104 hoverPose];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      v24 = *(void **)(a1 + 56);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      [v24 azimuthAngleInView:WeakRetained];
    }
    else
    {
      id WeakRetained = [v104 hoverPose];
      [WeakRetained azimuthAngle];
    }
    uint64_t v25 = v18;

    *(void *)(a1 + 184) = v25;
    v26 = [PKSqueezePaletteView alloc];
    v27 = -[PKSqueezePaletteView initWithBackgroundView:radius:contentHeight:layoutFactory:azimuth:]((id *)&v26->super.super.super.isa, v105, v110, *(double *)&PKSqueezePaletteViewRadius, *(double *)&PKSqueezePaletteViewContentHeight, *(double *)(a1 + 184));
    v28 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v27;

    uint64_t v29 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy initWithController:paletteView:]((id *)[PKPencilSqueezeControllerPaletteViewDelegateProxy alloc], (void *)a1, *(void **)(a1 + 16));
    v30 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v29;

    -[PKSqueezePaletteView setDelegate:](*(void *)(a1 + 16), *(void **)(a1 + 88));
    [*(id *)(a1 + 16) setTintAdjustmentMode:1];
    v108 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
    if (v108)
    {
      id v31 = objc_alloc_init(PKSqueezePaletteViewContext);
      BOOL v33 = [v108 _tools];
      if (v31) {
        objc_setProperty_nonatomic_copy(v31, v32, v33, 16);
      }

      v34 = [v108 selectedTool];
      -[PKMathResultAttribution setString:]((uint64_t)v31, v34);

      v35 = [v108 selectedTool];
      id v36 = PKDisplayColorForTool(v35);
      -[PKSqueezePaletteViewContext setSelectedColor:]((uint64_t)v31, v36);

      v101 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      v100 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v101, @"black");
      v140[0] = v100;
      v99 = [MEMORY[0x1E4FB1618] colorWithRed:0.0823529412 green:0.494117647 blue:0.984313725 alpha:1.0];
      v37 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v99, @"blue");
      v140[1] = v37;
      id v38 = [MEMORY[0x1E4FB1618] colorWithRed:0.325490196 green:0.843137255 blue:0.411764706 alpha:1.0];
      v39 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v38, @"green");
      v140[2] = v39;
      v40 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.815686275 blue:0.188235294 alpha:1.0];
      v41 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v40, @"yellow");
      v140[3] = v41;
      id v42 = [MEMORY[0x1E4FB1618] colorWithRed:0.988235294 green:0.192156863 blue:0.258823529 alpha:1.0];
      v43 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v42, @"red");
      v140[4] = v43;
      v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:5];

      v44 = (void *)MEMORY[0x1E4F1C978];
      v45 = [v98 reverseObjectEnumerator];
      id v46 = [v45 allObjects];
      v47 = [v44 arrayWithArray:v46];

      if (v31) {
        objc_setProperty_nonatomic_copy(v31, v48, v47, 32);
      }
      uint64_t v49 = [MEMORY[0x1E4F28B50] mainBundle];
      v50 = [v49 bundleIdentifier];
      char v51 = [v50 isEqualToString:@"com.apple.mobilenotes"];

      if (v51)
      {
        BOOL v52 = 1;
      }
      else
      {
        v53 = -[PKPencilSqueezeController _currentFirstResponder]((uint64_t *)a1);
        if (objc_opt_respondsToSelector())
        {
          LODWORD(v54) = [v53 _supportsCanvasElements:v108];
        }
        else
        {
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          v55 = [v108 _observers];
          uint64_t v54 = [v55 countByEnumeratingWithState:&v127 objects:buf count:16];
          if (v54)
          {
            uint64_t v56 = *(void *)v128;
            while (2)
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v128 != v56) {
                  objc_enumerationMutation(v55);
                }
                v58 = *(void **)(*((void *)&v127 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  LODWORD(v54) = [v58 _supportsCanvasElements:v108];
                  goto LABEL_36;
                }
              }
              uint64_t v54 = [v55 countByEnumeratingWithState:&v127 objects:buf count:16];
              if (v54) {
                continue;
              }
              break;
            }
          }
LABEL_36:
        }
        BOOL v52 = v54 != 0;
      }
      if (v31) {
        v31->_supportsCanvasElements = v52;
      }
    }
    else
    {
      id v31 = 0;
    }

    v60 = *(void **)(a1 + 16);
    if (v60) {
      objc_setProperty_nonatomic_copy(v60, v59, v31, 576);
    }

    -[PKSqueezePaletteView setCurrentLayout:](*(void *)(a1 + 16), v112);
    -[PKPencilSqueezeController _updateUserInterfaceStyle](a1);
    [*(id *)(a1 + 16) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v61 = objc_loadWeakRetained((id *)(a1 + 8));
    [v61 addSubview:*(void *)(a1 + 16)];

    id v62 = v104;
    v63 = v62;
    if (v62)
    {
      v64 = [v62 hoverPose];
      BOOL v65 = v64 != 0;
    }
    else
    {
      BOOL v65 = [*(id *)(a1 + 56) state] == 1 || objc_msgSend(*(id *)(a1 + 56), "state") == 2;
    }

    *(unsigned char *)(a1 + 160) = v65;
    id v66 = v63;
    id v67 = [v66 hoverPose];
    BOOL v68 = v67 == 0;

    if (v68)
    {
      id v72 = *(void **)(a1 + 56);
      v69 = objc_loadWeakRetained((id *)(a1 + 8));
      [v72 locationInView:v69];
    }
    else
    {
      v69 = [v66 hoverPose];
      [v69 location];
    }
    CGFloat v73 = v70;
    CGFloat v74 = v71;

    *(CGFloat *)(a1 + 168) = v73;
    *(CGFloat *)(a1 + 176) = v74;
    if (*(unsigned char *)(a1 + 160))
    {
      [(PKPencilSqueezeUserDefaults *)*(void *)(a1 + 192) saveLastPaletteHoverLocation:v74];
      *(CFTimeInterval *)(a1 + 200) = CACurrentMediaTime();
    }
    if (v113)
    {
      [v113 CGPointValue];
      [(PKPencilSqueezeController *)a1 _updatePalettePositionWithHoverLocation:v76];
    }
    else
    {
      -[PKPencilSqueezeController _updatePalettePosition](a1);
    }
    uint64_t v5 = MEMORY[0x1E4F28DC8];
    v77 = [*(id *)(a1 + 16) widthAnchor];
    id v4 = [v77 constraintEqualToConstant:*(double *)(a1 + 24)];
    v131[0] = v4;
    id v78 = [*(id *)(a1 + 16) heightAnchor];
    v79 = [v78 constraintEqualToConstant:*(double *)(a1 + 32)];
    v131[1] = v79;
    id v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
    [(id)v5 activateConstraints:v80];

    v81 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 160);
      id v4 = NSStringFromCGPoint(*(CGPoint *)(a1 + 168));
      uint64_t v82 = *(void *)(a1 + 184);
      *(_DWORD *)buf = 67110147;
      *(_DWORD *)v133 = v5;
      *(_WORD *)&v133[4] = 2113;
      *(void *)&v133[6] = v4;
      *(_WORD *)&v133[14] = 2049;
      *(void *)&v133[16] = v82;
      __int16 v134 = 2113;
      id v135 = v109;
      __int16 v136 = 2113;
      uint64_t v137 = (uint64_t)v111;
      _os_log_impl(&dword_1C44F8000, v81, OS_LOG_TYPE_DEFAULT, "Show mini palette, hovering: %{BOOL}d, location: %{private}@, azimuth: %{private}.2f, toolPicker: %{private}@, undoManager: %{private}@", buf, 0x30u);
    }
    if (!*(void *)(a1 + 152))
    {
      v83 = -[PKSqueezePaletteViewPresentationHandle initWithPaletteViewOpacityPresentationValue:paletteViewScalePresentationValue:]([PKSqueezePaletteViewPresentationHandle alloc], 0.0, 0.05);
      v84 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v83;
    }
    -[PKPencilSqueezeController _updatePaletteViewPresentationState](a1);

    uint64_t v23 = v103;
  }
  else
  {
    v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v20;
      int v21 = [v111 canUndo];
      int v22 = [v111 canRedo];
      *(_DWORD *)buf = 138478595;
      *(void *)v133 = v109;
      *(_WORD *)&v133[8] = 2113;
      *(void *)&v133[10] = v111;
      *(_WORD *)&v133[18] = 1024;
      *(_DWORD *)&v133[20] = v21;
      __int16 v134 = 1024;
      LODWORD(v135) = v22;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Unable to display mini palette, toolPicker: %{private}@, undoManager: %{private}@, canUndo: %{BOOL}d, canRedo: %{BOOL}d", buf, 0x22u);
      uint64_t v23 = (PKPaletteBackgroundColorFactory *)v4;
      v106 = (PKPaletteBackgroundViewFactory *)v4;
    }
    else
    {
      v106 = (PKPaletteBackgroundViewFactory *)v20;
      uint64_t v23 = (PKPaletteBackgroundColorFactory *)v20;
    }
  }

  if (v112) {
    goto LABEL_62;
  }
LABEL_83:
}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    *(_DWORD *)buf = 138477827;
    int v9 = v6;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard will show, notification: %{private}@", buf, 0xCu);
  }
  if (self->_paletteViewVisible)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PKPencilSqueezeController__handleKeyboardWillShowNotification___block_invoke;
    v7[3] = &unk_1E64C61C0;
    v7[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v7);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }
}

void __65__PKPencilSqueezeController__handleKeyboardWillShowNotification___block_invoke(uint64_t a1)
{
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    *(_DWORD *)buf = 138477827;
    int v9 = v6;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard will hide, notification: %{private}@", buf, 0xCu);
  }
  if (self->_paletteViewVisible)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__PKPencilSqueezeController__handleKeyboardWillHideNotification___block_invoke;
    v7[3] = &unk_1E64C61C0;
    v7[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v7);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }
}

void __65__PKPencilSqueezeController__handleKeyboardWillHideNotification___block_invoke(uint64_t a1)
{
}

- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_paletteViewVisible)
  {
    paletteViewDelegateProxy = self->_paletteViewDelegateProxy;
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy handwritingEducationPaneSettingsDidChange]((id *)&paletteViewDelegateProxy->super.isa);
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL paletteViewVisible = self->_paletteViewVisible;
      v7[0] = 67109120;
      v7[1] = paletteViewVisible;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignore handwriting education pane settings did change, paletteViewVisible: %{BOOL}d", (uint8_t *)v7, 8u);
    }
  }
}

- (void)keyWindowDidChangeBounds
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
      [v3 bounds];
      id v4 = NSStringFromCGRect(v11);
      int v5 = *(unsigned __int8 *)(a1 + 216);
      int v6 = 138478083;
      char v7 = v4;
      __int16 v8 = 1024;
      int v9 = v5;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Key window bounds did change to: %{private}@, paletteVisible: %{BOOL}d", (uint8_t *)&v6, 0x12u);
    }
    -[PKPencilSqueezeController _updatePalettePosition](a1);
  }
}

- (void)_updatePalettePosition
{
  id v2 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4 + -40.0;
  double v8 = v6 + -50.0;
  if (CACurrentMediaTime() - *(double *)(a1 + 200) >= *(double *)&PKSqueezePaletteViewLastHoverLocationSavedTimeout)
  {
    id v13 = 0;
  }
  else
  {
    -[PKPencilSqueezeUserDefaults loadLastPaletteHoverLocation](*(void *)(a1 + 192));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15.origin.x = 20.0;
  v15.origin.y = 30.0;
  v15.size.width = v7;
  v15.size.height = v6 + -50.0;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = 20.0;
  v16.origin.y = 30.0;
  v16.size.width = v7;
  v16.size.height = v8;
  double MidY = CGRectGetMidY(v16);
  if (v13)
  {
    objc_msgSend(v13, "CGPointValue", MidY);
    double MidX = v12;
  }
  else
  {
    double v11 = MidY;
  }
  if (*(unsigned char *)(a1 + 160))
  {
    double MidX = *(double *)(a1 + 168);
    double v11 = *(double *)(a1 + 176);
  }
  [(PKPencilSqueezeController *)a1 _updatePalettePositionWithHoverLocation:v11];
}

- (void)updateUserInterfaceStyle
{
  if (a1)
  {
    id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Update UI style", v3, 2u);
    }

    -[PKPencilSqueezeController _updateUserInterfaceStyle](a1);
  }
}

- (void)_updateUserInterfaceStyle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 216))
  {
    id v2 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
    double v3 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    double v4 = [v3 traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v2)
    {
      if ([v2 overrideUserInterfaceStyle]) {
        uint64_t v5 = [v2 overrideUserInterfaceStyle];
      }
      double v7 = *(void **)(a1 + 16);
      double v6 = (uint64_t *)(a1 + 16);
      [v7 setOverrideUserInterfaceStyle:v5];
      uint64_t v8 = [v2 colorUserInterfaceStyle];
    }
    else
    {
      int v9 = *(void **)(a1 + 16);
      double v6 = (uint64_t *)(a1 + 16);
      [v9 setOverrideUserInterfaceStyle:v5];
      uint64_t v8 = 0;
    }
    -[PKSqueezePaletteView setColorUserInterfaceStyle:](*v6, v8);
    uint64_t v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *v6;
      if (*v6) {
        uint64_t v11 = *(void *)(v11 + 584);
      }
      int v12 = 134283777;
      uint64_t v13 = v5;
      __int16 v14 = 2049;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Update palette UI style: %{private}ld, color UI style: %{private}ld", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)performSqueezeAction
{
  if (a1)
  {
    id v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Perform squeeze action", buf, 2u);
    }

    BOOL v3 = *(unsigned char *)(a1 + 216) == 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__PKPencilSqueezeController_performSqueezeAction__block_invoke;
    v4[3] = &unk_1E64C61C0;
    void v4[4] = a1;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, v3, v4);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
    if (*(unsigned char *)(a1 + 216)) {
      -[PKPencilSqueezeController _didChangePaletteViewToVisible](a1);
    }
  }
}

void __49__PKPencilSqueezeController_performSqueezeAction__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 216)) {
    -[PKPencilSqueezeAnalyticsController didHideMiniPaletteBySqueezingAgain](*(void *)(v1 + 248));
  }
}

- (void)_didChangePaletteViewToVisible
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2)
    {
      id v3 = *(id *)(v2 + 568);
      int IsUndoRedoLayout = PKSqueezePaletteViewLayoutIsUndoRedoLayout(v3);

      uint64_t v5 = *(void *)(a1 + 248);
      [(PKPencilSqueezeAnalyticsController *)v5 didShowMiniPaletteIsUndoRedoPalette:IsUndoRedoLayout];
    }
    else
    {
      double v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v7 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_FAULT, "Palette view shouldn't be nil when calling this method.", v7, 2u);
      }
    }
  }
}

- (void)pencilSettingsDidChange
{
  if (a1)
  {
    uint64_t v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Pencil settings did change", buf, 2u);
    }

    if (*(unsigned char *)(a1 + 216))
    {
      if ([MEMORY[0x1E4FB1A80] preferredSqueezeAction] != 5)
      {
        v3[0] = MEMORY[0x1E4F143A8];
        v3[1] = 3221225472;
        v3[2] = __52__PKPencilSqueezeController_pencilSettingsDidChange__block_invoke;
        v3[3] = &unk_1E64C61C0;
        v3[4] = a1;
        -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, 0, v3);
        -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
      }
    }
  }
}

void __52__PKPencilSqueezeController_pencilSettingsDidChange__block_invoke(uint64_t a1)
{
}

- (void)setMiniPaletteVisible:(double)a3 hoverLocation:(double)a4
{
  if (a1)
  {
    int v6 = a2;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__PKPencilSqueezeController_setMiniPaletteVisible_hoverLocation___block_invoke;
    v9[3] = &unk_1E64C61C0;
    v9[4] = a1;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, a2, v9);
    if (v6)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a3, a4);
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, v8, 1);

      -[PKPencilSqueezeController _didChangePaletteViewToVisible](a1);
    }
    else
    {
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
    }
  }
}

void __65__PKPencilSqueezeController_setMiniPaletteVisible_hoverLocation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 216)) {
    -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByTappingOutsideOnScreen](*(void *)(v1 + 248));
  }
}

- (void)_hidePaletteViewAfterDelay:(void *)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v9 = a2;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Hide palette view after delay: %.2f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPencilSqueezeController__hidePaletteViewAfterDelay___block_invoke;
  block[3] = &unk_1E64C5998;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __56__PKPencilSqueezeController__hidePaletteViewAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(PKPencilSqueezeController *)(uint64_t)WeakRetained setMiniPaletteVisible:*MEMORY[0x1E4F1DAD8] hoverLocation:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
}

- (id)hitTest:(void *)a3 fromView:(double)a4 withEvent:(double)a5
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    uint64_t v11 = [*(id *)(a1 + 16) window];
    int v12 = [v9 window];
    objc_msgSend(v11, "convertPoint:fromWindow:", v12, a4, a5);
    double v14 = v13;
    double v16 = v15;

    objc_msgSend(*(id *)(a1 + 16), "convertPoint:fromView:", 0, v14, v16);
    char v17 = objc_msgSend(*(id *)(a1 + 16), "hitTest:withEvent:", v10);
    if (!v17)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
      id v19 = [WeakRetained presentedViewController];

      v20 = [v19 view];
      objc_msgSend(v9, "convertPoint:toView:", v20, a4, a5);
      double v22 = v21;
      double v24 = v23;

      uint64_t v25 = [v19 view];
      char v17 = objc_msgSend(v25, "hitTest:withEvent:", v10, v22, v24);
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)_dismissPopovers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 29);
    id v3 = [WeakRetained presentedViewController];

    if (v3 && ([v3 isBeingDismissed] & 1) == 0)
    {
      double v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v9 = v3;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss presented view controller: %{private}@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __45__PKPencilSqueezeController__dismissPopovers__block_invoke;
      v5[3] = &unk_1E64C66B8;
      objc_copyWeak(&v7, (id *)buf);
      id v6 = v3;
      [v6 dismissViewControllerAnimated:1 completion:v5];

      objc_destroyWeak(&v7);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __60__PKPencilSqueezeController__handlePencilHitTest_withEvent___block_invoke(uint64_t a1)
{
}

void __72__PKPencilSqueezeController__handleContainerOverlayHitTest_point_event___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByTappingOutsideOnScreen](*(void *)(*(void *)(a1 + 32)
                                                                                             + 248));
}

- (void)pencilInteraction:(id)a3 didReceiveTap:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v5 = [v8 BOOLForKey:@"PKUsePencilDoubleTapAsSqueeze"];
  }
  else
  {
    int v5 = 0;
  }
  id v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction did tap, usePencilDoubleTapAsSqueeze: %{BOOL}d", (uint8_t *)v9, 8u);
  }

  if (v5)
  {
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, !self->_paletteViewVisible, 0);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }
  else if (self->_paletteViewVisible)
  {
    -[PKPencilSqueezeController _dismissPopovers]((id *)&self->super.isa);
    -[PKSqueezePaletteView pencilInteractionDidTap:]((uint64_t)self->_paletteView, [MEMORY[0x1E4FB1A80] preferredTapAction]);
  }
  else
  {
    id v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Pencil tap interaction ignored", (uint8_t *)v9, 2u);
    }
  }
}

- (void)pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4FB1A80] preferredSqueezeAction];
  uint64_t v7 = [v5 phase];
  uint64_t v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isHidingPaletteAfterDelay = self->_isHidingPaletteAfterDelay;
    *(_DWORD *)buf = 134284033;
    uint64_t v40 = v6;
    __int16 v41 = 2049;
    *(void *)id v42 = v7;
    *(_WORD *)&v42[8] = 1024;
    *(_DWORD *)v43 = isHidingPaletteAfterDelay;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction did squeeze, preferredSqueezeAction: %{private}ld, phase: %{private}ld, isHidingPaletteAfterDelay: %{BOOL}d", buf, 0x1Cu);
  }

  if (self->_isHidingPaletteAfterDelay || v6 != 5)
  {
    double v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v15 = "Pencil squeeze interaction ignored";
LABEL_13:
      _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
LABEL_34:
  }
  else
  {
    switch(v7)
    {
      case 0:
        uint64_t v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v5 hoverPose];
          *(_DWORD *)buf = 138477827;
          uint64_t v40 = (uint64_t)v11;
          _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Pencil squeeze interaction phase began, hoverPose: %{private}@", buf, 0xCu);
        }
        BOOL paletteViewVisible = self->_paletteViewVisible;
        self->_BOOL paletteViewVisibleBeforeSqueezeBegan = paletteViewVisible;
        if (paletteViewVisible)
        {
          double v13 = -[PKPencilSqueezeController _hoverViewInPalette:]((id *)&self->super.isa, v5);
          self->_BOOL squeezeBeganOnPalette = v13 != 0;

          if (self->_paletteViewVisible) {
            break;
          }
        }
        else
        {
          self->_BOOL squeezeBeganOnPalette = 0;
        }
        -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 1, 0);
        -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, v5, 0, 1);
        -[PKPencilSqueezeController _didChangePaletteViewToVisible]((uint64_t)self);
        break;
      case 1:
        double v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          BOOL v33 = [v5 hoverPose];
          *(_DWORD *)buf = 138477827;
          uint64_t v40 = (uint64_t)v33;
          _os_log_debug_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEBUG, "Pencil squeeze interaction phase changed, hoverPose: %{private}@", buf, 0xCu);
        }
        goto LABEL_34;
      case 2:
        double v16 = -[PKPencilSqueezeController _hoverViewInPalette:]((id *)&self->super.isa, v5);
        double v17 = -[PKSqueezePaletteViewPresentationHandle animationProgress]((uint64_t)self->_paletteViewPresentationHandle);
        uint64_t v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v5 hoverPose];
          BOOL paletteViewVisibleBeforeSqueezeBegan = self->_paletteViewVisibleBeforeSqueezeBegan;
          BOOL squeezeBeganOnPalette = self->_squeezeBeganOnPalette;
          *(_DWORD *)buf = 138479363;
          uint64_t v40 = (uint64_t)v19;
          __int16 v41 = 1024;
          *(_DWORD *)id v42 = paletteViewVisibleBeforeSqueezeBegan;
          *(_WORD *)&v42[4] = 1024;
          *(_DWORD *)&v42[6] = squeezeBeganOnPalette;
          *(_WORD *)v43 = 1024;
          *(_DWORD *)&v43[2] = v16 != 0;
          __int16 v44 = 2113;
          v45 = v16;
          __int16 v46 = 1024;
          BOOL v47 = v17 < 0.9;
          __int16 v48 = 2048;
          double v49 = v17;
          _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Pencil squeeze interaction phase ended, hoverState: %{private}@, paletteViewVisibleBeforeSqueezeBegan: %{BOOL}d, squeezeBeganOnPalette: %{BOOL}d, isHoverOnPalette: %{BOOL}d, hitView: %{private}@, isAnimating: %{BOOL}d, progress: %.f", buf, 0x38u);
        }
        if (v17 >= 0.9 && v16)
        {
          paletteView = self->_paletteView;
          if (paletteView) {
            paletteView = (PKSqueezePaletteView *)paletteView->_currentLayout;
          }
          double v23 = paletteView;
          if (!self->_squeezeBeganOnPalette)
          {
            double v24 = objc_msgSend(v16, "_pk_longSqueezeAction");

            if (v24)
            {
              uint64_t v25 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v40 = (uint64_t)v16;
                _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Perform long squeeze action on view: %{private}@", buf, 0xCu);
              }

              objc_msgSend(v16, "_pk_longSqueezeAction");
              v26 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v26[2]();
            }
          }
          if (PKSqueezePaletteViewLayoutIsExpandedOptionsLayout(v23))
          {
            BOOL v27 = 1;
          }
          else
          {
            v28 = self->_paletteView;
            if (v28) {
              v28 = (PKSqueezePaletteView *)v28->_currentLayout;
            }
            uint64_t v29 = v28;
            BOOL v27 = v23 != v29;
          }
          v30 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v40) = v27;
            _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEFAULT, "Keep palette visible: %{BOOL}d", buf, 8u);
          }

          if (!v27)
          {
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke;
            v38[3] = &unk_1E64C61C0;
            v38[4] = self;
            -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v38);
            if (self->_squeezeBeganOnPalette)
            {
              -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, v5, 0, 1);
            }
            else
            {
              id v31 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C44F8000, v31, OS_LOG_TYPE_DEFAULT, "Hide palette after delay", buf, 2u);
              }

              self->_BOOL isHidingPaletteAfterDelay = 1;
              dispatch_time_t v32 = dispatch_time(0, (uint64_t)(self->_hidePaletteDelay * 1000000000.0));
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_40;
              block[3] = &unk_1E64C5F60;
              void block[4] = self;
              id v37 = v5;
              dispatch_after(v32, MEMORY[0x1E4F14428], block);
            }
          }
        }
        else if (self->_paletteViewVisibleBeforeSqueezeBegan)
        {
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_2;
          v34[3] = &unk_1E64C5F60;
          v34[4] = self;
          id v35 = v5;
          -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v34);
        }
        break;
      case 3:
        double v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_34;
        }
        *(_WORD *)buf = 0;
        double v15 = "Pencil squeeze interaction phase cancelled";
        goto LABEL_13;
      default:
        double v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Unhandled Pencil squeeze interaction phase", buf, 2u);
        }
        goto LABEL_34;
    }
  }
}

- (id)_hoverViewInPalette:(id *)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    if (a1[2]
      && ([v3 hoverPose], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
    {
      uint64_t v6 = [v4 hoverPose];
      [v6 location];
      double v8 = v7;
      double v10 = v9;

      id v11 = a1[2];
      int v12 = [a1[16] view];
      objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
      double v14 = v13;
      double v16 = v15;

      objc_msgSend(a1[2], "hitTest:withEvent:", 0, v14, v16);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke(uint64_t a1)
{
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_40(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 138) = 0;
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 216)) {
    id v3 = *(void **)(a1 + 40);
  }
  else {
    id v3 = 0;
  }
  -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](v2, v3, 0, 1);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 248);

  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteBySqueezingAgain](v4);
}

- (uint64_t)_toolPickerForKeyWindow
{
  uint64_t v1 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = -[PKPencilSqueezeController _keyWindow](a1);
    +[PKToolPicker _toolPickersForWindow:]((uint64_t)PKToolPicker, v2);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "_isEnabled", (void)v13))
          {
            uint64_t v1 = v8;
            double v10 = (uint64_t *)v3;
            goto LABEL_14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    double v9 = +[PKToolPicker _existingToolPickerForWindow:v2];
    if (v9)
    {
      double v10 = v9;
    }
    else
    {
      int v12 = -[PKPencilSqueezeController _currentFirstResponder](v1);
      +[PKToolPicker _cycleToolPickersForResponder:]((uint64_t)PKToolPicker, v12);
      double v10 = +[PKToolPicker _existingToolPickerForWindow:v2];
    }
    uint64_t v1 = v10;
LABEL_14:
  }

  return v1;
}

- (id)_currentUndoManager
{
  if (a1)
  {
    uint64_t v1 = -[PKPencilSqueezeController _currentFirstResponder](a1);
    uint64_t v2 = [v1 undoManager];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

double __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0.0;
  }
  uint64_t v4 = *(void **)(v2 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  [v4 azimuthAngleInView:WeakRetained];
  double v7 = v6;

  double v8 = -[PKPencilSqueezeUserDefaults loadLastPaletteViewStartAngle](*(void *)(v2 + 192));
  double v9 = v8;
  if (v7 != 0.0 || v8 == 0)
  {
    double v11 = -v7;
    if (v7 >= 0.0) {
      double v11 = v7;
    }
    double v12 = 4.38077642;
    if (a2) {
      double v12 = 5.70722665;
    }
    if (v11 >= 1.57079633) {
      double v14 = v12;
    }
    else {
      double v14 = 3.45575192;
    }
  }
  else
  {
    [v8 floatValue];
    double v14 = v13;
  }
  if (v7 != 0.0) {
    -[PKPencilSqueezeUserDefaults saveLastPaletteViewStartAngle:](*(void *)(v2 + 192), v14);
  }

  return v14;
}

- (uint64_t)_updatePalettePositionWithHoverLocation:(double)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 216))
  {
    uint64_t v5 = result;
    double v6 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)result);
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;

    long long v15 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v45.origin.x = v8;
      v45.origin.y = v10;
      v45.size.width = v12;
      v45.size.height = v14;
      long long v16 = NSStringFromCGRect(v45);
      LODWORD(buf.a) = 138477827;
      *(void *)((char *)&buf.a + 4) = v16;
      _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Update palette view position, keyWindowBounds: %{private}@", (uint8_t *)&buf, 0xCu);
    }
    [*(id *)(v5 + 72) setConstant:v12];
    [*(id *)(v5 + 80) setConstant:v14];
    double v17 = v12 + -40.0;
    double v18 = v14 + -50.0;
    id v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v46.origin.x = 20.0;
      v46.origin.y = 30.0;
      v46.size.width = v17;
      v46.size.height = v18;
      v20 = NSStringFromCGRect(v46);
      LODWORD(buf.a) = 138477827;
      *(void *)((char *)&buf.a + 4) = v20;
      _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Update palette view position, displayRect: %{private}@", (uint8_t *)&buf, 0xCu);
    }
    double v21 = -[PKPencilSqueezeController _paletteViewScale](v5);
    double v22 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134283521;
      *(double *)((char *)&buf.a + 4) = v21;
      _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEFAULT, "Update palette view position, paletteViewScale: %{private}.2f", (uint8_t *)&buf, 0xCu);
    }

    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, v21, v21);
    CGAffineTransform v39 = buf;
    [*(id *)(v5 + 16) setTransform:&v39];
    [*(id *)(v5 + 40) setActive:0];
    [*(id *)(v5 + 48) setActive:0];
    double v23 = *(double *)(v5 + 184);
    if (v23 < 0.0) {
      double v23 = -v23;
    }
    BOOL v24 = v23 < 1.57079633;
    double v25 = -30.0;
    if (v24) {
      double v25 = 30.0;
    }
    double v26 = -[PKPencilSqueezeController _paletteViewCenterInRect:hoverLocation:paletteViewSize:](v5, 20.0, 30.0, v17, v18, a2 + v25, a3 + 30.0, *(double *)(v5 + 32) * buf.c + buf.a * *(double *)(v5 + 24));
    double v28 = v27;
    uint64_t v29 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v44.x = v26;
      v44.y = v28;
      v30 = NSStringFromCGPoint(v44);
      *(_DWORD *)uint64_t v40 = 138477827;
      __int16 v41 = v30;
      _os_log_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEFAULT, "Update palette view position, center: %{private}@", v40, 0xCu);
    }
    id v31 = [*(id *)(v5 + 16) centerXAnchor];
    dispatch_time_t v32 = [*(id *)(v5 + 64) leftAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32 constant:v26];
    v34 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v33;

    id v35 = [*(id *)(v5 + 16) centerYAnchor];
    id v36 = [*(id *)(v5 + 64) topAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36 constant:v28];
    id v38 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v37;

    [*(id *)(v5 + 40) setActive:1];
    return [*(id *)(v5 + 48) setActive:1];
  }
  return result;
}

- (uint64_t)_updatePaletteViewPresentationState
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 152);
    double v3 = 0.0;
    double v4 = 0.0;
    if (v2) {
      objc_msgSend(*(id *)(v2 + 24), "presentationValue", 0.0);
    }
    [*(id *)(v1 + 16) setAlpha:v4];
    double v5 = -[PKPencilSqueezeController _paletteViewScale](v1);
    uint64_t v6 = *(void *)(v1 + 152);
    if (v6)
    {
      [*(id *)(v6 + 32) presentationValue];
      double v3 = v7;
    }
    CGAffineTransformMakeScale(&v10, v5 * v3, v5 * v3);
    CGFloat v8 = *(void **)(v1 + 16);
    CGAffineTransform v9 = v10;
    return [v8 setTransform:&v9];
  }
  return result;
}

id __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_52(uint64_t a1, void *a2, double a3, double a4)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v6);
  id v9 = v7;
  if (!WeakRetained) {
    goto LABEL_7;
  }
  CGAffineTransform v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((unsigned __int8 *)WeakRetained + 216);
    LODWORD(v14[0]) = 67109120;
    HIDWORD(v14[0]) = v11;
    _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Handle pencil hit test, paletteViewVisible: %{BOOL}d", (uint8_t *)v14, 8u);
  }

  if (*((unsigned char *)WeakRetained + 216))
  {
    objc_msgSend(WeakRetained[2], "convertPoint:fromView:", WeakRetained[15], a3, a4);
    double v12 = objc_msgSend(WeakRetained[2], "hitTest:withEvent:", v9);
    if (v12)
    {
      -[PKPencilSqueezeController _dismissPopovers](WeakRetained);
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__PKPencilSqueezeController__handlePencilHitTest_withEvent___block_invoke;
      v14[3] = &unk_1E64C61C0;
      v14[4] = WeakRetained;
      -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)WeakRetained, 0, v14);
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](WeakRetained, 0, 0, 1);
    }
  }
  else
  {
LABEL_7:
    double v12 = 0;
  }

  return v12;
}

uint64_t __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  CGFloat v8 = (id *)(a1 + 32);
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v8);
  id v12 = v10;
  id v13 = v9;
  double v14 = v13;
  if (WeakRetained && v13 && *((unsigned char *)WeakRetained + 216) && [v13 type] != 11)
  {
    objc_msgSend(WeakRetained[2], "convertPoint:fromView:", v12, a4, a5);
    long long v15 = objc_msgSend(WeakRetained[2], "hitTest:withEvent:", v14);

    if (v15)
    {
      -[PKPencilSqueezeController _dismissPopovers](WeakRetained);
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__PKPencilSqueezeController__handleContainerOverlayHitTest_point_event___block_invoke;
      v18[3] = &unk_1E64C61C0;
      v18[4] = WeakRetained;
      -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)WeakRetained, 0, v18);
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](WeakRetained, 0, 0, 1);
    }
  }

  id v16 = 0;
  return 0;
}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPencilSqueezeController _updatePaletteViewPresentationState]((uint64_t)WeakRetained);
}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_4(uint64_t a1, int a2, char a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 && (a3 & 1) == 0)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v10 = WeakRetained;
      BOOL v5 = !*((unsigned char *)WeakRetained + 216)
        && ((double v4 = WeakRetained[19]) == 0 || !v4[48])
        && WeakRetained[2]
        && *((unsigned char *)WeakRetained + 138) == 0;
      uint64_t v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *((unsigned __int8 *)v10 + 216);
        *(_DWORD *)CGAffineTransform buf = 67109376;
        int v12 = v7;
        __int16 v13 = 1024;
        BOOL v14 = v5;
        _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Palette view presentation did finish, isVisible: %{BOOL}d, remove from view hierarchy: %{BOOL}d", buf, 0xEu);
      }

      id WeakRetained = v10;
      if (v5)
      {
        id v8 = v10[11];
        v10[11] = 0;

        [v10[2] removeFromSuperview];
        id v9 = v10[2];
        v10[2] = 0;

        id WeakRetained = v10;
      }
    }
  }
}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained && WeakRetained[216]) {
    +[PKToolPicker _dockToolPickerForWindowScene:toAutoHideCornerAnimated:]((uint64_t)PKToolPicker, v2, 0);
  }
}

- (void)_updateToolPickerVisibilityWithCompletion:(uint64_t *)a1
{
  id v3 = a2;
  -[PKPencilSqueezeController _toolPickerForKeyWindow](a1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = objc_alloc_init(PKToolPickerVisibilityContext);
  BOOL v5 = v4;
  if (v4) {
    v4->_squeezePaletteVisibleDidChange = 1;
  }
  -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](v6, v4, v3);
}

- (double)_paletteViewScale
{
  id v2 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  int v7 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  double v8 = PKSqueezePaletteViewScaleFactor(v7, 20.0, 30.0, v4 + -40.0, v6 + -50.0, *(double *)(a1 + 24));

  return v8;
}

- (double)_paletteViewCenterInRect:(CGFloat)a3 hoverLocation:(CGFloat)a4 paletteViewSize:(CGFloat)a5
{
  if (!a1) {
    return 0.0;
  }
  double v13 = a8 * 0.5;
  double v14 = a8 * 0.5 + CGRectGetMinX(*(CGRect *)&a2);
  if (a6 < v14) {
    a6 = v14;
  }
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  double v15 = CGRectGetMaxX(v17) - v13;
  if (a6 >= v15) {
    a6 = v15;
  }
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMinY(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxY(v19);
  return a6;
}

- (double)paletteViewFrameForHoverLocation:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  double v6 = -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 + -40.0;
  double v12 = v10 + -50.0;
  double v13 = -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  double v14 = PKSqueezePaletteViewScaleFactor(v13, 20.0, 30.0, v11, v12, *(double *)(a1 + 24));
  double v15 = *(void **)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  [v15 azimuthAngleInView:WeakRetained];
  double v18 = v17;

  double v19 = -v18;
  if (v18 >= 0.0) {
    double v19 = v18;
  }
  BOOL v20 = v19 < 1.57079633;
  double v21 = -30.0;
  if (v20) {
    double v21 = 30.0;
  }
  double v22 = a2 + v21;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v14, v14);
  double v23 = *(double *)(a1 + 32) * v26.c + v26.a * *(double *)(a1 + 24);
  double v24 = -[PKPencilSqueezeController _paletteViewCenterInRect:hoverLocation:paletteViewSize:](a1, 20.0, 30.0, v11, v12, v22, a3 + 30.0, v23)- v23 * 0.5;

  return v24;
}

- (id)_currentFirstResponder
{
  if (a1)
  {
    uint64_t v1 = -[PKPencilSqueezeController _keyWindow](a1);
    id v2 = [v1 firstResponder];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)_isPresentedViewController:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v2 = (id *)(a1 + 232);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained presentedViewController];

  BOOL v6 = v5 == v3;
  return v6;
}

- (void)_togglePresentViewControllerAsPopover:(void *)a3 sourceView:
{
  id v6 = a2;
  id v5 = a3;
  if (a1)
  {
    if (-[PKPencilSqueezeController _isPresentedViewController:](a1, v6)) {
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:](a1, v6, v5);
    }
  }
}

- (void)_presentViewControllerAsPopover:(void *)a3 sourceView:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (-[PKPencilSqueezeController _isPresentedViewController:](a1, v5)
      || (int v7 = [v5 isBeingPresented], !v6)
      || v7)
    {
      double v28 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 138478083;
        id v35 = v5;
        __int16 v36 = 2113;
        id v37 = v6;
        _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "Unable to present view controller: %{private}@, sourceView: %{private}@", buf, 0x16u);
      }
    }
    else
    {
      [v5 setModalPresentationStyle:7];
      double v8 = [v5 popoverPresentationController];
      [v8 setDelegate:a1];

      double v9 = [v5 popoverPresentationController];
      [v9 setSourceView:v6];

      [v6 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [v5 popoverPresentationController];
      objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

      double v19 = [v5 popoverPresentationController];
      [v19 setSourceItem:v6];

      BOOL v20 = [v5 popoverPresentationController];
      [v20 _setIgnoresKeyboardNotifications:1];

      v33[0] = *(void *)(a1 + 120);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v33[1] = WeakRetained;
      double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      double v23 = [v5 popoverPresentationController];
      [v23 setPassthroughViews:v22];

      double v24 = [v5 popoverPresentationController];
      [v24 setPermittedArrowDirections:15];

      double v25 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_loadWeakRetained((id *)(a1 + 232));
        *(_DWORD *)CGAffineTransform buf = 138478083;
        id v35 = v5;
        __int16 v36 = 2113;
        id v37 = v26;
        _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Present view controller: %{private}@, root view controller: %{private}@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, (id)a1);
      id v27 = objc_loadWeakRetained((id *)(a1 + 232));
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __72__PKPencilSqueezeController__presentViewControllerAsPopover_sourceView___block_invoke;
      v29[3] = &unk_1E64C7A18;
      objc_copyWeak(&v32, (id *)buf);
      id v30 = v5;
      id v31 = v6;
      [v27 presentViewController:v30 animated:1 completion:v29];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __72__PKPencilSqueezeController__presentViewControllerAsPopover_sourceView___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (WeakRetained)
  {
    BOOL v5 = -[PKPencilSqueezeController _isPresentedViewController:]((uint64_t)WeakRetained, v3);
    id v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    int v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CGAffineTransform buf = 138477827;
        id v10 = v3;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Did present view controller: %{private}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CGAffineTransform buf = 138477827;
      id v10 = v3;
      _os_log_error_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_ERROR, "Unable to present view controller: %{private}@", buf, 0xCu);
    }
  }
}

void __45__PKPencilSqueezeController__dismissPopovers__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 138477827;
      id v6 = v2;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Did dismiss view controller: %{private}@", buf, 0xCu);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy didDismissViewController:](WeakRetained[11], v2);
  }
}

- (BOOL)_canSelectTool:(uint64_t *)a1 atIndex:(void *)a2
{
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v5 = [v3 ink];
  int v6 = [v5 _isGenerationTool];

  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = -[PKTextEffectsWindowObserver keyWindow](a1[30]);
  BOOL v8 = v7 == 0;
  if (!v7)
  {
    uint64_t v11 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Unable to find application window to display Enrollment UI", v13, 2u);
    }

    goto LABEL_9;
  }
  double v9 = +[PKGenerationModelAvailabilityController sharedInstance];
  int v10 = [v9 presentGreymatterAvailabilityAlertControllerInWindow:v7];

  if (!v10)
  {

LABEL_11:
    BOOL v8 = 1;
    goto LABEL_12;
  }
  -[PKPencilSqueezeController _hidePaletteViewAfterDelay:](a1, 0.1);
LABEL_9:

LABEL_12:
  return v8;
}

- (void)_didSelectTool:(uint64_t *)a1 atIndex:(void *)a2
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    BOOL v5 = [v3 ink];
    if (![v5 _isGenerationTool])
    {
LABEL_11:

      goto LABEL_12;
    }
    BOOL v6 = +[PKImageWandOnboardingController canShowOnboardingView];

    if (v6)
    {
      uint64_t v7 = -[PKTextEffectsWindowObserver keyWindow](a1[30]);
      BOOL v5 = [v7 rootViewController];

      if (v5)
      {
        BOOL v8 = -[PKPencilSqueezeController _toolPickerForKeyWindow](a1);
        double v9 = -[PKImageWandOnboardingController initWithPresentationViewController:toolPicker:]((id *)[PKImageWandOnboardingController alloc], v5, v8);
        int v10 = (void *)a1[26];
        a1[26] = (uint64_t)v9;

        uint64_t v11 = a1[26];
        if (v11)
        {
          objc_storeWeak((id *)(v11 + 40), a1);
          uint64_t v12 = a1[26];
        }
        else
        {
          uint64_t v12 = 0;
        }
        -[PKImageWandOnboardingController showOnboardingViewAfterDelay:](v12, 0.3);
        -[PKPencilSqueezeController _hidePaletteViewAfterDelay:](a1, 0.2);
      }
      else
      {
        double v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v14 = 0;
          _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Unable to present Image Wand Onboarding UI; no presentation view controller",
            v14,
            2u);
        }
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (BOOL)pencilSqueezeAnalyticsControllerIsHovering:(id)a3
{
  return self->_hovering;
}

- (double)pencilSqueezeAnalyticsControllerHoverZOffset:(id)a3
{
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer zOffset];
  return result;
}

- (id)pencilSqueezeAnalyticsControllerHoverSettings:(id)a3
{
  return self->_hoverSettings;
}

- (void)imageWandOnboardingControllerDidHideView:(id)a3
{
  id v4 = (PKImageWandOnboardingController *)a3;
  BOOL v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Image Wand Onboarding UI did dismiss", v6, 2u);
  }

  if (self->_imageWandOnboardingController == v4)
  {
    self->_imageWandOnboardingController = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__analyticsController, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowObserver, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageWandOnboardingController, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_paletteViewPresentationHandle, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_containerViewOverlay, 0);
  objc_storeStrong((id *)&self->_autoRefineSettingsObserver, 0);
  objc_storeStrong((id *)&self->_pencilInteractionObserver, 0);
  objc_storeStrong((id *)&self->_hoverSettings, 0);
  objc_storeStrong((id *)&self->_paletteViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_paletteViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);

  objc_destroyWeak((id *)&self->_containerView);
}

@end