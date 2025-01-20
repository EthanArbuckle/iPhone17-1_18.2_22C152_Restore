@interface AXUIFloatingViewPresenter
- (AXUIFloatingViewPresenter)initWithContainingView:(id)a3 alignedToEdge:(unint64_t)a4 withinSafeArea:(BOOL)a5;
- (AXUIFloatingViewPresenterDelegate)delegate;
- (BOOL)withinSafeArea;
- (NSArray)edgeConstraints;
- (UIView)containingView;
- (UIView)floatingView;
- (unint64_t)alignedEdge;
- (void)_hideFloatingView;
- (void)_updateEdgeConstraints;
- (void)dismissFloatingView;
- (void)presentFloatingView:(id)a3 withDuration:(double)a4;
- (void)setAlignedEdge:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeConstraints:(id)a3;
- (void)setFloatingView:(id)a3;
@end

@implementation AXUIFloatingViewPresenter

- (AXUIFloatingViewPresenter)initWithContainingView:(id)a3 alignedToEdge:(unint64_t)a4 withinSafeArea:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXUIFloatingViewPresenter;
  v10 = [(AXUIFloatingViewPresenter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_containingView, a3);
    v11->_alignedEdge = a4;
    v11->_withinSafeArea = a5;
  }

  return v11;
}

- (void)_hideFloatingView
{
  v3 = [(AXUIFloatingViewPresenter *)self floatingView];
  [(AXUIFloatingViewPresenter *)self setFloatingView:0];
  [(AXUIFloatingViewPresenter *)self setEdgeConstraints:0];
  if (v3)
  {
    v4 = [(AXUIFloatingViewPresenter *)self delegate];
    [v4 willDismissFloatingViewForPresenter:self];

    v5 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke;
    v8[3] = &unk_1E649BED8;
    id v9 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke_2;
    v6[3] = &unk_1E649C730;
    id v7 = v9;
    [v5 animateWithDuration:v8 animations:v6 completion:0.3];
  }
}

uint64_t __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __46__AXUIFloatingViewPresenter__hideFloatingView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)presentFloatingView:(id)a3 withDuration:(double)a4
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideFloatingView object:0];
  uint64_t v7 = [(AXUIFloatingViewPresenter *)self floatingView];
  if (v7
    && (v8 = (void *)v7,
        [(AXUIFloatingViewPresenter *)self floatingView],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v6))
  {
    if (a4 > 0.0) {
      [(AXUIFloatingViewPresenter *)self performSelector:sel__hideFloatingView withObject:0 afterDelay:a4];
    }
  }
  else
  {
    [(AXUIFloatingViewPresenter *)self _hideFloatingView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(AXUIFloatingViewPresenter *)self containingView];
    [v10 addSubview:v6];

    [(AXUIFloatingViewPresenter *)self setFloatingView:v6];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(AXUIFloatingViewPresenter *)self floatingView];
    v31 = [v33 leadingAnchor];
    v32 = [(AXUIFloatingViewPresenter *)self containingView];
    v30 = [v32 leadingAnchor];
    v29 = [v31 constraintGreaterThanOrEqualToAnchor:v30];
    v36[0] = v29;
    v28 = [(AXUIFloatingViewPresenter *)self floatingView];
    v26 = [v28 trailingAnchor];
    v27 = [(AXUIFloatingViewPresenter *)self containingView];
    v25 = [v27 trailingAnchor];
    v23 = [v26 constraintLessThanOrEqualToAnchor:v25];
    v36[1] = v23;
    v22 = [(AXUIFloatingViewPresenter *)self floatingView];
    v20 = [v22 topAnchor];
    v21 = [(AXUIFloatingViewPresenter *)self containingView];
    v11 = [v21 topAnchor];
    v12 = [v20 constraintGreaterThanOrEqualToAnchor:v11];
    v36[2] = v12;
    objc_super v13 = [(AXUIFloatingViewPresenter *)self floatingView];
    v14 = [v13 bottomAnchor];
    v15 = [(AXUIFloatingViewPresenter *)self containingView];
    v16 = [v15 bottomAnchor];
    v17 = [v14 constraintLessThanOrEqualToAnchor:v16];
    v36[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v24 activateConstraints:v18];

    [(AXUIFloatingViewPresenter *)self _updateEdgeConstraints];
    v19 = [(AXUIFloatingViewPresenter *)self floatingView];
    [v19 setAlpha:0.0];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke;
    v35[3] = &unk_1E649BED8;
    v35[4] = self;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke_2;
    v34[3] = &unk_1E649C758;
    *(double *)&v34[5] = a4;
    v34[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v35 animations:v34 completion:0.3];
  }
}

void __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) floatingView];
  [v1 setAlpha:1.0];
}

uint64_t __62__AXUIFloatingViewPresenter_presentFloatingView_withDuration___block_invoke_2(uint64_t result)
{
  if (*(double *)(result + 40) > 0.0) {
    return objc_msgSend(*(id *)(result + 32), "performSelector:withObject:afterDelay:", sel__hideFloatingView, 0);
  }
  return result;
}

- (void)dismissFloatingView
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideFloatingView object:0];
  [(AXUIFloatingViewPresenter *)self _hideFloatingView];
}

- (void)setAlignedEdge:(unint64_t)a3
{
  if (self->_alignedEdge != a3)
  {
    self->_alignedEdge = a3;
    [(AXUIFloatingViewPresenter *)self _updateEdgeConstraints];
  }
}

- (void)_updateEdgeConstraints
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v3 = [(AXUIFloatingViewPresenter *)self floatingView];

  if (v3)
  {
    v4 = [(AXUIFloatingViewPresenter *)self edgeConstraints];

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E4F28DC8];
      id v6 = [(AXUIFloatingViewPresenter *)self edgeConstraints];
      [v5 deactivateConstraints:v6];
    }
    BOOL v7 = [(AXUIFloatingViewPresenter *)self withinSafeArea];
    v8 = [(AXUIFloatingViewPresenter *)self containingView];
    id v9 = v8;
    if (v7)
    {
      uint64_t v10 = [v8 safeAreaLayoutGuide];

      id v9 = (void *)v10;
    }
    switch([(AXUIFloatingViewPresenter *)self alignedEdge])
    {
      case 1uLL:
        v22 = [(AXUIFloatingViewPresenter *)self floatingView];
        v11 = [v22 topAnchor];
        v12 = [v9 topAnchor];
        objc_super v13 = [v11 constraintEqualToAnchor:v12];
        v27[0] = v13;
        v14 = [(AXUIFloatingViewPresenter *)self floatingView];
        v15 = [v14 centerXAnchor];
        v16 = [v9 centerXAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v27[1] = v17;
        v18 = v27;
        break;
      case 2uLL:
        v22 = [(AXUIFloatingViewPresenter *)self floatingView];
        v11 = [v22 leadingAnchor];
        v12 = [v9 leadingAnchor];
        objc_super v13 = [v11 constraintEqualToAnchor:v12];
        v25[0] = v13;
        v14 = [(AXUIFloatingViewPresenter *)self floatingView];
        v15 = [v14 centerYAnchor];
        v16 = [v9 centerYAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v25[1] = v17;
        v18 = v25;
        break;
      case 4uLL:
        v22 = [(AXUIFloatingViewPresenter *)self floatingView];
        v11 = [v22 bottomAnchor];
        v12 = [v9 bottomAnchor];
        objc_super v13 = [v11 constraintEqualToAnchor:v12];
        v26[0] = v13;
        v14 = [(AXUIFloatingViewPresenter *)self floatingView];
        v15 = [v14 centerXAnchor];
        v16 = [v9 centerXAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v26[1] = v17;
        v18 = v26;
        break;
      case 8uLL:
        v22 = [(AXUIFloatingViewPresenter *)self floatingView];
        v11 = [v22 trailingAnchor];
        v12 = [v9 trailingAnchor];
        objc_super v13 = [v11 constraintEqualToAnchor:v12];
        v24[0] = v13;
        v14 = [(AXUIFloatingViewPresenter *)self floatingView];
        v15 = [v14 centerYAnchor];
        v16 = [v9 centerYAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v24[1] = v17;
        v18 = v24;
        break;
      default:
        v22 = [(AXUIFloatingViewPresenter *)self floatingView];
        v11 = [v22 centerXAnchor];
        v12 = [v9 centerXAnchor];
        objc_super v13 = [v11 constraintEqualToAnchor:v12];
        v23[0] = v13;
        v14 = [(AXUIFloatingViewPresenter *)self floatingView];
        v15 = [v14 centerYAnchor];
        v16 = [v9 centerYAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v23[1] = v17;
        v18 = v23;
        break;
    }
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [(AXUIFloatingViewPresenter *)self setEdgeConstraints:v19];

    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(AXUIFloatingViewPresenter *)self edgeConstraints];
    [v20 activateConstraints:v21];
  }
}

- (AXUIFloatingViewPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXUIFloatingViewPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)containingView
{
  return self->_containingView;
}

- (unint64_t)alignedEdge
{
  return self->_alignedEdge;
}

- (BOOL)withinSafeArea
{
  return self->_withinSafeArea;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (NSArray)edgeConstraints
{
  return self->_edgeConstraints;
}

- (void)setEdgeConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeConstraints, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end