@interface CRSUIDashboardWidgetWindow
- (BOOL)invalidated;
- (BOOL)useSystemPrimaryFocusColor;
- (CRSUIDashboardWidgetWindow)initWithWindowScene:(id)a3;
- (CRSUIDashboardWidgetWindowProxy)exportedObject;
- (NSArray)focusableItems;
- (NSArray)widgetSizes;
- (NSXPCConnection)dashboardWindowServiceConnection;
- (UIColor)focusHighlightColor;
- (id)_clientFocusableItemForItem:(id)a3;
- (id)_focusableItemForClientItem:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_invalidateConnection;
- (void)_lock_invalidateConnection;
- (void)_lock_invalidateCurrentFocusableItems;
- (void)_windowDidCreateContext:(id)a3;
- (void)dealloc;
- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4;
- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4;
- (void)hostSelectedFocusableItem:(id)a3;
- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3;
- (void)hostSetWidgetSizes:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentReady;
- (void)setDashboardWindowServiceConnection:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setFocusableItems:(id)a3;
- (void)setFocusableViews:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNeedsLargeSize:(BOOL)a3 animationSettings:(id)a4;
- (void)setUseSystemPrimaryFocusColor:(BOOL)a3;
- (void)setWidgetSizes:(id)a3;
@end

@implementation CRSUIDashboardWidgetWindow

- (CRSUIDashboardWidgetWindow)initWithWindowScene:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRSUIDashboardWidgetWindow;
  v5 = [(CRSUIWindow *)&v30 initWithWindowScene:v4];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = [[CRSUIDashboardWidgetWindowProxy alloc] initWithDelegate:v5];
    exportedObject = v6->_exportedObject;
    v6->_exportedObject = v7;

    objc_opt_class();
    v9 = [v4 _FBSScene];
    id v10 = [v9 settings];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (v11)
    {
      id v24 = objc_alloc_init(MEMORY[0x263F08D98]);
      v12 = [v11 endpoint];
      [v24 _setEndpoint:v12];

      v13 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v24];
      v23 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C95C410];
      v14 = (void *)MEMORY[0x263EFFA08];
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      [v23 setClasses:v16 forSelector:sel_clientSetFocusableItems_ argumentIndex:0 ofReply:0];

      [v13 setRemoteObjectInterface:v23];
      v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C951360];
      v18 = (void *)MEMORY[0x263EFFA08];
      v31[0] = objc_opt_class();
      v31[1] = objc_opt_class();
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      v20 = [v18 setWithArray:v19];
      [v17 setClasses:v20 forSelector:sel_hostSetWidgetSizes_ argumentIndex:0 ofReply:0];

      [v13 setExportedInterface:v17];
      [v13 setExportedObject:v6->_exportedObject];
      objc_initWeak(&location, v6);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke;
      v27[3] = &unk_264307CE8;
      objc_copyWeak(&v28, &location);
      [v13 setInterruptionHandler:v27];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke_2;
      v25[3] = &unk_264307CE8;
      objc_copyWeak(&v26, &location);
      [v13 setInvalidationHandler:v25];
      [v13 resume];
      [(CRSUIDashboardWidgetWindow *)v6 setDashboardWindowServiceConnection:v13];
      v21 = [MEMORY[0x263F08A00] defaultCenter];
      [v21 addObserver:v6 selector:sel__windowDidCreateContext_ name:@"_UIWindowDidCreateContextNotification" object:v6];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

void __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (BOOL)invalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInvalidated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = [(CRSUIDashboardWidgetWindow *)self invalidated];
  id v4 = CRSUILogForCategory(3uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Window: %{public}@ already invalidated", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating window: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(CRSUIDashboardWidgetWindow *)self setInvalidated:1];
    os_unfair_lock_lock(&self->_lock);
    [(CRSUIDashboardWidgetWindow *)self _lock_invalidateCurrentFocusableItems];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self];

    [(CRSUIDashboardWidgetWindow *)self _lock_invalidateConnection];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (![(CRSUIDashboardWidgetWindow *)self invalidated])
  {
    BOOL v3 = CRSUILogForCategory(3uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Window: %{public}@ not invalidated in dealloc", buf, 0xCu);
    }

    [(CRSUIDashboardWidgetWindow *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)CRSUIDashboardWidgetWindow;
  [(CRSUIDashboardWidgetWindow *)&v4 dealloc];
}

- (void)setFocusableViews:(id)a3
{
  id v4 = a3;
  if ([(CRSUIDashboardWidgetWindow *)self invalidated])
  {
    BOOL v5 = CRSUILogForCategory(3uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRSUIDashboardWidgetWindow setFocusableViews:](v5);
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    [(CRSUIDashboardWidgetWindow *)self _lock_invalidateCurrentFocusableItems];
    os_unfair_lock_unlock(&self->_lock);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __48__CRSUIDashboardWidgetWindow_setFocusableViews___block_invoke;
    v13 = &unk_264307D10;
    v14 = self;
    id v15 = v6;
    BOOL v5 = v6;
    [v4 enumerateObjectsUsingBlock:&v10];
    os_unfair_lock_lock(&self->_lock);
    -[CRSUIDashboardWidgetWindow setFocusableItems:](self, "setFocusableItems:", v5, v10, v11, v12, v13, v14);
    uint64_t v7 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
    v8 = [v7 remoteObjectProxy];
    uint64_t v9 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
    [v8 clientSetFocusableItems:v9];

    os_unfair_lock_unlock(&self->_lock);
    [(CRSUIDashboardWidgetWindow *)self setContentReady];
  }
}

void __48__CRSUIDashboardWidgetWindow_setFocusableViews___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13 = [[CRSDashboardFocusableItem alloc] initWithFocusableView:v3];
  [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"frame" options:1 context:0];
  id v4 = *(void **)(a1 + 32);
  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CRSDashboardFocusableItem setFrameInWindow:](v13, "setFrameInWindow:", v6, v8, v10, v12);
  [*(id *)(a1 + 40) addObject:v13];
}

- (UIColor)focusHighlightColor
{
  if ([(CRSUIDashboardWidgetWindow *)self useSystemPrimaryFocusColor]) {
    [MEMORY[0x263F1C550] _carSystemPrimaryColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] _carSystemFocusColor];
  }
  return (UIColor *)v2;
}

- (void)setNeedsLargeSize:(BOOL)a3 animationSettings:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v9 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
  double v7 = [v9 remoteObjectProxy];
  double v8 = [MEMORY[0x263F1CBD0] _synchronizedDrawingFence];
  [v7 clientSetWantsLargeSize:v4 fenceHandle:v8 animationSettings:v6];
}

- (void)setContentReady
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21817A000, log, OS_LOG_TYPE_ERROR, "Attempting to set content ready after invalidation, ignoring.", v1, 2u);
}

- (void)_windowDidCreateContext:(id)a3
{
  BOOL v4 = [a3 object];
  if (v4 == self)
  {
    double v7 = v4;
    double v5 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
    id v6 = [v5 remoteObjectProxy];
    objc_msgSend(v6, "updateContextId:", -[CRSUIDashboardWidgetWindow _contextId](self, "_contextId"));

    BOOL v4 = v7;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"frame"])
  {
    objc_opt_class();
    id v13 = v11;
    if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    id v15 = [(CRSUIDashboardWidgetWindow *)self _focusableItemForClientItem:v14];
    [v14 bounds];
    -[CRSUIDashboardWidgetWindow convertRect:fromView:](self, "convertRect:fromView:", v14);
    objc_msgSend(v15, "setFrameInWindow:");
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v17 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
    v18 = [v17 remoteObjectProxy];
    v19 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
    [v18 clientSetFocusableItems:v19];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRSUIDashboardWidgetWindow;
    [(CRSUIDashboardWidgetWindow *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CRSUIDashboardWidgetWindow_hostFocusableItem_focused___block_invoke;
  block[3] = &unk_264307D38;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__CRSUIDashboardWidgetWindow_hostFocusableItem_focused___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _clientFocusableItemForItem:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [v2 focusableItemFocused:*(unsigned __int8 *)(a1 + 48)];
    v2 = v3;
  }
}

- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CRSUIDashboardWidgetWindow_hostFocusableItem_pressed___block_invoke;
  block[3] = &unk_264307D38;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__CRSUIDashboardWidgetWindow_hostFocusableItem_pressed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _clientFocusableItemForItem:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [v2 focusableItemPressed:*(unsigned __int8 *)(a1 + 48)];
    v2 = v3;
  }
}

- (void)hostSelectedFocusableItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__CRSUIDashboardWidgetWindow_hostSelectedFocusableItem___block_invoke;
  v6[3] = &unk_264307890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __56__CRSUIDashboardWidgetWindow_hostSelectedFocusableItem___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _clientFocusableItemForItem:*(void *)(a1 + 40)];
  if (v1)
  {
    id v2 = v1;
    [v1 focusableItemSelected];
    v1 = v2;
  }
}

- (void)hostSetWidgetSizes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CRSUIDashboardWidgetWindow_hostSetWidgetSizes___block_invoke;
  v6[3] = &unk_264307890;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __49__CRSUIDashboardWidgetWindow_hostSetWidgetSizes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWidgetSizes:*(void *)(a1 + 40)];
}

- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRSUIDashboardWidgetWindow *)self useSystemPrimaryFocusColor] != a3)
  {
    [(CRSUIDashboardWidgetWindow *)self setUseSystemPrimaryFocusColor:v3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CRSUIDashboardWidgetWindow_hostSetUseSystemPrimaryFocusColor___block_invoke;
    block[3] = &unk_264307AF0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __64__CRSUIDashboardWidgetWindow_hostSetUseSystemPrimaryFocusColor___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:CRSUIDashboardWidgetWindowFocusHighlightColorDidChangeNotification object:*(void *)(a1 + 32)];
}

- (id)_focusableItemForClientItem:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__CRSUIDashboardWidgetWindow__focusableItemForClientItem___block_invoke;
  v12[3] = &unk_264307D60;
  id v13 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v12];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
    id v9 = [v10 objectAtIndex:v8];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

BOOL __58__CRSUIDashboardWidgetWindow__focusableItemForClientItem___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 focusProvidingItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_clientFocusableItemForItem:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CRSUIDashboardWidgetWindow__clientFocusableItemForItem___block_invoke;
  v13[3] = &unk_264307D60;
  id v14 = v4;
  id v7 = v4;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v13];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v10 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
    id v11 = [v10 objectAtIndex:v8];
    id v9 = [v11 focusProvidingItem];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

uint64_t __58__CRSUIDashboardWidgetWindow__clientFocusableItemForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)_lock_invalidateCurrentFocusableItems
{
  id v3 = CRSUILogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating focusable items", buf, 2u);
  }

  id v4 = [(CRSUIDashboardWidgetWindow *)self focusableItems];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CRSUIDashboardWidgetWindow__lock_invalidateCurrentFocusableItems__block_invoke;
  v5[3] = &unk_264307D88;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];

  [(CRSUIDashboardWidgetWindow *)self setFocusableItems:0];
}

void __67__CRSUIDashboardWidgetWindow__lock_invalidateCurrentFocusableItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 focusProvidingItem];
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:@"frame"];
}

- (void)_invalidateConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(CRSUIDashboardWidgetWindow *)self _lock_invalidateConnection];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidateConnection
{
  id v3 = CRSUILogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection", v6, 2u);
  }

  id v4 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
  [v4 setExportedObject:0];

  id v5 = [(CRSUIDashboardWidgetWindow *)self dashboardWindowServiceConnection];
  [v5 invalidate];

  [(CRSUIDashboardWidgetWindow *)self setDashboardWindowServiceConnection:0];
}

- (NSArray)widgetSizes
{
  return self->_widgetSizes;
}

- (void)setWidgetSizes:(id)a3
{
}

- (NSXPCConnection)dashboardWindowServiceConnection
{
  return self->_dashboardWindowServiceConnection;
}

- (void)setDashboardWindowServiceConnection:(id)a3
{
}

- (NSArray)focusableItems
{
  return self->_focusableItems;
}

- (void)setFocusableItems:(id)a3
{
}

- (BOOL)useSystemPrimaryFocusColor
{
  return self->_useSystemPrimaryFocusColor;
}

- (void)setUseSystemPrimaryFocusColor:(BOOL)a3
{
  self->_useSystemPrimaryFocusColor = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (CRSUIDashboardWidgetWindowProxy)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_focusableItems, 0);
  objc_storeStrong((id *)&self->_dashboardWindowServiceConnection, 0);
  objc_storeStrong((id *)&self->_widgetSizes, 0);
}

- (void)setFocusableViews:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21817A000, log, OS_LOG_TYPE_ERROR, "Attempting to set new focusable views after invalidation, ignoring.", v1, 2u);
}

@end