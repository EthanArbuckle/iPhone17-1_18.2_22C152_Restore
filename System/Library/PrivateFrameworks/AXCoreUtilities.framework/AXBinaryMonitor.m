@interface AXBinaryMonitor
+ (id)sharedInstance;
+ (void)initialize;
- (AXBinaryMonitor)init;
- (BOOL)_loadImageIsApp:(id)a3;
- (BOOL)_loadImageIsAppExtension:(id)a3;
- (BOOL)_loadImageIsBundle:(id)a3;
- (BOOL)_loadImageIsDylib:(id)a3;
- (BOOL)_loadImageIsFramework:(id)a3;
- (NSMutableDictionary)appExtensionHandlerMap;
- (NSMutableDictionary)appHandlerMap;
- (NSMutableDictionary)bundleHandlerMap;
- (NSMutableDictionary)dylibHandlerMap;
- (NSMutableDictionary)frameworkHandlerMap;
- (OS_dispatch_queue)binaryMonitorQueue;
- (id)_appExtensionNameForImage:(id)a3;
- (id)_appNameForImage:(id)a3;
- (id)_bundleNameAndType:(id)a3;
- (id)_bundleNameForImage:(id)a3;
- (id)_dylibNameForImage:(id)a3;
- (id)_frameworkNameForImage:(id)a3;
- (void)_addHandler:(id)a3 withName:(id)a4 toMap:(id *)a5;
- (void)_applyHandlerBlocks:(id)a3 handlerMap:(id)a4;
- (void)_handleLoadedImagePath:(id)a3;
- (void)addHandler:(id)a3 forApp:(id)a4;
- (void)addHandler:(id)a3 forAppExtension:(id)a4;
- (void)addHandler:(id)a3 forBundleID:(id)a4;
- (void)addHandler:(id)a3 forBundleName:(id)a4;
- (void)addHandler:(id)a3 forDylib:(id)a4;
- (void)addHandler:(id)a3 forFramework:(id)a4;
- (void)evaluateExistingBinaries;
- (void)setAppExtensionHandlerMap:(id)a3;
- (void)setAppHandlerMap:(id)a3;
- (void)setBinaryMonitorQueue:(id)a3;
- (void)setBundleHandlerMap:(id)a3;
- (void)setDylibHandlerMap:(id)a3;
- (void)setFrameworkHandlerMap:(id)a3;
@end

@implementation AXBinaryMonitor

+ (void)initialize
{
  id v2 = +[AXBinaryMonitor sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  }
  id v2 = (void *)sharedInstance__shared;
  return v2;
}

uint64_t __33__AXBinaryMonitor_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_alloc_init(AXBinaryMonitor);
  return MEMORY[0x1F41817F8]();
}

- (AXBinaryMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)AXBinaryMonitor;
  id v2 = [(AXBinaryMonitor *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXBinaryMonitor *)v2 setBundleHandlerMap:v3];

    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXBinaryMonitor *)v2 setFrameworkHandlerMap:v4];

    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXBinaryMonitor *)v2 setDylibHandlerMap:v5];

    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXBinaryMonitor *)v2 setAppHandlerMap:v6];

    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXBinaryMonitor *)v2 setAppExtensionHandlerMap:v7];

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("AXBinaryMonitorQueue", v9);
    [(AXBinaryMonitor *)v2 setBinaryMonitorQueue:v10];

    AXPerformBlockAsynchronouslyOnMainThread(&__block_literal_global_4);
    v11 = v2;
  }
  return v2;
}

void __23__AXBinaryMonitor_init__block_invoke()
{
}

- (void)evaluateExistingBinaries
{
  id v2 = [(AXBinaryMonitor *)self binaryMonitorQueue];
  dispatch_async(v2, &__block_literal_global_6);
}

void __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = [MEMORY[0x1E4F28B50] allFrameworks];
  id v2 = [MEMORY[0x1E4F28B50] allBundles];
  v3 = [v1 arrayByAddingObjectsFromArray:v2];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 safeStringForKey:@"_resolvedPath"];
        if (!v9)
        {
          v9 = [v8 bundlePath];
        }
        [v0 axSafelyAddObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_2;
  block[3] = &unk_1E5672590;
  id v12 = v0;
  id v10 = v0;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_12_0];
}

void __43__AXBinaryMonitor_evaluateExistingBinaries__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AXBinaryMonitor sharedInstance];
  [v3 _handleLoadedImagePath:v2];
}

- (void)addHandler:(id)a3 forBundleID:(id)a4
{
}

- (void)addHandler:(id)a3 forBundleName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v6 pathExtension];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@.bundle", v6];

    id v6 = (id)v9;
  }
  [(AXBinaryMonitor *)self _addHandler:v10 withName:v6 toMap:&self->_bundleHandlerMap];
}

- (void)addHandler:(id)a3 forFramework:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 hasSuffix:@".bundle"] & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.framework", v6];

    id v6 = (id)v7;
  }
  [(AXBinaryMonitor *)self _addHandler:v8 withName:v6 toMap:&self->_frameworkHandlerMap];
}

- (void)addHandler:(id)a3 forDylib:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 hasSuffix:@".dylib"] & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.dylib", v6];

    id v6 = (id)v7;
  }
  [(AXBinaryMonitor *)self _addHandler:v8 withName:v6 toMap:&self->_dylibHandlerMap];
}

- (void)addHandler:(id)a3 forAppExtension:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 hasSuffix:@".appex"] & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.appex", v6];

    id v6 = (id)v7;
  }
  [(AXBinaryMonitor *)self _addHandler:v8 withName:v6 toMap:&self->_appExtensionHandlerMap];
}

- (void)addHandler:(id)a3 forApp:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (([v6 hasSuffix:@".app"] & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@.app", v6];

    id v6 = (id)v7;
  }
  [(AXBinaryMonitor *)self _addHandler:v8 withName:v6 toMap:&self->_appHandlerMap];
}

- (void)_addHandler:(id)a3 withName:(id)a4 toMap:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)[a3 copy];
  id v10 = *a5;
  v11 = v10;
  if (!a3)
  {
    long long v14 = @"not adding handler, block was null";
LABEL_6:
    _AXLogWithFacility(0, 0, 1, 0, 0, 0, 0, 0.0, 0, 1, v14);
    goto LABEL_7;
  }
  if (!v8)
  {
    long long v14 = @"not adding handler, binary name was nil";
    goto LABEL_6;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke;
  v18[3] = &unk_1E5673358;
  id v19 = v10;
  id v12 = v8;
  id v20 = v12;
  id v21 = v9;
  AXPerformBlockSynchronouslyOnMainThread(v18);
  long long v13 = [(AXBinaryMonitor *)self binaryMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_2;
  block[3] = &unk_1E5672FB8;
  id v16 = v12;
  v17 = self;
  dispatch_async(v13, block);

LABEL_7:
}

void __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  id v4 = (id)[v2 mutableCopy];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
  }
  id v3 = _Block_copy(*(const void **)(a1 + 48));
  [v4 addObject:v3];

  [*(id *)(a1 + 32) setObject:v4 forKey:*(void *)(a1 + 40)];
}

void __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_2(uint64_t a1)
{
  uint32_t v2 = _dyld_image_count();
  if (v2)
  {
    uint32_t v3 = v2;
    uint32_t v4 = 0;
    uint64_t v5 = MEMORY[0x1E4F14428];
    do
    {
      image_name = _dyld_get_image_name(v4);
      if (image_name)
      {
        uint64_t v7 = [NSString stringWithUTF8String:image_name];
        id v8 = v7;
        if (v7)
        {
          if ([v7 rangeOfString:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v9[0] = MEMORY[0x1E4F143A8];
            v9[1] = 3221225472;
            v9[2] = __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_3;
            v9[3] = &unk_1E5672FB8;
            v9[4] = *(void *)(a1 + 40);
            id v10 = v8;
            dispatch_async(v5, v9);
          }
        }
      }
      ++v4;
    }
    while (v3 != v4);
  }
}

uint64_t __46__AXBinaryMonitor__addHandler_withName_toMap___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLoadedImagePath:*(void *)(a1 + 40)];
}

- (id)_bundleNameAndType:(id)a3
{
  uint32_t v3 = [a3 stringByDeletingLastPathComponent];
  uint32_t v4 = [v3 lastPathComponent];

  return v4;
}

- (BOOL)_loadImageIsFramework:(id)a3
{
  uint32_t v3 = [(AXBinaryMonitor *)self _bundleNameAndType:a3];
  char v4 = [v3 hasSuffix:@".framework"];

  return v4;
}

- (BOOL)_loadImageIsBundle:(id)a3
{
  uint32_t v3 = [(AXBinaryMonitor *)self _bundleNameAndType:a3];
  if ([v3 hasSuffix:@"bundle"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasSuffix:@"Bundle"];
  }

  return v4;
}

- (BOOL)_loadImageIsDylib:(id)a3
{
  uint32_t v3 = [(AXBinaryMonitor *)self _bundleNameAndType:a3];
  char v4 = [v3 hasSuffix:@".dylib"];

  return v4;
}

- (BOOL)_loadImageIsApp:(id)a3
{
  uint32_t v3 = [(AXBinaryMonitor *)self _bundleNameAndType:a3];
  char v4 = [v3 hasSuffix:@".app"];

  return v4;
}

- (BOOL)_loadImageIsAppExtension:(id)a3
{
  uint32_t v3 = [(AXBinaryMonitor *)self _bundleNameAndType:a3];
  char v4 = [v3 hasSuffix:@".appex"];

  return v4;
}

- (id)_frameworkNameForImage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint32_t v3 = objc_msgSend(a3, "pathComponents", 0);
  char v4 = [v3 reverseObjectEnumerator];
  uint64_t v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 hasSuffix:@"framework"])
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)_bundleNameForImage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint32_t v3 = objc_msgSend(a3, "pathComponents", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 lowercaseString];
        char v10 = [v9 hasSuffix:@"bundle"];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)_appExtensionNameForImage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint32_t v3 = objc_msgSend(a3, "pathComponents", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasSuffix:@"appex"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)_appNameForImage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint32_t v3 = objc_msgSend(a3, "pathComponents", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasSuffix:@"app"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)_dylibNameForImage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint32_t v3 = objc_msgSend(a3, "pathComponents", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasSuffix:@"dylib"])
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)_applyHandlerBlocks:(id)a3 handlerMap:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(v6, "objectForKey:", v5, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v6 removeObjectForKey:v5];
}

- (void)_handleLoadedImagePath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if ([(AXBinaryMonitor *)self _loadImageIsFramework:v4])
    {
      id v5 = [(AXBinaryMonitor *)self _frameworkNameForImage:v8];
      uint64_t v6 = [(AXBinaryMonitor *)self frameworkHandlerMap];
    }
    else if ([(AXBinaryMonitor *)self _loadImageIsBundle:v8])
    {
      id v5 = [(AXBinaryMonitor *)self _bundleNameForImage:v8];
      uint64_t v6 = [(AXBinaryMonitor *)self bundleHandlerMap];
    }
    else if ([(AXBinaryMonitor *)self _loadImageIsDylib:v8])
    {
      id v5 = [(AXBinaryMonitor *)self _dylibNameForImage:v8];
      uint64_t v6 = [(AXBinaryMonitor *)self dylibHandlerMap];
    }
    else if ([(AXBinaryMonitor *)self _loadImageIsAppExtension:v8])
    {
      id v5 = [(AXBinaryMonitor *)self _appExtensionNameForImage:v8];
      uint64_t v6 = [(AXBinaryMonitor *)self appExtensionHandlerMap];
    }
    else
    {
      if (![(AXBinaryMonitor *)self _loadImageIsApp:v8]) {
        goto LABEL_13;
      }
      id v5 = [(AXBinaryMonitor *)self _appNameForImage:v8];
      uint64_t v6 = [(AXBinaryMonitor *)self appHandlerMap];
    }
    uint64_t v7 = (void *)v6;
    [(AXBinaryMonitor *)self _applyHandlerBlocks:v5 handlerMap:v6];
  }
LABEL_13:
  MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)bundleHandlerMap
{
  return self->_bundleHandlerMap;
}

- (void)setBundleHandlerMap:(id)a3
{
}

- (NSMutableDictionary)frameworkHandlerMap
{
  return self->_frameworkHandlerMap;
}

- (void)setFrameworkHandlerMap:(id)a3
{
}

- (NSMutableDictionary)dylibHandlerMap
{
  return self->_dylibHandlerMap;
}

- (void)setDylibHandlerMap:(id)a3
{
}

- (NSMutableDictionary)appHandlerMap
{
  return self->_appHandlerMap;
}

- (void)setAppHandlerMap:(id)a3
{
}

- (NSMutableDictionary)appExtensionHandlerMap
{
  return self->_appExtensionHandlerMap;
}

- (void)setAppExtensionHandlerMap:(id)a3
{
}

- (OS_dispatch_queue)binaryMonitorQueue
{
  return self->_binaryMonitorQueue;
}

- (void)setBinaryMonitorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryMonitorQueue, 0);
  objc_storeStrong((id *)&self->_appExtensionHandlerMap, 0);
  objc_storeStrong((id *)&self->_appHandlerMap, 0);
  objc_storeStrong((id *)&self->_dylibHandlerMap, 0);
  objc_storeStrong((id *)&self->_frameworkHandlerMap, 0);
  objc_storeStrong((id *)&self->_bundleHandlerMap, 0);
}

@end