@interface CPSWindow
- (BOOL)_isKeyWindowForDeferral;
- (NSHashTable)observers;
- (void)addEventObserver:(id)a3;
- (void)removeEventObserver:(id)a3;
- (void)sendEvent:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CPSWindow

- (void)addEventObserver:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSWindow *)v11 observers];
  BOOL v9 = v3 != 0;

  if (!v9)
  {
    v4 = (NSHashTable *)(id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v11->_observers;
    v11->_observers = v4;
  }
  v7 = [(CPSWindow *)v11 observers];
  BOOL v8 = [(NSHashTable *)v7 containsObject:location[0]];

  if (!v8)
  {
    v6 = [(CPSWindow *)v11 observers];
    [(NSHashTable *)v6 addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)removeEventObserver:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSWindow *)v7 observers];
  BOOL v5 = [(NSHashTable *)v4 containsObject:location[0]];

  if (v5)
  {
    v3 = [(CPSWindow *)v7 observers];
    [(NSHashTable *)v3 removeObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)sendEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v17 = 1;
  char v15 = 0;
  char v10 = 1;
  if ([location[0] type] != 7)
  {
    char v9 = 0;
    if (![location[0] type])
    {
      id v16 = (id)[location[0] allTouches];
      char v15 = 1;
      char v9 = _touchesContainIndirectTouch(v16);
    }
    char v10 = v9;
  }
  if (v15) {

  }
  if (v10)
  {
    memset(__b, 0, sizeof(__b));
    obj = [(CPSWindow *)v19 observers];
    uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v20 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0;
      unint64_t v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(__b[1] + 8 * v5);
        char v12 = objc_msgSend(v14, "shouldForwardEventForWindow:eventType:", v19, objc_msgSend(location[0], "type")) & 1;
        if ((v17 & 1) == 1 && (v12 & 1) == 0) {
          char v17 = 0;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v20 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }
  }
  if (v17)
  {
    v11.receiver = v19;
    v11.super_class = (Class)CPSWindow;
    [(CPSWindow *)&v11 sendEvent:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isKeyWindowForDeferral
{
  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end