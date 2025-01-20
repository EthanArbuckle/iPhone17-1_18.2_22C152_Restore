@interface LiveFSAppleDoubleManager
+ (BOOL)isDotUnderBarFileName:(id)a3;
+ (id)AppleDoubleManagerForMount:(id)a3;
- (BOOL)enumerateDirectory:(id)a3 intoArray:(id)a4;
- (BOOL)scrubDirectoryNamed:(id)a3 inDirectory:(id)a4;
- (LiveFSAppleDoubleManager)initWithMount:(id)a3;
- (LiveFSVolume)mount;
- (OS_dispatch_queue)queue;
- (id)AppleDoubleForNamespaceWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5;
- (id)AppleDoubleForPurpose:(int)a3 withBaseFile:(id)a4 named:(id)a5 inDirectory:(id)a6;
- (id)AppleDoubleForReadingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5;
- (id)AppleDoubleForWritingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5;
- (id)AppleDoubleNameForFileNamed:(id)a3;
- (unint64_t)clientID;
- (void)dealloc;
- (void)setClientID:(unint64_t)a3;
- (void)setMount:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation LiveFSAppleDoubleManager

+ (id)AppleDoubleManagerForMount:(id)a3
{
  id v3 = a3;
  v4 = [[LiveFSAppleDoubleManager alloc] initWithMount:v3];

  return v4;
}

- (LiveFSAppleDoubleManager)initWithMount:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LiveFSAppleDoubleManager;
  v5 = [(LiveFSAppleDoubleManager *)&v14 init];
  if (v5)
  {
    id v13 = 0;
    uint64_t v6 = [v4 newConnectionIDOrError:&v13];
    id v7 = v13;
    [(LiveFSAppleDoubleManager *)v5 setClientID:v6];
    if ([(LiveFSAppleDoubleManager *)v5 clientID])
    {
      [(LiveFSAppleDoubleManager *)v5 setMount:v4];
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.LiveFSAppleDoubleManager", 0);
      [(LiveFSAppleDoubleManager *)v5 setQueue:v8];

      v9 = [(LiveFSAppleDoubleManager *)v5 queue];
      dispatch_activate(v9);

      uint64_t v10 = [MEMORY[0x263EFF9C0] set];
      ADActiveForBaseHandleSet = v5->_ADActiveForBaseHandleSet;
      v5->_ADActiveForBaseHandleSet = (NSMutableSet *)v10;

      pthread_rwlock_init(&v5->_ADActiveForBaseHandleSetRWLock, 0);
      pthread_mutex_init(&v5->_ADActiveForBaseHandleSetMutex, 0);
      pthread_cond_init(&v5->_ADActiveForBaseHandleSetCond, 0);
      v5->_ADAcctiveForBaseHandleSetWaiters = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  [v0 clientID];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_23AB0B000, v1, v2, "ADM:dealoc[%s]:start:[0x%llx]", v3, v4, v5, v6, 2u);
}

- (id)AppleDoubleNameForFileNamed:(id)a3
{
  return (id)[NSString stringWithFormat:@"._%@", a3];
}

- (id)AppleDoubleForReadingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(LiveFSAppleDoubleManager *)self acquireForBaseFile:v8];
  v11 = [[LiveFSAppleDouble alloc] initWithManager:self baseFileHandle:v8 name:v10 andDirectoryHandle:v9 andPurpose:0];

  if (!v11) {
    [(LiveFSAppleDoubleManager *)self releaseForBaseFile:v8];
  }

  return v11;
}

- (id)AppleDoubleForWritingWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(LiveFSAppleDoubleManager *)self acquireForBaseFile:v8];
  v11 = [[LiveFSAppleDouble alloc] initWithManager:self baseFileHandle:v8 name:v10 andDirectoryHandle:v9 andPurpose:1];

  if (!v11) {
    [(LiveFSAppleDoubleManager *)self releaseForBaseFile:v8];
  }

  return v11;
}

- (id)AppleDoubleForNamespaceWithBaseFile:(id)a3 named:(id)a4 inDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(LiveFSAppleDoubleManager *)self acquireForBaseFile:v8];
  v11 = [[LiveFSAppleDouble alloc] initWithManager:self baseFileHandle:v8 name:v10 andDirectoryHandle:v9 andPurpose:2];

  if (!v11) {
    [(LiveFSAppleDoubleManager *)self releaseForBaseFile:v8];
  }

  return v11;
}

- (id)AppleDoubleForPurpose:(int)a3 withBaseFile:(id)a4 named:(id)a5 inDirectory:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  if (v8 > 2)
  {
    id v13 = 0;
  }
  else
  {
    id v11 = a6;
    id v12 = a5;
    [(LiveFSAppleDoubleManager *)self acquireForBaseFile:v10];
    id v13 = [[LiveFSAppleDouble alloc] initWithManager:self baseFileHandle:v10 name:v12 andDirectoryHandle:v11 andPurpose:v8];

    if (!v13) {
      [(LiveFSAppleDoubleManager *)self releaseForBaseFile:v10];
    }
  }

  return v13;
}

- (BOOL)enumerateDirectory:(id)a3 intoArray:(id)a4
{
  id v12 = a3;
  id v13 = a4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSAppleDoubleManager enumerateDirectory:intoArray:]();
  }

  while (!*((unsigned char *)v29 + 24))
  {
    uint64_t v8 = [(LiveFSAppleDoubleManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke;
    block[3] = &unk_264DC7CE8;
    v18 = v23;
    block[4] = self;
    id v15 = v12;
    v19 = v22;
    v20 = &v28;
    v21 = &v24;
    id v16 = v13;
    v17 = v6;
    dispatch_sync(v8, block);
  }
  id v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSAppleDoubleManager enumerateDirectory:intoArray:]();
  }

  char v10 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke(uint64_t a1)
{
  uint64_t v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) mount];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(v5 + 8) + 24);
  v9[0] = MEMORY[0x263EF8330];
  long long v7 = *(_OWORD *)(a1 + 72);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v9[1] = 3221225472;
  v9[2] = __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7;
  v9[3] = &unk_264DC7CC0;
  long long v12 = v7;
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v14 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v3 readDirectory:v4 amount:0x10000 cookie:v6 verifier:v8 requestID:-1 reply:v9];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_5();
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a4;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (a2 != -1001) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    goto LABEL_9;
  }
  uint64_t v10 = [v8 bytes];
  id v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_4(v10, v11, v12);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    while (1)
    {
      unsigned int v13 = *(unsigned __int16 *)(v10 + 18);
      if (v13 < 3 || *(unsigned char *)(v10 + 21) != 46 || *(unsigned char *)(v10 + 22) != 95 || *(unsigned char *)(v10 + 20) != 1) {
        break;
      }
      uint64_t v14 = livefs_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_3(&v19, v20);
      }

      id v15 = [NSString stringWithUTF8String:v10 + 21];
      [*(id *)(a1 + 32) addObject:v15];
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(v10 + 8);
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == -1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
      else
      {
        if (!*(_WORD *)(v10 + 16))
        {

          goto LABEL_9;
        }
        v10 += *(unsigned __int16 *)(v10 + 16);
      }

LABEL_33:
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        goto LABEL_9;
      }
    }
    if (v13 == 2)
    {
      if (*(unsigned char *)(v10 + 21) == 46)
      {
        int v16 = *(unsigned __int8 *)(v10 + 22);
LABEL_24:
        if (v16 == 46)
        {
          v17 = livefs_std_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_2(&v23, v24);
          }

          if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == -1)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          }
          else
          {
            if (!*(_WORD *)(v10 + 16)) {
              goto LABEL_9;
            }
            v10 += *(unsigned __int16 *)(v10 + 16);
          }
          goto LABEL_33;
        }
      }
    }
    else if (v13 == 1)
    {
      int v16 = *(unsigned __int8 *)(v10 + 21);
      goto LABEL_24;
    }
    v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_1(&v21, v22);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_33;
  }
LABEL_9:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)scrubDirectoryNamed:(id)a3 inDirectory:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  id v54 = 0;
  id v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:].cold.4();
  }

  uint64_t v10 = [(LiveFSAppleDoubleManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke;
  block[3] = &unk_264DC7D38;
  block[4] = self;
  id v24 = v7;
  id v45 = v24;
  id v25 = v6;
  id v46 = v25;
  v48 = &v49;
  uint64_t v26 = v8;
  v47 = v26;
  dispatch_sync(v10, block);

  if (v50[5])
  {
    char v23 = [MEMORY[0x263EFF980] array];
    if (-[LiveFSAppleDoubleManager enumerateDirectory:intoArray:](self, "enumerateDirectory:intoArray:", v50[5]))
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v11 = v23;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v55 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v36 = 0;
            v37 = &v36;
            uint64_t v38 = 0x2020000000;
            int v39 = 0;
            int v16 = [(LiveFSAppleDoubleManager *)self queue];
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_13;
            v32[3] = &unk_264DC7DB0;
            v32[4] = self;
            v32[5] = v15;
            v34 = &v49;
            v35 = &v36;
            v33 = v26;
            dispatch_sync(v16, v32);

            LOBYTE(v15) = *((_DWORD *)v37 + 6) == 0;
            _Block_object_dispose(&v36, 8);
            if ((v15 & 1) == 0)
            {
              BOOL v17 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v55 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v17 = 1;
LABEL_19:
    }
    else
    {
      BOOL v17 = 0;
    }
    char v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:]();
    }

    v20 = [(LiveFSAppleDoubleManager *)self queue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15;
    v27[3] = &unk_264DC7DD8;
    id v28 = v25;
    v29 = self;
    char v31 = &v49;
    uint64_t v30 = v26;
    dispatch_sync(v20, v27);

    char v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:]();
    }

    v18 = v23;
  }
  else
  {
    v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSAppleDoubleManager scrubDirectoryNamed:inDirectory:]();
    }
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v49, 8);
  return v17;
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke(uint64_t a1)
{
  uint64_t v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) mount];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) clientID];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_10;
  v9[3] = &unk_264DC7D10;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v8;
  long long v10 = v8;
  [v3 lookupin:v5 name:v4 forClient:v6 usingFlags:0 requestID:-1 reply:v9];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_10(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!a2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mount];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) clientID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 32);
  v8[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_2;
  v8[3] = &unk_264DC7D88;
  uint64_t v11 = *(void *)(a1 + 64);
  id v6 = (id)v7;
  long long v10 = v7;
  [v2 lookupin:v3 name:v4 forClient:v5 usingFlags:0 requestID:-1 reply:v8];
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    long long v7 = [*(id *)(a1 + 32) mount];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_3;
    v10[3] = &unk_264DC7D60;
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v7 removeItem:v6 from:v8 named:v9 usingFlags:0 requestID:-1 reply:v10];
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_3(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) mount];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = [*(id *)(a1 + 40) clientID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_16;
  v6[3] = &unk_264DC78B0;
  id v7 = *(id *)(a1 + 48);
  [v3 reclaim:v4 forClient:v5 requestID:-1 reply:v6];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_16(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isDotUnderBarFileName:(id)a3
{
  return [a3 hasPrefix:@"._"];
}

- (LiveFSVolume)mount
{
  return (LiveFSVolume *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMount:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unint64_t)a3
{
  self->_clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->mount, 0);

  objc_storeStrong((id *)&self->_ADActiveForBaseHandleSet, 0);
}

- (void)enumerateDirectory:intoArray:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_23AB0B000, v1, OS_LOG_TYPE_DEBUG, "ADM: enumerateDirectory:intoArray: returning %d with [%@]", v2, 0x12u);
}

- (void)enumerateDirectory:intoArray:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_23AB0B000, v0, v1, "ADM: enumarateDirectory:intoArray: starting on %s", v2, v3, v4, v5, v6);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_23AB0B000, v0, v1, "ADM: enumarateDirectory:intoArray: starting READDIR on %s for cookie %#llx", v2, v3, v4, v5, v6);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_13(&dword_23AB0B000, v2, v3, "ADM: enumarateDirectory:intoArray: found non ._ entry, we are done", v4);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_13(&dword_23AB0B000, v2, v3, "ADM: enumarateDirectory:intoArray: skipping over . or ..", v4);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_16(a1, a2);
  OUTLINED_FUNCTION_13(&dword_23AB0B000, v2, v3, "ADM: enumarateDirectory:intoArray: add ._ into array", v4);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = a1 + 21;
  OUTLINED_FUNCTION_8(&dword_23AB0B000, a2, a3, "ADM: enumarateDirectory:intoArray: direntry: %s", (uint8_t *)&v3);
}

void __57__LiveFSAppleDoubleManager_enumerateDirectory_intoArray___block_invoke_7_cold_5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_23AB0B000, v0, v1, "ADM: enumarateDirectory:intoArray: processing READDIR results on %s", v2, v3, v4, v5, v6);
}

- (void)scrubDirectoryNamed:inDirectory:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: asked to scrub %@, but it's not there!", v2);
}

- (void)scrubDirectoryNamed:inDirectory:.cold.2()
{
  dispatch_queue_get_label(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: finish on %s for %@/%@", v2, v3, v4, v5, v6);
}

- (void)scrubDirectoryNamed:inDirectory:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: done with the to scrub %@", v2);
}

- (void)scrubDirectoryNamed:inDirectory:.cold.4()
{
  dispatch_queue_get_label(0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_17(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: start on %s for %@/%@", v2, v3, v4, v5, v6);
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: doing lookup on %s", v2, v3, v4, v5, v6);
}

void __60__LiveFSAppleDoubleManager_scrubDirectoryNamed_inDirectory___block_invoke_15_cold_1()
{
  dispatch_queue_get_label(0);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_23AB0B000, v0, v1, "ADM: scrubDirectoryNamed: reclaiming state for %@ on %s", v2, v3, v4, v5, 2u);
}

@end