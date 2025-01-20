@interface CoreRCInterfaceController
- (BOOL)addBundlesFromPaths:(id)a3 expectedClass:(Class)a4;
- (BOOL)addInterfaceListenerClass:(Class)a3;
- (CECFakeInterfaceListener)fakeInterfaceListener;
- (CoreRCInterfaceController)init;
- (CoreRCInterfaceControllerDelegate)delegate;
- (NSArray)interfaceListeners;
- (OS_dispatch_queue)queue;
- (id)firstInterface;
- (void)dealloc;
- (void)interfaceListener:(id)a3 didAddInterface:(id)a4;
- (void)interfaceListener:(id)a3 didRemoveInterface:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startOnQueue:(id)a3;
@end

@implementation CoreRCInterfaceController

- (CECFakeInterfaceListener)fakeInterfaceListener
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CoreRCInterfaceController *)self interfaceListeners];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(v2);
    }
    v7 = *(CECFakeInterfaceListener **)(*((void *)&v11 + 1) + 8 * v6);
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    if (!strcmp(Name, "CECFakeInterfaceListener")) {
      return v7;
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (CoreRCInterfaceController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CoreRCInterfaceController;
  v2 = [(CoreRCInterfaceController *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v2->_interfaceListeners = (NSMutableArray *)v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  interfaceListeners = self->_interfaceListeners;
  uint64_t v4 = [(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(interfaceListeners);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 setDelegate:0];
        [v8 unscheduleFromDispatchQueue:self->_queue];
      }
      uint64_t v5 = [(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)CoreRCInterfaceController;
  [(CoreRCInterfaceController *)&v9 dealloc];
}

- (BOOL)addInterfaceListenerClass:(Class)a3
{
  uint64_t v4 = (void *)[[a3 alloc] initWithInterfaceController:self];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setDelegate:self];
    [(NSMutableArray *)self->_interfaceListeners addObject:v5];
  }
  return v5 != 0;
}

- (BOOL)addBundlesFromPaths:(id)a3 expectedClass:(Class)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        v9 &= -[CoreRCInterfaceController addInterfaceListenerClass:](self, "addInterfaceListenerClass:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "principalClass"));
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (void)startOnQueue:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xAuLL, 0);
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v9), "stringByAppendingPathComponent:", @"CoreRC"), "stringByAppendingPathComponent:", @"InterfacePlugins");
        -[CoreRCInterfaceController addBundlesFromPaths:expectedClass:](self, "addBundlesFromPaths:expectedClass:", [MEMORY[0x263F086E0] pathsForResourcesOfType:@"plugin" inDirectory:v10], objc_opt_class());
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x263F086E0], "pathsForResourcesOfType:inDirectory:", @"plugin", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "builtInPlugInsPath"), "stringByAppendingPathComponent:", @"InterfacePlugins"));
  [(CoreRCInterfaceController *)self addBundlesFromPaths:v11 expectedClass:objc_opt_class()];
  [(CoreRCInterfaceController *)self addInterfaceListenerClass:objc_opt_class()];
  self->_queue = (OS_dispatch_queue *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  interfaceListeners = self->_interfaceListeners;
  uint64_t v13 = [(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(interfaceListeners);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __42__CoreRCInterfaceController_startOnQueue___block_invoke;
        v18[3] = &unk_2652E3520;
        v18[4] = v17;
        v18[5] = a3;
        dispatch_async((dispatch_queue_t)a3, v18);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
}

uint64_t __42__CoreRCInterfaceController_startOnQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleWithDispatchQueue:*(void *)(a1 + 40)];
}

- (id)firstInterface
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  interfaceListeners = self->_interfaceListeners;
  id result = (id)[(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(interfaceListeners);
      }
      id result = (id)[*(id *)(*((void *)&v7 + 1) + 8 * v6) firstInterface];
      if (result) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id result = (id)[(NSMutableArray *)interfaceListeners countByEnumeratingWithState:&v7 objects:v11 count:16];
        id v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)interfaceListener:(id)a3 didAddInterface:(id)a4
{
  [a4 scheduleWithDispatchQueue:self->_queue];
  uint64_t v6 = [(CoreRCInterfaceController *)self delegate];
  [(CoreRCInterfaceControllerDelegate *)v6 interfaceController:self didAddInterface:a4];
}

- (void)interfaceListener:(id)a3 didRemoveInterface:(id)a4
{
  [(CoreRCInterfaceControllerDelegate *)[(CoreRCInterfaceController *)self delegate] interfaceController:self didRemoveInterface:a4];
  queue = self->_queue;
  [a4 unscheduleFromDispatchQueue:queue];
}

- (CoreRCInterfaceControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CoreRCInterfaceControllerDelegate *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)interfaceListeners
{
  return &self->_interfaceListeners->super;
}

@end