@interface FBSApplicationPlaceholder
+ (id)_callOutQueue;
+ (id)_sharedQueue;
- (BOOL)_canPerformAction:(unint64_t)a3;
- (BOOL)_performAction:(unint64_t)a3 withResult:(id)a4;
- (BOOL)_queue_canPerformAction:(unint64_t)a3;
- (BOOL)_queue_isCloudDemoted;
- (BOOL)cancel;
- (BOOL)cancelWithResult:(id)a3;
- (BOOL)isCancellable;
- (BOOL)isPausable;
- (BOOL)isPrioritizable;
- (BOOL)isRestricted;
- (BOOL)isResumable;
- (BOOL)pause;
- (BOOL)pauseWithResult:(id)a3;
- (BOOL)prioritize;
- (BOOL)prioritizeWithResult:(id)a3;
- (BOOL)resume;
- (BOOL)resumeWithResult:(id)a3;
- (FBSApplicationLibrary)appLibrary;
- (FBSApplicationPlaceholderProgress)progress;
- (LSApplicationIdentity)applicationIdentity;
- (LSApplicationProxy)_proxy;
- (double)percentComplete;
- (id)_initWithApplicationProxy:(id)a3 identity:(id)a4;
- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4;
- (id)_initWithBundleProxy:(id)a3 url:(id)a4;
- (id)succinctDescriptionBuilder;
- (unint64_t)_queue_supportedActions;
- (unint64_t)expectedFinalInstallPhase;
- (unint64_t)installPhase;
- (unint64_t)installState;
- (unint64_t)installType;
- (void)_cancelWithResult:(id)a3;
- (void)_dispatchToObserversWithBlock:(id)a3;
- (void)_noteChangedSignificantly;
- (void)_pauseWithResult:(id)a3;
- (void)_prioritizeWithResult:(id)a3;
- (void)_queue_noteChangedSignificantly:(id)a3;
- (void)_queue_setProxy:(id)a3 force:(BOOL)a4;
- (void)_reloadProgress;
- (void)_resumeWithResult:(id)a3;
- (void)_sendToObserversPlaceholderDidChangeSignificantly;
- (void)_sendToObserversPlaceholderProgressDidUpdate;
- (void)_setProxy:(id)a3;
- (void)_setProxy:(id)a3 force:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setAppLibrary:(id)a3;
@end

@implementation FBSApplicationPlaceholder

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [NSString stringWithFormat:@"this initializer is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSApplicationPlaceholder.m";
    __int16 v21 = 1024;
    int v22 = 46;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithBundleProxy:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [NSString stringWithFormat:@"this initializer is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSApplicationPlaceholder.m";
    __int16 v21 = 1024;
    int v22 = 51;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithApplicationProxy:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    __int16 v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxy"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholder _initWithApplicationProxy:identity:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  v9 = v8;
  if (!v8)
  {
    int v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholder _initWithApplicationProxy:identity:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }
  v23.receiver = self;
  v23.super_class = (Class)FBSApplicationPlaceholder;
  v10 = [(FBSBundleInfo *)&v23 _initWithBundleProxy:v7 overrideURL:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 8, a3);
    objc_storeStrong(v11 + 14, a4);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = v11[12];
    v11[12] = v12;

    uint64_t v14 = +[FBSApplicationPlaceholder _sharedQueue];
    id v15 = v11[9];
    v11[9] = (id)v14;

    uint64_t v16 = +[FBSApplicationPlaceholder _callOutQueue];
    id v17 = v11[10];
    v11[10] = (id)v16;

    v18 = [[FBSApplicationPlaceholderProgress alloc] initWithPlaceholder:v11 queue:v11[9]];
    id v19 = v11[11];
    v11[11] = v18;

    v11[13] = (id)[v7 installType];
    [v11 _setProxy:v7 force:1];
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__3;
  int v22 = __Block_byref_object_dispose__3;
  objc_super v23 = self->_queue;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__3;
  v16[4] = __Block_byref_object_dispose__3;
  id v17 = self->_callOutQueue;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__3;
  v14[4] = __Block_byref_object_dispose__3;
  id v15 = self->_proxy;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = self->_queue_progress;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__3;
  v6[4] = __Block_byref_object_dispose__3;
  id v7 = self->_queue_observers;
  [(id)v9[5] invalidate];
  v3 = v19[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FBSApplicationPlaceholder_dealloc__block_invoke;
  block[3] = &unk_1E58F5788;
  block[4] = &v8;
  block[5] = v14;
  block[6] = v6;
  block[7] = v16;
  block[8] = &v18;
  dispatch_async(v3, block);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationPlaceholder;
  [(FBSApplicationPlaceholder *)&v4 dealloc];
}

void __36__FBSApplicationPlaceholder_dealloc__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (FBSApplicationPlaceholderProgress)progress
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__FBSApplicationPlaceholder_progress__block_invoke;
  v5[3] = &unk_1E58F5230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBSApplicationPlaceholderProgress *)v3;
}

void __37__FBSApplicationPlaceholder_progress__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) queue_isValid])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
    id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v3, v2);
  }
}

- (BOOL)isPrioritizable
{
  return [(FBSApplicationPlaceholder *)self _canPerformAction:1];
}

- (BOOL)isPausable
{
  return [(FBSApplicationPlaceholder *)self _canPerformAction:2];
}

- (BOOL)isResumable
{
  return [(FBSApplicationPlaceholder *)self _canPerformAction:4];
}

- (BOOL)isCancellable
{
  return [(FBSApplicationPlaceholder *)self _canPerformAction:8];
}

- (BOOL)prioritizeWithResult:(id)a3
{
  return [(FBSApplicationPlaceholder *)self _performAction:1 withResult:a3];
}

- (BOOL)pauseWithResult:(id)a3
{
  return [(FBSApplicationPlaceholder *)self _performAction:2 withResult:a3];
}

- (BOOL)resumeWithResult:(id)a3
{
  return [(FBSApplicationPlaceholder *)self _performAction:4 withResult:a3];
}

- (BOOL)cancelWithResult:(id)a3
{
  return [(FBSApplicationPlaceholder *)self _performAction:8 withResult:a3];
}

- (BOOL)isRestricted
{
  return 0;
}

- (double)percentComplete
{
  uint64_t v2 = [(FBSApplicationPlaceholder *)self progress];
  [v2 percentComplete];
  double v4 = v3;

  return v4;
}

- (BOOL)prioritize
{
  return [(FBSApplicationPlaceholder *)self _performAction:1 withResult:0];
}

- (BOOL)cancel
{
  return [(FBSApplicationPlaceholder *)self _performAction:8 withResult:0];
}

- (BOOL)pause
{
  return [(FBSApplicationPlaceholder *)self _performAction:2 withResult:0];
}

- (BOOL)resume
{
  return [(FBSApplicationPlaceholder *)self _performAction:4 withResult:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__FBSApplicationPlaceholder_addObserver___block_invoke;
    v7[3] = &unk_1E58F4AB0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __41__FBSApplicationPlaceholder_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__FBSApplicationPlaceholder_removeObserver___block_invoke;
    v7[3] = &unk_1E58F4AB0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __44__FBSApplicationPlaceholder_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)_dispatchToObserversWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    callOutQueue = self->_callOutQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke;
    v7[3] = &unk_1E58F57B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(callOutQueue, v7);
  }
}

void __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke_2;
  block[3] = &unk_1E58F5540;
  block[4] = v2;
  block[5] = &v13;
  dispatch_sync(v3, block);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_sendToObserversPlaceholderProgressDidUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __73__FBSApplicationPlaceholder__sendToObserversPlaceholderProgressDidUpdate__block_invoke;
  v2[3] = &unk_1E58F57D8;
  v2[4] = self;
  [(FBSApplicationPlaceholder *)self _dispatchToObserversWithBlock:v2];
}

void __73__FBSApplicationPlaceholder__sendToObserversPlaceholderProgressDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 placeholderProgressDidUpdate:*(void *)(a1 + 32)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 placeholderPercentCompleteDidChange:*(void *)(a1 + 32)];
  }
}

- (void)_sendToObserversPlaceholderDidChangeSignificantly
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__FBSApplicationPlaceholder__sendToObserversPlaceholderDidChangeSignificantly__block_invoke;
  v2[3] = &unk_1E58F57D8;
  v2[4] = self;
  [(FBSApplicationPlaceholder *)self _dispatchToObserversWithBlock:v2];
}

void __78__FBSApplicationPlaceholder__sendToObserversPlaceholderDidChangeSignificantly__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 placeholderDidChangeSignificantly:*(void *)(a1 + 32)];
  }
}

- (BOOL)_queue_isCloudDemoted
{
  return (unint64_t)([(LSApplicationProxy *)self->_proxy installType] - 7) < 3;
}

- (unint64_t)_queue_supportedActions
{
}

- (BOOL)_queue_canPerformAction:(unint64_t)a3
{
}

- (BOOL)_canPerformAction:(unint64_t)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  queue = self->_queue;
  char v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSApplicationPlaceholder__canPerformAction___block_invoke;
  block[3] = &unk_1E58F5800;
  block[4] = self;
  block[5] = &v7;
  void block[6] = a3;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__FBSApplicationPlaceholder__canPerformAction___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queue_canPerformAction:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_performAction:(unint64_t)a3 withResult:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1)
  {
    objc_super v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSBitmaskCount(action) == 1"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholder _performAction:withResult:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }
  long long v8 = v6;
  uint64_t v9 = [(FBSBundleInfo *)self bundleIdentifier];
  if (a3 > 8) {
    char v10 = @"(unknown)";
  }
  else {
    char v10 = off_1E58F58C0[a3];
  }
  long long v11 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    __int16 v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "Received request to perform action \"%{public}@\" on %{public}@", buf, 0x16u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke;
  v26[3] = &unk_1E58F5850;
  v27 = v10;
  id v12 = v9;
  v29 = self;
  id v30 = v8;
  id v28 = v12;
  id v13 = v8;
  uint64_t v14 = [off_1E58F44E0 sentinelWithCompletion:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2_70;
  v24[3] = &unk_1E58F5128;
  id v15 = v14;
  id v25 = v15;
  uint64_t v16 = (void *)MEMORY[0x19F3991F0](v24);
  if ([(FBSApplicationPlaceholder *)self _canPerformAction:a3])
  {
    switch(a3)
    {
      case 1uLL:
        [(FBSApplicationPlaceholder *)self _prioritizeWithResult:v16];
        break;
      case 2uLL:
        [(FBSApplicationPlaceholder *)self _pauseWithResult:v16];
        break;
      case 4uLL:
        [(FBSApplicationPlaceholder *)self _resumeWithResult:v16];
        break;
      case 8uLL:
        id v19 = [(FBSApplicationPlaceholder *)self progress];

        if (v19)
        {
          [(FBSApplicationPlaceholder *)self _cancelWithResult:v16];
        }
        else
        {
          uint64_t v20 = [(FBSApplicationPlaceholder *)self appLibrary];
          __int16 v21 = v20;
          if (v20) {
            [v20 uninstallApplication:v12 withOptions:0 completion:v16];
          }
          else {
            [v15 signalWithContext:@"The placeholder's FBSApplicationLibrary has deallocated"];
          }
        }
        break;
      default:
        id v17 = @"This action is undefined";
        goto LABEL_11;
    }
    BOOL v18 = 1;
  }
  else
  {
    id v17 = @"This action is not currently supported";
LABEL_11:
    [v15 signalWithContext:v17];
    BOOL v18 = 0;
  }

  return v18;
}

void __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 context];
  if (v4 || [v3 isFailed])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2;
    v19[3] = &unk_1E58F5828;
    uint64_t v20 = v3;
    id v21 = *(id *)(a1 + 32);
    id v22 = v4;
    id v6 = [v5 bs_errorWithDomain:@"FBSApplicationPlaceholder" code:1 configuration:v19];
    uint8x8_t v7 = FBSLogApplicationPlaceholder();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [v6 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v15;
      _os_log_error_impl(&dword_19C680000, v7, OS_LOG_TYPE_ERROR, "%{public}@ on %{public}@ failed: %{public}@", buf, 0x20u);
    }
    long long v8 = v20;
  }
  else
  {
    long long v8 = FBSLogApplicationPlaceholder();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      uint64_t v26 = v12;
      _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ on %{public}@ succeeded!", buf, 0x16u);
    }
    id v6 = 0;
  }

  uint64_t v9 = *(void **)(a1 + 56);
  if (v9)
  {
    char v10 = *(NSObject **)(*(void *)(a1 + 48) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_68;
    block[3] = &unk_1E58F5450;
    id v18 = v9;
    id v17 = v6;
    dispatch_async(v10, block);
  }
}

void __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 setFailureDescription:@"Unable to perform placeholder action"];
  if ([*(id *)(a1 + 32) isFailed])
  {
    [v14 setFailureReason:@"The completion block was dropped before being called"];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) context];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7) {
      [v14 setFailureReason:@"%@", v7];
    }
    else {
      [v14 setFailureReason:@"The operation returned an error" withError:v13];
    }
  }
  [v14 setUserInfoValue:*(void *)(a1 + 40) forKey:@"FBSPlaceholderAction"];
  long long v8 = *(void **)(a1 + 48);
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  [v14 setUnderlyingError:v12];
}

uint64_t __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2_70(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) signalWithContext:a2];
}

- (void)_prioritizeWithResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FBSBundleInfo *)self bundleIdentifier];
  id v6 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to prioritize %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    id v7 = (void *)MEMORY[0x1E4F78060];
    long long v8 = [NSString stringWithFormat:@"Requesting to prioritize placeholder."];
    [v7 logStep:4 byParty:11 phase:3 success:1 forBundleID:v5 description:v8];
  }
  id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    id v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__FBSApplicationPlaceholder__prioritizeWithResult___block_invoke;
    v11[3] = &unk_1E58F5878;
    id v12 = v4;
    [v10 prioritizeCoordinatorForAppWithBundleID:v5 completion:v11];
  }
  else
  {
    (*((void (**)(id, __CFString *))v4 + 2))(v4, @"The IXAppInstallCoordinator class does not exist");
  }
}

uint64_t __51__FBSApplicationPlaceholder__prioritizeWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cancelWithResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FBSBundleInfo *)self bundleIdentifier];
  id v6 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v23 = v5;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to cancel %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    id v7 = (void *)MEMORY[0x1E4F78060];
    long long v8 = [NSString stringWithFormat:@"Requesting to cancel placeholder."];
    [v7 logStep:5 byParty:11 phase:3 success:1 forBundleID:v5 description:v8];
  }
  uint64_t v9 = NSString;
  id v10 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v11 = [v10 processName];
  id v12 = [v9 stringWithFormat:@"%@ requested cancellation via FBSApplicationPlaceholder", v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28568];
  id v21 = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  uint64_t v15 = [v13 errorWithDomain:@"com.apple.frontboard.app-library" code:1 userInfo:v14];

  id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    id v17 = IXAppInstallCoordinatorClass;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__FBSApplicationPlaceholder__cancelWithResult___block_invoke;
    v18[3] = &unk_1E58F5878;
    id v19 = v4;
    [v17 cancelCoordinatorForAppWithBundleID:v5 withReason:v15 client:8 completion:v18];
  }
  else
  {
    (*((void (**)(id, __CFString *))v4 + 2))(v4, @"The IXAppInstallCoordinator class does not exist");
  }
}

uint64_t __47__FBSApplicationPlaceholder__cancelWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pauseWithResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FBSBundleInfo *)self bundleIdentifier];
  id v6 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to pause %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    id v7 = (void *)MEMORY[0x1E4F78060];
    long long v8 = [NSString stringWithFormat:@"Requesting to pause placeholder."];
    [v7 logStep:6 byParty:11 phase:3 success:1 forBundleID:v5 description:v8];
  }
  id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    id v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__FBSApplicationPlaceholder__pauseWithResult___block_invoke;
    v11[3] = &unk_1E58F5878;
    id v12 = v4;
    [v10 pauseCoordinatorForAppWithBundleID:v5 completion:v11];
  }
  else
  {
    (*((void (**)(id, __CFString *))v4 + 2))(v4, @"The IXAppInstallCoordinator class does not exist");
  }
}

uint64_t __46__FBSApplicationPlaceholder__pauseWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resumeWithResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FBSBundleInfo *)self bundleIdentifier];
  id v6 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to resume %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    id v7 = (void *)MEMORY[0x1E4F78060];
    long long v8 = [NSString stringWithFormat:@"Requesting to resume placeholder."];
    [v7 logStep:7 byParty:11 phase:3 success:1 forBundleID:v5 description:v8];
  }
  id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    id v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__FBSApplicationPlaceholder__resumeWithResult___block_invoke;
    v11[3] = &unk_1E58F5878;
    id v12 = v4;
    [v10 resumeCoordinatorForAppWithBundleID:v5 completion:v11];
  }
  else
  {
    (*((void (**)(id, __CFString *))v4 + 2))(v4, @"The IXAppInstallCoordinator class does not exist");
  }
}

uint64_t __47__FBSApplicationPlaceholder__resumeWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)_sharedQueue___SharedQueue;

  return v2;
}

void __41__FBSApplicationPlaceholder__sharedQueue__block_invoke()
{
}

+ (id)_callOutQueue
{
  if (_callOutQueue_onceToken != -1) {
    dispatch_once(&_callOutQueue_onceToken, &__block_literal_global_110);
  }
  uint64_t v2 = (void *)_callOutQueue___CallOutQueue;

  return v2;
}

void __42__FBSApplicationPlaceholder__callOutQueue__block_invoke()
{
}

- (LSApplicationProxy)_proxy
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FBSApplicationPlaceholder__proxy__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (LSApplicationProxy *)v3;
}

void __35__FBSApplicationPlaceholder__proxy__block_invoke(uint64_t a1)
{
}

- (void)_setProxy:(id)a3
{
}

- (void)_setProxy:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FBSApplicationPlaceholder__setProxy_force___block_invoke;
  block[3] = &unk_1E58F58A0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __45__FBSApplicationPlaceholder__setProxy_force___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_setProxy:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_queue_setProxy:(id)a3 force:(BOOL)a4
{
  id v7 = (LSApplicationProxy *)a3;
  [(FBSApplicationPlaceholderProgress *)self->_queue_progress queue_isValid];
  id v8 = [(LSApplicationProxy *)v7 installProgress];

  if (!a4 && self->_proxy == v7) {
    BSEqualBools();
  }
  uint64_t v9 = FBSLogApplicationPlaceholder();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FBSApplicationPlaceholder _queue_setProxy:force:](self, v9);
  }

  if (a4 || self->_proxy != v7)
  {
    [(FBSApplicationPlaceholder *)self _reloadFromProxy:v7];
    id v10 = [(LSApplicationProxy *)v7 fbs_correspondingApplicationRecord];
    [(FBSApplicationPlaceholder *)self _reloadFromRecord:v10];

    if (self->_proxy != v7) {
      objc_storeStrong((id *)&self->_proxy, a3);
    }
  }
  if ([(FBSApplicationPlaceholder *)self _queue_isCloudDemoted])
  {
    if (![(FBSApplicationPlaceholderProgress *)self->_queue_progress queue_updateProxy:0]) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!v8)
  {
    BOOL v11 = FBSLogApplicationPlaceholder();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholder _queue_setProxy:force:](self, v11);
    }
  }
  if ([(FBSApplicationPlaceholderProgress *)self->_queue_progress queue_updateProxy:v7]) {
LABEL_18:
  }
    [(FBSApplicationPlaceholder *)self _queue_noteChangedSignificantly:self];
LABEL_19:
}

- (void)_reloadProgress
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__FBSApplicationPlaceholder__reloadProgress__block_invoke;
  block[3] = &unk_1E58F4B00;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__FBSApplicationPlaceholder__reloadProgress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_setProxy:force:*(*(void *)(*(void *)(a1 + 32) + 64), 1];
}

- (void)_noteChangedSignificantly
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationPlaceholder__noteChangedSignificantly__block_invoke;
  block[3] = &unk_1E58F4B00;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__FBSApplicationPlaceholder__noteChangedSignificantly__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_noteChangedSignificantly:0];
}

- (void)_queue_noteChangedSignificantly:(id)a3
{
  id v3 = a3;
  BSDispatchQueueAssert();
}

- (unint64_t)installType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__FBSApplicationPlaceholder_installType__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__FBSApplicationPlaceholder_installType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) installType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)installState
{
  uint64_t v2 = [(FBSApplicationPlaceholder *)self progress];
  unint64_t v3 = [v2 installState];

  return v3;
}

- (unint64_t)installPhase
{
  uint64_t v2 = [(FBSApplicationPlaceholder *)self progress];
  unint64_t v3 = [v2 installPhase];

  return v3;
}

- (unint64_t)expectedFinalInstallPhase
{
  uint64_t v2 = [(FBSApplicationPlaceholder *)self progress];
  unint64_t v3 = [v2 expectedFinalInstallPhase];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v9.receiver = self;
  v9.super_class = (Class)FBSApplicationPlaceholder;
  unint64_t v3 = [(FBSBundleInfo *)&v9 succinctDescriptionBuilder];
  id v4 = [(LSApplicationIdentity *)self->_applicationIdentity fbs_personaUniqueString];
  id v5 = (id)[v3 appendObject:v4 withName:@"persona" skipIfNil:1];

  uint64_t v6 = [NSString NSStringFromLSInstallType:self->_installType];
  id v7 = (id)[v3 appendObject:v6 withName:@"LSInstallType"];

  return v3;
}

- (LSApplicationIdentity)applicationIdentity
{
  return self->_applicationIdentity;
}

- (FBSApplicationLibrary)appLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appLibrary);

  return (FBSApplicationLibrary *)WeakRetained;
}

- (void)setAppLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appLibrary);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_progress, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

- (void)_initWithApplicationProxy:identity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithApplicationProxy:identity:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_canPerformAction:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_performAction:withResult:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_setProxy:(void *)a1 force:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "Non-demoted placeholder for %@ has no associated NSProgress!", (uint8_t *)&v4, 0xCu);
}

- (void)_queue_setProxy:(void *)a1 force:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a1 bundleIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_19C680000, a2, OS_LOG_TYPE_DEBUG, "Updating proxy for %@", (uint8_t *)&v4, 0xCu);
}

@end