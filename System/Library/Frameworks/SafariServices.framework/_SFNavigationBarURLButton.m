@interface _SFNavigationBarURLButton
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (_SFNavigationBarURLButton)initWithFrame:(CGRect)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_dismissMenu:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_hover:(id)a3;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_updateBackgroundImageAnimated:(void *)result;
- (void)_updateEffectView;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)pasteAndGo:(id)a3;
- (void)pasteAndSearch:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverlayConfiguration:(uint64_t)a1;
- (void)setTheme:(uint64_t)a1;
@end

@implementation _SFNavigationBarURLButton

- (_SFNavigationBarURLButton)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_SFNavigationBarURLButton;
  v3 = -[_SFNavigationBarURLButton initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    effectView = v3->_effectView;
    v3->_effectView = v4;

    [(_SFNavigationBarURLButton *)v3 bounds];
    -[UIVisualEffectView setFrame:](v3->_effectView, "setFrame:");
    [(UIVisualEffectView *)v3->_effectView setAutoresizingMask:18];
    [(_SFNavigationBarURLButton *)v3 addSubview:v3->_effectView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UIVisualEffectView *)v3->_effectView bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    effectMask = v3->_effectMask;
    v3->_effectMask = (UIView *)v7;

    [(UIView *)v3->_effectMask setAutoresizingMask:18];
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v3->_effectMask setBackgroundColor:v9];

    v10 = [(UIVisualEffectView *)v3->_effectView contentView];
    [v10 addSubview:v3->_effectMask];

    v3->_backgroundAlphaFactor = 1.0;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:v3];
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = (UIEditMenuInteraction *)v11;

    [(_SFNavigationBarURLButton *)v3 addInteraction:v3->_editMenuInteraction];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel__handleLongPress_];
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UIGestureRecognizer *)v13;

    [(UIGestureRecognizer *)v3->_longPressGestureRecognizer setDelegate:v3];
    [(_SFNavigationBarURLButton *)v3 addGestureRecognizer:v3->_longPressGestureRecognizer];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v3 action:sel__hover_];
    [(_SFNavigationBarURLButton *)v3 addGestureRecognizer:v15];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB2088]) initWithTarget:v3 action:sel__handleLongPress_];
    [(_SFNavigationBarURLButton *)v3 addGestureRecognizer:v16];

    [(_SFNavigationBarURLButton *)v3 addTarget:v3 action:sel__dismissMenu_ forControlEvents:1];
    v17 = (PKScribbleInteraction *)objc_alloc_init(MEMORY[0x1E4F38E40]);
    pencilScribbleInteraction = v3->_pencilScribbleInteraction;
    v3->_pencilScribbleInteraction = v17;

    [(PKScribbleInteraction *)v3->_pencilScribbleInteraction setDelegate:v3];
    [(PKScribbleInteraction *)v3->_pencilScribbleInteraction setElementSource:v3];
    [(_SFNavigationBarURLButton *)v3 addInteraction:v3->_pencilScribbleInteraction];
    v19 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(UIGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
  [(UIGestureRecognizer *)self->_longPressGestureRecognizer removeTarget:self action:sel__handleLongPress_];
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarURLButton;
  [(_SFNavigationBarURLButton *)&v3 dealloc];
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(_SFNavigationBarURLButton *)self layer];
  v9 = [(_SFNavigationBarURLButton *)self layer];
  v10 = [v9 presentationLayer];
  objc_msgSend(v8, "convertPoint:toLayer:", v10, x, y);
  v12.receiver = self;
  v12.super_class = (Class)_SFNavigationBarURLButton;
  LOBYTE(self) = -[_SFNavigationBarURLButton pointMostlyInside:withEvent:](&v12, sel_pointMostlyInside_withEvent_, v7);

  return (char)self;
}

- (void)setTheme:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 816);
    if (v5 != v4)
    {
      objc_super v12 = v4;
      char v6 = [v5 isEqual:v4];
      id v4 = v12;
      if ((v6 & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 816), a2);
        uint64_t v7 = [v12 tintStyle];
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 0, v7);
        v9 = *(void **)(a1 + 752);
        *(void *)(a1 + 752) = v8;

        uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 1, v7);
        uint64_t v11 = *(void **)(a1 + 744);
        *(void *)(a1 + 744) = v10;

        objc_msgSend((id)a1, "_setOverrideUserInterfaceStyle:", objc_msgSend(v12, "platterOverrideUserInterfaceStyle"));
        -[_SFNavigationBarURLButton _updateEffectView](a1);
        id v4 = v12;
      }
    }
  }
}

- (void)_updateEffectView
{
  if (a1)
  {
    int v2 = [(id)a1 isHighlighted];
    objc_super v3 = &OBJC_IVAR____SFNavigationBarURLButton__vibrancyEffect;
    if (v2) {
      objc_super v3 = &OBJC_IVAR____SFNavigationBarURLButton__highlightedVibrancyEffect;
    }
    [*(id *)(a1 + 760) setEffect:*(void *)(a1 + *v3)];
    id v5 = [MEMORY[0x1E4FB1618] blackColor];
    id v4 = [v5 colorWithAlphaComponent:*(double *)(a1 + 808)];
    [*(id *)(a1 + 768) setBackgroundColor:v4];
  }
}

- (void)_updateBackgroundImageAnimated:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    if ([result isHighlighted])
    {
      int v4 = [v3 isTracking];
      double v5 = 0.47;
      if (v4) {
        double v5 = 0.2;
      }
    }
    else
    {
      double v5 = 0.47;
    }
    if (!a2) {
      double v5 = 0.0;
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60___SFNavigationBarURLButton__updateBackgroundImageAnimated___block_invoke;
    v6[3] = &unk_1E5C724D8;
    v6[4] = v3;
    return (void *)[MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v6 options:0 animations:v5 completion:0.0];
  }
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SFNavigationBarURLButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFNavigationBarURLButton;
    [(_SFNavigationBarURLButton *)&v5 setHighlighted:v3];
    if ([(_SFNavigationBarURLButton *)self adjustsImageWhenHighlighted]) {
      -[_SFNavigationBarURLButton _updateBackgroundImageAnimated:](self, 1);
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarURLButtonDidReceiveCopyCommand:self];
}

- (void)pasteAndSearch:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarURLButtonDidReceivePasteCommand:self];
}

- (void)pasteAndGo:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarURLButtonDidReceivePasteCommand:self];
}

- (void)_handleLongPress:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v5 = [WeakRetained navigationBarURLButton:self shouldShowMenuForGestureWithRecognizer:v9];

    if (v5)
    {
      char v6 = (void *)MEMORY[0x1E4FB1750];
      uint64_t v7 = [(UIEditMenuInteraction *)self->_editMenuInteraction view];
      [v9 locationInView:v7];
      uint64_t v8 = objc_msgSend(v6, "configurationWithIdentifier:sourcePoint:", 0);

      [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v8];
    }
  }
}

- (void)_dismissMenu:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = WeakRetained;
  if (sel_copy_ == a3)
  {
    unsigned __int8 v10 = [WeakRetained navigationBarURLButtonShouldCopy:self];
  }
  else if (sel_pasteAndSearch_ == a3 || sel_pasteAndGo_ == a3)
  {
    unsigned __int8 v10 = [WeakRetained navigationBarURLButtonShouldPaste:self];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFNavigationBarURLButton;
    unsigned __int8 v10 = [(_SFNavigationBarURLButton *)&v13 canPerformAction:a3 withSender:v6];
  }
  BOOL v11 = v10;

  return v11;
}

- (void)setOverlayConfiguration:(uint64_t)a1
{
  id v13 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 840);
    objc_storeStrong((id *)(a1 + 840), a2);
    int v5 = [v4 identifier];
    id v6 = [v13 identifier];
    int v7 = WBSIsEqual();

    uint64_t v8 = *(void **)(a1 + 800);
    if (v7)
    {
      [v8 setConfiguration:v13];
    }
    else
    {
      [v8 dismissAndRemove];
      if (v13)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F784B8]);
        [(id)a1 bounds];
        uint64_t v10 = objc_msgSend(v9, "initWithFrame:configuration:", v13);
        BOOL v11 = *(void **)(a1 + 800);
        *(void *)(a1 + 800) = v10;

        [*(id *)(a1 + 800) setAutoresizingMask:18];
        [*(id *)(a1 + 800) _setContinuousCornerRadius:*(double *)(a1 + 832)];
        [(id)a1 addSubview:*(void *)(a1 + 800)];
        [*(id *)(a1 + 800) present];
      }
      else
      {
        objc_super v12 = *(void **)(a1 + 800);
        *(void *)(a1 + 800) = 0;
      }
    }
  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  int v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:focusWillTransformElement:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = [WeakRetained navigationBarURLButtonIsUsingNarrowLayout:self];

  return v7;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  int v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:willBeginWritingInElement:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarURLButtonBeginSuppressingPlaceholder:self];
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  int v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:didFinishWritingInElement:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained navigationBarURLButtonEndSuppressingPlaceholder:self];
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  char v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:shouldBeginAtLocation:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_msgSend(WeakRetained, "navigationBarURLButton:canWriteAtLocation:", self, x, y);

  return v9;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t))a5;
  char v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:requestElementsInRect:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained textFieldIsEditableForNavigationBarURLButton:self])
  {
    char v9 = [WeakRetained textFieldForNavigationBarURLButton:self];
    int v10 = [v9 isFirstResponder];

    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v13[0] = @"pencilTextInputElementIdentifier";
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v6[2](v6, v12, v11);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CBF0], 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  int v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:frameForElement:]();
  }
  [(_SFNavigationBarURLButton *)self bounds];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  double v8 = (void (**)(id, void))a6;
  id v9 = a4;
  int v10 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_SFNavigationBarURLButton _scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v12 = [v9 isEqual:@"pencilTextInputElementIdentifier"];

  if (!v12 || !WeakRetained) {
    v8[2](v8, 0);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v15[3] = &unk_1E5C733F8;
  v17 = self;
  id v18 = v8;
  id v16 = WeakRetained;
  id v13 = WeakRetained;
  v14 = v8;
  [v13 navigationBarURLButtonDidRequestFocusForPencilInput:self completionHandler:v15];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [v6 locationInView:self];
  double v9 = v8;
  double v11 = v10;

  LODWORD(v6) = objc_msgSend(WeakRetained, "navigationBarURLButton:shouldAllowLongPressAtPoint:", self, v9, v11);
  if (!v6) {
    return 0;
  }
  if ([(_SFNavigationBarURLButton *)self canPerformAction:sel_copy_ withSender:0]
    || [(_SFNavigationBarURLButton *)self canPerformAction:sel_pasteAndSearch_ withSender:0])
  {
    return 1;
  }

  return [(_SFNavigationBarURLButton *)self canPerformAction:sel_pasteAndGo_ withSender:0];
}

- (void)_hover:(id)a3
{
  if ((unint64_t)([a3 state] - 1) >= 2) {
    uint64_t v4 = [(_SFNavigationBarURLButton *)self isTracking];
  }
  else {
    uint64_t v4 = 1;
  }

  [(_SFNavigationBarURLButton *)self setHighlighted:v4];
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [v7 locationInView:self];
  double v10 = v9;
  double v12 = v11;

  if (objc_msgSend(WeakRetained, "navigationBarURLButton:shouldAllowLongPressAtPoint:", self, v10, v12))
  {
    id v13 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v14 = objc_msgSend(v13, "safari_pasteAndNavigateCommand");

    v15 = (void *)MEMORY[0x1E4FB1970];
    if (v14)
    {
      v19[0] = v14;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v17 = [v15 menuWithChildren:v16];
    }
    else
    {
      v17 = [MEMORY[0x1E4FB1970] menuWithChildren:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4FB1970] menuWithChildren:MEMORY[0x1E4F1CBF0]];
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_pencilScribbleInteraction, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_effectMask, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);

  objc_storeStrong((id *)&self->_highlightedVibrancyEffect, 0);
}

- (void)_scribbleInteraction:focusWillTransformElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:focusWillTransformElement:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:willBeginWritingInElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:willBeginWritingInElement:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:didFinishWritingInElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:didFinishWritingInElement:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:shouldBeginAtLocation:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:shouldBeginAtLocation:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:requestElementsInRect:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:requestElementsInRect:completion:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:frameForElement:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:frameForElement:", v2, v3, v4, v5, v6);
}

- (void)_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "-_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", v2, v3, v4, v5, v6);
}

@end