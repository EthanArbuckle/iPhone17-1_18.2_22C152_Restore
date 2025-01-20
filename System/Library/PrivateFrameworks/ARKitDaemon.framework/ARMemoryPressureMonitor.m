@interface ARMemoryPressureMonitor
- (ARMemoryPressureMonitor)init;
- (ARMemoryPressureMonitorDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ARMemoryPressureMonitor

- (ARMemoryPressureMonitor)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)ARMemoryPressureMonitor;
  id v2 = [(ARMemoryPressureMonitor *)&v13 init];
  if (!v2) {
    goto LABEL_4;
  }
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 0x36uLL, MEMORY[0x263EF83A0]);
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  if (*((void *)v2 + 1))
  {
    objc_initWeak((id *)location, v2);
    v5 = *((void *)v2 + 1);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __31__ARMemoryPressureMonitor_init__block_invoke;
    handler[3] = &unk_265206DE0;
    objc_copyWeak(&v12, (id *)location);
    dispatch_source_set_event_handler(v5, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 1));
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
LABEL_4:
    v6 = (ARMemoryPressureMonitor *)v2;
    goto LABEL_8;
  }
  v7 = _ARLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)location = 138543618;
    *(void *)&location[4] = v9;
    __int16 v15 = 2048;
    id v16 = v2;
    _os_log_impl(&dword_24719A000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create the dispatch source for monitoring memory pressure.", location, 0x16u);
  }
  v6 = 0;
LABEL_8:

  return v6;
}

void __31__ARMemoryPressureMonitor_init__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_17;
  }
  int64_t data = dispatch_source_get_data(WeakRetained[1]);
  int64_t v4 = data;
  if (data <= 15)
  {
    if (data == 2)
    {
      v5 = [(dispatch_source_t *)v2 delegate];
      v6 = v5;
      v7 = v2;
      uint64_t v8 = 0;
      goto LABEL_13;
    }
    if (data == 4)
    {
      v5 = [(dispatch_source_t *)v2 delegate];
      v6 = v5;
      v7 = v2;
      uint64_t v8 = 1;
LABEL_13:
      [v5 memoryPressureMonitor:v7 didUpdateSystemMemoryPressureCondition:v8];
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (data == 16)
  {
    v9 = [(dispatch_source_t *)v2 delegate];
    v6 = v9;
    v10 = v2;
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  if (data == 32)
  {
    v9 = [(dispatch_source_t *)v2 delegate];
    v6 = v9;
    v10 = v2;
    uint64_t v11 = 1;
LABEL_15:
    [v9 memoryPressureMonitor:v10 didUpdateProcessMemoryPressureCondition:v11];
    goto LABEL_16;
  }
LABEL_9:
  id v12 = _ARLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_super v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    int v15 = 138543618;
    id v16 = v14;
    __int16 v17 = 2048;
    int64_t v18 = v4;
    _os_log_impl(&dword_24719A000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Received an unexpected memory pressure condition value: %lu", (uint8_t *)&v15, 0x16u);
  }
LABEL_17:
}

- (void)dealloc
{
  memoryPressureEventSource = self->_memoryPressureEventSource;
  if (memoryPressureEventSource)
  {
    dispatch_source_cancel(memoryPressureEventSource);
    int64_t v4 = self->_memoryPressureEventSource;
    self->_memoryPressureEventSource = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARMemoryPressureMonitor;
  [(ARMemoryPressureMonitor *)&v5 dealloc];
}

- (ARMemoryPressureMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARMemoryPressureMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_memoryPressureEventSource, 0);
}

@end