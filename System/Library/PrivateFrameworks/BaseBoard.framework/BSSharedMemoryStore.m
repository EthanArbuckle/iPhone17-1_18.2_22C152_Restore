@interface BSSharedMemoryStore
+ (id)deserializeDataOfClass:(Class)a3 withSerializedFromData:(id)a4;
+ (void)_unlinkAllForIdentifier:(id)a3;
- (BSSharedMemoryStore)init;
- (BSSharedMemoryStore)initWithIdentifier:(id)a3 dataClass:(Class)a4;
- (BSSharedMemoryStoreData)data;
- (unsigned)_lastState;
- (void)_setFailureModeForNextWrite:(unsigned __int8)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setData:(id)a3;
@end

@implementation BSSharedMemoryStore

- (BSSharedMemoryStore)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSSharedMemoryStore.m" lineNumber:103 description:@"init is not allowed on BSSharedMemoryStore"];

  return 0;
}

+ (id)deserializeDataOfClass:(Class)a3 withSerializedFromData:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"BSSharedMemoryStore.m", 278, @"Invalid parameter not satisfying: %@", @"dataClass" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"BSSharedMemoryStore.m", 279, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];

LABEL_3:
  unint64_t v9 = [v8 serializedDataLength];
  size_t v10 = v9;
  if (v9 >= 0x7FFFFFFFFFFFFFF0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]"];
    [v28 handleFailureInFunction:v29 file:@"BSSharedMemoryStore.m" lineNumber:287 description:@"shmLength out of range"];
  }
  else if (!v9)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v11 = malloc_type_malloc(v10, 0xAF618871uLL);
  if (!v11)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]"];
    [v30 handleFailureInFunction:v31 file:@"BSSharedMemoryStore.m" lineNumber:291 description:@"failed to allocate serializing buffers"];
  }
  bzero(v11, v10);
LABEL_9:
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 1;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  v12 = [MEMORY[0x1E4F29060] currentThread];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke;
  v47[3] = &unk_1E5445930;
  id v13 = v12;
  id v48 = v13;
  v49 = &v62;
  size_t v52 = v10;
  v53 = v11;
  v50 = &v58;
  v51 = &v54;
  int v14 = [v8 serializeToWriter:v47];
  *((unsigned char *)v63 + 24) = 0;
  if (v14)
  {
    if (*((unsigned char *)v55 + 24))
    {
      v15 = BSLogSharedMemory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        v16 = "data serialized but it tried to serialize more than it declared necessary : %@";
LABEL_20:
        _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (v59[3] == v10) {
        goto LABEL_22;
      }
      v15 = BSLogSharedMemory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        v16 = "data serialized but it serialized less than it declared necessary : %@";
        goto LABEL_20;
      }
    }

LABEL_22:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v71 = 0x2020000000;
    char v72 = 1;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke_60;
    v32[3] = &unk_1E5445958;
    id v33 = v13;
    p_long long buf = &buf;
    size_t v37 = v10;
    v38 = v11;
    v35 = &v43;
    v36 = &v39;
    v18 = [(objc_class *)a3 deserializeFromReader:v32];
    *(unsigned char *)(*((void *)&buf + 1) + 24) = 0;
    if (v18)
    {
      if (*((unsigned char *)v40 + 24))
      {
        v19 = BSLogSharedMemory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v66 = 138412546;
          v67 = v8;
          __int16 v68 = 2112;
          v69 = v18;
          _os_log_debug_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_DEBUG, "data deserialized but it tried to over read : data=%@ deserialized=%@", v66, 0x16u);
        }
      }
      else
      {
        if (v44[3] == v10)
        {
LABEL_46:

          _Block_object_dispose(&v39, 8);
          _Block_object_dispose(&v43, 8);
          _Block_object_dispose(&buf, 8);
          goto LABEL_47;
        }
        v19 = BSLogSharedMemory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v66 = 138412546;
          v67 = v8;
          __int16 v68 = 2112;
          v69 = v18;
          _os_log_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_INFO, "data deserialized but it didn't read everything : data=%@ deserialized=%@", v66, 0x16u);
        }
      }
LABEL_45:

      goto LABEL_46;
    }
    if (*((unsigned char *)v40 + 24))
    {
      v19 = BSLogSharedMemory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)v66 = 138412290;
      v67 = v8;
      v22 = "data failed to deserialize (maybe because it tried to over read) : data=%@";
    }
    else
    {
      uint64_t v23 = v44[3];
      v19 = BSLogSharedMemory();
      BOOL v24 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v23 == v10)
      {
        if (!v24) {
          goto LABEL_45;
        }
        *(_DWORD *)v66 = 138412290;
        v67 = v8;
        v22 = "data failed to deserialize (external reason) : data=%@";
      }
      else
      {
        if (!v24) {
          goto LABEL_45;
        }
        *(_DWORD *)v66 = 138412290;
        v67 = v8;
        v22 = "data failed to deserialize (maybe because it didn't read everything) : data=%@";
      }
    }
    _os_log_error_impl(&dword_18AAA8000, v19, OS_LOG_TYPE_ERROR, v22, v66, 0xCu);
    goto LABEL_45;
  }
  if (*((unsigned char *)v55 + 24))
  {
    v17 = BSLogSharedMemory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_ERROR, "data failed to serialize (maybe because it tried to write more than it declared up front) : %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = v59[3];
    v17 = BSLogSharedMemory();
    BOOL v21 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v20 == v10)
    {
      if (v21)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_error_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_ERROR, "data failed to serialize (external reason) : %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v21)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_18AAA8000, v17, OS_LOG_TYPE_ERROR, "data failed to serialize (maybe because it tried to write less than it declared up front) : %@", (uint8_t *)&buf, 0xCu);
    }
  }

  v18 = 0;
LABEL_47:
  free(v11);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v18;
}

- (void)invalidate
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__BSSharedMemoryStore_invalidate__block_invoke;
  v3[3] = &unk_1E54458E0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async_and_wait(queue, v3);
}

- (BSSharedMemoryStore)initWithIdentifier:(id)a3 dataClass:(Class)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)long long buf = 138544642;
      id v38 = v24;
      __int16 v39 = 2114;
      v40 = v26;
      __int16 v41 = 2048;
      char v42 = self;
      __int16 v43 = 2114;
      v44 = @"BSSharedMemoryStore.m";
      __int16 v45 = 1024;
      int v46 = 108;
      __int16 v47 = 2114;
      id v48 = v23;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v23 UTF8String];
    __break(0);
    JUMPOUT(0x18AB02D54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)long long buf = 138544642;
      id v38 = v28;
      __int16 v39 = 2114;
      v40 = v30;
      __int16 v41 = 2048;
      char v42 = self;
      __int16 v43 = 2114;
      v44 = @"BSSharedMemoryStore.m";
      __int16 v45 = 1024;
      int v46 = 108;
      __int16 v47 = 2114;
      id v48 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AB02E58);
  }

  if ([v7 length])
  {
    if (a4) {
      goto LABEL_5;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"BSSharedMemoryStore.m", 109, @"identifier is too short : %@", v7 object file lineNumber description];

    if (a4) {
      goto LABEL_5;
    }
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"BSSharedMemoryStore.m", 110, @"Invalid parameter not satisfying: %@", @"dataClass" object file lineNumber description];

LABEL_5:
  v36.receiver = self;
  v36.super_class = (Class)BSSharedMemoryStore;
  v8 = [(BSSharedMemoryStore *)&v36 init];
  unint64_t v9 = v8;
  if (v8)
  {
    _initializePath((uint64_t)v8->_queue_path.path, v7);
    uint64_t v10 = [NSString stringWithUTF8String:&v9->_queue_path];
    basePath = v9->_basePath;
    v9->_basePath = (NSString *)v10;

    v12 = [@"com.apple.baseboard.shm-store:" stringByAppendingString:v9->_basePath];
    id v13 = +[BSDispatchQueueAttributes serial];
    int v14 = [v13 serviceClass:25];
    dispatch_queue_t v15 = BSDispatchQueueCreate(v12, v14);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v15;

    queue_data = v9->_queue_data;
    v9->_queue_data = 0;

    *(_DWORD *)&v9->_queue_lastState = 0x1000000;
    os_unfair_lock_lock((os_unfair_lock_t)&__allShmsLock);
    if ([(id)__allShms containsObject:v9->_basePath])
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v9, @"BSSharedMemoryStore.m", 127, @"%@: competing with another shm for the same buffers", v9->_basePath object file lineNumber description];
    }
    else
    {
      if (__allShms)
      {
        [(id)__allShms addObject:v9->_basePath];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithObject:v9->_basePath];
        uint64_t v20 = (void *)__allShms;
        __allShms = v19;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
    }
    v9->_queue_invalidated = 0;
    BOOL v21 = v9->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__BSSharedMemoryStore_initWithIdentifier_dataClass___block_invoke;
    block[3] = &unk_1E54458B8;
    v34 = v9;
    Class v35 = a4;
    dispatch_async(v21, block);
  }
  return v9;
}

void __52__BSSharedMemoryStore_initWithIdentifier_dataClass___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  __int16 v33 = 0;
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 24 + *(char *)(v2 + 56)) = 49;
  v4 = BSShmLoad((char *)(v2 + 24), *(void **)(a1 + 40), (BOOL *)&v33 + 1, &v33);
  __int16 v32 = 0;
  v5 = (char *)(*(void *)v3 + 24);
  v5[*(char *)(*(void *)v3 + 56)] = 50;
  v6 = BSShmLoad(v5, *(void **)(a1 + 40), (BOOL *)&v32 + 1, &v32);
  id v7 = v6;
  if (v4 && v6)
  {
    if (HIBYTE(v33) == HIBYTE(v32)) {
      goto LABEL_12;
    }
LABEL_6:
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v4);
    if (HIBYTE(v33)) {
      char v8 = 3;
    }
    else {
      char v8 = 1;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = v8;
    int v9 = 1;
    if ((_BYTE)v32)
    {
      int v10 = 0;
      goto LABEL_28;
    }
    goto LABEL_34;
  }
  if (v4) {
    goto LABEL_6;
  }
  if (!v6)
  {
    uint64_t v27 = *(void *)(a1 + 32);
    id v28 = *(void **)(v27 + 64);
    *(void *)(v27 + 64) = 0;

    char v12 = 0;
    int v9 = 0;
    int v11 = 1;
    goto LABEL_15;
  }
LABEL_12:
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v6);
  int v11 = 0;
  int v9 = 2;
  if (HIBYTE(v32)) {
    char v12 = 4;
  }
  else {
    char v12 = 2;
  }
LABEL_15:
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = v12;
  if ((_BYTE)v33)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(unsigned char *)(v13 + 24 + *(char *)(v13 + 56)) = 49;
    BSShmDelete((char *)(v13 + 24), 0);
    if ((_BYTE)v32) {
      char v14 = v11;
    }
    else {
      char v14 = 0;
    }
    if ((v14 & 1) == 0)
    {
      if ((v11 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if ((_BYTE)v32) {
    char v17 = v11;
  }
  else {
    char v17 = 0;
  }
  if ((v17 & 1) == 0)
  {
    if (v11)
    {
      dispatch_queue_t v15 = BSLogSharedMemory();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v35 = v20;
      BOOL v21 = "%@: initializing to nil";
      v22 = v15;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
      uint32_t v24 = 12;
LABEL_36:
      _os_log_impl(&dword_18AAA8000, v22, v23, v21, buf, v24);
      goto LABEL_37;
    }
LABEL_34:
    dispatch_queue_t v15 = BSLogSharedMemory();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_37;
    }
    uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v35 = v25;
    __int16 v36 = 1024;
    LODWORD(v37) = v9;
    BOOL v21 = "%@: restored from buffer %i";
    v22 = v15;
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
    uint32_t v24 = 18;
    goto LABEL_36;
  }
LABEL_27:
  int v10 = 1;
LABEL_28:
  uint64_t v18 = *(void *)(a1 + 32);
  *(unsigned char *)(v18 + 24 + *(char *)(v18 + 56)) = 50;
  BSShmDelete((char *)(v18 + 24), 0);
  if (!v10)
  {
LABEL_21:
    dispatch_queue_t v15 = BSLogSharedMemory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v35 = v16;
      __int16 v36 = 1024;
      LODWORD(v37) = v9;
      _os_log_error_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_ERROR, "%@: resolved to restore from buffer %i", buf, 0x12u);
    }
    goto LABEL_37;
  }
LABEL_29:
  dispatch_queue_t v15 = BSLogSharedMemory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v35 = v19;
    _os_log_fault_impl(&dword_18AAA8000, v15, OS_LOG_TYPE_FAULT, "%@: failed to restore from buffers", buf, 0xCu);
  }
LABEL_37:

  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    v26 = BSLogSharedMemory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v30 = *(void *)(v29 + 16);
      uint64_t v31 = *(void *)(v29 + 64);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v35 = v30;
      __int16 v36 = 2112;
      uint64_t v37 = v31;
      _os_log_debug_impl(&dword_18AAA8000, v26, OS_LOG_TYPE_DEBUG, "%@: loaded data = %@", buf, 0x16u);
    }
  }
}

- (void)dealloc
{
  if (!self->_queue_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"BSSharedMemoryStore.m" lineNumber:207 description:@"must invalidate before dealloc"];
  }
  v5.receiver = self;
  v5.super_class = (Class)BSSharedMemoryStore;
  [(BSSharedMemoryStore *)&v5 dealloc];
}

void __33__BSSharedMemoryStore_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 75))
  {
    *(unsigned char *)(v1 + 75) = 1;
    os_unfair_lock_lock((os_unfair_lock_t)&__allShmsLock);
    if ([(id)__allShms containsObject:*(void *)(*(void *)(a1 + 32) + 16)])
    {
      [(id)__allShms removeObject:*(void *)(*(void *)(a1 + 32) + 16)];
      if (![(id)__allShms count])
      {
        uint64_t v3 = (void *)__allShms;
        __allShms = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&__allShmsLock);
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
    }
  }
}

- (BSSharedMemoryStoreData)data
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__1;
  int v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__BSSharedMemoryStore_data__block_invoke;
  v5[3] = &unk_1E5445908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  uint64_t v3 = (void *)[(id)v7[5] copyWithZone:0];
  _Block_object_dispose(&v6, 8);

  return (BSSharedMemoryStoreData *)v3;
}

void __27__BSSharedMemoryStore_data__block_invoke(uint64_t a1)
{
}

- (void)setData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[v4 copyWithZone:0];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__BSSharedMemoryStore_setData___block_invoke;
  v8[3] = &unk_1E54456B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __31__BSSharedMemoryStore_setData___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v3 == v2 || (objc_msgSend(v3, "isEqual:") & 1) != 0) {
    return;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(unsigned __int8 *)(v4 + 72);
  if (!*(void *)(v4 + 64))
  {
    char v6 = 0;
    goto LABEL_7;
  }
  *(unsigned char *)(v4 + 24 + *(char *)(v4 + 56)) = 0x32313231u >> (8 * (v5 & 3));
  if (BSShmStore((char *)(v4 + 24), *(void **)(*(void *)(a1 + 32) + 64), (v5 >> 1) & 1, (unsigned char *)(*(void *)(a1 + 32) + 73)))
  {
    char v6 = (v5 & 3) + 1;
LABEL_7:
    id v7 = BSLogSharedMemory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(v16 + 16);
      uint64_t v18 = *(void *)(v16 + 64);
      int v22 = 138412546;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      _os_log_debug_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_DEBUG, "%@: stored data = %@", (uint8_t *)&v22, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = v6;
    uint64_t v8 = *(char **)(a1 + 32);
    if (v8[73] == 1)
    {
      v8[73] = 0;
      id v9 = BSLogSharedMemory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        unint64_t v20 = 0x3231323100uLL >> (8 * v5);
        if (v5 >= 5) {
          LOBYTE(v20) = 0;
        }
        *(unsigned char *)(v19 + 24 + *(char *)(v19 + 56)) = v20;
        int v22 = 136315138;
        uint64_t v23 = v19 + 24;
        _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, "%s: simulating failure to purge old buffer", (uint8_t *)&v22, 0xCu);
      }
LABEL_11:

      return;
    }
    if (v5)
    {
      int v10 = v8 + 24;
      unint64_t v11 = 0x3231323100uLL >> (8 * v5);
      if (v5 >= 5) {
        LOBYTE(v11) = 0;
      }
      v10[v8[56]] = v11;
      BSShmDelete(v10, 0);
    }
    return;
  }
  if (v5)
  {
    id v9 = BSLogSharedMemory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 16);
      int v22 = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_FAULT, "%@: data desynced with shm", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_11;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  os_log_type_t v13 = OS_LOG_TYPE_INFO;
  if (!*(unsigned char *)(v12 + 74))
  {
    *(unsigned char *)(v12 + 74) = 1;
    os_log_type_t v13 = OS_LOG_TYPE_FAULT;
  }
  char v14 = BSLogSharedMemory();
  if (os_log_type_enabled(v14, v13))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16);
    int v22 = 138412290;
    uint64_t v23 = v15;
    _os_log_impl(&dword_18AAA8000, v14, v13, "%@: failed to write new workspace connections state to shm - are we sandboxed?", (uint8_t *)&v22, 0xCu);
  }
}

uint64_t __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke(void *a1, const void *a2, size_t a3)
{
  char v6 = (void *)a1[4];
  id v7 = [MEMORY[0x1E4F29060] currentThread];

  if (v6 != v7)
  {
    os_log_type_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    char v14 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke"];
    [v13 handleFailureInFunction:v14 file:@"BSSharedMemoryStore.m" lineNumber:299 description:@"writeBlock cannot be called on a different thread"];
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke"];
    [v15 handleFailureInFunction:v16 file:@"BSSharedMemoryStore.m" lineNumber:300 description:@"writeBlock must be called in scope"];
  }
  unint64_t v8 = a1[8];
  size_t v9 = v8 - a3;
  if (v8 >= a3 && (size_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy((void *)(a1[9] + v10), a2, a3);
      *(void *)(*(void *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    unint64_t v11 = __error();
    uint64_t result = 0;
    int *v11 = 28;
  }
  return result;
}

uint64_t __69__BSSharedMemoryStore_deserializeDataOfClass_withSerializedFromData___block_invoke_60(void *a1, void *a2, size_t a3)
{
  if (!a2)
  {
    os_log_type_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    char v14 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke"];
    [v13 handleFailureInFunction:v14 file:@"BSSharedMemoryStore.m" lineNumber:328 description:@"buf cannot be nil"];
  }
  char v6 = (void *)a1[4];
  id v7 = [MEMORY[0x1E4F29060] currentThread];

  if (v6 != v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke"];
    [v15 handleFailureInFunction:v16 file:@"BSSharedMemoryStore.m" lineNumber:329 description:@"readBlock cannot be called on a different thread"];
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"+[BSSharedMemoryStore deserializeDataOfClass:withSerializedFromData:]_block_invoke"];
    [v17 handleFailureInFunction:v18 file:@"BSSharedMemoryStore.m" lineNumber:330 description:@"readBlock must be called in scope"];
  }
  unint64_t v8 = a1[8];
  size_t v9 = v8 - a3;
  if (v8 >= a3 && (size_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24), v10 <= v9))
  {
    if (a3)
    {
      memcpy(a2, (const void *)(a1[9] + v10), a3);
      *(void *)(*(void *)(a1[6] + 8) + 24) += a3;
    }
    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    unint64_t v11 = __error();
    uint64_t result = 0;
    int *v11 = 14;
  }
  return result;
}

- (unsigned)_lastState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BSSharedMemoryStore__lastState__block_invoke;
  v5[3] = &unk_1E5445908;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__BSSharedMemoryStore__lastState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)_setFailureModeForNextWrite:(unsigned __int8)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__BSSharedMemoryStore__setFailureModeForNextWrite___block_invoke;
  v4[3] = &unk_1E5445980;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async_and_wait(queue, v4);
}

uint64_t __51__BSSharedMemoryStore__setFailureModeForNextWrite___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 73) = *(unsigned char *)(result + 40);
  return result;
}

+ (void)_unlinkAllForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = (objc_class *)objc_opt_class();
      char v9 = NSStringFromClass(v8);
      *(_DWORD *)long long buf = 138544642;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = a1;
      __int16 v15 = 2114;
      uint64_t v16 = @"BSSharedMemoryStore.m";
      __int16 v17 = 1024;
      int v18 = 393;
      __int16 v19 = 2114;
      unint64_t v20 = v6;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v6 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0424CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    size_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = (objc_class *)objc_opt_class();
      os_log_type_t v13 = NSStringFromClass(v12);
      *(_DWORD *)long long buf = 138544642;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = a1;
      __int16 v15 = 2114;
      uint64_t v16 = @"BSSharedMemoryStore.m";
      __int16 v17 = 1024;
      int v18 = 393;
      __int16 v19 = 2114;
      unint64_t v20 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AB04350);
  }

  LOBYTE(v15) = 0;
  memset(buf, 0, sizeof(buf));
  _initializePath((uint64_t)buf, v5);
  buf[(char)v15] = 49;
  BSShmDelete((char *)buf, 1);
  buf[(char)v15] = 50;
  BSShmDelete((char *)buf, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_data, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end