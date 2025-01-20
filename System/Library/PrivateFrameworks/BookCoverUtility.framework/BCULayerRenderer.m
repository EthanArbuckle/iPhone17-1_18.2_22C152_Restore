@interface BCULayerRenderer
- (BCULayerRenderer)init;
- (BCULayerRenderer)initWithSuspended:(BOOL)a3;
- (id)newOperationWithPriority:(float)a3 renderLayer:(id)a4 completion:(id)a5;
- (id)newOperationWithPriority:(float)a3 waitForCPUSynchronization:(BOOL)a4 logKey:(id)a5 renderLayer:(id)a6 completion:(id)a7;
- (void)_disconnectLayer:(id)a3;
- (void)_processOperations;
- (void)_startOperation:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation BCULayerRenderer

- (BCULayerRenderer)init
{
  return (BCULayerRenderer *)MEMORY[0x270F9A6D0](self, sel_initWithSuspended_, 0);
}

- (BCULayerRenderer)initWithSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCULayerRenderer;
  id v4 = [(BCULayerRenderer *)&v18 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("BCULayerRenderer.accessQueue", v5);
    v7 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("BCULayerRenderer.renderQueue", v8);
    v10 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("BCULayerRenderer.completionQueue", v11);
    v13 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v12;

    uint64_t v15 = objc_msgSend_hashTableWithOptions_(MEMORY[0x263F088B0], v14, 517);
    v16 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v15;

    if (v3)
    {
      *((unsigned char *)v4 + 64) = 1;
      dispatch_suspend(*((dispatch_object_t *)v4 + 2));
    }
  }
  return (BCULayerRenderer *)v4;
}

- (void)suspend
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  if (!self->_suspended)
  {
    BOOL v3 = sub_236A40F2C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_236A3F000, v3, OS_LOG_TYPE_DEFAULT, "suspending renderQueue", v4, 2u);
    }

    self->_suspended = 1;
    dispatch_suspend((dispatch_object_t)self->_renderQueue);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
}

- (void)resume
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  if (self->_suspended)
  {
    self->_suspended = 0;
    BOOL v3 = sub_236A40F2C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v6 = 0;
      _os_log_impl(&dword_236A3F000, v3, OS_LOG_TYPE_DEFAULT, "resuming renderQueue", v6, 2u);
    }

    dispatch_resume((dispatch_object_t)self->_renderQueue);
    objc_msgSend__processOperations(self, v4, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
}

- (id)newOperationWithPriority:(float)a3 waitForCPUSynchronization:(BOOL)a4 logKey:(id)a5 renderLayer:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  uint64_t v15 = [_BCULayerRendererOperation alloc];
  *(float *)&double v16 = a3;
  objc_super v18 = objc_msgSend_initWithRenderer_priority_waitForCPUSynchronization_logKey_layerBlock_completion_(v15, v17, (uint64_t)self, v9, v14, v13, v12, v16);

  return v18;
}

- (id)newOperationWithPriority:(float)a3 renderLayer:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [_BCULayerRendererOperation alloc];
  *(float *)&double v11 = a3;
  id v13 = objc_msgSend_initWithRenderer_priority_waitForCPUSynchronization_logKey_layerBlock_completion_(v10, v12, (uint64_t)self, 0, 0, v9, v8, v11);

  return v13;
}

- (void)_startOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236A41240;
    block[3] = &unk_264CBAAF0;
    block[4] = self;
    double v11 = &v12;
    id v10 = v4;
    dispatch_sync(accessQueue, block);
    if (*((unsigned char *)v13 + 24)) {
      objc_msgSend__processOperations(self, v7, v8);
    }

    _Block_object_dispose(&v12, 8);
  }
}

- (void)_processOperations
{
  renderQueue = self->_renderQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_236A413B4;
  block[3] = &unk_264CBAB90;
  block[4] = self;
  dispatch_async(renderQueue, block);
}

- (void)_disconnectLayer:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = objc_msgSend_sublayers(v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, v20, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend__disconnectLayer_(self, v10, *(void *)(*((void *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend_setSublayers_(v4, v14, 0);
  objc_msgSend_setMask_(v4, v15, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end