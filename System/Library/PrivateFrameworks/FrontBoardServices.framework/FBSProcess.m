@interface FBSProcess
+ (id)currentProcess;
- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4;
- (BOOL)isRunning;
- (BSMachPortTaskNameRight)taskNameRight;
- (BSProcessHandle)handle;
- (FBSProcess)init;
- (NSString)description;
- (RBSProcessIdentity)identity;
- (id)_initForCurrentProcess;
- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4;
- (void)dealloc;
@end

@implementation FBSProcess

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1) {
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)currentProcess___CurrentProcess;

  return v2;
}

uint64_t __28__FBSProcess_currentProcess__block_invoke()
{
  id v0 = [[FBSProcess alloc] _initForCurrentProcess];
  uint64_t v1 = currentProcess___CurrentProcess;
  currentProcess___CurrentProcess = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_initForCurrentProcess
{
  v10.receiver = self;
  v10.super_class = (Class)FBSProcess;
  v2 = [(FBSProcess *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [off_1E58F4558 processHandle];
    handle = v2->_handle;
    v2->_handle = (BSProcessHandle *)v3;

    uint64_t v5 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
    identity = v2->_identity;
    v2->_identity = (RBSProcessIdentity *)v5;

    uint64_t v7 = [off_1E58F4518 taskNameForPID:-[BSProcessHandle pid](v2->_handle, "pid")];
    taskNameRight = v2->_taskNameRight;
    v2->_taskNameRight = (BSMachPortTaskNameRight *)v7;
  }
  return v2;
}

- (FBSProcess)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed on FBSProcess"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSProcess.m";
    __int16 v16 = 1024;
    int v17 = 70;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (void)dealloc
{
  [(BSMachPortTaskNameRight *)self->_taskNameRight invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FBSProcess;
  [(FBSProcess *)&v3 dealloc];
}

- (BOOL)isRunning
{
  return [(BSProcessHandle *)self->_handle isValid];
}

- (int)pid
{
  return [(BSProcessHandle *)self->_handle pid];
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4
{
  return 0;
}

- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5
{
  return 0;
}

- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4
{
  [(BSProcessHandle *)self->_handle pid];

  getpid();
}

- (NSString)description
{
  return (NSString *)[(FBSProcess *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSProcess *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [off_1E58F44F0 builderWithObject:self];
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = FBSProcessPrettyDescription(v4);
  [v3 appendString:v5 withName:0];

  id v6 = [v3 appendBool:-[FBSProcess isRunning](v4, "isRunning") withName:@"running"];
  objc_sync_exit(v4);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBSProcess *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (BSMachPortTaskNameRight)taskNameRight
{
  return self->_taskNameRight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskNameRight, 0);
  objc_storeStrong((id *)&self->_identity, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end