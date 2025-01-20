@interface AVExternalProtectionMonitor
- (AVExternalProtectionMonitor)init;
- (int64_t)externalProtectionState;
- (void)dealloc;
@end

@implementation AVExternalProtectionMonitor

- (AVExternalProtectionMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)AVExternalProtectionMonitor;
  v2 = [(AVExternalProtectionMonitor *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVExternalProtectionMonitorInternal);
    v2->_monitor = v3;
    if (v3)
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      int v12 = 0;
      v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_monitor->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avepm", v4);
      queue = v2->_monitor->_queue;
      if (queue)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __35__AVExternalProtectionMonitor_init__block_invoke;
        v8[3] = &unk_1E57B2110;
        v8[4] = v2;
        v8[5] = &v9;
        dispatch_sync(queue, v8);
        v6 = v10;
        if (!*((_DWORD *)v10 + 6))
        {
          v2->_monitor->_publicMonitor = v2;
          if (!*((_DWORD *)v6 + 6)) {
            goto LABEL_7;
          }
        }
      }
      else
      {
        *((_DWORD *)v10 + 6) = -108;
      }

      v2 = 0;
LABEL_7:
      _Block_object_dispose(&v9, 8);
    }
  }
  return v2;
}

uint64_t __35__AVExternalProtectionMonitor_init__block_invoke(uint64_t a1)
{
  uint64_t result = setup(*(void *)(*(void *)(a1 + 32) + 8));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  monitor = self->_monitor;
  if (monitor)
  {
    queue = monitor->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__AVExternalProtectionMonitor_dealloc__block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = self;
      dispatch_sync(queue, block);
      dispatch_release((dispatch_object_t)self->_monitor->_queue);
      monitor = self->_monitor;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVExternalProtectionMonitor;
  [(AVExternalProtectionMonitor *)&v5 dealloc];
}

void __38__AVExternalProtectionMonitor_dealloc__block_invoke(uint64_t a1)
{
}

- (int64_t)externalProtectionState
{
  int v7 = 0;
  protector = self->_monitor->_protector;
  if (protector
    && ((v3 = *(void **)(CMBaseObjectGetVTable() + 16)) == 0 ? (v4 = 0) : (v4 = v3),
        *v4 && (objc_super v5 = (unsigned int (*)(OpaqueFigCPEProtector *, int *))v4[10]) != 0 && !v5(protector, &v7)))
  {
    return v7;
  }
  else
  {
    return 0;
  }
}

@end