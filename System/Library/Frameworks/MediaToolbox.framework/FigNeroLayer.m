@interface FigNeroLayer
- (FigNeroLayer)init;
- (FigNeroLayerDelegate)neroDelegate;
- (void)_dispatchNotification:(id)a3 value:(id)a4;
- (void)_start;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setNeroDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation FigNeroLayer

- (FigNeroLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigNeroLayer;
  v2 = [(FigNeroLayer *)&v4 init];
  if (v2) {
    v2->_neroQueue = (OS_dispatch_queue *)dispatch_queue_create("FigNeroLayer", 0);
  }
  return v2;
}

- (void)dealloc
{
  [(FigNeroLayer *)self stop];
  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    dispatch_release(neroQueue);
    self->_neroQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigNeroLayer;
  [(FigNeroLayer *)&v4 dealloc];
}

- (FigNeroLayerDelegate)neroDelegate
{
  return self->_neroDelegate;
}

- (void)setNeroDelegate:(id)a3
{
  self->_neroDelegate = (FigNeroLayerDelegate *)a3;
}

- (void)start
{
  neroQueue = self->_neroQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__FigNeroLayer_start__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = self;
  dispatch_sync(neroQueue, block);
}

uint64_t __21__FigNeroLayer_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)_start
{
  p_neroid = &self->_neroid;
  if (!self->_neroid && !FigNeroidCreateRemote(*MEMORY[0x1E4F1CF80], (CFTypeRef *)p_neroid))
  {
    FigBytePumpGetFigBaseObject(*p_neroid);
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    v8 = *(void (**)(uint64_t, uint64_t, FigNeroLayer *))(v7 + 56);
    if (v8) {
      v8(v5, 0x1EE565FB8, self);
    }
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    v9 = *p_neroid;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = *(void (**)(OpaqueFigNeroid *))(v11 + 8);
    if (v12)
    {
      v12(v9);
    }
  }
}

- (void)stop
{
  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__FigNeroLayer_stop__block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(neroQueue, block);
  }
}

void __20__FigNeroLayer_stop__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    FigBytePumpGetFigBaseObject(*(void *)(*(void *)(a1 + 32) + 40));
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v4) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = 0;
      }
      uint64_t v6 = *(void (**)(uint64_t))(v5 + 24);
      if (v6) {
        v6(v3);
      }
    }
    uint64_t v7 = *(const void **)(*(void *)(a1 + 32) + 40);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(*(void *)(a1 + 32) + 40) = 0;
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigNeroLayer;
  -[FigNeroLayer setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__FigNeroLayer_setBounds___block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_sync(neroQueue, block);
  }
}

void __26__FigNeroLayer_setBounds___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[5])
  {
    [v2 bounds];
    v12.width = v3;
    v12.height = v4;
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
    FigBytePumpGetFigBaseObject(*(void *)(*(void *)(a1 + 32) + 40));
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, CFDictionaryRef))(v9 + 56);
    if (v10) {
      v10(v7, 0x1EE550F18, DictionaryRepresentation);
    }
    if (DictionaryRepresentation)
    {
      CFRelease(DictionaryRepresentation);
    }
  }
}

- (void)_dispatchNotification:(id)a3 value:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1EE566038, a4))
  {
    if (objc_opt_respondsToSelector())
    {
      neroDelegate = self->_neroDelegate;
      [(FigNeroLayerDelegate *)neroDelegate neroLayerDidConnect:self];
    }
  }
  else if (([a3 isEqualToString:0x1EE566058] & 1) != 0 {
         || [a3 isEqualToString:0x1EE568158])
  }
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = self->_neroDelegate;
      [(FigNeroLayerDelegate *)v7 neroLayerDidDisconnect:self];
    }
  }
  else if ([a3 isEqualToString:0x1EE566018] {
         && (objc_opt_respondsToSelector() & 1) != 0)
  }
  {
    uint64_t v8 = self->_neroDelegate;
    [(FigNeroLayerDelegate *)v8 neroLayerDidReceiveFirstFrame:self];
  }
}

@end