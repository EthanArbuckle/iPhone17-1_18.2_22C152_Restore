@interface SGBloomFilter
- (BOOL)exists:(id)a3;
- (SGBloomFilter)initWithDirectory:(id)a3 name:(id)a4;
- (SGBloomFilter)initWithHead:(id)a3 tail:(id)a4;
- (SGBloomFilter)initWithInMemoryStorage;
- (SGBloomFilter)initWithInMemoryStorageSparse;
- (id)counts;
- (void)_rotate;
- (void)_rotateIfNecessary;
- (void)add:(id)a3;
- (void)addAsync:(id)a3;
- (void)forceRotate;
@end

@implementation SGBloomFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

- (id)counts
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12776;
  v10 = __Block_byref_object_dispose__12777;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__SGBloomFilter_counts__block_invoke;
  v5[3] = &unk_1E65C0728;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __23__SGBloomFilter_counts__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F93BB8]);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
  uint64_t v4 = [v2 initWithFirst:v7 second:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)exists:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = 0;
  SGMurmurhashString(a3, 12345, &v8);
  uint64_t v4 = v8;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__SGBloomFilter_exists___block_invoke;
  v7[3] = &unk_1E65BF380;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = v4;
  dispatch_sync(queue, v7);
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __24__SGBloomFilter_exists___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 8) exists:a1[6]]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [*(id *)(a1[4] + 16) exists:a1[6]];
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)addAsync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__SGBloomFilter_addAsync___block_invoke;
  v7[3] = &unk_1E65BFD88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __26__SGBloomFilter_addAsync___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _rotateIfNecessary];
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = 0;
  v6[1] = 0;
  SGMurmurhashString(v2, 12345, v6);
  uint64_t v4 = v6[0];
  return [v3 add:v4];
}

- (void)add:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__SGBloomFilter_add___block_invoke;
  v7[3] = &unk_1E65BFD88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __21__SGBloomFilter_add___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _rotateIfNecessary];
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = 0;
  v6[1] = 0;
  SGMurmurhashString(v2, 12345, v6);
  uint64_t v4 = v6[0];
  return [v3 add:v4];
}

- (void)forceRotate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SGBloomFilter_forceRotate__block_invoke;
  block[3] = &unk_1E65BEF88;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__SGBloomFilter_forceRotate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rotate];
}

- (void)_rotate
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Rotating bloom filters", buf, 2u);
  }

  unint64_t v4 = 0x1E65B3000uLL;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  head = self->_head;
  if ((isKindOfClass & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tail, head);
    objc_opt_class();
    v17 = (SGBloomFilterChunk *)objc_opt_new();
    id v7 = self->_head;
    self->_head = v17;
    goto LABEL_21;
  }
  id v7 = head;
  id v8 = self->_tail;
  id v9 = [(SGBloomFilterChunk *)v7 path];
  id v10 = [(SGBloomFilterChunk *)v8 path];
  int v11 = [v9 hasSuffix:@".bf-head"];
  if (v11)
  {
    uint64_t v12 = v10;
    v13 = v8;
    v14 = (void *)MEMORY[0x1CB79B230]();
    v15 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 8);
    v34 = [v15 stringByAppendingString:@".bf2-head"];
    v16 = v9;
  }
  else
  {
    if (![v10 hasSuffix:@".bf-tail"])
    {
      int v18 = 0;
      v34 = v9;
      uint64_t v12 = v10;
      goto LABEL_11;
    }
    v13 = v8;
    v14 = (void *)MEMORY[0x1CB79B230]();
    v15 = objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 8);
    uint64_t v12 = [v15 stringByAppendingString:@".bf2-tail"];
    v16 = v10;
    v34 = v9;
  }
  int v18 = v11 ^ 1;

  id v8 = v13;
  unint64_t v4 = 0x1E65B3000;
LABEL_11:
  [(SGBloomFilterChunk *)v7 close];
  [(SGBloomFilterChunk *)v8 close];
  id v19 = v9;
  v20 = (const std::__fs::filesystem::path *)[v19 UTF8String];
  id v21 = v12;
  v22 = (const std::__fs::filesystem::path *)[v21 UTF8String];
  rename(v20, v22, v23);
  if (v24)
  {
    v25 = sgLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v32 = *__error();
      *(_DWORD *)buf = 138412802;
      id v36 = v34;
      __int16 v37 = 2112;
      id v38 = v21;
      __int16 v39 = 1024;
      int v40 = v32;
      _os_log_error_impl(&dword_1CA650000, v25, OS_LOG_TYPE_ERROR, "Could not move %@ to %@: errno=%i", buf, 0x1Cu);
    }
  }
  if (v18)
  {
    id v26 = v10;
    if (unlink((const char *)[v26 UTF8String]))
    {
      v27 = sgLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        int v33 = *__error();
        *(_DWORD *)buf = 138412546;
        id v36 = v26;
        __int16 v37 = 1024;
        LODWORD(v38) = v33;
        _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "Could not unlink %@: errno=%i", buf, 0x12u);
      }
    }
  }
  v28 = (SGBloomFilterChunk *)[objc_alloc(*(Class *)(v4 + 3704)) initWithPath:v34];
  v29 = self->_head;
  self->_head = v28;

  v30 = (SGBloomFilterChunk *)[objc_alloc(*(Class *)(v4 + 3704)) initWithPath:v21];
  tail = self->_tail;
  self->_tail = v30;

LABEL_21:
}

- (void)_rotateIfNecessary
{
  if ([(SGBloomFilterChunk *)self->_head count] >> 3 >= 0xC35)
  {
    [(SGBloomFilter *)self _rotate];
  }
}

- (SGBloomFilter)initWithDirectory:(id)a3 name:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
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
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SGBloomFilter.m", 69, @"Invalid parameter not satisfying: %@", @"dirPath" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"SGBloomFilter.m", 70, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  if (initWithDirectory_name__onceToken != -1) {
    dispatch_once(&initWithDirectory_name__onceToken, &__block_literal_global_12845);
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v7 second:v9];
  pthread_mutex_lock(&initWithDirectory_name__lock);
  uint64_t v11 = [(id)initWithDirectory_name__instances objectForKey:v10];
  if (v11)
  {
    uint64_t v12 = (SGBloomFilter *)v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1CB79B230]();
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v57 = 0;
    v15 = [v14 contentsOfDirectoryAtPath:v7 error:&v57];
    id v16 = v57;

    if (v15)
    {
      v52 = v13;
      id v50 = v16;
      v17 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v15];
      uint64_t v18 = [v9 stringByAppendingString:@".bf-head"];
      uint64_t v19 = [v9 stringByAppendingString:@".bf-tail"];
      v20 = [v9 stringByAppendingString:@".bf2-head"];
      id v21 = [v9 stringByAppendingString:@".bf2-tail"];
      v56 = (void *)v18;
      v54 = v20;
      if ([v17 containsObject:v18]) {
        v22 = (void *)v18;
      }
      else {
        v22 = v20;
      }
      id v47 = v22;
      if ([v17 containsObject:v19]) {
        v23 = (void *)v19;
      }
      else {
        v23 = v21;
      }
      id v24 = v23;
      v53 = (void *)v19;
      v48 = v21;
      if ([v17 containsObject:v19]
        && [v17 containsObject:v21])
      {
        id v55 = v21;

        id v25 = [v7 stringByAppendingPathComponent:v19];
        int v26 = unlink((const char *)[v25 UTF8String]);

        if (v26)
        {
          v27 = sgLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = [v7 stringByAppendingPathComponent:v53];
            int v42 = *__error();
            *(_DWORD *)buf = 138412546;
            id v59 = v41;
            __int16 v60 = 1024;
            LODWORD(v61) = v42;
            _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "Could not unlink %@ while rotating: errno=%i", buf, 0x12u);
          }
        }
      }
      else
      {
        id v55 = v24;
      }
      v51 = v15;
      v49 = v17;
      if ([v17 containsObject:v56]
        && [v17 containsObject:v20])
      {
        id v28 = v20;

        id v29 = [v7 stringByAppendingPathComponent:v56];
        int v30 = unlink((const char *)[v29 UTF8String]);

        if (v30)
        {
          v31 = sgLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v43 = [v7 stringByAppendingPathComponent:v56];
            int v44 = *__error();
            *(_DWORD *)buf = 138412546;
            id v59 = v43;
            __int16 v60 = 1024;
            LODWORD(v61) = v44;
            _os_log_error_impl(&dword_1CA650000, v31, OS_LOG_TYPE_ERROR, "Could not unlink %@ while rotating: errno=%i", buf, 0x12u);
          }
          int v32 = self;
        }
        else
        {
          int v32 = self;
        }
      }
      else
      {
        int v32 = self;
        id v28 = v47;
      }
      int v33 = [SGBloomFilterChunkMmap alloc];
      v34 = [v7 stringByAppendingPathComponent:v28];
      v35 = [(SGBloomFilterChunkMmap *)v33 initWithPath:v34];
      id v36 = [SGBloomFilterChunkMmap alloc];
      __int16 v37 = [v7 stringByAppendingPathComponent:v55];
      id v38 = [(SGBloomFilterChunkMmap *)v36 initWithPath:v37];
      uint64_t v12 = [(SGBloomFilter *)v32 initWithHead:v35 tail:v38];

      if ([v28 isEqualToString:v56]) {
        [(SGBloomFilter *)v12 _rotate];
      }
      [(id)initWithDirectory_name__instances setObject:v12 forKey:v10];

      self = v12;
      v15 = v51;
      v13 = v52;
      __int16 v39 = v49;
      id v16 = v50;
    }
    else
    {
      __int16 v39 = sgLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v7;
        __int16 v60 = 2112;
        id v61 = v16;
        _os_log_error_impl(&dword_1CA650000, v39, OS_LOG_TYPE_ERROR, "Error listing contents of directory %@: %@", buf, 0x16u);
      }
      uint64_t v12 = 0;
    }
  }
  pthread_mutex_unlock(&initWithDirectory_name__lock);

  return v12;
}

uint64_t __40__SGBloomFilter_initWithDirectory_name___block_invoke()
{
  initWithDirectory_name__instances = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:1];
  return MEMORY[0x1F41817F8]();
}

- (SGBloomFilter)initWithInMemoryStorageSparse
{
  id v3 = objc_opt_new();
  unint64_t v4 = objc_opt_new();
  uint64_t v5 = [(SGBloomFilter *)self initWithHead:v3 tail:v4];

  return v5;
}

- (SGBloomFilter)initWithInMemoryStorage
{
  id v3 = objc_opt_new();
  unint64_t v4 = objc_opt_new();
  uint64_t v5 = [(SGBloomFilter *)self initWithHead:v3 tail:v4];

  return v5;
}

- (SGBloomFilter)initWithHead:(id)a3 tail:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGBloomFilter;
  id v9 = [(SGBloomFilter *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_head, a3);
    objc_storeStrong((id *)&v10->_tail, a4);
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.suggestions.SGBloomFilter", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

@end