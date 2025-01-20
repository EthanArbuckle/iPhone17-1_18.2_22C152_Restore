@interface PKSqueezePaletteViewUndoRedoLayout
- (BOOL)_isLTR;
- (PKSqueezePaletteView)paletteView;
- (id)initWithUndoButton:(void *)a3 redoButton:(double)a4 startAngle:;
- (uint64_t)_performRedoAction;
- (uint64_t)_performUndoAction;
- (uint64_t)_updateRedoButtonConstraints;
- (uint64_t)_updateUndoButtonConstraints;
- (void)_handleRedoButtonLongPressGestureRecognizer:(id)a3;
- (void)_handleUndoButtonLongPressGestureRecognizer:(id)a3;
- (void)handleLongPressGestureRecognizer:(void *)a3 forButton:;
- (void)setPaletteView:(id)a3;
- (void)setupUI;
- (void)updateUI;
- (void)willTransitionToLayout:(id)a3;
@end

@implementation PKSqueezePaletteViewUndoRedoLayout

- (id)initWithUndoButton:(void *)a3 redoButton:(double)a4 startAngle:
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  id v25 = a3;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)PKSqueezePaletteViewUndoRedoLayout;
    v8 = (id *)objc_msgSendSuper2(&v31, sel_init);
    a1 = v8;
    if (v8)
    {
      v9 = v8 + 14;
      objc_storeStrong(v8 + 14, a2);
      objc_storeStrong(a1 + 15, a3);
      *((double *)a1 + 13) = a4;
      a1[7] = (id)PKSqueezePaletteButtonInterItemSpacing;
      objc_initWeak(&location, a1);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke;
      v28[3] = &unk_1E64C5998;
      objc_copyWeak(&v29, &location);
      objc_msgSend(*v9, "_set_pk_longSqueezeAction:", v28);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke_2;
      v26[3] = &unk_1E64C5998;
      objc_copyWeak(&v27, &location);
      objc_msgSend(a1[15], "_set_pk_longSqueezeAction:", v26);
      double v10 = PKSqueezePaletteButtonSize();
      double v12 = v11;
      v23 = (void *)MEMORY[0x1E4F28DC8];
      v13 = [*v9 heightAnchor];
      v14 = [v13 constraintEqualToConstant:v10];
      v32[0] = v14;
      v15 = [*v9 widthAnchor];
      v16 = [v15 constraintEqualToConstant:v12];
      v32[1] = v16;
      v17 = [a1[15] heightAnchor];
      v18 = [v17 constraintEqualToConstant:v10];
      v32[2] = v18;
      v19 = [a1[15] widthAnchor];
      v20 = [v19 constraintEqualToConstant:v12];
      v32[3] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
      [v23 activateConstraints:v21];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewUndoRedoLayout _performUndoAction]((uint64_t)WeakRetained);
}

- (uint64_t)_performUndoAction
{
  if (result)
  {
    v1 = (void *)result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    -[PKSqueezePaletteView _didUndo]((uint64_t)WeakRetained);

    return [v1 updateUI];
  }
  return result;
}

void __79__PKSqueezePaletteViewUndoRedoLayout_initWithUndoButton_redoButton_startAngle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteViewUndoRedoLayout _performRedoAction]((uint64_t)WeakRetained);
}

- (uint64_t)_performRedoAction
{
  if (result)
  {
    v1 = (void *)result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    -[PKSqueezePaletteView _didRedo]((uint64_t)WeakRetained);

    return [v1 updateUI];
  }
  return result;
}

- (void)_handleUndoButtonLongPressGestureRecognizer:(id)a3
{
}

- (void)handleLongPressGestureRecognizer:(void *)a3 forButton:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = (id *)(a1 + 88);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v9 = -[PKSqueezePaletteView _undoCount]((uint64_t)WeakRetained);

    id v10 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v11 = -[PKSqueezePaletteView _redoCount]((uint64_t)v10);

    double v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412802;
      id v24 = v5;
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "Undo/redo button long press gesture recognizer handled: %@, undoCount: %lu, redoCount: %li", (uint8_t *)&v23, 0x20u);
    }

    if (v9 + v11)
    {
      if ([v5 state] == 1 && !*(unsigned char *)(a1 + 64))
      {
        v15 = -[PKSqueezePaletteViewExpandedUndoRedoLayoutContext initWithSliderButton:sliderButtonLongPressGestureRecognizer:previousLayout:]((id *)[PKSqueezePaletteViewExpandedUndoRedoLayoutContext alloc], v6, v5, (void *)a1);
        id v16 = objc_loadWeakRetained((id *)(a1 + 88));
        v17 = v16;
        if (v16) {
          v18 = (void *)*((void *)v16 + 70);
        }
        else {
          v18 = 0;
        }
        id v19 = v18;
        BOOL v20 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR](a1);
        v21 = -[PKSqueezePaletteViewLayoutFactory makeExpandedUndoRedoLayoutWithContext:isLTR:]((uint64_t)v19, v15, v20);

        id v22 = objc_loadWeakRetained(v7);
        -[PKSqueezePaletteView setCurrentLayout:]((uint64_t)v22, v21);

LABEL_15:
        goto LABEL_16;
      }
      if ([v5 state] == 3 && *(unsigned char *)(a1 + 64))
      {
        v13 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Removing undo button long press gesture recognizer", (uint8_t *)&v23, 2u);
        }

        [*(id *)(a1 + 112) removeGestureRecognizer:*(void *)(a1 + 72)];
        [*(id *)(a1 + 120) removeGestureRecognizer:*(void *)(a1 + 80)];
        v14 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;

        v15 = *(id **)(a1 + 80);
        *(void *)(a1 + 80) = 0;
        goto LABEL_15;
      }
    }
  }
LABEL_16:
}

- (void)_handleRedoButtonLongPressGestureRecognizer:(id)a3
{
}

- (BOOL)_isLTR
{
  if (!a1) {
    return 0;
  }
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  BOOL v3 = objc_msgSend(v1, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(WeakRetained, "semanticContentAttribute")) == 0;

  return v3;
}

- (uint64_t)_updateUndoButtonConstraints
{
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 88));
    BOOL v3 = WeakRetained;
    if (WeakRetained) {
      double v4 = WeakRetained[62];
    }
    else {
      double v4 = 0.0;
    }
    double v5 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, *(double *)(v1 + 40));
    double v7 = v6;

    [*(id *)(v1 + 8) setConstant:v5];
    v8 = *(void **)(v1 + 16);
    return [v8 setConstant:v7];
  }
  return result;
}

- (uint64_t)_updateRedoButtonConstraints
{
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = (double *)objc_loadWeakRetained((id *)(result + 88));
    BOOL v3 = WeakRetained;
    if (WeakRetained) {
      double v4 = WeakRetained[62];
    }
    else {
      double v4 = 0.0;
    }
    double v5 = PKPointOnArc(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, *(double *)(v1 + 48));
    double v7 = v6;

    [*(id *)(v1 + 24) setConstant:v5];
    v8 = *(void **)(v1 + 32);
    return [v8 setConstant:v7];
  }
  return result;
}

- (void)setupUI
{
  v68[8] = *MEMORY[0x1E4F143B8];
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    self->_didTransitionToExpandedLayout = 0;
    [(UIButton *)self->_undoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_redoButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_loadWeakRetained((id *)p_paletteView);
    double v6 = v5;
    if (v5) {
      double v7 = (void *)*((void *)v5 + 69);
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;
    [v8 addSubview:self->_undoButton];

    id v9 = objc_loadWeakRetained((id *)p_paletteView);
    id v10 = v9;
    if (v9) {
      uint64_t v11 = (void *)*((void *)v9 + 69);
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    [v12 addSubview:self->_redoButton];

    v13 = [(UIButton *)self->_undoButton centerXAnchor];
    id v14 = objc_loadWeakRetained((id *)p_paletteView);
    v15 = [v14 centerXAnchor];
    id v16 = [v13 constraintEqualToAnchor:v15];
    undoButtonCenterXConstraint = self->_undoButtonCenterXConstraint;
    self->_undoButtonCenterXConstraint = v16;

    v18 = [(UIButton *)self->_undoButton centerYAnchor];
    id v19 = objc_loadWeakRetained((id *)p_paletteView);
    BOOL v20 = [v19 centerYAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    undoButtonCenterYConstraint = self->_undoButtonCenterYConstraint;
    self->_undoButtonCenterYConstraint = v21;

    int v23 = [(UIButton *)self->_redoButton centerXAnchor];
    id v24 = objc_loadWeakRetained((id *)p_paletteView);
    __int16 v25 = [v24 centerXAnchor];
    uint64_t v26 = [v23 constraintEqualToAnchor:v25];
    redoButtonCenterXConstraint = self->_redoButtonCenterXConstraint;
    self->_redoButtonCenterXConstraint = v26;

    uint64_t v28 = [(UIButton *)self->_redoButton centerYAnchor];
    id location = (id *)p_paletteView;
    id v29 = objc_loadWeakRetained((id *)p_paletteView);
    v30 = [v29 centerYAnchor];
    objc_super v31 = [v28 constraintEqualToAnchor:v30];
    redoButtonCenterYConstraint = self->_redoButtonCenterYConstraint;
    self->_redoButtonCenterYConstraint = v31;

    double v33 = PKSqueezePaletteButtonSize();
    double v35 = v34;
    v66 = (void *)MEMORY[0x1E4F28DC8];
    v36 = self->_undoButtonCenterYConstraint;
    v68[0] = self->_undoButtonCenterXConstraint;
    v68[1] = v36;
    v37 = [(UIButton *)self->_undoButton heightAnchor];
    uint64_t v38 = [v37 constraintEqualToConstant:v33];
    v68[2] = v38;
    v39 = [(UIButton *)self->_undoButton widthAnchor];
    v40 = [v39 constraintEqualToConstant:v35];
    v41 = self->_redoButtonCenterXConstraint;
    v42 = self->_redoButtonCenterYConstraint;
    v68[3] = v40;
    v68[4] = v41;
    v68[5] = v42;
    v43 = [(UIButton *)self->_redoButton heightAnchor];
    v44 = [v43 constraintEqualToConstant:v33];
    v68[6] = v44;
    v45 = [(UIButton *)self->_redoButton widthAnchor];
    v46 = [v45 constraintEqualToConstant:v35];
    v68[7] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:8];
    [v66 activateConstraints:v47];

    double startAngle = self->_startAngle;
    id v49 = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v38) = objc_opt_respondsToSelector();

    if (v38)
    {
      id v50 = objc_loadWeakRetained((id *)&self->_delegate);
      [v50 undoRedoLayoutStartAngle:self];
      double startAngle = v51;
    }
    BOOL v52 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR]((uint64_t)self);
    if (v52) {
      uint64_t v53 = 40;
    }
    else {
      uint64_t v53 = 48;
    }
    if (v52) {
      uint64_t v54 = 48;
    }
    else {
      uint64_t v54 = 40;
    }
    *(double *)((char *)&self->super.isa + v53) = startAngle;
    double v55 = v35 + self->_interItemSpace;
    v56 = (double *)objc_loadWeakRetained(location);
    if (v56) {
      double v57 = v56[62];
    }
    else {
      double v57 = 0.0;
    }
    *(double *)((char *)&self->super.isa + v54) = startAngle + v55 / v57;

    -[PKSqueezePaletteViewUndoRedoLayout _updateUndoButtonConstraints]((uint64_t)self);
    -[PKSqueezePaletteViewUndoRedoLayout _updateRedoButtonConstraints]((uint64_t)self);
    [(UIButton *)self->_undoButton addTarget:self action:sel__didTapUndoButton_ forControlEvents:64];
    [(UIButton *)self->_redoButton addTarget:self action:sel__didTapRedoButton_ forControlEvents:64];
    v58 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleUndoButtonLongPressGestureRecognizer_];
    undoButtonLongPressGestureRecognizer = self->_undoButtonLongPressGestureRecognizer;
    self->_undoButtonLongPressGestureRecognizer = v58;

    [(UIButton *)self->_undoButton addGestureRecognizer:self->_undoButtonLongPressGestureRecognizer];
    v60 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleRedoButtonLongPressGestureRecognizer_];
    redoButtonLongPressGestureRecognizer = self->_redoButtonLongPressGestureRecognizer;
    self->_redoButtonLongPressGestureRecognizer = v60;

    [(UIButton *)self->_redoButton addGestureRecognizer:self->_redoButtonLongPressGestureRecognizer];
    BOOL v62 = -[PKSqueezePaletteViewUndoRedoLayout _isLTR]((uint64_t)self);
    if (v62) {
      uint64_t v63 = 40;
    }
    else {
      uint64_t v63 = 48;
    }
    if (v62) {
      uint64_t v64 = 48;
    }
    else {
      uint64_t v64 = 40;
    }
    id v65 = objc_loadWeakRetained(location);
    -[PKSqueezePaletteView updateUIStartAngle:endAngle:clockwise:animated:]((uint64_t)v65, 1, 1, *(double *)((char *)&self->super.isa + v63), *(double *)((char *)&self->super.isa + v64));
  }
}

- (void)updateUI
{
  p_paletteView = &self->_paletteView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_paletteView);
    uint64_t v6 = -[PKSqueezePaletteView _canUndo]((uint64_t)v5);

    [(UIButton *)self->_undoButton setEnabled:v6];
    id v7 = objc_loadWeakRetained((id *)p_paletteView);
    uint64_t v8 = -[PKSqueezePaletteView _canRedo]((uint64_t)v7);

    [(UIButton *)self->_redoButton setEnabled:v8];
    CGAffineTransformMakeRotation(&v14, self->_undoButtonAngle + 1.57079633);
    undoButton = self->_undoButton;
    CGAffineTransform v13 = v14;
    [(UIButton *)undoButton setTransform:&v13];
    CGAffineTransformMakeRotation(&v12, self->_redoButtonAngle + 1.57079633);
    redoButton = self->_redoButton;
    CGAffineTransform v11 = v12;
    [(UIButton *)redoButton setTransform:&v11];
    [(UIButton *)self->_redoButton setAlpha:1.0];
    [(UIButton *)self->_undoButton setAlpha:1.0];
  }
}

- (void)willTransitionToLayout:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      id v5 = v4[3];
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = (void *)*((void *)v5 + 1);
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = 0;
LABEL_5:
    uint64_t v8 = v7;

    redoButton = self->_redoButton;
    if (v8 != self->_undoButton)
    {
      if (v8 != redoButton)
      {
LABEL_9:

        goto LABEL_10;
      }
      redoButton = self->_undoButton;
    }
    [(UIButton *)redoButton setAlpha:0.0];
    goto LABEL_9;
  }
LABEL_10:
  [(UIButton *)self->_undoButton removeTarget:self action:sel__didTapUndoButton_ forControlEvents:64];
  [(UIButton *)self->_redoButton removeTarget:self action:sel__didTapRedoButton_ forControlEvents:64];
  self->_didTransitionToExpandedLayout = 1;
  id v10 = (void *)MEMORY[0x1E4F28DC8];
  undoButtonCenterXConstraint = self->_undoButtonCenterXConstraint;
  long long v13 = *(_OWORD *)&self->_undoButtonCenterYConstraint;
  redoButtonCenterYConstraint = self->_redoButtonCenterYConstraint;
  CGAffineTransform v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&undoButtonCenterXConstraint count:4];
  [v10 deactivateConstraints:v11];
}

- (PKSqueezePaletteView)paletteView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paletteView);

  return (PKSqueezePaletteView *)WeakRetained;
}

- (void)setPaletteView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_paletteView);
  objc_storeStrong((id *)&self->_redoButtonLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_undoButtonLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_redoButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_redoButtonCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_undoButtonCenterYConstraint, 0);

  objc_storeStrong((id *)&self->_undoButtonCenterXConstraint, 0);
}

@end