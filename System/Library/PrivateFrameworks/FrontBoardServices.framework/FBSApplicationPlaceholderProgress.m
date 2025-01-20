@interface FBSApplicationPlaceholderProgress
- (BOOL)_queue_updateFromProgress;
- (BOOL)queue_canPerformAction:(unint64_t)a3;
- (BOOL)queue_isCancellationAllowed;
- (BOOL)queue_isValid;
- (BOOL)queue_updateProxy:(id)a3;
- (FBSApplicationPlaceholder)placeholder;
- (FBSApplicationPlaceholderProgress)initWithPlaceholder:(id)a3 queue:(id)a4;
- (NSString)description;
- (double)percentComplete;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)state;
- (unint64_t)expectedFinalInstallPhase;
- (unint64_t)installPhase;
- (unint64_t)installState;
- (unint64_t)queue_supportedActions;
- (void)_startObservingProgress:(id)a3 withContext:(void *)a4;
- (void)_stopObservingProgress:(id)a3 withContext:(void *)a4;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)queue_isCancellationAllowed;
@end

@implementation FBSApplicationPlaceholderProgress

- (FBSApplicationPlaceholderProgress)initWithPlaceholder:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"placeholder"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholderProgress initWithPlaceholder:queue:](a2);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  v9 = v8;
  if (!v8)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSApplicationPlaceholderProgress initWithPlaceholder:queue:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  v10 = [(FBSApplicationPlaceholderProgress *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_placeholder, v7);
    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_invalidated = 0;
    v11->_percentComplete = -1.0;
    v11->_installPhase = 0x7FFFFFFFFFFFFFFFLL;
    v11->_installState = 0x7FFFFFFFFFFFFFFFLL;
    v11->_expectedFinalInstallPhase = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)&v11->_cancellationAllowed = xmmword_19C722C20;
  }

  return v11;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __44__FBSApplicationPlaceholderProgress_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (int64_t)state
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FBSApplicationPlaceholderProgress_state__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__FBSApplicationPlaceholderProgress_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (double)percentComplete
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__FBSApplicationPlaceholderProgress_percentComplete__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __52__FBSApplicationPlaceholderProgress_percentComplete__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 48);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)installState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationPlaceholderProgress_installState__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__FBSApplicationPlaceholderProgress_installState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64);
  return result;
}

- (unint64_t)installPhase
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationPlaceholderProgress_installPhase__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__FBSApplicationPlaceholderProgress_installPhase__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (unint64_t)expectedFinalInstallPhase
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__FBSApplicationPlaceholderProgress_expectedFinalInstallPhase__block_invoke;
  v5[3] = &unk_1E58F5540;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__FBSApplicationPlaceholderProgress_expectedFinalInstallPhase__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)invalidate
{
}

id __47__FBSApplicationPlaceholderProgress_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_updateProxy:0];
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 80);

  return objc_storeWeak(v2, 0);
}

- (NSString)description
{
  return (NSString *)[(FBSApplicationPlaceholderProgress *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(FBSApplicationPlaceholderProgress *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [off_1E58F44F0 builderWithObject:self];
  unint64_t v4 = [(FBSApplicationPlaceholderProgress *)self state];
  if (v4 > 6) {
    uint64_t v5 = @"(unknown)";
  }
  else {
    uint64_t v5 = (__CFString *)*((void *)&off_1E58F6B58 + v4);
  }
  id v6 = (id)[v3 appendObject:v5 withName:@"state"];
  [(FBSApplicationPlaceholderProgress *)self percentComplete];
  id v7 = [v3 appendDouble:@"percentComplete" withName:@"percentComplete" decimalPrecision:2];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(FBSApplicationPlaceholderProgress *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = [(FBSApplicationPlaceholderProgress *)self succinctDescriptionBuilder];
  uint64_t v5 = FBSStringForInstallState([(FBSApplicationPlaceholderProgress *)self installState]);
  id v6 = (id)[v4 appendObject:v5 withName:@"LSInstallState"];

  id v7 = FBSStringForInstallPhase([(FBSApplicationPlaceholderProgress *)self installPhase]);
  id v8 = (id)[v4 appendObject:v7 withName:@"LSInstallPhase"];

  return v4;
}

- (BOOL)_queue_updateFromProgress
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
}

- (BOOL)queue_isValid
{
  return self->_progress != 0;
}

- (BOOL)queue_updateProxy:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BSDispatchQueueAssert();
}

- (BOOL)queue_isCancellationAllowed
{
}

- (unint64_t)queue_supportedActions
{
}

- (BOOL)queue_canPerformAction:(unint64_t)a3
{
}

- (void)_startObservingProgress:(id)a3 withContext:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 addObserver:self forKeyPath:@"installPhase" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"installState" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"ls_expectedFinalInstallPhase" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"prioritizable" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"cancellable" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"cancelled" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"pausable" options:0 context:a4];
  [v6 addObserver:self forKeyPath:@"paused" options:0 context:a4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallState];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v21 + 1) + 8 * v11++) options:0 context:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallPhase];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v17 + 1) + 8 * v16++) options:0 context:a4];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_stopObservingProgress:(id)a3 withContext:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 removeObserver:self forKeyPath:@"installPhase" context:a4];
  [v6 removeObserver:self forKeyPath:@"installState" context:a4];
  [v6 removeObserver:self forKeyPath:@"ls_expectedFinalInstallPhase" context:a4];
  [v6 removeObserver:self forKeyPath:@"fractionCompleted" context:a4];
  [v6 removeObserver:self forKeyPath:@"prioritizable" context:a4];
  [v6 removeObserver:self forKeyPath:@"cancellable" context:a4];
  [v6 removeObserver:self forKeyPath:@"cancelled" context:a4];
  [v6 removeObserver:self forKeyPath:@"pausable" context:a4];
  [v6 removeObserver:self forKeyPath:@"paused" context:a4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallState];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 removeObserver:self forKeyPath:*(void *)(*((void *)&v21 + 1) + 8 * v11++) context:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = [MEMORY[0x1E4F28F90] keyPathsForValuesAffectingInstallPhase];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [v6 removeObserver:self forKeyPath:*(void *)(*((void *)&v17 + 1) + 8 * v16++) context:a4];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  uint64_t v11 = v10;
  if (&self->_placeholder == a6)
  {
    id v12 = v10;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__FBSApplicationPlaceholderProgress_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E58F4AB0;
    id v16 = v12;
    long long v17 = self;
    dispatch_async(queue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)FBSApplicationPlaceholderProgress;
    [(FBSApplicationPlaceholderProgress *)&v14 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

uint64_t __84__FBSApplicationPlaceholderProgress_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 16)) {
    BSAtomicGetFlag();
  }
  return result;
}

- (FBSApplicationPlaceholder)placeholder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeholder);

  return (FBSApplicationPlaceholder *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeholder);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithPlaceholder:(const char *)a1 queue:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPlaceholder:(const char *)a1 queue:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)queue_isCancellationAllowed
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 bundleIdentifier];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "Unable to determine removability for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end