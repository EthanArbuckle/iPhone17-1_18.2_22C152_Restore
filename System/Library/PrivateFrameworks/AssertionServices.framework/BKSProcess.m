@interface BKSProcess
+ (double)backgroundTimeRemaining;
+ (id)busyExtensionInstances:(id)a3;
+ (id)currentProcess;
- (BKSProcess)init;
- (BKSProcess)initWithBundleIdentifier:(id)a3;
- (BKSProcess)initWithProcessIdentity:(id)a3;
- (BKSProcessExitContext)lastExitContext;
- (BOOL)_bootstrapWithError:(id *)a3;
- (BOOL)bootstrapWithProcessHandle:(id)a3 error:(id *)a4;
- (BOOL)nowPlayingWithAudio;
- (BOOL)recordingAudio;
- (BSProcessHandle)handle;
- (double)backgroundTimeRemaining;
- (id)description;
- (int64_t)terminationReason;
- (void)bootstrapCurrentProcess;
- (void)invalidate;
- (void)setNowPlayingWithAudio:(BOOL)a3;
- (void)setRecordingAudio:(BOOL)a3;
@end

@implementation BKSProcess

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1) {
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)currentProcess___currentProcess;
  return v2;
}

uint64_t __28__BKSProcess_currentProcess__block_invoke()
{
  v0 = [BKSProcess alloc];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  uint64_t v3 = [(BKSProcess *)v0 initWithBundleIdentifier:v2];
  v4 = (void *)currentProcess___currentProcess;
  currentProcess___currentProcess = v3;

  v5 = (void *)currentProcess___currentProcess;
  return [v5 bootstrapCurrentProcess];
}

- (void)bootstrapCurrentProcess
{
  uint64_t v3 = [MEMORY[0x1E4F4F800] processHandle];
  handle = self->_handle;
  self->_handle = v3;

  v5 = [MEMORY[0x1E4F963E8] currentProcess];
  processHandle = self->_processHandle;
  self->_processHandle = v5;

  self->_bootstrapped = 1;
}

- (BKSProcess)init
{
  return [(BKSProcess *)self initWithBundleIdentifier:0];
}

- (BKSProcess)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BKSProcess.m", 71, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 71, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 bundleIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    [MEMORY[0x1E4F96408] identityOfCurrentProcess];
  }
  else {
  v9 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v5 jobLabel:v5 auid:getuid() platform:6];
  }
  v10 = [(BKSProcess *)self initWithProcessIdentity:v9];

  return v10;
}

- (BKSProcess)initWithProcessIdentity:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Rbsprocessiden.isa);
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 82, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BKSProcess.m", 82, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:RBSProcessIdentityClass]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)BKSProcess;
  v6 = [(BKSProcess *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [v5 copy];
    identity = v7->_identity;
    v7->_identity = (RBSProcessIdentity *)v8;

    uint64_t v10 = [MEMORY[0x1E4F96418] monitor];
    monitor = v7->_monitor;
    v7->_monitor = (RBSProcessMonitor *)v10;
  }
  return v7;
}

- (BOOL)bootstrapWithProcessHandle:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (self->_handle)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BKSProcess.m", 96, @"Invalid parameter not satisfying: %@", @"_handle == nil" object file lineNumber description];
  }
  if (objc_opt_class())
  {
    id v9 = v8;
    NSClassFromString(&cfstr_Bsprocesshandl.isa);
    if (!v9)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 100, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"BKSProcess.m", 100, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:BSProcessHandleClass]" object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_handle, a3);
    BOOL v10 = [(BKSProcess *)self _bootstrapWithError:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = rbs_shim_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    processHandle = self->_processHandle;
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2114;
    v13 = processHandle;
    _os_log_impl(&dword_1B50B5000, v4, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] Invalidating BKSProcess for %{public}@", (uint8_t *)&v10, 0x16u);
  }

  [(RBSAssertion *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;

  [(BKSProcessAssertion *)self->_audioAssertion invalidate];
  audioAssertion = self->_audioAssertion;
  self->_audioAssertion = 0;

  [(BKSProcessAssertion *)self->_mediaAssertion invalidate];
  mediaAssertion = self->_mediaAssertion;
  self->_mediaAssertion = 0;

  [(RBSProcessMonitor *)self->_monitor invalidate];
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

+ (double)backgroundTimeRemaining
{
  v2 = [a1 currentProcess];
  [v2 backgroundTimeRemaining];
  double v4 = v3;

  double result = 1.79769313e308;
  if (v4 != *MEMORY[0x1E4F964B8]) {
    return v4;
  }
  return result;
}

- (double)backgroundTimeRemaining
{
  v2 = [(RBSProcessHandle *)self->_processHandle activeLimitations];
  [v2 runTime];
  double v4 = v3;

  double result = 1.79769313e308;
  if (v4 != *MEMORY[0x1E4F964B8]) {
    return v4;
  }
  return result;
}

- (BKSProcessExitContext)lastExitContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = self->_lastExitContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNowPlayingWithAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_nowPlayingWithAudio != v3)
  {
    self->_nowPlayingWithAudio = v3;
    v6 = rbs_shim_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = processHandle;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1B50B5000, v6, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ now playing with audio: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_nowPlayingWithAudio)
    {
      id v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]([BKSProcessAssertion alloc], "initWithPID:flags:reason:name:", -[RBSProcessHandle pid](self->_processHandle, "pid"), 13, 1, @"-[BKSProcess setNowPlayingWithAudio:YES]");
      audioAssertion = self->_audioAssertion;
      self->_audioAssertion = v8;

      [(BKSProcessAssertion *)self->_audioAssertion acquire];
    }
    else
    {
      [(BKSProcessAssertion *)self->_audioAssertion invalidate];
      int v10 = self->_audioAssertion;
      self->_audioAssertion = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setRecordingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_recordingAudio != v3)
  {
    self->_recordingAudio = v3;
    v6 = rbs_shim_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = processHandle;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1B50B5000, v6, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ now recording audio: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
    }

    if (self->_recordingAudio)
    {
      id v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]([BKSProcessAssertion alloc], "initWithPID:flags:reason:name:", -[RBSProcessHandle pid](self->_processHandle, "pid"), 13, 23, @"-[BKSProcess setRecordingAudio:YES]");
      mediaAssertion = self->_mediaAssertion;
      self->_mediaAssertion = v8;

      [(BKSProcessAssertion *)self->_mediaAssertion acquire];
    }
    else
    {
      [(BKSProcessAssertion *)self->_mediaAssertion invalidate];
      int v10 = self->_mediaAssertion;
      self->_mediaAssertion = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

+ (id)busyExtensionInstances:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [MEMORY[0x1E4F96340] sharedInstance];
  id v20 = 0;
  v6 = [v5 busyExtensionInstancesFromSet:v3 error:&v20];
  id v7 = v20;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v21 = @"ExtensionBundleID";
        uint64_t v22 = v13;
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, (void)v16);
        [v4 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v10);
  }

  return v4;
}

- (BOOL)_bootstrapWithError:(id *)a3
{
  v72[5] = *MEMORY[0x1E4F143B8];
  if (!self->_identity)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"BKSProcess.m" lineNumber:205 description:@"cannot bootstrap without an identity"];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_bootstrapped = 1;
  v6 = [MEMORY[0x1E4F963B8] grant];
  v72[0] = v6;
  id v7 = [MEMORY[0x1E4F96368] invalidateAfterInterval:1.0];
  v72[1] = v7;
  id v8 = [MEMORY[0x1E4F96390] grantWithBackgroundPriority];
  v72[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F96338] grant];
  v72[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F96460] grantWithResistance:30];
  v72[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:5];

  handle = self->_handle;
  if (handle)
  {
    uint64_t v13 = [(BSProcessHandle *)handle pid];
    uint64_t v14 = (void *)MEMORY[0x1E4F963E8];
    __int16 v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v13];
    id v62 = 0;
    id v16 = [v14 handleForIdentifier:v15 error:&v62];
    id v17 = v62;

    if (v16)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F96318]);
      long long v19 = (void *)MEMORY[0x1E4F96478];
      id v20 = [MEMORY[0x1E4F28ED0] numberWithInt:v13];
      v21 = [v19 targetWithProcessIdentifier:v20];
      id v22 = (id)[v18 initWithExplanation:@"BKSProcessLaunch" target:v21 attributes:v11];

      [v22 acquireWithError:0];
LABEL_7:
      v26 = rbs_shim_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(RBSProcessIdentity *)self->_identity shortDescription];
        *(_DWORD *)buf = 134218498;
        v67 = self;
        __int16 v68 = 2114;
        id v69 = v16;
        __int16 v70 = 2114;
        id v71 = v27;
        _os_log_impl(&dword_1B50B5000, v26, OS_LOG_TYPE_DEFAULT, "[BKSProcess:%p] %{public}@ bootstrapped successfully as %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_processHandle, v16);
      objc_storeStrong((id *)&self->_assertion, v22);
      if (!self->_handle)
      {
        v28 = [v16 legacyHandle];
        v29 = self->_handle;
        self->_handle = v28;
      }
      if (self->_assertion)
      {
        dispatch_time_t v30 = dispatch_time(0, 1000000000);
        v31 = [MEMORY[0x1E4F964A0] sharedBackgroundWorkloop];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34__BKSProcess__bootstrapWithError___block_invoke;
        block[3] = &unk_1E60C6528;
        block[4] = self;
        dispatch_after(v30, v31, block);
      }
      BOOL v32 = 1;
      goto LABEL_31;
    }
    v53 = a3;
    id v22 = 0;
  }
  else
  {
    v53 = a3;
    id v23 = objc_alloc_init(MEMORY[0x1E4F96398]);
    [v23 setIdentity:self->_identity];
    [v23 setExplanation:@"BKSProcessLaunch"];
    [v23 setAttributes:v11];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F963A0]) initWithContext:v23];
    id v60 = 0;
    id v61 = 0;
    id v59 = 0;
    int v25 = [v24 execute:&v61 assertion:&v60 error:&v59];
    id v16 = v61;
    id v22 = v60;
    id v17 = v59;

    if (v25) {
      goto LABEL_7;
    }
  }
  id v51 = v22;
  v52 = v11;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v33 = [v17 underlyingErrors];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (!v34) {
    goto LABEL_26;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v55;
  uint64_t v37 = *MEMORY[0x1E4F28798];
  do
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      if (*(void *)v55 != v36) {
        objc_enumerationMutation(v33);
      }
      v39 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      lastExitContext = [v39 domain];
      if ([lastExitContext isEqual:v37])
      {
        uint64_t v41 = [v39 code];

        if (v41 != 80) {
          continue;
        }
        v42 = objc_alloc_init(BKSProcessExitContext);
        -[BKSProcessExitContext setExitReason:]((uint64_t)v42, 16);
        lastExitContext = self->_lastExitContext;
        self->_lastExitContext = v42;
      }
    }
    uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
  }
  while (v35);
LABEL_26:

  v43 = rbs_shim_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v48 = [(RBSProcessIdentity *)self->_identity shortDescription];
    *(_DWORD *)buf = 134218498;
    v67 = self;
    __int16 v68 = 2114;
    id v69 = v48;
    __int16 v70 = 2114;
    id v71 = v17;
    _os_log_error_impl(&dword_1B50B5000, v43, OS_LOG_TYPE_ERROR, "[BKSProcess:%p] Bootstrap failed for %{public}@ with error: <%{public}@>", buf, 0x20u);
  }
  uint64_t v11 = v52;
  p_lock = &self->_lock;
  if (v53)
  {
    v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28A50];
    v63[0] = *MEMORY[0x1E4F28588];
    v63[1] = v45;
    v64[0] = @"Bootstrap failed";
    v64[1] = v17;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    id *v53 = [v44 errorWithDomain:@"BKSProcessErrorDomain" code:1 userInfo:v46];
  }
  BOOL v32 = 0;
  id v22 = v51;
LABEL_31:
  os_unfair_lock_unlock(p_lock);

  return v32;
}

void __34__BKSProcess__bootstrapWithError___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  double v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v4);
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [NSString alloc];
  id v5 = [(id)objc_opt_class() description];
  v6 = [(RBSProcessIdentity *)self->_identity shortDescription];
  id v7 = (void *)[v4 initWithFormat:@"<%@| %@>", v5, v6];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (int64_t)terminationReason
{
  return self->_terminationReason;
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

- (BOOL)nowPlayingWithAudio
{
  return self->_nowPlayingWithAudio;
}

- (BOOL)recordingAudio
{
  return self->_recordingAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_audioAssertion, 0);
  objc_storeStrong((id *)&self->_mediaAssertion, 0);
  objc_storeStrong((id *)&self->_lastExitContext, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end