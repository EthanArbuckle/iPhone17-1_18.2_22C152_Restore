@interface PKPaletteViewInteraction
+ (BOOL)isHostedWindow:(id)a3;
+ (id)existingPaletteViewInteractionForWindowScene:(id)a3;
+ (id)paletteViewInteractionForCanvas:(id)a3;
+ (id)paletteViewInteractionForWindow:(id)a3 windowScene:(id)a4;
- (BOOL)_isCompactHostedWindow;
- (BOOL)_shouldDeferPaletteVisibilityUpdate;
- (BOOL)isActive;
- (BOOL)isPaletteVisible;
- (CGRect)_sceneBoundsForUpdateWithFollowsHostingWindowOut:(BOOL *)a3;
- (CGRect)sceneBounds;
- (CGRect)textEffectsWindowFrame;
- (NSLayoutConstraint)paletteHostViewHeightConstraint;
- (NSLayoutConstraint)paletteHostViewLeftConstraint;
- (NSLayoutConstraint)paletteHostViewTopConstraint;
- (NSLayoutConstraint)paletteHostViewWidthConstraint;
- (PKDrawingPaletteView)paletteView;
- (PKPaletteHostView)paletteHostView;
- (PKPaletteViewInteraction)initWithScene:(id)a3;
- (PKPaletteViewInteraction)initWithWindowSize:(CGSize)a3;
- (PKPaletteViewInteractionDelegate)delegate;
- (UIScene)_scene;
- (UIView)view;
- (UIWindowScene)windowScene;
- (id)_traitCollectionForHostingWindow;
- (id)_viewControllerForPalette;
- (id)hostingWindow;
- (id)paletteTapToRadarCommandConfiguration:(id)a3;
- (void)_sceneDidActivateNotification:(id)a3;
- (void)_sceneWillEnterForegroundNotification:(id)a3;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setScene:(id)a3;
- (void)_updateForRotation:(id)a3;
- (void)_updateForWillRotate:(id)a3;
- (void)_updatePaletteTraitCollection:(id)a3;
- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3;
- (void)_updateSceneBounds;
- (void)_updateUIWithSceneBounds:(CGRect)a3;
- (void)didMoveToView:(id)a3;
- (void)hidePaletteViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setPaletteHostView:(id)a3;
- (void)setPaletteHostViewHeightConstraint:(id)a3;
- (void)setPaletteHostViewLeftConstraint:(id)a3;
- (void)setPaletteHostViewTopConstraint:(id)a3;
- (void)setPaletteHostViewWidthConstraint:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setSceneBounds:(CGRect)a3;
- (void)setTextEffectsWindowFrame:(CGRect)a3;
- (void)setView:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)showPaletteViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)willMoveToView:(id)a3;
@end

@implementation PKPaletteViewInteraction

+ (id)paletteViewInteractionForCanvas:(id)a3
{
  return 0;
}

+ (id)existingPaletteViewInteractionForWindowScene:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)_perCanvasInteractions;
    objc_sync_enter(v4);
    v5 = [(id)_perCanvasInteractions objectForKey:v3];
    objc_sync_exit(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)paletteViewInteractionForWindow:(id)a3 windowScene:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    id obj = (id)_perCanvasInteractions;
    objc_sync_enter(obj);
    v9 = (void *)_perCanvasInteractions;
    if (!_perCanvasInteractions)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      v11 = (void *)_perCanvasInteractions;
      _perCanvasInteractions = v10;

      v9 = (void *)_perCanvasInteractions;
    }
    v8 = [v9 objectForKey:v7];
    if (v8) {
      goto LABEL_38;
    }
    v12 = os_log_create("com.apple.pencilkit", "Interaction");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v5;
      __int16 v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_INFO, "Create new palette view interaction for window: %@, windowScene: %@", buf, 0x16u);
    }

    v13 = [MEMORY[0x1E4FB1D68] sharedTextEffectsWindowForWindowScene:v7];
    NSClassFromString(&cfstr_Uisecurehosted.isa);
    v34 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !+[PKPaletteViewInteraction isHostedWindow:v13])
    {
      log = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C44F8000, log, OS_LOG_TYPE_FAULT, "Got a UITextEffectsWindow for an extension when we should have gotten a UITextEffectsWindowHosted", buf, 2u);
      }
    }
    else
    {
      v14 = [v13 rootViewController];
      log = [v14 view];

      if (log)
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        char v17 = [v16 isEqualToString:@"UIInputSetContainerView"];

        if (v17)
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v18 = [log subviews];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v38;
LABEL_14:
            uint64_t v21 = 0;
            while (1)
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = *(void **)(*((void *)&v37 + 1) + 8 * v21);
              v23 = (objc_class *)objc_opt_class();
              v24 = NSStringFromClass(v23);
              char v25 = [v24 isEqualToString:@"UIEditingOverlayGestureView"];

              if (v25) {
                break;
              }
              if (v19 == ++v21)
              {
                uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
                if (v19) {
                  goto LABEL_14;
                }
                goto LABEL_20;
              }
            }
            id v27 = v22;

            if (v27) {
              goto LABEL_31;
            }
          }
          else
          {
LABEL_20:
          }
          v28 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_FAULT, "Can't find UIEditingOverlayGestureView on UITextEffectsWindow", buf, 2u);
          }

          id v27 = 0;
LABEL_31:
          v29 = [PKPaletteViewInteraction alloc];
          [v5 bounds];
          v8 = -[PKPaletteViewInteraction initWithWindowSize:](v29, "initWithWindowSize:", v30, v31);
          [(PKPaletteViewInteraction *)v8 setWindowScene:v7];
          [(id)_perCanvasInteractions setObject:v8 forKey:v7];
          [v7 _registerSceneComponent:v8 forKey:@"PKPaletteViewInteractionSceneComponentKey"];
          if (objc_opt_respondsToSelector())
          {
            v32 = [v7 keyboardSceneDelegate];
          }
          else
          {
            v32 = 0;
          }
          if (objc_opt_respondsToSelector()) {
            [v32 addVisibilityObserver:v8];
          }
          [v27 addInteraction:v8];

          goto LABEL_37;
        }
      }
      v26 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v13;
        __int16 v44 = 2112;
        v45 = log;
        _os_log_fault_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_FAULT, "UITextEffectsWindow is uninitialized: textEffectsWindow: %@ inputSetContainerView: %@", buf, 0x16u);
      }
    }
    v8 = 0;
LABEL_37:

LABEL_38:
    objc_sync_exit(obj);
  }

  return v8;
}

- (PKPaletteViewInteraction)initWithScene:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 coordinateSpace];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v10 = -[PKPaletteViewInteraction initWithWindowSize:](self, "initWithWindowSize:", v7, v9);

  return v10;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void)_sceneWillInvalidate:(id)a3
{
  [(PKPaletteViewInteraction *)self willMoveToView:0];

  [(PKPaletteViewInteraction *)self didMoveToView:0];
}

- (PKPaletteViewInteraction)initWithWindowSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteViewInteraction;
  id v5 = [(PKPaletteViewInteraction *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, 0);
    paletteHostView = v6->_paletteHostView;
    v6->_paletteHostView = 0;

    v6->_sceneBounds.origin.x = 0.0;
    v6->_sceneBounds.origin.y = 0.0;
    v6->_sceneBounds.size.CGFloat width = width;
    v6->_sceneBounds.size.CGFloat height = height;
  }
  return v6;
}

- (void)willMoveToView:(id)a3
{
  if (!a3)
  {
    id v5 = [(PKPaletteViewInteraction *)self paletteHostView];
    [v5 removeFromSuperview];

    [(PKPaletteViewInteraction *)self setPaletteHostView:0];
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FB3008] object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x1E4FB3000] object:0];
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  -[PKPaletteViewInteraction setView:](self, "setView:");
  if (a3)
  {
    id v5 = [(PKPaletteViewInteraction *)self paletteHostView];

    if (!v5)
    {
      double v6 = objc_alloc_init(PKDrawingPaletteView);
      [(PKPaletteViewInteraction *)self setPaletteView:v6];

      id v7 = [[PKPaletteTapToRadarCommand alloc] initWithDelegate:self];
      double v8 = [(PKPaletteViewInteraction *)self paletteView];
      [v8 setTapToRadarCommand:v7];

      objc_super v9 = [PKPaletteHostView alloc];
      uint64_t v10 = [(PKPaletteViewInteraction *)self paletteView];
      v11 = [(PKPaletteHostView *)v9 initWithPaletteView:v10];
      [(PKPaletteViewInteraction *)self setPaletteHostView:v11];

      v12 = [(PKPaletteViewInteraction *)self paletteHostView];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

      v13 = [(PKPaletteViewInteraction *)self view];
      v14 = [(PKPaletteViewInteraction *)self paletteHostView];
      [v13 addSubview:v14];

      v15 = [(PKPaletteViewInteraction *)self paletteHostView];
      v16 = [v15 topAnchor];
      char v17 = [(PKPaletteViewInteraction *)self view];
      v18 = [v17 topAnchor];
      uint64_t v19 = [v16 constraintEqualToAnchor:v18];
      paletteHostViewTopConstraint = self->_paletteHostViewTopConstraint;
      self->_paletteHostViewTopConstraint = v19;

      uint64_t v21 = [(PKPaletteViewInteraction *)self paletteHostView];
      v22 = [v21 leftAnchor];
      v23 = [(PKPaletteViewInteraction *)self view];
      v24 = [v23 leftAnchor];
      char v25 = [v22 constraintEqualToAnchor:v24];
      paletteHostViewLeftConstraint = self->_paletteHostViewLeftConstraint;
      self->_paletteHostViewLeftConstraint = v25;

      id v27 = [(PKPaletteViewInteraction *)self paletteHostView];
      v28 = [v27 widthAnchor];
      [(PKPaletteViewInteraction *)self sceneBounds];
      double v30 = [v28 constraintEqualToConstant:v29];
      paletteHostViewWidthConstraint = self->_paletteHostViewWidthConstraint;
      self->_paletteHostViewWidthConstraint = v30;

      v32 = [(PKPaletteViewInteraction *)self paletteHostView];
      v33 = [v32 heightAnchor];
      [(PKPaletteViewInteraction *)self sceneBounds];
      v35 = [v33 constraintEqualToConstant:v34];
      paletteHostViewHeightConstraint = self->_paletteHostViewHeightConstraint;
      self->_paletteHostViewHeightConstraint = v35;

      long long v37 = (void *)MEMORY[0x1E4F28DC8];
      long long v51 = *(_OWORD *)&self->_paletteHostViewTopConstraint;
      long long v38 = self->_paletteHostViewHeightConstraint;
      v52 = self->_paletteHostViewWidthConstraint;
      v53 = v38;
      long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:4];
      [v37 activateConstraints:v39];

      [(PKPaletteViewInteraction *)self _updateSceneBounds];
      long long v40 = [(PKPaletteViewInteraction *)self paletteView];
      [v40 paletteHostingWindowSceneDidChangeBounds:self];

      v41 = [(PKPaletteViewInteraction *)self _viewControllerForPalette];
      v42 = [(PKPaletteViewInteraction *)self paletteView];
      [v42 setPalettePopoverPresentingController:v41];

      id v43 = [(PKPaletteViewInteraction *)self paletteHostView];
      [v43 setNeedsLayout];

      __int16 v44 = [(PKPaletteViewInteraction *)self paletteHostView];
      [v44 layoutIfNeeded];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      if (WeakRetained)
      {
        uint64_t v46 = (void *)MEMORY[0x1E4FB1D68];
        id v47 = objc_loadWeakRetained((id *)&self->_windowScene);
        v48 = [v46 sharedTextEffectsWindowForWindowScene:v47];

        v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v49 addObserver:self selector:sel__updateForWillRotate_ name:*MEMORY[0x1E4FB3008] object:0];

        v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v50 addObserver:self selector:sel__updateForRotation_ name:*MEMORY[0x1E4FB3000] object:v48];
      }
    }
  }
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_windowScene);

    double v6 = (uint64_t *)MEMORY[0x1E4FB2E80];
    id v7 = (uint64_t *)MEMORY[0x1E4FB2EB0];
    if (v5)
    {
      double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = *v6;
      id v10 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v8 removeObserver:self name:v9 object:v10];

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v12 = *v7;
      id v13 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v11 removeObserver:self name:v12 object:v13];

      id v14 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v14 _unregisterSceneComponentForKey:@"PKPaletteViewInteractionSceneComponentKey"];
    }
    id v15 = objc_storeWeak((id *)&self->_windowScene, obj);

    if (obj)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v17 = *v6;
      id v18 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v16 addObserver:self selector:sel__sceneDidActivateNotification_ name:v17 object:v18];

      uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v20 = *v7;
      id v21 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v19 addObserver:self selector:sel__sceneWillEnterForegroundNotification_ name:v20 object:v21];

      id v22 = objc_loadWeakRetained((id *)&self->_windowScene);
      [v22 _registerSceneComponent:self forKey:@"PKPaletteViewInteractionSceneComponentKey"];
    }
  }
}

- (BOOL)isActive
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v5 & 1) != 0 || (_UIApplicationIsExtension()) {
    return 1;
  }
  id v7 = [(PKPaletteViewInteraction *)self windowScene];
  if (v7)
  {
    double v8 = [(PKPaletteViewInteraction *)self windowScene];
    BOOL v6 = [v8 activationState] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isPaletteVisible
{
  v2 = [(PKPaletteViewInteraction *)self paletteHostView];
  char v3 = [v2 isPaletteVisible];

  return v3;
}

- (void)showPaletteViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  BOOL v6 = [(PKPaletteViewInteraction *)self view];
  if (v6)
  {
    id v7 = [(PKPaletteViewInteraction *)self paletteHostView];
    [v7 setHidden:0];

    double v8 = [v6 window];
    [v8 bounds];
    -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:");

    [(PKPaletteViewInteraction *)self _updateSceneBounds];
    [(PKPaletteViewInteraction *)self _setPaletteVisible:1 animated:v4 completion:v9];
  }
}

- (void)_setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke;
  aBlock[3] = &unk_1E64C9068;
  BOOL v15 = v6;
  BOOL v16 = a4;
  aBlock[4] = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  if (v6)
  {
    v11 = [(PKPaletteViewInteraction *)self hostingWindow];
  }
  else
  {
    v11 = 0;
  }
  uint64_t v12 = [(PKPaletteViewInteraction *)self paletteView];
  objc_msgSend(v12, "set_hostingWindow:", v11);

  if (v6) {
  if ([(PKPaletteViewInteraction *)self _shouldDeferPaletteVisibilityUpdate])
  }
    dispatch_async(MEMORY[0x1E4F14428], v10);
  else {
    v10[2](v10);
  }
}

void __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) paletteHostView];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 49);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke_2;
  v5[3] = &unk_1E64C6D78;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  [v2 setPaletteVisible:v3 animated:v4 completion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__PKPaletteViewInteraction__setPaletteVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v4 = [WeakRetained paletteView];
    char v5 = [v4 pencilInteraction];
    [v5 setEnabled:0];

    id v6 = [v9 paletteView];
    id v7 = [v6 pencilInteraction];
    [v7 setEnabled:1];

    uint64_t v3 = v9;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
      uint64_t v3 = v9;
    }
  }
}

- (void)hidePaletteViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(PKPaletteViewInteraction *)self paletteView];
  [v6 dismissPalettePopoverWithCompletion:0];

  [(PKPaletteViewInteraction *)self _setPaletteVisible:0 animated:v4 completion:v7];
}

- (BOOL)_shouldDeferPaletteVisibilityUpdate
{
  uint64_t v3 = [(PKPaletteViewInteraction *)self _traitCollectionForHostingWindow];
  BOOL v4 = [(PKPaletteViewInteraction *)self paletteHostView];
  char v5 = [v4 traitCollection];

  uint64_t v6 = [v3 horizontalSizeClass];
  if (v6 == [v5 horizontalSizeClass])
  {
    uint64_t v7 = [v3 verticalSizeClass];
    BOOL v8 = v7 != [v5 verticalSizeClass];
  }
  else
  {
    BOOL v8 = 1;
  }
  BOOL v9 = [(PKPaletteViewInteraction *)self _isCompactHostedWindow] || v8;

  return v9;
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(PKPaletteViewInteraction *)self delegate];
  [v9 keyboardSceneDelegate:v8 inputViewSetVisibilityDidChange:v6 includedReset:v5];
}

- (void)_sceneDidActivateNotification:(id)a3
{
  [(PKPaletteViewInteraction *)self _updateSceneBounds];
  id v4 = [(PKPaletteViewInteraction *)self delegate];
  [v4 paletteViewInteractionDidActivate:self];
}

- (void)_sceneWillEnterForegroundNotification:(id)a3
{
  id v4 = [(PKPaletteViewInteraction *)self delegate];
  [v4 paletteViewInteractionWillEnterForeground:self];
}

- (void)_updateForWillRotate:(id)a3
{
  id v4 = [a3 object];
  BOOL v5 = [v4 view];
  BOOL v6 = [v5 window];

  uint64_t v7 = [v6 windowScene];
  id v8 = [(PKPaletteViewInteraction *)self view];
  id v9 = [v8 window];
  id v10 = [v9 windowScene];

  if (v7 == v10)
  {
    v11 = [(PKPaletteViewInteraction *)self paletteView];
    [v11 dismissPalettePopoverWithCompletion:0];

    [v6 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(PKPaletteViewInteraction *)self textEffectsWindowFrame];
    v23.origin.x = v13;
    v23.origin.y = v15;
    v23.size.CGFloat width = v17;
    v23.size.CGFloat height = v19;
    if (!CGRectEqualToRect(v22, v23))
    {
      -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:", v13, v15, v17, v19);
      if (![(PKPaletteHostView *)self->_paletteHostView isPaletteVisible])
      {
        [(PKPaletteHostView *)self->_paletteHostView setHidden:1];
        dispatch_time_t v20 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__PKPaletteViewInteraction__updateForWillRotate___block_invoke;
        block[3] = &unk_1E64C61C0;
        block[4] = self;
        dispatch_after(v20, MEMORY[0x1E4F14428], block);
      }
      [(PKPaletteViewInteraction *)self _updateSceneBounds];
    }
  }
}

uint64_t __49__PKPaletteViewInteraction__updateForWillRotate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setHidden:0];
}

- (void)_updateForRotation:(id)a3
{
  char v22 = 0;
  id v4 = a3;
  [(PKPaletteViewInteraction *)self _sceneBoundsForUpdateWithFollowsHostingWindowOut:&v22];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [v4 object];

  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  if (v22
    || ([(PKPaletteViewInteraction *)self textEffectsWindowFrame],
        v24.origin.x = v15,
        v24.origin.y = v17,
        v24.size.CGFloat width = v19,
        v24.size.CGFloat height = v21,
        !CGRectEqualToRect(v23, v24)))
  {
    -[PKPaletteViewInteraction setTextEffectsWindowFrame:](self, "setTextEffectsWindowFrame:", v15, v17, v19, v21);
    -[PKPaletteViewInteraction _updateUIWithSceneBounds:](self, "_updateUIWithSceneBounds:", v6, v8, v10, v12);
  }
}

+ (BOOL)isHostedWindow:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Uitexteffectsw.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_viewControllerForPalette
{
  v2 = [(PKPaletteViewInteraction *)self paletteHostView];
  id v3 = [v2 window];
  id v4 = [v3 rootViewController];
  double v5 = [v4 childViewControllers];
  double v6 = [v5 firstObject];

  return v6;
}

- (CGRect)_sceneBoundsForUpdateWithFollowsHostingWindowOut:(BOOL *)a3
{
  double v5 = [(PKPaletteViewInteraction *)self view];
  double v6 = [v5 window];

  double v7 = [MEMORY[0x1E4F28B50] mainBundle];
  double v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v9)
  {
    double v10 = [(PKPaletteViewInteraction *)self view];
    double v11 = [v10 window];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    BOOL v20 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v21 = [(PKPaletteViewInteraction *)self view];
  char v22 = [v21 window];
  BOOL v23 = +[PKPaletteViewInteraction isHostedWindow:v22];

  if (v23)
  {
    [v6 hostedViewSize];
    double v17 = v24;
    [v6 hostedViewSize];
    double v19 = v25;
    BOOL v20 = 0;
    double v13 = 0.0;
    double v15 = 0.0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v26 = [(PKPaletteViewInteraction *)self hostingWindow];
  [v26 bounds];
  double v13 = v27;
  double v15 = v28;
  double v17 = v29;
  double v19 = v30;

  BOOL v20 = 1;
  if (a3) {
LABEL_8:
  }
    *a3 = v20;
LABEL_9:

  double v31 = v13;
  double v32 = v15;
  double v33 = v17;
  double v34 = v19;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_updateSceneBounds
{
  [(PKPaletteViewInteraction *)self _sceneBoundsForUpdateWithFollowsHostingWindowOut:0];

  -[PKPaletteViewInteraction _updateUIWithSceneBounds:](self, "_updateUIWithSceneBounds:");
}

- (void)_updateUIWithSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_sceneBounds, a3))
  {
    self->_sceneBounds.origin.CGFloat x = x;
    self->_sceneBounds.origin.CGFloat y = y;
    self->_sceneBounds.size.CGFloat width = width;
    self->_sceneBounds.size.CGFloat height = height;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke;
    aBlock[3] = &unk_1E64C9090;
    aBlock[4] = self;
    double v8 = (void (**)(void, double, double))_Block_copy(aBlock);
    if ([(PKPaletteViewInteraction *)self isPaletteVisible]
      || ![MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      [(PKPaletteViewInteraction *)self sceneBounds];
      v8[2](v8, v10, v11);
    }
    else
    {
      int v9 = (void *)MEMORY[0x1E4FB1EB0];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke_2;
      v24[3] = &unk_1E64C6960;
      v24[4] = self;
      double v25 = v8;
      [v9 _performWithoutRetargetingAnimations:v24];
    }
    double v12 = [(PKPaletteViewInteraction *)self paletteView];
    [v12 paletteHostingWindowSceneDidChangeBounds:self];
  }
  double v13 = [(PKPaletteViewInteraction *)self _traitCollectionForHostingWindow];
  [(PKPaletteViewInteraction *)self _updatePaletteTraitCollection:v13];
  double v14 = objc_opt_class();
  double v15 = [(PKPaletteViewInteraction *)self view];
  double v16 = [v15 window];
  LODWORD(v14) = [v14 isHostedWindow:v16];

  if (v14)
  {
    double v17 = [(PKPaletteViewInteraction *)self view];
    double v18 = [v17 window];
    [v18 frame];
    double v20 = v19;
    [(PKPaletteViewInteraction *)self sceneBounds];
    double v22 = v20 - v21 + 10.0;

    BOOL v23 = [(PKPaletteViewInteraction *)self paletteView];
    objc_msgSend(v23, "setPalettePopoverLayoutSceneMargins:", 10.0, 10.0, 10.0, v22);
  }
}

void __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke(uint64_t a1, double a2, double a3)
{
  double v6 = [*(id *)(a1 + 32) paletteHostViewWidthConstraint];
  [v6 setConstant:a2];

  id v7 = [*(id *)(a1 + 32) paletteHostViewHeightConstraint];
  [v7 setConstant:a3];
}

void __53__PKPaletteViewInteraction__updateUIWithSceneBounds___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) sceneBounds];
  (*(void (**)(uint64_t, double, double))(v2 + 16))(v2, v3, v4);
  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];
}

- (void)_updatePaletteUserInterfaceStyle:(int64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:a3];
  id v5 = [(PKPaletteViewInteraction *)self paletteHostView];
  double v6 = [v5 _localOverrideTraitCollection];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4FB1E20];
    v11[0] = v6;
    v11[1] = v4;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v9 = [v7 traitCollectionWithTraitsFromCollections:v8];
  }
  else
  {
    id v9 = v4;
  }
  double v10 = [(PKPaletteViewInteraction *)self paletteHostView];
  [v10 _setLocalOverrideTraitCollection:v9];
}

- (void)_updatePaletteTraitCollection:(id)a3
{
  id v4 = a3;
  [(PKPaletteViewInteraction *)self textEffectsWindowFrame];
  if (CGRectEqualToRect(v7, *MEMORY[0x1E4F1DB28]))
  {
    -[PKPaletteViewInteraction _updatePaletteUserInterfaceStyle:](self, "_updatePaletteUserInterfaceStyle:", [v4 userInterfaceStyle]);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PKPaletteViewInteraction__updatePaletteTraitCollection___block_invoke;
    v5[3] = &unk_1E64C5F60;
    void v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __58__PKPaletteViewInteraction__updatePaletteTraitCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) paletteHostView];
  [v2 _setLocalOverrideTraitCollection:*(void *)(a1 + 40)];
}

- (BOOL)_isCompactHostedWindow
{
  double v3 = [(PKPaletteViewInteraction *)self hostingWindow];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  id v6 = [(PKPaletteViewInteraction *)self view];
  CGRect v7 = [v6 window];
  BOOL v8 = +[PKPaletteViewInteraction isHostedWindow:v7];

  BOOL v9 = 0;
  if (v8 && v5 != 1)
  {
    double v10 = [(PKPaletteViewInteraction *)self view];
    double v11 = [v10 window];

    double v12 = [MEMORY[0x1E4F28B50] mainBundle];
    double v13 = [v12 bundleIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.ScreenshotServicesService"];

    if (v14
      && ([v11 hostedViewSize], v16 == *MEMORY[0x1E4F1DB30])
      && v15 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [v11 bounds];
    }
    else
    {
      [v11 hostedViewSize];
    }
    BOOL v9 = _UIUserInterfaceSizeClassForWidth() == 1;
  }
  return v9;
}

- (id)_traitCollectionForHostingWindow
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPaletteViewInteraction *)self hostingWindow];
  id v4 = [v3 traitCollection];

  uint64_t v5 = [(PKPaletteViewInteraction *)self hostingWindow];
  id v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 1 && [(PKPaletteViewInteraction *)self _isCompactHostedWindow])
  {
    BOOL v8 = [(PKPaletteViewInteraction *)self view];
    BOOL v9 = [v8 window];

    [v9 hostedViewSize];
    double v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:_UIUserInterfaceSizeClassForWidth()];
    double v11 = (void *)MEMORY[0x1E4FB1E20];
    v15[0] = v4;
    v15[1] = v10;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v13 = [v11 traitCollectionWithTraitsFromCollections:v12];

    id v4 = (void *)v13;
  }

  return v4;
}

- (id)hostingWindow
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPaletteViewInteraction *)self view];
  id v4 = [v3 window];
  if (!+[PKPaletteViewInteraction isHostedWindow:v4])
  {

    goto LABEL_15;
  }
  uint64_t v5 = [(PKPaletteViewInteraction *)self windowScene];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_15:
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v17 = [(PKPaletteViewInteraction *)self windowScene];
    double v18 = [v17 windows];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
LABEL_17:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = *(void **)(*((void *)&v27 + 1) + 8 * v22);
        if (![v23 _isTextEffectsWindow]) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v20) {
            goto LABEL_17;
          }
          goto LABEL_23;
        }
      }
      id v12 = v23;

      if (v12) {
        goto LABEL_33;
      }
    }
    else
    {
LABEL_23:
    }
    BOOL v9 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v26 = [(PKPaletteViewInteraction *)self windowScene];
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_fault_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_FAULT, "Unable to find application window in windowScene: %@", buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_32;
  }
  uint64_t v7 = [(PKPaletteViewInteraction *)self windowScene];
  BOOL v8 = [v7 performSelector:sel__visibleWindows];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v15 isKeyWindow])
        {
          id v16 = v15;

          id v12 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v11);

    if (v12) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  double v24 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEBUG, "No window in _visibleWindows was key, just take the last window object", buf, 2u);
  }

  id v12 = [v9 lastObject];
LABEL_32:

LABEL_33:

  return v12;
}

- (id)paletteTapToRadarCommandConfiguration:(id)a3
{
  id v4 = [(PKPaletteViewInteraction *)self view];
  uint64_t v5 = [v4 window];
  char v6 = +[PKToolPicker activeToolPickerForWindow:v5];

  if ([v6 _isHandwritingToolSelected])
  {
    uint64_t v7 = [(PKPaletteViewInteraction *)self windowScene];
    BOOL v8 = +[PKTextInputInteraction interactionForScene:v7];

    BOOL v9 = [v8 debugLogController];
    uint64_t v10 = -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v9);

    uint64_t v11 = objc_alloc_init(PKPaletteTapToRadarConfiguration);
    if ([v10 hasContent]) {
      id v12 = v10;
    }
    else {
      id v12 = 0;
    }
    [(PKPaletteTapToRadarConfiguration *)v11 setDebugSharpenerLog:v12];
    uint64_t v13 = [(PKPaletteViewInteraction *)self _viewControllerForPalette];
    [(PKPaletteTapToRadarConfiguration *)v11 setPresentationViewController:v13];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (PKPaletteViewInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteViewInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteHostView)paletteHostView
{
  return self->_paletteHostView;
}

- (void)setPaletteHostView:(id)a3
{
}

- (PKDrawingPaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (CGRect)sceneBounds
{
  double x = self->_sceneBounds.origin.x;
  double y = self->_sceneBounds.origin.y;
  double width = self->_sceneBounds.size.width;
  double height = self->_sceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSceneBounds:(CGRect)a3
{
  self->_sceneBounds = a3;
}

- (NSLayoutConstraint)paletteHostViewWidthConstraint
{
  return self->_paletteHostViewWidthConstraint;
}

- (void)setPaletteHostViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteHostViewHeightConstraint
{
  return self->_paletteHostViewHeightConstraint;
}

- (void)setPaletteHostViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteHostViewTopConstraint
{
  return self->_paletteHostViewTopConstraint;
}

- (void)setPaletteHostViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteHostViewLeftConstraint
{
  return self->_paletteHostViewLeftConstraint;
}

- (void)setPaletteHostViewLeftConstraint:(id)a3
{
}

- (CGRect)textEffectsWindowFrame
{
  double x = self->_textEffectsWindowFrame.origin.x;
  double y = self->_textEffectsWindowFrame.origin.y;
  double width = self->_textEffectsWindowFrame.size.width;
  double height = self->_textEffectsWindowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextEffectsWindowFrame:(CGRect)a3
{
  self->_textEffectsWindowFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteHostViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHostViewWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_storeStrong((id *)&self->_paletteHostView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_scene);
}

@end