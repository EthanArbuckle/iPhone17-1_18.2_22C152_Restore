@interface PKPencilSqueezeControllerPaletteViewDelegateProxy
- (BOOL)_isColorPickerVisible;
- (BOOL)isUndoRedoInvoked;
- (BOOL)paletteView:(id)a3 canSelectTool:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)paletteViewCanRedo:(id)a3;
- (BOOL)paletteViewCanUndo:(id)a3;
- (NSUndoManager)cachedUndoManager;
- (id)_currentUndoManager;
- (id)initWithController:(void *)a3 paletteView:;
- (uint64_t)dismissEyeDropper;
- (unint64_t)paletteViewRedoCount:(id)a3;
- (unint64_t)paletteViewUndoCount:(id)a3;
- (void)_changeWasDone:(id)a3;
- (void)_changeWasRedone:(id)a3;
- (void)_changeWasUndone:(id)a3;
- (void)_cycleToolPickerVisible;
- (void)_dismissColorPicker;
- (void)_selectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:(int)a5 callColorSelectionHandler:;
- (void)_updateMoreOptionsViewController;
- (void)autoRefineSettingsDidChange;
- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4;
- (void)didDismissViewController:(uint64_t)a1;
- (void)handwritingEducationPaneSettingsDidChange;
- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4;
- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3;
- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3;
- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3;
- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3;
- (void)paletteView:(id)a3 didSelectColor:(id)a4 isFromExtendedColorPicker:(BOOL)a5 isContinuousColorSelection:(BOOL)a6;
- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5;
- (void)paletteViewDidInvokeAddShape:(id)a3 sourceView:(id)a4;
- (void)paletteViewDidInvokeAddSticker:(id)a3 sourceView:(id)a4;
- (void)paletteViewDidInvokeAddTextBox:(id)a3 sourceView:(id)a4;
- (void)paletteViewDidInvokeExtendedColorPicker:(id)a3 currentSelectedColor:(id)a4 sourceView:(id)a5;
- (void)paletteViewDidInvokeMoreOptions:(id)a3 sourceView:(id)a4;
- (void)paletteViewDidInvokeRedo:(id)a3;
- (void)paletteViewDidInvokeSignature:(id)a3 sourceView:(id)a4;
- (void)paletteViewDidInvokeUndo:(id)a3;
- (void)paletteViewDidTapRuler:(id)a3;
- (void)pencilInteractionSettingsDidChange;
- (void)setCachedUndoManager:(id)a3;
- (void)setIsUndoRedoInvoked:(BOOL)a3;
- (void)stickerPickerViewControllerDidDismiss;
@end

@implementation PKPencilSqueezeControllerPaletteViewDelegateProxy

- (id)initWithController:(void *)a3 paletteView:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKPencilSqueezeControllerPaletteViewDelegateProxy;
    v7 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 1, v5);
      objc_storeWeak(a1 + 2, v6);
      uint64_t v8 = +[PKStatisticsManager sharedStatisticsManager]();
      id v9 = a1[5];
      a1[5] = (id)v8;

      uint64_t v10 = +[PKHoverSettings sharedSettings];
      id v11 = a1[6];
      a1[6] = (id)v10;
    }
  }

  return a1;
}

- (void)pencilInteractionSettingsDidChange
{
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (void)_updateMoreOptionsViewController
{
  if (!a1 || ([a1[4] isBeingDismissed] & 1) != 0) {
    return;
  }
  WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 1);
  -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (PKCurrentDeviceSupportsPencil()) {
    uint64_t v3 = [v16 showsDrawingPolicyControls];
  }
  else {
    uint64_t v3 = 0;
  }
  [a1[4] setShouldShowFingerDrawsOption:v3];
  objc_msgSend(a1[4], "setIsFingerDrawsOn:", objc_msgSend(MEMORY[0x1E4FB1A80], "prefersPencilOnlyDrawing") ^ 1);
  id v4 = objc_loadWeakRetained(a1 + 2);
  id v5 = v4;
  if (v4) {
    id v6 = (void *)*((void *)v4 + 72);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [a1[4] setShouldShowTapToRadarOption:-[PKSqueezePaletteViewContext canShowTapToRadar]((uint64_t)v7)];

  id v8 = objc_loadWeakRetained(a1 + 2);
  id v9 = v8;
  if (v8) {
    uint64_t v10 = (void *)*((void *)v8 + 72);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  [a1[4] setShouldShowResetHandwritingEducationPane:-[PKSqueezePaletteViewContext canShowResetHandwritingEducationPane]((uint64_t)v11)];

  v12 = (id *)objc_loadWeakRetained(a1 + 2);
  objc_super v13 = v12;
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_20;
  }
  id v14 = v12[72];
  if (!v14)
  {
LABEL_20:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  uint64_t v15 = PKCurrentDeviceSupportsPencil();
LABEL_14:
  [a1[4] setShouldShowOpenPencilSettingsOption:v15];

  objc_msgSend(a1[4], "setIsAutoRefineOn:", +[PKSettingsDaemon autoRefineEnabled](PKSettingsDaemon, "autoRefineEnabled"));
}

- (void)autoRefineSettingsDidChange
{
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (void)handwritingEducationPaneSettingsDidChange
{
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle handwriting education pane settings did change", v3, 2u);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController](a1);
  }
}

- (uint64_t)dismissEyeDropper
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 64))
    {
      v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Dismiss eye dropper", v3, 2u);
      }

      return [*(id *)(v1 + 64) dismissEyeDropper];
    }
  }
  return result;
}

- (void)didDismissViewController:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(id *)(a1 + 32) == v3)
  {
    *(void *)(a1 + 32) = 0;
    id v4 = v3;

    id v3 = v4;
  }
}

- (void)_changeWasUndone:(id)a3
{
  if (![(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self isUndoRedoInvoked])
  {
    if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      id v7 = WeakRetained;
      id v5 = (void *)*((void *)WeakRetained + 71);
    }
    else
    {
      id v7 = 0;
      id v5 = 0;
    }
    id v6 = v5;
    [v6 updateUI];
  }
}

- (void)_changeWasRedone:(id)a3
{
  if (![(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self isUndoRedoInvoked])
  {
    if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      id v7 = WeakRetained;
      id v5 = (void *)*((void *)WeakRetained + 71);
    }
    else
    {
      id v7 = 0;
      id v5 = 0;
    }
    id v6 = v5;
    [v6 updateUI];
  }
}

- (void)_changeWasDone:(id)a3
{
  if (![(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self isUndoRedoInvoked])
  {
    if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView)) != 0)
    {
      id v7 = WeakRetained;
      id v5 = (void *)*((void *)WeakRetained + 71);
    }
    else
    {
      id v7 = 0;
      id v5 = 0;
    }
    id v6 = v5;
    [v6 updateUI];
  }
}

- (id)_currentUndoManager
{
  if (a1)
  {
    id WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 1);
    id v3 = -[PKPencilSqueezeController _currentUndoManager](WeakRetained);

    id v4 = [a1 cachedUndoManager];

    if (v4 != v3) {
      [a1 setCachedUndoManager:v3];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setCachedUndoManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

    if (self)
    {
      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

        if (v6)
        {
          id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v8 = *MEMORY[0x1E4F28A80];
          id v9 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          [v7 removeObserver:self name:v8 object:v9];

          uint64_t v10 = *MEMORY[0x1E4F28A78];
          id v11 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          [v7 removeObserver:self name:v10 object:v11];

          uint64_t v12 = *MEMORY[0x1E4F28A68];
          id v13 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
          [v7 removeObserver:self name:v12 object:v13];

          objc_storeWeak((id *)&self->_cachedUndoManager, 0);
        }
      }
    }
    id v14 = objc_storeWeak((id *)&self->_cachedUndoManager, obj);

    if (obj)
    {
      uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v16 = *MEMORY[0x1E4F28A80];
      id v17 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      [v15 addObserver:self selector:sel__changeWasUndone_ name:v16 object:v17];

      uint64_t v18 = *MEMORY[0x1E4F28A78];
      id v19 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      [v15 addObserver:self selector:sel__changeWasRedone_ name:v18 object:v19];

      uint64_t v20 = *MEMORY[0x1E4F28A68];
      id v21 = objc_loadWeakRetained((id *)&self->_cachedUndoManager);
      [v15 addObserver:self selector:sel__changeWasDone_ name:v20 object:v21];
    }
  }
}

- (BOOL)paletteViewCanUndo:(id)a3
{
  id v3 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  char v4 = [v3 canUndo];

  return v4;
}

- (BOOL)paletteViewCanRedo:(id)a3
{
  id v3 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  char v4 = [v3 canRedo];

  return v4;
}

- (void)paletteViewDidInvokeUndo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v6 = -[PKPencilSqueezeController _currentFirstResponder](WeakRetained);

  id v7 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  uint64_t v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSObject _pkDebugStringRepresentation](v6);
    int v14 = 138478083;
    uint64_t v15 = v9;
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Perform undo action, current FR: %{private}@, undoManager: %{private}@", (uint8_t *)&v14, 0x16u);
  }
  [(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self setIsUndoRedoInvoked:1];
  [v7 undo];
  [(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self setIsUndoRedoInvoked:0];
  id v10 = objc_loadWeakRetained((id *)p_controller);
  id v11 = v10;
  if (v10) {
    uint64_t v12 = (void *)*((void *)v10 + 31);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v13);
}

- (void)paletteViewDidInvokeRedo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v6 = -[PKPencilSqueezeController _currentFirstResponder](WeakRetained);

  id v7 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  uint64_t v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSObject _pkDebugStringRepresentation](v6);
    int v14 = 138478083;
    uint64_t v15 = v9;
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Perform redo action, current FR: %{private}@, undoManager: %{private}@", (uint8_t *)&v14, 0x16u);
  }
  [(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self setIsUndoRedoInvoked:1];
  [v7 redo];
  [(PKPencilSqueezeControllerPaletteViewDelegateProxy *)self setIsUndoRedoInvoked:0];
  id v10 = objc_loadWeakRetained((id *)p_controller);
  id v11 = v10;
  if (v10) {
    uint64_t v12 = (void *)*((void *)v10 + 31);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v13);
}

- (unint64_t)paletteViewUndoCount:(id)a3
{
  id v3 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  unint64_t v4 = [v3 undoCount];

  return v4;
}

- (unint64_t)paletteViewRedoCount:(id)a3
{
  id v3 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy _currentUndoManager]((id *)&self->super.isa);
  unint64_t v4 = [v3 redoCount];

  return v4;
}

- (void)paletteViewDidTapRuler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v5 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  id v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138477827;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Ruler tool tapped, notify tool picker: %{private}@", (uint8_t *)&v11, 0xCu);
  }

  if (v5) {
    objc_msgSend(v5, "setRulerActive:", objc_msgSend(v5, "isRulerActive") ^ 1);
  }
  id v7 = objc_loadWeakRetained((id *)p_controller);
  uint64_t v8 = v7;
  if (v7) {
    id v9 = (void *)*((void *)v7 + 31);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v10);
}

- (BOOL)paletteView:(id)a3 canSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  p_controller = &self->_controller;
  id v6 = a4;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)p_controller);
  BOOL v8 = -[PKPencilSqueezeController _canSelectTool:atIndex:](WeakRetained, v6);

  return v8;
}

- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v9 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  id v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138478083;
    id v17 = v6;
    __int16 v18 = 2113;
    id v19 = v9;
    _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Select tool: %{private}@, on tool picker: %{private}@", (uint8_t *)&v16, 0x16u);
  }

  [v9 setSelectedTool:v6];
  id v11 = objc_loadWeakRetained((id *)p_controller);
  uint64_t v12 = v11;
  if (v11) {
    uint64_t v13 = (void *)*((void *)v11 + 31);
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v14);

  uint64_t v15 = (uint64_t *)objc_loadWeakRetained((id *)p_controller);
  -[PKPencilSqueezeController _didSelectTool:atIndex:](v15, v6);
}

- (void)paletteView:(id)a3 didSelectColor:(id)a4 isFromExtendedColorPicker:(BOOL)a5 isContinuousColorSelection:(BOOL)a6
{
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _selectColor:isFromExtendedColorPicker:isContinuousColorSelection:callColorSelectionHandler:]((uint64_t)self, a4, a5, a6, 0);
  if (!a5) {
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _dismissColorPicker]((uint64_t)self);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v11 = WeakRetained;
  if (WeakRetained) {
    id v9 = (void *)*((void *)WeakRetained + 31);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v10);
}

- (void)_selectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:(int)a5 callColorSelectionHandler:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  if (a1)
  {
    if ((a4 & 1) == 0)
    {
      id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
      id v11 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

      uint64_t v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138478083;
        id v23 = v9;
        __int16 v24 = 2113;
        v25 = v11;
        _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Select color: %{private}@, on tool picker: %{private}@", (uint8_t *)&v22, 0x16u);
      }

      [v11 _setSelectedColor:v9 isFromExtendedColorPicker:a3];
    }
    if (a3)
    {
      uint64_t v13 = (id *)(a1 + 16);
      id v14 = objc_loadWeakRetained(v13);
      uint64_t v15 = v14;
      int v16 = v14 ? (void *)*((void *)v14 + 75) : 0;
      id v17 = v16;

      if (v17)
      {
        if (a5)
        {
          id v18 = objc_loadWeakRetained(v13);
          id v19 = v18;
          if (v18) {
            uint64_t v20 = (void *)*((void *)v18 + 75);
          }
          else {
            uint64_t v20 = 0;
          }
          id v21 = v20;
          v21[2](v21, v9, a4);
        }
      }
    }
  }
}

- (void)_dismissColorPicker
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1 && -[PKPencilSqueezeControllerPaletteViewDelegateProxy _isColorPickerVisible](a1))
  {
    v2 = [*(id *)(a1 + 64) viewController];
    id v3 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138477827;
      id v6 = v2;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Dismiss extended color picker: %{private}@", (uint8_t *)&v5, 0xCu);
    }

    [v2 dismissViewControllerAnimated:1 completion:0];
    unint64_t v4 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
  }
}

- (void)paletteViewDidInvokeExtendedColorPicker:(id)a3 currentSelectedColor:(id)a4 sourceView:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  colorPickerController = self->_colorPickerController;
  if (!colorPickerController)
  {
    uint64_t v12 = +[PKPaletteColorPickerControllerFactory makeColorPickerController];
    uint64_t v13 = self->_colorPickerController;
    self->_colorPickerController = v12;

    colorPickerController = self->_colorPickerController;
  }
  id v14 = [(PKPaletteColorPickerController *)colorPickerController viewController];
  if (-[PKPencilSqueezeControllerPaletteViewDelegateProxy _isColorPickerVisible]((BOOL)self))
  {
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _dismissColorPicker]((uint64_t)self);
  }
  else
  {
    id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_paletteView);
    int v16 = WeakRetained;
    if (WeakRetained) {
      uint64_t v17 = WeakRetained[73];
    }
    else {
      uint64_t v17 = 0;
    }
    id v18 = [(PKPaletteColorPickerController *)self->_colorPickerController colorPicker];
    [v18 setColorUserInterfaceStyle:v17];

    id v19 = [(PKPaletteColorPickerController *)self->_colorPickerController colorPicker];
    [v19 setSelectedColor:v9];

    [(PKPaletteColorPickerController *)self->_colorPickerController setDelegate:self];
    uint64_t v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138477827;
      id v23 = v14;
      _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "Show extended color picker: %{private}@", (uint8_t *)&v22, 0xCu);
    }

    id v21 = objc_loadWeakRetained((id *)&self->_controller);
    -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v21, v14, v10);
  }
}

- (BOOL)_isColorPickerVisible
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [*(id *)(result + 64) viewController];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    BOOL v4 = -[PKPencilSqueezeController _isPresentedViewController:]((uint64_t)WeakRetained, v2);

    return v4;
  }
  return result;
}

- (void)paletteViewDidInvokeAddTextBox:(id)a3 sourceView:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v7 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  id v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138477827;
    id v14 = v7;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Add text box, tool picker: %{private}@", (uint8_t *)&v13, 0xCu);
  }

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  -[PKToolPicker _handleDidInvokeAddTextBox]((uint64_t)v7);
  id v9 = objc_loadWeakRetained((id *)p_controller);
  id v10 = v9;
  if (v9) {
    id v11 = (void *)*((void *)v9 + 31);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v12);
}

- (void)_cycleToolPickerVisible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (id *)(a1 + 8);
    id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
    id v3 = -[PKPencilSqueezeController _keyWindow](WeakRetained);

    BOOL v4 = (uint64_t *)objc_loadWeakRetained(v1);
    int v5 = -[PKPencilSqueezeController _toolPickerForKeyWindow](v4);

    id v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138478083;
      id v8 = v5;
      __int16 v9 = 2113;
      id v10 = v3;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Cycle tool picker visibility, toolPicker: %{private}@, window: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v5, v3, 0, 1, 0);
    -[PKToolPicker _setVisibleInWindow:animated:notify:completion:]((uint64_t)v5, 0, 0, 1, 0);
  }
}

- (void)paletteViewDidInvokeSignature:(id)a3 sourceView:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v8 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  if (self->_lastPresentedSignaturesViewController)
  {
    __int16 v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      lastPresentedSignaturesViewController = self->_lastPresentedSignaturesViewController;
      int v27 = 138478083;
      v28 = lastPresentedSignaturesViewController;
      __int16 v29 = 2113;
      v30 = v8;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Hide Signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
    }

    [(UIViewController *)self->_lastPresentedSignaturesViewController dismissViewControllerAnimated:1 completion:0];
    uint64_t v11 = self->_lastPresentedSignaturesViewController;
    self->_lastPresentedSignaturesViewController = 0;
LABEL_16:

    id v24 = objc_loadWeakRetained((id *)p_controller);
    uint64_t v11 = v24;
    if (v24) {
      v25 = (void *)*((void *)v24 + 31);
    }
    else {
      v25 = 0;
    }
    id v18 = v25;
    -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v18);
    goto LABEL_19;
  }
  id v12 = (id *)objc_loadWeakRetained((id *)&self->_controller);
  int v13 = v12;
  if (v12) {
    uint64_t v11 = objc_loadWeakRetained(v12 + 29);
  }
  else {
    uint64_t v11 = 0;
  }

  uint64_t v14 = [v8 _signaturesViewControllerProvider];
  uint64_t v15 = (void *)v14;
  if (v14)
  {
    uint64_t v16 = (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v11);
    if (v16)
    {
      uint64_t v17 = (UIViewController *)v16;
LABEL_13:
      uint64_t v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138478083;
        v28 = v17;
        __int16 v29 = 2113;
        v30 = v8;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "Show signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
      }

      id v21 = self->_lastPresentedSignaturesViewController;
      self->_lastPresentedSignaturesViewController = v17;
      int v22 = v17;

      id v23 = objc_loadWeakRetained((id *)p_controller);
      -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v23, v22, v5);

      goto LABEL_16;
    }
  }
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  id v18 = [v8 _signaturesViewControllerProvider];

  if (v18)
  {
    uint64_t v19 = v18[2](v18, v11);
    if (v19)
    {
      uint64_t v17 = (UIViewController *)v19;
      uint64_t v15 = v18;
      goto LABEL_13;
    }
  }
  uint64_t v26 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = 138478083;
    v28 = 0;
    __int16 v29 = 2113;
    v30 = v8;
    _os_log_error_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_ERROR, "Failed to show signature view controller: %{private}@, toolPicker: %{private}@", (uint8_t *)&v27, 0x16u);
  }

LABEL_19:
}

- (void)paletteViewDidInvokeAddShape:(id)a3 sourceView:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  p_controller = &self->_controller;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v8 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  __int16 v9 = [v8 _shapeButtonViewController];
  if (v9
    || (-[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self),
        [v8 _shapeButtonViewController],
        (__int16 v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138478083;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Show Shapes view controller: %{private}@, toolPicker: %@", (uint8_t *)&v16, 0x16u);
    }

    id v11 = objc_loadWeakRetained((id *)p_controller);
    -[PKPencilSqueezeController _togglePresentViewControllerAsPopover:sourceView:]((uint64_t)v11, v9, v5);

    id v12 = objc_loadWeakRetained((id *)p_controller);
    int v13 = v12;
    if (v12) {
      uint64_t v14 = (void *)*((void *)v12 + 31);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v15);
  }
  else
  {
    __int16 v9 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138477827;
      uint64_t v17 = v8;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "Failed to show shapes view controller for toolPicker: %{private}@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)paletteViewDidInvokeAddSticker:(id)a3 sourceView:(id)a4
{
  id v5 = a4;
  id v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Show stickers UI", v17, 2u);
  }

  stickerPickerViewController = self->_stickerPickerViewController;
  if (stickerPickerViewController)
  {
    [(_UIStickerPickerViewController *)stickerPickerViewController dismissCardAnimated:0];
    id v8 = self->_stickerPickerViewController;
    self->_stickerPickerViewController = 0;
  }
  __int16 v9 = (_UIStickerPickerViewController *)objc_alloc_init(MEMORY[0x1E4FB2388]);
  id v10 = self->_stickerPickerViewController;
  self->_stickerPickerViewController = v9;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);
  [(_UIStickerPickerViewController *)self->_stickerPickerViewController setSourceView:WeakRetained];

  [v5 frame];
  -[_UIStickerPickerViewController setSourceRect:](self->_stickerPickerViewController, "setSourceRect:");
  [(_UIStickerPickerViewController *)self->_stickerPickerViewController setDelegate:self];
  id v12 = objc_loadWeakRetained((id *)&self->_controller);
  -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v12, self->_stickerPickerViewController, v5);

  id v13 = objc_loadWeakRetained((id *)&self->_controller);
  uint64_t v14 = v13;
  if (v13) {
    id v15 = (void *)*((void *)v13 + 31);
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v16);
}

- (void)paletteViewDidInvokeMoreOptions:(id)a3 sourceView:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_moreOptionsViewControllerVisible ^= 1u;
  id v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL moreOptionsViewControllerVisible = self->_moreOptionsViewControllerVisible;
    moreOptionsViewController = self->_moreOptionsViewController;
    int v11 = [(PKPaletteMoreOptionsViewController *)moreOptionsViewController isBeingDismissed];
    int v12 = [(PKPaletteMoreOptionsViewController *)self->_moreOptionsViewController isBeingPresented];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v25 = moreOptionsViewControllerVisible;
    *(_WORD *)&v25[4] = 2048;
    *(void *)&v25[6] = moreOptionsViewController;
    __int16 v26 = 1024;
    int v27 = v11;
    __int16 v28 = 1024;
    int v29 = v12;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "moreOptionsViewControllerVisible: %d, _moreOptionsViewController: %p, dismissing: %d, presenting: %d", buf, 0x1Eu);
  }

  if (self->_moreOptionsViewControllerVisible)
  {
    if ([(PKPaletteMoreOptionsViewController *)self->_moreOptionsViewController isBeingDismissed]) {
      int v13 = 1;
    }
    else {
      int v13 = [(PKPaletteMoreOptionsViewController *)self->_moreOptionsViewController isBeingPresented];
    }
    uint64_t v17 = objc_alloc_init(PKPaletteMoreOptionsViewController);
    __int16 v18 = self->_moreOptionsViewController;
    self->_moreOptionsViewController = v17;

    [(PKPaletteMoreOptionsViewController *)self->_moreOptionsViewController setDelegate:self];
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy _updateMoreOptionsViewController]((id *)&self->super.isa);
    uint64_t v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = self->_moreOptionsViewController;
      *(_DWORD *)buf = 134218240;
      *(void *)v25 = v20;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = v13;
      _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Show More view controller: %p, afterDelay: %{BOOL}d", buf, 0x12u);
    }

    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __96__PKPencilSqueezeControllerPaletteViewDelegateProxy_paletteViewDidInvokeMoreOptions_sourceView___block_invoke;
    v21[3] = &unk_1E64C66B8;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v7;
    PKPerformOnMainThreadNextRunLoop(v21, v13);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_moreOptionsViewController;
      *(_DWORD *)buf = 138477827;
      *(void *)v25 = v15;
      _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Hide More view controller: %{private}@", buf, 0xCu);
    }

    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_controller);
    -[PKPencilSqueezeController _dismissPopovers](WeakRetained);
  }
}

void __96__PKPencilSqueezeControllerPaletteViewDelegateProxy_paletteViewDidInvokeMoreOptions_sourceView___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 24))
  {
    BOOL v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v3[4];
      int v7 = [v6 isBeingDismissed];
      int v8 = [v3[4] isBeingPresented];
      int v9 = 134218496;
      id v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "delayed show More view controller: %p, dismissing: %d, presenting: %d", (uint8_t *)&v9, 0x18u);
    }

    id v5 = objc_loadWeakRetained(v3 + 1);
    -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:]((uint64_t)v5, v3[4], *(void **)(a1 + 32));
  }
}

- (void)moreOptionsViewControllerDidToggleFingerDraws:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 isFingerDrawsOn];
  id v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Toggle draw with finger setting, isFingerDrawsOn: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  +[PKSettingsDaemon setPrefersPencilOnlyDrawing:v4 ^ 1u];
  -[PKStatisticsManager recordDrawWithFingerToggle:]((uint64_t)self->_statisticsManager);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  int v7 = WeakRetained;
  if (WeakRetained) {
    int v8 = (void *)*((void *)WeakRetained + 31);
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v9);
}

- (void)moreOptionsViewControllerDidSelectOpenPencilSettings:(id)a3
{
  int v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Open pencil settings", v9, 2u);
  }

  +[PKSettingsDaemon openPencilPreferences];
  -[PKStatisticsManager recordJumpToSettings]((uint64_t)self->_statisticsManager);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = WeakRetained;
  if (WeakRetained) {
    int v7 = (void *)*((void *)WeakRetained + 31);
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v8);
}

- (void)moreOptionsViewControllerDidSelectTapToRadar:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v6 = WeakRetained;
  if (WeakRetained) {
    int v4 = (void *)*((void *)WeakRetained + 31);
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;
  -[PKPencilSqueezeAnalyticsController didUseMiniPalette]((uint64_t)v5);
}

- (void)moreOptionsViewControllerDidToggleAutoRefine:(id)a3
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self->_moreOptionsViewController isAutoRefineOn];

  +[PKSettingsDaemon setAutoRefineEnabled:v3];
}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 colorPicker];
  id v7 = [v6 selectedColor];

  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _selectColor:isFromExtendedColorPicker:isContinuousColorSelection:callColorSelectionHandler:]((uint64_t)self, v7, 1, v4, 1);
}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  -[PKPencilSqueezeControllerPaletteViewDelegateProxy _cycleToolPickerVisible]((uint64_t)self);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)&self->_controller);
  id v7 = -[PKPencilSqueezeController _toolPickerForKeyWindow](WeakRetained);

  id v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138477827;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Insert sticker, tool picker: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  -[PKToolPicker _handleInsertStickerFromItemProvider:]((uint64_t)v7, v5);
  [(_UIStickerPickerViewController *)self->_stickerPickerViewController dismissCardAnimated:1];
  stickerPickerViewController = self->_stickerPickerViewController;
  self->_stickerPickerViewController = 0;
}

- (void)stickerPickerViewControllerDidDismiss
{
  stickerPickerViewController = self->_stickerPickerViewController;
  self->_stickerPickerViewController = 0;
}

- (NSUndoManager)cachedUndoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedUndoManager);

  return (NSUndoManager *)WeakRetained;
}

- (BOOL)isUndoRedoInvoked
{
  return self->_isUndoRedoInvoked;
}

- (void)setIsUndoRedoInvoked:(BOOL)a3
{
  self->_isUndoRedoInvoked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedUndoManager);
  objc_storeStrong((id *)&self->_stickerPickerViewController, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_lastPresentedSignaturesViewController, 0);
  objc_storeStrong((id *)&self->_hoverSettings, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_moreOptionsViewController, 0);
  objc_destroyWeak((id *)&self->_paletteView);

  objc_destroyWeak((id *)&self->_controller);
}

@end