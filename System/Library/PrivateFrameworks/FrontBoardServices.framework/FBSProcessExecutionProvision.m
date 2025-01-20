@interface FBSProcessExecutionProvision
- (BOOL)isMonitoring;
- (BOOL)isResourceProvision;
- (BOOL)isViolated;
- (FBSProcessExecutionProvision)init;
- (FBSProcessExecutionProvisionDelegate)delegate;
- (FBSProcessInternal)process;
- (NSError)error;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_noteViolatedWithError:(id)a3;
- (void)_performDelegateCallout:(id)a3;
- (void)monitorProcess:(id)a3;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)stopMonitoring;
- (void)updateProgress;
@end

@implementation FBSProcessExecutionProvision

- (NSString)description
{
  return (NSString *)[(FBSProcessExecutionProvision *)self descriptionWithMultilinePrefix:0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_delegateCalloutQueue, 0);

  objc_destroyWeak((id *)&self->_process);
}

- (void)prepareForReuse
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activated)
  {
    [(FBSProcessExecutionProvision *)obj _prepareForReuse];
    error = obj->_error;
    obj->_error = 0;

    obj->_activated = 0;
    *(_WORD *)&obj->_monitoring = 0;
    objc_storeWeak((id *)&obj->_process, 0);
    objc_storeWeak((id *)&obj->_delegate, 0);
  }
  objc_sync_exit(obj);
}

- (void)setDelegate:(id)a3
{
}

- (void)stopMonitoring
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_monitoring)
  {
    [(FBSProcessExecutionProvision *)obj _stopMonitoring];
    obj->_monitoring = 0;
  }
  objc_sync_exit(obj);
}

- (void)monitorProcess:(id)a3
{
  id obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_monitoring)
  {
    objc_storeWeak((id *)&v4->_process, obj);
    v4->_monitoring = 1;
    v4->_activated = 1;
    [(FBSProcessExecutionProvision *)v4 _beginMonitoring];
  }
  objc_sync_exit(v4);
}

- (FBSProcessInternal)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);

  return (FBSProcessInternal *)WeakRetained;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(FBSProcessExecutionProvision *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendBool:-[FBSProcessExecutionProvision isMonitoring](self, "isMonitoring") withName:@"monitoring" ifEqualTo:1];
  id v6 = (id)[v4 appendBool:-[FBSProcessExecutionProvision isViolated](self, "isViolated") withName:@"violated" ifEqualTo:1];

  return v4;
}

- (BOOL)isViolated
{
  return self->_violated;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSProcessExecutionProvision *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (FBSProcessExecutionProvision)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSProcessExecutionProvision;
  if ([(FBSProcessExecutionProvision *)&v3 init]) {
    BSDispatchQueueCreateWithQualityOfService();
  }
  return 0;
}

- (void)updateProgress
{
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_monitoring && !obj->_violated) {
    [(FBSProcessExecutionProvision *)obj _updateProgress];
  }
  objc_sync_exit(obj);
}

- (void)_noteViolatedWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__FBSProcessExecutionProvision__noteViolatedWithError___block_invoke;
  v6[3] = &unk_1E58F4AB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FBSProcessExecutionProvision *)self _performDelegateCallout:v6];
}

void __55__FBSProcessExecutionProvision__noteViolatedWithError___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32) && !*(unsigned char *)(v3 + 33))
  {
    *(unsigned char *)(v3 + 33) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  }
  else
  {
    id WeakRetained = 0;
  }
  objc_sync_exit(v2);

  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained provision:*(void *)(a1 + 32) wasViolatedWithError:*(void *)(a1 + 40)];
    id v4 = WeakRetained;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[[objc_opt_class() allocWithZone:a3] init] autorelease];
  uint64_t v5 = [(NSError *)self->_error copy];
  id v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  objc_storeWeak((id *)(v4 + 8), WeakRetained);

  *(unsigned char *)(v4 + 33) = self->_violated;
  *(unsigned char *)(v4 + 16) = self->_activated;
  *(unsigned char *)(v4 + 32) = self->_monitoring;
  return (id)v4;
}

- (void)_performDelegateCallout:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSProcessExecutionProvision *)a2 _performDelegateCallout:(uint64_t)v8];
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  delegateCalloutQueue = self->_delegateCalloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__FBSProcessExecutionProvision__performDelegateCallout___block_invoke;
  block[3] = &unk_1E58F5040;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(delegateCalloutQueue, block);
}

uint64_t __56__FBSProcessExecutionProvision__performDelegateCallout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)succinctDescription
{
  id v2 = [(FBSProcessExecutionProvision *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (FBSProcessExecutionProvisionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBSProcessExecutionProvisionDelegate *)WeakRetained;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isResourceProvision
{
  return 0;
}

- (void)_performDelegateCallout:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSProcessExecutionProvision.m";
  __int16 v16 = 1024;
  int v17 = 140;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end