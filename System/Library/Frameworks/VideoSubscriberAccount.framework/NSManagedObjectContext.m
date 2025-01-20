@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __67__NSManagedObjectContext_VSAdditions__vs_removeAllPersistentStores__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [v1 persistentStores];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v13 = 0;
        char v9 = objc_msgSend(v1, "removePersistentStore:error:", v8, &v13, v12);
        id v10 = v13;
        if ((v9 & 1) == 0)
        {
          v11 = VSErrorLogObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            id v19 = v10;
            _os_log_error_impl(&dword_1DA674000, v11, OS_LOG_TYPE_ERROR, "Unable to remove persistent store: %@", buf, 0xCu);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

@end