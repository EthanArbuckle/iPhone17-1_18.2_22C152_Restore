@interface _BCULayerRendererOperation
- (BCULayerRenderer)renderer;
- (BCUPurgeableImage)result;
- (BOOL)waitForCPUSynchronization;
- (CALayer)layer;
- (NSString)logKey;
- (_BCULayerRendererOperation)initWithRenderer:(id)a3 priority:(float)a4 waitForCPUSynchronization:(BOOL)a5 logKey:(id)a6 layerBlock:(id)a7 completion:(id)a8;
- (float)priority;
- (id)completion;
- (id)configureLayer;
- (id)layerBlock;
- (int64_t)_compareHoldingStateLock:(id)a3;
- (void)cancel;
- (void)completeWithImage:(id)a3;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setLayer:(id)a3;
- (void)setLayerBlock:(id)a3;
- (void)setPriority:(float)a3;
- (void)setRenderer:(id)a3;
- (void)setResult:(id)a3;
- (void)start;
@end

@implementation _BCULayerRendererOperation

- (_BCULayerRendererOperation)initWithRenderer:(id)a3 priority:(float)a4 waitForCPUSynchronization:(BOOL)a5 logKey:(id)a6 layerBlock:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v40.receiver = self;
  v40.super_class = (Class)_BCULayerRendererOperation;
  v19 = [(_BCULayerRendererOperation *)&v40 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_renderer, a3);
    uint64_t v23 = objc_msgSend_copy(v17, v21, v22);
    id layerBlock = v20->_layerBlock;
    v20->_id layerBlock = (id)v23;

    uint64_t v27 = objc_msgSend_copy(v18, v25, v26);
    id completion = v20->_completion;
    v20->_id completion = (id)v27;

    v20->_priority = a4;
    v20->_waitForCPUSynchronization = a5;
    if (objc_msgSend_length(v16, v29, v30))
    {
      uint64_t v33 = objc_msgSend_copy(v16, v31, v32);
      logKey = v20->_logKey;
      v20->_logKey = (NSString *)v33;
    }
    else
    {
      logKey = objc_msgSend_UUID(MEMORY[0x263F08C38], v31, v32);
      uint64_t v37 = objc_msgSend_UUIDString(logKey, v35, v36);
      v38 = v20->_logKey;
      v20->_logKey = (NSString *)v37;
    }
    atomic_store(atomic_fetch_add_explicit(&qword_26AF401E0, 1uLL, memory_order_relaxed), (unint64_t *)&v20->_operationId);
  }
  else
  {
    (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
  }

  return v20;
}

- (void)setPriority:(float)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  self->_priority = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
}

- (float)priority
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  float priority = self->_priority;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
  return priority;
}

- (void)start
{
}

- (id)configureLayer
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  if (self->_cancelled)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
    v3 = 0;
LABEL_3:
    v4 = 0;
    goto LABEL_4;
  }
  self->_configuring = 1;
  v3 = (void (**)(void))MEMORY[0x237E09C50](self->_layerBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
  if (!v3) {
    goto LABEL_3;
  }
  v3[2](v3);
  v4 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  self->_configuring = 0;
  if (self->_cancelled)
  {

    v4 = (void (**)(void, void, void))MEMORY[0x237E09C50](self->_completion);
    id completion = self->_completion;
    self->_id completion = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
    if (v4)
    {
      ((void (**)(void, _BCULayerRendererOperation *, void))v4)[2](v4, self, 0);

      goto LABEL_3;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
  }
LABEL_4:

  return v4;
}

- (void)cancel
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  self->_cancelled = 1;
  if (self->_configuring)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
  }
  else
  {
    v4 = (void (**)(id, _BCULayerRendererOperation *, void))MEMORY[0x237E09C50](self->_completion);
    id completion = self->_completion;
    self->_id completion = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
    if (v4)
    {
      v4[2](v4, self, 0);
    }
  }
}

- (void)completeWithImage:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
  v4 = (void (**)(void, void, void))MEMORY[0x237E09C50](self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
  if (v4) {
    ((void (**)(void, _BCULayerRendererOperation *, id))v4)[2](v4, self, v6);
  }
}

- (void)dealloc
{
  objc_msgSend_cancel(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)_BCULayerRendererOperation;
  [(_BCULayerRendererOperation *)&v4 dealloc];
}

- (int64_t)_compareHoldingStateLock:(id)a3
{
  id v4 = a3;
  float v5 = *((float *)v4 + 5);
  float priority = self->_priority;
  if (priority >= v5)
  {
    if (priority == v5)
    {
      int64_t v8 = atomic_load((unint64_t *)&self->_operationId);
      int64_t v9 = atomic_load((unint64_t *)v4 + 1);
      if (v8 > v9) {
        int64_t v7 = -1;
      }
      else {
        int64_t v7 = 1;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (id)layerBlock
{
  return self->_layerBlock;
}

- (void)setLayerBlock:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (BCUPurgeableImage)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)waitForCPUSynchronization
{
  return self->_waitForCPUSynchronization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_layerBlock, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end