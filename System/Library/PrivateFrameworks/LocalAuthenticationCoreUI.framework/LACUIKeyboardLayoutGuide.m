@interface LACUIKeyboardLayoutGuide
- (LACUIKeyboardLayoutGuide)initWithView:(id)a3;
- (double)_defaultHeightConstant;
- (void)_handleKeyboardFrameChange:(id)a3;
- (void)_setupKeyboardObservers;
- (void)_updateKeyboardLayoutGuide:(id)a3 animated:(BOOL)a4;
@end

@implementation LACUIKeyboardLayoutGuide

- (LACUIKeyboardLayoutGuide)initWithView:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LACUIKeyboardLayoutGuide;
  v5 = [(LACUIKeyboardLayoutGuide *)&v20 init];
  if (v5)
  {
    [v4 addLayoutGuide:v5];
    v6 = [(LACUIKeyboardLayoutGuide *)v5 heightAnchor];
    [(LACUIKeyboardLayoutGuide *)v5 _defaultHeightConstant];
    objc_msgSend(v6, "constraintEqualToConstant:");
    id obj = (id)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x263F08938];
    v19 = [(LACUIKeyboardLayoutGuide *)v5 bottomAnchor];
    v18 = [v4 bottomAnchor];
    v7 = [v19 constraintEqualToAnchor:v18];
    v21[0] = v7;
    v8 = [(LACUIKeyboardLayoutGuide *)v5 leadingAnchor];
    v9 = [v4 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v21[1] = v10;
    v11 = [(LACUIKeyboardLayoutGuide *)v5 trailingAnchor];
    v12 = [v4 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v21[2] = v13;
    v21[3] = obj;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [v17 activateConstraints:v14];

    objc_storeWeak((id *)&v5->_keyboardLayoutHeightLC, obj);
    [(LACUIKeyboardLayoutGuide *)v5 _setupKeyboardObservers];
  }
  return v5;
}

- (void)_setupKeyboardObservers
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleKeyboardFrameChange_ name:*MEMORY[0x263F83808] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__handleKeyboardFrameChange_ name:*MEMORY[0x263F837A8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__handleKeyboardFrameChange_ name:*MEMORY[0x263F83800] object:0];
}

- (void)_handleKeyboardFrameChange:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 20000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__LACUIKeyboardLayoutGuide__handleKeyboardFrameChange___block_invoke;
  v7[3] = &unk_2653BCB68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

void __55__LACUIKeyboardLayoutGuide__handleKeyboardFrameChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  [v1 _updateKeyboardLayoutGuide:v2 animated:1];
}

- (void)_updateKeyboardLayoutGuide:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardLayoutHeightLC);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke;
  v18[3] = &unk_2653BCB90;
  id v8 = v6;
  id v19 = v8;
  objc_super v20 = self;
  __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke((uint64_t)v18);
  objc_msgSend(WeakRetained, "setConstant:");

  v9 = [v8 objectForKey:*MEMORY[0x263F83778]];
  uint64_t v10 = [v9 integerValue] << 16;

  v11 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2;
  v15[3] = &unk_2653BCBB8;
  id v16 = v8;
  BOOL v17 = a4;
  id v12 = v8;
  float v13 = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2((uint64_t)v15);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_9;
  v14[3] = &unk_2653BCBE0;
  v14[4] = self;
  [v11 animateWithDuration:v10 delay:v14 options:&__block_literal_global_1 animations:v13 completion:0.0];
}

double __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F837B8]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  dispatch_time_t v5 = v4;

  id v6 = [*(id *)(a1 + 40) owningView];
  v7 = [*(id *)(a1 + 40) owningView];
  [v7 frame];
  objc_msgSend(v6, "convertRect:toView:", 0);
  double v9 = v8;
  double v11 = v10;

  [v5 rectValue];
  double v13 = v9 + v11 - v12;
  if (v13 <= 0.0)
  {
    [*(id *)(a1 + 40) _defaultHeightConstant];
    double v13 = v14;
  }

  return v13;
}

float __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F83780]];
  v3 = (void *)v2;
  id v4 = &unk_270439BB8;
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  if (*(unsigned char *)(a1 + 40))
  {
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

void __64__LACUIKeyboardLayoutGuide__updateKeyboardLayoutGuide_animated___block_invoke_9(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) owningView];
  [v1 layoutIfNeeded];
}

- (double)_defaultHeightConstant
{
  uint64_t v2 = [(LACUIKeyboardLayoutGuide *)self owningView];
  [v2 safeAreaInsets];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
}

@end