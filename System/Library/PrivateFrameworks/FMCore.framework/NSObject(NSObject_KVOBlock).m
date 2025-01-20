@interface NSObject(NSObject_KVOBlock)
- (id)addKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:;
- (id)addOneShotKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:;
- (id)allKVOObservers;
- (void)removeKVOBlockForToken:()NSObject_KVOBlock;
@end

@implementation NSObject(NSObject_KVOBlock)

- (id)addKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:
{
  id v8 = a5;
  id v9 = a3;
  v10 = KVOBlockHelperForObject(a1, 1);
  v11 = [v10 insertNewTokenForKeyPath:v9 block:v8];

  objc_msgSend(a1, "addObserver:forKeyPath:options:context:", v10, v9, a4, objc_msgSend(v11, "context"));
  return v11;
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock
{
  id v4 = a3;
  v5 = KVOBlockHelperForObject(a1, 0);
  uint64_t v6 = [v4 context];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v4 keypath];
    if ([v8 length])
    {
      [a1 removeObserver:v5 forKeyPath:v8 context:v7];
      [v5 removeHandlerForKey:v4];
    }
    else
    {
      v15 = LogCategory_Unspecified();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NSObject(NSObject_KVOBlock) removeKVOBlockForToken:]((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    id v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSObject(NSObject_KVOBlock) removeKVOBlockForToken:]((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (id)allKVOObservers
{
  v1 = KVOBlockHelperForObject(a1, 0);
  v2 = [v1 allKVOObservers];

  return v2;
}

- (id)addOneShotKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__NSObject_NSObject_KVOBlock__addOneShotKVOBlockForKeyPath_options_handler___block_invoke;
  v16[3] = &unk_1E689EBC8;
  id v10 = v9;
  v16[4] = a1;
  id v17 = v10;
  uint64_t v18 = &v19;
  uint64_t v11 = (void *)MEMORY[0x1D25F2CB0](v16);
  uint64_t v12 = [a1 addKVOBlockForKeyPath:v8 options:a4 handler:v11];
  uint64_t v13 = (void *)v20[5];
  v20[5] = v12;

  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end