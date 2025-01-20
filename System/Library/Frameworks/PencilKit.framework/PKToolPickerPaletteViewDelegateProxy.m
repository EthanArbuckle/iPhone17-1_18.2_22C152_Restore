@interface PKToolPickerPaletteViewDelegateProxy
- (BOOL)paletteView:(id)a3 shouldChangeSelectedToolColor:(id)a4;
- (BOOL)shouldHandlePencilInteractionWhenNotVisible:(id)a3;
- (BOOL)toggleLassoToolEditingViewColorPickerForPaletteView:(id)a3;
- (CGRect)paletteViewColorPickerPopoverPresentationSourceRect:(id)a3;
- (id)initWithToolPicker:(id *)a1;
- (id)paletteViewColorPickerPopoverPresentationSourceView:(id)a3;
- (id)paletteViewCurrentFirstResponder:(id)a3;
- (id)paletteViewCurrentSelectionColor:(id)a3;
- (id)paletteViewUndoManager:(id)a3;
- (void)imageWandOnboardingControllerDidHideView:(id)a3;
- (void)paletteView:(id)a3 didChangeColor:(id)a4;
- (void)paletteView:(id)a3 didChangeTraitCollection:(id)a4;
- (void)paletteView:(id)a3 didReceivePencilInteractionDidTap:(id)a4;
- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5;
- (void)paletteViewContentSizeDidChange:(id)a3;
- (void)paletteViewDidChangePosition:(id)a3 fromPosition:(int64_t)a4 toPosition:(int64_t)a5;
- (void)paletteViewDidChangeScaleFactor:(id)a3;
- (void)paletteViewDidToggleRuler:(id)a3;
- (void)paletteViewFirstResponderDidUpdate:(id)a3;
- (void)paletteViewToolsDidChange:(id)a3;
@end

@implementation PKToolPickerPaletteViewDelegateProxy

- (id)initWithToolPicker:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKToolPickerPaletteViewDelegateProxy;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (void)paletteViewContentSizeDidChange:(id)a3
{
  if (self) {
    self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  id v3 = self;
  [(PKToolPickerPaletteViewDelegateProxy *)self _paletteContentSizeDidChange];
}

- (void)paletteViewDidChangeScaleFactor:(id)a3
{
  if (self) {
    self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  id v3 = self;
  [(PKToolPickerPaletteViewDelegateProxy *)self _notifyScaleFactorDidChange];
}

- (id)paletteViewCurrentFirstResponder:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  v4 = [WeakRetained _currentFirstResponder];

  return v4;
}

- (void)paletteViewFirstResponderDidUpdate:(id)a3
{
  v4 = [a3 windowFirstResponder];
  if ([v4 isVisible]
    && (([v4 isEditableTextInput] & 1) != 0 || objc_msgSend(v4, "hasScribbleInteraction")))
  {
    if ([v4 textInputSource] == 3)
    {
      BOOL v5 = 1;
      if (!self) {
        goto LABEL_26;
      }
LABEL_8:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
      goto LABEL_9;
    }
    BOOL v5 = [v4 textInputSource] == 0;
    if (self) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = 0;
    if (self) {
      goto LABEL_8;
    }
  }
LABEL_26:
  id WeakRetained = 0;
LABEL_9:
  int v7 = [WeakRetained _isHandwritingToolSelected] ^ 1 | v5;

  if (v7 == 1)
  {
    if (self) {
      id v8 = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id v8 = 0;
    }
    id v16 = +[PKToolPicker _windowForToolPicker:v8];
  }
  else
  {
    id v16 = 0;
  }
  if (self) {
    id v9 = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id v9 = 0;
  }
  int v10 = [v9 isVisible];

  if (self)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_toolPicker);
    [v11 _setVisibleInWindow:v16];

    id v12 = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else
  {
    [0 _setVisibleInWindow:v16];
    id v12 = 0;
  }
  int v13 = [v12 isVisible];

  if (v10 != v13)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    v14 = +[PKToolPicker _windowSceneForToolPicker:self];

    v15 = +[PKTextInputInteraction interactionForScene:v14];
    [v15 _updateKeyboardSuppressionPolicy];
  }
}

- (id)paletteViewUndoManager:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  objc_super v6 = [WeakRetained _delegateForSelector:sel__toolPickerUndoManager_];

  if (v6)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    int v7 = [v6 _toolPickerUndoManager:self];
  }
  else
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    id v8 = [(PKToolPickerPaletteViewDelegateProxy *)self _currentFirstResponder];
    int v7 = [v8 undoManager];
  }

  return v7;
}

- (void)paletteView:(id)a3 didReceivePencilInteractionDidTap:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  char v8 = [WeakRetained isVisible];

  if ((v8 & 1) == 0)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    [(PKToolPickerPaletteViewDelegateProxy *)self _updatePaletteView:v9];
  }
}

- (BOOL)paletteView:(id)a3 shouldChangeSelectedToolColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v9 = [WeakRetained _delegateForSelector:sel__toolPicker_shouldChangeSelectedToolColor_];

  if (v9)
  {
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id v10 = 0;
    }
    char v11 = [v9 _toolPicker:v10 shouldChangeSelectedToolColor:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (id)paletteViewCurrentSelectionColor:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained _delegateForSelector:sel__toolPickerCurrentSelectionColor_];

  if (v6)
  {
    if (self) {
      id v7 = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id v7 = 0;
    }
    char v8 = [v6 _toolPickerCurrentSelectionColor:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)paletteView:(id)a3 didSelectTool:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  char v8 = [a3 selectedTool];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v10 = [WeakRetained selectedTool];
  if ([v10 _isLassoTool]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [v8 _isLassoTool];
  }

  if (self) {
    id v12 = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id v12 = 0;
  }
  [v12 _setSelectedTool:v8 saveState:1 updateUI:v11];

  int v13 = [v7 ink];

  if ([v13 _isGenerationTool])
  {
    BOOL v14 = +[PKImageWandOnboardingController canShowOnboardingView];

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_toolPicker);
      id v16 = [v15 _applicationWindow];
      v17 = [v16 rootViewController];

      if (v17)
      {
        v18 = [PKImageWandOnboardingController alloc];
        id v19 = objc_loadWeakRetained((id *)&self->_toolPicker);
        v20 = (PKImageWandOnboardingController *)-[PKImageWandOnboardingController initWithPresentationViewController:toolPicker:]((id *)&v18->super.isa, v17, v19);
        imageWandOnboardingController = self->_imageWandOnboardingController;
        self->_imageWandOnboardingController = v20;

        v22 = self->_imageWandOnboardingController;
        if (v22)
        {
          objc_storeWeak((id *)&v22->_delegate, self);
          v23 = self->_imageWandOnboardingController;
        }
        else
        {
          v23 = 0;
        }
        -[PKImageWandOnboardingController showOnboardingViewAfterDelay:]((uint64_t)v23, 0.1);
      }
      else
      {
        v24 = os_log_create("com.apple.pencilkit", "ToolPicker");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v25 = 0;
          _os_log_error_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_ERROR, "Unable to present Image Wand Onboarding UI; no presentation view controller",
            v25,
            2u);
        }
      }
    }
  }
  else
  {
  }
}

- (void)paletteViewToolsDidChange:(id)a3
{
  id v4 = a3;
  id v8 = [v4 tools];
  BOOL v5 = [v4 selectedTool];

  if (self)
  {
    p_toolPicker = &self->_toolPicker;
    id WeakRetained = objc_loadWeakRetained((id *)p_toolPicker);
    [WeakRetained _resetTools:v8 selectedTool:v5];

    self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)p_toolPicker);
  }
  else
  {
    [0 _resetTools:v8 selectedTool:v5];
  }
  [(PKToolPickerPaletteViewDelegateProxy *)self _saveToolPickerState];
}

- (void)paletteViewDidToggleRuler:(id)a3
{
  id v10 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
    if ([WeakRetained _isHandwritingToolSelected])
    {
      id v5 = objc_loadWeakRetained((id *)&self->_toolPicker);
      goto LABEL_4;
    }
  }
  else
  {
    id WeakRetained = 0;
    id v5 = 0;
    if ([0 _isHandwritingToolSelected])
    {
LABEL_4:
      int v6 = [v5 isRulerActive];

      if (!v6) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }

LABEL_8:
  if (self) {
    id v7 = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id v7 = 0;
  }
  objc_msgSend(v7, "setRulerActive:", objc_msgSend(v7, "isRulerActive") ^ 1);

LABEL_11:
  if (self) {
    self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  int v8 = [(PKToolPickerPaletteViewDelegateProxy *)self isRulerActive];

  if (v8)
  {
    id v9 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordShowRuler]((uint64_t)v9);
  }
}

- (void)paletteView:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 horizontalSizeClass];
  id v9 = [v6 traitCollection];
  if (v8 == [v9 horizontalSizeClass])
  {
    uint64_t v10 = [v7 verticalSizeClass];
    uint64_t v11 = [v6 traitCollection];
    uint64_t v12 = [v11 verticalSizeClass];

    if (v10 == v12) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  BOOL v14 = objc_msgSend(WeakRetained, "_observers", v7, v6, (void)v25);
  id v15 = (void *)[v14 copy];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector())
        {
          if (self) {
            id v21 = objc_loadWeakRetained((id *)&self->_toolPicker);
          }
          else {
            id v21 = 0;
          }
          [v20 toolPickerFramesObscuredDidChange:v21];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v22 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v17 = v22;
    }
    while (v22);
  }

  id v7 = v23;
  id v6 = v24;
LABEL_21:
}

- (void)paletteViewDidChangePosition:(id)a3 fromPosition:(int64_t)a4 toPosition:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v7 = [WeakRetained _observers];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          if (self) {
            id v14 = objc_loadWeakRetained((id *)&self->_toolPicker);
          }
          else {
            id v14 = 0;
          }
          [v13 _toolPickerDidChangePosition:v14];
        }
        if (objc_opt_respondsToSelector())
        {
          if (self) {
            id v15 = objc_loadWeakRetained((id *)&self->_toolPicker);
          }
          else {
            id v15 = 0;
          }
          [v13 _toolPickerDidChangePosition:v15 fromPosition:a4 toPosition:a5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v16 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v10 = v16;
    }
    while (v16);
  }
}

- (void)paletteView:(id)a3 didChangeColor:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v6;
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v9 = [WeakRetained _observers];
    uint64_t v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector())
          {
            if (self) {
              id v16 = objc_loadWeakRetained((id *)&self->_toolPicker);
            }
            else {
              id v16 = 0;
            }
            [v15 _toolPicker:v16 didChangeColor:v7];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v17 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v12 = v17;
      }
      while (v17);
    }

    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    id v6 = v18;
    [(PKToolPickerPaletteViewDelegateProxy *)self _saveToolPickerState];
  }
}

- (CGRect)paletteViewColorPickerPopoverPresentationSourceRect:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained _delegateForSelector:sel__colorPickerPopoverPresentationBarButtonItem_];

  if (v6)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    id v7 = [v6 _colorPickerPopoverPresentationBarButtonItem:self];

    self = [v7 view];
    [(PKToolPickerPaletteViewDelegateProxy *)self bounds];
  }
  else
  {
    if (self) {
      id v12 = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id v12 = 0;
    }
    id v7 = [v12 _delegateForSelector:sel__colorPickerPopoverPresentationSourceRect_];

    if (!v7)
    {
      double v13 = *MEMORY[0x1E4F1DB28];
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_14;
    }
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    [v7 _colorPickerPopoverPresentationSourceRect:self];
  }
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;
  double v16 = v11;

LABEL_14:
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)paletteViewColorPickerPopoverPresentationSourceView:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained _delegateForSelector:sel__colorPickerPopoverPresentationBarButtonItem_];

  if (v6)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    id v7 = [v6 _colorPickerPopoverPresentationBarButtonItem:self];

    id v8 = [v7 view];
  }
  else
  {
    if (self) {
      id v10 = objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    else {
      id v10 = 0;
    }
    id v7 = [v10 _delegateForSelector:sel__colorPickerPopoverPresentationSourceView_];

    if (v7)
    {
      if (self) {
        id v11 = objc_loadWeakRetained((id *)&self->_toolPicker);
      }
      else {
        id v11 = 0;
      }
      double v9 = [v7 _colorPickerPopoverPresentationSourceView:v11];

      goto LABEL_14;
    }
    id v8 = v4;
  }
  double v9 = v8;
LABEL_14:

  return v9;
}

- (BOOL)shouldHandlePencilInteractionWhenNotVisible:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  char v4 = [WeakRetained _isInputViewVisible];

  return v4;
}

- (BOOL)toggleLassoToolEditingViewColorPickerForPaletteView:(id)a3
{
  id v4 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = [WeakRetained _delegateForSelector:sel__toggleLassoToolEditingViewColorPickerForToolPicker_];

  if (v6)
  {
    if (self) {
      self = (PKToolPickerPaletteViewDelegateProxy *)objc_loadWeakRetained((id *)&self->_toolPicker);
    }
    [v6 _toggleLassoToolEditingViewColorPickerForToolPicker:self];
  }
  return v6 != 0;
}

- (void)imageWandOnboardingControllerDidHideView:(id)a3
{
  id v4 = (PKImageWandOnboardingController *)a3;
  id v5 = os_log_create("com.apple.pencilkit", "ToolPicker");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Image Wand Onboarding UI did dismiss", v6, 2u);
  }

  if (self->_imageWandOnboardingController == v4)
  {
    self->_imageWandOnboardingController = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWandOnboardingController, 0);

  objc_destroyWeak((id *)&self->_toolPicker);
}

@end