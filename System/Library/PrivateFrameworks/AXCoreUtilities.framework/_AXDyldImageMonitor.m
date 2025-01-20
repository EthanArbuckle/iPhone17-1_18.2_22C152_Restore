@interface _AXDyldImageMonitor
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (_AXDyldImageMonitor)init;
- (id)loadedImagePaths;
- (void)_dyldDidAddImage:(id)a3;
- (void)addImageMonitorObserver:(id)a3;
- (void)enumerateLoadedImagePaths:(id)a3;
- (void)removeImageMonitorObserver:(id)a3;
@end

@implementation _AXDyldImageMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)_Shared;
  return v2;
}

- (_AXDyldImageMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_AXDyldImageMonitor;
  v2 = [(_AXDyldImageMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("_AXDyldImageMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_dyldDidAddImage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_imageMonitorObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "imageMonitor:didAddImage:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enumerateLoadedImagePaths:(id)a3
{
  long long v10 = (void (**)(id, void *))a3;
  uint32_t v3 = _dyld_image_count();
  if (v3)
  {
    uint32_t v4 = v3;
    for (uint32_t i = 0; i != v4; ++i)
    {
      image_name = _dyld_get_image_name(i);
      if (image_name)
      {
        uint64_t v7 = image_name;
        id v8 = [NSString alloc];
        uint64_t v9 = objc_msgSend(v8, "initWithCString:encoding:", v7, objc_msgSend(NSString, "defaultCStringEncoding"));
        v10[2](v10, v9);
      }
    }
  }
}

- (id)loadedImagePaths
{
  uint32_t v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:_dyld_image_count()];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39___AXDyldImageMonitor_loadedImagePaths__block_invoke;
  v6[3] = &unk_1E5673070;
  id v4 = v3;
  id v7 = v4;
  [(_AXDyldImageMonitor *)self enumerateLoadedImagePaths:v6];

  return v4;
}

- (void)addImageMonitorObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___AXDyldImageMonitor_addImageMonitorObserver___block_invoke;
  v7[3] = &unk_1E5672FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeImageMonitorObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___AXDyldImageMonitor_removeImageMonitorObserver___block_invoke;
  v7[3] = &unk_1E5672FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageMonitorObservers, 0);
}

@end