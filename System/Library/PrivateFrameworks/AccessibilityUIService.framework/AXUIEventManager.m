@interface AXUIEventManager
+ (id)sharedEventManager;
- (BOOL)_handleUIEvent:(id)a3;
- (BOOL)laserEnabled;
- (NSHashTable)eventHandlers;
- (id)_init;
- (void)registerEventHandler:(id)a3;
- (void)setEventHandlers:(id)a3;
- (void)unregisterEventHandler:(id)a3;
@end

@implementation AXUIEventManager

+ (id)sharedEventManager
{
  if (sharedEventManager_onceToken != -1) {
    dispatch_once(&sharedEventManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedEventManager__SharedEventManager;

  return v2;
}

uint64_t __38__AXUIEventManager_sharedEventManager__block_invoke()
{
  sharedEventManager__SharedEventManager = [[AXUIEventManager alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)AXUIEventManager;
  v2 = [(AXUIEventManager *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F22940] sharedInstance];
    v2->_laserEnabled = [v3 laserEnabled];
  }
  return v2;
}

- (BOOL)_handleUIEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(AXUIEventManager *)self laserEnabled])
  {
    objc_super v5 = _AXUIPointerEventFromHIDEvent((const void *)[v4 _hidEvent]);
    if (v5)
    {
      v6 = [(AXUIEventManager *)self eventHandlers];
      v7 = [v6 allObjects];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        char v11 = 0;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              char v11 = v11 & 1 | objc_msgSend(v14, "handlePointerEvent:", v5, (void)v17);
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }

    BOOL v15 = v11 & 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)registerEventHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AXUIEventManager *)self eventHandlers];

  if (!v5)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(AXUIEventManager *)self setEventHandlers:v6];
  }
  id v7 = [(AXUIEventManager *)self eventHandlers];
  [v7 addObject:v4];
}

- (void)unregisterEventHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AXUIEventManager *)self eventHandlers];
  [v5 removeObject:v4];

  v6 = [(AXUIEventManager *)self eventHandlers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(AXUIEventManager *)self setEventHandlers:0];
  }
}

- (NSHashTable)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setEventHandlers:(id)a3
{
}

- (BOOL)laserEnabled
{
  return self->_laserEnabled;
}

- (void).cxx_destruct
{
}

@end