@interface ARBufferPopulationMonitor
- (ARBufferPopulationMonitor)init;
- (ARBufferPopulationMonitor)initWithDelegate:(id)a3;
- (ARBufferPopulationMonitorDelegate)delegate;
- (id)description;
- (unint64_t)count;
- (unint64_t)countWithLabel:(id)a3;
- (void)dealloc;
- (void)emitEndSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6;
- (void)emitStartSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6;
- (void)setDelegate:(id)a3;
- (void)trackDataBuffer:(__CVBuffer *)a3;
- (void)trackDataBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6;
- (void)trackPixelBuffer:(__CVBuffer *)a3;
- (void)trackPixelBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6;
- (void)trackSurface:(__IOSurface *)a3;
- (void)trackSurface:(__IOSurface *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6;
- (void)updateBufferPopulationRegistryWithReleasedSurfaceID:(unsigned int)a3;
@end

@implementation ARBufferPopulationMonitor

- (ARBufferPopulationMonitor)init
{
  return [(ARBufferPopulationMonitor *)self initWithDelegate:0];
}

- (ARBufferPopulationMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.bufferPopulationMonitor"])
  {
    v15.receiver = self;
    v15.super_class = (Class)ARBufferPopulationMonitor;
    v5 = [(ARBufferPopulationMonitor *)&v15 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_delegate, v4);
      uint64_t v7 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.bufferPopulationMonitor.delegateQueue");
      delegateQueue = v6->_delegateQueue;
      v6->_delegateQueue = (OS_dispatch_queue *)v7;

      v6->_weakReferenceForSurfaceNotifierCallback = +[ARWeakReference weakReferenceWithObject:v6];
      v6->_bufferPopulationRegistryLock._os_unfair_lock_opaque = 0;
      uint64_t v9 = objc_opt_new();
      bufferPopulationRegistry = v6->_bufferPopulationRegistry;
      v6->_bufferPopulationRegistry = (ARBufferPopulationRegistry *)v9;

      v6->_surfaceNotifier = (__IOSurfaceNotifier *)IOSurfaceNotifierCreate();
      uint64_t v11 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.bufferPopulationMonitor.surfaceNotifierCallbackQueue");
      surfaceNotifierCallbackQueue = v6->_surfaceNotifierCallbackQueue;
      v6->_surfaceNotifierCallbackQueue = (OS_dispatch_queue *)v11;

      IOSurfaceNotifierSetDispatchQueue();
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_surfaceNotifier)
  {
    IOSurfaceNotifierSetDispatchQueue();
    CFRelease(self->_surfaceNotifier);
  }
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__5;
  weakReferenceForSurfaceNotifierCallback = self->_weakReferenceForSurfaceNotifierCallback;
  v7[4] = __Block_byref_object_dispose__5;
  id v8 = weakReferenceForSurfaceNotifierCallback;
  if (weakReferenceForSurfaceNotifierCallback)
  {
    surfaceNotifierCallbackQueue = self->_surfaceNotifierCallbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__ARBufferPopulationMonitor_dealloc__block_invoke;
    block[3] = &unk_1E6185480;
    block[4] = v7;
    dispatch_async(surfaceNotifierCallbackQueue, block);
  }
  _Block_object_dispose(v7, 8);

  v5.receiver = self;
  v5.super_class = (Class)ARBufferPopulationMonitor;
  [(ARBufferPopulationMonitor *)&v5 dealloc];
}

void __36__ARBufferPopulationMonitor_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (unint64_t)count
{
  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  unint64_t v4 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry count];
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);
  return v4;
}

- (unint64_t)countWithLabel:(id)a3
{
  id v4 = a3;
  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  unint64_t v6 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry countWithLabel:v4];
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);

  return v6;
}

- (id)description
{
  p_bufferPopulationRegistryLock = &self->_bufferPopulationRegistryLock;
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  id v4 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry description];
  os_unfair_lock_unlock(p_bufferPopulationRegistryLock);
  return v4;
}

- (void)trackDataBuffer:(__CVBuffer *)a3
{
}

- (void)trackDataBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  [(ARBufferPopulationMonitor *)self trackSurface:CVDataBufferGetIOSurface() withLabel:v9 timestamp:v6 signpostType:a5];
}

- (void)trackPixelBuffer:(__CVBuffer *)a3
{
}

- (void)trackPixelBuffer:(__CVBuffer *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  [(ARBufferPopulationMonitor *)self trackSurface:CVPixelBufferGetIOSurface(a3) withLabel:v10 timestamp:v6 signpostType:a5];
}

- (void)trackSurface:(__IOSurface *)a3
{
}

- (void)emitStartSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6
{
  if (a3 <= 4) {
    kdebug_trace();
  }
}

- (void)emitEndSignpost:(int)a3 surfaceID:(unint64_t)a4 count:(unint64_t)a5 timestamp:(double)a6
{
  if (a3 <= 4) {
    kdebug_trace();
  }
}

- (void)trackSurface:(__IOSurface *)a3 withLabel:(id)a4 timestamp:(double)a5 signpostType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a4;
  uint64_t ID = IOSurfaceGetID(a3);
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  bufferPopulationRegistry = self->_bufferPopulationRegistry;
  v13 = [NSNumber numberWithUnsignedInt:ID];
  v14 = [NSNumber numberWithUnsignedInt:v6];
  [(ARBufferPopulationRegistry *)bufferPopulationRegistry registerBufferWithSurfaceID:v13 label:v10 signpostType:v14 timestamp:a5];

  objc_super v15 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry surfaceIDsForBuffersWithLabel:v10];
  uint64_t v16 = [v15 count];

  [(ARBufferPopulationMonitor *)self emitStartSignpost:v6 surfaceID:ID count:v16 timestamp:a5];
  os_unfair_lock_unlock(&self->_bufferPopulationRegistryLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ARBufferPopulationMonitor_trackSurface_withLabel_timestamp_signpostType___block_invoke;
  block[3] = &unk_1E61871C0;
  id v20 = v10;
  uint64_t v21 = v16;
  block[4] = self;
  id v18 = v10;
  dispatch_async(delegateQueue, block);
}

void __75__ARBufferPopulationMonitor_trackSurface_withLabel_timestamp_signpostType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 bufferPopulationMonitor:*(void *)(a1 + 32) didIncrementCount:*(void *)(a1 + 48) withLabel:*(void *)(a1 + 40)];
}

- (void)updateBufferPopulationRegistryWithReleasedSurfaceID:(unsigned int)a3
{
  objc_super v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  os_unfair_lock_lock(&self->_bufferPopulationRegistryLock);
  uint64_t v6 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry labelForBufferWithSurfaceID:v5];
  uint64_t v7 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry signpostTypeForLabel:v6];
  [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry timestampForSurfaceID:v5];
  double v9 = v8;
  [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry unregisterBufferWithSurfaceID:v5];
  unint64_t v10 = [(ARBufferPopulationRegistry *)self->_bufferPopulationRegistry countWithLabel:v6];
  [(ARBufferPopulationMonitor *)self emitEndSignpost:v7 surfaceID:a3 count:v10 timestamp:v9];
  os_unfair_lock_unlock(&self->_bufferPopulationRegistryLock);
  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__ARBufferPopulationMonitor_updateBufferPopulationRegistryWithReleasedSurfaceID___block_invoke;
    block[3] = &unk_1E61871C0;
    block[4] = self;
    unint64_t v14 = v10;
    id v13 = v6;
    dispatch_async(delegateQueue, block);
  }
}

void __81__ARBufferPopulationMonitor_updateBufferPopulationRegistryWithReleasedSurfaceID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 bufferPopulationMonitor:*(void *)(a1 + 32) didDecrementCount:*(void *)(a1 + 48) withLabel:*(void *)(a1 + 40)];
}

- (ARBufferPopulationMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARBufferPopulationMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_surfaceNotifierCallbackQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_bufferPopulationRegistry, 0);
}

@end