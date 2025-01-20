@interface _FEFocusItemFrameReporter
- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6;
- (BOOL)isEnabled;
- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3;
- (_FEFocusItemFrameReporter)initWithFocusSystem:(id)a3;
- (_FEFocusSystem)focusSystem;
- (void)_cancelRepeatingFrameUpdate;
- (void)_focusSystemEnabledStateDidChange:(id)a3;
- (void)_reportFocusFrameForCurrentlyFocusedItem;
- (void)_scheduleRepeatingFrameUpdate;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _FEFocusItemFrameReporter

- (_FEFocusItemFrameReporter)initWithFocusSystem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FEFocusItemFrameReporter;
  v5 = [(_FEFocusItemFrameReporter *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    -[_FEFocusItemFrameReporter setEnabled:](v6, "setEnabled:", [v4 _isEnabled]);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel__focusSystemEnabledStateDidChange_ name:0x2700CC300 object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:0x2700CC300 object:0];

  v4.receiver = self;
  v4.super_class = (Class)_FEFocusItemFrameReporter;
  [(_FEFocusItemFrameReporter *)&v4 dealloc];
}

- (void)_reportFocusFrameForCurrentlyFocusedItem
{
  if (self->_enabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [(_FEFocusItemFrameReporter *)self _globalFrameForFocusedItemInSystem:WeakRetained];
      id WeakRetained = (id)-[_FEFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:");
      id v4 = v5;
    }
    MEMORY[0x270F9A758](WeakRetained, v4);
  }
}

- (void)_scheduleRepeatingFrameUpdate
{
  if (self->_enabled)
  {
    if (!self->_focusedFrameUpdateTimer)
    {
      objc_initWeak(&location, self);
      v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
      self->_focusedFrameUpdateTimer = v3;

      id v5 = self->_focusedFrameUpdateTimer;
      dispatch_time_t v6 = dispatch_time(0, 0);
      dispatch_source_set_timer(v5, v6, 0xBEBC200uLL, 0x2FAF080uLL);
      v7 = self->_focusedFrameUpdateTimer;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __58___FEFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke;
      v8[3] = &unk_265328060;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v7, v8);
      dispatch_resume((dispatch_object_t)self->_focusedFrameUpdateTimer);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(_FEFocusItemFrameReporter *)self _cancelRepeatingFrameUpdate];
  }
}

- (void)_cancelRepeatingFrameUpdate
{
  focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
  if (focusedFrameUpdateTimer)
  {
    dispatch_source_cancel(focusedFrameUpdateTimer);
    id v4 = self->_focusedFrameUpdateTimer;
    self->_focusedFrameUpdateTimer = 0;
  }
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(_FEFocusItemFrameReporter *)self focusSystem];
  id v5 = [v4 object];

  dispatch_time_t v6 = v7;
  if (v5 == v7)
  {
    -[_FEFocusItemFrameReporter setEnabled:](self, "setEnabled:", [v7 _isEnabled]);
    dispatch_time_t v6 = v7;
  }
}

- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  BOOL IsNull = CGRectIsNull(a3);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (IsNull != CGRectIsNull(v22)) {
    return 1;
  }
  v23.origin.CGFloat x = v13;
  v23.origin.CGFloat y = v12;
  v23.size.double width = v11;
  v23.size.double height = v10;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  CGRect v24 = CGRectIntersection(v23, v25);
  double v15 = v24.size.width;
  double v16 = v24.size.height;
  if (CGRectIsNull(v24)) {
    return 1;
  }
  double v17 = v11 * v10 / (v15 * v16);
  if (v17 < a5 || v17 > a6) {
    return 1;
  }
  BOOL v20 = v10 / height < a5;
  if (v10 / height > a6) {
    BOOL v20 = 1;
  }
  BOOL v21 = v11 / width < a5;
  if (v11 / width > a6) {
    BOOL v21 = 1;
  }
  return v21 || v20;
}

- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 focusedItem];
  id v5 = [v4 _parentFocusEnvironment];
  dispatch_time_t v6 = [v5 _focusItemContainer];

  if (v4 && v6)
  {
    id v7 = [v3 _focusItemContainer];
    v8 = [v7 _focusCoordinateSpace];

    id v9 = [v6 _focusCoordinateSpace];
    [v4 _focusFrame];
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A0];
    double v13 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      [(_FEFocusItemFrameReporter *)self _scheduleRepeatingFrameUpdate];
    }
    else
    {
      [(_FEFocusItemFrameReporter *)self _cancelRepeatingFrameUpdate];
      -[_FEFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
      self->_enabled = 0;
    }
  }
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (_FEFocusSystem *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_focusedFrameUpdateTimer, 0);
}

@end