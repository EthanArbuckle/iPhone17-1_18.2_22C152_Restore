@interface AVTToolBar
+ (double)defaultToolBarHeight;
- (AVTToolBar)initWithButtons:(id)a3;
- (AVTToolBarDelegate)delegate;
- (BOOL)isAnimating;
- (NSArray)buttons;
- (UIView)border;
- (UIVisualEffectView)visualEffectView;
- (double)borderWidth;
- (id)buttonWithTitle:(id)a3 isDefault:(BOOL)a4;
- (void)buttonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setBorder:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3 forButtonAtIndex:(unint64_t)a4;
- (void)setIsAnimating:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)setupBorder;
- (void)setupView;
@end

@implementation AVTToolBar

+ (double)defaultToolBarHeight
{
  return 60.0;
}

- (AVTToolBar)initWithButtons:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTToolBar;
  v5 = -[AVTToolBar initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__AVTToolBar_initWithButtons___block_invoke;
    v11[3] = &unk_263FF2108;
    v7 = v5;
    v12 = v7;
    uint64_t v8 = objc_msgSend(v4, "avt_map:", v11);
    buttons = v7->_buttons;
    v7->_buttons = (NSArray *)v8;

    [(AVTToolBar *)v7 setupView];
    [(AVTToolBar *)v7 setupBorder];
  }
  return v6;
}

id __30__AVTToolBar_initWithButtons___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 title];
  uint64_t v5 = [v3 isDefault];

  v6 = [v2 buttonWithTitle:v4 isDefault:v5];

  return v6;
}

- (id)buttonWithTitle:(id)a3 isDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [MEMORY[0x263F1C488] buttonWithType:1];
  uint64_t v8 = v7;
  if (v4) {
    [v7 setRole:1];
  }
  [v8 setTitle:v6 forState:0];
  [v8 addTarget:self action:sel_buttonPressed_ forControlEvents:64];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [v8 widthAnchor];
  v10 = [v9 constraintGreaterThanOrEqualToConstant:90.0];
  [v10 setActive:1];

  return v8;
}

- (void)setupBorder
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  [(AVTToolBar *)self bounds];
  BOOL v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
  border = self->_border;
  self->_border = v4;

  id v6 = +[AVTUIColorRepository separatorColor];
  [(UIView *)self->_border setBackgroundColor:v6];

  [(UIView *)self->_border setAutoresizingMask:34];
  v7 = self->_border;
  [(AVTToolBar *)self addSubview:v7];
}

- (void)setupView
{
  v20[3] = *MEMORY[0x263EF8340];
  v19 = [MEMORY[0x263F1C480] effectWithStyle:9];
  v18 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v19];
  [(AVTToolBar *)self bounds];
  objc_msgSend(v18, "setFrame:");
  [v18 setAutoresizingMask:18];
  [(AVTToolBar *)self addSubview:v18];
  [(AVTToolBar *)self setVisualEffectView:v18];
  id v3 = (objc_class *)MEMORY[0x263F1C9B8];
  BOOL v4 = self;
  id v5 = [v3 alloc];
  id v6 = [(AVTToolBar *)v4 buttons];
  v7 = (void *)[v5 initWithArrangedSubviews:v6];

  [v7 setAlignment:3];
  [v7 setDistribution:1];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setSpacing:8.0];
  [(AVTToolBar *)v4 addSubview:v7];
  v17 = [v7 topAnchor];
  v16 = [(AVTToolBar *)v4 topAnchor];
  uint64_t v8 = [v17 constraintEqualToAnchor:v16];
  v20[0] = v8;
  v9 = [v7 bottomAnchor];
  v10 = [(AVTToolBar *)v4 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v20[1] = v11;
  v12 = [v7 trailingAnchor];
  objc_super v13 = [(AVTToolBar *)v4 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:-20.0];
  v20[2] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  [(AVTToolBar *)v4 addConstraints:v15];
}

- (double)borderWidth
{
  return AVTRoundToViewScale(self, 1.0);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AVTToolBar;
  [(AVTToolBar *)&v8 layoutSubviews];
  [(AVTToolBar *)self bounds];
  double v4 = v3;
  [(AVTToolBar *)self borderWidth];
  double v6 = v5;
  v7 = [(AVTToolBar *)self border];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    BOOL v3 = a3;
    self->_isAnimating = a3;
    double v5 = [(AVTToolBar *)self visualEffectView];
    [v5 setHidden:v3];

    if (v3) {
      [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    }
    else {
    id v6 = [MEMORY[0x263F1C550] clearColor];
    }
    [(AVTToolBar *)self setBackgroundColor:v6];
  }
}

- (void)setEnabled:(BOOL)a3 forButtonAtIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  v7 = [(AVTToolBar *)self buttons];
  unint64_t v8 = [v7 count];

  if (v8 > a4)
  {
    v9 = [(AVTToolBar *)self buttons];
    id v11 = [v9 objectAtIndexedSubscript:a4];

    [v11 setEnabled:v5];
    double v10 = 0.7;
    if (v5) {
      double v10 = 1.0;
    }
    [v11 setAlpha:v10];
  }
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTToolBar *)self buttons];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v7 = [(AVTToolBar *)self delegate];
  [v7 toolbar:self didSelectButton:v4 atIndex:v6];
}

- (AVTToolBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTToolBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIView)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end