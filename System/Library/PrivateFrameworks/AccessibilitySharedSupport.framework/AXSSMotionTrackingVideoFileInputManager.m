@interface AXSSMotionTrackingVideoFileInputManager
- (AXSSMotionTrackingVideoFileInputManager)init;
- (AXSSMotionTrackingVideoFileInputManagerDelegate)delegate;
- (BOOL)_monitoring;
- (NSArray)videoFileInputNames;
- (NSMutableArray)_videoFileInputNames;
- (void)_update;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)set_monitoring:(BOOL)a3;
- (void)set_videoFileInputNames:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AXSSMotionTrackingVideoFileInputManager

- (AXSSMotionTrackingVideoFileInputManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXSSMotionTrackingVideoFileInputManager;
  v2 = [(AXSSMotionTrackingVideoFileInputManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    videoFileInputNames = v2->__videoFileInputNames;
    v2->__videoFileInputNames = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self->__monitoring)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingVideoFileInputManager;
  [(AXSSMotionTrackingVideoFileInputManager *)&v4 dealloc];
}

- (NSArray)videoFileInputNames
{
  v2 = (void *)[(NSMutableArray *)self->__videoFileInputNames copy];

  return (NSArray *)v2;
}

- (void)startMonitoring
{
  if (![(AXSSMotionTrackingVideoFileInputManager *)self _monitoring])
  {
    [(AXSSMotionTrackingVideoFileInputManager *)self set_monitoring:1];
    uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:self selector:sel__videoFileInputNamesChanged_ name:@"com.apple.accessibility.MotionTracking.testVideoFileInputNamesChanged" object:0];

    [(AXSSMotionTrackingVideoFileInputManager *)self _update];
  }
}

- (void)stopMonitoring
{
  if ([(AXSSMotionTrackingVideoFileInputManager *)self _monitoring])
  {
    uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:self];

    [(AXSSMotionTrackingVideoFileInputManager *)self set_monitoring:0];
  }
}

- (void)_update
{
  if ([(id)objc_opt_class() allowVideoFileInput])
  {
    if (_update_onceToken != -1) {
      dispatch_once(&_update_onceToken, &__block_literal_global_0);
    }
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    objc_super v4 = [(id)_update_s_userDefaults objectForKey:@"testVideoFileInputNames"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke_2;
      v13[3] = &unk_1E606CAE8;
      id v14 = v3;
      [v4 enumerateObjectsUsingBlock:v13];
    }
    v5 = [(AXSSMotionTrackingVideoFileInputManager *)self _videoFileInputNames];
    char v6 = [v3 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      v7 = NSStringFromSelector(sel_videoFileInputNames);
      [(AXSSMotionTrackingVideoFileInputManager *)self willChangeValueForKey:v7];

      uint64_t v8 = [(AXSSMotionTrackingVideoFileInputManager *)self _videoFileInputNames];
      [(id)v8 setArray:v3];

      v9 = NSStringFromSelector(sel_videoFileInputNames);
      [(AXSSMotionTrackingVideoFileInputManager *)self didChangeValueForKey:v9];

      v10 = [(AXSSMotionTrackingVideoFileInputManager *)self delegate];
      LOBYTE(v8) = objc_opt_respondsToSelector();

      if (v8)
      {
        v11 = [(AXSSMotionTrackingVideoFileInputManager *)self delegate];
        v12 = (void *)[v3 copy];
        [v11 motionTrackingVideoFileInputManager:self updatedVideoFileInputNames:v12];
      }
    }
  }
}

uint64_t __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke()
{
  _update_s_userDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.accessibility.MotionTracking"];

  return MEMORY[0x1F41817F8]();
}

void __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (AXSSMotionTrackingVideoFileInputManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSSMotionTrackingVideoFileInputManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_monitoring
{
  return self->__monitoring;
}

- (void)set_monitoring:(BOOL)a3
{
  self->__monitoring = a3;
}

- (NSMutableArray)_videoFileInputNames
{
  return self->__videoFileInputNames;
}

- (void)set_videoFileInputNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__videoFileInputNames, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end