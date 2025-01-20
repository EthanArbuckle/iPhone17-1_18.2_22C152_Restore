@interface TKSharedResourceSlot
- (OS_dispatch_queue)idleQueue;
- (TKSharedResourceSlot)initWithName:(id)a3;
- (double)idleTimeout;
- (id)createObjectBlock;
- (id)description;
- (id)object;
- (id)objectDestroyedBlock;
- (id)resourceWithError:(id *)a3;
- (void)dealloc;
- (void)destroyObject;
- (void)releaseResourceImmediatelly:(BOOL)a3;
- (void)setCreateObjectBlock:(id)a3;
- (void)setIdleQueue:(id)a3;
- (void)setIdleTimeout:(double)a3;
- (void)setObjectDestroyedBlock:(id)a3;
@end

@implementation TKSharedResourceSlot

- (id)resourceWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = (TKSharedResource *)objc_loadWeakRetained((id *)&v4->_resource);
  if (!WeakRetained)
  {
    if (v4->_object)
    {
      idleTimer = v4->_idleTimer;
      if (!idleTimer)
      {
        v12 = TK_LOG_sharedrsc();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[TKSharedResourceSlot resourceWithError:]((uint64_t)v4, v12);
        }

        goto LABEL_13;
      }
      dispatch_source_cancel(idleTimer);
      v7 = v4->_idleTimer;
      v4->_idleTimer = 0;
    }
    else
    {
      v8 = [(TKSharedResourceSlot *)v4 createObjectBlock];

      if (v8)
      {
        v9 = [(TKSharedResourceSlot *)v4 createObjectBlock];
        uint64_t v10 = ((void (**)(void, id *))v9)[2](v9, a3);
        id object = v4->_object;
        v4->_id object = (id)v10;

        if (!v4->_object)
        {
          WeakRetained = 0;
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      v7 = v4->_object;
      v4->_id object = (id)MEMORY[0x1E4F1CC38];
    }

LABEL_13:
    WeakRetained = [[TKSharedResource alloc] initWithSlot:v4];
    objc_storeWeak((id *)&v4->_resource, WeakRetained);
  }
LABEL_14:
  objc_sync_exit(v4);

  return WeakRetained;
}

- (id)createObjectBlock
{
  return self->_createObjectBlock;
}

- (id)object
{
  return self->_object;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (OS_dispatch_queue)idleQueue
{
  return self->_idleQueue;
}

- (TKSharedResourceSlot)initWithName:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKSharedResourceSlot;
  v6 = [(TKSharedResourceSlot *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    id v8 = [NSString stringWithFormat:@"resourceslot:%@", v7->_name];
    v9 = (const char *)[v8 UTF8String];
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    idleQueue = v7->_idleQueue;
    v7->_idleQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (id)description
{
  if (self->_object)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resource);
    v4 = @"ACTIVE";
    if (!WeakRetained) {
      v4 = @"IDLE";
    }
    id v5 = v4;
  }
  else
  {
    id v5 = @"EMPTY";
  }
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@ %@ %@ %p o=%@>", v8, self->_name, v5, self, self->_object];

  return v9;
}

- (void)destroyObject
{
  objectDestroyedBlock = (void (**)(void))self->_objectDestroyedBlock;
  if (objectDestroyedBlock && self->_object) {
    objectDestroyedBlock[2]();
  }
  id object = self->_object;
  self->_id object = 0;
}

- (void)releaseResourceImmediatelly:(BOOL)a3
{
  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_resource, 0);
  if (a3 || ([(TKSharedResourceSlot *)v4 idleTimeout], v5 == 0.0))
  {
    [(TKSharedResourceSlot *)v4 destroyObject];
  }
  else
  {
    v6 = [(TKSharedResourceSlot *)v4 idleQueue];
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
    idleTimer = v4->_idleTimer;
    v4->_idleTimer = (OS_dispatch_source *)v7;

    [(TKSharedResourceSlot *)v4 idleTimeout];
    uint64_t v10 = (uint64_t)(v9 * 1000000000.0);
    dispatch_queue_t v11 = v4->_idleTimer;
    dispatch_time_t v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, v10);
    objc_initWeak(&location, v4);
    v13 = v4->_idleTimer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke;
    v14[3] = &unk_1E63C8270;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)v4->_idleTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = objc_loadWeakRetained((id *)&v3[2].isa);

    if (v4)
    {
      double v5 = TK_LOG_sharedrsc();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2((uint64_t)v3, v5);
      }
    }
    else
    {
      isa = v3[4].isa;
      if (isa)
      {
        dispatch_source_cancel(isa);
        Class v7 = v3[4].isa;
      }
      else
      {
        Class v7 = 0;
      }
      v3[4].isa = 0;

      [v3 destroyObject];
    }
    objc_sync_exit(v3);
  }
  else
  {
    v3 = TK_LOG_sharedrsc();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1(v3);
    }
  }
}

- (void)dealloc
{
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel(idleTimer);
    id v4 = self->_idleTimer;
    self->_idleTimer = 0;
  }
  if (self->_object) {
    [(TKSharedResourceSlot *)self destroyObject];
  }
  v5.receiver = self;
  v5.super_class = (Class)TKSharedResourceSlot;
  [(TKSharedResourceSlot *)&v5 dealloc];
}

- (void)setCreateObjectBlock:(id)a3
{
}

- (id)objectDestroyedBlock
{
  return self->_objectDestroyedBlock;
}

- (void)setObjectDestroyedBlock:(id)a3
{
}

- (void)setIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (void)setIdleQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleQueue, 0);
  objc_storeStrong(&self->_objectDestroyedBlock, 0);
  objc_storeStrong(&self->_createObjectBlock, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong(&self->_object, 0);
  objc_destroyWeak((id *)&self->_resource);

  objc_storeStrong((id *)&self->_name, 0);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "Idle callback detected, but slot is already gone, ignoring it", v1, 2u);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BED55000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: got idle, but item is revived, ignoring", (uint8_t *)&v2, 0xCu);
}

- (void)resourceWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BED55000, a2, OS_LOG_TYPE_DEBUG, "%@ activating from idle, but idle timer is unset", (uint8_t *)&v2, 0xCu);
}

@end