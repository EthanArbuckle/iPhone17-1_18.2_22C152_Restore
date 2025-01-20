@interface _PFGarbageManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultInstance;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (uint64_t)doCleanupForURL:(uint64_t)result;
- (unint64_t)retainCount;
- (void)temporaryLinksDirectoryForStore:(id *)a1;
@end

@implementation _PFGarbageManager

+ (id)defaultInstance
{
  return (id)_NSTheOneGarbageManager;
}

- (void)temporaryLinksDirectoryForStore:(id *)a1
{
  if (!a1) {
    return 0;
  }
  objc_sync_enter(a1);
  v4 = (void *)[a2 externalDataReferencesDirectory];
  v5 = (NSString *)[a1[1] objectForKey:v4];
  if (!v5)
  {
    v5 = NSTemporaryDirectory();
    if (!v5) {
      v5 = (NSString *)[v4 stringByDeletingLastPathComponent];
    }
    [a1[1] setObject:v5 forKey:v4];
  }
  v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", @".LINKS"), "stringByAppendingPathComponent:", +[_PFRoutines _getUUID]()), 1);
  if (!v6) {
    goto LABEL_11;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", 0), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v12) & 1) == 0)
  {
    objc_sync_exit(a1);
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByDeletingLastPathComponent");
  id v8 = a1[2];
  objc_sync_enter(v8);
  objc_msgSend(a1[2], "addObject:", objc_msgSend(v6, "path"));
  v9 = (void *)[a1[2] copy];
  objc_sync_exit(v8);
  if (v9)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___PFGarbageManager__doCleanupForDir_exceptURLs___block_invoke;
    block[3] = &unk_1E544BB28;
    block[4] = v7;
    block[5] = v9;
    block[6] = a1;
    dispatch_async(global_queue, block);
  }

LABEL_11:
  objc_sync_exit(a1);
  return v6;
}

+ (void)initialize
{
  self;
  if (!_NSTheOneGarbageManager)
  {
    id v3 = NSAllocateObject((Class)a1, 0, 0);
    _NSTheOneGarbageManager = (uint64_t)v3;
    if (v3)
    {
      v6.receiver = v3;
      v6.super_class = (Class)_PFGarbageManager;
      v4 = objc_msgSendSuper2(&v6, sel_init);
      if (v4)
      {
        v5 = v4;
        v4[2] = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v5[1] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
    }
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSTheOneGarbageManager;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (uint64_t)doCleanupForURL:(uint64_t)result
{
  if (result && a2)
  {
    uint64_t v2 = result;
    id v3 = (void *)[a2 path];
    v4 = *(void **)(v2 + 16);
    objc_sync_enter(v4);
    if ([*(id *)(v2 + 16) containsObject:v3])
    {
      [*(id *)(v2 + 16) removeObject:v3];
      v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      [v5 removeItemAtPath:v3 error:0];
      objc_super v6 = (void *)[v3 stringByDeletingLastPathComponent];
      if (objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "isEqualToString:", @".LINKS"))
      {
        uint64_t v7 = (void *)[v5 contentsOfDirectoryAtPath:v6 error:0];
        if (v7)
        {
          if (![v7 count]) {
            [v5 removeItemAtPath:v6 error:0];
          }
        }
      }
    }
    return objc_sync_exit(v4);
  }
  return result;
}

@end