@interface AVCaptureDeviceControlRequestQueue
- (AVCaptureDeviceControlRequestQueue)init;
- (id)dequeue;
- (id)head;
- (void)dealloc;
- (void)enqueueRequest:(id)a3;
@end

@implementation AVCaptureDeviceControlRequestQueue

- (AVCaptureDeviceControlRequestQueue)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceControlRequestQueue;
  v2 = [(AVCaptureDeviceControlRequestQueue *)&v4 init];
  if (v2)
  {
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.capturedevice.controlrequestqueue", 0);
    v2->_mutableArray = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
  }
  return v2;
}

id __42__AVCaptureDeviceControlRequestQueue_head__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

uint64_t __53__AVCaptureDeviceControlRequestQueue_enqueueRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)enqueueRequest:(id)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureDeviceControlRequestQueue_enqueueRequest___block_invoke;
  v4[3] = &unk_1E5A72D70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (id)head
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVCaptureDeviceControlRequestQueue_head__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)dequeue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  uint64_t v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureDeviceControlRequestQueue_dequeue__block_invoke;
  v5[3] = &unk_1E5A74078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureDeviceControlRequestQueue_dequeue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v3 removeObject:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceControlRequestQueue;
  [(AVCaptureDeviceControlRequestQueue *)&v3 dealloc];
}

@end