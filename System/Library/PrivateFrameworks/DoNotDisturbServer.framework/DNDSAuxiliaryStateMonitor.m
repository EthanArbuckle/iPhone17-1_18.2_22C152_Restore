@interface DNDSAuxiliaryStateMonitor
- (BOOL)isPresentationModeEnabled;
- (BOOL)isScreenMirrored;
- (BOOL)isScreenShared;
- (DNDSAuxiliaryStateMonitor)init;
- (void)dealloc;
- (void)setScreenMirrored:(BOOL)a3;
- (void)setScreenShared:(BOOL)a3;
@end

@implementation DNDSAuxiliaryStateMonitor

- (DNDSAuxiliaryStateMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)DNDSAuxiliaryStateMonitor;
  v2 = [(DNDSAuxiliaryStateMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.donotdisturb.DNDSAuxiliaryStateMonitor.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    *(_WORD *)&v2->_presentationModeEnabled = 0;
    v2->_screenMirrored = 0;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DNDSAuxiliaryStateMonitor;
  [(DNDSAuxiliaryStateMonitor *)&v2 dealloc];
}

- (BOOL)isPresentationModeEnabled
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__DNDSAuxiliaryStateMonitor_isPresentationModeEnabled__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__DNDSAuxiliaryStateMonitor_isPresentationModeEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)isScreenShared
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__DNDSAuxiliaryStateMonitor_isScreenShared__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__DNDSAuxiliaryStateMonitor_isScreenShared__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (void)setScreenShared:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__DNDSAuxiliaryStateMonitor_setScreenShared___block_invoke;
  v4[3] = &unk_1E6974968;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __45__DNDSAuxiliaryStateMonitor_setScreenShared___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 17) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isScreenMirrored
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__DNDSAuxiliaryStateMonitor_isScreenMirrored__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__DNDSAuxiliaryStateMonitor_isScreenMirrored__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

- (void)setScreenMirrored:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__DNDSAuxiliaryStateMonitor_setScreenMirrored___block_invoke;
  v4[3] = &unk_1E6974968;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __47__DNDSAuxiliaryStateMonitor_setScreenMirrored___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 18) = *(unsigned char *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
}

@end