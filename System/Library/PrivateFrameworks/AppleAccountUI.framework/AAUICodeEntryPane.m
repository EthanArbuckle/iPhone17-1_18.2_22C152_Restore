@interface AAUICodeEntryPane
- (AAUICodeEntryPane)initWithFrame:(CGRect)a3;
- (BOOL)_isSmallScreen;
- (BOOL)_isVerySmallScreen;
- (CGRect)_availableHeaderRect;
- (double)_desiredMinPinHeight;
- (double)keyboardHeightOffset;
- (id)_createFooterButton;
- (id)headerView;
- (void)_availableHeaderRect;
- (void)_didFinishResizingHeaderView;
- (void)_didFinishResizingPinView;
- (void)_keyboardLayoutChanged;
- (void)_layoutContainerView;
- (void)_layoutHeaderRect;
- (void)_layoutPinView;
- (void)_layoutSubviews;
- (void)_startListeningForKeyboardEvents;
- (void)dealloc;
- (void)handleEscapeAction:(id)a3;
- (void)layoutSubviews;
- (void)setContext:(id)a3;
@end

@implementation AAUICodeEntryPane

- (AAUICodeEntryPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)AAUICodeEntryPane;
  v7 = -[DevicePINPane initWithFrame:](&v20, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F82B88]), "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = (UIScrollView *)v8;

    [(UIScrollView *)v7->_containerView setKeyboardDismissMode:0];
    [(AAUICodeEntryPane *)v7 addSubview:v7->_containerView];
    [(UIScrollView *)v7->_containerView addSubview:*(Class *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48])];
    v10 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(AAUICodeEntryPane *)v7 setBackgroundColor:v10];

    v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UIScrollView *)v7->_containerView setBackgroundColor:v11];

    v12 = [AAUIPaneHeaderView alloc];
    v13 = [(AAUICodeEntryContext *)v7->_context promptTitle];
    v14 = [(AAUICodeEntryContext *)v7->_context promptMessage];
    uint64_t v15 = [(AAUIPaneHeaderView *)v12 initWithTitle:v13 detailText:v14 icon:0];
    headerView = v7->_headerView;
    v7->_headerView = (AAUIPaneHeaderView *)v15;

    [(UIScrollView *)v7->_containerView addSubview:v7->_headerView];
    v17 = v7->_containerView;
    v18 = [(AAUICodeEntryPane *)v7 _createFooterButton];
    [(UIScrollView *)v17 addSubview:v18];

    [(AAUICodeEntryPane *)v7 _startListeningForKeyboardEvents];
  }
  return v7;
}

- (id)_createFooterButton
{
  v3 = [MEMORY[0x263F824E8] buttonWithType:1];
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  v5 = [(UIButton *)self->_footerButton titleLabel];
  [v5 setNumberOfLines:0];

  v6 = [(UIButton *)self->_footerButton titleLabel];
  [v6 setTextAlignment:1];

  [(UIButton *)self->_footerButton setAutoresizingMask:12];
  v7 = self->_footerButton;
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AAUICodeEntryPane;
  [(DevicePINPane *)&v4 dealloc];
}

- (void)_startListeningForKeyboardEvents
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardLayoutChanged name:*MEMORY[0x263F837C8] object:0];
}

- (BOOL)_isSmallScreen
{
  [(AAUICodeEntryPane *)self _availableHeaderRect];
  return CGRectGetHeight(v3) < 190.0;
}

- (BOOL)_isVerySmallScreen
{
  [(AAUICodeEntryPane *)self _availableHeaderRect];
  return CGRectGetHeight(v3) < 120.0;
}

- (void)_keyboardLayoutChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AAUICodeEntryPane__keyboardLayoutChanged__block_invoke;
  block[3] = &unk_263F92168;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __43__AAUICodeEntryPane__keyboardLayoutChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (double)keyboardHeightOffset
{
  CGRect v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 226.0;
  }
  v6 = (void *)MEMORY[0x263F828A0];
  v7 = [(PSEditingPane *)self viewController];
  objc_msgSend(v6, "sizeForInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  double v31 = v8;

  v9 = [(PSEditingPane *)self viewController];
  v10 = [v9 view];
  v11 = [(PSEditingPane *)self viewController];
  v12 = [v11 view];
  [v12 bounds];
  objc_msgSend(v10, "convertRect:toView:", 0);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v21 = [MEMORY[0x263F82B60] mainScreen];
  [v21 bounds];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v32.origin.double x = v23;
  v32.origin.double y = v25;
  v32.size.double width = v27;
  v32.size.double height = v29;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.double x = v14;
  v33.origin.double y = v16;
  v33.size.double width = v18;
  v33.size.double height = v20;
  return fmax(v31 - (MaxY - CGRectGetMaxY(v33)), 0.0);
}

- (id)headerView
{
  return self->_headerView;
}

- (void)layoutSubviews
{
  v1 = [NSNumber numberWithDouble:*(double *)(a1 + 552)];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_209754000, v2, v3, "Starting layout with KB offset: %@", v4, v5, v6, v7, v8);
}

- (void)_layoutSubviews
{
  [(AAUICodeEntryPane *)self keyboardHeightOffset];
  self->_keyboardOffset = v3;
  [(AAUICodeEntryPane *)self _layoutContainerView];
  [(AAUICodeEntryPane *)self _layoutHeaderRect];
  [(AAUICodeEntryPane *)self _layoutPinView];
}

- (CGRect)_availableHeaderRect
{
  [(UIScrollView *)self->_containerView bounds];
  CGFloat Width = CGRectGetWidth(v12);
  [(UIScrollView *)self->_containerView bounds];
  CGFloat v4 = CGRectGetHeight(v13) - self->_keyboardOffset;
  [(AAUICodeEntryPane *)self _desiredMinPinHeight];
  double v6 = v4 - v5;
  uint64_t v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(AAUICodeEntryPane *)Width _availableHeaderRect];
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

- (double)_desiredMinPinHeight
{
  return 73.0;
}

- (void)_layoutContainerView
{
  containerView = self->_containerView;
  id v5 = [(PSEditingPane *)self viewController];
  double v3 = [v5 view];
  CGFloat v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  -[UIScrollView setFrame:](containerView, "setFrame:");
}

- (void)_layoutHeaderRect
{
  [(AAUIPaneHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  headerView = self->_headerView;
  [(AAUICodeEntryPane *)self _availableHeaderRect];
  -[AAUIPaneHeaderView setFrame:](headerView, "setFrame:");
  CGFloat v4 = [(AAUIPaneHeaderView *)self->_headerView widthAnchor];
  [(UIScrollView *)self->_containerView bounds];
  double v6 = [v4 constraintEqualToConstant:v5 + -24.0];
  [v6 setActive:1];

  uint64_t v7 = [(AAUIPaneHeaderView *)self->_headerView centerXAnchor];
  double v8 = [(UIScrollView *)self->_containerView centerXAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  [(AAUIPaneHeaderView *)self->_headerView layoutSubviews];
  [(AAUICodeEntryPane *)self _didFinishResizingHeaderView];
}

- (void)_didFinishResizingHeaderView
{
  [*(id *)(a1 + 568) bounds];
  v1 = NSStringFromCGRect(v9);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_209754000, v2, v3, "Available frame for remote secret view: %@", v4, v5, v6, v7, v8);
}

- (void)_layoutPinView
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_209754000, v1, v2, "Pin View Start %@", v3, v4, v5, v6, v7);
}

- (void)_didFinishResizingPinView
{
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48]) frame];
  CGFloat v3 = CGRectGetMaxY(v57) + self->_keyboardOffset;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v3);
  containerView = self->_containerView;
  [(UIScrollView *)containerView frame];
  double v49 = v3;
  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v3 - CGRectGetHeight(v58), 0.0));
  if ([(AAUICodeEntryPane *)self _isSmallScreen]) {
    double v5 = 8.0;
  }
  else {
    double v5 = 24.0;
  }
  uint64_t v6 = *MEMORY[0x263F83570];
  uint8_t v7 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v7 scaledValueForValue:v5];
  double v9 = v8;
  double v51 = v8;

  double v10 = (void *)MEMORY[0x263F81708];
  double v11 = [MEMORY[0x263F82B60] mainScreen];
  CGRect v12 = [v11 traitCollection];
  CGRect v13 = [v10 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v12];
  CGFloat v14 = [(UIButton *)self->_footerButton titleLabel];
  [v14 setFont:v13];

  [(UIButton *)self->_footerButton frame];
  CGFloat v53 = v16;
  CGFloat v54 = v15;
  double v17 = [(UIButton *)self->_footerButton titleLabel];
  [(AAUICodeEntryPane *)self frame];
  objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v59), 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = (int)*MEMORY[0x263F5FD40];
  CGFloat v23 = [*(id *)((char *)&self->super.super.super.super.super.isa + v22) superview];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v60.origin.double x = v25;
  v60.origin.double y = v27;
  v60.size.double width = v29;
  v60.size.double height = v31;
  double Height = CGRectGetHeight(v60);
  [(AAUICodeEntryPane *)self _desiredMinPinHeight];
  double v33 = v32;
  double v50 = v9 + v21;
  [(AAUICodeEntryPane *)self bounds];
  double MidX = CGRectGetMidX(v61);
  v62.origin.double y = v53;
  v62.origin.double x = v54;
  v62.size.double width = v19;
  v62.size.double height = v21;
  double Width = CGRectGetWidth(v62);
  double v36 = 0.0;
  if (Height > v33) {
    double v36 = v50;
  }
  double v37 = v31 - v36;
  double v38 = MidX + Width * -0.5;
  double v39 = 8.0;
  if (Height > v33) {
    double v39 = v51;
  }
  double v55 = v39;
  v63.origin.double x = v25;
  v63.origin.double y = v27;
  v63.size.double width = v29;
  v63.size.double height = v37;
  double MaxY = CGRectGetMaxY(v63);
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v38, MaxY, v19, v21);
  v41 = [*(id *)((char *)&self->super.super.super.super.super.isa + v22) superview];
  objc_msgSend(v41, "setFrame:", v25, v27, v29, v37);

  v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v22);
  v43 = [v42 superview];
  [v43 bounds];
  objc_msgSend(v42, "setFrame:");

  v64.origin.double x = v38;
  v64.origin.double y = MaxY;
  v64.size.double width = v19;
  v64.size.double height = v21;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v55 + CGRectGetMaxY(v64) + self->_keyboardOffset);
  v44 = [(UIButton *)self->_footerButton superview];

  if (v44)
  {
    v45 = self->_containerView;
    [(UIScrollView *)v45 frame];
    -[UIScrollView setContentOffset:](v45, "setContentOffset:", 0.0, fmax(v49 - CGRectGetHeight(v65), 0.0));
    v46 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v47 = [v46 userInterfaceIdiom];

    if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v48 = self->_containerView;
      -[UIScrollView setContentInset:](v48, "setContentInset:", 0.0, 0.0, 10.0, 0.0);
    }
  }
}

- (void)setContext:(id)a3
{
  id v14 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  headerView = self->_headerView;
  uint8_t v7 = [(AAUICodeEntryContext *)self->_context promptTitle];
  [(AAUIPaneHeaderView *)headerView setTitleText:v7];

  double v8 = self->_headerView;
  double v9 = [(AAUICodeEntryContext *)self->_context promptMessage];
  [(AAUIPaneHeaderView *)v8 setDetailText:v9];

  double v10 = [(AAUICodeEntryContext *)self->_context escapeTitle];

  footerButton = self->_footerButton;
  if (v10)
  {
    [(UIButton *)footerButton addTarget:self action:sel_handleEscapeAction_ forControlEvents:64];
    CGRect v12 = self->_footerButton;
    CGRect v13 = [(AAUICodeEntryContext *)*p_context escapeTitle];
    [(UIButton *)v12 setTitle:v13 forState:0];
  }
  else
  {
    [(UIButton *)footerButton removeFromSuperview];
  }
}

- (void)handleEscapeAction:(id)a3
{
  uint64_t v4 = [(PSEditingPane *)self viewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  double v5 = [(AAUICodeEntryContext *)self->_context escapeAction];

  if (v5)
  {
    uint64_t v6 = [(AAUICodeEntryContext *)self->_context escapeAction];
    v6[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_availableHeaderRect
{
  v10.size.double height = a2;
  v10.size.double width = a1;
  v10.origin.double x = 0.0;
  v10.origin.double y = 0.0;
  uint64_t v2 = NSStringFromCGRect(v10);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_209754000, v3, v4, "Available header rect: %@", v5, v6, v7, v8, v9);
}

@end