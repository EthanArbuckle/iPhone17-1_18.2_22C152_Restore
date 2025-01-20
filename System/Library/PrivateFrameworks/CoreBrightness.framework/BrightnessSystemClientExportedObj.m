@interface BrightnessSystemClientExportedObj
- (BrightnessSystemClientInternal)target;
- (void)dealloc;
- (void)notifyChangedProperty:(id)a3 value:(id)a4;
- (void)registerNotificationBlock:(id)a3;
- (void)setTarget:(id)a3;
- (void)unregisterNotificationBlock;
@end

@implementation BrightnessSystemClientExportedObj

- (void)setTarget:(id)a3
{
  self->_target = (BrightnessSystemClientInternal *)a3;
}

- (void)registerNotificationBlock:(id)a3
{
  if (a3) {
    self->clientBlock = _Block_copy(a3);
  }
  objc_sync_exit(self);
}

- (void)unregisterNotificationBlock
{
  if (self->clientBlock)
  {
    _Block_release(self->clientBlock);
    self->clientBlock = 0;
  }
  objc_sync_exit(self);
}

void __65__BrightnessSystemClientExportedObj_notifyChangedProperty_value___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  }
  objc_sync_exit(obj);
}

- (void)notifyChangedProperty:(id)a3 value:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21 = self;
  SEL v20 = a2;
  id v19 = a3;
  id v18 = a4;
  os_log_t oslog = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    inited = init_default_corebrightness_log();
  }
  os_log_t oslog = inited;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_64_8_64_8_0_8_0((uint64_t)v22, (uint64_t)v19, (uint64_t)v18, (uint64_t)v21->queue, (uint64_t)v21->clientBlock);
    _os_log_debug_impl(&dword_1BA438000, oslog, type, "key=%@ property=%@ queue=%p clientBlock=%p", v22, 0x2Au);
  }
  if (!v21->queue) {
    v21->queue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
  }
  if (v21->clientBlock)
  {
    if (v21->queue)
    {
      id v4 = v19;
      id v5 = v18;
      queue = v21->queue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v9 = -1073741824;
      int v10 = 0;
      v11 = __65__BrightnessSystemClientExportedObj_notifyChangedProperty_value___block_invoke;
      v12 = &unk_1E62192B0;
      v13 = v21;
      id v14 = v19;
      id v15 = v18;
      dispatch_async(queue, &block);
    }
  }
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  objc_sync_enter(self);
  if (v5->clientBlock) {
    _Block_release(v5->clientBlock);
  }
  if (v5->queue) {
    dispatch_release((dispatch_object_t)v5->queue);
  }
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)BrightnessSystemClientExportedObj;
  [(BrightnessSystemClientExportedObj *)&v3 dealloc];
}

- (BrightnessSystemClientInternal)target
{
  return self->_target;
}

@end