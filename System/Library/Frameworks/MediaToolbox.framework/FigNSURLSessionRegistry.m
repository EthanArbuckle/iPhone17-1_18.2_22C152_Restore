@interface FigNSURLSessionRegistry
- (FigNSURLSessionRegistry)init;
- (void)_checkForDoom:(id)a3;
- (void)copySessionAndAssertionForClientBundleIdentifier:(id)a3 clientPersonaIdentifier:(id)a4 dispatchQueue:(id)a5 outSession:(id *)a6 outAssertion:(FigOpaqueAssertion *)a7;
- (void)dealloc;
- (void)releaseSession:(id)a3;
@end

@implementation FigNSURLSessionRegistry

- (void)copySessionAndAssertionForClientBundleIdentifier:(id)a3 clientPersonaIdentifier:(id)a4 dispatchQueue:(id)a5 outSession:(id *)a6 outAssertion:(FigOpaqueAssertion *)a7
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = __Block_byref_object_copy__9;
  v15[4] = __Block_byref_object_dispose__9;
  v15[5] = 0;
  if (figNSURLSessionRegistryEnsureGlobalInit_sFigNSURLSessionInit != -1) {
    dispatch_once(&figNSURLSessionRegistryEnsureGlobalInit_sFigNSURLSessionInit, &__block_literal_global_88);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke;
  block[3] = &unk_1E57A5E08;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = v15;
  block[9] = a7;
  block[10] = a6;
  dispatch_sync(workQueue, block);
  _Block_object_dispose(v15, 8);
}

void __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke(uint64_t a1)
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke_2;
  v4[3] = &unk_1E57A5DE0;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  v7 = v10;
  uint64_t v8 = v3;
  v9 = &v12;
  [v2 enumerateObjectsUsingBlock:v4];
  if (!*((_DWORD *)v13 + 6))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [[FigNSURLSession alloc] initWithClientBundleIdentifier:*(void *)(a1 + 40) clientPersonaIdentifier:*(void *)(a1 + 48) dispatchQueue:*(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  **(void **)(a1 + 72) = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) acquireAssertion];
  **(void **)(a1 + 80) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
}

void __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke_2(void *a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    if (objc_msgSend((id)objc_msgSend(a2, "clientBundleIdentifier"), "isEqual:", a1[4]))
    {
      if (((objc_msgSend((id)objc_msgSend(a2, "clientPersonaIdentifier"), "isEqual:", a1[5]) & 1) != 0
         || ![a2 clientPersonaIdentifier] && !a1[5])
        && [a2 dispatchQueue] == a1[6])
      {
        id v4 = a2;

        *(void *)(*(void *)(a1[8] + 8) + 40) = a2;
        ++*(_DWORD *)(*(void *)(a1[9] + 8) + 24);
      }
    }
  }
}

- (void)_checkForDoom:(id)a3
{
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if ((int)[a3 assertionCount] <= 0 && objc_msgSend(a3, "doomTime"))
  {
    if (UpTimeNanoseconds < [a3 doomTime])
    {
      int64_t v6 = [a3 doomTime] - UpTimeNanoseconds;
      [a3 setDoomCheckScheduled:1];
      v7 = self;
      id v8 = a3;
      dispatch_time_t v9 = dispatch_time(0, v6);
      workQueue = self->_workQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __41__FigNSURLSessionRegistry__checkForDoom___block_invoke;
      v11[3] = &unk_1E57955D0;
      v11[4] = self;
      v11[5] = a3;
      dispatch_after(v9, workQueue, v11);
      return;
    }
    [a3 releaseOSTransaction];
    [(NSMutableArray *)self->_sessionArray removeObject:a3];
  }

  [a3 setDoomCheckScheduled:0];
}

void __41__FigNSURLSessionRegistry__checkForDoom___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkForDoom:*(void *)(a1 + 40)];

  v2 = *(void **)(a1 + 32);
}

- (void)releaseSession:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__FigNSURLSessionRegistry_releaseSession___block_invoke;
  v7[3] = &unk_1E57955D0;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async(workQueue, v7);
}

void __42__FigNSURLSessionRegistry_releaseSession___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssertionCount:", objc_msgSend(*(id *)(a1 + 32), "assertionCount") - 1);
  if ((int)[*(id *)(a1 + 32) assertionCount] <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDoomTime:", FigGetUpTimeNanoseconds() + 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "deferReleaseSeconds"));
    if (([*(id *)(a1 + 32) doomCheckScheduled] & 1) == 0)
    {
      [*(id *)(a1 + 32) setDoomCheckScheduled:1];
      if ((int)[*(id *)(a1 + 32) deferReleaseSeconds] >= 1
        && [*(id *)(a1 + 32) acquireOSTransaction])
      {
        id v2 = *(id *)(a1 + 40);
        id v3 = *(id *)(a1 + 32);
        dispatch_time_t v4 = dispatch_time(0, 1000000000 * (int)[*(id *)(a1 + 32) deferReleaseSeconds]);
        uint64_t v5 = *(void *)(a1 + 40);
        int64_t v6 = *(NSObject **)(v5 + 8);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __42__FigNSURLSessionRegistry_releaseSession___block_invoke_2;
        v8[3] = &unk_1E57955D0;
        uint64_t v7 = *(void *)(a1 + 32);
        v8[4] = v5;
        v8[5] = v7;
        dispatch_after(v4, v6, v8);
      }
      else
      {
        [*(id *)(a1 + 40) _checkForDoom:*(void *)(a1 + 32)];
      }
    }
  }
}

void __42__FigNSURLSessionRegistry_releaseSession___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkForDoom:*(void *)(a1 + 40)];

  id v2 = *(void **)(a1 + 32);
}

- (FigNSURLSessionRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)FigNSURLSessionRegistry;
  id v2 = [(FigNSURLSessionRegistry *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.coremedia.fignsurlsessionregistry.work", 0);
    v2->_workQueue = (OS_dispatch_queue *)v3;
    if (!v3 || (dispatch_time_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]), (v2->_sessionArray = v4) == 0))
    {
      if (FigSignalErrorAt())
      {

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  workQueue = self->_workQueue;
  if (workQueue) {
    dispatch_release(workQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigNSURLSessionRegistry;
  [(FigNSURLSessionRegistry *)&v4 dealloc];
}

@end