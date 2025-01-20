@interface PKPencilSqueezeInteraction
+ (id)_existingInteractionForWindowScene:(id)a3;
+ (id)_perSceneInteractions;
+ (void)_postPencilSettingsDidChangeRemoteNotification;
- (BOOL)_isPointInsidePaletteView:(CGPoint)a3 fromView:(id)a4 withEvent:(id)a5;
- (BOOL)_paletteViewVisible;
- (BOOL)_tiledCanvasViewShouldDiscardTapStroke:(id)a3;
- (BOOL)pencilSqueezeControllerCanShowPaletteView:(id)a3;
- (CGRect)_paletteViewFrameForHoverLocation:(CGPoint)a3 inView:(id)a4;
- (PKPencilSqueezeInteraction)init;
- (PKPencilSqueezeInteractionDelegate)_delegate;
- (UIView)view;
- (void)_handleRemotePencilSettingDidChangeNotification;
- (void)_performSqueezeAction;
- (void)_setMiniPaletteVisible:(BOOL)a3 hoverLocation:(CGPoint)a4 inView:(id)a5;
- (void)_updateUserInterfaceStyle;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3;
- (void)pencilSqueezeControllerDidChangePaletteViewVisibility:(id)a3;
- (void)pencilSqueezeControllerWillChangePaletteViewVisibility:(id)a3 toVisible:(BOOL)a4;
- (void)set_delegate:(id)a3;
- (void)textEffectsWindowDidChangeKeyWindowBounds:(id)a3;
- (void)textEffectsWindowDidChangeKeyWindowUserInterfaceStyle:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PKPencilSqueezeInteraction

+ (id)_existingInteractionForWindowScene:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (v3)
    {
      v4 = +[PKPencilSqueezeInteraction _perSceneInteractions];
      v5 = [v4 objectForKey:v3];

      goto LABEL_8;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Feature Flag isn't enabled!", v8, 2u);
    }
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)_perSceneInteractions
{
  if (qword_1EB3C60D8 != -1) {
    dispatch_once(&qword_1EB3C60D8, &__block_literal_global_61);
  }
  v2 = (void *)_MergedGlobals_148;

  return v2;
}

void __51__PKPencilSqueezeInteraction__perSceneInteractions__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  v1 = (void *)_MergedGlobals_148;
  _MergedGlobals_148 = v0;
}

+ (void)_postPencilSettingsDidChangeRemoteNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification", 0, 0, 1u);
}

- (PKPencilSqueezeInteraction)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Feature Flag isn't enabled!", buf, 2u);
    }
    goto LABEL_10;
  }
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  if (([v4 isEqualToString:@"com.apple.Stickers.UserGenerated.MessagesExtension"] & 1) != 0|| ([v4 isEqualToString:@"com.apple.iMessageAppsViewService"] & 1) != 0|| [v4 isEqualToString:@"com.apple.UIKit.ColorPickerUIService"])
  {
    v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v12 = v4;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Can't init interaction in process: %{private}@", buf, 0xCu);
    }

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)PKPencilSqueezeInteraction;
  v8 = [(PKPencilSqueezeInteraction *)&v10 init];
  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_PKHandleRemotePencilSettingDidChangeNotification, @"PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  self = v8;
  v6 = self;
LABEL_11:

  return v6;
}

- (void)set_delegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_delegate = &self->__delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != v4)
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = PKDebugStringRepresentation(v8);
      objc_super v10 = PKDebugStringRepresentation(v4);
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Updating delegate from: %@ to %@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeWeak((id *)p_delegate, v4);
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"PKRemotePencilSettingsDidChangePreferredSqueezeActionNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKPencilSqueezeInteraction;
  [(PKPencilSqueezeInteraction *)&v4 dealloc];
}

- (void)_performSqueezeAction
{
}

- (void)_setMiniPaletteVisible:(BOOL)a3 hoverLocation:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = a3;
  objc_msgSend(a5, "convertPoint:toView:", 0, a4.x, a4.y);
  squeezeController = self->_squeezeController;

  [(PKPencilSqueezeController *)(uint64_t)squeezeController setMiniPaletteVisible:v7 hoverLocation:v8];
}

- (BOOL)_paletteViewVisible
{
  squeezeController = self->_squeezeController;
  return squeezeController && squeezeController->_paletteViewVisible;
}

- (void)_updateUserInterfaceStyle
{
}

- (void)_handleRemotePencilSettingDidChangeNotification
{
}

- (void)willMoveToView:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (v4 && !WeakRetained)
  {
    double v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [v4 window];
      v9 = [v8 windowScene];
      int v22 = 138478083;
      id v23 = v4;
      __int16 v24 = 2113;
      v25 = v9;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Installing interaction on view: %{private}@, scene: %{private}@", (uint8_t *)&v22, 0x16u);
    }
    objc_super v10 = [v4 window];
    int v11 = [v10 windowScene];

    if (!v11)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_fault_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_FAULT, "windowScene must not be nil when installing an interaction.", (uint8_t *)&v22, 2u);
      }
    }
    __int16 v13 = +[PKPencilSqueezeInteraction _perSceneInteractions];
    v14 = [v4 window];
    uint64_t v15 = [v14 windowScene];
    [v13 setObject:self forKey:v15];
LABEL_15:

    goto LABEL_16;
  }
  id v16 = objc_loadWeakRetained((id *)&self->_view);

  if (!v4 && v16)
  {
    v17 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_loadWeakRetained((id *)p_view);
      v19 = [v18 window];
      v20 = [v19 windowScene];
      int v22 = 138478083;
      id v23 = v18;
      __int16 v24 = 2113;
      v25 = v20;
      _os_log_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEFAULT, "Uninstalling interaction from view: %{private}@, scene: %{private}@", (uint8_t *)&v22, 0x16u);
    }
    __int16 v13 = +[PKPencilSqueezeInteraction _perSceneInteractions];
    v14 = objc_loadWeakRetained((id *)p_view);
    uint64_t v15 = [v14 window];
    v21 = [v15 windowScene];
    [v13 removeObjectForKey:v21];

    goto LABEL_15;
  }
LABEL_16:
  objc_storeWeak((id *)p_view, v4);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained && (v6 = self->_squeezeController, WeakRetained, !v6))
  {
    id v11 = objc_loadWeakRetained((id *)p_view);
    v12 = [v11 window];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v13 = [PKTextEffectsWindowObserver alloc];
      v14 = objc_loadWeakRetained((id *)p_view);
      uint64_t v15 = [v14 window];
      id v16 = (PKTextEffectsWindowObserver *)-[PKTextEffectsWindowObserver initWithTextEffectsWindow:](v13, v15);
      p_textEffectsWindowObserver = &self->_textEffectsWindowObserver;
      textEffectsWindowObserver = self->_textEffectsWindowObserver;
      self->_textEffectsWindowObserver = v16;
    }
    else
    {
      p_textEffectsWindowObserver = &self->_textEffectsWindowObserver;
      v14 = self->_textEffectsWindowObserver;
      self->_textEffectsWindowObserver = 0;
    }

    if (*p_textEffectsWindowObserver) {
      objc_storeWeak((id *)&(*p_textEffectsWindowObserver)->_delegate, self);
    }
    id v19 = objc_loadWeakRetained((id *)p_view);
    v20 = [v19 window];
    id v26 = [v20 rootViewController];

    v21 = [PKPencilSqueezeController alloc];
    id v22 = objc_loadWeakRetained((id *)p_view);
    id v23 = (PKPencilSqueezeController *)-[PKPencilSqueezeController initWithContainerView:rootViewController:textEffectsWindowObserver:](v21, v22, v26, self->_textEffectsWindowObserver);
    squeezeController = self->_squeezeController;
    self->_squeezeController = v23;

    v25 = self->_squeezeController;
    if (v25) {
      objc_storeWeak((id *)&v25->_delegate, self);
    }
    double v7 = v26;
  }
  else
  {
    double v7 = objc_loadWeakRetained((id *)p_view);
    if (!v7)
    {
      double v8 = self->_squeezeController;
      if (!v8) {
        return;
      }
      objc_storeWeak((id *)&v8->_delegate, 0);
      v9 = self->_squeezeController;
      self->_squeezeController = 0;

      objc_super v10 = self->_textEffectsWindowObserver;
      if (v10)
      {
        objc_storeWeak((id *)&v10->_delegate, 0);
        double v7 = self->_textEffectsWindowObserver;
      }
      else
      {
        double v7 = 0;
      }
      self->_textEffectsWindowObserver = 0;
    }
  }
}

- (BOOL)_isPointInsidePaletteView:(CGPoint)a3 fromView:(id)a4 withEvent:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if ([(PKPencilSqueezeInteraction *)self _paletteViewVisible])
  {
    objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
    __int16 v13 = [(PKPencilSqueezeController *)(uint64_t)self->_squeezeController hitTest:v10 fromView:v11 withEvent:v12];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    id v9 = NSStringFromCGRect(v13);
    int v10 = 138477827;
    double v11 = v9;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "editing overlay container did change to scene bounds: %{private}@", (uint8_t *)&v10, 0xCu);
  }
  -[PKPencilSqueezeController keyWindowDidChangeBounds]((uint64_t)self->_squeezeController);
}

- (void)textEffectsWindowDidChangeKeyWindowBounds:(id)a3
{
}

- (void)textEffectsWindowDidChangeKeyWindowUserInterfaceStyle:(id)a3
{
}

- (BOOL)pencilSqueezeControllerCanShowPaletteView:(id)a3
{
  id v4 = [(PKPencilSqueezeInteraction *)self _delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  v6 = [(PKPencilSqueezeInteraction *)self _delegate];
  char v7 = [v6 _pencilSqueezeInteractionCanShowPaletteView:self];

  return v7;
}

- (void)pencilSqueezeControllerWillChangePaletteViewVisibility:(id)a3 toVisible:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = a3;
  char v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Post palette view visibility will change notification", v10, 2u);
  }

  if (!v6)
  {
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (!v6[216] && v4)
  {
LABEL_6:
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"PKPencilSqueezeInteractionWillShowPaletteViewNotification" object:self];

    goto LABEL_10;
  }
  if (v6[216] && !v4)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"PKPencilSqueezeInteractionWillHidePaletteViewNotification" object:self];

    self->_paletteViewDismissedTimestamp = CACurrentMediaTime();
  }
LABEL_10:
}

- (void)pencilSqueezeControllerDidChangePaletteViewVisibility:(id)a3
{
  BOOL v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Post palette view visibility did change notification", v6, 2u);
  }

  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PKPencilSqueezeInteractionDidChangePaletteViewVisibilityNotification" object:self];
}

- (CGRect)_paletteViewFrameForHoverLocation:(CGPoint)a3 inView:(id)a4
{
  if (a4) {
    objc_msgSend(a4, "convertPoint:toView:", 0, a3.x, a3.y);
  }
  squeezeController = self->_squeezeController;

  double v6 = [(PKPencilSqueezeController *)(uint64_t)squeezeController paletteViewFrameForHoverLocation:a3.y];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (BOOL)_tiledCanvasViewShouldDiscardTapStroke:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = CACurrentMediaTime() - self->_paletteViewDismissedTimestamp;
  double v4 = *(double *)&PKSqueezePaletteElapsedTimeSinceVisibleToDiscardTapStrokes;
  char v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v3 < v4;
    __int16 v8 = 2048;
    double v9 = v3;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Should discard tap stroke: %{BOOL}d, elapsedTimeSincePaletteVisible: %.2f", (uint8_t *)v7, 0x12u);
  }

  return v3 < v4;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (PKPencilSqueezeInteractionDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__delegate);

  return (PKPencilSqueezeInteractionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_textEffectsWindowObserver, 0);

  objc_storeStrong((id *)&self->_squeezeController, 0);
}

@end