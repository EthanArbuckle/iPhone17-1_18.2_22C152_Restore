@interface BCSCoalesceHelper
- (BCSCoalesceHelper)initWithQOSClass:(unsigned int)a3;
- (BOOL)isDuplicateRequest:(id)a3;
- (id)dequeueCoalesceObjectsForCoalesceKey:(id)a3;
- (void)enqueueCoalesceObject:(id)a3 isDuplicateRequest:(BOOL *)a4;
@end

@implementation BCSCoalesceHelper

- (BCSCoalesceHelper)initWithQOSClass:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BCSCoalesceHelper;
  v4 = [(BCSCoalesceHelper *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    coalesceObjectPool = v4->_coalesceObjectPool;
    v4->_coalesceObjectPool = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, -1);
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[@"com.apple.businessservicesd.CoalesceHelperCoalesceObjectDispatchQueue" UTF8String], v7);
    coalesceHelperDispatchQueue = v4->_coalesceHelperDispatchQueue;
    v4->_coalesceHelperDispatchQueue = (OS_dispatch_queue *)v8;
  }
  return v4;
}

- (void)enqueueCoalesceObject:(id)a3 isDuplicateRequest:(BOOL *)a4
{
  id v6 = a3;
  if (self) {
    coalesceHelperDispatchQueue = self->_coalesceHelperDispatchQueue;
  }
  else {
    coalesceHelperDispatchQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BCSCoalesceHelper_enqueueCoalesceObject_isDuplicateRequest___block_invoke;
  block[3] = &unk_264248A28;
  block[4] = self;
  id v10 = v6;
  objc_super v11 = a4;
  id v8 = v6;
  dispatch_sync(coalesceHelperDispatchQueue, block);
}

void __62__BCSCoalesceHelper_enqueueCoalesceObject_isDuplicateRequest___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[4];
  v2 = (void *)a1[5];
  if (!v1)
  {
    id v15 = v2;
    id v6 = 0;
    goto LABEL_13;
  }
  v3 = (char *)a1[6];
  v4 = *(void **)(v1 + 8);
  id v5 = v2;
  id v6 = v4;
  v7 = [v5 coalesceKey];
  id v8 = [v6 objectForKey:v7];

  uint64_t v9 = [v8 count];
  id v10 = ABSLogCommon();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v16 = 136315138;
      v17 = "-[BCSCoalesceHelper _enqueueCoalesceObject:isDuplicateRequest:inCoalesceObjectPool:]";
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Enqueue CoalesceObject to existing CoalesceObject array %s", (uint8_t *)&v16, 0xCu);
    }

    [v8 addObject:v5];
    if (!v3) {
      goto LABEL_12;
    }
    char v12 = 1;
  }
  else
  {
    if (v11)
    {
      int v16 = 136315138;
      v17 = "-[BCSCoalesceHelper _enqueueCoalesceObject:isDuplicateRequest:inCoalesceObjectPool:]";
      _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Enqueue CoalesceObject to new CoalesceObject array %s", (uint8_t *)&v16, 0xCu);
    }

    v13 = objc_opt_new();
    [v13 addObject:v5];
    v14 = [v5 coalesceKey];
    [v6 setObject:v13 forKey:v14];

    if (!v3)
    {
      id v8 = v13;
      goto LABEL_12;
    }
    char v12 = 0;
    id v8 = v13;
  }
  char *v3 = v12;
LABEL_12:

LABEL_13:
}

- (id)dequeueCoalesceObjectsForCoalesceKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  int v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  if (self) {
    coalesceHelperDispatchQueue = self->_coalesceHelperDispatchQueue;
  }
  else {
    coalesceHelperDispatchQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BCSCoalesceHelper_dequeueCoalesceObjectsForCoalesceKey___block_invoke;
  block[3] = &unk_264248A50;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(coalesceHelperDispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__BCSCoalesceHelper_dequeueCoalesceObjectsForCoalesceKey___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (v2)
  {
    v3 = (void *)a1[5];
    id v12 = *(id *)(v2 + 8);
    id v4 = v3;
    id v5 = [v12 objectForKey:v4];
    id v6 = [v5 copy];

    [v12 removeObjectForKey:v4];
    uint64_t v7 = [v6 count];
    id v8 = ABSLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v14 = "-[BCSCoalesceHelper _dequeueCoalesceObjectsForCoalesceKey:inCoalesceObjectPool:]";
        _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Dequeue CoalesceObject array - Found %s", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v14 = "-[BCSCoalesceHelper _dequeueCoalesceObjectsForCoalesceKey:inCoalesceObjectPool:]";
        _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Dequeue CoalesceObject array - Not Found %s", buf, 0xCu);
      }

      id v8 = v6;
      id v6 = MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v12 = 0;
    id v6 = 0;
  }
  uint64_t v10 = *(void *)(a1[6] + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (self) {
    coalesceHelperDispatchQueue = self->_coalesceHelperDispatchQueue;
  }
  else {
    coalesceHelperDispatchQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__BCSCoalesceHelper_isDuplicateRequest___block_invoke;
  block[3] = &unk_264248A50;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(coalesceHelperDispatchQueue, block);
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__BCSCoalesceHelper_isDuplicateRequest___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[1];
  }
  v3 = (void *)a1[5];
  id v4 = v2;
  id v6 = [v3 coalesceKey];
  id v5 = [v4 objectForKey:v6];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v5 count] != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceHelperDispatchQueue, 0);

  objc_storeStrong((id *)&self->_coalesceObjectPool, 0);
}

@end