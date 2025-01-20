@interface GCHIDEventSubject
@end

@implementation GCHIDEventSubject

void __38___GCHIDEventSubject_publishHIDEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKey:v4];
  id v9 = (id)[v5 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init((Class)&off_26D2B4AE0);
  }
  uint64_t v6 = (void *)MEMORY[0x223C6E420](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v9 addObject:v6];

  uint64_t v7 = *(void **)(a1 + 32);
  long long v8 = (void *)[v9 copy];
  [v7 setObject:v8 forKey:v4];
}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  long long v11 = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_3;
  v12 = &unk_26D22ACC0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = v2;
  uint64_t v14 = v4;
  id v5 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:&v9];
  uint64_t v6 = objc_msgSend(v5, "copy", v9, v10, v11, v12);
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x223C6E420](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    long long v8 = (void *)[v5 mutableCopy];
    id v9 = (void *)MEMORY[0x223C6E420](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    [v8 removeObject:v9];

    uint64_t v10 = *(void **)(a1 + 32);
    long long v11 = (void *)[v8 copy];
    [v10 setObject:v11 forKey:v12];
  }
}

@end