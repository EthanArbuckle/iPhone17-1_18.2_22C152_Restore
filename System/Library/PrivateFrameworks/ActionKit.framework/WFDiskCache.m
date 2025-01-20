@interface WFDiskCache
+ (id)workflowCache;
- (NSMutableDictionary)overridingClassMap;
- (NSURL)cacheURL;
- (OS_dispatch_queue)queue;
- (WFDiskCache)init;
- (WFDiskCache)initWithApplicationGroupIdentifier:(id)a3 name:(id)a4;
- (WFDiskCache)initWithCacheDirectory:(id)a3 name:(id)a4;
- (WFDiskCache)initWithCacheURL:(id)a3 name:(id)a4;
- (WFDiskCache)initWithName:(id)a3;
- (id)actuallyGetObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)fileURLForKey:(id)a3;
- (id)objectOfClasses:(id)a3 forKey:(id)a4;
- (id)objectOfClasses:(id)a3 forKeyComponents:(id)a4;
- (void)actuallyRemoveObjectForKey:(id)a3;
- (void)actuallySetObject:(id)a3 forKey:(id)a4;
- (void)objectOfClasses:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3 completion:(id)a4;
- (void)removeObjectForKeyComponents:(id)a3;
- (void)setClass:(Class)a3 forCachedClassName:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setObject:(id)a3 forKeyComponents:(id)a4;
- (void)setOverridingClassMap:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation WFDiskCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingClassMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

- (void)setOverridingClassMap:(id)a3
{
}

- (NSMutableDictionary)overridingClassMap
{
  return self->_overridingClassMap;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setClass:(Class)a3 forCachedClassName:(id)a4
{
  id v6 = a4;
  id v7 = [(WFDiskCache *)self overridingClassMap];
  [v7 setObject:a3 forKeyedSubscript:v6];
}

- (id)actuallyGetObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFDiskCache.m", 217, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  id v9 = [(WFDiskCache *)self fileURLForKey:v8];
  uint64_t v10 = open((const char *)[v9 fileSystemRepresentation], 16);
  if (v10 == -1)
  {
    if (*__error() != 2)
    {
      v18 = [v9 absoluteString];
      v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      NSLog(&cfstr_ErrorFileUrlFo_0.isa, self, v18, v8, v19);
    }
    v17 = 0;
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v10 closeOnDealloc:1];
    v12 = [v11 readDataToEndOfFile];
    [v11 closeFile];
    id v24 = 0;
    v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v12 error:&v24];
    id v14 = v24;
    [v13 setRequiresSecureCoding:1];
    [v13 setDecodingFailurePolicy:1];
    v15 = [(WFDiskCache *)self overridingClassMap];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__WFDiskCache_actuallyGetObjectOfClasses_forKey___block_invoke;
    v22[3] = &unk_264E56D08;
    id v16 = v13;
    id v23 = v16;
    [v15 enumerateKeysAndObjectsUsingBlock:v22];

    if (v16)
    {
      v17 = [v16 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F081D0]];
      [v16 finishDecoding];
    }
    else
    {
      NSLog(&cfstr_ErrorCouldNotU.isa, self, v14);
      v17 = 0;
    }
  }
  return v17;
}

uint64_t __49__WFDiskCache_actuallyGetObjectOfClasses_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setClass:a3 forClassName:a2];
}

- (void)actuallyRemoveObjectForKey:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFDiskCache.m", 210, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [(WFDiskCache *)self fileURLForKey:v5];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  [v7 removeItemAtURL:v6 error:0];
}

- (void)actuallySetObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFDiskCache.m", 186, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFDiskCache.m", 187, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [(WFDiskCache *)self fileURLForKey:v9];
  id v21 = 0;
  v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v21];
  id v12 = v21;
  v13 = v12;
  if (v11)
  {
    id v14 = v10;
    uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 1569, 420);
    if (v15 == -1)
    {
      v17 = [v14 absoluteString];
      v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      NSLog(&cfstr_ErrorFileUrlFo.isa, self, v17, v9, v18);
    }
    else
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v15 closeOnDealloc:1];
      [v16 writeData:v11];
      [v16 closeFile];
    }
  }
  else
  {
    NSLog(&cfstr_ErrorCouldNotA.isa, self, v12);
  }
}

- (id)fileURLForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 dataUsingEncoding:4];
  CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
  id v5 = objc_opt_new();
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);
  id v7 = [(WFDiskCache *)self cacheURL];
  id v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:0];

  return v8;
}

- (id)objectOfClasses:(id)a3 forKeyComponents:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = WFDiskCacheKeyArgs(a4, &v11);
    id v8 = [(WFDiskCache *)self objectOfClasses:v6 forKey:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)removeObjectForKeyComponents:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFDiskCache.m", 153, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    id v5 = 0;
  }
  id v7 = WFDiskCacheKeyArgs(v5, &v9);
  [(WFDiskCache *)self removeObjectForKey:v7];
}

- (void)setObject:(id)a3 forKeyComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v8)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDiskCache.m", 144, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    id v8 = 0;
  }
  uint64_t v10 = WFDiskCacheKeyArgs(v8, &v12);
  [(WFDiskCache *)self setObject:v7 forKey:v10];
}

- (void)objectOfClasses:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFDiskCache.m", 134, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke;
  block[3] = &unk_264E5DC38;
  block[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, block);
}

void __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) actuallyGetObjectOfClasses:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  v3 = dispatch_get_global_queue(-32768, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke_2;
  v6[3] = &unk_264E5EE18;
  id v4 = *(id *)(a1 + 56);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeObjectForKey:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFDiskCache.m", 125, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WFDiskCache_removeObjectForKey_completion___block_invoke;
  block[3] = &unk_264E5DD30;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __45__WFDiskCache_removeObjectForKey_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) actuallyRemoveObjectForKey:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v3, v2);
  }
}

- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFDiskCache.m", 115, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFDiskCache.m", 116, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__WFDiskCache_setObject_forKey_completion___block_invoke;
  block[3] = &unk_264E5DC38;
  block[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, block);
}

void __43__WFDiskCache_setObject_forKey_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) actuallySetObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    v3 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v3, v2);
  }
}

- (id)objectOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__8021;
    id v19 = __Block_byref_object_dispose__8022;
    id v20 = 0;
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__WFDiskCache_objectOfClasses_forKey___block_invoke;
    v11[3] = &unk_264E5AA50;
    id v14 = &v15;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_barrier_sync(queue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __38__WFDiskCache_objectOfClasses_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actuallyGetObjectOfClasses:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeObjectForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFDiskCache.m", 97, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WFDiskCache_removeObjectForKey___block_invoke;
  block[3] = &unk_264E5DED8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_barrier_sync(queue, block);
}

uint64_t __34__WFDiskCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actuallyRemoveObjectForKey:*(void *)(a1 + 40)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFDiskCache.m", 89, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFDiskCache.m", 90, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__WFDiskCache_setObject_forKey___block_invoke;
  block[3] = &unk_264E5E938;
  block[4] = self;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  dispatch_barrier_sync(queue, block);
}

uint64_t __32__WFDiskCache_setObject_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actuallySetObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (WFDiskCache)initWithCacheURL:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = (__CFString *)a4;
  if (!v7)
  {
    id v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFDiskCache.m", 69, @"Invalid parameter not satisfying: %@", @"cacheURL" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)WFDiskCache;
  id v9 = [(WFDiskCache *)&v26 init];
  if (v9)
  {
    id v10 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    char v11 = [v10 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v12 = v25;

    if (v11)
    {
      id v13 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_BACKGROUND, 0);
      if (v8) {
        id v14 = v8;
      }
      else {
        id v14 = @"default";
      }
      id v15 = [@"is.workflow.WFDiskCache." stringByAppendingString:v14];
      dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], v13);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v16;

      uint64_t v18 = [v7 copy];
      cacheURL = v9->_cacheURL;
      v9->_cacheURL = (NSURL *)v18;

      uint64_t v20 = objc_opt_new();
      overridingClassMap = v9->_overridingClassMap;
      v9->_overridingClassMap = (NSMutableDictionary *)v20;

      v22 = v9;
    }
    else
    {
      NSLog(&cfstr_Error_0.isa, v9, v12);
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (WFDiskCache)initWithCacheDirectory:(id)a3 name:(id)a4
{
  if (a4) {
    id v6 = (__CFString *)a4;
  }
  else {
    id v6 = @"default";
  }
  id v7 = a4;
  id v8 = a3;
  id v9 = [@"is.workflow.WFDiskCache." stringByAppendingString:v6];
  id v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];

  char v11 = [(WFDiskCache *)self initWithCacheURL:v10 name:v7];
  return v11;
}

- (WFDiskCache)initWithApplicationGroupIdentifier:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F08850];
  id v8 = a3;
  id v9 = [v7 defaultManager];
  id v10 = [v9 containerURLForSecurityApplicationGroupIdentifier:v8];

  char v11 = [v10 URLByAppendingPathComponent:@"Library" isDirectory:1];
  id v12 = [v11 URLByAppendingPathComponent:@"Caches" isDirectory:1];

  if (v12)
  {
    self = [(WFDiskCache *)self initWithCacheDirectory:v12 name:v6];
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (WFDiskCache)initWithName:(id)a3
{
  id v4 = NSURL;
  id v5 = a3;
  id v6 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v7 = [v6 firstObject];
  id v8 = [v4 fileURLWithPath:v7 isDirectory:1];

  id v9 = [(WFDiskCache *)self initWithCacheDirectory:v8 name:v5];
  return v9;
}

- (WFDiskCache)init
{
  return [(WFDiskCache *)self initWithName:0];
}

+ (id)workflowCache
{
  if (workflowCache_onceToken != -1) {
    dispatch_once(&workflowCache_onceToken, &__block_literal_global_56583);
  }
  uint64_t v2 = (void *)workflowCache_workflowCache;
  return v2;
}

void __38__WFDiskCache_Workflow__workflowCache__block_invoke()
{
  v0 = [WFDiskCache alloc];
  id v3 = [MEMORY[0x263F339A0] appGroupIdentifier];
  uint64_t v1 = [(WFDiskCache *)v0 initWithApplicationGroupIdentifier:v3 name:0];
  uint64_t v2 = (void *)workflowCache_workflowCache;
  workflowCache_workflowCache = v1;
}

@end