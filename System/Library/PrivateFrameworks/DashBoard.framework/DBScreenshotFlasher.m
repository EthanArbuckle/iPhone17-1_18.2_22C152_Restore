@interface DBScreenshotFlasher
- (DBScreenshotFlasher)initWithWindowScene:(id)a3;
- (UIWindowScene)windowScene;
- (void)_createUIWithColor:(id)a3;
- (void)_orderWindowFrontAndThenOut:(id)a3 withColor:(id)a4;
- (void)_orderWindowOut:(id)a3;
- (void)_tearDown;
- (void)flashColor:(id)a3 withCompletion:(id)a4;
@end

@implementation DBScreenshotFlasher

- (DBScreenshotFlasher)initWithWindowScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBScreenshotFlasher;
  v6 = [(DBScreenshotFlasher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_windowScene, a3);
  }

  return v7;
}

- (void)flashColor:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    flashCompletionBlocks = self->_flashCompletionBlocks;
    v7 = (void *)[a4 copy];
    [(NSMutableArray *)flashCompletionBlocks addObject:v7];
  }
  [(DBScreenshotFlasher *)self _orderWindowFrontAndThenOut:self withColor:v8];
}

- (void)_createUIWithColor:(id)a3
{
  if (!self->_flashWindow)
  {
    windowScene = self->_windowScene;
    id v5 = a3;
    v6 = [(UIWindowScene *)windowScene coordinateSpace];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    id v11 = objc_alloc(MEMORY[0x263F82E88]);
    v12 = NSString;
    v13 = [(UIWindowScene *)self->_windowScene screen];
    v14 = [v13 _displayID];
    v15 = [v12 stringWithFormat:@"ScreenFlash-%@", v14];
    v16 = (UIWindow *)objc_msgSend(v11, "_initWithFrame:debugName:windowScene:", v15, self->_windowScene, 0.0, 0.0, v8, v10);
    flashWindow = self->_flashWindow;
    self->_flashWindow = v16;

    [(UIWindow *)self->_flashWindow setWindowLevel:*MEMORY[0x263F83658]];
    [(UIWindow *)self->_flashWindow setUserInteractionEnabled:0];
    v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v8, v10);
    flashView = self->_flashView;
    self->_flashView = v18;

    [(UIView *)self->_flashView setBackgroundColor:v5];
    v20 = self->_flashWindow;
    v21 = self->_flashView;
    [(UIWindow *)v20 setContentView:v21];
  }
}

- (void)_tearDown
{
  [(UIWindow *)self->_flashWindow setHidden:1];
  self->_windowVisible = 0;
  flashWindow = self->_flashWindow;
  self->_flashWindow = 0;

  flashView = self->_flashView;
  self->_flashView = 0;
}

- (void)_orderWindowOut:(id)a3
{
  id v4 = a3;
  flashView = self->_flashView;
  if (flashView)
  {
    [(UIView *)flashView alpha];
    if (v6 != 0.0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __39__DBScreenshotFlasher__orderWindowOut___block_invoke;
      v8[3] = &unk_2649B3E90;
      v8[4] = self;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __39__DBScreenshotFlasher__orderWindowOut___block_invoke_2;
      v7[3] = &unk_2649B3FA8;
      v7[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v8 animations:v7 completion:1.0];
    }
  }
}

uint64_t __39__DBScreenshotFlasher__orderWindowOut___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void __39__DBScreenshotFlasher__orderWindowOut___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 24)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    [(id)v3 _tearDown];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  id v5 = (void *)[*(id *)(v3 + 8) copy];
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_orderWindowFrontAndThenOut:(id)a3 withColor:(id)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__orderWindowOut_ object:0];
  if (!self->_windowVisible)
  {
    if (self->_flashWindow)
    {
      [(UIView *)self->_flashView setAlpha:1.0];
      [(UIView *)self->_flashView setBackgroundColor:v5];
    }
    else
    {
      [(DBScreenshotFlasher *)self _createUIWithColor:v5];
    }
    [(UIWindow *)self->_flashWindow _orderFrontWithoutMakingKey];
    self->_windowVisible = 1;
  }
  v7[0] = *MEMORY[0x263EFF588];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(DBScreenshotFlasher *)self performSelector:sel__orderWindowOut_ withObject:0 afterDelay:v6 inModes:0.1];
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_flashWindow, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_flashCompletionBlocks, 0);
}

@end