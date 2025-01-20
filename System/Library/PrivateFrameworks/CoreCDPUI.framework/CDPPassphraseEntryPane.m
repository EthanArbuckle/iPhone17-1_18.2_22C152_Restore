@interface CDPPassphraseEntryPane
- (BOOL)isSmallScreen;
- (BOOL)isVerySmallScreen;
- (CDPPassphraseEntryPane)initWithFrame:(CGRect)a3;
- (CGRect)availableHeaderRect;
- (double)desiredMinPinHeight;
- (double)keyboardHeightOffset;
- (id)headerView;
- (void)_keyboardLayoutChanged;
- (void)_layoutContainerView;
- (void)_layoutHeaderRect;
- (void)_layoutPinView;
- (void)_layoutSubviews;
- (void)availableHeaderRect;
- (void)dealloc;
- (void)didFinishResizingPinView;
- (void)layoutSubviews;
- (void)startListeningForKeyboardEvents;
@end

@implementation CDPPassphraseEntryPane

- (CDPPassphraseEntryPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CDPPassphraseEntryPane;
  v7 = -[DevicePINPane initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F82B88]), "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = (UIScrollView *)v8;

    [(UIScrollView *)v7->_containerView setKeyboardDismissMode:0];
    [(CDPPassphraseEntryPane *)v7 addSubview:v7->_containerView];
    [(UIScrollView *)v7->_containerView addSubview:*(Class *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48])];
    v10 = [MEMORY[0x263F825C8] _systemBackgroundColor];
    [(CDPPassphraseEntryPane *)v7 setBackgroundColor:v10];

    v11 = [MEMORY[0x263F825C8] _systemBackgroundColor];
    [(UIScrollView *)v7->_containerView setBackgroundColor:v11];

    v12 = [CDPPaneHeaderView alloc];
    uint64_t v13 = -[CDPPaneHeaderView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    headerView = v7->_headerView;
    v7->_headerView = (CDPPaneHeaderView *)v13;

    [(UIScrollView *)v7->_containerView addSubview:v7->_headerView];
    [(CDPPassphraseEntryPane *)v7 startListeningForKeyboardEvents];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CDPPassphraseEntryPane;
  [(DevicePINPane *)&v4 dealloc];
}

- (void)startListeningForKeyboardEvents
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardLayoutChanged name:*MEMORY[0x263F837C8] object:0];
}

- (BOOL)isSmallScreen
{
  [(CDPPassphraseEntryPane *)self availableHeaderRect];
  return CGRectGetHeight(v3) < 190.0;
}

- (BOOL)isVerySmallScreen
{
  [(CDPPassphraseEntryPane *)self availableHeaderRect];
  return CGRectGetHeight(v3) < 120.0;
}

- (void)_keyboardLayoutChanged
{
  CGRect v3 = [(PSEditingPane *)self viewController];
  objc_super v4 = [v3 navigationController];
  v5 = [(PSEditingPane *)self viewController];
  v6 = v5;
  if (v4) {
    [v5 navigationController];
  }
  else {
  v7 = [v5 parentViewController];
  }
  uint64_t v8 = [v7 parentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke;
    v10[3] = &unk_26433D9E8;
    v10[4] = self;
    [v8 offsetForCurrentKeyboard:v10];
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_3;
    v9[3] = &unk_26433CC58;
    v9[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke(uint64_t a1, double a2)
{
  *(double *)(*(void *)(a1 + 32) + 560) = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_2;
  block[3] = &unk_26433CC58;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

uint64_t __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (double)keyboardHeightOffset
{
  CGRect v3 = (void *)MEMORY[0x263F828A0];
  objc_super v4 = [(PSEditingPane *)self viewController];
  objc_msgSend(v3, "sizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
  double v29 = v5;

  v6 = [(PSEditingPane *)self viewController];
  v7 = [v6 view];
  uint64_t v8 = [(PSEditingPane *)self viewController];
  v9 = [v8 view];
  [v9 bounds];
  objc_msgSend(v7, "convertRect:toView:", 0);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v30.origin.double x = v20;
  v30.origin.double y = v22;
  v30.size.double width = v24;
  v30.size.double height = v26;
  double MaxY = CGRectGetMaxY(v30);
  v31.origin.double x = v11;
  v31.origin.double y = v13;
  v31.size.double width = v15;
  v31.size.double height = v17;
  return fmax(v29 - (MaxY - CGRectGetMaxY(v31)), 0.0);
}

- (id)headerView
{
  return self->_headerView;
}

- (void)layoutSubviews
{
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 560)];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2187CF000, v2, v3, "Starting layout with KB offset: %@", v4, v5, v6, v7, v8);
}

- (void)_layoutSubviews
{
  uint64_t v3 = [(PSEditingPane *)self viewController];
  uint64_t v4 = [v3 navigationController];
  uint64_t v5 = [(PSEditingPane *)self viewController];
  uint64_t v6 = v5;
  if (v4) {
    [v5 navigationController];
  }
  else {
  uint64_t v7 = [v5 parentViewController];
  }
  id v9 = [v7 parentViewController];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(CDPPassphraseEntryPane *)self keyboardHeightOffset];
    self->_keyboardOffset = v8;
  }
  [(CDPPassphraseEntryPane *)self _layoutContainerView];
  [(CDPPassphraseEntryPane *)self _layoutHeaderRect];
  [(CDPPassphraseEntryPane *)self _layoutPinView];
}

- (CGRect)availableHeaderRect
{
  [(UIScrollView *)self->_containerView bounds];
  CGFloat Width = CGRectGetWidth(v12);
  [(UIScrollView *)self->_containerView bounds];
  CGFloat v4 = CGRectGetHeight(v13) - self->_keyboardOffset;
  [(CDPPassphraseEntryPane *)self desiredMinPinHeight];
  double v6 = v4 - v5;
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(CDPPassphraseEntryPane *)Width availableHeaderRect];
  }

  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = Width;
  double v11 = v6;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (double)desiredMinPinHeight
{
  BOOL v2 = [(DevicePINPane *)self simplePIN];
  double result = 75.0;
  if (v2) {
    return 73.0;
  }
  return result;
}

- (void)_layoutContainerView
{
  containerView = self->_containerView;
  id v5 = [(PSEditingPane *)self viewController];
  uint64_t v3 = [v5 view];
  CGFloat v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  -[UIScrollView setFrame:](containerView, "setFrame:");
}

- (void)_layoutHeaderRect
{
  headerView = self->_headerView;
  [(CDPPassphraseEntryPane *)self availableHeaderRect];
  -[CDPPaneHeaderView setFrame:](headerView, "setFrame:");
  [(CDPPaneHeaderView *)self->_headerView layoutSubviews];

  [(CDPPassphraseEntryPane *)self didFinishResizingHeaderView];
}

- (void)_layoutPinView
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2187CF000, v1, v2, "Pin View Start %@", v3, v4, v5, v6, v7);
}

- (void)didFinishResizingPinView
{
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48]) frame];
  CGFloat v3 = CGRectGetMaxY(v7) + self->_keyboardOffset;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v3);
  containerView = self->_containerView;
  [(UIScrollView *)containerView frame];
  double v5 = fmax(v3 - CGRectGetHeight(v8), 0.0);

  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)availableHeaderRect
{
  v10.size.double height = a2;
  v10.size.double width = a1;
  v10.origin.double x = 0.0;
  v10.origin.double y = 0.0;
  uint64_t v2 = NSStringFromCGRect(v10);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2187CF000, v3, v4, "Available header rect: %@", v5, v6, v7, v8, v9);
}

@end