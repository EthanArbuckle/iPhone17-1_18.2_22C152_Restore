@interface AMUIPosterCategorySwitcherItem
+ (id)itemWithConfiguration:(void *)a3 delegate:;
- (AMUIPosterCategorySwitcherItem)initWithConfiguration:(id)a3 delegate:(id)a4;
- (BOOL)posterViewControllerHasInlineAuthenticated:(id)a3;
- (BOOL)posterViewControllerIsAuthenticated:(id)a3;
- (NSObject)identifier;
- (UIView)itemView;
- (id)delegate;
- (id)posterView;
- (id)posterViewControllerRequestExtensionInstanceIdentifier:(id)a3;
- (id)titleLabelView;
- (uint64_t)configuration;
- (uint64_t)setConfiguration:(uint64_t)a1;
- (void)_noteWindowWillRotate:(id)a3;
- (void)_updateClipping;
- (void)_updateContentMode;
- (void)_updateLabelConstraintsForInterfaceOrientation:(int64_t)a3;
- (void)_updateTitleLabelVisibility;
- (void)dealloc;
- (void)invalidate;
- (void)noteTransitionDidBegin;
- (void)posterViewController;
- (void)posterViewController:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4;
- (void)posterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4;
- (void)posterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6;
- (void)setTitleLabelVisible:(char)a3 onTopEdge:;
- (void)switcher:(id)a3 didMoveToWindow:(id)a4;
- (void)switcher:(id)a3 updateItemForPresentationProgress:(double)a4;
- (void)switcher:(id)a3 willMoveToWindow:(id)a4;
- (void)switcherItemDidAppear:(id)a3;
- (void)switcherItemDidDisappear:(id)a3;
- (void)switcherItemWillAppear:(id)a3;
- (void)switcherItemWillDisappear:(id)a3;
@end

@implementation AMUIPosterCategorySwitcherItem

- (uint64_t)configuration
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

+ (id)itemWithConfiguration:(void *)a3 delegate:
{
  id v4 = a3;
  id v5 = a2;
  v6 = (void *)[objc_alloc((Class)self) initWithConfiguration:v5 delegate:v4];

  return v6;
}

- (uint64_t)setConfiguration:(uint64_t)a1
{
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    uint64_t v7 = v4;
    uint64_t v4 = BSEqualObjects();
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 88), a2);
      uint64_t v4 = [*(id *)(a1 + 96) updatePosterConfiguration:*(void *)(a1 + 88) withAnimationSettings:0];
      uint64_t v5 = v7;
    }
  }

  return MEMORY[0x270F9A758](v4, v5);
}

- (void)posterViewController
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[12];
    if (!v3)
    {
      uint64_t v4 = objc_alloc_init(AMUIPosterViewController);
      uint64_t v5 = (void *)v2[12];
      v2[12] = v4;

      [(id)v2[12] setDelegate:v2];
      [(id)v2[12] setChromeOrientationPolicy:2];
      [(id)v2[12] updatePosterConfiguration:v2[11] withAnimationSettings:0];
      [v2 _updateContentMode];
      v3 = (void *)v2[12];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)noteTransitionDidBegin
{
  if (a1)
  {
    id v2 = [a1[1] window];
    objc_msgSend(a1, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(v2, "_windowInterfaceOrientation"));
  }
}

- (void)setTitleLabelVisible:(char)a3 onTopEdge:
{
  if (a1)
  {
    *((unsigned char *)a1 + 80) = (_BYTE)a2;
    *((unsigned char *)a1 + 81) = a3;
    return (void *)[a1 _updateTitleLabelVisibility];
  }
  return a1;
}

- (id)titleLabelView
{
  if (a1)
  {
    id v2 = a1;
    id v3 = (id)[a1 itemView];
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)posterView
{
  if (a1)
  {
    uint64_t v1 = -[AMUIPosterCategorySwitcherItem posterViewController](a1);
    id v2 = [v1 view];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (AMUIPosterCategorySwitcherItem)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterCategorySwitcherItem;
  v9 = [(AMUIPosterCategorySwitcherItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v10->_appearState = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  [(AMUIPosterCategorySwitcherItem *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategorySwitcherItem;
  [(AMUIPosterCategorySwitcherItem *)&v3 dealloc];
}

- (NSObject)identifier
{
  if (self) {
    self = (AMUIPosterCategorySwitcherItem *)self->_configuration;
  }
  return [(AMUIPosterCategorySwitcherItem *)self serverUUID];
}

- (UIView)itemView
{
  objc_super v3 = -[AMUIPosterCategorySwitcherItem posterViewController](self);
  uint64_t v4 = [v3 view];

  if (!self->_itemView) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 superview];
  itemView = self->_itemView;

  if (v5 != itemView)
  {
    [(UIView *)self->_itemView bounds];
    objc_msgSend(v4, "setFrame:");
    [v4 setAutoresizingMask:18];
    [(UIView *)self->_itemView addSubview:v4];
  }
  id v7 = self->_itemView;
  if (!v7)
  {
LABEL_5:
    id v8 = objc_alloc(MEMORY[0x263F1CB60]);
    [v4 bounds];
    v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    [v4 setAutoresizingMask:18];
    [(UIView *)v9 addSubview:v4];
    if (+[AMUIDataLayerViewController dataLayoutForConfiguration:self->_configuration] == 1)
    {
      if (!self->_loadingQueue)
      {
        v10 = objc_msgSend(NSString, "stringWithFormat:", @"AMUIPosterCategoryItem-%p", self);
        Serial = (OS_dispatch_queue *)BSDispatchQueueCreateSerial();
        loadingQueue = self->_loadingQueue;
        self->_loadingQueue = Serial;
      }
      v13 = self->_configuration;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = [WeakRetained posterCategorySwitcherItemPrototypeSettings:self];

      char v16 = [v15 useFallbackTitleAndSymbol];
      v17 = self->_loadingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke;
      block[3] = &unk_265225290;
      v25 = v13;
      char v28 = v16;
      v26 = v9;
      v27 = self;
      v18 = v13;
      dispatch_async(v17, block);
    }
    v19 = [v4 layer];
    [v19 setAllowsGroupOpacity:1];

    v20 = [(UIView *)v9 layer];
    [v20 setAllowsGroupOpacity:1];

    v21 = self->_itemView;
    self->_itemView = v9;

    id v7 = self->_itemView;
  }
  v22 = v7;

  return v22;
}

- (id)delegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v14 = 0;
  objc_msgSend(v2, "amui_getConfiguredDisplayNameWithError:", &v14);
  objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void **)(a1 + 32);
  id v13 = 0;
  id v5 = v14;
  v6 = objc_msgSend(v4, "pr_loadAmbientConfigurationWithError:", &v13);
  id v7 = v13;

  id v8 = [v6 displayNameSystemSymbolName];
  if (v8)
  {
    if (v3) {
      goto LABEL_3;
    }
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 56)) {
    id v8 = @"questionmark.circle.fill";
  }
  else {
    id v8 = 0;
  }
  if (!v3)
  {
LABEL_8:
    if (*(unsigned char *)(a1 + 56)) {
      objc_super v3 = @"Unknown";
    }
    else {
      objc_super v3 = 0;
    }
  }
LABEL_3:
  v11 = v3;
  id v12 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v8;
  BSDispatchMain();
}

void __42__AMUIPosterCategorySwitcherItem_itemView__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v2 = [[AMUIPhotosLabelView alloc] initWithSymbolName:*(void *)(a1 + 32) title:*(void *)(a1 + 40)];
    [(AMUIPhotosLabelView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v3 = [(AMUIPhotosLabelView *)v2 layer];
    [v3 setAllowsGroupOpacity:1];

    [*(id *)(a1 + 48) addSubview:v2];
    [(AMUIPhotosLabelView *)v2 setHidden:1];
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v2;
    v6 = v2;

    id v7 = [*(id *)(*(void *)(a1 + 56) + 104) topAnchor];
    id v8 = [*(id *)(a1 + 48) topAnchor];
    [*(id *)(*(void *)(a1 + 56) + 104) preferredTopMargin];
    uint64_t v9 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    uint64_t v10 = *(void *)(a1 + 56);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [*(id *)(*(void *)(a1 + 56) + 104) bottomAnchor];
    id v13 = [*(id *)(a1 + 48) bottomAnchor];
    [*(id *)(*(void *)(a1 + 56) + 104) preferredBottomMargin];
    uint64_t v15 = [v12 constraintEqualToAnchor:v13 constant:-v14];
    uint64_t v16 = *(void *)(a1 + 56);
    v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v15;

    v18 = [*(id *)(*(void *)(a1 + 56) + 104) leftAnchor];
    v19 = [*(id *)(a1 + 48) leftAnchor];
    [*(id *)(*(void *)(a1 + 56) + 104) preferredLeadingMargin];
    uint64_t v20 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
    uint64_t v21 = *(void *)(a1 + 56);
    v22 = *(void **)(v21 + 56);
    *(void *)(v21 + 56) = v20;

    v23 = [*(id *)(*(void *)(a1 + 56) + 104) rightAnchor];
    v24 = [*(id *)(a1 + 48) rightAnchor];
    [*(id *)(*(void *)(a1 + 56) + 104) preferredLeadingMargin];
    uint64_t v26 = [v23 constraintEqualToAnchor:v24 constant:-v25];
    uint64_t v27 = *(void *)(a1 + 56);
    char v28 = *(void **)(v27 + 64);
    *(void *)(v27 + 64) = v26;

    [*(id *)(a1 + 56) _updateTitleLabelVisibility];
    v29 = *(id **)(a1 + 56);
    v30 = [v29[13] window];
    objc_msgSend(v29, "_updateLabelConstraintsForInterfaceOrientation:", objc_msgSend(v30, "_windowInterfaceOrientation"));

    id v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:*(void *)(a1 + 56) selector:sel__noteWindowWillRotate_ name:*MEMORY[0x263F1D840] object:0];
  }
}

- (void)invalidate
{
  [(AMUIPosterViewController *)self->_posterViewController invalidate];
  posterViewController = self->_posterViewController;
  self->_posterViewController = 0;
}

- (void)switcherItemWillAppear:(id)a3
{
  self->_appearState = 1;
  id v4 = a3;
  id v7 = [(AMUIPosterCategorySwitcherItem *)self itemView];
  id v5 = [v4 traitCollection];

  [v5 displayCornerRadius];
  objc_msgSend(v7, "_setContinuousCornerRadius:");

  v6 = [v7 window];
  -[AMUIPosterCategorySwitcherItem _updateLabelConstraintsForInterfaceOrientation:](self, "_updateLabelConstraintsForInterfaceOrientation:", [v6 _windowInterfaceOrientation]);
  [(AMUIPosterCategorySwitcherItem *)self _updateClipping];
  [(AMUIPosterCategorySwitcherItem *)self _updateContentMode];
}

- (void)switcherItemDidAppear:(id)a3
{
  self->_appearState = 2;
  id v4 = -[AMUIPosterCategorySwitcherItem posterViewController](self);
  [v4 setAppearanceTransitionProgress:1.0];

  [(AMUIPosterCategorySwitcherItem *)self _updateClipping];

  [(AMUIPosterCategorySwitcherItem *)self _updateContentMode];
}

- (void)switcherItemWillDisappear:(id)a3
{
  self->_appearState = 3;
  [(AMUIPosterCategorySwitcherItem *)self _updateClipping];

  [(AMUIPosterCategorySwitcherItem *)self _updateContentMode];
}

- (void)switcherItemDidDisappear:(id)a3
{
  self->_appearState = 0;
  [(AMUIPosterCategorySwitcherItem *)self _updateClipping];

  [(AMUIPosterCategorySwitcherItem *)self _updateContentMode];
}

- (void)switcher:(id)a3 willMoveToWindow:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "_windowInterfaceOrientation", a3);

  [(AMUIPosterCategorySwitcherItem *)self _updateLabelConstraintsForInterfaceOrientation:v5];
}

- (void)switcher:(id)a3 didMoveToWindow:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "_windowInterfaceOrientation", a3);

  [(AMUIPosterCategorySwitcherItem *)self _updateLabelConstraintsForInterfaceOrientation:v5];
}

- (void)switcher:(id)a3 updateItemForPresentationProgress:(double)a4
{
  self->_presentationProgress = a4;
  v6 = -[AMUIPosterCategorySwitcherItem posterViewController](self);
  [v6 setAppearanceTransitionProgress:a4];

  [(AMUIPosterCategorySwitcherItem *)self _updateContentMode];
}

- (void)posterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  BOOL v7 = a4;
  id v11 = a5;
  id v9 = a6;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained posterCategorySwitcherItem:self setChromeVisibility:v7 withAnimationSettings:v11 animationFence:v9];
}

- (id)posterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v5 = [WeakRetained posterCategorySwitcherItemRequestInstanceIdentifier:self preferring:self->_lastInstanceIdentifier];

  lastInstanceIdentifier = self->_lastInstanceIdentifier;
  self->_lastInstanceIdentifier = 0;

  return v5;
}

- (void)posterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  objc_storeStrong((id *)&self->_lastInstanceIdentifier, a4);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained posterCategorySwitcherItem:self relinquishInstanceIdentifier:v6];
}

- (BOOL)posterViewControllerIsAuthenticated:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  char v5 = [WeakRetained posterCategorySwitcherItemIsAuthenticated:self];

  return v5;
}

- (void)posterViewController:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4
{
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained posterCategorySwitcherItem:self didRequestInlineAuthenticationWithUnlockDestination:v6];
}

- (BOOL)posterViewControllerHasInlineAuthenticated:(id)a3
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  char v5 = [WeakRetained posterCategorySwitcherItemHasInlineAuthenticated:self];

  return v5;
}

- (void)_updateClipping
{
  BOOL v2 = (self->_appearState & 0xFFFFFFFD) == 1;
  id v3 = [(AMUIPosterCategorySwitcherItem *)self itemView];
  [v3 setClipsToBounds:v2];
}

- (void)_updateTitleLabelVisibility
{
  -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)&self->super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setHidden:!self->_titleLabelVisible];
  [(NSLayoutConstraint *)self->_labelTopConstraint setActive:self->_titleLabelOnTopEdge];
  [(NSLayoutConstraint *)self->_labelBottomConstraint setActive:!self->_titleLabelOnTopEdge];
}

- (void)_updateContentMode
{
  [(AMUIPosterViewController *)self->_posterViewController setContentMode:self->_appearState != 0];
}

- (void)_updateLabelConstraintsForInterfaceOrientation:(int64_t)a3
{
  BOOL v4 = a3 == 3;
  [(NSLayoutConstraint *)self->_labelLeftConstraint setActive:a3 != 3];
  labelRightConstraint = self->_labelRightConstraint;

  [(NSLayoutConstraint *)labelRightConstraint setActive:v4];
}

- (void)_noteWindowWillRotate:(id)a3
{
  id v13 = a3;
  BOOL v4 = [v13 object];
  char v5 = [(UIView *)self->_itemView window];

  if (v4 == v5)
  {
    id v6 = [v13 userInfo];
    BOOL v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1D828]];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 integerValue];
    [(AMUIPosterCategorySwitcherItem *)self _updateLabelConstraintsForInterfaceOrientation:v12];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_posterViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_labelRightConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_labelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastInstanceIdentifier, 0);

  objc_storeStrong((id *)&self->_itemView, 0);
}

@end