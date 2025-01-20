@interface PKRendererVSyncController
+ (id)sharedController;
- (BOOL)isActive;
- (PKRendererVSyncController)init;
- (void)addRendererController:(uint64_t)a1;
- (void)removeRendererController:(uint64_t)a1;
@end

@implementation PKRendererVSyncController

- (PKRendererVSyncController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKRendererVSyncController;
  v2 = [(PKRendererVSyncController *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.pencilkit.vsync", v3);
    vSyncQueue = v2->_vSyncQueue;
    v2->_vSyncQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.pencilkit.vsync-runloop", v3);
    runloopQueue = v2->_runloopQueue;
    v2->_runloopQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    rendererControllers = v2->_rendererControllers;
    v2->_rendererControllers = (NSHashTable *)v8;

    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    v10 = v2->_runloopQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PKRendererVSyncController_init__block_invoke;
    block[3] = &unk_1E64C5368;
    v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

void __33__PKRendererVSyncController_init__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)(v1 + 32);
    if (!*(void *)(v1 + 32))
    {
      v3 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v9 = @"primary";
        _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Opening mobile framebuffer by name: %@", buf, 0xCu);
      }

      IOMobileFramebufferOpenByName();
      if (*v2)
      {
        RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
        if (RunLoopSource)
        {
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
          IOMobileFramebufferSupportedFrameInfo();
          IOMobileFramebufferChangeFrameInfo();
          IOMobileFramebufferFrameInfo();
        }
        else
        {
          v7 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_ERROR, "Unable to get runloop source for primary mobile framebuffer", buf, 2u);
          }

          void *v2 = 0;
        }
      }
      else
      {
        dispatch_queue_t v6 = os_log_create("com.apple.pencilkit", "Sketching");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_ERROR, "Unable to open primary mobile framebuffer", buf, 2u);
        }
      }
    }
  }

  CFRunLoopRun();
}

+ (id)sharedController
{
  self;
  if (qword_1EB3C5F08 != -1) {
    dispatch_once(&qword_1EB3C5F08, &__block_literal_global_26);
  }
  v0 = (void *)_MergedGlobals_126;

  return v0;
}

void __45__PKRendererVSyncController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PKRendererVSyncController);
  uint64_t v1 = (void *)_MergedGlobals_126;
  _MergedGlobals_126 = (uint64_t)v0;
}

- (BOOL)isActive
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  dispatch_queue_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PKRendererVSyncController_isActive__block_invoke;
  v4[3] = &unk_1E64C5848;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__PKRendererVSyncController_isActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32) != 0;
  return result;
}

- (void)addRendererController:(uint64_t)a1
{
  id v3 = a2;
  dispatch_queue_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PKRendererVSyncController_addRendererController___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __51__PKRendererVSyncController_addRendererController___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)removeRendererController:(uint64_t)a1
{
  id v3 = a2;
  dispatch_queue_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__PKRendererVSyncController_removeRendererController___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __54__PKRendererVSyncController_removeRendererController___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void __67__PKRendererVSyncController_signalVSyncSemaphore_presentationTime___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "signalVSyncSemaphore:presentationTime:", *(void *)(a1 + 48), *(double *)(a1 + 40), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererControllers, 0);
  objc_storeStrong((id *)&self->_runloopQueue, 0);

  objc_storeStrong((id *)&self->_vSyncQueue, 0);
}

@end