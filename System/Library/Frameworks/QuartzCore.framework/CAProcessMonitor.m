@interface CAProcessMonitor
- (CAProcessMonitor)initWithCallback:(id)a3;
- (void)addMonitoringProcess:(int)a3;
- (void)dealloc;
- (void)removeMonitoringProcess:(int)a3;
- (void)updateConfiguration;
@end

@implementation CAProcessMonitor

uint64_t __41__CAProcessMonitor_addMonitoringProcess___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateConfiguration];
  v2 = (void *)[MEMORY[0x1E4F963E8] handleForIdentifier:*(void *)(a1 + 40) error:0];
  v3 = v2;
  if (!v2 || [v2 pid] == -1)
  {
    uint64_t v7 = 0;
    BOOL v5 = 0;
  }
  else
  {
    v4 = (void *)[v3 currentState];
    BOOL v5 = (BOOL)v4;
    if (v4)
    {
      int v6 = [v4 taskState];
      if ((v6 - 3) >= 2)
      {
        int v8 = v6;
        unsigned int v9 = [v3 isApplication] ^ 1;
        if (v8 == 2) {
          uint64_t v7 = v9;
        }
        else {
          uint64_t v7 = 0;
        }
      }
      else
      {
        uint64_t v7 = 1;
      }
      BOOL v5 = [v3 isApplication]
        && !objc_msgSend((id)objc_msgSend((id)v5, "endowmentNamespaces"), "containsObject:", @"com.apple.frontboard.visibility")|| objc_msgSend((id)v5, "taskState") == 3;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = [v3 pid];
  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL))(v10 + 16);

  return v12(v10, v11, v7, v5);
}

void __39__CAProcessMonitor_updateConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = (void *)MEMORY[0x185324A30]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned int v9 = WeakRetained;
    uint64_t v10 = (void *)[a4 state];
    int v11 = [v10 taskState];
    if ((v11 - 3) >= 2)
    {
      int v13 = v11;
      unsigned int v14 = [a3 isApplication] ^ 1;
      if (v13 == 2) {
        uint64_t v12 = v14;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
    BOOL v15 = [a3 isApplication]
       && !objc_msgSend((id)objc_msgSend(v10, "endowmentNamespaces"), "containsObject:", @"com.apple.frontboard.visibility")|| objc_msgSend(v10, "taskState") == 3;
    (*(void (**)(void, uint64_t, uint64_t, BOOL))(v9[1] + 16))(v9[1], [a3 pid], v12, v15);
  }
}

- (void)updateConfiguration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  processIdentifiers = self->_processIdentifiers;
  objc_sync_enter(processIdentifiers);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = self->_processIdentifiers;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i)));
      }
      uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
  objc_sync_exit(processIdentifiers);
  id location = 0;
  objc_initWeak(&location, self);
  processMonitor = self->_processMonitor;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__CAProcessMonitor_updateConfiguration__block_invoke;
  v10[3] = &unk_1E527E588;
  v10[4] = v3;
  objc_copyWeak(&v11, &location);
  [(RBSProcessMonitor *)processMonitor updateConfiguration:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)addMonitoringProcess:(int)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F963F8] identifierWithPid:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = v4;
    processIdentifiers = self->_processIdentifiers;
    objc_sync_enter(processIdentifiers);
    if ([(NSMutableSet *)self->_processIdentifiers containsObject:v5])
    {
      objc_sync_exit(processIdentifiers);
    }
    else
    {
      [(NSMutableSet *)self->_processIdentifiers addObject:v5];
      objc_sync_exit(processIdentifiers);
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__CAProcessMonitor_addMonitoringProcess___block_invoke;
      block[3] = &unk_1E527FC48;
      block[4] = self;
      block[5] = v5;
      dispatch_async(queue, block);
    }
  }
}

void __39__CAProcessMonitor_updateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&unk_1ED05B9F0];
  [a2 setStateDescriptor:v4];
  [a2 setPredicates:*(void *)(a1 + 32)];
  [a2 setEvents:1];
  [a2 setServiceClass:33];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CAProcessMonitor_updateConfiguration__block_invoke_2;
  v5[3] = &unk_1E527E560;
  objc_copyWeak(v6, (id *)(a1 + 40));
  [a2 setUpdateHandler:v5];
  objc_destroyWeak(v6);
}

- (void)removeMonitoringProcess:(int)a3
{
  v8[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F963F8] identifierWithPid:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = v4;
    processIdentifiers = self->_processIdentifiers;
    objc_sync_enter(processIdentifiers);
    if ([(NSMutableSet *)self->_processIdentifiers containsObject:v5])
    {
      [(NSMutableSet *)self->_processIdentifiers removeObject:v5];
      objc_sync_exit(processIdentifiers);
      queue = self->_queue;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44__CAProcessMonitor_removeMonitoringProcess___block_invoke;
      v8[3] = &unk_1E52807A0;
      v8[4] = self;
      dispatch_async(queue, v8);
    }
    else
    {
      objc_sync_exit(processIdentifiers);
    }
  }
}

uint64_t __44__CAProcessMonitor_removeMonitoringProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConfiguration];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  _Block_release(self->_callback);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CAProcessMonitor;
  [(CAProcessMonitor *)&v3 dealloc];
}

- (CAProcessMonitor)initWithCallback:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CAProcessMonitor;
  uint64_t v4 = [(CAProcessMonitor *)&v7 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("CAProcessMonitor Queue", v5);
    v4->_callback = _Block_copy(a3);
    v4->_processMonitor = (RBSProcessMonitor *)objc_alloc_init(MEMORY[0x1E4F96418]);
    v4->_processIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
  }
  return v4;
}

@end