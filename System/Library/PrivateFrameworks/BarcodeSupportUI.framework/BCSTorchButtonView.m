@interface BCSTorchButtonView
- (BCSTorchButtonView)init;
- (BCSTorchButtonViewDelegate)delegate;
- (void)_torchButtonPressed:(id)a3;
- (void)_updateTorchButtonTintColor;
- (void)rotationAnimationDidFinish;
- (void)rotationAnimationWillStart;
- (void)setDelegate:(id)a3;
- (void)torchActivenessChangedTo:(BOOL)a3;
- (void)torchAvailabilityChangedTo:(BOOL)a3;
@end

@implementation BCSTorchButtonView

- (BCSTorchButtonView)init
{
  v46[10] = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)BCSTorchButtonView;
  v2 = [(BCSTorchButtonView *)&v45 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F824E8] buttonWithType:0];
    torchButton = v2->_torchButton;
    v2->_torchButton = (UIButton *)v3;

    [(UIButton *)v2->_torchButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = [MEMORY[0x263F82818] configurationWithPointSize:30.0];
    v44 = [MEMORY[0x263F827E8] _systemImageNamed:@"flashlight.on.fill" withConfiguration:v35];
    v36 = [MEMORY[0x263F827E8] _systemImageNamed:@"flashlight.off.fill" withConfiguration:v35];
    [(UIButton *)v2->_torchButton setImage:v36 forState:0];
    [(UIButton *)v2->_torchButton setImage:v44 forState:4];
    [(BCSTorchButtonView *)v2 _updateTorchButtonTintColor];
    -[UIButton _setTouchInsets:](v2->_torchButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(UIButton *)v2->_torchButton addTarget:v2 action:sel__torchButtonPressed_ forControlEvents:0x2000];
    id v5 = objc_alloc(MEMORY[0x263F82E50]);
    v6 = [MEMORY[0x263F824D8] effectWithStyle:2];
    uint64_t v7 = [v5 initWithEffect:v6];
    torchButtonPlatter = v2->_torchButtonPlatter;
    v2->_torchButtonPlatter = (UIVisualEffectView *)v7;

    [(UIVisualEffectView *)v2->_torchButtonPlatter setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v2->_torchButtonPlatter _setCornerRadius:30.0];
    [(UIVisualEffectView *)v2->_torchButtonPlatter setClipsToBounds:1];
    v9 = [(UIVisualEffectView *)v2->_torchButtonPlatter contentView];
    [v9 addSubview:v2->_torchButton];

    [(BCSTorchButtonView *)v2 addSubview:v2->_torchButtonPlatter];
    v10 = (void *)MEMORY[0x263F08938];
    v43 = [(UIButton *)v2->_torchButton leadingAnchor];
    v34 = [(UIVisualEffectView *)v2->_torchButtonPlatter leadingAnchor];
    v33 = objc_msgSend(v43, "constraintEqualToAnchor:");
    v46[0] = v33;
    v42 = [(UIButton *)v2->_torchButton trailingAnchor];
    v32 = [(UIVisualEffectView *)v2->_torchButtonPlatter trailingAnchor];
    v31 = objc_msgSend(v42, "constraintEqualToAnchor:");
    v46[1] = v31;
    v41 = [(UIButton *)v2->_torchButton topAnchor];
    v30 = [(UIVisualEffectView *)v2->_torchButtonPlatter topAnchor];
    v29 = objc_msgSend(v41, "constraintEqualToAnchor:");
    v46[2] = v29;
    v40 = [(UIButton *)v2->_torchButton bottomAnchor];
    v28 = [(UIVisualEffectView *)v2->_torchButtonPlatter bottomAnchor];
    v27 = objc_msgSend(v40, "constraintEqualToAnchor:");
    v46[3] = v27;
    v39 = [(UIVisualEffectView *)v2->_torchButtonPlatter leadingAnchor];
    v26 = [(BCSTorchButtonView *)v2 leadingAnchor];
    v25 = objc_msgSend(v39, "constraintEqualToAnchor:");
    v46[4] = v25;
    v38 = [(UIVisualEffectView *)v2->_torchButtonPlatter trailingAnchor];
    v24 = [(BCSTorchButtonView *)v2 trailingAnchor];
    v23 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v46[5] = v23;
    v37 = [(UIVisualEffectView *)v2->_torchButtonPlatter topAnchor];
    v22 = [(BCSTorchButtonView *)v2 topAnchor];
    v21 = objc_msgSend(v37, "constraintEqualToAnchor:");
    v46[6] = v21;
    v11 = [(UIVisualEffectView *)v2->_torchButtonPlatter bottomAnchor];
    v12 = [(BCSTorchButtonView *)v2 bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v46[7] = v13;
    v14 = [(UIVisualEffectView *)v2->_torchButtonPlatter widthAnchor];
    v15 = [v14 constraintEqualToConstant:60.0];
    v46[8] = v15;
    v16 = [(UIVisualEffectView *)v2->_torchButtonPlatter heightAnchor];
    v17 = [v16 constraintEqualToConstant:60.0];
    v46[9] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:10];
    [v10 activateConstraints:v18];

    v19 = v2;
  }

  return v2;
}

- (void)torchAvailabilityChangedTo:(BOOL)a3
{
}

- (void)torchActivenessChangedTo:(BOOL)a3
{
  if (!a3)
  {
    [(UIButton *)self->_torchButton setSelected:0];
    [(BCSTorchButtonView *)self _updateTorchButtonTintColor];
    id v4 = [MEMORY[0x263F824D8] effectWithStyle:2];
    -[UIVisualEffectView setEffect:](self->_torchButtonPlatter, "setEffect:");
  }
}

- (void)rotationAnimationWillStart
{
}

- (void)rotationAnimationDidFinish
{
  [(UIVisualEffectView *)self->_torchButtonPlatter setAlpha:0.0];
  [(UIVisualEffectView *)self->_torchButtonPlatter setHidden:0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__BCSTorchButtonView_rotationAnimationDidFinish__block_invoke;
  v3[3] = &unk_26524BFA8;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.2];
}

uint64_t __48__BCSTorchButtonView_rotationAnimationDidFinish__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

- (void)_torchButtonPressed:(id)a3
{
  id v8 = a3;
  int v4 = [v8 isSelected];
  uint64_t v5 = v4 ^ 1u;
  [(UIButton *)self->_torchButton setSelected:v5];
  if (v4) {
    [MEMORY[0x263F824D8] effectWithStyle:2];
  }
  else {
  v6 = [MEMORY[0x263F824D8] effectWithStyle:1];
  }
  [(UIVisualEffectView *)self->_torchButtonPlatter setEffect:v6];

  [(BCSTorchButtonView *)self _updateTorchButtonTintColor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained torchButtonView:self torchModeChangedTo:v5];
}

- (void)_updateTorchButtonTintColor
{
  if ([(UIButton *)self->_torchButton isSelected]) {
    [MEMORY[0x263F825C8] systemBlueColor];
  }
  else {
  id v4 = [MEMORY[0x263F825C8] systemWhiteColor];
  }
  uint64_t v3 = [(UIButton *)self->_torchButton imageView];
  [v3 setTintColor:v4];
}

- (BCSTorchButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCSTorchButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_torchButton, 0);

  objc_storeStrong((id *)&self->_torchButtonPlatter, 0);
}

@end