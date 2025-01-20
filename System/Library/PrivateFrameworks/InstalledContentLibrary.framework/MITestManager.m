@interface MITestManager
+ (id)sharedInstance;
- (BOOL)_onQueue_clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4;
- (BOOL)_onQueue_setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4;
- (BOOL)clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4;
- (BOOL)isRunningInTestMode:(BOOL *)a3 outError:(id *)a4;
- (BOOL)setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4;
- (BOOL)testFlagsAreSet:(unint64_t)a3;
- (MITestManager)init;
- (NSMutableDictionary)sourceForPID;
- (OS_dispatch_queue)testModeQueue;
- (id)_testModeSentinelURL;
- (unint64_t)testFlags;
- (void)_onQueue_clearTestFlags:(unint64_t)a3;
- (void)_onQueue_setTestFlags:(unint64_t)a3;
- (void)clearTestFlags:(unint64_t)a3;
- (void)setSourceForPID:(id)a3;
- (void)setTestFlags:(unint64_t)a3;
- (void)setTestModeQueue:(id)a3;
@end

@implementation MITestManager

- (MITestManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MITestManager;
  v2 = [(MITestManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installd.testMode", v3);
    [(MITestManager *)v2 setTestModeQueue:v4];

    v5 = objc_opt_new();
    [(MITestManager *)v2 setSourceForPID:v5];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MITestManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __31__MITestManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (id)_testModeSentinelURL
{
  v2 = +[MIDaemonConfiguration sharedInstance];
  v3 = [v2 dataDirectory];
  dispatch_queue_t v4 = [v3 URLByAppendingPathComponent:@"sMITestMode" isDirectory:0];

  return v4;
}

- (BOOL)isRunningInTestMode:(BOOL *)a3 outError:(id *)a4
{
  v6 = +[MIDaemonConfiguration sharedInstance];
  int v7 = [v6 hasInternalContent];

  if (v7)
  {
    v8 = [(MITestManager *)self _testModeSentinelURL];
    v9 = +[MIFileManager defaultManager];
    char v10 = [v9 itemExistsAtURL:v8];

    if (!a3) {
      return 1;
    }
    goto LABEL_5;
  }
  char v10 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v10;
  return 1;
}

- (BOOL)_onQueue_setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = [(MITestManager *)self testModeQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(MITestManager *)self _testModeSentinelURL];
  id v28 = 0;
  char v9 = [&stru_1F16FEFE8 writeToURL:v8 atomically:1 encoding:4 error:&v28];
  id v10 = v28;
  if (v9)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v19 = [v8 path];
      MOLogWrite();
    }
    v11 = [(MITestManager *)self sourceForPID];
    v12 = [NSNumber numberWithInt:v5];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13)
    {
      objc_initWeak(&location, self);
      v14 = [(MITestManager *)self testModeQueue];
      v15 = dispatch_source_create(MEMORY[0x1E4F14470], (int)v5, 0x80000000uLL, v14);

      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke;
      handler[3] = &unk_1E62E7308;
      objc_copyWeak(&v25, &location);
      int v26 = v5;
      dispatch_source_set_event_handler(v15, handler);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke_2;
      v21[3] = &unk_1E62E7308;
      objc_copyWeak(&v22, &location);
      int v23 = v5;
      dispatch_source_set_cancel_handler(v15, v21);
      v16 = [(MITestManager *)self sourceForPID];
      v17 = [NSNumber numberWithInt:v5];
      [v16 setObject:v15 forKeyedSubscript:v17];

      dispatch_activate(v15);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v20 = [v8 path];
      MOLogWrite();
    }
    if (a4) {
      *a4 = v10;
    }
  }

  return v9;
}

void __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v6 = *(unsigned int *)(a1 + 40);
      MOLogWrite();
    }
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    id v7 = 0;
    char v4 = objc_msgSend(WeakRetained, "_onQueue_clearIsRunningInTestModeForProcessWithPID:withError:", v3, &v7, v6);
    id v5 = v7;
    if ((v4 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }
  }
}

void __76__MITestManager__onQueue_setIsRunningInTestModeForProcessWithPID_withError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained sourceForPID];
    char v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v3 setObject:0 forKeyedSubscript:v4];

    id WeakRetained = v5;
  }
}

- (BOOL)setIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__6;
  int v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  id v7 = +[MIDaemonConfiguration sharedInstance];
  char v8 = [v7 hasInternalContent];

  if (v8)
  {
    id v10 = [(MITestManager *)self testModeQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__67__MITestManager_setIsRunningInTestModeForProcessWithPID_withError___block_invoke;
    v17[3] = (uint64_t)&unk_1E62E7330;
    v17[4] = (uint64_t)self;
    v17[5] = (uint64_t)&v25;
    int v18 = a3;
    v17[6] = (uint64_t)&v19;
    dispatch_sync(v10, v17);

    v11 = v26;
    if (*((unsigned char *)v26 + 24)) {
      *((unsigned char *)v26 + 24) = 1;
    }
  }
  else
  {
    uint64_t v12 = _CreateError((uint64_t)"-[MITestManager setIsRunningInTestModeForProcessWithPID:withError:]", 151, @"MIInstallerErrorDomain", 157, 0, 0, @"Missing required internal content variant", v9, v17[0]);
    v13 = (void *)v20[5];
    v20[5] = v12;

    v11 = v26;
  }
  int v14 = *((unsigned __int8 *)v11 + 24);
  if (a4 && !v14)
  {
    *a4 = (id) v20[5];
    int v14 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __67__MITestManager_setIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "_onQueue_setIsRunningInTestModeForProcessWithPID:withError:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (BOOL)_onQueue_clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [(MITestManager *)self testModeQueue];
  dispatch_assert_queue_V2(v7);

  char v8 = [(MITestManager *)self sourceForPID];
  uint64_t v9 = [NSNumber numberWithInt:v5];
  id v10 = [v8 objectForKeyedSubscript:v9];

  v11 = +[MIFileManager defaultManager];
  uint64_t v12 = [(MITestManager *)self _testModeSentinelURL];
  id v18 = 0;
  char v13 = [v11 removeItemAtURL:v12 error:&v18];
  id v14 = v18;
  if (v13)
  {
    [(MITestManager *)self _onQueue_clearTestFlags:-1];
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v17 = [v12 path];
    MOLogWrite();
  }
  if (v10) {
    dispatch_source_cancel(v10);
  }
  if (a4) {
    char v15 = v13;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v14;
  }

  return v13;
}

- (BOOL)clearIsRunningInTestModeForProcessWithPID:(int)a3 withError:(id *)a4
{
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__6;
  int v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = +[MIDaemonConfiguration sharedInstance];
  char v8 = [v7 hasInternalContent];

  if (v8)
  {
    id v10 = [(MITestManager *)self testModeQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__69__MITestManager_clearIsRunningInTestModeForProcessWithPID_withError___block_invoke;
    v16[3] = (uint64_t)&unk_1E62E7330;
    v16[4] = (uint64_t)self;
    v16[5] = (uint64_t)&v18;
    int v17 = a3;
    v16[6] = (uint64_t)&v22;
    dispatch_sync(v10, v16);

    int v11 = *((unsigned __int8 *)v19 + 24);
    if (*((unsigned char *)v19 + 24))
    {
      int v11 = 1;
      *((unsigned char *)v19 + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v12 = _CreateError((uint64_t)"-[MITestManager clearIsRunningInTestModeForProcessWithPID:withError:]", 213, @"MIInstallerErrorDomain", 157, 0, 0, @"Missing required internal content variant", v9, v16[0]);
    char v13 = (void *)v23[5];
    v23[5] = v12;

    int v11 = *((unsigned __int8 *)v19 + 24);
  }
  if (a4 && !v11)
  {
    *a4 = (id) v23[5];
    int v11 = *((unsigned __int8 *)v19 + 24);
  }
LABEL_8:
  BOOL v14 = v11 != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __69__MITestManager_clearIsRunningInTestModeForProcessWithPID_withError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "_onQueue_clearIsRunningInTestModeForProcessWithPID:withError:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (void)_onQueue_setTestFlags:(unint64_t)a3
{
  char v5 = [(MITestManager *)self testModeQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t testFlags = self->_testFlags;
  self->_unint64_t testFlags = testFlags | a3;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
  if ((a3 & 1) != 0 && (testFlags & 1) == 0)
  {
    MIReduceAvailableMemoryForValidationForTesting();
  }
}

- (void)setTestFlags:(unint64_t)a3
{
  char v5 = [(MITestManager *)self testModeQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MITestManager_setTestFlags___block_invoke;
  v6[3] = &unk_1E62E7358;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __30__MITestManager_setTestFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setTestFlags:", *(void *)(a1 + 40));
}

- (void)_onQueue_clearTestFlags:(unint64_t)a3
{
  char v5 = [(MITestManager *)self testModeQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t testFlags = self->_testFlags;
  self->_unint64_t testFlags = testFlags & ~a3;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
    MOLogWrite();
  }
  if (a3 & 1) != 0 && (testFlags)
  {
    MIRestoreAvailableMemoryForValidationAfterTesting();
  }
}

- (void)clearTestFlags:(unint64_t)a3
{
  char v5 = [(MITestManager *)self testModeQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MITestManager_clearTestFlags___block_invoke;
  v6[3] = &unk_1E62E7358;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __32__MITestManager_clearTestFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTestFlags:", *(void *)(a1 + 40));
}

- (BOOL)testFlagsAreSet:(unint64_t)a3
{
  uint64_t v4 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  char v5 = [(MITestManager *)self testModeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MITestManager_testFlagsAreSet___block_invoke;
  block[3] = &unk_1E62E7380;
  void block[5] = &v8;
  block[6] = a3;
  block[4] = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

uint64_t __33__MITestManager_testFlagsAreSet___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) testFlags];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == (*(void *)(a1 + 48) & result);
  return result;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (OS_dispatch_queue)testModeQueue
{
  return self->_testModeQueue;
}

- (void)setTestModeQueue:(id)a3
{
}

- (NSMutableDictionary)sourceForPID
{
  return self->_sourceForPID;
}

- (void)setSourceForPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceForPID, 0);
  objc_storeStrong((id *)&self->_testModeQueue, 0);
}

@end