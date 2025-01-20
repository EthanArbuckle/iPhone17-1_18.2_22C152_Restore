@interface BLSHDefaultsObserver
- (BLSHDefaultsObserver)init;
- (BOOL)invalidated;
- (void)addHandlerForKey:(id)a3 attributes:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation BLSHDefaultsObserver

- (BLSHDefaultsObserver)init
{
  v24[1] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)BLSHDefaultsObserver;
  v2 = [(BLSHDefaultsObserver *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
    observedDefaults = v2->_observedDefaults;
    v2->_observedDefaults = (NSUserDefaults *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:512 capacity:4];
    handlers = v2->_handlers;
    v2->_handlers = (NSMapTable *)v5;

    v7 = [MEMORY[0x263F29938] alwaysFillFlipbook];
    v24[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [(BLSHDefaultsObserver *)v2 addHandlerForKey:@"alwaysFillFlipbook" attributes:v8];

    v9 = [MEMORY[0x263F299F8] disableWatchdogs];
    v23 = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    [(BLSHDefaultsObserver *)v2 addHandlerForKey:@"backlightWatchdogsDisabled" attributes:v10];

    v11 = [MEMORY[0x263F29A08] disableFlipbook];
    v22[0] = v11;
    v12 = [MEMORY[0x263F29A78] pauseOnSystemSleep];
    v22[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    [(BLSHDefaultsObserver *)v2 addHandlerForKey:@"disableFlipbook" attributes:v13];

    v14 = [MEMORY[0x263F29AD8] transparentFlipbook];
    v21 = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [(BLSHDefaultsObserver *)v2 addHandlerForKey:@"transparentFlipbook" attributes:v15];

    v16 = [MEMORY[0x263F29A90] usePseudoFlipbook];
    v20 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    [(BLSHDefaultsObserver *)v2 addHandlerForKey:@"usePseudoFlipbook" attributes:v17];
  }
  return v2;
}

- (void)addHandlerForKey:(id)a3 attributes:(id)a4
{
  handlers = self->_handlers;
  id v8 = a3;
  v7 = +[BLSHDefaultHandler handlerForKey:v8 attributes:a4];
  [(NSMapTable *)handlers setObject:v7 forKey:v8];

  [(NSUserDefaults *)self->_observedDefaults addObserver:self forKeyPath:v8 options:5 context:v8];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHDefaultsObserver.m";
  __int16 v10 = 1024;
  int v11 = 71;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(BLSHDefaultsObserver *)self setInvalidated:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = NSAllMapTableValues(self->_handlers);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invalidate", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(NSMapTable *)self->_handlers objectForKey:a6];
  if (v13 && ![(BLSHDefaultsObserver *)self invalidated])
  {
    uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [v14 BOOLValue];
    }
    else {
      uint64_t v15 = 0;
    }
    [v13 updateForNewValue:v15];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)BLSHDefaultsObserver;
    [(BLSHDefaultsObserver *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_observedDefaults, 0);
}

@end