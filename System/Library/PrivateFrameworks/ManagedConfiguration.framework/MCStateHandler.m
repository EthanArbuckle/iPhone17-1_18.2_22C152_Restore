@interface MCStateHandler
+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4;
@end

@implementation MCStateHandler

+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = a3;
    _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEBUG, "Adding os_state handler: %{public}s", buf, 0xCu);
  }
  v7 = dispatch_get_global_queue(0, 0);
  id v8 = v5;
  os_state_add_handler();
}

_DWORD *__53__MCStateHandler_addStateHandlerWithName_stateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136446210;
    uint64_t v17 = v4;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEBUG, "Processing os_state handler: %{public}s", buf, 0xCu);
  }
  id v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v15 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v15];
  id v7 = v15;
  unsigned int v8 = [v6 length];
  if (v7)
  {
    v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446466;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1A13F0000, v9, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%{public}s\": %{public}@", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }
  else
  {
    unsigned int v12 = v8;
    size_t v13 = v8;
    uint64_t v11 = malloc_type_calloc(1uLL, v8 + 200, 0x57B48BA3uLL);
    *uint64_t v11 = 1;
    v11[1] = v12;
    __strlcpy_chk();
    memcpy(v11 + 50, (const void *)[v6 bytes], v13);
  }

  return v11;
}

@end