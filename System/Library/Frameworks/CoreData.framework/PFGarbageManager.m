@interface PFGarbageManager
@end

@implementation PFGarbageManager

uint64_t __49___PFGarbageManager__doCleanupForDir_exceptURLs___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v14 = 0;
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a1[4], &v14);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [a1[4] stringByAppendingPathComponent:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        if (([a1[5] containsObject:v7] & 1) == 0)
        {
          id v8 = a1[6];
          if (v8)
          {
            objc_sync_enter(a1[6]);
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v7, 0);
            objc_sync_exit(v8);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v4);
  }
  return [v2 drain];
}

@end