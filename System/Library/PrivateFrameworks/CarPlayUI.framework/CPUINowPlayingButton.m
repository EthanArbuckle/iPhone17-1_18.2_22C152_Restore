@interface CPUINowPlayingButton
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (CPUINowPlayingButton)init;
- (CPUINowPlayingButton)initWithBundleIdentifier:(id)a3;
- (CPUINowPlayingButton)initWithFrame:(CGRect)a3;
- (NSString)bundleIdentifier;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CPUINowPlayingButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CPUINowPlayingButton)init
{
  return -[CPUINowPlayingButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 32.0, 44.0);
}

- (CPUINowPlayingButton)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(CPUINowPlayingButton *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (CPUINowPlayingButton)initWithFrame:(CGRect)a3
{
  v45[8] = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)CPUINowPlayingButton;
  v3 = -[CPUINowPlayingButton initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = CPUIFrameworkBundle();
    id v5 = [v4 URLForResource:@"BouncingBars" withExtension:@"caml"];

    if (v5)
    {
      v6 = (void *)MEMORY[0x263F827E8];
      v7 = CPUIFrameworkBundle();
      v8 = [v6 imageNamed:@"CarNowPlayingBarsPlatter" inBundle:v7];
      v43 = [v8 imageWithRenderingMode:2];

      id v9 = objc_alloc(MEMORY[0x263F82828]);
      v10 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
      v11 = [v43 _flatImageWithColor:v10];
      v12 = [MEMORY[0x263F825C8] _carSystemFocusColor];
      v13 = [v43 _flatImageWithColor:v12];
      uint64_t v14 = [v9 initWithImage:v11 highlightedImage:v13];
      focusBackgroundView = v3->_focusBackgroundView;
      v3->_focusBackgroundView = (UIImageView *)v14;

      [(UIImageView *)v3->_focusBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
      v16 = [(UIImageView *)v3->_focusBackgroundView layer];
      [v16 setMasksToBounds:1];

      [(UIImageView *)v3->_focusBackgroundView _setContinuousCornerRadius:16.0];
      [(UIImageView *)v3->_focusBackgroundView setUserInteractionEnabled:0];
      [(CPUINowPlayingButton *)v3 addSubview:v3->_focusBackgroundView];
      v17 = [[CPUINowPlayingButtonView alloc] initWithCAML:v5];
      nowPlayingView = v3->_nowPlayingView;
      v3->_nowPlayingView = v17;

      [(CPUINowPlayingButtonView *)v3->_nowPlayingView setUserInteractionEnabled:0];
      [(CPUINowPlayingButtonView *)v3->_nowPlayingView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v19) = 1148846080;
      [(CPUINowPlayingButtonView *)v3->_nowPlayingView setContentCompressionResistancePriority:0 forAxis:v19];
      [(CPUINowPlayingButton *)v3 addSubview:v3->_nowPlayingView];
      v35 = (void *)MEMORY[0x263F08938];
      v42 = [(UIImageView *)v3->_focusBackgroundView heightAnchor];
      v41 = [v42 constraintEqualToConstant:32.0];
      v45[0] = v41;
      v40 = [(UIImageView *)v3->_focusBackgroundView widthAnchor];
      v39 = [v40 constraintEqualToConstant:32.0];
      v45[1] = v39;
      v38 = [(UIImageView *)v3->_focusBackgroundView centerYAnchor];
      v37 = [(CPUINowPlayingButton *)v3 centerYAnchor];
      v36 = [v38 constraintEqualToAnchor:v37];
      v45[2] = v36;
      v34 = [(UIImageView *)v3->_focusBackgroundView leadingAnchor];
      v33 = [(CPUINowPlayingButton *)v3 leadingAnchor];
      v32 = [v34 constraintEqualToAnchor:v33];
      v45[3] = v32;
      v31 = [(CPUINowPlayingButtonView *)v3->_nowPlayingView centerYAnchor];
      v30 = [(UIImageView *)v3->_focusBackgroundView centerYAnchor];
      v29 = [v31 constraintEqualToAnchor:v30];
      v45[4] = v29;
      v20 = [(CPUINowPlayingButtonView *)v3->_nowPlayingView centerXAnchor];
      v21 = [(UIImageView *)v3->_focusBackgroundView centerXAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v45[5] = v22;
      v23 = [(CPUINowPlayingButtonView *)v3->_nowPlayingView widthAnchor];
      v24 = [v23 constraintEqualToConstant:32.0];
      v45[6] = v24;
      v25 = [(CPUINowPlayingButtonView *)v3->_nowPlayingView heightAnchor];
      v26 = [v25 constraintEqualToConstant:32.0];
      v45[7] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:8];
      [v35 activateConstraints:v27];

      [(CPUINowPlayingButton *)v3 setHighlighted:0];
      [(CPUINowPlayingButtonView *)v3->_nowPlayingView setStateName:@"Pause"];
    }
    [(CPUINowPlayingButton *)v3 setNeedsLayout];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 32.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [a3 nextFocusedItem];
  [(CPUINowPlayingButton *)self setHighlighted:v5 == self];
}

- (void)setHighlighted:(BOOL)a3
{
  id v5 = [(CPUINowPlayingButton *)self traitCollection];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __39__CPUINowPlayingButton_setHighlighted___block_invoke;
  v10 = &unk_26482D348;
  BOOL v12 = a3;
  v11 = self;
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263F82DA0], "_currentTraitCollection", v7, v8);
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v5];
    v9((uint64_t)&v7);
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v6];
  }
}

void __39__CPUINowPlayingButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)CPUINowPlayingButton;
  objc_msgSendSuper2(&v6, sel_setHighlighted_, v2);
  [*(id *)(*(void *)(a1 + 32) + 744) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 752);
  if (v3) {
    [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
  }
  [v4 setBackgroundColor:v5];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_focusBackgroundView, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
}

@end