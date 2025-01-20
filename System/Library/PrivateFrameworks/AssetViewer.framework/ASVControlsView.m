@interface ASVControlsView
- (ASVControlsView)initWithArrangedSubviews:(id)a3;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UIAccessibilityHUDGestureManager)largeTextHUDGestureManager;
- (UIStackView)stackView;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_buttonAtPoint:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4;
- (void)setLargeTextHUDGestureManager:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation ASVControlsView

- (ASVControlsView)initWithArrangedSubviews:(id)a3
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ASVControlsView;
  v5 = -[ASVControlsView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(ASVControlsView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v4];
    id v33 = v4;
    stackView = v6->_stackView;
    v6->_stackView = (UIStackView *)v7;

    [(UIStackView *)v6->_stackView setDistribution:3];
    [(UIStackView *)v6->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v6->_stackView setSpacing:10.0];
    [(ASVControlsView *)v6 addSubview:v6->_stackView];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UIStackView *)v6->_stackView leadingAnchor];
    v31 = [(ASVControlsView *)v6 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v35[0] = v30;
    v29 = [(UIStackView *)v6->_stackView trailingAnchor];
    v9 = [(ASVControlsView *)v6 trailingAnchor];
    v10 = [v29 constraintEqualToAnchor:v9];
    v35[1] = v10;
    v11 = [(UIStackView *)v6->_stackView topAnchor];
    v12 = [(ASVControlsView *)v6 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v35[2] = v13;
    v14 = [(UIStackView *)v6->_stackView bottomAnchor];
    v15 = [(ASVControlsView *)v6 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v35[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [v28 activateConstraints:v17];

    id v4 = v33;
    v18 = [(ASVControlsView *)v6 layer];
    [v18 setMasksToBounds:0];

    v19 = [(ASVControlsView *)v6 layer];
    LODWORD(v20) = *(_DWORD *)"\nף=";
    [v19 setShadowOpacity:v20];

    double v21 = *MEMORY[0x1E4F1DB30];
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v23 = [(ASVControlsView *)v6 layer];
    objc_msgSend(v23, "setShadowOffset:", v21, v22);

    v24 = [(ASVControlsView *)v6 layer];
    [v24 setShadowRadius:20.0];

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4FB13D8]) initWithView:v6 delegate:v6];
    largeTextHUDGestureManager = v6->_largeTextHUDGestureManager;
    v6->_largeTextHUDGestureManager = (UIAccessibilityHUDGestureManager *)v25;
  }
  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ASVControlsView;
  -[ASVControlsView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ASVControlsView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v8 = 0;
  }
  else
  {
    v6 = [(ASVControlsView *)self stackView];
    if (v5 == v6) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v5;
    }
    v8 = v7;
  }
  return v8;
}

- (id)_buttonAtPoint:(CGPoint)a3
{
  v3 = -[ASVControlsView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }

  return v4;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  id v4 = -[ASVControlsView _buttonAtPoint:](self, "_buttonAtPoint:", a3, a4.x, a4.y);
  v5 = v4;
  if (v4)
  {
    v6 = [v4 superview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 superview];
      [v8 largeImageInsets];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      double v10 = *MEMORY[0x1E4FB2848];
      double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    id v18 = objc_alloc(MEMORY[0x1E4FB13E0]);
    v19 = [v5 titleForState:0];
    double v20 = [v5 imageForState:0];
    v17 = objc_msgSend(v18, "initWithTitle:image:imageInsets:scaleImage:", v19, v20, 1, v10, v12, v14, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  id v4 = -[ASVControlsView _buttonAtPoint:](self, "_buttonAtPoint:", a3, a4.x, a4.y);
  v5 = v4;
  if (v4)
  {
    [v4 sendActionsForControlEvents:64];
    [v5 setHighlighted:1];
    dispatch_time_t v6 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ASVControlsView__accessibilityHUDGestureManager_gestureLiftedAtPoint___block_invoke;
    block[3] = &unk_1E6DD7810;
    id v8 = v5;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__ASVControlsView__accessibilityHUDGestureManager_gestureLiftedAtPoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIAccessibilityHUDGestureManager)largeTextHUDGestureManager
{
  return self->_largeTextHUDGestureManager;
}

- (void)setLargeTextHUDGestureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end